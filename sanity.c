#include "types.h"
#include "user.h"
#include "stat.h"
#include "csem.h"

/*void tthread1(void *csem) {
  int i;
  csem_down((struct counting_semaphore *) csem);
  for(i = 0; i < 400; i++) {
    printf(1, " 11111111111111111111111111111111111111111111111111111 %d \n",i);
  }
  csem_up((struct counting_semaphore *) csem);
}

void tthread2(void *csem) {
  int i;
  csem_down((struct counting_semaphore *) csem);
  for(i = 0; i < 500; i++) {
    printf(1, " 2222222222222222222222222222222222222222222222222222 %d \n",i);
  }
  csem_up((struct counting_semaphore *) csem);
}

void tthread3(void *csem) {
  int i;
  csem_down((struct counting_semaphore *) csem);
  for(i = 0; i < 600; i++) {
    printf(1, " 3333333333333333333333333333333333333333333333333333 %d \n",i);
  }
  csem_up((struct counting_semaphore *) csem);
}

int main(int argc, char *argv[]) {
	printf(1,"-=-=-=-=-=-=-=-=-=-=-TEXT USER LEVEL THREAD-=-=-=-=-=-=-=-=-=-=-\n");
	uthread_init();
  struct counting_semaphore csem;
  csem_alloc(&csem, 2);
	uthread_create(tthread1,(void *)&csem);
	uthread_create(tthread2,(void *)&csem);
	uthread_create(tthread3,(void *)&csem);

	while(1);
  csem_free(&csem);
	exit();
}*/
#define N 100
struct counting_semaphore mutax;
struct counting_semaphore empty;
struct counting_semaphore full;

int out = 0;
int queue[N];

void producer(void* arg)
{
  int item = 0;
  while (item < 1000)
  {
    item += 1; // producing an item
    csem_down(&empty);
    csem_down(&mutax);
    if(queue[(item-1)%100] != 0)
    {
      for(int i = 0 ; i<N ; i++){
  		printf(1," %d ," , queue[i]);
  	}
        printf(1, "item: %d  out : %d error! i am trying to ovride value : %d\n",item,out, queue[(item-1)%100]);
        return;
    }
    queue[(item-1)%100] = item;
    csem_up(&mutax);
    csem_up(&full);
  }
}

void consumer(void *arg)
{
  int item = 0;
  while (out < 1000)
  {
    csem_down(&full);
    csem_down(&mutax);
    item = queue[out%100];
    queue[out%100] = 0;
    if(out <= 1000)
    {
        out++;
    }
    csem_up(&mutax);
    csem_up(&empty);
    uthread_sleep(item);
    printf(1, "Thread %d slept for %d ticks.\n",uthread_self(), item);

  }
}

int main(int argc, char *argv[]) {
  // initializing the array
  for(int i = 0 ; i < N ; i++)
  {
    queue[i] = 0;
  }
  uthread_init();
  csem_alloc(&mutax, 1);
  csem_alloc(&empty, N);
  csem_alloc(&full, 0);
  int produce = uthread_create(producer, (void*)2048);
  int consumer_1 = uthread_create(consumer, (void*)2048);
  int consumer_2 = uthread_create(consumer, (void*)2048);
  int consumer_3 = uthread_create(consumer, (void*)2048);

  uthread_join(consumer_1);
  uthread_join(consumer_2);
  uthread_join(consumer_3);
  uthread_join(produce);

  free(&mutax);
  free(&empty);
  free(&full);
	exit();
}
