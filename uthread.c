#include "uthread.h"
#include "types.h"
#include "user.h"
#include "x86.h"

#define UTHREAD_QUANTA 5
#define UTHREAD_STACK_SIZE 4096
int total_threads_running;
int currently_running; // the id of the currently running thread
int index_currently_running;
int id_number_thread; // save the next id for the next thread.
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
}

int bsem_alloc() {
  alarm(0);
  int i;
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}

void bsem_free(int id) {
  alarm(0);
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
        return;
      }
      else
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
  alarm(0);
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
      if (binSemaphore[i].sleep[j] == -1){
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;

	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
}

void bsem_up(int id) {
  alarm(0);
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
    {
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
			  //break;
			  goto cont;
            }
          }
        }
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);

}

void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
}

int
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
    threads[i].state = UNUSED_THREAD;
    threads[i].ebp = 0;
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
  return 0;
}

int
uthread_create(void (*start_func)(void *), void*arg)
{
  alarm(0);
  printf(1, "------ creating a new thread ------\n");
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
  {
    if(threads[i].state == UNUSED_THREAD)
    {
      free_thread = i;
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
      threads[i].join = -1;
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    i=i%MAX_UTHREADS;
      if(threads[i].state != UNUSED_THREAD)
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}

void
uthread_exit()
{
  alarm(0); // stopping the alarm until we finish exiting
  printf(1,"exiting...\n");
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
  {
    threads[0].state = UNUSED_THREAD;
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
  threads[index_currently_running].state = UNUSED_THREAD;
  threads[index_currently_running].thread_id = -1;
  threads[index_currently_running].ebp = 0;
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
}

int
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
      found_tid = i;
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}

int
uthread_sleep(int ticks)
{
  alarm(0);
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
  threads[index_currently_running].state = SLEEPING_THREAD;
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
  return 0;
}
// #endif
