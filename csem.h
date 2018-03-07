#include "uthread.h"
#include "types.h"
#include "user.h"
#include "x86.h"
#define UTHREAD_QUANTA 5
#define STACKSIZE 4096

struct counting_semaphore{
	int bsem_1_id;
	int bsem_2_id;
	int value;
};


void csem_alloc(struct counting_semaphore *csem, int value);
void csem_free(struct counting_semaphore *csem);
void csem_down(struct counting_semaphore *csem);
void csem_up(struct counting_semaphore *csem);
