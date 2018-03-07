#include "types.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "x86.h"
#include "proc.h"
#include "traps.h"
#include "spinlock.h"

// Interrupt descriptor table (shared by all CPUs).
struct gatedesc idt[256];
extern uint vectors[];  // in vectors.S: array of 256 entry pointers
void defult_sig_handler(int number, int pid);
struct spinlock tickslock;
uint ticks;

void sys_call_sigreturn(void)
{
	__asm__ volatile ("movl $24, %%eax;"
					  "int $64;"
					  :
					  :
					  : "%eax"
					  );
}

int
check_signal(struct trapframe *tf)
{
  //check if proc is not null and in user space
    if((proc == 0) || (tf->cs&3) != DPL_USER)
      return 0;
      int sigNum=-1;

    for (int i=0;i<NUMSIG;i++){
      //if we found pending signal
        if (proc->pending[i]==1){
        sigNum=i;
        proc->pending[i] = 0;
        break;
      }
    }
    if (sigNum == -1){
      //cprintf("no pending signals for pid %d \n",proc->pid);
      return 0;
    }
    //if we got this far there is a pending signals
    //check if its default handler
    if ((uint)proc->pending_handler[sigNum] == (uint)defult_sig_handler){
      defult_sig_handler(sigNum,proc->pid);
      return 0;
    }
    //handler is not default
		uint temp_esp = proc->tf->esp;
		//calculate size of sys_call_sigreturn function size
    uint size_sys_call_sigreturn=(uint)check_signal-(uint)sys_call_sigreturn;
		//calculate the return adress for later
		uint return_adress = temp_esp - size_sys_call_sigreturn;
		//allocate space on proc stack for size_sys_call_sigreturn
    temp_esp-=size_sys_call_sigreturn;
		memmove((void*)temp_esp,sys_call_sigreturn,size_sys_call_sigreturn);
		// save the trapframe
		temp_esp -= sizeof(struct trapframe);
		memmove((void*)temp_esp,proc->tf,sizeof(struct trapframe));
		//make place in proc stack for number of signal
    temp_esp -= 4;
    *((int*)temp_esp) = sigNum;
		//make place in proc stack for sig handler pointer
    temp_esp -= 4;
    *((int*)temp_esp) = return_adress;
    //change eip of proc to exec handler function
    proc->tf->eip=(int)proc->pending_handler[sigNum];
		// now uptade the esp
		proc->tf->esp = temp_esp;
		return 0;
}

void
tvinit(void)
{
  int i;

  for(i = 0; i < 256; i++)
    SETGATE(idt[i], 0, SEG_KCODE<<3, vectors[i], 0);
  SETGATE(idt[T_SYSCALL], 1, SEG_KCODE<<3, vectors[T_SYSCALL], DPL_USER);

  initlock(&tickslock, "time");
}

void
idtinit(void)
{
  lidt(idt, sizeof(idt));
}

//PAGEBREAK: 41
void
trap(struct trapframe *tf)
{
  if(tf->trapno == T_SYSCALL){
    if(proc->killed)
      exit();
    proc->tf = tf;
    syscall();
    if(proc->killed)
      exit();
    return;
  }

  switch(tf->trapno){
  case T_IRQ0 + IRQ_TIMER:
    if(cpunum() == 0){
      acquire(&tickslock);
			ticks++;
			//Assignment 2 - adding code here - roee
			alarm_handeling();
			// finish
      wakeup(&ticks);
      release(&tickslock);
    }
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE:
    ideintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_IDE+1:
    // Bochs generates spurious IDE1 interrupts.
    break;
  case T_IRQ0 + IRQ_KBD:
    kbdintr();
    lapiceoi();
    break;
  case T_IRQ0 + IRQ_COM1:
    uartintr();
    lapiceoi();
    break;
  case T_IRQ0 + 7:
  case T_IRQ0 + IRQ_SPURIOUS:
    cprintf("cpu%d: spurious interrupt at %x:%x\n",
            cpunum(), tf->cs, tf->eip);
    lapiceoi();
    break;

  //PAGEBREAK: 13
  default:
    if(proc == 0 || (tf->cs&3) == 0){
      // In kernel, it must be our mistake.
      cprintf("unexpected trap %d from cpu %d eip %x (cr2=0x%x)\n",
              tf->trapno, cpunum(), tf->eip, rcr2());
      panic("trap");
    }
    // In user space, assume process misbehaved.
    cprintf("pid %d %s: trap %d err %d on cpu %d "
            "eip 0x%x addr 0x%x--kill proc\n",
            proc->pid, proc->name, tf->trapno, tf->err, cpunum(), tf->eip,
            rcr2());
    proc->killed = 1;
  }

  // Force process exit if it has been killed and is in user space.
  // (If it is still executing in the kernel, let it keep running
  // until it gets to the regular system call return.)
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();

  // Force process to give up CPU on clock tick.
  // If interrupts were on while locks held, would need to check nlock.
  if(proc && proc->state == RUNNING && tf->trapno == T_IRQ0+IRQ_TIMER)
    yield();

  // Check if the process has been killed since we yielded
  if(proc && proc->killed && (tf->cs&3) == DPL_USER)
    exit();
}
