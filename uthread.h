#define MAX_UTHREADS 64
#define  MAX_BSEM 128

enum thread_state { UNUSED_THREAD, SLEEPING_THREAD, RUNNABLE_THREAD, RUNNING_THREAD,BLOCKED_THREAD };
enum semaphore_state{USED,UNUSED};


struct binarySemaphore {
	int lock; //locked = 0, free = 1
	int id; //  descriptor
	int sleep[MAX_UTHREADS]; //thread that wait for lock - maybe need array of threads that wait? not sure
	enum semaphore_state state;
};

struct uthread{
  int thread_id;
  char *stack;
  enum thread_state state;
  int ebp; // this is our base pointer
  int esp; // this is our stack pointer
  int eip; //never used?
  int first_run; // is this the firs run of the process - 0 if it is , 1 if not
  // struct trapframe user_tf;
  int time_to_get_up;
  int join; //wait for pid
  };

struct uthread threads[MAX_UTHREADS];

/* function we need to implement*/
int uthread_init();
int uthread_create(void (*start_func)(void *), void*arg);
void uthread_schedule();
void uthread_exit();
int uthread_self();
int uthread_join(int tid);
int uthread_sleep(int ticks);

/* our function*/
void run_thread(void (*start_func)(void *), void*arg);
void contexSwitch(int prev_index,int next);

void init_bsem();
int bsem_alloc();
void bsem_free(int id);
void bsem_down(int id);
void bsem_up(int id);
