
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  if(fork() > 0)
      11:	e8 54 02 00 00       	call   26a <fork>
      16:	85 c0                	test   %eax,%eax
      18:	7e 0d                	jle    27 <main+0x27>
    sleep(5);  // Let child exit before parent.
      1a:	83 ec 0c             	sub    $0xc,%esp
      1d:	6a 05                	push   $0x5
      1f:	e8 de 02 00 00       	call   302 <sleep>
      24:	83 c4 10             	add    $0x10,%esp
  exit();
      27:	e8 46 02 00 00       	call   272 <exit>
      2c:	66 90                	xchg   %ax,%ax
      2e:	66 90                	xchg   %ax,%ax

00000030 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      30:	55                   	push   %ebp
      31:	89 e5                	mov    %esp,%ebp
      33:	53                   	push   %ebx
      34:	8b 45 08             	mov    0x8(%ebp),%eax
      37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      3a:	89 c2                	mov    %eax,%edx
      3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      40:	83 c1 01             	add    $0x1,%ecx
      43:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
      47:	83 c2 01             	add    $0x1,%edx
      4a:	84 db                	test   %bl,%bl
      4c:	88 5a ff             	mov    %bl,-0x1(%edx)
      4f:	75 ef                	jne    40 <strcpy+0x10>
    ;
  return os;
}
      51:	5b                   	pop    %ebx
      52:	5d                   	pop    %ebp
      53:	c3                   	ret    
      54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000060 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	56                   	push   %esi
      64:	53                   	push   %ebx
      65:	8b 55 08             	mov    0x8(%ebp),%edx
      68:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
      6b:	0f b6 02             	movzbl (%edx),%eax
      6e:	0f b6 19             	movzbl (%ecx),%ebx
      71:	84 c0                	test   %al,%al
      73:	75 1e                	jne    93 <strcmp+0x33>
      75:	eb 29                	jmp    a0 <strcmp+0x40>
      77:	89 f6                	mov    %esi,%esi
      79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
      80:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      83:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
      86:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      89:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
      8d:	84 c0                	test   %al,%al
      8f:	74 0f                	je     a0 <strcmp+0x40>
      91:	89 f1                	mov    %esi,%ecx
      93:	38 d8                	cmp    %bl,%al
      95:	74 e9                	je     80 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      97:	29 d8                	sub    %ebx,%eax
}
      99:	5b                   	pop    %ebx
      9a:	5e                   	pop    %esi
      9b:	5d                   	pop    %ebp
      9c:	c3                   	ret    
      9d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      a0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
      a2:	29 d8                	sub    %ebx,%eax
}
      a4:	5b                   	pop    %ebx
      a5:	5e                   	pop    %esi
      a6:	5d                   	pop    %ebp
      a7:	c3                   	ret    
      a8:	90                   	nop
      a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000b0 <strlen>:

uint
strlen(char *s)
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
      b6:	80 39 00             	cmpb   $0x0,(%ecx)
      b9:	74 12                	je     cd <strlen+0x1d>
      bb:	31 d2                	xor    %edx,%edx
      bd:	8d 76 00             	lea    0x0(%esi),%esi
      c0:	83 c2 01             	add    $0x1,%edx
      c3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
      c7:	89 d0                	mov    %edx,%eax
      c9:	75 f5                	jne    c0 <strlen+0x10>
    ;
  return n;
}
      cb:	5d                   	pop    %ebp
      cc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
      cd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
      cf:	5d                   	pop    %ebp
      d0:	c3                   	ret    
      d1:	eb 0d                	jmp    e0 <memset>
      d3:	90                   	nop
      d4:	90                   	nop
      d5:	90                   	nop
      d6:	90                   	nop
      d7:	90                   	nop
      d8:	90                   	nop
      d9:	90                   	nop
      da:	90                   	nop
      db:	90                   	nop
      dc:	90                   	nop
      dd:	90                   	nop
      de:	90                   	nop
      df:	90                   	nop

000000e0 <memset>:

void*
memset(void *dst, int c, uint n)
{
      e0:	55                   	push   %ebp
      e1:	89 e5                	mov    %esp,%ebp
      e3:	57                   	push   %edi
      e4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
      e7:	8b 4d 10             	mov    0x10(%ebp),%ecx
      ea:	8b 45 0c             	mov    0xc(%ebp),%eax
      ed:	89 d7                	mov    %edx,%edi
      ef:	fc                   	cld    
      f0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
      f2:	89 d0                	mov    %edx,%eax
      f4:	5f                   	pop    %edi
      f5:	5d                   	pop    %ebp
      f6:	c3                   	ret    
      f7:	89 f6                	mov    %esi,%esi
      f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <strchr>:

char*
strchr(const char *s, char c)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	53                   	push   %ebx
     104:	8b 45 08             	mov    0x8(%ebp),%eax
     107:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     10a:	0f b6 10             	movzbl (%eax),%edx
     10d:	84 d2                	test   %dl,%dl
     10f:	74 1d                	je     12e <strchr+0x2e>
    if(*s == c)
     111:	38 d3                	cmp    %dl,%bl
     113:	89 d9                	mov    %ebx,%ecx
     115:	75 0d                	jne    124 <strchr+0x24>
     117:	eb 17                	jmp    130 <strchr+0x30>
     119:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     120:	38 ca                	cmp    %cl,%dl
     122:	74 0c                	je     130 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     124:	83 c0 01             	add    $0x1,%eax
     127:	0f b6 10             	movzbl (%eax),%edx
     12a:	84 d2                	test   %dl,%dl
     12c:	75 f2                	jne    120 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     12e:	31 c0                	xor    %eax,%eax
}
     130:	5b                   	pop    %ebx
     131:	5d                   	pop    %ebp
     132:	c3                   	ret    
     133:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <gets>:

char*
gets(char *buf, int max)
{
     140:	55                   	push   %ebp
     141:	89 e5                	mov    %esp,%ebp
     143:	57                   	push   %edi
     144:	56                   	push   %esi
     145:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     146:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     148:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     14b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     14e:	eb 29                	jmp    179 <gets+0x39>
    cc = read(0, &c, 1);
     150:	83 ec 04             	sub    $0x4,%esp
     153:	6a 01                	push   $0x1
     155:	57                   	push   %edi
     156:	6a 00                	push   $0x0
     158:	e8 2d 01 00 00       	call   28a <read>
    if(cc < 1)
     15d:	83 c4 10             	add    $0x10,%esp
     160:	85 c0                	test   %eax,%eax
     162:	7e 1d                	jle    181 <gets+0x41>
      break;
    buf[i++] = c;
     164:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     168:	8b 55 08             	mov    0x8(%ebp),%edx
     16b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     16d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     16f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     173:	74 1b                	je     190 <gets+0x50>
     175:	3c 0d                	cmp    $0xd,%al
     177:	74 17                	je     190 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     179:	8d 5e 01             	lea    0x1(%esi),%ebx
     17c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     17f:	7c cf                	jl     150 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     181:	8b 45 08             	mov    0x8(%ebp),%eax
     184:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     188:	8d 65 f4             	lea    -0xc(%ebp),%esp
     18b:	5b                   	pop    %ebx
     18c:	5e                   	pop    %esi
     18d:	5f                   	pop    %edi
     18e:	5d                   	pop    %ebp
     18f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     190:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     193:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     195:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     199:	8d 65 f4             	lea    -0xc(%ebp),%esp
     19c:	5b                   	pop    %ebx
     19d:	5e                   	pop    %esi
     19e:	5f                   	pop    %edi
     19f:	5d                   	pop    %ebp
     1a0:	c3                   	ret    
     1a1:	eb 0d                	jmp    1b0 <stat>
     1a3:	90                   	nop
     1a4:	90                   	nop
     1a5:	90                   	nop
     1a6:	90                   	nop
     1a7:	90                   	nop
     1a8:	90                   	nop
     1a9:	90                   	nop
     1aa:	90                   	nop
     1ab:	90                   	nop
     1ac:	90                   	nop
     1ad:	90                   	nop
     1ae:	90                   	nop
     1af:	90                   	nop

000001b0 <stat>:

int
stat(char *n, struct stat *st)
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1b5:	83 ec 08             	sub    $0x8,%esp
     1b8:	6a 00                	push   $0x0
     1ba:	ff 75 08             	pushl  0x8(%ebp)
     1bd:	e8 f0 00 00 00       	call   2b2 <open>
  if(fd < 0)
     1c2:	83 c4 10             	add    $0x10,%esp
     1c5:	85 c0                	test   %eax,%eax
     1c7:	78 27                	js     1f0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     1c9:	83 ec 08             	sub    $0x8,%esp
     1cc:	ff 75 0c             	pushl  0xc(%ebp)
     1cf:	89 c3                	mov    %eax,%ebx
     1d1:	50                   	push   %eax
     1d2:	e8 f3 00 00 00       	call   2ca <fstat>
     1d7:	89 c6                	mov    %eax,%esi
  close(fd);
     1d9:	89 1c 24             	mov    %ebx,(%esp)
     1dc:	e8 b9 00 00 00       	call   29a <close>
  return r;
     1e1:	83 c4 10             	add    $0x10,%esp
     1e4:	89 f0                	mov    %esi,%eax
}
     1e6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     1e9:	5b                   	pop    %ebx
     1ea:	5e                   	pop    %esi
     1eb:	5d                   	pop    %ebp
     1ec:	c3                   	ret    
     1ed:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     1f0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     1f5:	eb ef                	jmp    1e6 <stat+0x36>
     1f7:	89 f6                	mov    %esi,%esi
     1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	53                   	push   %ebx
     204:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     207:	0f be 11             	movsbl (%ecx),%edx
     20a:	8d 42 d0             	lea    -0x30(%edx),%eax
     20d:	3c 09                	cmp    $0x9,%al
     20f:	b8 00 00 00 00       	mov    $0x0,%eax
     214:	77 1f                	ja     235 <atoi+0x35>
     216:	8d 76 00             	lea    0x0(%esi),%esi
     219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     220:	8d 04 80             	lea    (%eax,%eax,4),%eax
     223:	83 c1 01             	add    $0x1,%ecx
     226:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     22a:	0f be 11             	movsbl (%ecx),%edx
     22d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     230:	80 fb 09             	cmp    $0x9,%bl
     233:	76 eb                	jbe    220 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     235:	5b                   	pop    %ebx
     236:	5d                   	pop    %ebp
     237:	c3                   	ret    
     238:	90                   	nop
     239:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000240 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	56                   	push   %esi
     244:	53                   	push   %ebx
     245:	8b 5d 10             	mov    0x10(%ebp),%ebx
     248:	8b 45 08             	mov    0x8(%ebp),%eax
     24b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     24e:	85 db                	test   %ebx,%ebx
     250:	7e 14                	jle    266 <memmove+0x26>
     252:	31 d2                	xor    %edx,%edx
     254:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     258:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     25c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     25f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     262:	39 da                	cmp    %ebx,%edx
     264:	75 f2                	jne    258 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     266:	5b                   	pop    %ebx
     267:	5e                   	pop    %esi
     268:	5d                   	pop    %ebp
     269:	c3                   	ret    

0000026a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     26a:	b8 01 00 00 00       	mov    $0x1,%eax
     26f:	cd 40                	int    $0x40
     271:	c3                   	ret    

00000272 <exit>:
SYSCALL(exit)
     272:	b8 02 00 00 00       	mov    $0x2,%eax
     277:	cd 40                	int    $0x40
     279:	c3                   	ret    

0000027a <wait>:
SYSCALL(wait)
     27a:	b8 03 00 00 00       	mov    $0x3,%eax
     27f:	cd 40                	int    $0x40
     281:	c3                   	ret    

00000282 <pipe>:
SYSCALL(pipe)
     282:	b8 04 00 00 00       	mov    $0x4,%eax
     287:	cd 40                	int    $0x40
     289:	c3                   	ret    

0000028a <read>:
SYSCALL(read)
     28a:	b8 05 00 00 00       	mov    $0x5,%eax
     28f:	cd 40                	int    $0x40
     291:	c3                   	ret    

00000292 <write>:
SYSCALL(write)
     292:	b8 10 00 00 00       	mov    $0x10,%eax
     297:	cd 40                	int    $0x40
     299:	c3                   	ret    

0000029a <close>:
SYSCALL(close)
     29a:	b8 15 00 00 00       	mov    $0x15,%eax
     29f:	cd 40                	int    $0x40
     2a1:	c3                   	ret    

000002a2 <kill>:
SYSCALL(kill)
     2a2:	b8 06 00 00 00       	mov    $0x6,%eax
     2a7:	cd 40                	int    $0x40
     2a9:	c3                   	ret    

000002aa <exec>:
SYSCALL(exec)
     2aa:	b8 07 00 00 00       	mov    $0x7,%eax
     2af:	cd 40                	int    $0x40
     2b1:	c3                   	ret    

000002b2 <open>:
SYSCALL(open)
     2b2:	b8 0f 00 00 00       	mov    $0xf,%eax
     2b7:	cd 40                	int    $0x40
     2b9:	c3                   	ret    

000002ba <mknod>:
SYSCALL(mknod)
     2ba:	b8 11 00 00 00       	mov    $0x11,%eax
     2bf:	cd 40                	int    $0x40
     2c1:	c3                   	ret    

000002c2 <unlink>:
SYSCALL(unlink)
     2c2:	b8 12 00 00 00       	mov    $0x12,%eax
     2c7:	cd 40                	int    $0x40
     2c9:	c3                   	ret    

000002ca <fstat>:
SYSCALL(fstat)
     2ca:	b8 08 00 00 00       	mov    $0x8,%eax
     2cf:	cd 40                	int    $0x40
     2d1:	c3                   	ret    

000002d2 <link>:
SYSCALL(link)
     2d2:	b8 13 00 00 00       	mov    $0x13,%eax
     2d7:	cd 40                	int    $0x40
     2d9:	c3                   	ret    

000002da <mkdir>:
SYSCALL(mkdir)
     2da:	b8 14 00 00 00       	mov    $0x14,%eax
     2df:	cd 40                	int    $0x40
     2e1:	c3                   	ret    

000002e2 <chdir>:
SYSCALL(chdir)
     2e2:	b8 09 00 00 00       	mov    $0x9,%eax
     2e7:	cd 40                	int    $0x40
     2e9:	c3                   	ret    

000002ea <dup>:
SYSCALL(dup)
     2ea:	b8 0a 00 00 00       	mov    $0xa,%eax
     2ef:	cd 40                	int    $0x40
     2f1:	c3                   	ret    

000002f2 <getpid>:
SYSCALL(getpid)
     2f2:	b8 0b 00 00 00       	mov    $0xb,%eax
     2f7:	cd 40                	int    $0x40
     2f9:	c3                   	ret    

000002fa <sbrk>:
SYSCALL(sbrk)
     2fa:	b8 0c 00 00 00       	mov    $0xc,%eax
     2ff:	cd 40                	int    $0x40
     301:	c3                   	ret    

00000302 <sleep>:
SYSCALL(sleep)
     302:	b8 0d 00 00 00       	mov    $0xd,%eax
     307:	cd 40                	int    $0x40
     309:	c3                   	ret    

0000030a <uptime>:
SYSCALL(uptime)
     30a:	b8 0e 00 00 00       	mov    $0xe,%eax
     30f:	cd 40                	int    $0x40
     311:	c3                   	ret    

00000312 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     312:	b8 16 00 00 00       	mov    $0x16,%eax
     317:	cd 40                	int    $0x40
     319:	c3                   	ret    

0000031a <sigsend>:
SYSCALL(sigsend)
     31a:	b8 17 00 00 00       	mov    $0x17,%eax
     31f:	cd 40                	int    $0x40
     321:	c3                   	ret    

00000322 <sigreturn>:
SYSCALL(sigreturn)
     322:	b8 18 00 00 00       	mov    $0x18,%eax
     327:	cd 40                	int    $0x40
     329:	c3                   	ret    

0000032a <alarm>:
SYSCALL(alarm)
     32a:	b8 19 00 00 00       	mov    $0x19,%eax
     32f:	cd 40                	int    $0x40
     331:	c3                   	ret    
     332:	66 90                	xchg   %ax,%ax
     334:	66 90                	xchg   %ax,%ax
     336:	66 90                	xchg   %ax,%ax
     338:	66 90                	xchg   %ax,%ax
     33a:	66 90                	xchg   %ax,%ax
     33c:	66 90                	xchg   %ax,%ax
     33e:	66 90                	xchg   %ax,%ax

00000340 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	57                   	push   %edi
     344:	56                   	push   %esi
     345:	53                   	push   %ebx
     346:	89 c6                	mov    %eax,%esi
     348:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     34b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     34e:	85 db                	test   %ebx,%ebx
     350:	74 7e                	je     3d0 <printint+0x90>
     352:	89 d0                	mov    %edx,%eax
     354:	c1 e8 1f             	shr    $0x1f,%eax
     357:	84 c0                	test   %al,%al
     359:	74 75                	je     3d0 <printint+0x90>
    neg = 1;
    x = -xx;
     35b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     35d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     364:	f7 d8                	neg    %eax
     366:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     369:	31 ff                	xor    %edi,%edi
     36b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     36e:	89 ce                	mov    %ecx,%esi
     370:	eb 08                	jmp    37a <printint+0x3a>
     372:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     378:	89 cf                	mov    %ecx,%edi
     37a:	31 d2                	xor    %edx,%edx
     37c:	8d 4f 01             	lea    0x1(%edi),%ecx
     37f:	f7 f6                	div    %esi
     381:	0f b6 92 d4 11 00 00 	movzbl 0x11d4(%edx),%edx
  }while((x /= base) != 0);
     388:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     38a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     38d:	75 e9                	jne    378 <printint+0x38>
  if(neg)
     38f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     392:	8b 75 c0             	mov    -0x40(%ebp),%esi
     395:	85 c0                	test   %eax,%eax
     397:	74 08                	je     3a1 <printint+0x61>
    buf[i++] = '-';
     399:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     39e:	8d 4f 02             	lea    0x2(%edi),%ecx
     3a1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     3a5:	8d 76 00             	lea    0x0(%esi),%esi
     3a8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     3ab:	83 ec 04             	sub    $0x4,%esp
     3ae:	83 ef 01             	sub    $0x1,%edi
     3b1:	6a 01                	push   $0x1
     3b3:	53                   	push   %ebx
     3b4:	56                   	push   %esi
     3b5:	88 45 d7             	mov    %al,-0x29(%ebp)
     3b8:	e8 d5 fe ff ff       	call   292 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     3bd:	83 c4 10             	add    $0x10,%esp
     3c0:	39 df                	cmp    %ebx,%edi
     3c2:	75 e4                	jne    3a8 <printint+0x68>
    putc(fd, buf[i]);
}
     3c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3c7:	5b                   	pop    %ebx
     3c8:	5e                   	pop    %esi
     3c9:	5f                   	pop    %edi
     3ca:	5d                   	pop    %ebp
     3cb:	c3                   	ret    
     3cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     3d0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     3d2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     3d9:	eb 8b                	jmp    366 <printint+0x26>
     3db:	90                   	nop
     3dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000003e0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	57                   	push   %edi
     3e4:	56                   	push   %esi
     3e5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     3e6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     3e9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     3ec:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     3ef:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     3f2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     3f5:	0f b6 1e             	movzbl (%esi),%ebx
     3f8:	83 c6 01             	add    $0x1,%esi
     3fb:	84 db                	test   %bl,%bl
     3fd:	0f 84 b0 00 00 00    	je     4b3 <printf+0xd3>
     403:	31 d2                	xor    %edx,%edx
     405:	eb 39                	jmp    440 <printf+0x60>
     407:	89 f6                	mov    %esi,%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     410:	83 f8 25             	cmp    $0x25,%eax
     413:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     416:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     41b:	74 18                	je     435 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     41d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     420:	83 ec 04             	sub    $0x4,%esp
     423:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     426:	6a 01                	push   $0x1
     428:	50                   	push   %eax
     429:	57                   	push   %edi
     42a:	e8 63 fe ff ff       	call   292 <write>
     42f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     432:	83 c4 10             	add    $0x10,%esp
     435:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     438:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     43c:	84 db                	test   %bl,%bl
     43e:	74 73                	je     4b3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     440:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     442:	0f be cb             	movsbl %bl,%ecx
     445:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     448:	74 c6                	je     410 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     44a:	83 fa 25             	cmp    $0x25,%edx
     44d:	75 e6                	jne    435 <printf+0x55>
      if(c == 'd'){
     44f:	83 f8 64             	cmp    $0x64,%eax
     452:	0f 84 f8 00 00 00    	je     550 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     458:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     45e:	83 f9 70             	cmp    $0x70,%ecx
     461:	74 5d                	je     4c0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     463:	83 f8 73             	cmp    $0x73,%eax
     466:	0f 84 84 00 00 00    	je     4f0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     46c:	83 f8 63             	cmp    $0x63,%eax
     46f:	0f 84 ea 00 00 00    	je     55f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     475:	83 f8 25             	cmp    $0x25,%eax
     478:	0f 84 c2 00 00 00    	je     540 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     47e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     481:	83 ec 04             	sub    $0x4,%esp
     484:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     488:	6a 01                	push   $0x1
     48a:	50                   	push   %eax
     48b:	57                   	push   %edi
     48c:	e8 01 fe ff ff       	call   292 <write>
     491:	83 c4 0c             	add    $0xc,%esp
     494:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     497:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     49a:	6a 01                	push   $0x1
     49c:	50                   	push   %eax
     49d:	57                   	push   %edi
     49e:	83 c6 01             	add    $0x1,%esi
     4a1:	e8 ec fd ff ff       	call   292 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4a6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4aa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     4ad:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4af:	84 db                	test   %bl,%bl
     4b1:	75 8d                	jne    440 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     4b3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4b6:	5b                   	pop    %ebx
     4b7:	5e                   	pop    %esi
     4b8:	5f                   	pop    %edi
     4b9:	5d                   	pop    %ebp
     4ba:	c3                   	ret    
     4bb:	90                   	nop
     4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     4c0:	83 ec 0c             	sub    $0xc,%esp
     4c3:	b9 10 00 00 00       	mov    $0x10,%ecx
     4c8:	6a 00                	push   $0x0
     4ca:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     4cd:	89 f8                	mov    %edi,%eax
     4cf:	8b 13                	mov    (%ebx),%edx
     4d1:	e8 6a fe ff ff       	call   340 <printint>
        ap++;
     4d6:	89 d8                	mov    %ebx,%eax
     4d8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     4db:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     4dd:	83 c0 04             	add    $0x4,%eax
     4e0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     4e3:	e9 4d ff ff ff       	jmp    435 <printf+0x55>
     4e8:	90                   	nop
     4e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     4f0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     4f3:	8b 18                	mov    (%eax),%ebx
        ap++;
     4f5:	83 c0 04             	add    $0x4,%eax
     4f8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     4fb:	b8 cc 11 00 00       	mov    $0x11cc,%eax
     500:	85 db                	test   %ebx,%ebx
     502:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     505:	0f b6 03             	movzbl (%ebx),%eax
     508:	84 c0                	test   %al,%al
     50a:	74 23                	je     52f <printf+0x14f>
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     510:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     513:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     516:	83 ec 04             	sub    $0x4,%esp
     519:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     51b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     51e:	50                   	push   %eax
     51f:	57                   	push   %edi
     520:	e8 6d fd ff ff       	call   292 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     525:	0f b6 03             	movzbl (%ebx),%eax
     528:	83 c4 10             	add    $0x10,%esp
     52b:	84 c0                	test   %al,%al
     52d:	75 e1                	jne    510 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     52f:	31 d2                	xor    %edx,%edx
     531:	e9 ff fe ff ff       	jmp    435 <printf+0x55>
     536:	8d 76 00             	lea    0x0(%esi),%esi
     539:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     540:	83 ec 04             	sub    $0x4,%esp
     543:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     546:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     549:	6a 01                	push   $0x1
     54b:	e9 4c ff ff ff       	jmp    49c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     550:	83 ec 0c             	sub    $0xc,%esp
     553:	b9 0a 00 00 00       	mov    $0xa,%ecx
     558:	6a 01                	push   $0x1
     55a:	e9 6b ff ff ff       	jmp    4ca <printf+0xea>
     55f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     562:	83 ec 04             	sub    $0x4,%esp
     565:	8b 03                	mov    (%ebx),%eax
     567:	6a 01                	push   $0x1
     569:	88 45 e4             	mov    %al,-0x1c(%ebp)
     56c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     56f:	50                   	push   %eax
     570:	57                   	push   %edi
     571:	e8 1c fd ff ff       	call   292 <write>
     576:	e9 5b ff ff ff       	jmp    4d6 <printf+0xf6>
     57b:	66 90                	xchg   %ax,%ax
     57d:	66 90                	xchg   %ax,%ax
     57f:	90                   	nop

00000580 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     580:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     581:	a1 40 19 00 00       	mov    0x1940,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     586:	89 e5                	mov    %esp,%ebp
     588:	57                   	push   %edi
     589:	56                   	push   %esi
     58a:	53                   	push   %ebx
     58b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     58e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     590:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     593:	39 c8                	cmp    %ecx,%eax
     595:	73 19                	jae    5b0 <free+0x30>
     597:	89 f6                	mov    %esi,%esi
     599:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5a0:	39 d1                	cmp    %edx,%ecx
     5a2:	72 1c                	jb     5c0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5a4:	39 d0                	cmp    %edx,%eax
     5a6:	73 18                	jae    5c0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     5a8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5aa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5ac:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5ae:	72 f0                	jb     5a0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5b0:	39 d0                	cmp    %edx,%eax
     5b2:	72 f4                	jb     5a8 <free+0x28>
     5b4:	39 d1                	cmp    %edx,%ecx
     5b6:	73 f0                	jae    5a8 <free+0x28>
     5b8:	90                   	nop
     5b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     5c0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     5c3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     5c6:	39 d7                	cmp    %edx,%edi
     5c8:	74 19                	je     5e3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     5ca:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     5cd:	8b 50 04             	mov    0x4(%eax),%edx
     5d0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     5d3:	39 f1                	cmp    %esi,%ecx
     5d5:	74 23                	je     5fa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     5d7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     5d9:	a3 40 19 00 00       	mov    %eax,0x1940
}
     5de:	5b                   	pop    %ebx
     5df:	5e                   	pop    %esi
     5e0:	5f                   	pop    %edi
     5e1:	5d                   	pop    %ebp
     5e2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     5e3:	03 72 04             	add    0x4(%edx),%esi
     5e6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     5e9:	8b 10                	mov    (%eax),%edx
     5eb:	8b 12                	mov    (%edx),%edx
     5ed:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     5f0:	8b 50 04             	mov    0x4(%eax),%edx
     5f3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     5f6:	39 f1                	cmp    %esi,%ecx
     5f8:	75 dd                	jne    5d7 <free+0x57>
    p->s.size += bp->s.size;
     5fa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     5fd:	a3 40 19 00 00       	mov    %eax,0x1940
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     602:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     605:	8b 53 f8             	mov    -0x8(%ebx),%edx
     608:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     60a:	5b                   	pop    %ebx
     60b:	5e                   	pop    %esi
     60c:	5f                   	pop    %edi
     60d:	5d                   	pop    %ebp
     60e:	c3                   	ret    
     60f:	90                   	nop

00000610 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     610:	55                   	push   %ebp
     611:	89 e5                	mov    %esp,%ebp
     613:	57                   	push   %edi
     614:	56                   	push   %esi
     615:	53                   	push   %ebx
     616:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     619:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     61c:	8b 15 40 19 00 00    	mov    0x1940,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     622:	8d 78 07             	lea    0x7(%eax),%edi
     625:	c1 ef 03             	shr    $0x3,%edi
     628:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     62b:	85 d2                	test   %edx,%edx
     62d:	0f 84 a3 00 00 00    	je     6d6 <malloc+0xc6>
     633:	8b 02                	mov    (%edx),%eax
     635:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     638:	39 cf                	cmp    %ecx,%edi
     63a:	76 74                	jbe    6b0 <malloc+0xa0>
     63c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     642:	be 00 10 00 00       	mov    $0x1000,%esi
     647:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     64e:	0f 43 f7             	cmovae %edi,%esi
     651:	ba 00 80 00 00       	mov    $0x8000,%edx
     656:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     65c:	0f 46 da             	cmovbe %edx,%ebx
     65f:	eb 10                	jmp    671 <malloc+0x61>
     661:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     668:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     66a:	8b 48 04             	mov    0x4(%eax),%ecx
     66d:	39 cf                	cmp    %ecx,%edi
     66f:	76 3f                	jbe    6b0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     671:	39 05 40 19 00 00    	cmp    %eax,0x1940
     677:	89 c2                	mov    %eax,%edx
     679:	75 ed                	jne    668 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     67b:	83 ec 0c             	sub    $0xc,%esp
     67e:	53                   	push   %ebx
     67f:	e8 76 fc ff ff       	call   2fa <sbrk>
  if(p == (char*)-1)
     684:	83 c4 10             	add    $0x10,%esp
     687:	83 f8 ff             	cmp    $0xffffffff,%eax
     68a:	74 1c                	je     6a8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     68c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     68f:	83 ec 0c             	sub    $0xc,%esp
     692:	83 c0 08             	add    $0x8,%eax
     695:	50                   	push   %eax
     696:	e8 e5 fe ff ff       	call   580 <free>
  return freep;
     69b:	8b 15 40 19 00 00    	mov    0x1940,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     6a1:	83 c4 10             	add    $0x10,%esp
     6a4:	85 d2                	test   %edx,%edx
     6a6:	75 c0                	jne    668 <malloc+0x58>
        return 0;
     6a8:	31 c0                	xor    %eax,%eax
     6aa:	eb 1c                	jmp    6c8 <malloc+0xb8>
     6ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     6b0:	39 cf                	cmp    %ecx,%edi
     6b2:	74 1c                	je     6d0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     6b4:	29 f9                	sub    %edi,%ecx
     6b6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     6b9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     6bc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     6bf:	89 15 40 19 00 00    	mov    %edx,0x1940
      return (void*)(p + 1);
     6c5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     6c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6cb:	5b                   	pop    %ebx
     6cc:	5e                   	pop    %esi
     6cd:	5f                   	pop    %edi
     6ce:	5d                   	pop    %ebp
     6cf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     6d0:	8b 08                	mov    (%eax),%ecx
     6d2:	89 0a                	mov    %ecx,(%edx)
     6d4:	eb e9                	jmp    6bf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     6d6:	c7 05 40 19 00 00 44 	movl   $0x1944,0x1940
     6dd:	19 00 00 
     6e0:	c7 05 44 19 00 00 44 	movl   $0x1944,0x1944
     6e7:	19 00 00 
    base.s.size = 0;
     6ea:	b8 44 19 00 00       	mov    $0x1944,%eax
     6ef:	c7 05 48 19 00 00 00 	movl   $0x0,0x1948
     6f6:	00 00 00 
     6f9:	e9 3e ff ff ff       	jmp    63c <malloc+0x2c>
     6fe:	66 90                	xchg   %ax,%ax

00000700 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     700:	55                   	push   %ebp
     701:	89 e5                	mov    %esp,%ebp
     703:	56                   	push   %esi
     704:	53                   	push   %ebx
     705:	8b 75 0c             	mov    0xc(%ebp),%esi
     708:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     70b:	83 ec 08             	sub    $0x8,%esp
     70e:	68 e8 11 00 00       	push   $0x11e8
     713:	6a 01                	push   $0x1
     715:	e8 c6 fc ff ff       	call   3e0 <printf>
  alarm(UTHREAD_QUANTA);
     71a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     721:	e8 04 fc ff ff       	call   32a <alarm>
  start_func(arg);
     726:	89 75 08             	mov    %esi,0x8(%ebp)
     729:	83 c4 10             	add    $0x10,%esp
}
     72c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     72f:	89 d8                	mov    %ebx,%eax
}
     731:	5b                   	pop    %ebx
     732:	5e                   	pop    %esi
     733:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     734:	ff e0                	jmp    *%eax
     736:	8d 76 00             	lea    0x0(%esi),%esi
     739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000740 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	53                   	push   %ebx
     744:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     747:	6a 00                	push   $0x0
     749:	e8 dc fb ff ff       	call   32a <alarm>
  printf(1,"exiting...\n");
     74e:	5a                   	pop    %edx
     74f:	59                   	pop    %ecx
     750:	68 58 13 00 00       	push   $0x1358
     755:	6a 01                	push   $0x1
     757:	e8 84 fc ff ff       	call   3e0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     75c:	a1 88 a8 00 00       	mov    0xa888,%eax
     761:	83 c4 10             	add    $0x10,%esp
     764:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     767:	8b 1c 95 60 19 00 00 	mov    0x1960(,%edx,4),%ebx
     76e:	85 db                	test   %ebx,%ebx
     770:	75 0a                	jne    77c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     772:	c7 05 68 19 00 00 00 	movl   $0x0,0x1968
     779:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     77c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     77f:	83 ec 0c             	sub    $0xc,%esp
     782:	ff 34 85 64 19 00 00 	pushl  0x1964(,%eax,4)
     789:	e8 f2 fd ff ff       	call   580 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     78e:	a1 88 a8 00 00       	mov    0xa888,%eax
     793:	83 c4 10             	add    $0x10,%esp
     796:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     799:	b8 68 19 00 00       	mov    $0x1968,%eax
     79e:	c1 e2 02             	shl    $0x2,%edx
     7a1:	c7 82 68 19 00 00 00 	movl   $0x0,0x1968(%edx)
     7a8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     7ab:	c7 82 60 19 00 00 ff 	movl   $0xffffffff,0x1960(%edx)
     7b2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     7b5:	c7 82 6c 19 00 00 00 	movl   $0x0,0x196c(%edx)
     7bc:	00 00 00 
  threads[index_currently_running].esp = 0;
     7bf:	c7 82 70 19 00 00 00 	movl   $0x0,0x1970(%edx)
     7c6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     7c9:	c7 82 7c 19 00 00 00 	movl   $0x0,0x197c(%edx)
     7d0:	00 00 00 
  threads[index_currently_running].join = -1;
     7d3:	c7 82 80 19 00 00 ff 	movl   $0xffffffff,0x1980(%edx)
     7da:	ff ff ff 
     7dd:	eb 0b                	jmp    7ea <uthread_exit+0xaa>
     7df:	90                   	nop
     7e0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     7e3:	3d 68 22 00 00       	cmp    $0x2268,%eax
     7e8:	74 15                	je     7ff <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     7ea:	83 38 04             	cmpl   $0x4,(%eax)
     7ed:	75 f1                	jne    7e0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     7ef:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     7f5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     7f8:	3d 68 22 00 00       	cmp    $0x2268,%eax
     7fd:	75 eb                	jne    7ea <uthread_exit+0xaa>
     7ff:	bb 8c 19 00 00       	mov    $0x198c,%ebx
     804:	eb 15                	jmp    81b <uthread_exit+0xdb>
     806:	8d 76 00             	lea    0x0(%esi),%esi
     809:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     810:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     813:	81 fb 68 22 00 00    	cmp    $0x2268,%ebx
     819:	74 24                	je     83f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     81b:	8b 03                	mov    (%ebx),%eax
     81d:	85 c0                	test   %eax,%eax
     81f:	74 ef                	je     810 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     821:	e8 cc fa ff ff       	call   2f2 <getpid>
     826:	83 ec 08             	sub    $0x8,%esp
     829:	83 c3 24             	add    $0x24,%ebx
     82c:	6a 0e                	push   $0xe
     82e:	50                   	push   %eax
     82f:	e8 e6 fa ff ff       	call   31a <sigsend>
     834:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     837:	81 fb 68 22 00 00    	cmp    $0x2268,%ebx
     83d:	75 dc                	jne    81b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     83f:	e8 2e fa ff ff       	call   272 <exit>
     844:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     84a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000850 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     850:	55                   	push   %ebp
     851:	ba 88 23 00 00       	mov    $0x2388,%edx
     856:	89 e5                	mov    %esp,%ebp
     858:	90                   	nop
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     860:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     866:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     86c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     870:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     876:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     879:	39 d0                	cmp    %edx,%eax
     87b:	75 f3                	jne    870 <init_bsem+0x20>
     87d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     883:	81 fa 88 a9 00 00    	cmp    $0xa988,%edx
     889:	75 d5                	jne    860 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     88b:	c7 05 4c 19 00 00 01 	movl   $0x1,0x194c
     892:	00 00 00 
}
     895:	5d                   	pop    %ebp
     896:	c3                   	ret    
     897:	89 f6                	mov    %esi,%esi
     899:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008a0 <bsem_alloc>:

int bsem_alloc() {
     8a0:	55                   	push   %ebp
     8a1:	89 e5                	mov    %esp,%ebp
     8a3:	53                   	push   %ebx
     8a4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     8a7:	6a 00                	push   $0x0
     8a9:	e8 7c fa ff ff       	call   32a <alarm>
  int i;
  if(first_run_bsem == 0)
     8ae:	a1 4c 19 00 00       	mov    0x194c,%eax
     8b3:	83 c4 10             	add    $0x10,%esp
     8b6:	85 c0                	test   %eax,%eax
     8b8:	75 3b                	jne    8f5 <bsem_alloc+0x55>
     8ba:	ba 88 23 00 00       	mov    $0x2388,%edx
     8bf:	90                   	nop
     8c0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     8c6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     8cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     8d0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     8d6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     8d9:	39 d0                	cmp    %edx,%eax
     8db:	75 f3                	jne    8d0 <bsem_alloc+0x30>
     8dd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     8e3:	81 fa 88 a9 00 00    	cmp    $0xa988,%edx
     8e9:	75 d5                	jne    8c0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     8eb:	c7 05 4c 19 00 00 01 	movl   $0x1,0x194c
     8f2:	00 00 00 
     8f5:	ba 88 23 00 00       	mov    $0x2388,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     8fa:	31 c0                	xor    %eax,%eax
     8fc:	eb 10                	jmp    90e <bsem_alloc+0x6e>
     8fe:	83 c0 01             	add    $0x1,%eax
     901:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     907:	3d 80 00 00 00       	cmp    $0x80,%eax
     90c:	74 4f                	je     95d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     90e:	83 3a 01             	cmpl   $0x1,(%edx)
     911:	75 eb                	jne    8fe <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     913:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     919:	8b 15 2c 19 00 00    	mov    0x192c,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     91f:	83 ec 0c             	sub    $0xc,%esp
     922:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     924:	8d 98 80 22 00 00    	lea    0x2280(%eax),%ebx
     92a:	89 90 84 22 00 00    	mov    %edx,0x2284(%eax)
    binSemCounter++;
     930:	83 c2 01             	add    $0x1,%edx
     933:	89 15 2c 19 00 00    	mov    %edx,0x192c
    binSemaphore[i].lock = 1; // not locked
     939:	c7 80 80 22 00 00 01 	movl   $0x1,0x2280(%eax)
     940:	00 00 00 
    binSemaphore[i].state = USED;
     943:	c7 80 88 23 00 00 00 	movl   $0x0,0x2388(%eax)
     94a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     94d:	e8 d8 f9 ff ff       	call   32a <alarm>
    return binSemaphore[i].id;
     952:	8b 43 04             	mov    0x4(%ebx),%eax
     955:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     958:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     95b:	c9                   	leave  
     95c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     95d:	83 ec 08             	sub    $0x8,%esp
     960:	68 08 12 00 00       	push   $0x1208
     965:	6a 01                	push   $0x1
     967:	e8 74 fa ff ff       	call   3e0 <printf>
    alarm(UTHREAD_QUANTA);
     96c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     973:	e8 b2 f9 ff ff       	call   32a <alarm>
    return -1;
     978:	83 c4 10             	add    $0x10,%esp
     97b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     980:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     983:	c9                   	leave  
     984:	c3                   	ret    
     985:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     989:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000990 <bsem_free>:

void bsem_free(int id) {
     990:	55                   	push   %ebp
     991:	89 e5                	mov    %esp,%ebp
     993:	53                   	push   %ebx
     994:	83 ec 10             	sub    $0x10,%esp
     997:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     99a:	6a 00                	push   $0x0
     99c:	e8 89 f9 ff ff       	call   32a <alarm>
     9a1:	ba 84 22 00 00       	mov    $0x2284,%edx
     9a6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     9a9:	31 c0                	xor    %eax,%eax
     9ab:	eb 13                	jmp    9c0 <bsem_free+0x30>
     9ad:	8d 76 00             	lea    0x0(%esi),%esi
     9b0:	83 c0 01             	add    $0x1,%eax
     9b3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     9b9:	3d 80 00 00 00       	cmp    $0x80,%eax
     9be:	74 38                	je     9f8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     9c0:	39 1a                	cmp    %ebx,(%edx)
     9c2:	75 ec                	jne    9b0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     9c4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     9ca:	05 80 22 00 00       	add    $0x2280,%eax
     9cf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     9d6:	74 0a                	je     9e2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     9d8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     9df:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     9e2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     9e9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9ec:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     9ed:	e9 38 f9 ff ff       	jmp    32a <alarm>
     9f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     9f8:	83 ec 04             	sub    $0x4,%esp
     9fb:	53                   	push   %ebx
     9fc:	68 64 13 00 00       	push   $0x1364
     a01:	6a 01                	push   $0x1
     a03:	e8 d8 f9 ff ff       	call   3e0 <printf>
     a08:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a0b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a12:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a15:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a16:	e9 0f f9 ff ff       	jmp    32a <alarm>
     a1b:	90                   	nop
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a20 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     a20:	55                   	push   %ebp
     a21:	89 e5                	mov    %esp,%ebp
     a23:	53                   	push   %ebx
     a24:	83 ec 10             	sub    $0x10,%esp
     a27:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a2a:	6a 00                	push   $0x0
     a2c:	e8 f9 f8 ff ff       	call   32a <alarm>
     a31:	b8 84 22 00 00       	mov    $0x2284,%eax
     a36:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a39:	31 d2                	xor    %edx,%edx
     a3b:	eb 17                	jmp    a54 <bsem_down+0x34>
     a3d:	8d 76 00             	lea    0x0(%esi),%esi
     a40:	83 c2 01             	add    $0x1,%edx
     a43:	05 0c 01 00 00       	add    $0x10c,%eax
     a48:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     a4e:	0f 84 8c 00 00 00    	je     ae0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     a54:	39 18                	cmp    %ebx,(%eax)
     a56:	75 e8                	jne    a40 <bsem_down+0x20>
     a58:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     a5e:	85 c9                	test   %ecx,%ecx
     a60:	75 de                	jne    a40 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     a62:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     a68:	31 c0                	xor    %eax,%eax
     a6a:	83 b9 80 22 00 00 01 	cmpl   $0x1,0x2280(%ecx)
     a71:	75 15                	jne    a88 <bsem_down+0x68>
     a73:	e9 93 00 00 00       	jmp    b0b <bsem_down+0xeb>
     a78:	90                   	nop
     a79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     a80:	83 c0 01             	add    $0x1,%eax
     a83:	83 f8 40             	cmp    $0x40,%eax
     a86:	74 7b                	je     b03 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     a88:	83 bc 81 88 22 00 00 	cmpl   $0xffffffff,0x2288(%ecx,%eax,4)
     a8f:	ff 
     a90:	75 ee                	jne    a80 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     a92:	8b 0d 88 a8 00 00    	mov    0xa888,%ecx
     a98:	6b d2 43             	imul   $0x43,%edx,%edx
     a9b:	01 c2                	add    %eax,%edx
     a9d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     aa0:	8b 04 85 60 19 00 00 	mov    0x1960(,%eax,4),%eax
     aa7:	89 04 95 88 22 00 00 	mov    %eax,0x2288(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     aae:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     ab1:	c7 04 85 68 19 00 00 	movl   $0x4,0x1968(,%eax,4)
     ab8:	04 00 00 00 

	 sigsend(getpid(),14);
     abc:	e8 31 f8 ff ff       	call   2f2 <getpid>
     ac1:	83 ec 08             	sub    $0x8,%esp
     ac4:	6a 0e                	push   $0xe
     ac6:	50                   	push   %eax
     ac7:	e8 4e f8 ff ff       	call   31a <sigsend>
     acc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     acf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     ad6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ad9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     ada:	e9 4b f8 ff ff       	jmp    32a <alarm>
     adf:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     ae0:	83 ec 04             	sub    $0x4,%esp
     ae3:	53                   	push   %ebx
     ae4:	68 28 12 00 00       	push   $0x1228
     ae9:	6a 01                	push   $0x1
     aeb:	e8 f0 f8 ff ff       	call   3e0 <printf>
     af0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     af3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     afa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     afd:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     afe:	e9 27 f8 ff ff       	jmp    32a <alarm>
     b03:	8b 0d 88 a8 00 00    	mov    0xa888,%ecx
     b09:	eb a3                	jmp    aae <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     b0b:	c7 81 80 22 00 00 00 	movl   $0x0,0x2280(%ecx)
     b12:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b15:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b1c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b1f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b20:	e9 05 f8 ff ff       	jmp    32a <alarm>
     b25:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b30 <bsem_up>:
}

void bsem_up(int id) {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	57                   	push   %edi
     b34:	56                   	push   %esi
     b35:	53                   	push   %ebx
     b36:	83 ec 28             	sub    $0x28,%esp
     b39:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b3c:	6a 00                	push   $0x0
     b3e:	e8 e7 f7 ff ff       	call   32a <alarm>
     b43:	ba 84 22 00 00       	mov    $0x2284,%edx
     b48:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b4b:	31 c0                	xor    %eax,%eax
     b4d:	eb 15                	jmp    b64 <bsem_up+0x34>
     b4f:	90                   	nop
     b50:	83 c0 01             	add    $0x1,%eax
     b53:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     b59:	3d 80 00 00 00       	cmp    $0x80,%eax
     b5e:	0f 84 ac 00 00 00    	je     c10 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     b64:	39 1a                	cmp    %ebx,(%edx)
     b66:	75 e8                	jne    b50 <bsem_up+0x20>
     b68:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     b6e:	85 c9                	test   %ecx,%ecx
     b70:	75 de                	jne    b50 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     b72:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     b78:	8b 97 80 22 00 00    	mov    0x2280(%edi),%edx
     b7e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     b81:	85 d2                	test   %edx,%edx
     b83:	0f 85 9c 00 00 00    	jne    c25 <bsem_up+0xf5>
     b89:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     b8b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     b8e:	8b b4 be 88 22 00 00 	mov    0x2288(%esi,%edi,4),%esi
     b95:	83 fe ff             	cmp    $0xffffffff,%esi
     b98:	74 56                	je     bf0 <bsem_up+0xc0>
     b9a:	b9 60 19 00 00       	mov    $0x1960,%ecx
     b9f:	31 d2                	xor    %edx,%edx
     ba1:	eb 10                	jmp    bb3 <bsem_up+0x83>
     ba3:	90                   	nop
     ba4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     ba8:	83 c2 01             	add    $0x1,%edx
     bab:	83 c1 24             	add    $0x24,%ecx
     bae:	83 fa 40             	cmp    $0x40,%edx
     bb1:	74 3d                	je     bf0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     bb3:	8b 19                	mov    (%ecx),%ebx
     bb5:	39 de                	cmp    %ebx,%esi
     bb7:	75 ef                	jne    ba8 <bsem_up+0x78>
     bb9:	83 fb ff             	cmp    $0xffffffff,%ebx
     bbc:	74 ea                	je     ba8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     bbe:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     bc1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     bc4:	c7 04 95 68 19 00 00 	movl   $0x2,0x1968(,%edx,4)
     bcb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     bcf:	01 c7                	add    %eax,%edi
     bd1:	c7 04 bd 88 22 00 00 	movl   $0xffffffff,0x2288(,%edi,4)
     bd8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     bdc:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     be3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     be6:	5b                   	pop    %ebx
     be7:	5e                   	pop    %esi
     be8:	5f                   	pop    %edi
     be9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     bea:	e9 3b f7 ff ff       	jmp    32a <alarm>
     bef:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     bf0:	83 c7 01             	add    $0x1,%edi
     bf3:	83 ff 40             	cmp    $0x40,%edi
     bf6:	75 93                	jne    b8b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     bf8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     bfe:	c7 80 80 22 00 00 01 	movl   $0x1,0x2280(%eax)
     c05:	00 00 00 
     c08:	eb d2                	jmp    bdc <bsem_up+0xac>
     c0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     c10:	83 ec 04             	sub    $0x4,%esp
     c13:	53                   	push   %ebx
     c14:	68 90 12 00 00       	push   $0x1290
     c19:	6a 01                	push   $0x1
     c1b:	e8 c0 f7 ff ff       	call   3e0 <printf>
     c20:	83 c4 10             	add    $0x10,%esp
     c23:	eb b7                	jmp    bdc <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     c25:	83 ec 08             	sub    $0x8,%esp
     c28:	68 6c 12 00 00       	push   $0x126c
     c2d:	6a 01                	push   $0x1
     c2f:	e8 ac f7 ff ff       	call   3e0 <printf>
     c34:	83 c4 10             	add    $0x10,%esp
     c37:	eb a3                	jmp    bdc <bsem_up+0xac>
     c39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c40 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     c46:	68 d4 12 00 00       	push   $0x12d4
     c4b:	6a 01                	push   $0x1
     c4d:	e8 8e f7 ff ff       	call   3e0 <printf>
     c52:	b8 60 19 00 00       	mov    $0x1960,%eax
     c57:	83 c4 10             	add    $0x10,%esp
     c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     c60:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     c66:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     c6d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     c70:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     c77:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     c7e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     c85:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     c8c:	3d 60 22 00 00       	cmp    $0x2260,%eax
     c91:	75 cd                	jne    c60 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     c93:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     c96:	c7 05 60 19 00 00 00 	movl   $0x0,0x1960
     c9d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     ca0:	c7 05 68 19 00 00 03 	movl   $0x3,0x1968
     ca7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     caa:	68 40 0e 00 00       	push   $0xe40
     caf:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     cb1:	c7 05 64 19 00 00 00 	movl   $0x0,0x1964
     cb8:	00 00 00 

  id_number_thread = 1;
     cbb:	c7 05 84 a8 00 00 01 	movl   $0x1,0xa884
     cc2:	00 00 00 
  index_currently_running = 0;
     cc5:	c7 05 88 a8 00 00 00 	movl   $0x0,0xa888
     ccc:	00 00 00 
  currently_running = 0;
     ccf:	c7 05 60 22 00 00 00 	movl   $0x0,0x2260
     cd6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cd9:	e8 34 f6 ff ff       	call   312 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     cde:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     ce5:	e8 40 f6 ff ff       	call   32a <alarm>
  return 0;
}
     cea:	31 c0                	xor    %eax,%eax
     cec:	c9                   	leave  
     ced:	c3                   	ret    
     cee:	66 90                	xchg   %ax,%ax

00000cf0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	53                   	push   %ebx
  alarm(0);
     cf5:	83 ec 0c             	sub    $0xc,%esp
     cf8:	6a 00                	push   $0x0
     cfa:	e8 2b f6 ff ff       	call   32a <alarm>
  printf(1, "------ creating a new thread ------\n");
     cff:	5b                   	pop    %ebx
     d00:	5e                   	pop    %esi
     d01:	68 00 13 00 00       	push   $0x1300
     d06:	6a 01                	push   $0x1
     d08:	e8 d3 f6 ff ff       	call   3e0 <printf>
     d0d:	ba 68 19 00 00       	mov    $0x1968,%edx
     d12:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     d15:	31 c0                	xor    %eax,%eax
     d17:	eb 12                	jmp    d2b <uthread_create+0x3b>
     d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d20:	83 c0 01             	add    $0x1,%eax
     d23:	83 c2 24             	add    $0x24,%edx
     d26:	83 f8 40             	cmp    $0x40,%eax
     d29:	74 7d                	je     da8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     d2b:	8b 0a                	mov    (%edx),%ecx
     d2d:	85 c9                	test   %ecx,%ecx
     d2f:	75 ef                	jne    d20 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d31:	8b 15 84 a8 00 00    	mov    0xa884,%edx
     d37:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d3a:	83 ec 0c             	sub    $0xc,%esp
     d3d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d42:	c1 e3 02             	shl    $0x2,%ebx
     d45:	89 93 60 19 00 00    	mov    %edx,0x1960(%ebx)
  id_number_thread++;
     d4b:	83 c2 01             	add    $0x1,%edx
     d4e:	89 15 84 a8 00 00    	mov    %edx,0xa884

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d54:	e8 b7 f8 ff ff       	call   610 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     d59:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     d5c:	c7 80 f4 0f 00 00 40 	movl   $0x740,0xff4(%eax)
     d63:	07 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d66:	89 83 64 19 00 00    	mov    %eax,0x1964(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     d6c:	c7 83 68 19 00 00 02 	movl   $0x2,0x1968(%ebx)
     d73:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     d76:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     d7c:	8b 55 0c             	mov    0xc(%ebp),%edx
     d7f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     d85:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     d8c:	e8 99 f5 ff ff       	call   32a <alarm>
  return   threads[free_thread].thread_id;
     d91:	8b 83 60 19 00 00    	mov    0x1960(%ebx),%eax
     d97:	83 c4 10             	add    $0x10,%esp
}
     d9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d9d:	5b                   	pop    %ebx
     d9e:	5e                   	pop    %esi
     d9f:	5d                   	pop    %ebp
     da0:	c3                   	ret    
     da1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     da8:	83 ec 08             	sub    $0x8,%esp
     dab:	68 76 13 00 00       	push   $0x1376
     db0:	6a 01                	push   $0x1
     db2:	e8 29 f6 ff ff       	call   3e0 <printf>
    alarm(UTHREAD_QUANTA);
     db7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dbe:	e8 67 f5 ff ff       	call   32a <alarm>
    return -1;
     dc3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     dc6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     dc9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     dce:	5b                   	pop    %ebx
     dcf:	5e                   	pop    %esi
     dd0:	5d                   	pop    %ebp
     dd1:	c3                   	ret    
     dd2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     dd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000de0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     de0:	55                   	push   %ebp
     de1:	89 e5                	mov    %esp,%ebp
     de3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     de6:	85 c0                	test   %eax,%eax
     de8:	74 14                	je     dfe <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     dea:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     ded:	89 e2                	mov    %esp,%edx
     def:	8d 04 85 60 19 00 00 	lea    0x1960(,%eax,4),%eax
     df6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     df9:	89 ea                	mov    %ebp,%edx
     dfb:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     dfe:	a1 88 a8 00 00       	mov    0xa888,%eax
     e03:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e06:	8d 04 85 60 19 00 00 	lea    0x1960(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e0d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e10:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e17:	85 d2                	test   %edx,%edx
     e19:	74 0d                	je     e28 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     e1b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     e1d:	8b 40 0c             	mov    0xc(%eax),%eax
     e20:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     e22:	5d                   	pop    %ebp
     e23:	c3                   	ret    
     e24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e28:	8b 40 04             	mov    0x4(%eax),%eax
     e2b:	05 f4 0f 00 00       	add    $0xff4,%eax
     e30:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e32:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     e34:	b8 00 07 00 00       	mov    $0x700,%eax
     e39:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     e3b:	5d                   	pop    %ebp
     e3c:	c3                   	ret    
     e3d:	8d 76 00             	lea    0x0(%esi),%esi

00000e40 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	56                   	push   %esi
     e44:	53                   	push   %ebx
     e45:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     e48:	83 ec 0c             	sub    $0xc,%esp
     e4b:	6a 00                	push   $0x0
     e4d:	e8 d8 f4 ff ff       	call   32a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     e52:	a1 88 a8 00 00       	mov    0xa888,%eax
     e57:	83 c4 10             	add    $0x10,%esp
     e5a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     e5d:	8d 14 95 60 19 00 00 	lea    0x1960(,%edx,4),%edx
     e64:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     e68:	75 0b                	jne    e75 <uthread_schedule+0x35>
     e6a:	85 c0                	test   %eax,%eax
     e6c:	74 07                	je     e75 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     e6e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     e75:	bb 68 19 00 00       	mov    $0x1968,%ebx
     e7a:	eb 0f                	jmp    e8b <uthread_schedule+0x4b>
     e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e80:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     e83:	81 fb 68 22 00 00    	cmp    $0x2268,%ebx
     e89:	74 55                	je     ee0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     e8b:	83 3b 01             	cmpl   $0x1,(%ebx)
     e8e:	75 f0                	jne    e80 <uthread_schedule+0x40>
     e90:	8b 73 14             	mov    0x14(%ebx),%esi
     e93:	85 f6                	test   %esi,%esi
     e95:	0f 85 a5 00 00 00    	jne    f40 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     e9b:	8b 43 18             	mov    0x18(%ebx),%eax
     e9e:	83 f8 ff             	cmp    $0xffffffff,%eax
     ea1:	74 dd                	je     e80 <uthread_schedule+0x40>
     ea3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ea6:	8b 14 95 68 19 00 00 	mov    0x1968(,%edx,4),%edx
     ead:	85 d2                	test   %edx,%edx
     eaf:	75 cf                	jne    e80 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     eb1:	50                   	push   %eax
     eb2:	ff 73 f8             	pushl  -0x8(%ebx)
     eb5:	83 c3 24             	add    $0x24,%ebx
     eb8:	68 28 13 00 00       	push   $0x1328
     ebd:	6a 01                	push   $0x1
     ebf:	e8 1c f5 ff ff       	call   3e0 <printf>
      threads[i].join = -1;
     ec4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     ecb:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     ed2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     ed5:	81 fb 68 22 00 00    	cmp    $0x2268,%ebx
     edb:	75 ae                	jne    e8b <uthread_schedule+0x4b>
     edd:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     ee0:	8b 15 88 a8 00 00    	mov    0xa888,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     ee6:	b9 40 00 00 00       	mov    $0x40,%ecx
     eeb:	8d 42 01             	lea    0x1(%edx),%eax
     eee:	eb 08                	jmp    ef8 <uthread_schedule+0xb8>
     ef0:	83 c0 01             	add    $0x1,%eax
     ef3:	83 e9 01             	sub    $0x1,%ecx
     ef6:	74 78                	je     f70 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     ef8:	89 c3                	mov    %eax,%ebx
     efa:	c1 fb 1f             	sar    $0x1f,%ebx
     efd:	c1 eb 1a             	shr    $0x1a,%ebx
     f00:	01 d8                	add    %ebx,%eax
     f02:	83 e0 3f             	and    $0x3f,%eax
     f05:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     f07:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     f0a:	83 3c 9d 68 19 00 00 	cmpl   $0x2,0x1968(,%ebx,4)
     f11:	02 
     f12:	75 dc                	jne    ef0 <uthread_schedule+0xb0>
     f14:	39 c2                	cmp    %eax,%edx
     f16:	74 d8                	je     ef0 <uthread_schedule+0xb0>
      index_currently_running = i;
     f18:	a3 88 a8 00 00       	mov    %eax,0xa888
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     f1d:	83 ec 08             	sub    $0x8,%esp
     f20:	50                   	push   %eax
     f21:	52                   	push   %edx
     f22:	e8 b9 fe ff ff       	call   de0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     f27:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f2e:	e8 f7 f3 ff ff       	call   32a <alarm>
}
     f33:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f36:	5b                   	pop    %ebx
     f37:	5e                   	pop    %esi
     f38:	5d                   	pop    %ebp
     f39:	c3                   	ret    
     f3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f40:	e8 c5 f3 ff ff       	call   30a <uptime>
     f45:	39 c6                	cmp    %eax,%esi
     f47:	7f 17                	jg     f60 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
     f49:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
     f4f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
     f56:	e9 25 ff ff ff       	jmp    e80 <uthread_schedule+0x40>
     f5b:	90                   	nop
     f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     f60:	83 3b 01             	cmpl   $0x1,(%ebx)
     f63:	0f 84 32 ff ff ff    	je     e9b <uthread_schedule+0x5b>
     f69:	e9 12 ff ff ff       	jmp    e80 <uthread_schedule+0x40>
     f6e:	66 90                	xchg   %ax,%ax
     f70:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
     f73:	83 3c 85 68 19 00 00 	cmpl   $0x2,0x1968(,%eax,4)
     f7a:	02 
     f7b:	0f 85 c7 fe ff ff    	jne    e48 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     f81:	89 d0                	mov    %edx,%eax
     f83:	eb 98                	jmp    f1d <uthread_schedule+0xdd>
     f85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f90 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     f90:	a1 88 a8 00 00       	mov    0xa888,%eax
  exit();
}

int
uthread_self()
{
     f95:	55                   	push   %ebp
     f96:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
     f98:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
     f9b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     f9c:	8b 04 85 60 19 00 00 	mov    0x1960(,%eax,4),%eax
}
     fa3:	c3                   	ret    
     fa4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     faa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000fb0 <uthread_join>:

int
uthread_join(int tid)
{
     fb0:	55                   	push   %ebp
     fb1:	89 e5                	mov    %esp,%ebp
     fb3:	56                   	push   %esi
     fb4:	53                   	push   %ebx
     fb5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
     fb8:	39 35 84 a8 00 00    	cmp    %esi,0xa884
     fbe:	0f 8c ab 00 00 00    	jl     106f <uthread_join+0xbf>
     fc4:	89 f0                	mov    %esi,%eax
     fc6:	c1 e8 1f             	shr    $0x1f,%eax
     fc9:	84 c0                	test   %al,%al
     fcb:	0f 85 9e 00 00 00    	jne    106f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
     fd1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
     fd4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
     fd6:	6a 00                	push   $0x0
     fd8:	e8 4d f3 ff ff       	call   32a <alarm>
     fdd:	b8 60 19 00 00       	mov    $0x1960,%eax
     fe2:	83 c4 10             	add    $0x10,%esp
     fe5:	eb 14                	jmp    ffb <uthread_join+0x4b>
     fe7:	89 f6                	mov    %esi,%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
     ff0:	83 c3 01             	add    $0x1,%ebx
     ff3:	83 c0 24             	add    $0x24,%eax
     ff6:	83 fb 40             	cmp    $0x40,%ebx
     ff9:	74 55                	je     1050 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
     ffb:	3b 30                	cmp    (%eax),%esi
     ffd:	75 f1                	jne    ff0 <uthread_join+0x40>
     fff:	8b 50 08             	mov    0x8(%eax),%edx
    1002:	85 d2                	test   %edx,%edx
    1004:	74 ea                	je     ff0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1006:	53                   	push   %ebx
    1007:	ff 35 88 a8 00 00    	pushl  0xa888
    100d:	68 b2 13 00 00       	push   $0x13b2
    1012:	6a 01                	push   $0x1
    1014:	e8 c7 f3 ff ff       	call   3e0 <printf>
    threads[index_currently_running].join=found_tid;
    1019:	a1 88 a8 00 00       	mov    0xa888,%eax
    101e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1021:	8d 04 85 60 19 00 00 	lea    0x1960(,%eax,4),%eax
    1028:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    102b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1032:	e8 bb f2 ff ff       	call   2f2 <getpid>
    1037:	5a                   	pop    %edx
    1038:	59                   	pop    %ecx
    1039:	6a 0e                	push   $0xe
    103b:	50                   	push   %eax
    103c:	e8 d9 f2 ff ff       	call   31a <sigsend>
  }
  return 0;
    1041:	83 c4 10             	add    $0x10,%esp

}
    1044:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1047:	31 c0                	xor    %eax,%eax

}
    1049:	5b                   	pop    %ebx
    104a:	5e                   	pop    %esi
    104b:	5d                   	pop    %ebp
    104c:	c3                   	ret    
    104d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1050:	83 ec 04             	sub    $0x4,%esp
    1053:	56                   	push   %esi
    1054:	68 94 13 00 00       	push   $0x1394
    1059:	6a 01                	push   $0x1
    105b:	e8 80 f3 ff ff       	call   3e0 <printf>
    alarm(UTHREAD_QUANTA);
    1060:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1067:	e8 be f2 ff ff       	call   32a <alarm>
    return -1;
    106c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    106f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1072:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1077:	5b                   	pop    %ebx
    1078:	5e                   	pop    %esi
    1079:	5d                   	pop    %ebp
    107a:	c3                   	ret    
    107b:	90                   	nop
    107c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001080 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1080:	55                   	push   %ebp
    1081:	89 e5                	mov    %esp,%ebp
    1083:	53                   	push   %ebx
    1084:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1087:	6a 00                	push   $0x0
    1089:	e8 9c f2 ff ff       	call   32a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    108e:	8b 1d 88 a8 00 00    	mov    0xa888,%ebx
    1094:	e8 71 f2 ff ff       	call   30a <uptime>
    1099:	03 45 08             	add    0x8(%ebp),%eax
    109c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    109f:	89 04 95 7c 19 00 00 	mov    %eax,0x197c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    10a6:	a1 88 a8 00 00       	mov    0xa888,%eax
    10ab:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10ae:	c7 04 85 68 19 00 00 	movl   $0x1,0x1968(,%eax,4)
    10b5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    10b9:	e8 34 f2 ff ff       	call   2f2 <getpid>
    10be:	5a                   	pop    %edx
    10bf:	59                   	pop    %ecx
    10c0:	6a 0e                	push   $0xe
    10c2:	50                   	push   %eax
    10c3:	e8 52 f2 ff ff       	call   31a <sigsend>
  return 0;
}
    10c8:	31 c0                	xor    %eax,%eax
    10ca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10cd:	c9                   	leave  
    10ce:	c3                   	ret    
    10cf:	90                   	nop

000010d0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	83 ec 04             	sub    $0x4,%esp
    10d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    10da:	8b 45 0c             	mov    0xc(%ebp),%eax
    10dd:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    10e0:	e8 bb f7 ff ff       	call   8a0 <bsem_alloc>
    10e5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    10e7:	e8 b4 f7 ff ff       	call   8a0 <bsem_alloc>
    10ec:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    10ef:	83 c4 04             	add    $0x4,%esp
    10f2:	5b                   	pop    %ebx
    10f3:	5d                   	pop    %ebp
    10f4:	c3                   	ret    
    10f5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001100 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	83 ec 10             	sub    $0x10,%esp
    1107:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    110a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1111:	ff 33                	pushl  (%ebx)
    1113:	e8 78 f8 ff ff       	call   990 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1118:	8b 43 04             	mov    0x4(%ebx),%eax
    111b:	83 c4 10             	add    $0x10,%esp
}
    111e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1121:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1124:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1125:	e9 66 f8 ff ff       	jmp    990 <bsem_free>
    112a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001130 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	83 ec 10             	sub    $0x10,%esp
    1137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    113a:	ff 73 04             	pushl  0x4(%ebx)
    113d:	e8 de f8 ff ff       	call   a20 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1142:	58                   	pop    %eax
    1143:	ff 33                	pushl  (%ebx)
    1145:	e8 d6 f8 ff ff       	call   a20 <bsem_down>
  csem->value--;
    114a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    114d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1150:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1153:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1155:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1158:	7e 0e                	jle    1168 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    115a:	83 ec 0c             	sub    $0xc,%esp
    115d:	ff 73 04             	pushl  0x4(%ebx)
    1160:	e8 cb f9 ff ff       	call   b30 <bsem_up>
    1165:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1168:	8b 03                	mov    (%ebx),%eax
}
    116a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    116d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1170:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1171:	e9 ba f9 ff ff       	jmp    b30 <bsem_up>
    1176:	8d 76 00             	lea    0x0(%esi),%esi
    1179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001180 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	83 ec 10             	sub    $0x10,%esp
    1187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    118a:	ff 33                	pushl  (%ebx)
    118c:	e8 8f f8 ff ff       	call   a20 <bsem_down>
  csem->value++;
    1191:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1194:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1197:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    119a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    119d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    11a0:	74 0e                	je     11b0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11a2:	8b 03                	mov    (%ebx),%eax
}
    11a4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11a7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11aa:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11ab:	e9 80 f9 ff ff       	jmp    b30 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11b0:	83 ec 0c             	sub    $0xc,%esp
    11b3:	ff 73 04             	pushl  0x4(%ebx)
    11b6:	e8 75 f9 ff ff       	call   b30 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    11bb:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11bd:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    11c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11c3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11c6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11c7:	e9 64 f9 ff ff       	jmp    b30 <bsem_up>
