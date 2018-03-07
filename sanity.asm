
_sanity:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    printf(1, "Thread %d slept for %d ticks.\n",uthread_self(), item);

  }
}

int main(int argc, char *argv[]) {
       0:	b8 e0 1c 00 00       	mov    $0x1ce0,%eax
       5:	8d 76 00             	lea    0x0(%esi),%esi
  // initializing the array
  for(int i = 0 ; i < N ; i++)
  {
    queue[i] = 0;
       8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
       e:	83 c0 04             	add    $0x4,%eax
  }
}

int main(int argc, char *argv[]) {
  // initializing the array
  for(int i = 0 ; i < N ; i++)
      11:	3d 70 1e 00 00       	cmp    $0x1e70,%eax
      16:	75 f0                	jne    8 <main+0x8>
    printf(1, "Thread %d slept for %d ticks.\n",uthread_self(), item);

  }
}

int main(int argc, char *argv[]) {
      18:	8d 4c 24 04          	lea    0x4(%esp),%ecx
      1c:	83 e4 f0             	and    $0xfffffff0,%esp
      1f:	ff 71 fc             	pushl  -0x4(%ecx)
      22:	55                   	push   %ebp
      23:	89 e5                	mov    %esp,%ebp
      25:	57                   	push   %edi
      26:	56                   	push   %esi
      27:	53                   	push   %ebx
      28:	51                   	push   %ecx
      29:	83 ec 18             	sub    $0x18,%esp
  // initializing the array
  for(int i = 0 ; i < N ; i++)
  {
    queue[i] = 0;
  }
  uthread_init();
      2c:	e8 9f 0e 00 00       	call   ed0 <uthread_init>
  csem_alloc(&mutax, 1);
      31:	83 ec 08             	sub    $0x8,%esp
      34:	6a 01                	push   $0x1
      36:	68 80 27 00 00       	push   $0x2780
      3b:	e8 20 13 00 00       	call   1360 <csem_alloc>
  csem_alloc(&empty, N);
      40:	58                   	pop    %eax
      41:	5a                   	pop    %edx
      42:	6a 64                	push   $0x64
      44:	68 8c 27 00 00       	push   $0x278c
      49:	e8 12 13 00 00       	call   1360 <csem_alloc>
  csem_alloc(&full, 0);
      4e:	59                   	pop    %ecx
      4f:	5b                   	pop    %ebx
      50:	6a 00                	push   $0x0
      52:	68 c0 1c 00 00       	push   $0x1cc0
      57:	e8 04 13 00 00       	call   1360 <csem_alloc>
  int produce = uthread_create(producer, (void*)2048);
      5c:	5e                   	pop    %esi
      5d:	5f                   	pop    %edi
      5e:	68 00 08 00 00       	push   $0x800
      63:	68 00 01 00 00       	push   $0x100
      68:	e8 13 0f 00 00       	call   f80 <uthread_create>
      6d:	89 c3                	mov    %eax,%ebx
  int consumer_1 = uthread_create(consumer, (void*)2048);
      6f:	58                   	pop    %eax
      70:	5a                   	pop    %edx
      71:	68 00 08 00 00       	push   $0x800
      76:	68 f0 01 00 00       	push   $0x1f0
      7b:	e8 00 0f 00 00       	call   f80 <uthread_create>
  int consumer_2 = uthread_create(consumer, (void*)2048);
      80:	59                   	pop    %ecx
      81:	5e                   	pop    %esi
      82:	68 00 08 00 00       	push   $0x800
      87:	68 f0 01 00 00       	push   $0x1f0
  uthread_init();
  csem_alloc(&mutax, 1);
  csem_alloc(&empty, N);
  csem_alloc(&full, 0);
  int produce = uthread_create(producer, (void*)2048);
  int consumer_1 = uthread_create(consumer, (void*)2048);
      8c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int consumer_2 = uthread_create(consumer, (void*)2048);
      8f:	e8 ec 0e 00 00       	call   f80 <uthread_create>
      94:	89 c7                	mov    %eax,%edi
  int consumer_3 = uthread_create(consumer, (void*)2048);
      96:	58                   	pop    %eax
      97:	5a                   	pop    %edx
      98:	68 00 08 00 00       	push   $0x800
      9d:	68 f0 01 00 00       	push   $0x1f0
      a2:	e8 d9 0e 00 00       	call   f80 <uthread_create>

  uthread_join(consumer_1);
      a7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  csem_alloc(&empty, N);
  csem_alloc(&full, 0);
  int produce = uthread_create(producer, (void*)2048);
  int consumer_1 = uthread_create(consumer, (void*)2048);
  int consumer_2 = uthread_create(consumer, (void*)2048);
  int consumer_3 = uthread_create(consumer, (void*)2048);
      aa:	89 c6                	mov    %eax,%esi

  uthread_join(consumer_1);
      ac:	89 14 24             	mov    %edx,(%esp)
      af:	e8 8c 11 00 00       	call   1240 <uthread_join>
  uthread_join(consumer_2);
      b4:	89 3c 24             	mov    %edi,(%esp)
      b7:	e8 84 11 00 00       	call   1240 <uthread_join>
  uthread_join(consumer_3);
      bc:	89 34 24             	mov    %esi,(%esp)
      bf:	e8 7c 11 00 00       	call   1240 <uthread_join>
  uthread_join(produce);
      c4:	89 1c 24             	mov    %ebx,(%esp)
      c7:	e8 74 11 00 00       	call   1240 <uthread_join>

  free(&mutax);
      cc:	c7 04 24 80 27 00 00 	movl   $0x2780,(%esp)
      d3:	e8 38 07 00 00       	call   810 <free>
  free(&empty);
      d8:	c7 04 24 8c 27 00 00 	movl   $0x278c,(%esp)
      df:	e8 2c 07 00 00       	call   810 <free>
  free(&full);
      e4:	c7 04 24 c0 1c 00 00 	movl   $0x1cc0,(%esp)
      eb:	e8 20 07 00 00       	call   810 <free>
	exit();
      f0:	e8 0d 04 00 00       	call   502 <exit>
      f5:	66 90                	xchg   %ax,%ax
      f7:	66 90                	xchg   %ax,%ax
      f9:	66 90                	xchg   %ax,%ax
      fb:	66 90                	xchg   %ax,%ax
      fd:	66 90                	xchg   %ax,%ax
      ff:	90                   	nop

00000100 <producer>:

int out = 0;
int queue[N];

void producer(void* arg)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	57                   	push   %edi
     104:	56                   	push   %esi
     105:	53                   	push   %ebx
  int item = 0;
     106:	31 ff                	xor    %edi,%edi
  while (item < 1000)
  {
    item += 1; // producing an item
    csem_down(&empty);
    csem_down(&mutax);
    if(queue[(item-1)%100] != 0)
     108:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi

int out = 0;
int queue[N];

void producer(void* arg)
{
     10d:	83 ec 1c             	sub    $0x1c,%esp
     110:	eb 38                	jmp    14a <producer+0x4a>
     112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  	}
        printf(1, "item: %d  out : %d error! i am trying to ovride value : %d\n",item,out, queue[(item-1)%100]);
        return;
    }
    queue[(item-1)%100] = item;
    csem_up(&mutax);
     118:	83 ec 0c             	sub    $0xc,%esp
  		printf(1," %d ," , queue[i]);
  	}
        printf(1, "item: %d  out : %d error! i am trying to ovride value : %d\n",item,out, queue[(item-1)%100]);
        return;
    }
    queue[(item-1)%100] = item;
     11b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
    csem_up(&mutax);
     11e:	68 80 27 00 00       	push   $0x2780
  		printf(1," %d ," , queue[i]);
  	}
        printf(1, "item: %d  out : %d error! i am trying to ovride value : %d\n",item,out, queue[(item-1)%100]);
        return;
    }
    queue[(item-1)%100] = item;
     123:	89 3c 9d e0 1c 00 00 	mov    %edi,0x1ce0(,%ebx,4)
    csem_up(&mutax);
     12a:	e8 e1 12 00 00       	call   1410 <csem_up>
    csem_up(&full);
     12f:	c7 04 24 c0 1c 00 00 	movl   $0x1cc0,(%esp)
     136:	e8 d5 12 00 00       	call   1410 <csem_up>
int queue[N];

void producer(void* arg)
{
  int item = 0;
  while (item < 1000)
     13b:	83 c4 10             	add    $0x10,%esp
     13e:	81 ff e8 03 00 00    	cmp    $0x3e8,%edi
     144:	0f 84 93 00 00 00    	je     1dd <producer+0xdd>
  {
    item += 1; // producing an item
    csem_down(&empty);
     14a:	83 ec 0c             	sub    $0xc,%esp
void producer(void* arg)
{
  int item = 0;
  while (item < 1000)
  {
    item += 1; // producing an item
     14d:	8d 47 01             	lea    0x1(%edi),%eax
    csem_down(&empty);
     150:	68 8c 27 00 00       	push   $0x278c
void producer(void* arg)
{
  int item = 0;
  while (item < 1000)
  {
    item += 1; // producing an item
     155:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    csem_down(&empty);
     158:	e8 63 12 00 00       	call   13c0 <csem_down>
    csem_down(&mutax);
     15d:	c7 04 24 80 27 00 00 	movl   $0x2780,(%esp)
     164:	e8 57 12 00 00       	call   13c0 <csem_down>
    if(queue[(item-1)%100] != 0)
     169:	89 f8                	mov    %edi,%eax
     16b:	83 c4 10             	add    $0x10,%esp
     16e:	f7 ee                	imul   %esi
     170:	89 f8                	mov    %edi,%eax
     172:	c1 f8 1f             	sar    $0x1f,%eax
     175:	c1 fa 05             	sar    $0x5,%edx
     178:	29 c2                	sub    %eax,%edx
     17a:	6b da 64             	imul   $0x64,%edx,%ebx
     17d:	29 df                	sub    %ebx,%edi
     17f:	8b 04 bd e0 1c 00 00 	mov    0x1ce0(,%edi,4),%eax
     186:	89 fb                	mov    %edi,%ebx
     188:	85 c0                	test   %eax,%eax
     18a:	74 8c                	je     118 <producer+0x18>
     18c:	bf e0 1c 00 00       	mov    $0x1ce0,%edi
     191:	be 70 1e 00 00       	mov    $0x1e70,%esi
     196:	8d 76 00             	lea    0x0(%esi),%esi
     199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    {
      for(int i = 0 ; i<N ; i++){
  		printf(1," %d ," , queue[i]);
     1a0:	83 ec 04             	sub    $0x4,%esp
     1a3:	ff 37                	pushl  (%edi)
     1a5:	83 c7 04             	add    $0x4,%edi
     1a8:	68 5c 14 00 00       	push   $0x145c
     1ad:	6a 01                	push   $0x1
     1af:	e8 bc 04 00 00       	call   670 <printf>
    item += 1; // producing an item
    csem_down(&empty);
    csem_down(&mutax);
    if(queue[(item-1)%100] != 0)
    {
      for(int i = 0 ; i<N ; i++){
     1b4:	83 c4 10             	add    $0x10,%esp
     1b7:	39 fe                	cmp    %edi,%esi
     1b9:	75 e5                	jne    1a0 <producer+0xa0>
  		printf(1," %d ," , queue[i]);
  	}
        printf(1, "item: %d  out : %d error! i am trying to ovride value : %d\n",item,out, queue[(item-1)%100]);
     1bb:	83 ec 0c             	sub    $0xc,%esp
     1be:	ff 34 9d e0 1c 00 00 	pushl  0x1ce0(,%ebx,4)
     1c5:	ff 35 a0 1c 00 00    	pushl  0x1ca0
     1cb:	ff 75 e4             	pushl  -0x1c(%ebp)
     1ce:	68 64 14 00 00       	push   $0x1464
     1d3:	6a 01                	push   $0x1
     1d5:	e8 96 04 00 00       	call   670 <printf>
        return;
     1da:	83 c4 20             	add    $0x20,%esp
    }
    queue[(item-1)%100] = item;
    csem_up(&mutax);
    csem_up(&full);
  }
}
     1dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1e0:	5b                   	pop    %ebx
     1e1:	5e                   	pop    %esi
     1e2:	5f                   	pop    %edi
     1e3:	5d                   	pop    %ebp
     1e4:	c3                   	ret    
     1e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     1e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001f0 <consumer>:

void consumer(void *arg)
{
  int item = 0;
  while (out < 1000)
     1f0:	81 3d a0 1c 00 00 e7 	cmpl   $0x3e7,0x1ca0
     1f7:	03 00 00 
     1fa:	0f 8f b7 00 00 00    	jg     2b7 <consumer+0xc7>
    csem_up(&full);
  }
}

void consumer(void *arg)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	56                   	push   %esi
     204:	53                   	push   %ebx
     205:	be 1f 85 eb 51       	mov    $0x51eb851f,%esi
     20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  int item = 0;
  while (out < 1000)
  {
    csem_down(&full);
     210:	83 ec 0c             	sub    $0xc,%esp
     213:	68 c0 1c 00 00       	push   $0x1cc0
     218:	e8 a3 11 00 00       	call   13c0 <csem_down>
    csem_down(&mutax);
     21d:	c7 04 24 80 27 00 00 	movl   $0x2780,(%esp)
     224:	e8 97 11 00 00       	call   13c0 <csem_down>
    item = queue[out%100];
     229:	8b 0d a0 1c 00 00    	mov    0x1ca0,%ecx
    queue[out%100] = 0;
    if(out <= 1000)
     22f:	83 c4 10             	add    $0x10,%esp
  int item = 0;
  while (out < 1000)
  {
    csem_down(&full);
    csem_down(&mutax);
    item = queue[out%100];
     232:	89 c8                	mov    %ecx,%eax
     234:	f7 ee                	imul   %esi
     236:	89 c8                	mov    %ecx,%eax
     238:	c1 f8 1f             	sar    $0x1f,%eax
     23b:	c1 fa 05             	sar    $0x5,%edx
     23e:	29 c2                	sub    %eax,%edx
     240:	89 c8                	mov    %ecx,%eax
     242:	6b d2 64             	imul   $0x64,%edx,%edx
     245:	29 d0                	sub    %edx,%eax
    queue[out%100] = 0;
    if(out <= 1000)
     247:	81 f9 e8 03 00 00    	cmp    $0x3e8,%ecx
  int item = 0;
  while (out < 1000)
  {
    csem_down(&full);
    csem_down(&mutax);
    item = queue[out%100];
     24d:	8b 1c 85 e0 1c 00 00 	mov    0x1ce0(,%eax,4),%ebx
    queue[out%100] = 0;
     254:	c7 04 85 e0 1c 00 00 	movl   $0x0,0x1ce0(,%eax,4)
     25b:	00 00 00 00 
    if(out <= 1000)
     25f:	7f 09                	jg     26a <consumer+0x7a>
    {
        out++;
     261:	83 c1 01             	add    $0x1,%ecx
     264:	89 0d a0 1c 00 00    	mov    %ecx,0x1ca0
    }
    csem_up(&mutax);
     26a:	83 ec 0c             	sub    $0xc,%esp
     26d:	68 80 27 00 00       	push   $0x2780
     272:	e8 99 11 00 00       	call   1410 <csem_up>
    csem_up(&empty);
     277:	c7 04 24 8c 27 00 00 	movl   $0x278c,(%esp)
     27e:	e8 8d 11 00 00       	call   1410 <csem_up>
    uthread_sleep(item);
     283:	89 1c 24             	mov    %ebx,(%esp)
     286:	e8 85 10 00 00       	call   1310 <uthread_sleep>
    printf(1, "Thread %d slept for %d ticks.\n",uthread_self(), item);
     28b:	e8 90 0f 00 00       	call   1220 <uthread_self>
     290:	53                   	push   %ebx
     291:	50                   	push   %eax
     292:	68 a0 14 00 00       	push   $0x14a0
     297:	6a 01                	push   $0x1
     299:	e8 d2 03 00 00       	call   670 <printf>
}

void consumer(void *arg)
{
  int item = 0;
  while (out < 1000)
     29e:	83 c4 20             	add    $0x20,%esp
     2a1:	81 3d a0 1c 00 00 e7 	cmpl   $0x3e7,0x1ca0
     2a8:	03 00 00 
     2ab:	0f 8e 5f ff ff ff    	jle    210 <consumer+0x20>
    csem_up(&empty);
    uthread_sleep(item);
    printf(1, "Thread %d slept for %d ticks.\n",uthread_self(), item);

  }
}
     2b1:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2b4:	5b                   	pop    %ebx
     2b5:	5e                   	pop    %esi
     2b6:	5d                   	pop    %ebp
     2b7:	f3 c3                	repz ret 
     2b9:	66 90                	xchg   %ax,%ax
     2bb:	66 90                	xchg   %ax,%ax
     2bd:	66 90                	xchg   %ax,%ax
     2bf:	90                   	nop

000002c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	53                   	push   %ebx
     2c4:	8b 45 08             	mov    0x8(%ebp),%eax
     2c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     2ca:	89 c2                	mov    %eax,%edx
     2cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2d0:	83 c1 01             	add    $0x1,%ecx
     2d3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     2d7:	83 c2 01             	add    $0x1,%edx
     2da:	84 db                	test   %bl,%bl
     2dc:	88 5a ff             	mov    %bl,-0x1(%edx)
     2df:	75 ef                	jne    2d0 <strcpy+0x10>
    ;
  return os;
}
     2e1:	5b                   	pop    %ebx
     2e2:	5d                   	pop    %ebp
     2e3:	c3                   	ret    
     2e4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     2ea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     2f0:	55                   	push   %ebp
     2f1:	89 e5                	mov    %esp,%ebp
     2f3:	56                   	push   %esi
     2f4:	53                   	push   %ebx
     2f5:	8b 55 08             	mov    0x8(%ebp),%edx
     2f8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     2fb:	0f b6 02             	movzbl (%edx),%eax
     2fe:	0f b6 19             	movzbl (%ecx),%ebx
     301:	84 c0                	test   %al,%al
     303:	75 1e                	jne    323 <strcmp+0x33>
     305:	eb 29                	jmp    330 <strcmp+0x40>
     307:	89 f6                	mov    %esi,%esi
     309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     310:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     313:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     316:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     319:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     31d:	84 c0                	test   %al,%al
     31f:	74 0f                	je     330 <strcmp+0x40>
     321:	89 f1                	mov    %esi,%ecx
     323:	38 d8                	cmp    %bl,%al
     325:	74 e9                	je     310 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     327:	29 d8                	sub    %ebx,%eax
}
     329:	5b                   	pop    %ebx
     32a:	5e                   	pop    %esi
     32b:	5d                   	pop    %ebp
     32c:	c3                   	ret    
     32d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     330:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     332:	29 d8                	sub    %ebx,%eax
}
     334:	5b                   	pop    %ebx
     335:	5e                   	pop    %esi
     336:	5d                   	pop    %ebp
     337:	c3                   	ret    
     338:	90                   	nop
     339:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000340 <strlen>:

uint
strlen(char *s)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     346:	80 39 00             	cmpb   $0x0,(%ecx)
     349:	74 12                	je     35d <strlen+0x1d>
     34b:	31 d2                	xor    %edx,%edx
     34d:	8d 76 00             	lea    0x0(%esi),%esi
     350:	83 c2 01             	add    $0x1,%edx
     353:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     357:	89 d0                	mov    %edx,%eax
     359:	75 f5                	jne    350 <strlen+0x10>
    ;
  return n;
}
     35b:	5d                   	pop    %ebp
     35c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     35d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     35f:	5d                   	pop    %ebp
     360:	c3                   	ret    
     361:	eb 0d                	jmp    370 <memset>
     363:	90                   	nop
     364:	90                   	nop
     365:	90                   	nop
     366:	90                   	nop
     367:	90                   	nop
     368:	90                   	nop
     369:	90                   	nop
     36a:	90                   	nop
     36b:	90                   	nop
     36c:	90                   	nop
     36d:	90                   	nop
     36e:	90                   	nop
     36f:	90                   	nop

00000370 <memset>:

void*
memset(void *dst, int c, uint n)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	57                   	push   %edi
     374:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     377:	8b 4d 10             	mov    0x10(%ebp),%ecx
     37a:	8b 45 0c             	mov    0xc(%ebp),%eax
     37d:	89 d7                	mov    %edx,%edi
     37f:	fc                   	cld    
     380:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     382:	89 d0                	mov    %edx,%eax
     384:	5f                   	pop    %edi
     385:	5d                   	pop    %ebp
     386:	c3                   	ret    
     387:	89 f6                	mov    %esi,%esi
     389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <strchr>:

char*
strchr(const char *s, char c)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	53                   	push   %ebx
     394:	8b 45 08             	mov    0x8(%ebp),%eax
     397:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     39a:	0f b6 10             	movzbl (%eax),%edx
     39d:	84 d2                	test   %dl,%dl
     39f:	74 1d                	je     3be <strchr+0x2e>
    if(*s == c)
     3a1:	38 d3                	cmp    %dl,%bl
     3a3:	89 d9                	mov    %ebx,%ecx
     3a5:	75 0d                	jne    3b4 <strchr+0x24>
     3a7:	eb 17                	jmp    3c0 <strchr+0x30>
     3a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3b0:	38 ca                	cmp    %cl,%dl
     3b2:	74 0c                	je     3c0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     3b4:	83 c0 01             	add    $0x1,%eax
     3b7:	0f b6 10             	movzbl (%eax),%edx
     3ba:	84 d2                	test   %dl,%dl
     3bc:	75 f2                	jne    3b0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     3be:	31 c0                	xor    %eax,%eax
}
     3c0:	5b                   	pop    %ebx
     3c1:	5d                   	pop    %ebp
     3c2:	c3                   	ret    
     3c3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     3c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003d0 <gets>:

char*
gets(char *buf, int max)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	57                   	push   %edi
     3d4:	56                   	push   %esi
     3d5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3d6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     3d8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     3db:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     3de:	eb 29                	jmp    409 <gets+0x39>
    cc = read(0, &c, 1);
     3e0:	83 ec 04             	sub    $0x4,%esp
     3e3:	6a 01                	push   $0x1
     3e5:	57                   	push   %edi
     3e6:	6a 00                	push   $0x0
     3e8:	e8 2d 01 00 00       	call   51a <read>
    if(cc < 1)
     3ed:	83 c4 10             	add    $0x10,%esp
     3f0:	85 c0                	test   %eax,%eax
     3f2:	7e 1d                	jle    411 <gets+0x41>
      break;
    buf[i++] = c;
     3f4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     3f8:	8b 55 08             	mov    0x8(%ebp),%edx
     3fb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     3fd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     3ff:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     403:	74 1b                	je     420 <gets+0x50>
     405:	3c 0d                	cmp    $0xd,%al
     407:	74 17                	je     420 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     409:	8d 5e 01             	lea    0x1(%esi),%ebx
     40c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     40f:	7c cf                	jl     3e0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     411:	8b 45 08             	mov    0x8(%ebp),%eax
     414:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     418:	8d 65 f4             	lea    -0xc(%ebp),%esp
     41b:	5b                   	pop    %ebx
     41c:	5e                   	pop    %esi
     41d:	5f                   	pop    %edi
     41e:	5d                   	pop    %ebp
     41f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     420:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     423:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     425:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     429:	8d 65 f4             	lea    -0xc(%ebp),%esp
     42c:	5b                   	pop    %ebx
     42d:	5e                   	pop    %esi
     42e:	5f                   	pop    %edi
     42f:	5d                   	pop    %ebp
     430:	c3                   	ret    
     431:	eb 0d                	jmp    440 <stat>
     433:	90                   	nop
     434:	90                   	nop
     435:	90                   	nop
     436:	90                   	nop
     437:	90                   	nop
     438:	90                   	nop
     439:	90                   	nop
     43a:	90                   	nop
     43b:	90                   	nop
     43c:	90                   	nop
     43d:	90                   	nop
     43e:	90                   	nop
     43f:	90                   	nop

00000440 <stat>:

int
stat(char *n, struct stat *st)
{
     440:	55                   	push   %ebp
     441:	89 e5                	mov    %esp,%ebp
     443:	56                   	push   %esi
     444:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     445:	83 ec 08             	sub    $0x8,%esp
     448:	6a 00                	push   $0x0
     44a:	ff 75 08             	pushl  0x8(%ebp)
     44d:	e8 f0 00 00 00       	call   542 <open>
  if(fd < 0)
     452:	83 c4 10             	add    $0x10,%esp
     455:	85 c0                	test   %eax,%eax
     457:	78 27                	js     480 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     459:	83 ec 08             	sub    $0x8,%esp
     45c:	ff 75 0c             	pushl  0xc(%ebp)
     45f:	89 c3                	mov    %eax,%ebx
     461:	50                   	push   %eax
     462:	e8 f3 00 00 00       	call   55a <fstat>
     467:	89 c6                	mov    %eax,%esi
  close(fd);
     469:	89 1c 24             	mov    %ebx,(%esp)
     46c:	e8 b9 00 00 00       	call   52a <close>
  return r;
     471:	83 c4 10             	add    $0x10,%esp
     474:	89 f0                	mov    %esi,%eax
}
     476:	8d 65 f8             	lea    -0x8(%ebp),%esp
     479:	5b                   	pop    %ebx
     47a:	5e                   	pop    %esi
     47b:	5d                   	pop    %ebp
     47c:	c3                   	ret    
     47d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     480:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     485:	eb ef                	jmp    476 <stat+0x36>
     487:	89 f6                	mov    %esi,%esi
     489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000490 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	53                   	push   %ebx
     494:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     497:	0f be 11             	movsbl (%ecx),%edx
     49a:	8d 42 d0             	lea    -0x30(%edx),%eax
     49d:	3c 09                	cmp    $0x9,%al
     49f:	b8 00 00 00 00       	mov    $0x0,%eax
     4a4:	77 1f                	ja     4c5 <atoi+0x35>
     4a6:	8d 76 00             	lea    0x0(%esi),%esi
     4a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     4b0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     4b3:	83 c1 01             	add    $0x1,%ecx
     4b6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     4ba:	0f be 11             	movsbl (%ecx),%edx
     4bd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     4c0:	80 fb 09             	cmp    $0x9,%bl
     4c3:	76 eb                	jbe    4b0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     4c5:	5b                   	pop    %ebx
     4c6:	5d                   	pop    %ebp
     4c7:	c3                   	ret    
     4c8:	90                   	nop
     4c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000004d0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     4d0:	55                   	push   %ebp
     4d1:	89 e5                	mov    %esp,%ebp
     4d3:	56                   	push   %esi
     4d4:	53                   	push   %ebx
     4d5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     4d8:	8b 45 08             	mov    0x8(%ebp),%eax
     4db:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     4de:	85 db                	test   %ebx,%ebx
     4e0:	7e 14                	jle    4f6 <memmove+0x26>
     4e2:	31 d2                	xor    %edx,%edx
     4e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     4e8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     4ec:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     4ef:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     4f2:	39 da                	cmp    %ebx,%edx
     4f4:	75 f2                	jne    4e8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     4f6:	5b                   	pop    %ebx
     4f7:	5e                   	pop    %esi
     4f8:	5d                   	pop    %ebp
     4f9:	c3                   	ret    

000004fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     4fa:	b8 01 00 00 00       	mov    $0x1,%eax
     4ff:	cd 40                	int    $0x40
     501:	c3                   	ret    

00000502 <exit>:
SYSCALL(exit)
     502:	b8 02 00 00 00       	mov    $0x2,%eax
     507:	cd 40                	int    $0x40
     509:	c3                   	ret    

0000050a <wait>:
SYSCALL(wait)
     50a:	b8 03 00 00 00       	mov    $0x3,%eax
     50f:	cd 40                	int    $0x40
     511:	c3                   	ret    

00000512 <pipe>:
SYSCALL(pipe)
     512:	b8 04 00 00 00       	mov    $0x4,%eax
     517:	cd 40                	int    $0x40
     519:	c3                   	ret    

0000051a <read>:
SYSCALL(read)
     51a:	b8 05 00 00 00       	mov    $0x5,%eax
     51f:	cd 40                	int    $0x40
     521:	c3                   	ret    

00000522 <write>:
SYSCALL(write)
     522:	b8 10 00 00 00       	mov    $0x10,%eax
     527:	cd 40                	int    $0x40
     529:	c3                   	ret    

0000052a <close>:
SYSCALL(close)
     52a:	b8 15 00 00 00       	mov    $0x15,%eax
     52f:	cd 40                	int    $0x40
     531:	c3                   	ret    

00000532 <kill>:
SYSCALL(kill)
     532:	b8 06 00 00 00       	mov    $0x6,%eax
     537:	cd 40                	int    $0x40
     539:	c3                   	ret    

0000053a <exec>:
SYSCALL(exec)
     53a:	b8 07 00 00 00       	mov    $0x7,%eax
     53f:	cd 40                	int    $0x40
     541:	c3                   	ret    

00000542 <open>:
SYSCALL(open)
     542:	b8 0f 00 00 00       	mov    $0xf,%eax
     547:	cd 40                	int    $0x40
     549:	c3                   	ret    

0000054a <mknod>:
SYSCALL(mknod)
     54a:	b8 11 00 00 00       	mov    $0x11,%eax
     54f:	cd 40                	int    $0x40
     551:	c3                   	ret    

00000552 <unlink>:
SYSCALL(unlink)
     552:	b8 12 00 00 00       	mov    $0x12,%eax
     557:	cd 40                	int    $0x40
     559:	c3                   	ret    

0000055a <fstat>:
SYSCALL(fstat)
     55a:	b8 08 00 00 00       	mov    $0x8,%eax
     55f:	cd 40                	int    $0x40
     561:	c3                   	ret    

00000562 <link>:
SYSCALL(link)
     562:	b8 13 00 00 00       	mov    $0x13,%eax
     567:	cd 40                	int    $0x40
     569:	c3                   	ret    

0000056a <mkdir>:
SYSCALL(mkdir)
     56a:	b8 14 00 00 00       	mov    $0x14,%eax
     56f:	cd 40                	int    $0x40
     571:	c3                   	ret    

00000572 <chdir>:
SYSCALL(chdir)
     572:	b8 09 00 00 00       	mov    $0x9,%eax
     577:	cd 40                	int    $0x40
     579:	c3                   	ret    

0000057a <dup>:
SYSCALL(dup)
     57a:	b8 0a 00 00 00       	mov    $0xa,%eax
     57f:	cd 40                	int    $0x40
     581:	c3                   	ret    

00000582 <getpid>:
SYSCALL(getpid)
     582:	b8 0b 00 00 00       	mov    $0xb,%eax
     587:	cd 40                	int    $0x40
     589:	c3                   	ret    

0000058a <sbrk>:
SYSCALL(sbrk)
     58a:	b8 0c 00 00 00       	mov    $0xc,%eax
     58f:	cd 40                	int    $0x40
     591:	c3                   	ret    

00000592 <sleep>:
SYSCALL(sleep)
     592:	b8 0d 00 00 00       	mov    $0xd,%eax
     597:	cd 40                	int    $0x40
     599:	c3                   	ret    

0000059a <uptime>:
SYSCALL(uptime)
     59a:	b8 0e 00 00 00       	mov    $0xe,%eax
     59f:	cd 40                	int    $0x40
     5a1:	c3                   	ret    

000005a2 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     5a2:	b8 16 00 00 00       	mov    $0x16,%eax
     5a7:	cd 40                	int    $0x40
     5a9:	c3                   	ret    

000005aa <sigsend>:
SYSCALL(sigsend)
     5aa:	b8 17 00 00 00       	mov    $0x17,%eax
     5af:	cd 40                	int    $0x40
     5b1:	c3                   	ret    

000005b2 <sigreturn>:
SYSCALL(sigreturn)
     5b2:	b8 18 00 00 00       	mov    $0x18,%eax
     5b7:	cd 40                	int    $0x40
     5b9:	c3                   	ret    

000005ba <alarm>:
SYSCALL(alarm)
     5ba:	b8 19 00 00 00       	mov    $0x19,%eax
     5bf:	cd 40                	int    $0x40
     5c1:	c3                   	ret    
     5c2:	66 90                	xchg   %ax,%ax
     5c4:	66 90                	xchg   %ax,%ax
     5c6:	66 90                	xchg   %ax,%ax
     5c8:	66 90                	xchg   %ax,%ax
     5ca:	66 90                	xchg   %ax,%ax
     5cc:	66 90                	xchg   %ax,%ax
     5ce:	66 90                	xchg   %ax,%ax

000005d0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     5d0:	55                   	push   %ebp
     5d1:	89 e5                	mov    %esp,%ebp
     5d3:	57                   	push   %edi
     5d4:	56                   	push   %esi
     5d5:	53                   	push   %ebx
     5d6:	89 c6                	mov    %eax,%esi
     5d8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
     5de:	85 db                	test   %ebx,%ebx
     5e0:	74 7e                	je     660 <printint+0x90>
     5e2:	89 d0                	mov    %edx,%eax
     5e4:	c1 e8 1f             	shr    $0x1f,%eax
     5e7:	84 c0                	test   %al,%al
     5e9:	74 75                	je     660 <printint+0x90>
    neg = 1;
    x = -xx;
     5eb:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     5ed:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     5f4:	f7 d8                	neg    %eax
     5f6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     5f9:	31 ff                	xor    %edi,%edi
     5fb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     5fe:	89 ce                	mov    %ecx,%esi
     600:	eb 08                	jmp    60a <printint+0x3a>
     602:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     608:	89 cf                	mov    %ecx,%edi
     60a:	31 d2                	xor    %edx,%edx
     60c:	8d 4f 01             	lea    0x1(%edi),%ecx
     60f:	f7 f6                	div    %esi
     611:	0f b6 92 c8 14 00 00 	movzbl 0x14c8(%edx),%edx
  }while((x /= base) != 0);
     618:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     61a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     61d:	75 e9                	jne    608 <printint+0x38>
  if(neg)
     61f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     622:	8b 75 c0             	mov    -0x40(%ebp),%esi
     625:	85 c0                	test   %eax,%eax
     627:	74 08                	je     631 <printint+0x61>
    buf[i++] = '-';
     629:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     62e:	8d 4f 02             	lea    0x2(%edi),%ecx
     631:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     635:	8d 76 00             	lea    0x0(%esi),%esi
     638:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     63b:	83 ec 04             	sub    $0x4,%esp
     63e:	83 ef 01             	sub    $0x1,%edi
     641:	6a 01                	push   $0x1
     643:	53                   	push   %ebx
     644:	56                   	push   %esi
     645:	88 45 d7             	mov    %al,-0x29(%ebp)
     648:	e8 d5 fe ff ff       	call   522 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     64d:	83 c4 10             	add    $0x10,%esp
     650:	39 df                	cmp    %ebx,%edi
     652:	75 e4                	jne    638 <printint+0x68>
    putc(fd, buf[i]);
}
     654:	8d 65 f4             	lea    -0xc(%ebp),%esp
     657:	5b                   	pop    %ebx
     658:	5e                   	pop    %esi
     659:	5f                   	pop    %edi
     65a:	5d                   	pop    %ebp
     65b:	c3                   	ret    
     65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     660:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     662:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     669:	eb 8b                	jmp    5f6 <printint+0x26>
     66b:	90                   	nop
     66c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000670 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     670:	55                   	push   %ebp
     671:	89 e5                	mov    %esp,%ebp
     673:	57                   	push   %edi
     674:	56                   	push   %esi
     675:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     676:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     679:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     67c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     67f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     682:	89 45 d0             	mov    %eax,-0x30(%ebp)
     685:	0f b6 1e             	movzbl (%esi),%ebx
     688:	83 c6 01             	add    $0x1,%esi
     68b:	84 db                	test   %bl,%bl
     68d:	0f 84 b0 00 00 00    	je     743 <printf+0xd3>
     693:	31 d2                	xor    %edx,%edx
     695:	eb 39                	jmp    6d0 <printf+0x60>
     697:	89 f6                	mov    %esi,%esi
     699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     6a0:	83 f8 25             	cmp    $0x25,%eax
     6a3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     6a6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     6ab:	74 18                	je     6c5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     6ad:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     6b0:	83 ec 04             	sub    $0x4,%esp
     6b3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     6b6:	6a 01                	push   $0x1
     6b8:	50                   	push   %eax
     6b9:	57                   	push   %edi
     6ba:	e8 63 fe ff ff       	call   522 <write>
     6bf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     6c2:	83 c4 10             	add    $0x10,%esp
     6c5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6c8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     6cc:	84 db                	test   %bl,%bl
     6ce:	74 73                	je     743 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     6d0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     6d2:	0f be cb             	movsbl %bl,%ecx
     6d5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     6d8:	74 c6                	je     6a0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     6da:	83 fa 25             	cmp    $0x25,%edx
     6dd:	75 e6                	jne    6c5 <printf+0x55>
      if(c == 'd'){
     6df:	83 f8 64             	cmp    $0x64,%eax
     6e2:	0f 84 f8 00 00 00    	je     7e0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     6e8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     6ee:	83 f9 70             	cmp    $0x70,%ecx
     6f1:	74 5d                	je     750 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     6f3:	83 f8 73             	cmp    $0x73,%eax
     6f6:	0f 84 84 00 00 00    	je     780 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     6fc:	83 f8 63             	cmp    $0x63,%eax
     6ff:	0f 84 ea 00 00 00    	je     7ef <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     705:	83 f8 25             	cmp    $0x25,%eax
     708:	0f 84 c2 00 00 00    	je     7d0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     70e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     711:	83 ec 04             	sub    $0x4,%esp
     714:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     718:	6a 01                	push   $0x1
     71a:	50                   	push   %eax
     71b:	57                   	push   %edi
     71c:	e8 01 fe ff ff       	call   522 <write>
     721:	83 c4 0c             	add    $0xc,%esp
     724:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     727:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     72a:	6a 01                	push   $0x1
     72c:	50                   	push   %eax
     72d:	57                   	push   %edi
     72e:	83 c6 01             	add    $0x1,%esi
     731:	e8 ec fd ff ff       	call   522 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     736:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     73a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     73d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     73f:	84 db                	test   %bl,%bl
     741:	75 8d                	jne    6d0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     743:	8d 65 f4             	lea    -0xc(%ebp),%esp
     746:	5b                   	pop    %ebx
     747:	5e                   	pop    %esi
     748:	5f                   	pop    %edi
     749:	5d                   	pop    %ebp
     74a:	c3                   	ret    
     74b:	90                   	nop
     74c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     750:	83 ec 0c             	sub    $0xc,%esp
     753:	b9 10 00 00 00       	mov    $0x10,%ecx
     758:	6a 00                	push   $0x0
     75a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     75d:	89 f8                	mov    %edi,%eax
     75f:	8b 13                	mov    (%ebx),%edx
     761:	e8 6a fe ff ff       	call   5d0 <printint>
        ap++;
     766:	89 d8                	mov    %ebx,%eax
     768:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     76b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     76d:	83 c0 04             	add    $0x4,%eax
     770:	89 45 d0             	mov    %eax,-0x30(%ebp)
     773:	e9 4d ff ff ff       	jmp    6c5 <printf+0x55>
     778:	90                   	nop
     779:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     780:	8b 45 d0             	mov    -0x30(%ebp),%eax
     783:	8b 18                	mov    (%eax),%ebx
        ap++;
     785:	83 c0 04             	add    $0x4,%eax
     788:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     78b:	b8 bf 14 00 00       	mov    $0x14bf,%eax
     790:	85 db                	test   %ebx,%ebx
     792:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     795:	0f b6 03             	movzbl (%ebx),%eax
     798:	84 c0                	test   %al,%al
     79a:	74 23                	je     7bf <printf+0x14f>
     79c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     7a0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     7a3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     7a6:	83 ec 04             	sub    $0x4,%esp
     7a9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     7ab:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     7ae:	50                   	push   %eax
     7af:	57                   	push   %edi
     7b0:	e8 6d fd ff ff       	call   522 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     7b5:	0f b6 03             	movzbl (%ebx),%eax
     7b8:	83 c4 10             	add    $0x10,%esp
     7bb:	84 c0                	test   %al,%al
     7bd:	75 e1                	jne    7a0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     7bf:	31 d2                	xor    %edx,%edx
     7c1:	e9 ff fe ff ff       	jmp    6c5 <printf+0x55>
     7c6:	8d 76 00             	lea    0x0(%esi),%esi
     7c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     7d0:	83 ec 04             	sub    $0x4,%esp
     7d3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     7d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     7d9:	6a 01                	push   $0x1
     7db:	e9 4c ff ff ff       	jmp    72c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     7e0:	83 ec 0c             	sub    $0xc,%esp
     7e3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     7e8:	6a 01                	push   $0x1
     7ea:	e9 6b ff ff ff       	jmp    75a <printf+0xea>
     7ef:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     7f2:	83 ec 04             	sub    $0x4,%esp
     7f5:	8b 03                	mov    (%ebx),%eax
     7f7:	6a 01                	push   $0x1
     7f9:	88 45 e4             	mov    %al,-0x1c(%ebp)
     7fc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7ff:	50                   	push   %eax
     800:	57                   	push   %edi
     801:	e8 1c fd ff ff       	call   522 <write>
     806:	e9 5b ff ff ff       	jmp    766 <printf+0xf6>
     80b:	66 90                	xchg   %ax,%ax
     80d:	66 90                	xchg   %ax,%ax
     80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     810:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     811:	a1 a4 1c 00 00       	mov    0x1ca4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     816:	89 e5                	mov    %esp,%ebp
     818:	57                   	push   %edi
     819:	56                   	push   %esi
     81a:	53                   	push   %ebx
     81b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     81e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     820:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     823:	39 c8                	cmp    %ecx,%eax
     825:	73 19                	jae    840 <free+0x30>
     827:	89 f6                	mov    %esi,%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     830:	39 d1                	cmp    %edx,%ecx
     832:	72 1c                	jb     850 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     834:	39 d0                	cmp    %edx,%eax
     836:	73 18                	jae    850 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     838:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     83a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     83c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     83e:	72 f0                	jb     830 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     840:	39 d0                	cmp    %edx,%eax
     842:	72 f4                	jb     838 <free+0x28>
     844:	39 d1                	cmp    %edx,%ecx
     846:	73 f0                	jae    838 <free+0x28>
     848:	90                   	nop
     849:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     850:	8b 73 fc             	mov    -0x4(%ebx),%esi
     853:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     856:	39 d7                	cmp    %edx,%edi
     858:	74 19                	je     873 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     85a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     85d:	8b 50 04             	mov    0x4(%eax),%edx
     860:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     863:	39 f1                	cmp    %esi,%ecx
     865:	74 23                	je     88a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     867:	89 08                	mov    %ecx,(%eax)
  freep = p;
     869:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
}
     86e:	5b                   	pop    %ebx
     86f:	5e                   	pop    %esi
     870:	5f                   	pop    %edi
     871:	5d                   	pop    %ebp
     872:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     873:	03 72 04             	add    0x4(%edx),%esi
     876:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     879:	8b 10                	mov    (%eax),%edx
     87b:	8b 12                	mov    (%edx),%edx
     87d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     880:	8b 50 04             	mov    0x4(%eax),%edx
     883:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     886:	39 f1                	cmp    %esi,%ecx
     888:	75 dd                	jne    867 <free+0x57>
    p->s.size += bp->s.size;
     88a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     88d:	a3 a4 1c 00 00       	mov    %eax,0x1ca4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     892:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     895:	8b 53 f8             	mov    -0x8(%ebx),%edx
     898:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     89a:	5b                   	pop    %ebx
     89b:	5e                   	pop    %esi
     89c:	5f                   	pop    %edi
     89d:	5d                   	pop    %ebp
     89e:	c3                   	ret    
     89f:	90                   	nop

000008a0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	57                   	push   %edi
     8a4:	56                   	push   %esi
     8a5:	53                   	push   %ebx
     8a6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     8a9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     8ac:	8b 15 a4 1c 00 00    	mov    0x1ca4,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     8b2:	8d 78 07             	lea    0x7(%eax),%edi
     8b5:	c1 ef 03             	shr    $0x3,%edi
     8b8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     8bb:	85 d2                	test   %edx,%edx
     8bd:	0f 84 a3 00 00 00    	je     966 <malloc+0xc6>
     8c3:	8b 02                	mov    (%edx),%eax
     8c5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     8c8:	39 cf                	cmp    %ecx,%edi
     8ca:	76 74                	jbe    940 <malloc+0xa0>
     8cc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     8d2:	be 00 10 00 00       	mov    $0x1000,%esi
     8d7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     8de:	0f 43 f7             	cmovae %edi,%esi
     8e1:	ba 00 80 00 00       	mov    $0x8000,%edx
     8e6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     8ec:	0f 46 da             	cmovbe %edx,%ebx
     8ef:	eb 10                	jmp    901 <malloc+0x61>
     8f1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     8f8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     8fa:	8b 48 04             	mov    0x4(%eax),%ecx
     8fd:	39 cf                	cmp    %ecx,%edi
     8ff:	76 3f                	jbe    940 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     901:	39 05 a4 1c 00 00    	cmp    %eax,0x1ca4
     907:	89 c2                	mov    %eax,%edx
     909:	75 ed                	jne    8f8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     90b:	83 ec 0c             	sub    $0xc,%esp
     90e:	53                   	push   %ebx
     90f:	e8 76 fc ff ff       	call   58a <sbrk>
  if(p == (char*)-1)
     914:	83 c4 10             	add    $0x10,%esp
     917:	83 f8 ff             	cmp    $0xffffffff,%eax
     91a:	74 1c                	je     938 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     91c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     91f:	83 ec 0c             	sub    $0xc,%esp
     922:	83 c0 08             	add    $0x8,%eax
     925:	50                   	push   %eax
     926:	e8 e5 fe ff ff       	call   810 <free>
  return freep;
     92b:	8b 15 a4 1c 00 00    	mov    0x1ca4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     931:	83 c4 10             	add    $0x10,%esp
     934:	85 d2                	test   %edx,%edx
     936:	75 c0                	jne    8f8 <malloc+0x58>
        return 0;
     938:	31 c0                	xor    %eax,%eax
     93a:	eb 1c                	jmp    958 <malloc+0xb8>
     93c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     940:	39 cf                	cmp    %ecx,%edi
     942:	74 1c                	je     960 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     944:	29 f9                	sub    %edi,%ecx
     946:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     949:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     94c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     94f:	89 15 a4 1c 00 00    	mov    %edx,0x1ca4
      return (void*)(p + 1);
     955:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     958:	8d 65 f4             	lea    -0xc(%ebp),%esp
     95b:	5b                   	pop    %ebx
     95c:	5e                   	pop    %esi
     95d:	5f                   	pop    %edi
     95e:	5d                   	pop    %ebp
     95f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     960:	8b 08                	mov    (%eax),%ecx
     962:	89 0a                	mov    %ecx,(%edx)
     964:	eb e9                	jmp    94f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     966:	c7 05 a4 1c 00 00 a8 	movl   $0x1ca8,0x1ca4
     96d:	1c 00 00 
     970:	c7 05 a8 1c 00 00 a8 	movl   $0x1ca8,0x1ca8
     977:	1c 00 00 
    base.s.size = 0;
     97a:	b8 a8 1c 00 00       	mov    $0x1ca8,%eax
     97f:	c7 05 ac 1c 00 00 00 	movl   $0x0,0x1cac
     986:	00 00 00 
     989:	e9 3e ff ff ff       	jmp    8cc <malloc+0x2c>
     98e:	66 90                	xchg   %ax,%ax

00000990 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     990:	55                   	push   %ebp
     991:	89 e5                	mov    %esp,%ebp
     993:	56                   	push   %esi
     994:	53                   	push   %ebx
     995:	8b 75 0c             	mov    0xc(%ebp),%esi
     998:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     99b:	83 ec 08             	sub    $0x8,%esp
     99e:	68 dc 14 00 00       	push   $0x14dc
     9a3:	6a 01                	push   $0x1
     9a5:	e8 c6 fc ff ff       	call   670 <printf>
  alarm(UTHREAD_QUANTA);
     9aa:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     9b1:	e8 04 fc ff ff       	call   5ba <alarm>
  start_func(arg);
     9b6:	89 75 08             	mov    %esi,0x8(%ebp)
     9b9:	83 c4 10             	add    $0x10,%esp
}
     9bc:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     9bf:	89 d8                	mov    %ebx,%eax
}
     9c1:	5b                   	pop    %ebx
     9c2:	5e                   	pop    %esi
     9c3:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     9c4:	ff e0                	jmp    *%eax
     9c6:	8d 76 00             	lea    0x0(%esi),%esi
     9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	53                   	push   %ebx
     9d4:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     9d7:	6a 00                	push   $0x0
     9d9:	e8 dc fb ff ff       	call   5ba <alarm>
  printf(1,"exiting...\n");
     9de:	5a                   	pop    %edx
     9df:	59                   	pop    %ecx
     9e0:	68 4c 16 00 00       	push   $0x164c
     9e5:	6a 01                	push   $0x1
     9e7:	e8 84 fc ff ff       	call   670 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     9ec:	a1 c8 ad 00 00       	mov    0xadc8,%eax
     9f1:	83 c4 10             	add    $0x10,%esp
     9f4:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     9f7:	8b 1c 95 80 1e 00 00 	mov    0x1e80(,%edx,4),%ebx
     9fe:	85 db                	test   %ebx,%ebx
     a00:	75 0a                	jne    a0c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     a02:	c7 05 88 1e 00 00 00 	movl   $0x0,0x1e88
     a09:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     a0c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     a0f:	83 ec 0c             	sub    $0xc,%esp
     a12:	ff 34 85 84 1e 00 00 	pushl  0x1e84(,%eax,4)
     a19:	e8 f2 fd ff ff       	call   810 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     a1e:	a1 c8 ad 00 00       	mov    0xadc8,%eax
     a23:	83 c4 10             	add    $0x10,%esp
     a26:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     a29:	b8 88 1e 00 00       	mov    $0x1e88,%eax
     a2e:	c1 e2 02             	shl    $0x2,%edx
     a31:	c7 82 88 1e 00 00 00 	movl   $0x0,0x1e88(%edx)
     a38:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     a3b:	c7 82 80 1e 00 00 ff 	movl   $0xffffffff,0x1e80(%edx)
     a42:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     a45:	c7 82 8c 1e 00 00 00 	movl   $0x0,0x1e8c(%edx)
     a4c:	00 00 00 
  threads[index_currently_running].esp = 0;
     a4f:	c7 82 90 1e 00 00 00 	movl   $0x0,0x1e90(%edx)
     a56:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     a59:	c7 82 9c 1e 00 00 00 	movl   $0x0,0x1e9c(%edx)
     a60:	00 00 00 
  threads[index_currently_running].join = -1;
     a63:	c7 82 a0 1e 00 00 ff 	movl   $0xffffffff,0x1ea0(%edx)
     a6a:	ff ff ff 
     a6d:	eb 0b                	jmp    a7a <uthread_exit+0xaa>
     a6f:	90                   	nop
     a70:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     a73:	3d 88 27 00 00       	cmp    $0x2788,%eax
     a78:	74 15                	je     a8f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     a7a:	83 38 04             	cmpl   $0x4,(%eax)
     a7d:	75 f1                	jne    a70 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     a7f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     a85:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     a88:	3d 88 27 00 00       	cmp    $0x2788,%eax
     a8d:	75 eb                	jne    a7a <uthread_exit+0xaa>
     a8f:	bb ac 1e 00 00       	mov    $0x1eac,%ebx
     a94:	eb 15                	jmp    aab <uthread_exit+0xdb>
     a96:	8d 76 00             	lea    0x0(%esi),%esi
     a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     aa0:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     aa3:	81 fb 88 27 00 00    	cmp    $0x2788,%ebx
     aa9:	74 24                	je     acf <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     aab:	8b 03                	mov    (%ebx),%eax
     aad:	85 c0                	test   %eax,%eax
     aaf:	74 ef                	je     aa0 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     ab1:	e8 cc fa ff ff       	call   582 <getpid>
     ab6:	83 ec 08             	sub    $0x8,%esp
     ab9:	83 c3 24             	add    $0x24,%ebx
     abc:	6a 0e                	push   $0xe
     abe:	50                   	push   %eax
     abf:	e8 e6 fa ff ff       	call   5aa <sigsend>
     ac4:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     ac7:	81 fb 88 27 00 00    	cmp    $0x2788,%ebx
     acd:	75 dc                	jne    aab <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     acf:	e8 2e fa ff ff       	call   502 <exit>
     ad4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ada:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ae0 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     ae0:	55                   	push   %ebp
     ae1:	ba c8 28 00 00       	mov    $0x28c8,%edx
     ae6:	89 e5                	mov    %esp,%ebp
     ae8:	90                   	nop
     ae9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     af0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     af6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     b00:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     b06:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     b09:	39 d0                	cmp    %edx,%eax
     b0b:	75 f3                	jne    b00 <init_bsem+0x20>
     b0d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     b13:	81 fa c8 ae 00 00    	cmp    $0xaec8,%edx
     b19:	75 d5                	jne    af0 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     b1b:	c7 05 b0 1c 00 00 01 	movl   $0x1,0x1cb0
     b22:	00 00 00 
}
     b25:	5d                   	pop    %ebp
     b26:	c3                   	ret    
     b27:	89 f6                	mov    %esi,%esi
     b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b30 <bsem_alloc>:

int bsem_alloc() {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	53                   	push   %ebx
     b34:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     b37:	6a 00                	push   $0x0
     b39:	e8 7c fa ff ff       	call   5ba <alarm>
  int i;
  if(first_run_bsem == 0)
     b3e:	a1 b0 1c 00 00       	mov    0x1cb0,%eax
     b43:	83 c4 10             	add    $0x10,%esp
     b46:	85 c0                	test   %eax,%eax
     b48:	75 3b                	jne    b85 <bsem_alloc+0x55>
     b4a:	ba c8 28 00 00       	mov    $0x28c8,%edx
     b4f:	90                   	nop
     b50:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     b56:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     b5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     b60:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     b66:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     b69:	39 d0                	cmp    %edx,%eax
     b6b:	75 f3                	jne    b60 <bsem_alloc+0x30>
     b6d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     b73:	81 fa c8 ae 00 00    	cmp    $0xaec8,%edx
     b79:	75 d5                	jne    b50 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     b7b:	c7 05 b0 1c 00 00 01 	movl   $0x1,0x1cb0
     b82:	00 00 00 
     b85:	ba c8 28 00 00       	mov    $0x28c8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     b8a:	31 c0                	xor    %eax,%eax
     b8c:	eb 10                	jmp    b9e <bsem_alloc+0x6e>
     b8e:	83 c0 01             	add    $0x1,%eax
     b91:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     b97:	3d 80 00 00 00       	cmp    $0x80,%eax
     b9c:	74 4f                	je     bed <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     b9e:	83 3a 01             	cmpl   $0x1,(%edx)
     ba1:	75 eb                	jne    b8e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     ba3:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     ba9:	8b 15 80 1c 00 00    	mov    0x1c80,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     baf:	83 ec 0c             	sub    $0xc,%esp
     bb2:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     bb4:	8d 98 c0 27 00 00    	lea    0x27c0(%eax),%ebx
     bba:	89 90 c4 27 00 00    	mov    %edx,0x27c4(%eax)
    binSemCounter++;
     bc0:	83 c2 01             	add    $0x1,%edx
     bc3:	89 15 80 1c 00 00    	mov    %edx,0x1c80
    binSemaphore[i].lock = 1; // not locked
     bc9:	c7 80 c0 27 00 00 01 	movl   $0x1,0x27c0(%eax)
     bd0:	00 00 00 
    binSemaphore[i].state = USED;
     bd3:	c7 80 c8 28 00 00 00 	movl   $0x0,0x28c8(%eax)
     bda:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     bdd:	e8 d8 f9 ff ff       	call   5ba <alarm>
    return binSemaphore[i].id;
     be2:	8b 43 04             	mov    0x4(%ebx),%eax
     be5:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     be8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     beb:	c9                   	leave  
     bec:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     bed:	83 ec 08             	sub    $0x8,%esp
     bf0:	68 fc 14 00 00       	push   $0x14fc
     bf5:	6a 01                	push   $0x1
     bf7:	e8 74 fa ff ff       	call   670 <printf>
    alarm(UTHREAD_QUANTA);
     bfc:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     c03:	e8 b2 f9 ff ff       	call   5ba <alarm>
    return -1;
     c08:	83 c4 10             	add    $0x10,%esp
     c0b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     c10:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c13:	c9                   	leave  
     c14:	c3                   	ret    
     c15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c20 <bsem_free>:

void bsem_free(int id) {
     c20:	55                   	push   %ebp
     c21:	89 e5                	mov    %esp,%ebp
     c23:	53                   	push   %ebx
     c24:	83 ec 10             	sub    $0x10,%esp
     c27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     c2a:	6a 00                	push   $0x0
     c2c:	e8 89 f9 ff ff       	call   5ba <alarm>
     c31:	ba c4 27 00 00       	mov    $0x27c4,%edx
     c36:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c39:	31 c0                	xor    %eax,%eax
     c3b:	eb 13                	jmp    c50 <bsem_free+0x30>
     c3d:	8d 76 00             	lea    0x0(%esi),%esi
     c40:	83 c0 01             	add    $0x1,%eax
     c43:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     c49:	3d 80 00 00 00       	cmp    $0x80,%eax
     c4e:	74 38                	je     c88 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     c50:	39 1a                	cmp    %ebx,(%edx)
     c52:	75 ec                	jne    c40 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     c54:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c5a:	05 c0 27 00 00       	add    $0x27c0,%eax
     c5f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     c66:	74 0a                	je     c72 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     c68:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     c6f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     c72:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     c79:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c7c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     c7d:	e9 38 f9 ff ff       	jmp    5ba <alarm>
     c82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     c88:	83 ec 04             	sub    $0x4,%esp
     c8b:	53                   	push   %ebx
     c8c:	68 58 16 00 00       	push   $0x1658
     c91:	6a 01                	push   $0x1
     c93:	e8 d8 f9 ff ff       	call   670 <printf>
     c98:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     c9b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     ca2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ca5:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     ca6:	e9 0f f9 ff ff       	jmp    5ba <alarm>
     cab:	90                   	nop
     cac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000cb0 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	53                   	push   %ebx
     cb4:	83 ec 10             	sub    $0x10,%esp
     cb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     cba:	6a 00                	push   $0x0
     cbc:	e8 f9 f8 ff ff       	call   5ba <alarm>
     cc1:	b8 c4 27 00 00       	mov    $0x27c4,%eax
     cc6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     cc9:	31 d2                	xor    %edx,%edx
     ccb:	eb 17                	jmp    ce4 <bsem_down+0x34>
     ccd:	8d 76 00             	lea    0x0(%esi),%esi
     cd0:	83 c2 01             	add    $0x1,%edx
     cd3:	05 0c 01 00 00       	add    $0x10c,%eax
     cd8:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     cde:	0f 84 8c 00 00 00    	je     d70 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     ce4:	39 18                	cmp    %ebx,(%eax)
     ce6:	75 e8                	jne    cd0 <bsem_down+0x20>
     ce8:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     cee:	85 c9                	test   %ecx,%ecx
     cf0:	75 de                	jne    cd0 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     cf2:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     cf8:	31 c0                	xor    %eax,%eax
     cfa:	83 b9 c0 27 00 00 01 	cmpl   $0x1,0x27c0(%ecx)
     d01:	75 15                	jne    d18 <bsem_down+0x68>
     d03:	e9 93 00 00 00       	jmp    d9b <bsem_down+0xeb>
     d08:	90                   	nop
     d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     d10:	83 c0 01             	add    $0x1,%eax
     d13:	83 f8 40             	cmp    $0x40,%eax
     d16:	74 7b                	je     d93 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     d18:	83 bc 81 c8 27 00 00 	cmpl   $0xffffffff,0x27c8(%ecx,%eax,4)
     d1f:	ff 
     d20:	75 ee                	jne    d10 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     d22:	8b 0d c8 ad 00 00    	mov    0xadc8,%ecx
     d28:	6b d2 43             	imul   $0x43,%edx,%edx
     d2b:	01 c2                	add    %eax,%edx
     d2d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     d30:	8b 04 85 80 1e 00 00 	mov    0x1e80(,%eax,4),%eax
     d37:	89 04 95 c8 27 00 00 	mov    %eax,0x27c8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     d3e:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     d41:	c7 04 85 88 1e 00 00 	movl   $0x4,0x1e88(,%eax,4)
     d48:	04 00 00 00 

	 sigsend(getpid(),14);
     d4c:	e8 31 f8 ff ff       	call   582 <getpid>
     d51:	83 ec 08             	sub    $0x8,%esp
     d54:	6a 0e                	push   $0xe
     d56:	50                   	push   %eax
     d57:	e8 4e f8 ff ff       	call   5aa <sigsend>
     d5c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     d5f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     d66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d69:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     d6a:	e9 4b f8 ff ff       	jmp    5ba <alarm>
     d6f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     d70:	83 ec 04             	sub    $0x4,%esp
     d73:	53                   	push   %ebx
     d74:	68 1c 15 00 00       	push   $0x151c
     d79:	6a 01                	push   $0x1
     d7b:	e8 f0 f8 ff ff       	call   670 <printf>
     d80:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     d83:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     d8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d8d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     d8e:	e9 27 f8 ff ff       	jmp    5ba <alarm>
     d93:	8b 0d c8 ad 00 00    	mov    0xadc8,%ecx
     d99:	eb a3                	jmp    d3e <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     d9b:	c7 81 c0 27 00 00 00 	movl   $0x0,0x27c0(%ecx)
     da2:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     da5:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     dac:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     daf:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     db0:	e9 05 f8 ff ff       	jmp    5ba <alarm>
     db5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000dc0 <bsem_up>:
}

void bsem_up(int id) {
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	57                   	push   %edi
     dc4:	56                   	push   %esi
     dc5:	53                   	push   %ebx
     dc6:	83 ec 28             	sub    $0x28,%esp
     dc9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     dcc:	6a 00                	push   $0x0
     dce:	e8 e7 f7 ff ff       	call   5ba <alarm>
     dd3:	ba c4 27 00 00       	mov    $0x27c4,%edx
     dd8:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     ddb:	31 c0                	xor    %eax,%eax
     ddd:	eb 15                	jmp    df4 <bsem_up+0x34>
     ddf:	90                   	nop
     de0:	83 c0 01             	add    $0x1,%eax
     de3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     de9:	3d 80 00 00 00       	cmp    $0x80,%eax
     dee:	0f 84 ac 00 00 00    	je     ea0 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     df4:	39 1a                	cmp    %ebx,(%edx)
     df6:	75 e8                	jne    de0 <bsem_up+0x20>
     df8:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     dfe:	85 c9                	test   %ecx,%ecx
     e00:	75 de                	jne    de0 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     e02:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     e08:	8b 97 c0 27 00 00    	mov    0x27c0(%edi),%edx
     e0e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e11:	85 d2                	test   %edx,%edx
     e13:	0f 85 9c 00 00 00    	jne    eb5 <bsem_up+0xf5>
     e19:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     e1b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     e1e:	8b b4 be c8 27 00 00 	mov    0x27c8(%esi,%edi,4),%esi
     e25:	83 fe ff             	cmp    $0xffffffff,%esi
     e28:	74 56                	je     e80 <bsem_up+0xc0>
     e2a:	b9 80 1e 00 00       	mov    $0x1e80,%ecx
     e2f:	31 d2                	xor    %edx,%edx
     e31:	eb 10                	jmp    e43 <bsem_up+0x83>
     e33:	90                   	nop
     e34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     e38:	83 c2 01             	add    $0x1,%edx
     e3b:	83 c1 24             	add    $0x24,%ecx
     e3e:	83 fa 40             	cmp    $0x40,%edx
     e41:	74 3d                	je     e80 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     e43:	8b 19                	mov    (%ecx),%ebx
     e45:	39 de                	cmp    %ebx,%esi
     e47:	75 ef                	jne    e38 <bsem_up+0x78>
     e49:	83 fb ff             	cmp    $0xffffffff,%ebx
     e4c:	74 ea                	je     e38 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     e4e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     e51:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     e54:	c7 04 95 88 1e 00 00 	movl   $0x2,0x1e88(,%edx,4)
     e5b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     e5f:	01 c7                	add    %eax,%edi
     e61:	c7 04 bd c8 27 00 00 	movl   $0xffffffff,0x27c8(,%edi,4)
     e68:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     e6c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     e73:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e76:	5b                   	pop    %ebx
     e77:	5e                   	pop    %esi
     e78:	5f                   	pop    %edi
     e79:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     e7a:	e9 3b f7 ff ff       	jmp    5ba <alarm>
     e7f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     e80:	83 c7 01             	add    $0x1,%edi
     e83:	83 ff 40             	cmp    $0x40,%edi
     e86:	75 93                	jne    e1b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     e88:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     e8e:	c7 80 c0 27 00 00 01 	movl   $0x1,0x27c0(%eax)
     e95:	00 00 00 
     e98:	eb d2                	jmp    e6c <bsem_up+0xac>
     e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     ea0:	83 ec 04             	sub    $0x4,%esp
     ea3:	53                   	push   %ebx
     ea4:	68 84 15 00 00       	push   $0x1584
     ea9:	6a 01                	push   $0x1
     eab:	e8 c0 f7 ff ff       	call   670 <printf>
     eb0:	83 c4 10             	add    $0x10,%esp
     eb3:	eb b7                	jmp    e6c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     eb5:	83 ec 08             	sub    $0x8,%esp
     eb8:	68 60 15 00 00       	push   $0x1560
     ebd:	6a 01                	push   $0x1
     ebf:	e8 ac f7 ff ff       	call   670 <printf>
     ec4:	83 c4 10             	add    $0x10,%esp
     ec7:	eb a3                	jmp    e6c <bsem_up+0xac>
     ec9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000ed0 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     ed6:	68 c8 15 00 00       	push   $0x15c8
     edb:	6a 01                	push   $0x1
     edd:	e8 8e f7 ff ff       	call   670 <printf>
     ee2:	b8 80 1e 00 00       	mov    $0x1e80,%eax
     ee7:	83 c4 10             	add    $0x10,%esp
     eea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     ef0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     ef6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     efd:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     f00:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     f07:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     f0e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     f15:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     f1c:	3d 80 27 00 00       	cmp    $0x2780,%eax
     f21:	75 cd                	jne    ef0 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     f23:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     f26:	c7 05 80 1e 00 00 00 	movl   $0x0,0x1e80
     f2d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     f30:	c7 05 88 1e 00 00 03 	movl   $0x3,0x1e88
     f37:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     f3a:	68 d0 10 00 00       	push   $0x10d0
     f3f:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     f41:	c7 05 84 1e 00 00 00 	movl   $0x0,0x1e84
     f48:	00 00 00 

  id_number_thread = 1;
     f4b:	c7 05 c4 ad 00 00 01 	movl   $0x1,0xadc4
     f52:	00 00 00 
  index_currently_running = 0;
     f55:	c7 05 c8 ad 00 00 00 	movl   $0x0,0xadc8
     f5c:	00 00 00 
  currently_running = 0;
     f5f:	c7 05 a0 27 00 00 00 	movl   $0x0,0x27a0
     f66:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     f69:	e8 34 f6 ff ff       	call   5a2 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     f6e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f75:	e8 40 f6 ff ff       	call   5ba <alarm>
  return 0;
}
     f7a:	31 c0                	xor    %eax,%eax
     f7c:	c9                   	leave  
     f7d:	c3                   	ret    
     f7e:	66 90                	xchg   %ax,%ax

00000f80 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	56                   	push   %esi
     f84:	53                   	push   %ebx
  alarm(0);
     f85:	83 ec 0c             	sub    $0xc,%esp
     f88:	6a 00                	push   $0x0
     f8a:	e8 2b f6 ff ff       	call   5ba <alarm>
  printf(1, "------ creating a new thread ------\n");
     f8f:	5b                   	pop    %ebx
     f90:	5e                   	pop    %esi
     f91:	68 f4 15 00 00       	push   $0x15f4
     f96:	6a 01                	push   $0x1
     f98:	e8 d3 f6 ff ff       	call   670 <printf>
     f9d:	ba 88 1e 00 00       	mov    $0x1e88,%edx
     fa2:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     fa5:	31 c0                	xor    %eax,%eax
     fa7:	eb 12                	jmp    fbb <uthread_create+0x3b>
     fa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     fb0:	83 c0 01             	add    $0x1,%eax
     fb3:	83 c2 24             	add    $0x24,%edx
     fb6:	83 f8 40             	cmp    $0x40,%eax
     fb9:	74 7d                	je     1038 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     fbb:	8b 0a                	mov    (%edx),%ecx
     fbd:	85 c9                	test   %ecx,%ecx
     fbf:	75 ef                	jne    fb0 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     fc1:	8b 15 c4 ad 00 00    	mov    0xadc4,%edx
     fc7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     fca:	83 ec 0c             	sub    $0xc,%esp
     fcd:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     fd2:	c1 e3 02             	shl    $0x2,%ebx
     fd5:	89 93 80 1e 00 00    	mov    %edx,0x1e80(%ebx)
  id_number_thread++;
     fdb:	83 c2 01             	add    $0x1,%edx
     fde:	89 15 c4 ad 00 00    	mov    %edx,0xadc4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     fe4:	e8 b7 f8 ff ff       	call   8a0 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     fe9:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     fec:	c7 80 f4 0f 00 00 d0 	movl   $0x9d0,0xff4(%eax)
     ff3:	09 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     ff6:	89 83 84 1e 00 00    	mov    %eax,0x1e84(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     ffc:	c7 83 88 1e 00 00 02 	movl   $0x2,0x1e88(%ebx)
    1003:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1006:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
    100c:	8b 55 0c             	mov    0xc(%ebp),%edx
    100f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
    1015:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    101c:	e8 99 f5 ff ff       	call   5ba <alarm>
  return   threads[free_thread].thread_id;
    1021:	8b 83 80 1e 00 00    	mov    0x1e80(%ebx),%eax
    1027:	83 c4 10             	add    $0x10,%esp
}
    102a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    102d:	5b                   	pop    %ebx
    102e:	5e                   	pop    %esi
    102f:	5d                   	pop    %ebp
    1030:	c3                   	ret    
    1031:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    1038:	83 ec 08             	sub    $0x8,%esp
    103b:	68 6a 16 00 00       	push   $0x166a
    1040:	6a 01                	push   $0x1
    1042:	e8 29 f6 ff ff       	call   670 <printf>
    alarm(UTHREAD_QUANTA);
    1047:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    104e:	e8 67 f5 ff ff       	call   5ba <alarm>
    return -1;
    1053:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    1056:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
    1059:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    105e:	5b                   	pop    %ebx
    105f:	5e                   	pop    %esi
    1060:	5d                   	pop    %ebp
    1061:	c3                   	ret    
    1062:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001070 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
    1076:	85 c0                	test   %eax,%eax
    1078:	74 14                	je     108e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    107a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    107d:	89 e2                	mov    %esp,%edx
    107f:	8d 04 85 80 1e 00 00 	lea    0x1e80(,%eax,4),%eax
    1086:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
    1089:	89 ea                	mov    %ebp,%edx
    108b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    108e:	a1 c8 ad 00 00       	mov    0xadc8,%eax
    1093:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1096:	8d 04 85 80 1e 00 00 	lea    0x1e80(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    109d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    10a0:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    10a7:	85 d2                	test   %edx,%edx
    10a9:	74 0d                	je     10b8 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    10ab:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
    10ad:	8b 40 0c             	mov    0xc(%eax),%eax
    10b0:	89 c5                	mov    %eax,%ebp
  }
  return;
}
    10b2:	5d                   	pop    %ebp
    10b3:	c3                   	ret    
    10b4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    10b8:	8b 40 04             	mov    0x4(%eax),%eax
    10bb:	05 f4 0f 00 00       	add    $0xff4,%eax
    10c0:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    10c2:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
    10c4:	b8 90 09 00 00       	mov    $0x990,%eax
    10c9:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
    10cb:	5d                   	pop    %ebp
    10cc:	c3                   	ret    
    10cd:	8d 76 00             	lea    0x0(%esi),%esi

000010d0 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	56                   	push   %esi
    10d4:	53                   	push   %ebx
    10d5:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
    10d8:	83 ec 0c             	sub    $0xc,%esp
    10db:	6a 00                	push   $0x0
    10dd:	e8 d8 f4 ff ff       	call   5ba <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    10e2:	a1 c8 ad 00 00       	mov    0xadc8,%eax
    10e7:	83 c4 10             	add    $0x10,%esp
    10ea:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    10ed:	8d 14 95 80 1e 00 00 	lea    0x1e80(,%edx,4),%edx
    10f4:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
    10f8:	75 0b                	jne    1105 <uthread_schedule+0x35>
    10fa:	85 c0                	test   %eax,%eax
    10fc:	74 07                	je     1105 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
    10fe:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
    1105:	bb 88 1e 00 00       	mov    $0x1e88,%ebx
    110a:	eb 0f                	jmp    111b <uthread_schedule+0x4b>
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1110:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1113:	81 fb 88 27 00 00    	cmp    $0x2788,%ebx
    1119:	74 55                	je     1170 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    111b:	83 3b 01             	cmpl   $0x1,(%ebx)
    111e:	75 f0                	jne    1110 <uthread_schedule+0x40>
    1120:	8b 73 14             	mov    0x14(%ebx),%esi
    1123:	85 f6                	test   %esi,%esi
    1125:	0f 85 a5 00 00 00    	jne    11d0 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    112b:	8b 43 18             	mov    0x18(%ebx),%eax
    112e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1131:	74 dd                	je     1110 <uthread_schedule+0x40>
    1133:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    1136:	8b 14 95 88 1e 00 00 	mov    0x1e88(,%edx,4),%edx
    113d:	85 d2                	test   %edx,%edx
    113f:	75 cf                	jne    1110 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
    1141:	50                   	push   %eax
    1142:	ff 73 f8             	pushl  -0x8(%ebx)
    1145:	83 c3 24             	add    $0x24,%ebx
    1148:	68 1c 16 00 00       	push   $0x161c
    114d:	6a 01                	push   $0x1
    114f:	e8 1c f5 ff ff       	call   670 <printf>
      threads[i].join = -1;
    1154:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
    115b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
    1162:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1165:	81 fb 88 27 00 00    	cmp    $0x2788,%ebx
    116b:	75 ae                	jne    111b <uthread_schedule+0x4b>
    116d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1170:	8b 15 c8 ad 00 00    	mov    0xadc8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    1176:	b9 40 00 00 00       	mov    $0x40,%ecx
    117b:	8d 42 01             	lea    0x1(%edx),%eax
    117e:	eb 08                	jmp    1188 <uthread_schedule+0xb8>
    1180:	83 c0 01             	add    $0x1,%eax
    1183:	83 e9 01             	sub    $0x1,%ecx
    1186:	74 78                	je     1200 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    1188:	89 c3                	mov    %eax,%ebx
    118a:	c1 fb 1f             	sar    $0x1f,%ebx
    118d:	c1 eb 1a             	shr    $0x1a,%ebx
    1190:	01 d8                	add    %ebx,%eax
    1192:	83 e0 3f             	and    $0x3f,%eax
    1195:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    1197:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    119a:	83 3c 9d 88 1e 00 00 	cmpl   $0x2,0x1e88(,%ebx,4)
    11a1:	02 
    11a2:	75 dc                	jne    1180 <uthread_schedule+0xb0>
    11a4:	39 c2                	cmp    %eax,%edx
    11a6:	74 d8                	je     1180 <uthread_schedule+0xb0>
      index_currently_running = i;
    11a8:	a3 c8 ad 00 00       	mov    %eax,0xadc8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    11ad:	83 ec 08             	sub    $0x8,%esp
    11b0:	50                   	push   %eax
    11b1:	52                   	push   %edx
    11b2:	e8 b9 fe ff ff       	call   1070 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    11b7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    11be:	e8 f7 f3 ff ff       	call   5ba <alarm>
}
    11c3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    11c6:	5b                   	pop    %ebx
    11c7:	5e                   	pop    %esi
    11c8:	5d                   	pop    %ebp
    11c9:	c3                   	ret    
    11ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    11d0:	e8 c5 f3 ff ff       	call   59a <uptime>
    11d5:	39 c6                	cmp    %eax,%esi
    11d7:	7f 17                	jg     11f0 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    11d9:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    11df:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    11e6:	e9 25 ff ff ff       	jmp    1110 <uthread_schedule+0x40>
    11eb:	90                   	nop
    11ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    11f0:	83 3b 01             	cmpl   $0x1,(%ebx)
    11f3:	0f 84 32 ff ff ff    	je     112b <uthread_schedule+0x5b>
    11f9:	e9 12 ff ff ff       	jmp    1110 <uthread_schedule+0x40>
    11fe:	66 90                	xchg   %ax,%ax
    1200:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1203:	83 3c 85 88 1e 00 00 	cmpl   $0x2,0x1e88(,%eax,4)
    120a:	02 
    120b:	0f 85 c7 fe ff ff    	jne    10d8 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1211:	89 d0                	mov    %edx,%eax
    1213:	eb 98                	jmp    11ad <uthread_schedule+0xdd>
    1215:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001220 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1220:	a1 c8 ad 00 00       	mov    0xadc8,%eax
  exit();
}

int
uthread_self()
{
    1225:	55                   	push   %ebp
    1226:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    1228:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    122b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    122c:	8b 04 85 80 1e 00 00 	mov    0x1e80(,%eax,4),%eax
}
    1233:	c3                   	ret    
    1234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    123a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001240 <uthread_join>:

int
uthread_join(int tid)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	56                   	push   %esi
    1244:	53                   	push   %ebx
    1245:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1248:	39 35 c4 ad 00 00    	cmp    %esi,0xadc4
    124e:	0f 8c ab 00 00 00    	jl     12ff <uthread_join+0xbf>
    1254:	89 f0                	mov    %esi,%eax
    1256:	c1 e8 1f             	shr    $0x1f,%eax
    1259:	84 c0                	test   %al,%al
    125b:	0f 85 9e 00 00 00    	jne    12ff <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1261:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1264:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1266:	6a 00                	push   $0x0
    1268:	e8 4d f3 ff ff       	call   5ba <alarm>
    126d:	b8 80 1e 00 00       	mov    $0x1e80,%eax
    1272:	83 c4 10             	add    $0x10,%esp
    1275:	eb 14                	jmp    128b <uthread_join+0x4b>
    1277:	89 f6                	mov    %esi,%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1280:	83 c3 01             	add    $0x1,%ebx
    1283:	83 c0 24             	add    $0x24,%eax
    1286:	83 fb 40             	cmp    $0x40,%ebx
    1289:	74 55                	je     12e0 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    128b:	3b 30                	cmp    (%eax),%esi
    128d:	75 f1                	jne    1280 <uthread_join+0x40>
    128f:	8b 50 08             	mov    0x8(%eax),%edx
    1292:	85 d2                	test   %edx,%edx
    1294:	74 ea                	je     1280 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1296:	53                   	push   %ebx
    1297:	ff 35 c8 ad 00 00    	pushl  0xadc8
    129d:	68 a6 16 00 00       	push   $0x16a6
    12a2:	6a 01                	push   $0x1
    12a4:	e8 c7 f3 ff ff       	call   670 <printf>
    threads[index_currently_running].join=found_tid;
    12a9:	a1 c8 ad 00 00       	mov    0xadc8,%eax
    12ae:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    12b1:	8d 04 85 80 1e 00 00 	lea    0x1e80(,%eax,4),%eax
    12b8:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    12bb:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    12c2:	e8 bb f2 ff ff       	call   582 <getpid>
    12c7:	5a                   	pop    %edx
    12c8:	59                   	pop    %ecx
    12c9:	6a 0e                	push   $0xe
    12cb:	50                   	push   %eax
    12cc:	e8 d9 f2 ff ff       	call   5aa <sigsend>
  }
  return 0;
    12d1:	83 c4 10             	add    $0x10,%esp

}
    12d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    12d7:	31 c0                	xor    %eax,%eax

}
    12d9:	5b                   	pop    %ebx
    12da:	5e                   	pop    %esi
    12db:	5d                   	pop    %ebp
    12dc:	c3                   	ret    
    12dd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    12e0:	83 ec 04             	sub    $0x4,%esp
    12e3:	56                   	push   %esi
    12e4:	68 88 16 00 00       	push   $0x1688
    12e9:	6a 01                	push   $0x1
    12eb:	e8 80 f3 ff ff       	call   670 <printf>
    alarm(UTHREAD_QUANTA);
    12f0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    12f7:	e8 be f2 ff ff       	call   5ba <alarm>
    return -1;
    12fc:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    12ff:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1307:	5b                   	pop    %ebx
    1308:	5e                   	pop    %esi
    1309:	5d                   	pop    %ebp
    130a:	c3                   	ret    
    130b:	90                   	nop
    130c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001310 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1310:	55                   	push   %ebp
    1311:	89 e5                	mov    %esp,%ebp
    1313:	53                   	push   %ebx
    1314:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1317:	6a 00                	push   $0x0
    1319:	e8 9c f2 ff ff       	call   5ba <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    131e:	8b 1d c8 ad 00 00    	mov    0xadc8,%ebx
    1324:	e8 71 f2 ff ff       	call   59a <uptime>
    1329:	03 45 08             	add    0x8(%ebp),%eax
    132c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    132f:	89 04 95 9c 1e 00 00 	mov    %eax,0x1e9c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    1336:	a1 c8 ad 00 00       	mov    0xadc8,%eax
    133b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    133e:	c7 04 85 88 1e 00 00 	movl   $0x1,0x1e88(,%eax,4)
    1345:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1349:	e8 34 f2 ff ff       	call   582 <getpid>
    134e:	5a                   	pop    %edx
    134f:	59                   	pop    %ecx
    1350:	6a 0e                	push   $0xe
    1352:	50                   	push   %eax
    1353:	e8 52 f2 ff ff       	call   5aa <sigsend>
  return 0;
}
    1358:	31 c0                	xor    %eax,%eax
    135a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    135d:	c9                   	leave  
    135e:	c3                   	ret    
    135f:	90                   	nop

00001360 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1360:	55                   	push   %ebp
    1361:	89 e5                	mov    %esp,%ebp
    1363:	53                   	push   %ebx
    1364:	83 ec 04             	sub    $0x4,%esp
    1367:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    136a:	8b 45 0c             	mov    0xc(%ebp),%eax
    136d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1370:	e8 bb f7 ff ff       	call   b30 <bsem_alloc>
    1375:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1377:	e8 b4 f7 ff ff       	call   b30 <bsem_alloc>
    137c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    137f:	83 c4 04             	add    $0x4,%esp
    1382:	5b                   	pop    %ebx
    1383:	5d                   	pop    %ebp
    1384:	c3                   	ret    
    1385:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001390 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	53                   	push   %ebx
    1394:	83 ec 10             	sub    $0x10,%esp
    1397:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    139a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    13a1:	ff 33                	pushl  (%ebx)
    13a3:	e8 78 f8 ff ff       	call   c20 <bsem_free>
  bsem_free(csem->bsem_2_id);
    13a8:	8b 43 04             	mov    0x4(%ebx),%eax
    13ab:	83 c4 10             	add    $0x10,%esp
}
    13ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    13b1:	89 45 08             	mov    %eax,0x8(%ebp)
}
    13b4:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    13b5:	e9 66 f8 ff ff       	jmp    c20 <bsem_free>
    13ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000013c0 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	53                   	push   %ebx
    13c4:	83 ec 10             	sub    $0x10,%esp
    13c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    13ca:	ff 73 04             	pushl  0x4(%ebx)
    13cd:	e8 de f8 ff ff       	call   cb0 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    13d2:	58                   	pop    %eax
    13d3:	ff 33                	pushl  (%ebx)
    13d5:	e8 d6 f8 ff ff       	call   cb0 <bsem_down>
  csem->value--;
    13da:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    13dd:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    13e0:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    13e3:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    13e5:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    13e8:	7e 0e                	jle    13f8 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    13ea:	83 ec 0c             	sub    $0xc,%esp
    13ed:	ff 73 04             	pushl  0x4(%ebx)
    13f0:	e8 cb f9 ff ff       	call   dc0 <bsem_up>
    13f5:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    13f8:	8b 03                	mov    (%ebx),%eax
}
    13fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    13fd:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1400:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1401:	e9 ba f9 ff ff       	jmp    dc0 <bsem_up>
    1406:	8d 76 00             	lea    0x0(%esi),%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001410 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 10             	sub    $0x10,%esp
    1417:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    141a:	ff 33                	pushl  (%ebx)
    141c:	e8 8f f8 ff ff       	call   cb0 <bsem_down>
  csem->value++;
    1421:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1424:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1427:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    142a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    142d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1430:	74 0e                	je     1440 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1432:	8b 03                	mov    (%ebx),%eax
}
    1434:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1437:	89 45 08             	mov    %eax,0x8(%ebp)
}
    143a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    143b:	e9 80 f9 ff ff       	jmp    dc0 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1440:	83 ec 0c             	sub    $0xc,%esp
    1443:	ff 73 04             	pushl  0x4(%ebx)
    1446:	e8 75 f9 ff ff       	call   dc0 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    144b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    144d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1450:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1453:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1456:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1457:	e9 64 f9 ff ff       	jmp    dc0 <bsem_up>
