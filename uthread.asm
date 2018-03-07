
_uthread:     file format elf32-i386


Disassembly of section .text:

00000000 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
       5:	8b 75 0c             	mov    0xc(%ebp),%esi
       8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
       b:	83 ec 08             	sub    $0x8,%esp
       e:	68 9c 11 00 00       	push   $0x119c
      13:	6a 01                	push   $0x1
      15:	e8 66 0d 00 00       	call   d80 <printf>
  alarm(UTHREAD_QUANTA);
      1a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
      21:	e8 a4 0c 00 00       	call   cca <alarm>
  start_func(arg);
      26:	89 75 08             	mov    %esi,0x8(%ebp)
      29:	83 c4 10             	add    $0x10,%esp
}
      2c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
      2f:	89 d8                	mov    %ebx,%eax
}
      31:	5b                   	pop    %ebx
      32:	5e                   	pop    %esi
      33:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
      34:	ff e0                	jmp    *%eax
      36:	8d 76 00             	lea    0x0(%esi),%esi
      39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000040 <uthread_exit>:
  return;
}

void
uthread_exit()
{
      40:	55                   	push   %ebp
      41:	89 e5                	mov    %esp,%ebp
      43:	53                   	push   %ebx
      44:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
      47:	6a 00                	push   $0x0
      49:	e8 7c 0c 00 00       	call   cca <alarm>
  printf(1,"exiting...\n");
      4e:	5a                   	pop    %edx
      4f:	59                   	pop    %ecx
      50:	68 0c 13 00 00       	push   $0x130c
      55:	6a 01                	push   $0x1
      57:	e8 24 0d 00 00       	call   d80 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
      5c:	a1 28 a8 00 00       	mov    0xa828,%eax
      61:	83 c4 10             	add    $0x10,%esp
      64:	8d 14 c0             	lea    (%eax,%eax,8),%edx
      67:	8b 1c 95 00 19 00 00 	mov    0x1900(,%edx,4),%ebx
      6e:	85 db                	test   %ebx,%ebx
      70:	75 0a                	jne    7c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
      72:	c7 05 08 19 00 00 00 	movl   $0x0,0x1908
      79:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
      7c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
      7f:	83 ec 0c             	sub    $0xc,%esp
      82:	ff 34 85 04 19 00 00 	pushl  0x1904(,%eax,4)
      89:	e8 92 0e 00 00       	call   f20 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
      8e:	a1 28 a8 00 00       	mov    0xa828,%eax
      93:	83 c4 10             	add    $0x10,%esp
      96:	8d 14 c0             	lea    (%eax,%eax,8),%edx
      99:	b8 08 19 00 00       	mov    $0x1908,%eax
      9e:	c1 e2 02             	shl    $0x2,%edx
      a1:	c7 82 08 19 00 00 00 	movl   $0x0,0x1908(%edx)
      a8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
      ab:	c7 82 00 19 00 00 ff 	movl   $0xffffffff,0x1900(%edx)
      b2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
      b5:	c7 82 0c 19 00 00 00 	movl   $0x0,0x190c(%edx)
      bc:	00 00 00 
  threads[index_currently_running].esp = 0;
      bf:	c7 82 10 19 00 00 00 	movl   $0x0,0x1910(%edx)
      c6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
      c9:	c7 82 1c 19 00 00 00 	movl   $0x0,0x191c(%edx)
      d0:	00 00 00 
  threads[index_currently_running].join = -1;
      d3:	c7 82 20 19 00 00 ff 	movl   $0xffffffff,0x1920(%edx)
      da:	ff ff ff 
      dd:	eb 0b                	jmp    ea <uthread_exit+0xaa>
      df:	90                   	nop
      e0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
      e3:	3d 08 22 00 00       	cmp    $0x2208,%eax
      e8:	74 15                	je     ff <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
      ea:	83 38 04             	cmpl   $0x4,(%eax)
      ed:	75 f1                	jne    e0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
      ef:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
      f5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
      f8:	3d 08 22 00 00       	cmp    $0x2208,%eax
      fd:	75 eb                	jne    ea <uthread_exit+0xaa>
      ff:	bb 2c 19 00 00       	mov    $0x192c,%ebx
     104:	eb 15                	jmp    11b <uthread_exit+0xdb>
     106:	8d 76 00             	lea    0x0(%esi),%esi
     109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     110:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     113:	81 fb 08 22 00 00    	cmp    $0x2208,%ebx
     119:	74 24                	je     13f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     11b:	8b 03                	mov    (%ebx),%eax
     11d:	85 c0                	test   %eax,%eax
     11f:	74 ef                	je     110 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     121:	e8 6c 0b 00 00       	call   c92 <getpid>
     126:	83 ec 08             	sub    $0x8,%esp
     129:	83 c3 24             	add    $0x24,%ebx
     12c:	6a 0e                	push   $0xe
     12e:	50                   	push   %eax
     12f:	e8 86 0b 00 00       	call   cba <sigsend>
     134:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     137:	81 fb 08 22 00 00    	cmp    $0x2208,%ebx
     13d:	75 dc                	jne    11b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     13f:	e8 ce 0a 00 00       	call   c12 <exit>
     144:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     14a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000150 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     150:	55                   	push   %ebp
     151:	ba 28 23 00 00       	mov    $0x2328,%edx
     156:	89 e5                	mov    %esp,%ebp
     158:	90                   	nop
     159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     160:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     166:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     170:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     176:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     179:	39 d0                	cmp    %edx,%eax
     17b:	75 f3                	jne    170 <init_bsem+0x20>
     17d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     183:	81 fa 28 a9 00 00    	cmp    $0xa928,%edx
     189:	75 d5                	jne    160 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     18b:	c7 05 e0 18 00 00 01 	movl   $0x1,0x18e0
     192:	00 00 00 
}
     195:	5d                   	pop    %ebp
     196:	c3                   	ret    
     197:	89 f6                	mov    %esi,%esi
     199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <bsem_alloc>:

int bsem_alloc() {
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	53                   	push   %ebx
     1a4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     1a7:	6a 00                	push   $0x0
     1a9:	e8 1c 0b 00 00       	call   cca <alarm>
  int i;
  if(first_run_bsem == 0)
     1ae:	a1 e0 18 00 00       	mov    0x18e0,%eax
     1b3:	83 c4 10             	add    $0x10,%esp
     1b6:	85 c0                	test   %eax,%eax
     1b8:	75 3b                	jne    1f5 <bsem_alloc+0x55>
     1ba:	ba 28 23 00 00       	mov    $0x2328,%edx
     1bf:	90                   	nop
     1c0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     1c6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     1cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     1d0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     1d6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     1d9:	39 d0                	cmp    %edx,%eax
     1db:	75 f3                	jne    1d0 <bsem_alloc+0x30>
     1dd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     1e3:	81 fa 28 a9 00 00    	cmp    $0xa928,%edx
     1e9:	75 d5                	jne    1c0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     1eb:	c7 05 e0 18 00 00 01 	movl   $0x1,0x18e0
     1f2:	00 00 00 
     1f5:	ba 28 23 00 00       	mov    $0x2328,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     1fa:	31 c0                	xor    %eax,%eax
     1fc:	eb 10                	jmp    20e <bsem_alloc+0x6e>
     1fe:	83 c0 01             	add    $0x1,%eax
     201:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     207:	3d 80 00 00 00       	cmp    $0x80,%eax
     20c:	74 4f                	je     25d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     20e:	83 3a 01             	cmpl   $0x1,(%edx)
     211:	75 eb                	jne    1fe <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     213:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     219:	8b 15 d8 18 00 00    	mov    0x18d8,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     21f:	83 ec 0c             	sub    $0xc,%esp
     222:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     224:	8d 98 20 22 00 00    	lea    0x2220(%eax),%ebx
     22a:	89 90 24 22 00 00    	mov    %edx,0x2224(%eax)
    binSemCounter++;
     230:	83 c2 01             	add    $0x1,%edx
     233:	89 15 d8 18 00 00    	mov    %edx,0x18d8
    binSemaphore[i].lock = 1; // not locked
     239:	c7 80 20 22 00 00 01 	movl   $0x1,0x2220(%eax)
     240:	00 00 00 
    binSemaphore[i].state = USED;
     243:	c7 80 28 23 00 00 00 	movl   $0x0,0x2328(%eax)
     24a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     24d:	e8 78 0a 00 00       	call   cca <alarm>
    return binSemaphore[i].id;
     252:	8b 43 04             	mov    0x4(%ebx),%eax
     255:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     258:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     25b:	c9                   	leave  
     25c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     25d:	83 ec 08             	sub    $0x8,%esp
     260:	68 bc 11 00 00       	push   $0x11bc
     265:	6a 01                	push   $0x1
     267:	e8 14 0b 00 00       	call   d80 <printf>
    alarm(UTHREAD_QUANTA);
     26c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     273:	e8 52 0a 00 00       	call   cca <alarm>
    return -1;
     278:	83 c4 10             	add    $0x10,%esp
     27b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     280:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     283:	c9                   	leave  
     284:	c3                   	ret    
     285:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <bsem_free>:

void bsem_free(int id) {
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	53                   	push   %ebx
     294:	83 ec 10             	sub    $0x10,%esp
     297:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     29a:	6a 00                	push   $0x0
     29c:	e8 29 0a 00 00       	call   cca <alarm>
     2a1:	ba 24 22 00 00       	mov    $0x2224,%edx
     2a6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     2a9:	31 c0                	xor    %eax,%eax
     2ab:	eb 13                	jmp    2c0 <bsem_free+0x30>
     2ad:	8d 76 00             	lea    0x0(%esi),%esi
     2b0:	83 c0 01             	add    $0x1,%eax
     2b3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     2b9:	3d 80 00 00 00       	cmp    $0x80,%eax
     2be:	74 38                	je     2f8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     2c0:	39 1a                	cmp    %ebx,(%edx)
     2c2:	75 ec                	jne    2b0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     2c4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     2ca:	05 20 22 00 00       	add    $0x2220,%eax
     2cf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     2d6:	74 0a                	je     2e2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     2d8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     2df:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     2e2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     2e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     2ec:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     2ed:	e9 d8 09 00 00       	jmp    cca <alarm>
     2f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     2f8:	83 ec 04             	sub    $0x4,%esp
     2fb:	53                   	push   %ebx
     2fc:	68 18 13 00 00       	push   $0x1318
     301:	6a 01                	push   $0x1
     303:	e8 78 0a 00 00       	call   d80 <printf>
     308:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     30b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     312:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     315:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     316:	e9 af 09 00 00       	jmp    cca <alarm>
     31b:	90                   	nop
     31c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000320 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	83 ec 10             	sub    $0x10,%esp
     327:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     32a:	6a 00                	push   $0x0
     32c:	e8 99 09 00 00       	call   cca <alarm>
     331:	b8 24 22 00 00       	mov    $0x2224,%eax
     336:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     339:	31 d2                	xor    %edx,%edx
     33b:	eb 17                	jmp    354 <bsem_down+0x34>
     33d:	8d 76 00             	lea    0x0(%esi),%esi
     340:	83 c2 01             	add    $0x1,%edx
     343:	05 0c 01 00 00       	add    $0x10c,%eax
     348:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     34e:	0f 84 8c 00 00 00    	je     3e0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     354:	39 18                	cmp    %ebx,(%eax)
     356:	75 e8                	jne    340 <bsem_down+0x20>
     358:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     35e:	85 c9                	test   %ecx,%ecx
     360:	75 de                	jne    340 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     362:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     368:	31 c0                	xor    %eax,%eax
     36a:	83 b9 20 22 00 00 01 	cmpl   $0x1,0x2220(%ecx)
     371:	75 15                	jne    388 <bsem_down+0x68>
     373:	e9 93 00 00 00       	jmp    40b <bsem_down+0xeb>
     378:	90                   	nop
     379:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     380:	83 c0 01             	add    $0x1,%eax
     383:	83 f8 40             	cmp    $0x40,%eax
     386:	74 7b                	je     403 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     388:	83 bc 81 28 22 00 00 	cmpl   $0xffffffff,0x2228(%ecx,%eax,4)
     38f:	ff 
     390:	75 ee                	jne    380 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     392:	8b 0d 28 a8 00 00    	mov    0xa828,%ecx
     398:	6b d2 43             	imul   $0x43,%edx,%edx
     39b:	01 c2                	add    %eax,%edx
     39d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     3a0:	8b 04 85 00 19 00 00 	mov    0x1900(,%eax,4),%eax
     3a7:	89 04 95 28 22 00 00 	mov    %eax,0x2228(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     3ae:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     3b1:	c7 04 85 08 19 00 00 	movl   $0x4,0x1908(,%eax,4)
     3b8:	04 00 00 00 

	 sigsend(getpid(),14);
     3bc:	e8 d1 08 00 00       	call   c92 <getpid>
     3c1:	83 ec 08             	sub    $0x8,%esp
     3c4:	6a 0e                	push   $0xe
     3c6:	50                   	push   %eax
     3c7:	e8 ee 08 00 00       	call   cba <sigsend>
     3cc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     3cf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     3d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     3da:	e9 eb 08 00 00       	jmp    cca <alarm>
     3df:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     3e0:	83 ec 04             	sub    $0x4,%esp
     3e3:	53                   	push   %ebx
     3e4:	68 dc 11 00 00       	push   $0x11dc
     3e9:	6a 01                	push   $0x1
     3eb:	e8 90 09 00 00       	call   d80 <printf>
     3f0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     3f3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     3fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3fd:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     3fe:	e9 c7 08 00 00       	jmp    cca <alarm>
     403:	8b 0d 28 a8 00 00    	mov    0xa828,%ecx
     409:	eb a3                	jmp    3ae <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     40b:	c7 81 20 22 00 00 00 	movl   $0x0,0x2220(%ecx)
     412:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     415:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     41c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     41f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     420:	e9 a5 08 00 00       	jmp    cca <alarm>
     425:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <bsem_up>:
}

void bsem_up(int id) {
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	57                   	push   %edi
     434:	56                   	push   %esi
     435:	53                   	push   %ebx
     436:	83 ec 28             	sub    $0x28,%esp
     439:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     43c:	6a 00                	push   $0x0
     43e:	e8 87 08 00 00       	call   cca <alarm>
     443:	ba 24 22 00 00       	mov    $0x2224,%edx
     448:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     44b:	31 c0                	xor    %eax,%eax
     44d:	eb 15                	jmp    464 <bsem_up+0x34>
     44f:	90                   	nop
     450:	83 c0 01             	add    $0x1,%eax
     453:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     459:	3d 80 00 00 00       	cmp    $0x80,%eax
     45e:	0f 84 ac 00 00 00    	je     510 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     464:	39 1a                	cmp    %ebx,(%edx)
     466:	75 e8                	jne    450 <bsem_up+0x20>
     468:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     46e:	85 c9                	test   %ecx,%ecx
     470:	75 de                	jne    450 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     472:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     478:	8b 97 20 22 00 00    	mov    0x2220(%edi),%edx
     47e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     481:	85 d2                	test   %edx,%edx
     483:	0f 85 9c 00 00 00    	jne    525 <bsem_up+0xf5>
     489:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     48b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     48e:	8b b4 be 28 22 00 00 	mov    0x2228(%esi,%edi,4),%esi
     495:	83 fe ff             	cmp    $0xffffffff,%esi
     498:	74 56                	je     4f0 <bsem_up+0xc0>
     49a:	b9 00 19 00 00       	mov    $0x1900,%ecx
     49f:	31 d2                	xor    %edx,%edx
     4a1:	eb 10                	jmp    4b3 <bsem_up+0x83>
     4a3:	90                   	nop
     4a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     4a8:	83 c2 01             	add    $0x1,%edx
     4ab:	83 c1 24             	add    $0x24,%ecx
     4ae:	83 fa 40             	cmp    $0x40,%edx
     4b1:	74 3d                	je     4f0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     4b3:	8b 19                	mov    (%ecx),%ebx
     4b5:	39 de                	cmp    %ebx,%esi
     4b7:	75 ef                	jne    4a8 <bsem_up+0x78>
     4b9:	83 fb ff             	cmp    $0xffffffff,%ebx
     4bc:	74 ea                	je     4a8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     4be:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     4c1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     4c4:	c7 04 95 08 19 00 00 	movl   $0x2,0x1908(,%edx,4)
     4cb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     4cf:	01 c7                	add    %eax,%edi
     4d1:	c7 04 bd 28 22 00 00 	movl   $0xffffffff,0x2228(,%edi,4)
     4d8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     4dc:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     4e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e6:	5b                   	pop    %ebx
     4e7:	5e                   	pop    %esi
     4e8:	5f                   	pop    %edi
     4e9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     4ea:	e9 db 07 00 00       	jmp    cca <alarm>
     4ef:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     4f0:	83 c7 01             	add    $0x1,%edi
     4f3:	83 ff 40             	cmp    $0x40,%edi
     4f6:	75 93                	jne    48b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     4f8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     4fe:	c7 80 20 22 00 00 01 	movl   $0x1,0x2220(%eax)
     505:	00 00 00 
     508:	eb d2                	jmp    4dc <bsem_up+0xac>
     50a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     510:	83 ec 04             	sub    $0x4,%esp
     513:	53                   	push   %ebx
     514:	68 44 12 00 00       	push   $0x1244
     519:	6a 01                	push   $0x1
     51b:	e8 60 08 00 00       	call   d80 <printf>
     520:	83 c4 10             	add    $0x10,%esp
     523:	eb b7                	jmp    4dc <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     525:	83 ec 08             	sub    $0x8,%esp
     528:	68 20 12 00 00       	push   $0x1220
     52d:	6a 01                	push   $0x1
     52f:	e8 4c 08 00 00       	call   d80 <printf>
     534:	83 c4 10             	add    $0x10,%esp
     537:	eb a3                	jmp    4dc <bsem_up+0xac>
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000540 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     540:	55                   	push   %ebp
     541:	89 e5                	mov    %esp,%ebp
     543:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     546:	68 88 12 00 00       	push   $0x1288
     54b:	6a 01                	push   $0x1
     54d:	e8 2e 08 00 00       	call   d80 <printf>
     552:	b8 00 19 00 00       	mov    $0x1900,%eax
     557:	83 c4 10             	add    $0x10,%esp
     55a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     560:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     566:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     56d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     570:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     577:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     57e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     585:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     58c:	3d 00 22 00 00       	cmp    $0x2200,%eax
     591:	75 cd                	jne    560 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     593:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     596:	c7 05 00 19 00 00 00 	movl   $0x0,0x1900
     59d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     5a0:	c7 05 08 19 00 00 03 	movl   $0x3,0x1908
     5a7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     5aa:	68 40 07 00 00       	push   $0x740
     5af:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     5b1:	c7 05 04 19 00 00 00 	movl   $0x0,0x1904
     5b8:	00 00 00 

  id_number_thread = 1;
     5bb:	c7 05 24 a8 00 00 01 	movl   $0x1,0xa824
     5c2:	00 00 00 
  index_currently_running = 0;
     5c5:	c7 05 28 a8 00 00 00 	movl   $0x0,0xa828
     5cc:	00 00 00 
  currently_running = 0;
     5cf:	c7 05 00 22 00 00 00 	movl   $0x0,0x2200
     5d6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     5d9:	e8 d4 06 00 00       	call   cb2 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     5de:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     5e5:	e8 e0 06 00 00       	call   cca <alarm>
  return 0;
}
     5ea:	31 c0                	xor    %eax,%eax
     5ec:	c9                   	leave  
     5ed:	c3                   	ret    
     5ee:	66 90                	xchg   %ax,%ax

000005f0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	56                   	push   %esi
     5f4:	53                   	push   %ebx
  alarm(0);
     5f5:	83 ec 0c             	sub    $0xc,%esp
     5f8:	6a 00                	push   $0x0
     5fa:	e8 cb 06 00 00       	call   cca <alarm>
  printf(1, "------ creating a new thread ------\n");
     5ff:	5b                   	pop    %ebx
     600:	5e                   	pop    %esi
     601:	68 b4 12 00 00       	push   $0x12b4
     606:	6a 01                	push   $0x1
     608:	e8 73 07 00 00       	call   d80 <printf>
     60d:	ba 08 19 00 00       	mov    $0x1908,%edx
     612:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     615:	31 c0                	xor    %eax,%eax
     617:	eb 12                	jmp    62b <uthread_create+0x3b>
     619:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     620:	83 c0 01             	add    $0x1,%eax
     623:	83 c2 24             	add    $0x24,%edx
     626:	83 f8 40             	cmp    $0x40,%eax
     629:	74 7d                	je     6a8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     62b:	8b 0a                	mov    (%edx),%ecx
     62d:	85 c9                	test   %ecx,%ecx
     62f:	75 ef                	jne    620 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     631:	8b 15 24 a8 00 00    	mov    0xa824,%edx
     637:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     63a:	83 ec 0c             	sub    $0xc,%esp
     63d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     642:	c1 e3 02             	shl    $0x2,%ebx
     645:	89 93 00 19 00 00    	mov    %edx,0x1900(%ebx)
  id_number_thread++;
     64b:	83 c2 01             	add    $0x1,%edx
     64e:	89 15 24 a8 00 00    	mov    %edx,0xa824

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     654:	e8 57 09 00 00       	call   fb0 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     659:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     65c:	c7 80 f4 0f 00 00 40 	movl   $0x40,0xff4(%eax)
     663:	00 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     666:	89 83 04 19 00 00    	mov    %eax,0x1904(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     66c:	c7 83 08 19 00 00 02 	movl   $0x2,0x1908(%ebx)
     673:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     676:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     67c:	8b 55 0c             	mov    0xc(%ebp),%edx
     67f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     685:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     68c:	e8 39 06 00 00       	call   cca <alarm>
  return   threads[free_thread].thread_id;
     691:	8b 83 00 19 00 00    	mov    0x1900(%ebx),%eax
     697:	83 c4 10             	add    $0x10,%esp
}
     69a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     69d:	5b                   	pop    %ebx
     69e:	5e                   	pop    %esi
     69f:	5d                   	pop    %ebp
     6a0:	c3                   	ret    
     6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     6a8:	83 ec 08             	sub    $0x8,%esp
     6ab:	68 2a 13 00 00       	push   $0x132a
     6b0:	6a 01                	push   $0x1
     6b2:	e8 c9 06 00 00       	call   d80 <printf>
    alarm(UTHREAD_QUANTA);
     6b7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     6be:	e8 07 06 00 00       	call   cca <alarm>
    return -1;
     6c3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     6c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     6c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     6ce:	5b                   	pop    %ebx
     6cf:	5e                   	pop    %esi
     6d0:	5d                   	pop    %ebp
     6d1:	c3                   	ret    
     6d2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006e0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     6e6:	85 c0                	test   %eax,%eax
     6e8:	74 14                	je     6fe <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     6ea:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     6ed:	89 e2                	mov    %esp,%edx
     6ef:	8d 04 85 00 19 00 00 	lea    0x1900(,%eax,4),%eax
     6f6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     6f9:	89 ea                	mov    %ebp,%edx
     6fb:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     6fe:	a1 28 a8 00 00       	mov    0xa828,%eax
     703:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     706:	8d 04 85 00 19 00 00 	lea    0x1900(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     70d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     710:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     717:	85 d2                	test   %edx,%edx
     719:	74 0d                	je     728 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     71b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     71d:	8b 40 0c             	mov    0xc(%eax),%eax
     720:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     722:	5d                   	pop    %ebp
     723:	c3                   	ret    
     724:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     728:	8b 40 04             	mov    0x4(%eax),%eax
     72b:	05 f4 0f 00 00       	add    $0xff4,%eax
     730:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     732:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     734:	b8 00 00 00 00       	mov    $0x0,%eax
     739:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     73b:	5d                   	pop    %ebp
     73c:	c3                   	ret    
     73d:	8d 76 00             	lea    0x0(%esi),%esi

00000740 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
     745:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     748:	83 ec 0c             	sub    $0xc,%esp
     74b:	6a 00                	push   $0x0
     74d:	e8 78 05 00 00       	call   cca <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     752:	a1 28 a8 00 00       	mov    0xa828,%eax
     757:	83 c4 10             	add    $0x10,%esp
     75a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     75d:	8d 14 95 00 19 00 00 	lea    0x1900(,%edx,4),%edx
     764:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     768:	75 0b                	jne    775 <uthread_schedule+0x35>
     76a:	85 c0                	test   %eax,%eax
     76c:	74 07                	je     775 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     76e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     775:	bb 08 19 00 00       	mov    $0x1908,%ebx
     77a:	eb 0f                	jmp    78b <uthread_schedule+0x4b>
     77c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     780:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     783:	81 fb 08 22 00 00    	cmp    $0x2208,%ebx
     789:	74 55                	je     7e0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     78b:	83 3b 01             	cmpl   $0x1,(%ebx)
     78e:	75 f0                	jne    780 <uthread_schedule+0x40>
     790:	8b 73 14             	mov    0x14(%ebx),%esi
     793:	85 f6                	test   %esi,%esi
     795:	0f 85 a5 00 00 00    	jne    840 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     79b:	8b 43 18             	mov    0x18(%ebx),%eax
     79e:	83 f8 ff             	cmp    $0xffffffff,%eax
     7a1:	74 dd                	je     780 <uthread_schedule+0x40>
     7a3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7a6:	8b 14 95 08 19 00 00 	mov    0x1908(,%edx,4),%edx
     7ad:	85 d2                	test   %edx,%edx
     7af:	75 cf                	jne    780 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     7b1:	50                   	push   %eax
     7b2:	ff 73 f8             	pushl  -0x8(%ebx)
     7b5:	83 c3 24             	add    $0x24,%ebx
     7b8:	68 dc 12 00 00       	push   $0x12dc
     7bd:	6a 01                	push   $0x1
     7bf:	e8 bc 05 00 00       	call   d80 <printf>
      threads[i].join = -1;
     7c4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     7cb:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     7d2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     7d5:	81 fb 08 22 00 00    	cmp    $0x2208,%ebx
     7db:	75 ae                	jne    78b <uthread_schedule+0x4b>
     7dd:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     7e0:	8b 15 28 a8 00 00    	mov    0xa828,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     7e6:	b9 40 00 00 00       	mov    $0x40,%ecx
     7eb:	8d 42 01             	lea    0x1(%edx),%eax
     7ee:	eb 08                	jmp    7f8 <uthread_schedule+0xb8>
     7f0:	83 c0 01             	add    $0x1,%eax
     7f3:	83 e9 01             	sub    $0x1,%ecx
     7f6:	74 78                	je     870 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     7f8:	89 c3                	mov    %eax,%ebx
     7fa:	c1 fb 1f             	sar    $0x1f,%ebx
     7fd:	c1 eb 1a             	shr    $0x1a,%ebx
     800:	01 d8                	add    %ebx,%eax
     802:	83 e0 3f             	and    $0x3f,%eax
     805:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     807:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     80a:	83 3c 9d 08 19 00 00 	cmpl   $0x2,0x1908(,%ebx,4)
     811:	02 
     812:	75 dc                	jne    7f0 <uthread_schedule+0xb0>
     814:	39 c2                	cmp    %eax,%edx
     816:	74 d8                	je     7f0 <uthread_schedule+0xb0>
      index_currently_running = i;
     818:	a3 28 a8 00 00       	mov    %eax,0xa828
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     81d:	83 ec 08             	sub    $0x8,%esp
     820:	50                   	push   %eax
     821:	52                   	push   %edx
     822:	e8 b9 fe ff ff       	call   6e0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     827:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     82e:	e8 97 04 00 00       	call   cca <alarm>
}
     833:	8d 65 f8             	lea    -0x8(%ebp),%esp
     836:	5b                   	pop    %ebx
     837:	5e                   	pop    %esi
     838:	5d                   	pop    %ebp
     839:	c3                   	ret    
     83a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     840:	e8 65 04 00 00       	call   caa <uptime>
     845:	39 c6                	cmp    %eax,%esi
     847:	7f 17                	jg     860 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
     849:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
     84f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
     856:	e9 25 ff ff ff       	jmp    780 <uthread_schedule+0x40>
     85b:	90                   	nop
     85c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     860:	83 3b 01             	cmpl   $0x1,(%ebx)
     863:	0f 84 32 ff ff ff    	je     79b <uthread_schedule+0x5b>
     869:	e9 12 ff ff ff       	jmp    780 <uthread_schedule+0x40>
     86e:	66 90                	xchg   %ax,%ax
     870:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
     873:	83 3c 85 08 19 00 00 	cmpl   $0x2,0x1908(,%eax,4)
     87a:	02 
     87b:	0f 85 c7 fe ff ff    	jne    748 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     881:	89 d0                	mov    %edx,%eax
     883:	eb 98                	jmp    81d <uthread_schedule+0xdd>
     885:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     890:	a1 28 a8 00 00       	mov    0xa828,%eax
  exit();
}

int
uthread_self()
{
     895:	55                   	push   %ebp
     896:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
     898:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
     89b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     89c:	8b 04 85 00 19 00 00 	mov    0x1900(,%eax,4),%eax
}
     8a3:	c3                   	ret    
     8a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     8aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000008b0 <uthread_join>:

int
uthread_join(int tid)
{
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	56                   	push   %esi
     8b4:	53                   	push   %ebx
     8b5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
     8b8:	39 35 24 a8 00 00    	cmp    %esi,0xa824
     8be:	0f 8c ab 00 00 00    	jl     96f <uthread_join+0xbf>
     8c4:	89 f0                	mov    %esi,%eax
     8c6:	c1 e8 1f             	shr    $0x1f,%eax
     8c9:	84 c0                	test   %al,%al
     8cb:	0f 85 9e 00 00 00    	jne    96f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
     8d1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
     8d4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
     8d6:	6a 00                	push   $0x0
     8d8:	e8 ed 03 00 00       	call   cca <alarm>
     8dd:	b8 00 19 00 00       	mov    $0x1900,%eax
     8e2:	83 c4 10             	add    $0x10,%esp
     8e5:	eb 14                	jmp    8fb <uthread_join+0x4b>
     8e7:	89 f6                	mov    %esi,%esi
     8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
     8f0:	83 c3 01             	add    $0x1,%ebx
     8f3:	83 c0 24             	add    $0x24,%eax
     8f6:	83 fb 40             	cmp    $0x40,%ebx
     8f9:	74 55                	je     950 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
     8fb:	3b 30                	cmp    (%eax),%esi
     8fd:	75 f1                	jne    8f0 <uthread_join+0x40>
     8ff:	8b 50 08             	mov    0x8(%eax),%edx
     902:	85 d2                	test   %edx,%edx
     904:	74 ea                	je     8f0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
     906:	53                   	push   %ebx
     907:	ff 35 28 a8 00 00    	pushl  0xa828
     90d:	68 66 13 00 00       	push   $0x1366
     912:	6a 01                	push   $0x1
     914:	e8 67 04 00 00       	call   d80 <printf>
    threads[index_currently_running].join=found_tid;
     919:	a1 28 a8 00 00       	mov    0xa828,%eax
     91e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     921:	8d 04 85 00 19 00 00 	lea    0x1900(,%eax,4),%eax
     928:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
     92b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
     932:	e8 5b 03 00 00       	call   c92 <getpid>
     937:	5a                   	pop    %edx
     938:	59                   	pop    %ecx
     939:	6a 0e                	push   $0xe
     93b:	50                   	push   %eax
     93c:	e8 79 03 00 00       	call   cba <sigsend>
  }
  return 0;
     941:	83 c4 10             	add    $0x10,%esp

}
     944:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
     947:	31 c0                	xor    %eax,%eax

}
     949:	5b                   	pop    %ebx
     94a:	5e                   	pop    %esi
     94b:	5d                   	pop    %ebp
     94c:	c3                   	ret    
     94d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
     950:	83 ec 04             	sub    $0x4,%esp
     953:	56                   	push   %esi
     954:	68 48 13 00 00       	push   $0x1348
     959:	6a 01                	push   $0x1
     95b:	e8 20 04 00 00       	call   d80 <printf>
    alarm(UTHREAD_QUANTA);
     960:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     967:	e8 5e 03 00 00       	call   cca <alarm>
    return -1;
     96c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
     96f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
     972:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
     977:	5b                   	pop    %ebx
     978:	5e                   	pop    %esi
     979:	5d                   	pop    %ebp
     97a:	c3                   	ret    
     97b:	90                   	nop
     97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000980 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
     980:	55                   	push   %ebp
     981:	89 e5                	mov    %esp,%ebp
     983:	53                   	push   %ebx
     984:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     987:	6a 00                	push   $0x0
     989:	e8 3c 03 00 00       	call   cca <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
     98e:	8b 1d 28 a8 00 00    	mov    0xa828,%ebx
     994:	e8 11 03 00 00       	call   caa <uptime>
     999:	03 45 08             	add    0x8(%ebp),%eax
     99c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
     99f:	89 04 95 1c 19 00 00 	mov    %eax,0x191c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
     9a6:	a1 28 a8 00 00       	mov    0xa828,%eax
     9ab:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     9ae:	c7 04 85 08 19 00 00 	movl   $0x1,0x1908(,%eax,4)
     9b5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
     9b9:	e8 d4 02 00 00       	call   c92 <getpid>
     9be:	5a                   	pop    %edx
     9bf:	59                   	pop    %ecx
     9c0:	6a 0e                	push   $0xe
     9c2:	50                   	push   %eax
     9c3:	e8 f2 02 00 00       	call   cba <sigsend>
  return 0;
}
     9c8:	31 c0                	xor    %eax,%eax
     9ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9cd:	c9                   	leave  
     9ce:	c3                   	ret    
     9cf:	90                   	nop

000009d0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	53                   	push   %ebx
     9d4:	8b 45 08             	mov    0x8(%ebp),%eax
     9d7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     9da:	89 c2                	mov    %eax,%edx
     9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9e0:	83 c1 01             	add    $0x1,%ecx
     9e3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     9e7:	83 c2 01             	add    $0x1,%edx
     9ea:	84 db                	test   %bl,%bl
     9ec:	88 5a ff             	mov    %bl,-0x1(%edx)
     9ef:	75 ef                	jne    9e0 <strcpy+0x10>
    ;
  return os;
}
     9f1:	5b                   	pop    %ebx
     9f2:	5d                   	pop    %ebp
     9f3:	c3                   	ret    
     9f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     9fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000a00 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     a00:	55                   	push   %ebp
     a01:	89 e5                	mov    %esp,%ebp
     a03:	56                   	push   %esi
     a04:	53                   	push   %ebx
     a05:	8b 55 08             	mov    0x8(%ebp),%edx
     a08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     a0b:	0f b6 02             	movzbl (%edx),%eax
     a0e:	0f b6 19             	movzbl (%ecx),%ebx
     a11:	84 c0                	test   %al,%al
     a13:	75 1e                	jne    a33 <strcmp+0x33>
     a15:	eb 29                	jmp    a40 <strcmp+0x40>
     a17:	89 f6                	mov    %esi,%esi
     a19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     a20:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a23:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     a26:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a29:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     a2d:	84 c0                	test   %al,%al
     a2f:	74 0f                	je     a40 <strcmp+0x40>
     a31:	89 f1                	mov    %esi,%ecx
     a33:	38 d8                	cmp    %bl,%al
     a35:	74 e9                	je     a20 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a37:	29 d8                	sub    %ebx,%eax
}
     a39:	5b                   	pop    %ebx
     a3a:	5e                   	pop    %esi
     a3b:	5d                   	pop    %ebp
     a3c:	c3                   	ret    
     a3d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     a40:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     a42:	29 d8                	sub    %ebx,%eax
}
     a44:	5b                   	pop    %ebx
     a45:	5e                   	pop    %esi
     a46:	5d                   	pop    %ebp
     a47:	c3                   	ret    
     a48:	90                   	nop
     a49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000a50 <strlen>:

uint
strlen(char *s)
{
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     a56:	80 39 00             	cmpb   $0x0,(%ecx)
     a59:	74 12                	je     a6d <strlen+0x1d>
     a5b:	31 d2                	xor    %edx,%edx
     a5d:	8d 76 00             	lea    0x0(%esi),%esi
     a60:	83 c2 01             	add    $0x1,%edx
     a63:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     a67:	89 d0                	mov    %edx,%eax
     a69:	75 f5                	jne    a60 <strlen+0x10>
    ;
  return n;
}
     a6b:	5d                   	pop    %ebp
     a6c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     a6d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     a6f:	5d                   	pop    %ebp
     a70:	c3                   	ret    
     a71:	eb 0d                	jmp    a80 <memset>
     a73:	90                   	nop
     a74:	90                   	nop
     a75:	90                   	nop
     a76:	90                   	nop
     a77:	90                   	nop
     a78:	90                   	nop
     a79:	90                   	nop
     a7a:	90                   	nop
     a7b:	90                   	nop
     a7c:	90                   	nop
     a7d:	90                   	nop
     a7e:	90                   	nop
     a7f:	90                   	nop

00000a80 <memset>:

void*
memset(void *dst, int c, uint n)
{
     a80:	55                   	push   %ebp
     a81:	89 e5                	mov    %esp,%ebp
     a83:	57                   	push   %edi
     a84:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     a87:	8b 4d 10             	mov    0x10(%ebp),%ecx
     a8a:	8b 45 0c             	mov    0xc(%ebp),%eax
     a8d:	89 d7                	mov    %edx,%edi
     a8f:	fc                   	cld    
     a90:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     a92:	89 d0                	mov    %edx,%eax
     a94:	5f                   	pop    %edi
     a95:	5d                   	pop    %ebp
     a96:	c3                   	ret    
     a97:	89 f6                	mov    %esi,%esi
     a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <strchr>:

char*
strchr(const char *s, char c)
{
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	8b 45 08             	mov    0x8(%ebp),%eax
     aa7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     aaa:	0f b6 10             	movzbl (%eax),%edx
     aad:	84 d2                	test   %dl,%dl
     aaf:	74 1d                	je     ace <strchr+0x2e>
    if(*s == c)
     ab1:	38 d3                	cmp    %dl,%bl
     ab3:	89 d9                	mov    %ebx,%ecx
     ab5:	75 0d                	jne    ac4 <strchr+0x24>
     ab7:	eb 17                	jmp    ad0 <strchr+0x30>
     ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ac0:	38 ca                	cmp    %cl,%dl
     ac2:	74 0c                	je     ad0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     ac4:	83 c0 01             	add    $0x1,%eax
     ac7:	0f b6 10             	movzbl (%eax),%edx
     aca:	84 d2                	test   %dl,%dl
     acc:	75 f2                	jne    ac0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     ace:	31 c0                	xor    %eax,%eax
}
     ad0:	5b                   	pop    %ebx
     ad1:	5d                   	pop    %ebp
     ad2:	c3                   	ret    
     ad3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <gets>:

char*
gets(char *buf, int max)
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	57                   	push   %edi
     ae4:	56                   	push   %esi
     ae5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ae6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     ae8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     aeb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     aee:	eb 29                	jmp    b19 <gets+0x39>
    cc = read(0, &c, 1);
     af0:	83 ec 04             	sub    $0x4,%esp
     af3:	6a 01                	push   $0x1
     af5:	57                   	push   %edi
     af6:	6a 00                	push   $0x0
     af8:	e8 2d 01 00 00       	call   c2a <read>
    if(cc < 1)
     afd:	83 c4 10             	add    $0x10,%esp
     b00:	85 c0                	test   %eax,%eax
     b02:	7e 1d                	jle    b21 <gets+0x41>
      break;
    buf[i++] = c;
     b04:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     b08:	8b 55 08             	mov    0x8(%ebp),%edx
     b0b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     b0d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     b0f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     b13:	74 1b                	je     b30 <gets+0x50>
     b15:	3c 0d                	cmp    $0xd,%al
     b17:	74 17                	je     b30 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b19:	8d 5e 01             	lea    0x1(%esi),%ebx
     b1c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     b1f:	7c cf                	jl     af0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     b21:	8b 45 08             	mov    0x8(%ebp),%eax
     b24:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     b28:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b2b:	5b                   	pop    %ebx
     b2c:	5e                   	pop    %esi
     b2d:	5f                   	pop    %edi
     b2e:	5d                   	pop    %ebp
     b2f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     b30:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     b33:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     b35:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     b39:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b3c:	5b                   	pop    %ebx
     b3d:	5e                   	pop    %esi
     b3e:	5f                   	pop    %edi
     b3f:	5d                   	pop    %ebp
     b40:	c3                   	ret    
     b41:	eb 0d                	jmp    b50 <stat>
     b43:	90                   	nop
     b44:	90                   	nop
     b45:	90                   	nop
     b46:	90                   	nop
     b47:	90                   	nop
     b48:	90                   	nop
     b49:	90                   	nop
     b4a:	90                   	nop
     b4b:	90                   	nop
     b4c:	90                   	nop
     b4d:	90                   	nop
     b4e:	90                   	nop
     b4f:	90                   	nop

00000b50 <stat>:

int
stat(char *n, struct stat *st)
{
     b50:	55                   	push   %ebp
     b51:	89 e5                	mov    %esp,%ebp
     b53:	56                   	push   %esi
     b54:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     b55:	83 ec 08             	sub    $0x8,%esp
     b58:	6a 00                	push   $0x0
     b5a:	ff 75 08             	pushl  0x8(%ebp)
     b5d:	e8 f0 00 00 00       	call   c52 <open>
  if(fd < 0)
     b62:	83 c4 10             	add    $0x10,%esp
     b65:	85 c0                	test   %eax,%eax
     b67:	78 27                	js     b90 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     b69:	83 ec 08             	sub    $0x8,%esp
     b6c:	ff 75 0c             	pushl  0xc(%ebp)
     b6f:	89 c3                	mov    %eax,%ebx
     b71:	50                   	push   %eax
     b72:	e8 f3 00 00 00       	call   c6a <fstat>
     b77:	89 c6                	mov    %eax,%esi
  close(fd);
     b79:	89 1c 24             	mov    %ebx,(%esp)
     b7c:	e8 b9 00 00 00       	call   c3a <close>
  return r;
     b81:	83 c4 10             	add    $0x10,%esp
     b84:	89 f0                	mov    %esi,%eax
}
     b86:	8d 65 f8             	lea    -0x8(%ebp),%esp
     b89:	5b                   	pop    %ebx
     b8a:	5e                   	pop    %esi
     b8b:	5d                   	pop    %ebp
     b8c:	c3                   	ret    
     b8d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     b90:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     b95:	eb ef                	jmp    b86 <stat+0x36>
     b97:	89 f6                	mov    %esi,%esi
     b99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ba0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	53                   	push   %ebx
     ba4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     ba7:	0f be 11             	movsbl (%ecx),%edx
     baa:	8d 42 d0             	lea    -0x30(%edx),%eax
     bad:	3c 09                	cmp    $0x9,%al
     baf:	b8 00 00 00 00       	mov    $0x0,%eax
     bb4:	77 1f                	ja     bd5 <atoi+0x35>
     bb6:	8d 76 00             	lea    0x0(%esi),%esi
     bb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     bc0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     bc3:	83 c1 01             	add    $0x1,%ecx
     bc6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     bca:	0f be 11             	movsbl (%ecx),%edx
     bcd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     bd0:	80 fb 09             	cmp    $0x9,%bl
     bd3:	76 eb                	jbe    bc0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     bd5:	5b                   	pop    %ebx
     bd6:	5d                   	pop    %ebp
     bd7:	c3                   	ret    
     bd8:	90                   	nop
     bd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000be0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     be0:	55                   	push   %ebp
     be1:	89 e5                	mov    %esp,%ebp
     be3:	56                   	push   %esi
     be4:	53                   	push   %ebx
     be5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     be8:	8b 45 08             	mov    0x8(%ebp),%eax
     beb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     bee:	85 db                	test   %ebx,%ebx
     bf0:	7e 14                	jle    c06 <memmove+0x26>
     bf2:	31 d2                	xor    %edx,%edx
     bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     bf8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     bfc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     bff:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     c02:	39 da                	cmp    %ebx,%edx
     c04:	75 f2                	jne    bf8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     c06:	5b                   	pop    %ebx
     c07:	5e                   	pop    %esi
     c08:	5d                   	pop    %ebp
     c09:	c3                   	ret    

00000c0a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     c0a:	b8 01 00 00 00       	mov    $0x1,%eax
     c0f:	cd 40                	int    $0x40
     c11:	c3                   	ret    

00000c12 <exit>:
SYSCALL(exit)
     c12:	b8 02 00 00 00       	mov    $0x2,%eax
     c17:	cd 40                	int    $0x40
     c19:	c3                   	ret    

00000c1a <wait>:
SYSCALL(wait)
     c1a:	b8 03 00 00 00       	mov    $0x3,%eax
     c1f:	cd 40                	int    $0x40
     c21:	c3                   	ret    

00000c22 <pipe>:
SYSCALL(pipe)
     c22:	b8 04 00 00 00       	mov    $0x4,%eax
     c27:	cd 40                	int    $0x40
     c29:	c3                   	ret    

00000c2a <read>:
SYSCALL(read)
     c2a:	b8 05 00 00 00       	mov    $0x5,%eax
     c2f:	cd 40                	int    $0x40
     c31:	c3                   	ret    

00000c32 <write>:
SYSCALL(write)
     c32:	b8 10 00 00 00       	mov    $0x10,%eax
     c37:	cd 40                	int    $0x40
     c39:	c3                   	ret    

00000c3a <close>:
SYSCALL(close)
     c3a:	b8 15 00 00 00       	mov    $0x15,%eax
     c3f:	cd 40                	int    $0x40
     c41:	c3                   	ret    

00000c42 <kill>:
SYSCALL(kill)
     c42:	b8 06 00 00 00       	mov    $0x6,%eax
     c47:	cd 40                	int    $0x40
     c49:	c3                   	ret    

00000c4a <exec>:
SYSCALL(exec)
     c4a:	b8 07 00 00 00       	mov    $0x7,%eax
     c4f:	cd 40                	int    $0x40
     c51:	c3                   	ret    

00000c52 <open>:
SYSCALL(open)
     c52:	b8 0f 00 00 00       	mov    $0xf,%eax
     c57:	cd 40                	int    $0x40
     c59:	c3                   	ret    

00000c5a <mknod>:
SYSCALL(mknod)
     c5a:	b8 11 00 00 00       	mov    $0x11,%eax
     c5f:	cd 40                	int    $0x40
     c61:	c3                   	ret    

00000c62 <unlink>:
SYSCALL(unlink)
     c62:	b8 12 00 00 00       	mov    $0x12,%eax
     c67:	cd 40                	int    $0x40
     c69:	c3                   	ret    

00000c6a <fstat>:
SYSCALL(fstat)
     c6a:	b8 08 00 00 00       	mov    $0x8,%eax
     c6f:	cd 40                	int    $0x40
     c71:	c3                   	ret    

00000c72 <link>:
SYSCALL(link)
     c72:	b8 13 00 00 00       	mov    $0x13,%eax
     c77:	cd 40                	int    $0x40
     c79:	c3                   	ret    

00000c7a <mkdir>:
SYSCALL(mkdir)
     c7a:	b8 14 00 00 00       	mov    $0x14,%eax
     c7f:	cd 40                	int    $0x40
     c81:	c3                   	ret    

00000c82 <chdir>:
SYSCALL(chdir)
     c82:	b8 09 00 00 00       	mov    $0x9,%eax
     c87:	cd 40                	int    $0x40
     c89:	c3                   	ret    

00000c8a <dup>:
SYSCALL(dup)
     c8a:	b8 0a 00 00 00       	mov    $0xa,%eax
     c8f:	cd 40                	int    $0x40
     c91:	c3                   	ret    

00000c92 <getpid>:
SYSCALL(getpid)
     c92:	b8 0b 00 00 00       	mov    $0xb,%eax
     c97:	cd 40                	int    $0x40
     c99:	c3                   	ret    

00000c9a <sbrk>:
SYSCALL(sbrk)
     c9a:	b8 0c 00 00 00       	mov    $0xc,%eax
     c9f:	cd 40                	int    $0x40
     ca1:	c3                   	ret    

00000ca2 <sleep>:
SYSCALL(sleep)
     ca2:	b8 0d 00 00 00       	mov    $0xd,%eax
     ca7:	cd 40                	int    $0x40
     ca9:	c3                   	ret    

00000caa <uptime>:
SYSCALL(uptime)
     caa:	b8 0e 00 00 00       	mov    $0xe,%eax
     caf:	cd 40                	int    $0x40
     cb1:	c3                   	ret    

00000cb2 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     cb2:	b8 16 00 00 00       	mov    $0x16,%eax
     cb7:	cd 40                	int    $0x40
     cb9:	c3                   	ret    

00000cba <sigsend>:
SYSCALL(sigsend)
     cba:	b8 17 00 00 00       	mov    $0x17,%eax
     cbf:	cd 40                	int    $0x40
     cc1:	c3                   	ret    

00000cc2 <sigreturn>:
SYSCALL(sigreturn)
     cc2:	b8 18 00 00 00       	mov    $0x18,%eax
     cc7:	cd 40                	int    $0x40
     cc9:	c3                   	ret    

00000cca <alarm>:
SYSCALL(alarm)
     cca:	b8 19 00 00 00       	mov    $0x19,%eax
     ccf:	cd 40                	int    $0x40
     cd1:	c3                   	ret    
     cd2:	66 90                	xchg   %ax,%ax
     cd4:	66 90                	xchg   %ax,%ax
     cd6:	66 90                	xchg   %ax,%ax
     cd8:	66 90                	xchg   %ax,%ax
     cda:	66 90                	xchg   %ax,%ax
     cdc:	66 90                	xchg   %ax,%ax
     cde:	66 90                	xchg   %ax,%ax

00000ce0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     ce0:	55                   	push   %ebp
     ce1:	89 e5                	mov    %esp,%ebp
     ce3:	57                   	push   %edi
     ce4:	56                   	push   %esi
     ce5:	53                   	push   %ebx
     ce6:	89 c6                	mov    %eax,%esi
     ce8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     ceb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     cee:	85 db                	test   %ebx,%ebx
     cf0:	74 7e                	je     d70 <printint+0x90>
     cf2:	89 d0                	mov    %edx,%eax
     cf4:	c1 e8 1f             	shr    $0x1f,%eax
     cf7:	84 c0                	test   %al,%al
     cf9:	74 75                	je     d70 <printint+0x90>
    neg = 1;
    x = -xx;
     cfb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     cfd:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     d04:	f7 d8                	neg    %eax
     d06:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     d09:	31 ff                	xor    %edi,%edi
     d0b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     d0e:	89 ce                	mov    %ecx,%esi
     d10:	eb 08                	jmp    d1a <printint+0x3a>
     d12:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     d18:	89 cf                	mov    %ecx,%edi
     d1a:	31 d2                	xor    %edx,%edx
     d1c:	8d 4f 01             	lea    0x1(%edi),%ecx
     d1f:	f7 f6                	div    %esi
     d21:	0f b6 92 88 13 00 00 	movzbl 0x1388(%edx),%edx
  }while((x /= base) != 0);
     d28:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     d2a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     d2d:	75 e9                	jne    d18 <printint+0x38>
  if(neg)
     d2f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     d32:	8b 75 c0             	mov    -0x40(%ebp),%esi
     d35:	85 c0                	test   %eax,%eax
     d37:	74 08                	je     d41 <printint+0x61>
    buf[i++] = '-';
     d39:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     d3e:	8d 4f 02             	lea    0x2(%edi),%ecx
     d41:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     d45:	8d 76 00             	lea    0x0(%esi),%esi
     d48:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     d4b:	83 ec 04             	sub    $0x4,%esp
     d4e:	83 ef 01             	sub    $0x1,%edi
     d51:	6a 01                	push   $0x1
     d53:	53                   	push   %ebx
     d54:	56                   	push   %esi
     d55:	88 45 d7             	mov    %al,-0x29(%ebp)
     d58:	e8 d5 fe ff ff       	call   c32 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     d5d:	83 c4 10             	add    $0x10,%esp
     d60:	39 df                	cmp    %ebx,%edi
     d62:	75 e4                	jne    d48 <printint+0x68>
    putc(fd, buf[i]);
}
     d64:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d67:	5b                   	pop    %ebx
     d68:	5e                   	pop    %esi
     d69:	5f                   	pop    %edi
     d6a:	5d                   	pop    %ebp
     d6b:	c3                   	ret    
     d6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     d70:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     d72:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     d79:	eb 8b                	jmp    d06 <printint+0x26>
     d7b:	90                   	nop
     d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d80 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d86:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d89:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d8c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     d8f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     d92:	89 45 d0             	mov    %eax,-0x30(%ebp)
     d95:	0f b6 1e             	movzbl (%esi),%ebx
     d98:	83 c6 01             	add    $0x1,%esi
     d9b:	84 db                	test   %bl,%bl
     d9d:	0f 84 b0 00 00 00    	je     e53 <printf+0xd3>
     da3:	31 d2                	xor    %edx,%edx
     da5:	eb 39                	jmp    de0 <printf+0x60>
     da7:	89 f6                	mov    %esi,%esi
     da9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     db0:	83 f8 25             	cmp    $0x25,%eax
     db3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     db6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     dbb:	74 18                	je     dd5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     dbd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     dc0:	83 ec 04             	sub    $0x4,%esp
     dc3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     dc6:	6a 01                	push   $0x1
     dc8:	50                   	push   %eax
     dc9:	57                   	push   %edi
     dca:	e8 63 fe ff ff       	call   c32 <write>
     dcf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     dd2:	83 c4 10             	add    $0x10,%esp
     dd5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     dd8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     ddc:	84 db                	test   %bl,%bl
     dde:	74 73                	je     e53 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     de0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     de2:	0f be cb             	movsbl %bl,%ecx
     de5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     de8:	74 c6                	je     db0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     dea:	83 fa 25             	cmp    $0x25,%edx
     ded:	75 e6                	jne    dd5 <printf+0x55>
      if(c == 'd'){
     def:	83 f8 64             	cmp    $0x64,%eax
     df2:	0f 84 f8 00 00 00    	je     ef0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     df8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     dfe:	83 f9 70             	cmp    $0x70,%ecx
     e01:	74 5d                	je     e60 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     e03:	83 f8 73             	cmp    $0x73,%eax
     e06:	0f 84 84 00 00 00    	je     e90 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     e0c:	83 f8 63             	cmp    $0x63,%eax
     e0f:	0f 84 ea 00 00 00    	je     eff <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     e15:	83 f8 25             	cmp    $0x25,%eax
     e18:	0f 84 c2 00 00 00    	je     ee0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e1e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     e21:	83 ec 04             	sub    $0x4,%esp
     e24:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     e28:	6a 01                	push   $0x1
     e2a:	50                   	push   %eax
     e2b:	57                   	push   %edi
     e2c:	e8 01 fe ff ff       	call   c32 <write>
     e31:	83 c4 0c             	add    $0xc,%esp
     e34:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     e37:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     e3a:	6a 01                	push   $0x1
     e3c:	50                   	push   %eax
     e3d:	57                   	push   %edi
     e3e:	83 c6 01             	add    $0x1,%esi
     e41:	e8 ec fd ff ff       	call   c32 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e46:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e4a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     e4d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e4f:	84 db                	test   %bl,%bl
     e51:	75 8d                	jne    de0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     e53:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e56:	5b                   	pop    %ebx
     e57:	5e                   	pop    %esi
     e58:	5f                   	pop    %edi
     e59:	5d                   	pop    %ebp
     e5a:	c3                   	ret    
     e5b:	90                   	nop
     e5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     e60:	83 ec 0c             	sub    $0xc,%esp
     e63:	b9 10 00 00 00       	mov    $0x10,%ecx
     e68:	6a 00                	push   $0x0
     e6a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     e6d:	89 f8                	mov    %edi,%eax
     e6f:	8b 13                	mov    (%ebx),%edx
     e71:	e8 6a fe ff ff       	call   ce0 <printint>
        ap++;
     e76:	89 d8                	mov    %ebx,%eax
     e78:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     e7b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     e7d:	83 c0 04             	add    $0x4,%eax
     e80:	89 45 d0             	mov    %eax,-0x30(%ebp)
     e83:	e9 4d ff ff ff       	jmp    dd5 <printf+0x55>
     e88:	90                   	nop
     e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     e90:	8b 45 d0             	mov    -0x30(%ebp),%eax
     e93:	8b 18                	mov    (%eax),%ebx
        ap++;
     e95:	83 c0 04             	add    $0x4,%eax
     e98:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     e9b:	b8 80 13 00 00       	mov    $0x1380,%eax
     ea0:	85 db                	test   %ebx,%ebx
     ea2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     ea5:	0f b6 03             	movzbl (%ebx),%eax
     ea8:	84 c0                	test   %al,%al
     eaa:	74 23                	je     ecf <printf+0x14f>
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eb0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     eb3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     eb6:	83 ec 04             	sub    $0x4,%esp
     eb9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     ebb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ebe:	50                   	push   %eax
     ebf:	57                   	push   %edi
     ec0:	e8 6d fd ff ff       	call   c32 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     ec5:	0f b6 03             	movzbl (%ebx),%eax
     ec8:	83 c4 10             	add    $0x10,%esp
     ecb:	84 c0                	test   %al,%al
     ecd:	75 e1                	jne    eb0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     ecf:	31 d2                	xor    %edx,%edx
     ed1:	e9 ff fe ff ff       	jmp    dd5 <printf+0x55>
     ed6:	8d 76 00             	lea    0x0(%esi),%esi
     ed9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ee0:	83 ec 04             	sub    $0x4,%esp
     ee3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     ee6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     ee9:	6a 01                	push   $0x1
     eeb:	e9 4c ff ff ff       	jmp    e3c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     ef0:	83 ec 0c             	sub    $0xc,%esp
     ef3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     ef8:	6a 01                	push   $0x1
     efa:	e9 6b ff ff ff       	jmp    e6a <printf+0xea>
     eff:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f02:	83 ec 04             	sub    $0x4,%esp
     f05:	8b 03                	mov    (%ebx),%eax
     f07:	6a 01                	push   $0x1
     f09:	88 45 e4             	mov    %al,-0x1c(%ebp)
     f0c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     f0f:	50                   	push   %eax
     f10:	57                   	push   %edi
     f11:	e8 1c fd ff ff       	call   c32 <write>
     f16:	e9 5b ff ff ff       	jmp    e76 <printf+0xf6>
     f1b:	66 90                	xchg   %ax,%ax
     f1d:	66 90                	xchg   %ax,%ax
     f1f:	90                   	nop

00000f20 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     f20:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f21:	a1 e4 18 00 00       	mov    0x18e4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     f26:	89 e5                	mov    %esp,%ebp
     f28:	57                   	push   %edi
     f29:	56                   	push   %esi
     f2a:	53                   	push   %ebx
     f2b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f2e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     f30:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f33:	39 c8                	cmp    %ecx,%eax
     f35:	73 19                	jae    f50 <free+0x30>
     f37:	89 f6                	mov    %esi,%esi
     f39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     f40:	39 d1                	cmp    %edx,%ecx
     f42:	72 1c                	jb     f60 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f44:	39 d0                	cmp    %edx,%eax
     f46:	73 18                	jae    f60 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     f48:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f4a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f4c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     f4e:	72 f0                	jb     f40 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     f50:	39 d0                	cmp    %edx,%eax
     f52:	72 f4                	jb     f48 <free+0x28>
     f54:	39 d1                	cmp    %edx,%ecx
     f56:	73 f0                	jae    f48 <free+0x28>
     f58:	90                   	nop
     f59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     f60:	8b 73 fc             	mov    -0x4(%ebx),%esi
     f63:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     f66:	39 d7                	cmp    %edx,%edi
     f68:	74 19                	je     f83 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     f6a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     f6d:	8b 50 04             	mov    0x4(%eax),%edx
     f70:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     f73:	39 f1                	cmp    %esi,%ecx
     f75:	74 23                	je     f9a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     f77:	89 08                	mov    %ecx,(%eax)
  freep = p;
     f79:	a3 e4 18 00 00       	mov    %eax,0x18e4
}
     f7e:	5b                   	pop    %ebx
     f7f:	5e                   	pop    %esi
     f80:	5f                   	pop    %edi
     f81:	5d                   	pop    %ebp
     f82:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     f83:	03 72 04             	add    0x4(%edx),%esi
     f86:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     f89:	8b 10                	mov    (%eax),%edx
     f8b:	8b 12                	mov    (%edx),%edx
     f8d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     f90:	8b 50 04             	mov    0x4(%eax),%edx
     f93:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     f96:	39 f1                	cmp    %esi,%ecx
     f98:	75 dd                	jne    f77 <free+0x57>
    p->s.size += bp->s.size;
     f9a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     f9d:	a3 e4 18 00 00       	mov    %eax,0x18e4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     fa2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     fa5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     fa8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     faa:	5b                   	pop    %ebx
     fab:	5e                   	pop    %esi
     fac:	5f                   	pop    %edi
     fad:	5d                   	pop    %ebp
     fae:	c3                   	ret    
     faf:	90                   	nop

00000fb0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	57                   	push   %edi
     fb4:	56                   	push   %esi
     fb5:	53                   	push   %ebx
     fb6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fb9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     fbc:	8b 15 e4 18 00 00    	mov    0x18e4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     fc2:	8d 78 07             	lea    0x7(%eax),%edi
     fc5:	c1 ef 03             	shr    $0x3,%edi
     fc8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     fcb:	85 d2                	test   %edx,%edx
     fcd:	0f 84 a3 00 00 00    	je     1076 <malloc+0xc6>
     fd3:	8b 02                	mov    (%edx),%eax
     fd5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     fd8:	39 cf                	cmp    %ecx,%edi
     fda:	76 74                	jbe    1050 <malloc+0xa0>
     fdc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     fe2:	be 00 10 00 00       	mov    $0x1000,%esi
     fe7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     fee:	0f 43 f7             	cmovae %edi,%esi
     ff1:	ba 00 80 00 00       	mov    $0x8000,%edx
     ff6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     ffc:	0f 46 da             	cmovbe %edx,%ebx
     fff:	eb 10                	jmp    1011 <malloc+0x61>
    1001:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1008:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    100a:	8b 48 04             	mov    0x4(%eax),%ecx
    100d:	39 cf                	cmp    %ecx,%edi
    100f:	76 3f                	jbe    1050 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1011:	39 05 e4 18 00 00    	cmp    %eax,0x18e4
    1017:	89 c2                	mov    %eax,%edx
    1019:	75 ed                	jne    1008 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    101b:	83 ec 0c             	sub    $0xc,%esp
    101e:	53                   	push   %ebx
    101f:	e8 76 fc ff ff       	call   c9a <sbrk>
  if(p == (char*)-1)
    1024:	83 c4 10             	add    $0x10,%esp
    1027:	83 f8 ff             	cmp    $0xffffffff,%eax
    102a:	74 1c                	je     1048 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    102c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    102f:	83 ec 0c             	sub    $0xc,%esp
    1032:	83 c0 08             	add    $0x8,%eax
    1035:	50                   	push   %eax
    1036:	e8 e5 fe ff ff       	call   f20 <free>
  return freep;
    103b:	8b 15 e4 18 00 00    	mov    0x18e4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1041:	83 c4 10             	add    $0x10,%esp
    1044:	85 d2                	test   %edx,%edx
    1046:	75 c0                	jne    1008 <malloc+0x58>
        return 0;
    1048:	31 c0                	xor    %eax,%eax
    104a:	eb 1c                	jmp    1068 <malloc+0xb8>
    104c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1050:	39 cf                	cmp    %ecx,%edi
    1052:	74 1c                	je     1070 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1054:	29 f9                	sub    %edi,%ecx
    1056:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1059:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    105c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    105f:	89 15 e4 18 00 00    	mov    %edx,0x18e4
      return (void*)(p + 1);
    1065:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1068:	8d 65 f4             	lea    -0xc(%ebp),%esp
    106b:	5b                   	pop    %ebx
    106c:	5e                   	pop    %esi
    106d:	5f                   	pop    %edi
    106e:	5d                   	pop    %ebp
    106f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1070:	8b 08                	mov    (%eax),%ecx
    1072:	89 0a                	mov    %ecx,(%edx)
    1074:	eb e9                	jmp    105f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1076:	c7 05 e4 18 00 00 e8 	movl   $0x18e8,0x18e4
    107d:	18 00 00 
    1080:	c7 05 e8 18 00 00 e8 	movl   $0x18e8,0x18e8
    1087:	18 00 00 
    base.s.size = 0;
    108a:	b8 e8 18 00 00       	mov    $0x18e8,%eax
    108f:	c7 05 ec 18 00 00 00 	movl   $0x0,0x18ec
    1096:	00 00 00 
    1099:	e9 3e ff ff ff       	jmp    fdc <malloc+0x2c>
    109e:	66 90                	xchg   %ax,%ax

000010a0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    10a0:	55                   	push   %ebp
    10a1:	89 e5                	mov    %esp,%ebp
    10a3:	53                   	push   %ebx
    10a4:	83 ec 04             	sub    $0x4,%esp
    10a7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    10aa:	8b 45 0c             	mov    0xc(%ebp),%eax
    10ad:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    10b0:	e8 eb f0 ff ff       	call   1a0 <bsem_alloc>
    10b5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    10b7:	e8 e4 f0 ff ff       	call   1a0 <bsem_alloc>
    10bc:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    10bf:	83 c4 04             	add    $0x4,%esp
    10c2:	5b                   	pop    %ebx
    10c3:	5d                   	pop    %ebp
    10c4:	c3                   	ret    
    10c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	83 ec 10             	sub    $0x10,%esp
    10d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    10da:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    10e1:	ff 33                	pushl  (%ebx)
    10e3:	e8 a8 f1 ff ff       	call   290 <bsem_free>
  bsem_free(csem->bsem_2_id);
    10e8:	8b 43 04             	mov    0x4(%ebx),%eax
    10eb:	83 c4 10             	add    $0x10,%esp
}
    10ee:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    10f1:	89 45 08             	mov    %eax,0x8(%ebp)
}
    10f4:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    10f5:	e9 96 f1 ff ff       	jmp    290 <bsem_free>
    10fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001100 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	83 ec 10             	sub    $0x10,%esp
    1107:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    110a:	ff 73 04             	pushl  0x4(%ebx)
    110d:	e8 0e f2 ff ff       	call   320 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1112:	58                   	pop    %eax
    1113:	ff 33                	pushl  (%ebx)
    1115:	e8 06 f2 ff ff       	call   320 <bsem_down>
  csem->value--;
    111a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    111d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1120:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1123:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1125:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1128:	7e 0e                	jle    1138 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    112a:	83 ec 0c             	sub    $0xc,%esp
    112d:	ff 73 04             	pushl  0x4(%ebx)
    1130:	e8 fb f2 ff ff       	call   430 <bsem_up>
    1135:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1138:	8b 03                	mov    (%ebx),%eax
}
    113a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    113d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1140:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1141:	e9 ea f2 ff ff       	jmp    430 <bsem_up>
    1146:	8d 76 00             	lea    0x0(%esi),%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	83 ec 10             	sub    $0x10,%esp
    1157:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    115a:	ff 33                	pushl  (%ebx)
    115c:	e8 bf f1 ff ff       	call   320 <bsem_down>
  csem->value++;
    1161:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1164:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1167:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    116a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    116d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1170:	74 0e                	je     1180 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1172:	8b 03                	mov    (%ebx),%eax
}
    1174:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1177:	89 45 08             	mov    %eax,0x8(%ebp)
}
    117a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    117b:	e9 b0 f2 ff ff       	jmp    430 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1180:	83 ec 0c             	sub    $0xc,%esp
    1183:	ff 73 04             	pushl  0x4(%ebx)
    1186:	e8 a5 f2 ff ff       	call   430 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    118b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    118d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1190:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1193:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1196:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1197:	e9 94 f2 ff ff       	jmp    430 <bsem_up>
