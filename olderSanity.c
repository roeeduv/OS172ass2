/*#include "types.h"
#include "user.h"
#include "stat.h"
typedef void (*sighandler_t)(int);

void
test(int sigNum){
 printf(1,"\n=======================Signal Handler===================================\n Process id:  %d  Signal number: %d \n\n", getpid(),sigNum);
}


int
main(int argc, char *argv[]){
int j;
printf(1,"------------------TestEx1----------------- \n");
sighandler_t handler=(sighandler_t)test;
for(int i=0;i<32;i++){
 printf(1,"test  for1: i=%d\n",i);
 signal(i,handler);
}

for(int j=0;j<32;j++){
 sigsend(getpid(),j);
}
for(j=0; j<15; j++)
	  sleep(1);

alarm(3);
exit();
}*/

#include "types.h"
#include "user.h"
#include "stat.h"
#include "csem.h"


void tthread1(void *arg) {
  int i;
  for(i = 0; i < 150; i++) {
    printf(1, " 11111111111111111111111111111111111111111111111111111 %d \n",i);
  }
}

void tthread2(void *arg) {
  int i;
  for(i = 0; i < 150; i++) {
    printf(1, " 2222222222222222222222222222222222222222222222222222 %d \n",i);
  }
}

void tthread3(void *arg) {
  int i;
  for(i = 0; i < 150; i++) {
    printf(1, " 3333333333333333333333333333333333333333333333333333 %d \n",i);
  }
}

int main(int argc, char *argv[]) {
	printf(1,"-=-=-=-=-=-=-=-=-=-=-TEXT USER LEVEL THREAD-=-=-=-=-=-=-=-=-=-=-\n");
	uthread_init();
	uthread_create(tthread1, (void*)555);
	uthread_create(tthread2, (void*)555);
	uthread_create(tthread3, (void*)555);

	while(1);

	exit();
}
