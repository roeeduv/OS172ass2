
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
  if(argc != 3){
       7:	83 39 03             	cmpl   $0x3,(%ecx)
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       a:	ff 71 fc             	pushl  -0x4(%ecx)
       d:	55                   	push   %ebp
       e:	89 e5                	mov    %esp,%ebp
      10:	53                   	push   %ebx
      11:	51                   	push   %ecx
      12:	8b 59 04             	mov    0x4(%ecx),%ebx
  if(argc != 3){
      15:	74 14                	je     2b <main+0x2b>
    printf(2, "Usage: ln old new\n");
      17:	83 ec 08             	sub    $0x8,%esp
      1a:	68 fc 11 00 00       	push   $0x11fc
      1f:	6a 02                	push   $0x2
      21:	e8 ea 03 00 00       	call   410 <printf>
    exit();
      26:	e8 77 02 00 00       	call   2a2 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
      2b:	50                   	push   %eax
      2c:	50                   	push   %eax
      2d:	ff 73 08             	pushl  0x8(%ebx)
      30:	ff 73 04             	pushl  0x4(%ebx)
      33:	e8 ca 02 00 00       	call   302 <link>
      38:	83 c4 10             	add    $0x10,%esp
      3b:	85 c0                	test   %eax,%eax
      3d:	78 05                	js     44 <main+0x44>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  exit();
      3f:	e8 5e 02 00 00       	call   2a2 <exit>
  if(argc != 3){
    printf(2, "Usage: ln old new\n");
    exit();
  }
  if(link(argv[1], argv[2]) < 0)
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
      44:	ff 73 08             	pushl  0x8(%ebx)
      47:	ff 73 04             	pushl  0x4(%ebx)
      4a:	68 0f 12 00 00       	push   $0x120f
      4f:	6a 02                	push   $0x2
      51:	e8 ba 03 00 00       	call   410 <printf>
      56:	83 c4 10             	add    $0x10,%esp
      59:	eb e4                	jmp    3f <main+0x3f>
      5b:	66 90                	xchg   %ax,%ax
      5d:	66 90                	xchg   %ax,%ax
      5f:	90                   	nop

00000060 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	53                   	push   %ebx
      64:	8b 45 08             	mov    0x8(%ebp),%eax
      67:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      6a:	89 c2                	mov    %eax,%edx
      6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      70:	83 c1 01             	add    $0x1,%ecx
      73:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
      77:	83 c2 01             	add    $0x1,%edx
      7a:	84 db                	test   %bl,%bl
      7c:	88 5a ff             	mov    %bl,-0x1(%edx)
      7f:	75 ef                	jne    70 <strcpy+0x10>
    ;
  return os;
}
      81:	5b                   	pop    %ebx
      82:	5d                   	pop    %ebp
      83:	c3                   	ret    
      84:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      8a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000090 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	56                   	push   %esi
      94:	53                   	push   %ebx
      95:	8b 55 08             	mov    0x8(%ebp),%edx
      98:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
      9b:	0f b6 02             	movzbl (%edx),%eax
      9e:	0f b6 19             	movzbl (%ecx),%ebx
      a1:	84 c0                	test   %al,%al
      a3:	75 1e                	jne    c3 <strcmp+0x33>
      a5:	eb 29                	jmp    d0 <strcmp+0x40>
      a7:	89 f6                	mov    %esi,%esi
      a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
      b0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      b3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
      b6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      b9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
      bd:	84 c0                	test   %al,%al
      bf:	74 0f                	je     d0 <strcmp+0x40>
      c1:	89 f1                	mov    %esi,%ecx
      c3:	38 d8                	cmp    %bl,%al
      c5:	74 e9                	je     b0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      c7:	29 d8                	sub    %ebx,%eax
}
      c9:	5b                   	pop    %ebx
      ca:	5e                   	pop    %esi
      cb:	5d                   	pop    %ebp
      cc:	c3                   	ret    
      cd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      d0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
      d2:	29 d8                	sub    %ebx,%eax
}
      d4:	5b                   	pop    %ebx
      d5:	5e                   	pop    %esi
      d6:	5d                   	pop    %ebp
      d7:	c3                   	ret    
      d8:	90                   	nop
      d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000e0 <strlen>:

uint
strlen(char *s)
{
      e0:	55                   	push   %ebp
      e1:	89 e5                	mov    %esp,%ebp
      e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
      e6:	80 39 00             	cmpb   $0x0,(%ecx)
      e9:	74 12                	je     fd <strlen+0x1d>
      eb:	31 d2                	xor    %edx,%edx
      ed:	8d 76 00             	lea    0x0(%esi),%esi
      f0:	83 c2 01             	add    $0x1,%edx
      f3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
      f7:	89 d0                	mov    %edx,%eax
      f9:	75 f5                	jne    f0 <strlen+0x10>
    ;
  return n;
}
      fb:	5d                   	pop    %ebp
      fc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
      fd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
      ff:	5d                   	pop    %ebp
     100:	c3                   	ret    
     101:	eb 0d                	jmp    110 <memset>
     103:	90                   	nop
     104:	90                   	nop
     105:	90                   	nop
     106:	90                   	nop
     107:	90                   	nop
     108:	90                   	nop
     109:	90                   	nop
     10a:	90                   	nop
     10b:	90                   	nop
     10c:	90                   	nop
     10d:	90                   	nop
     10e:	90                   	nop
     10f:	90                   	nop

00000110 <memset>:

void*
memset(void *dst, int c, uint n)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	57                   	push   %edi
     114:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     117:	8b 4d 10             	mov    0x10(%ebp),%ecx
     11a:	8b 45 0c             	mov    0xc(%ebp),%eax
     11d:	89 d7                	mov    %edx,%edi
     11f:	fc                   	cld    
     120:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     122:	89 d0                	mov    %edx,%eax
     124:	5f                   	pop    %edi
     125:	5d                   	pop    %ebp
     126:	c3                   	ret    
     127:	89 f6                	mov    %esi,%esi
     129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000130 <strchr>:

char*
strchr(const char *s, char c)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	53                   	push   %ebx
     134:	8b 45 08             	mov    0x8(%ebp),%eax
     137:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     13a:	0f b6 10             	movzbl (%eax),%edx
     13d:	84 d2                	test   %dl,%dl
     13f:	74 1d                	je     15e <strchr+0x2e>
    if(*s == c)
     141:	38 d3                	cmp    %dl,%bl
     143:	89 d9                	mov    %ebx,%ecx
     145:	75 0d                	jne    154 <strchr+0x24>
     147:	eb 17                	jmp    160 <strchr+0x30>
     149:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     150:	38 ca                	cmp    %cl,%dl
     152:	74 0c                	je     160 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     154:	83 c0 01             	add    $0x1,%eax
     157:	0f b6 10             	movzbl (%eax),%edx
     15a:	84 d2                	test   %dl,%dl
     15c:	75 f2                	jne    150 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     15e:	31 c0                	xor    %eax,%eax
}
     160:	5b                   	pop    %ebx
     161:	5d                   	pop    %ebp
     162:	c3                   	ret    
     163:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     169:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000170 <gets>:

char*
gets(char *buf, int max)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	57                   	push   %edi
     174:	56                   	push   %esi
     175:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     176:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     178:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     17b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     17e:	eb 29                	jmp    1a9 <gets+0x39>
    cc = read(0, &c, 1);
     180:	83 ec 04             	sub    $0x4,%esp
     183:	6a 01                	push   $0x1
     185:	57                   	push   %edi
     186:	6a 00                	push   $0x0
     188:	e8 2d 01 00 00       	call   2ba <read>
    if(cc < 1)
     18d:	83 c4 10             	add    $0x10,%esp
     190:	85 c0                	test   %eax,%eax
     192:	7e 1d                	jle    1b1 <gets+0x41>
      break;
    buf[i++] = c;
     194:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     198:	8b 55 08             	mov    0x8(%ebp),%edx
     19b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     19d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     19f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     1a3:	74 1b                	je     1c0 <gets+0x50>
     1a5:	3c 0d                	cmp    $0xd,%al
     1a7:	74 17                	je     1c0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1a9:	8d 5e 01             	lea    0x1(%esi),%ebx
     1ac:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     1af:	7c cf                	jl     180 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1b1:	8b 45 08             	mov    0x8(%ebp),%eax
     1b4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1bb:	5b                   	pop    %ebx
     1bc:	5e                   	pop    %esi
     1bd:	5f                   	pop    %edi
     1be:	5d                   	pop    %ebp
     1bf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1c0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1c3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1c5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1c9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1cc:	5b                   	pop    %ebx
     1cd:	5e                   	pop    %esi
     1ce:	5f                   	pop    %edi
     1cf:	5d                   	pop    %ebp
     1d0:	c3                   	ret    
     1d1:	eb 0d                	jmp    1e0 <stat>
     1d3:	90                   	nop
     1d4:	90                   	nop
     1d5:	90                   	nop
     1d6:	90                   	nop
     1d7:	90                   	nop
     1d8:	90                   	nop
     1d9:	90                   	nop
     1da:	90                   	nop
     1db:	90                   	nop
     1dc:	90                   	nop
     1dd:	90                   	nop
     1de:	90                   	nop
     1df:	90                   	nop

000001e0 <stat>:

int
stat(char *n, struct stat *st)
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	56                   	push   %esi
     1e4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1e5:	83 ec 08             	sub    $0x8,%esp
     1e8:	6a 00                	push   $0x0
     1ea:	ff 75 08             	pushl  0x8(%ebp)
     1ed:	e8 f0 00 00 00       	call   2e2 <open>
  if(fd < 0)
     1f2:	83 c4 10             	add    $0x10,%esp
     1f5:	85 c0                	test   %eax,%eax
     1f7:	78 27                	js     220 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     1f9:	83 ec 08             	sub    $0x8,%esp
     1fc:	ff 75 0c             	pushl  0xc(%ebp)
     1ff:	89 c3                	mov    %eax,%ebx
     201:	50                   	push   %eax
     202:	e8 f3 00 00 00       	call   2fa <fstat>
     207:	89 c6                	mov    %eax,%esi
  close(fd);
     209:	89 1c 24             	mov    %ebx,(%esp)
     20c:	e8 b9 00 00 00       	call   2ca <close>
  return r;
     211:	83 c4 10             	add    $0x10,%esp
     214:	89 f0                	mov    %esi,%eax
}
     216:	8d 65 f8             	lea    -0x8(%ebp),%esp
     219:	5b                   	pop    %ebx
     21a:	5e                   	pop    %esi
     21b:	5d                   	pop    %ebp
     21c:	c3                   	ret    
     21d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     220:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     225:	eb ef                	jmp    216 <stat+0x36>
     227:	89 f6                	mov    %esi,%esi
     229:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000230 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	53                   	push   %ebx
     234:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     237:	0f be 11             	movsbl (%ecx),%edx
     23a:	8d 42 d0             	lea    -0x30(%edx),%eax
     23d:	3c 09                	cmp    $0x9,%al
     23f:	b8 00 00 00 00       	mov    $0x0,%eax
     244:	77 1f                	ja     265 <atoi+0x35>
     246:	8d 76 00             	lea    0x0(%esi),%esi
     249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     250:	8d 04 80             	lea    (%eax,%eax,4),%eax
     253:	83 c1 01             	add    $0x1,%ecx
     256:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     25a:	0f be 11             	movsbl (%ecx),%edx
     25d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     260:	80 fb 09             	cmp    $0x9,%bl
     263:	76 eb                	jbe    250 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     265:	5b                   	pop    %ebx
     266:	5d                   	pop    %ebp
     267:	c3                   	ret    
     268:	90                   	nop
     269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000270 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	56                   	push   %esi
     274:	53                   	push   %ebx
     275:	8b 5d 10             	mov    0x10(%ebp),%ebx
     278:	8b 45 08             	mov    0x8(%ebp),%eax
     27b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     27e:	85 db                	test   %ebx,%ebx
     280:	7e 14                	jle    296 <memmove+0x26>
     282:	31 d2                	xor    %edx,%edx
     284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     288:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     28c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     28f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     292:	39 da                	cmp    %ebx,%edx
     294:	75 f2                	jne    288 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     296:	5b                   	pop    %ebx
     297:	5e                   	pop    %esi
     298:	5d                   	pop    %ebp
     299:	c3                   	ret    

0000029a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     29a:	b8 01 00 00 00       	mov    $0x1,%eax
     29f:	cd 40                	int    $0x40
     2a1:	c3                   	ret    

000002a2 <exit>:
SYSCALL(exit)
     2a2:	b8 02 00 00 00       	mov    $0x2,%eax
     2a7:	cd 40                	int    $0x40
     2a9:	c3                   	ret    

000002aa <wait>:
SYSCALL(wait)
     2aa:	b8 03 00 00 00       	mov    $0x3,%eax
     2af:	cd 40                	int    $0x40
     2b1:	c3                   	ret    

000002b2 <pipe>:
SYSCALL(pipe)
     2b2:	b8 04 00 00 00       	mov    $0x4,%eax
     2b7:	cd 40                	int    $0x40
     2b9:	c3                   	ret    

000002ba <read>:
SYSCALL(read)
     2ba:	b8 05 00 00 00       	mov    $0x5,%eax
     2bf:	cd 40                	int    $0x40
     2c1:	c3                   	ret    

000002c2 <write>:
SYSCALL(write)
     2c2:	b8 10 00 00 00       	mov    $0x10,%eax
     2c7:	cd 40                	int    $0x40
     2c9:	c3                   	ret    

000002ca <close>:
SYSCALL(close)
     2ca:	b8 15 00 00 00       	mov    $0x15,%eax
     2cf:	cd 40                	int    $0x40
     2d1:	c3                   	ret    

000002d2 <kill>:
SYSCALL(kill)
     2d2:	b8 06 00 00 00       	mov    $0x6,%eax
     2d7:	cd 40                	int    $0x40
     2d9:	c3                   	ret    

000002da <exec>:
SYSCALL(exec)
     2da:	b8 07 00 00 00       	mov    $0x7,%eax
     2df:	cd 40                	int    $0x40
     2e1:	c3                   	ret    

000002e2 <open>:
SYSCALL(open)
     2e2:	b8 0f 00 00 00       	mov    $0xf,%eax
     2e7:	cd 40                	int    $0x40
     2e9:	c3                   	ret    

000002ea <mknod>:
SYSCALL(mknod)
     2ea:	b8 11 00 00 00       	mov    $0x11,%eax
     2ef:	cd 40                	int    $0x40
     2f1:	c3                   	ret    

000002f2 <unlink>:
SYSCALL(unlink)
     2f2:	b8 12 00 00 00       	mov    $0x12,%eax
     2f7:	cd 40                	int    $0x40
     2f9:	c3                   	ret    

000002fa <fstat>:
SYSCALL(fstat)
     2fa:	b8 08 00 00 00       	mov    $0x8,%eax
     2ff:	cd 40                	int    $0x40
     301:	c3                   	ret    

00000302 <link>:
SYSCALL(link)
     302:	b8 13 00 00 00       	mov    $0x13,%eax
     307:	cd 40                	int    $0x40
     309:	c3                   	ret    

0000030a <mkdir>:
SYSCALL(mkdir)
     30a:	b8 14 00 00 00       	mov    $0x14,%eax
     30f:	cd 40                	int    $0x40
     311:	c3                   	ret    

00000312 <chdir>:
SYSCALL(chdir)
     312:	b8 09 00 00 00       	mov    $0x9,%eax
     317:	cd 40                	int    $0x40
     319:	c3                   	ret    

0000031a <dup>:
SYSCALL(dup)
     31a:	b8 0a 00 00 00       	mov    $0xa,%eax
     31f:	cd 40                	int    $0x40
     321:	c3                   	ret    

00000322 <getpid>:
SYSCALL(getpid)
     322:	b8 0b 00 00 00       	mov    $0xb,%eax
     327:	cd 40                	int    $0x40
     329:	c3                   	ret    

0000032a <sbrk>:
SYSCALL(sbrk)
     32a:	b8 0c 00 00 00       	mov    $0xc,%eax
     32f:	cd 40                	int    $0x40
     331:	c3                   	ret    

00000332 <sleep>:
SYSCALL(sleep)
     332:	b8 0d 00 00 00       	mov    $0xd,%eax
     337:	cd 40                	int    $0x40
     339:	c3                   	ret    

0000033a <uptime>:
SYSCALL(uptime)
     33a:	b8 0e 00 00 00       	mov    $0xe,%eax
     33f:	cd 40                	int    $0x40
     341:	c3                   	ret    

00000342 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     342:	b8 16 00 00 00       	mov    $0x16,%eax
     347:	cd 40                	int    $0x40
     349:	c3                   	ret    

0000034a <sigsend>:
SYSCALL(sigsend)
     34a:	b8 17 00 00 00       	mov    $0x17,%eax
     34f:	cd 40                	int    $0x40
     351:	c3                   	ret    

00000352 <sigreturn>:
SYSCALL(sigreturn)
     352:	b8 18 00 00 00       	mov    $0x18,%eax
     357:	cd 40                	int    $0x40
     359:	c3                   	ret    

0000035a <alarm>:
SYSCALL(alarm)
     35a:	b8 19 00 00 00       	mov    $0x19,%eax
     35f:	cd 40                	int    $0x40
     361:	c3                   	ret    
     362:	66 90                	xchg   %ax,%ax
     364:	66 90                	xchg   %ax,%ax
     366:	66 90                	xchg   %ax,%ax
     368:	66 90                	xchg   %ax,%ax
     36a:	66 90                	xchg   %ax,%ax
     36c:	66 90                	xchg   %ax,%ax
     36e:	66 90                	xchg   %ax,%ax

00000370 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	57                   	push   %edi
     374:	56                   	push   %esi
     375:	53                   	push   %ebx
     376:	89 c6                	mov    %eax,%esi
     378:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     37b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     37e:	85 db                	test   %ebx,%ebx
     380:	74 7e                	je     400 <printint+0x90>
     382:	89 d0                	mov    %edx,%eax
     384:	c1 e8 1f             	shr    $0x1f,%eax
     387:	84 c0                	test   %al,%al
     389:	74 75                	je     400 <printint+0x90>
    neg = 1;
    x = -xx;
     38b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     38d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     394:	f7 d8                	neg    %eax
     396:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     399:	31 ff                	xor    %edi,%edi
     39b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     39e:	89 ce                	mov    %ecx,%esi
     3a0:	eb 08                	jmp    3aa <printint+0x3a>
     3a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     3a8:	89 cf                	mov    %ecx,%edi
     3aa:	31 d2                	xor    %edx,%edx
     3ac:	8d 4f 01             	lea    0x1(%edi),%ecx
     3af:	f7 f6                	div    %esi
     3b1:	0f b6 92 2c 12 00 00 	movzbl 0x122c(%edx),%edx
  }while((x /= base) != 0);
     3b8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     3ba:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     3bd:	75 e9                	jne    3a8 <printint+0x38>
  if(neg)
     3bf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     3c2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     3c5:	85 c0                	test   %eax,%eax
     3c7:	74 08                	je     3d1 <printint+0x61>
    buf[i++] = '-';
     3c9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     3ce:	8d 4f 02             	lea    0x2(%edi),%ecx
     3d1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     3d5:	8d 76 00             	lea    0x0(%esi),%esi
     3d8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     3db:	83 ec 04             	sub    $0x4,%esp
     3de:	83 ef 01             	sub    $0x1,%edi
     3e1:	6a 01                	push   $0x1
     3e3:	53                   	push   %ebx
     3e4:	56                   	push   %esi
     3e5:	88 45 d7             	mov    %al,-0x29(%ebp)
     3e8:	e8 d5 fe ff ff       	call   2c2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     3ed:	83 c4 10             	add    $0x10,%esp
     3f0:	39 df                	cmp    %ebx,%edi
     3f2:	75 e4                	jne    3d8 <printint+0x68>
    putc(fd, buf[i]);
}
     3f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     3f7:	5b                   	pop    %ebx
     3f8:	5e                   	pop    %esi
     3f9:	5f                   	pop    %edi
     3fa:	5d                   	pop    %ebp
     3fb:	c3                   	ret    
     3fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     400:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     402:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     409:	eb 8b                	jmp    396 <printint+0x26>
     40b:	90                   	nop
     40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000410 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	57                   	push   %edi
     414:	56                   	push   %esi
     415:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     416:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     419:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     41c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     41f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     422:	89 45 d0             	mov    %eax,-0x30(%ebp)
     425:	0f b6 1e             	movzbl (%esi),%ebx
     428:	83 c6 01             	add    $0x1,%esi
     42b:	84 db                	test   %bl,%bl
     42d:	0f 84 b0 00 00 00    	je     4e3 <printf+0xd3>
     433:	31 d2                	xor    %edx,%edx
     435:	eb 39                	jmp    470 <printf+0x60>
     437:	89 f6                	mov    %esi,%esi
     439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     440:	83 f8 25             	cmp    $0x25,%eax
     443:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     446:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     44b:	74 18                	je     465 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     44d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     450:	83 ec 04             	sub    $0x4,%esp
     453:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     456:	6a 01                	push   $0x1
     458:	50                   	push   %eax
     459:	57                   	push   %edi
     45a:	e8 63 fe ff ff       	call   2c2 <write>
     45f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     462:	83 c4 10             	add    $0x10,%esp
     465:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     468:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     46c:	84 db                	test   %bl,%bl
     46e:	74 73                	je     4e3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     470:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     472:	0f be cb             	movsbl %bl,%ecx
     475:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     478:	74 c6                	je     440 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     47a:	83 fa 25             	cmp    $0x25,%edx
     47d:	75 e6                	jne    465 <printf+0x55>
      if(c == 'd'){
     47f:	83 f8 64             	cmp    $0x64,%eax
     482:	0f 84 f8 00 00 00    	je     580 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     488:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     48e:	83 f9 70             	cmp    $0x70,%ecx
     491:	74 5d                	je     4f0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     493:	83 f8 73             	cmp    $0x73,%eax
     496:	0f 84 84 00 00 00    	je     520 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     49c:	83 f8 63             	cmp    $0x63,%eax
     49f:	0f 84 ea 00 00 00    	je     58f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     4a5:	83 f8 25             	cmp    $0x25,%eax
     4a8:	0f 84 c2 00 00 00    	je     570 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4ae:	8d 45 e7             	lea    -0x19(%ebp),%eax
     4b1:	83 ec 04             	sub    $0x4,%esp
     4b4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     4b8:	6a 01                	push   $0x1
     4ba:	50                   	push   %eax
     4bb:	57                   	push   %edi
     4bc:	e8 01 fe ff ff       	call   2c2 <write>
     4c1:	83 c4 0c             	add    $0xc,%esp
     4c4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     4c7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     4ca:	6a 01                	push   $0x1
     4cc:	50                   	push   %eax
     4cd:	57                   	push   %edi
     4ce:	83 c6 01             	add    $0x1,%esi
     4d1:	e8 ec fd ff ff       	call   2c2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4d6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4da:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     4dd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4df:	84 db                	test   %bl,%bl
     4e1:	75 8d                	jne    470 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     4e3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4e6:	5b                   	pop    %ebx
     4e7:	5e                   	pop    %esi
     4e8:	5f                   	pop    %edi
     4e9:	5d                   	pop    %ebp
     4ea:	c3                   	ret    
     4eb:	90                   	nop
     4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     4f0:	83 ec 0c             	sub    $0xc,%esp
     4f3:	b9 10 00 00 00       	mov    $0x10,%ecx
     4f8:	6a 00                	push   $0x0
     4fa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     4fd:	89 f8                	mov    %edi,%eax
     4ff:	8b 13                	mov    (%ebx),%edx
     501:	e8 6a fe ff ff       	call   370 <printint>
        ap++;
     506:	89 d8                	mov    %ebx,%eax
     508:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     50b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     50d:	83 c0 04             	add    $0x4,%eax
     510:	89 45 d0             	mov    %eax,-0x30(%ebp)
     513:	e9 4d ff ff ff       	jmp    465 <printf+0x55>
     518:	90                   	nop
     519:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     520:	8b 45 d0             	mov    -0x30(%ebp),%eax
     523:	8b 18                	mov    (%eax),%ebx
        ap++;
     525:	83 c0 04             	add    $0x4,%eax
     528:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     52b:	b8 23 12 00 00       	mov    $0x1223,%eax
     530:	85 db                	test   %ebx,%ebx
     532:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     535:	0f b6 03             	movzbl (%ebx),%eax
     538:	84 c0                	test   %al,%al
     53a:	74 23                	je     55f <printf+0x14f>
     53c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     540:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     543:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     546:	83 ec 04             	sub    $0x4,%esp
     549:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     54b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     54e:	50                   	push   %eax
     54f:	57                   	push   %edi
     550:	e8 6d fd ff ff       	call   2c2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     555:	0f b6 03             	movzbl (%ebx),%eax
     558:	83 c4 10             	add    $0x10,%esp
     55b:	84 c0                	test   %al,%al
     55d:	75 e1                	jne    540 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     55f:	31 d2                	xor    %edx,%edx
     561:	e9 ff fe ff ff       	jmp    465 <printf+0x55>
     566:	8d 76 00             	lea    0x0(%esi),%esi
     569:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     570:	83 ec 04             	sub    $0x4,%esp
     573:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     576:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     579:	6a 01                	push   $0x1
     57b:	e9 4c ff ff ff       	jmp    4cc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     580:	83 ec 0c             	sub    $0xc,%esp
     583:	b9 0a 00 00 00       	mov    $0xa,%ecx
     588:	6a 01                	push   $0x1
     58a:	e9 6b ff ff ff       	jmp    4fa <printf+0xea>
     58f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     592:	83 ec 04             	sub    $0x4,%esp
     595:	8b 03                	mov    (%ebx),%eax
     597:	6a 01                	push   $0x1
     599:	88 45 e4             	mov    %al,-0x1c(%ebp)
     59c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     59f:	50                   	push   %eax
     5a0:	57                   	push   %edi
     5a1:	e8 1c fd ff ff       	call   2c2 <write>
     5a6:	e9 5b ff ff ff       	jmp    506 <printf+0xf6>
     5ab:	66 90                	xchg   %ax,%ax
     5ad:	66 90                	xchg   %ax,%ax
     5af:	90                   	nop

000005b0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     5b0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5b1:	a1 a0 19 00 00       	mov    0x19a0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     5b6:	89 e5                	mov    %esp,%ebp
     5b8:	57                   	push   %edi
     5b9:	56                   	push   %esi
     5ba:	53                   	push   %ebx
     5bb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5be:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     5c0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5c3:	39 c8                	cmp    %ecx,%eax
     5c5:	73 19                	jae    5e0 <free+0x30>
     5c7:	89 f6                	mov    %esi,%esi
     5c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5d0:	39 d1                	cmp    %edx,%ecx
     5d2:	72 1c                	jb     5f0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5d4:	39 d0                	cmp    %edx,%eax
     5d6:	73 18                	jae    5f0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     5d8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5da:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5dc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5de:	72 f0                	jb     5d0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5e0:	39 d0                	cmp    %edx,%eax
     5e2:	72 f4                	jb     5d8 <free+0x28>
     5e4:	39 d1                	cmp    %edx,%ecx
     5e6:	73 f0                	jae    5d8 <free+0x28>
     5e8:	90                   	nop
     5e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     5f0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     5f3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     5f6:	39 d7                	cmp    %edx,%edi
     5f8:	74 19                	je     613 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     5fd:	8b 50 04             	mov    0x4(%eax),%edx
     600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     603:	39 f1                	cmp    %esi,%ecx
     605:	74 23                	je     62a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     607:	89 08                	mov    %ecx,(%eax)
  freep = p;
     609:	a3 a0 19 00 00       	mov    %eax,0x19a0
}
     60e:	5b                   	pop    %ebx
     60f:	5e                   	pop    %esi
     610:	5f                   	pop    %edi
     611:	5d                   	pop    %ebp
     612:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     613:	03 72 04             	add    0x4(%edx),%esi
     616:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     619:	8b 10                	mov    (%eax),%edx
     61b:	8b 12                	mov    (%edx),%edx
     61d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     620:	8b 50 04             	mov    0x4(%eax),%edx
     623:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     626:	39 f1                	cmp    %esi,%ecx
     628:	75 dd                	jne    607 <free+0x57>
    p->s.size += bp->s.size;
     62a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     62d:	a3 a0 19 00 00       	mov    %eax,0x19a0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     632:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     635:	8b 53 f8             	mov    -0x8(%ebx),%edx
     638:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     63a:	5b                   	pop    %ebx
     63b:	5e                   	pop    %esi
     63c:	5f                   	pop    %edi
     63d:	5d                   	pop    %ebp
     63e:	c3                   	ret    
     63f:	90                   	nop

00000640 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     640:	55                   	push   %ebp
     641:	89 e5                	mov    %esp,%ebp
     643:	57                   	push   %edi
     644:	56                   	push   %esi
     645:	53                   	push   %ebx
     646:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     649:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     64c:	8b 15 a0 19 00 00    	mov    0x19a0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     652:	8d 78 07             	lea    0x7(%eax),%edi
     655:	c1 ef 03             	shr    $0x3,%edi
     658:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     65b:	85 d2                	test   %edx,%edx
     65d:	0f 84 a3 00 00 00    	je     706 <malloc+0xc6>
     663:	8b 02                	mov    (%edx),%eax
     665:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     668:	39 cf                	cmp    %ecx,%edi
     66a:	76 74                	jbe    6e0 <malloc+0xa0>
     66c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     672:	be 00 10 00 00       	mov    $0x1000,%esi
     677:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     67e:	0f 43 f7             	cmovae %edi,%esi
     681:	ba 00 80 00 00       	mov    $0x8000,%edx
     686:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     68c:	0f 46 da             	cmovbe %edx,%ebx
     68f:	eb 10                	jmp    6a1 <malloc+0x61>
     691:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     698:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     69a:	8b 48 04             	mov    0x4(%eax),%ecx
     69d:	39 cf                	cmp    %ecx,%edi
     69f:	76 3f                	jbe    6e0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     6a1:	39 05 a0 19 00 00    	cmp    %eax,0x19a0
     6a7:	89 c2                	mov    %eax,%edx
     6a9:	75 ed                	jne    698 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     6ab:	83 ec 0c             	sub    $0xc,%esp
     6ae:	53                   	push   %ebx
     6af:	e8 76 fc ff ff       	call   32a <sbrk>
  if(p == (char*)-1)
     6b4:	83 c4 10             	add    $0x10,%esp
     6b7:	83 f8 ff             	cmp    $0xffffffff,%eax
     6ba:	74 1c                	je     6d8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     6bc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     6bf:	83 ec 0c             	sub    $0xc,%esp
     6c2:	83 c0 08             	add    $0x8,%eax
     6c5:	50                   	push   %eax
     6c6:	e8 e5 fe ff ff       	call   5b0 <free>
  return freep;
     6cb:	8b 15 a0 19 00 00    	mov    0x19a0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     6d1:	83 c4 10             	add    $0x10,%esp
     6d4:	85 d2                	test   %edx,%edx
     6d6:	75 c0                	jne    698 <malloc+0x58>
        return 0;
     6d8:	31 c0                	xor    %eax,%eax
     6da:	eb 1c                	jmp    6f8 <malloc+0xb8>
     6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     6e0:	39 cf                	cmp    %ecx,%edi
     6e2:	74 1c                	je     700 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     6e4:	29 f9                	sub    %edi,%ecx
     6e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     6e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     6ec:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     6ef:	89 15 a0 19 00 00    	mov    %edx,0x19a0
      return (void*)(p + 1);
     6f5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     6f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6fb:	5b                   	pop    %ebx
     6fc:	5e                   	pop    %esi
     6fd:	5f                   	pop    %edi
     6fe:	5d                   	pop    %ebp
     6ff:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     700:	8b 08                	mov    (%eax),%ecx
     702:	89 0a                	mov    %ecx,(%edx)
     704:	eb e9                	jmp    6ef <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     706:	c7 05 a0 19 00 00 a4 	movl   $0x19a4,0x19a0
     70d:	19 00 00 
     710:	c7 05 a4 19 00 00 a4 	movl   $0x19a4,0x19a4
     717:	19 00 00 
    base.s.size = 0;
     71a:	b8 a4 19 00 00       	mov    $0x19a4,%eax
     71f:	c7 05 a8 19 00 00 00 	movl   $0x0,0x19a8
     726:	00 00 00 
     729:	e9 3e ff ff ff       	jmp    66c <malloc+0x2c>
     72e:	66 90                	xchg   %ax,%ax

00000730 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     730:	55                   	push   %ebp
     731:	89 e5                	mov    %esp,%ebp
     733:	56                   	push   %esi
     734:	53                   	push   %ebx
     735:	8b 75 0c             	mov    0xc(%ebp),%esi
     738:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     73b:	83 ec 08             	sub    $0x8,%esp
     73e:	68 40 12 00 00       	push   $0x1240
     743:	6a 01                	push   $0x1
     745:	e8 c6 fc ff ff       	call   410 <printf>
  alarm(UTHREAD_QUANTA);
     74a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     751:	e8 04 fc ff ff       	call   35a <alarm>
  start_func(arg);
     756:	89 75 08             	mov    %esi,0x8(%ebp)
     759:	83 c4 10             	add    $0x10,%esp
}
     75c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     75f:	89 d8                	mov    %ebx,%eax
}
     761:	5b                   	pop    %ebx
     762:	5e                   	pop    %esi
     763:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     764:	ff e0                	jmp    *%eax
     766:	8d 76 00             	lea    0x0(%esi),%esi
     769:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000770 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     770:	55                   	push   %ebp
     771:	89 e5                	mov    %esp,%ebp
     773:	53                   	push   %ebx
     774:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     777:	6a 00                	push   $0x0
     779:	e8 dc fb ff ff       	call   35a <alarm>
  printf(1,"exiting...\n");
     77e:	5a                   	pop    %edx
     77f:	59                   	pop    %ecx
     780:	68 b0 13 00 00       	push   $0x13b0
     785:	6a 01                	push   $0x1
     787:	e8 84 fc ff ff       	call   410 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     78c:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     791:	83 c4 10             	add    $0x10,%esp
     794:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     797:	8b 1c 95 c0 19 00 00 	mov    0x19c0(,%edx,4),%ebx
     79e:	85 db                	test   %ebx,%ebx
     7a0:	75 0a                	jne    7ac <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     7a2:	c7 05 c8 19 00 00 00 	movl   $0x0,0x19c8
     7a9:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     7ac:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     7af:	83 ec 0c             	sub    $0xc,%esp
     7b2:	ff 34 85 c4 19 00 00 	pushl  0x19c4(,%eax,4)
     7b9:	e8 f2 fd ff ff       	call   5b0 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     7be:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     7c3:	83 c4 10             	add    $0x10,%esp
     7c6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7c9:	b8 c8 19 00 00       	mov    $0x19c8,%eax
     7ce:	c1 e2 02             	shl    $0x2,%edx
     7d1:	c7 82 c8 19 00 00 00 	movl   $0x0,0x19c8(%edx)
     7d8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     7db:	c7 82 c0 19 00 00 ff 	movl   $0xffffffff,0x19c0(%edx)
     7e2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     7e5:	c7 82 cc 19 00 00 00 	movl   $0x0,0x19cc(%edx)
     7ec:	00 00 00 
  threads[index_currently_running].esp = 0;
     7ef:	c7 82 d0 19 00 00 00 	movl   $0x0,0x19d0(%edx)
     7f6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     7f9:	c7 82 dc 19 00 00 00 	movl   $0x0,0x19dc(%edx)
     800:	00 00 00 
  threads[index_currently_running].join = -1;
     803:	c7 82 e0 19 00 00 ff 	movl   $0xffffffff,0x19e0(%edx)
     80a:	ff ff ff 
     80d:	eb 0b                	jmp    81a <uthread_exit+0xaa>
     80f:	90                   	nop
     810:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     813:	3d c8 22 00 00       	cmp    $0x22c8,%eax
     818:	74 15                	je     82f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     81a:	83 38 04             	cmpl   $0x4,(%eax)
     81d:	75 f1                	jne    810 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     81f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     825:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     828:	3d c8 22 00 00       	cmp    $0x22c8,%eax
     82d:	75 eb                	jne    81a <uthread_exit+0xaa>
     82f:	bb ec 19 00 00       	mov    $0x19ec,%ebx
     834:	eb 15                	jmp    84b <uthread_exit+0xdb>
     836:	8d 76 00             	lea    0x0(%esi),%esi
     839:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     840:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     843:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     849:	74 24                	je     86f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     84b:	8b 03                	mov    (%ebx),%eax
     84d:	85 c0                	test   %eax,%eax
     84f:	74 ef                	je     840 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     851:	e8 cc fa ff ff       	call   322 <getpid>
     856:	83 ec 08             	sub    $0x8,%esp
     859:	83 c3 24             	add    $0x24,%ebx
     85c:	6a 0e                	push   $0xe
     85e:	50                   	push   %eax
     85f:	e8 e6 fa ff ff       	call   34a <sigsend>
     864:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     867:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     86d:	75 dc                	jne    84b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     86f:	e8 2e fa ff ff       	call   2a2 <exit>
     874:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     87a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000880 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     880:	55                   	push   %ebp
     881:	ba e8 23 00 00       	mov    $0x23e8,%edx
     886:	89 e5                	mov    %esp,%ebp
     888:	90                   	nop
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     890:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     896:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     89c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     8a0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     8a6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     8a9:	39 d0                	cmp    %edx,%eax
     8ab:	75 f3                	jne    8a0 <init_bsem+0x20>
     8ad:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     8b3:	81 fa e8 a9 00 00    	cmp    $0xa9e8,%edx
     8b9:	75 d5                	jne    890 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     8bb:	c7 05 ac 19 00 00 01 	movl   $0x1,0x19ac
     8c2:	00 00 00 
}
     8c5:	5d                   	pop    %ebp
     8c6:	c3                   	ret    
     8c7:	89 f6                	mov    %esi,%esi
     8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008d0 <bsem_alloc>:

int bsem_alloc() {
     8d0:	55                   	push   %ebp
     8d1:	89 e5                	mov    %esp,%ebp
     8d3:	53                   	push   %ebx
     8d4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     8d7:	6a 00                	push   $0x0
     8d9:	e8 7c fa ff ff       	call   35a <alarm>
  int i;
  if(first_run_bsem == 0)
     8de:	a1 ac 19 00 00       	mov    0x19ac,%eax
     8e3:	83 c4 10             	add    $0x10,%esp
     8e6:	85 c0                	test   %eax,%eax
     8e8:	75 3b                	jne    925 <bsem_alloc+0x55>
     8ea:	ba e8 23 00 00       	mov    $0x23e8,%edx
     8ef:	90                   	nop
     8f0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     8f6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     8fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     900:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     906:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     909:	39 d0                	cmp    %edx,%eax
     90b:	75 f3                	jne    900 <bsem_alloc+0x30>
     90d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     913:	81 fa e8 a9 00 00    	cmp    $0xa9e8,%edx
     919:	75 d5                	jne    8f0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     91b:	c7 05 ac 19 00 00 01 	movl   $0x1,0x19ac
     922:	00 00 00 
     925:	ba e8 23 00 00       	mov    $0x23e8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     92a:	31 c0                	xor    %eax,%eax
     92c:	eb 10                	jmp    93e <bsem_alloc+0x6e>
     92e:	83 c0 01             	add    $0x1,%eax
     931:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     937:	3d 80 00 00 00       	cmp    $0x80,%eax
     93c:	74 4f                	je     98d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     93e:	83 3a 01             	cmpl   $0x1,(%edx)
     941:	75 eb                	jne    92e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     943:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     949:	8b 15 88 19 00 00    	mov    0x1988,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     94f:	83 ec 0c             	sub    $0xc,%esp
     952:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     954:	8d 98 e0 22 00 00    	lea    0x22e0(%eax),%ebx
     95a:	89 90 e4 22 00 00    	mov    %edx,0x22e4(%eax)
    binSemCounter++;
     960:	83 c2 01             	add    $0x1,%edx
     963:	89 15 88 19 00 00    	mov    %edx,0x1988
    binSemaphore[i].lock = 1; // not locked
     969:	c7 80 e0 22 00 00 01 	movl   $0x1,0x22e0(%eax)
     970:	00 00 00 
    binSemaphore[i].state = USED;
     973:	c7 80 e8 23 00 00 00 	movl   $0x0,0x23e8(%eax)
     97a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     97d:	e8 d8 f9 ff ff       	call   35a <alarm>
    return binSemaphore[i].id;
     982:	8b 43 04             	mov    0x4(%ebx),%eax
     985:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     988:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     98b:	c9                   	leave  
     98c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     98d:	83 ec 08             	sub    $0x8,%esp
     990:	68 60 12 00 00       	push   $0x1260
     995:	6a 01                	push   $0x1
     997:	e8 74 fa ff ff       	call   410 <printf>
    alarm(UTHREAD_QUANTA);
     99c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     9a3:	e8 b2 f9 ff ff       	call   35a <alarm>
    return -1;
     9a8:	83 c4 10             	add    $0x10,%esp
     9ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     9b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9b3:	c9                   	leave  
     9b4:	c3                   	ret    
     9b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <bsem_free>:

void bsem_free(int id) {
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	53                   	push   %ebx
     9c4:	83 ec 10             	sub    $0x10,%esp
     9c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     9ca:	6a 00                	push   $0x0
     9cc:	e8 89 f9 ff ff       	call   35a <alarm>
     9d1:	ba e4 22 00 00       	mov    $0x22e4,%edx
     9d6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     9d9:	31 c0                	xor    %eax,%eax
     9db:	eb 13                	jmp    9f0 <bsem_free+0x30>
     9dd:	8d 76 00             	lea    0x0(%esi),%esi
     9e0:	83 c0 01             	add    $0x1,%eax
     9e3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     9e9:	3d 80 00 00 00       	cmp    $0x80,%eax
     9ee:	74 38                	je     a28 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     9f0:	39 1a                	cmp    %ebx,(%edx)
     9f2:	75 ec                	jne    9e0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     9f4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     9fa:	05 e0 22 00 00       	add    $0x22e0,%eax
     9ff:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     a06:	74 0a                	je     a12 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     a08:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     a0f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a12:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a1c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a1d:	e9 38 f9 ff ff       	jmp    35a <alarm>
     a22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     a28:	83 ec 04             	sub    $0x4,%esp
     a2b:	53                   	push   %ebx
     a2c:	68 bc 13 00 00       	push   $0x13bc
     a31:	6a 01                	push   $0x1
     a33:	e8 d8 f9 ff ff       	call   410 <printf>
     a38:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a3b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a42:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a45:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a46:	e9 0f f9 ff ff       	jmp    35a <alarm>
     a4b:	90                   	nop
     a4c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a50 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	53                   	push   %ebx
     a54:	83 ec 10             	sub    $0x10,%esp
     a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a5a:	6a 00                	push   $0x0
     a5c:	e8 f9 f8 ff ff       	call   35a <alarm>
     a61:	b8 e4 22 00 00       	mov    $0x22e4,%eax
     a66:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a69:	31 d2                	xor    %edx,%edx
     a6b:	eb 17                	jmp    a84 <bsem_down+0x34>
     a6d:	8d 76 00             	lea    0x0(%esi),%esi
     a70:	83 c2 01             	add    $0x1,%edx
     a73:	05 0c 01 00 00       	add    $0x10c,%eax
     a78:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     a7e:	0f 84 8c 00 00 00    	je     b10 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     a84:	39 18                	cmp    %ebx,(%eax)
     a86:	75 e8                	jne    a70 <bsem_down+0x20>
     a88:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     a8e:	85 c9                	test   %ecx,%ecx
     a90:	75 de                	jne    a70 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     a92:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     a98:	31 c0                	xor    %eax,%eax
     a9a:	83 b9 e0 22 00 00 01 	cmpl   $0x1,0x22e0(%ecx)
     aa1:	75 15                	jne    ab8 <bsem_down+0x68>
     aa3:	e9 93 00 00 00       	jmp    b3b <bsem_down+0xeb>
     aa8:	90                   	nop
     aa9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     ab0:	83 c0 01             	add    $0x1,%eax
     ab3:	83 f8 40             	cmp    $0x40,%eax
     ab6:	74 7b                	je     b33 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     ab8:	83 bc 81 e8 22 00 00 	cmpl   $0xffffffff,0x22e8(%ecx,%eax,4)
     abf:	ff 
     ac0:	75 ee                	jne    ab0 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     ac2:	8b 0d e8 a8 00 00    	mov    0xa8e8,%ecx
     ac8:	6b d2 43             	imul   $0x43,%edx,%edx
     acb:	01 c2                	add    %eax,%edx
     acd:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     ad0:	8b 04 85 c0 19 00 00 	mov    0x19c0(,%eax,4),%eax
     ad7:	89 04 95 e8 22 00 00 	mov    %eax,0x22e8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     ade:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     ae1:	c7 04 85 c8 19 00 00 	movl   $0x4,0x19c8(,%eax,4)
     ae8:	04 00 00 00 

	 sigsend(getpid(),14);
     aec:	e8 31 f8 ff ff       	call   322 <getpid>
     af1:	83 ec 08             	sub    $0x8,%esp
     af4:	6a 0e                	push   $0xe
     af6:	50                   	push   %eax
     af7:	e8 4e f8 ff ff       	call   34a <sigsend>
     afc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     aff:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b06:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b09:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b0a:	e9 4b f8 ff ff       	jmp    35a <alarm>
     b0f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     b10:	83 ec 04             	sub    $0x4,%esp
     b13:	53                   	push   %ebx
     b14:	68 80 12 00 00       	push   $0x1280
     b19:	6a 01                	push   $0x1
     b1b:	e8 f0 f8 ff ff       	call   410 <printf>
     b20:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     b23:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b2a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b2d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b2e:	e9 27 f8 ff ff       	jmp    35a <alarm>
     b33:	8b 0d e8 a8 00 00    	mov    0xa8e8,%ecx
     b39:	eb a3                	jmp    ade <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     b3b:	c7 81 e0 22 00 00 00 	movl   $0x0,0x22e0(%ecx)
     b42:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b45:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b4f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b50:	e9 05 f8 ff ff       	jmp    35a <alarm>
     b55:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b59:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b60 <bsem_up>:
}

void bsem_up(int id) {
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	57                   	push   %edi
     b64:	56                   	push   %esi
     b65:	53                   	push   %ebx
     b66:	83 ec 28             	sub    $0x28,%esp
     b69:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b6c:	6a 00                	push   $0x0
     b6e:	e8 e7 f7 ff ff       	call   35a <alarm>
     b73:	ba e4 22 00 00       	mov    $0x22e4,%edx
     b78:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b7b:	31 c0                	xor    %eax,%eax
     b7d:	eb 15                	jmp    b94 <bsem_up+0x34>
     b7f:	90                   	nop
     b80:	83 c0 01             	add    $0x1,%eax
     b83:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     b89:	3d 80 00 00 00       	cmp    $0x80,%eax
     b8e:	0f 84 ac 00 00 00    	je     c40 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     b94:	39 1a                	cmp    %ebx,(%edx)
     b96:	75 e8                	jne    b80 <bsem_up+0x20>
     b98:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     b9e:	85 c9                	test   %ecx,%ecx
     ba0:	75 de                	jne    b80 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     ba2:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     ba8:	8b 97 e0 22 00 00    	mov    0x22e0(%edi),%edx
     bae:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     bb1:	85 d2                	test   %edx,%edx
     bb3:	0f 85 9c 00 00 00    	jne    c55 <bsem_up+0xf5>
     bb9:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     bbb:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     bbe:	8b b4 be e8 22 00 00 	mov    0x22e8(%esi,%edi,4),%esi
     bc5:	83 fe ff             	cmp    $0xffffffff,%esi
     bc8:	74 56                	je     c20 <bsem_up+0xc0>
     bca:	b9 c0 19 00 00       	mov    $0x19c0,%ecx
     bcf:	31 d2                	xor    %edx,%edx
     bd1:	eb 10                	jmp    be3 <bsem_up+0x83>
     bd3:	90                   	nop
     bd4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     bd8:	83 c2 01             	add    $0x1,%edx
     bdb:	83 c1 24             	add    $0x24,%ecx
     bde:	83 fa 40             	cmp    $0x40,%edx
     be1:	74 3d                	je     c20 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     be3:	8b 19                	mov    (%ecx),%ebx
     be5:	39 de                	cmp    %ebx,%esi
     be7:	75 ef                	jne    bd8 <bsem_up+0x78>
     be9:	83 fb ff             	cmp    $0xffffffff,%ebx
     bec:	74 ea                	je     bd8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     bee:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     bf1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     bf4:	c7 04 95 c8 19 00 00 	movl   $0x2,0x19c8(,%edx,4)
     bfb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     bff:	01 c7                	add    %eax,%edi
     c01:	c7 04 bd e8 22 00 00 	movl   $0xffffffff,0x22e8(,%edi,4)
     c08:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c0c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     c13:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c16:	5b                   	pop    %ebx
     c17:	5e                   	pop    %esi
     c18:	5f                   	pop    %edi
     c19:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c1a:	e9 3b f7 ff ff       	jmp    35a <alarm>
     c1f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     c20:	83 c7 01             	add    $0x1,%edi
     c23:	83 ff 40             	cmp    $0x40,%edi
     c26:	75 93                	jne    bbb <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     c28:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c2e:	c7 80 e0 22 00 00 01 	movl   $0x1,0x22e0(%eax)
     c35:	00 00 00 
     c38:	eb d2                	jmp    c0c <bsem_up+0xac>
     c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     c40:	83 ec 04             	sub    $0x4,%esp
     c43:	53                   	push   %ebx
     c44:	68 e8 12 00 00       	push   $0x12e8
     c49:	6a 01                	push   $0x1
     c4b:	e8 c0 f7 ff ff       	call   410 <printf>
     c50:	83 c4 10             	add    $0x10,%esp
     c53:	eb b7                	jmp    c0c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     c55:	83 ec 08             	sub    $0x8,%esp
     c58:	68 c4 12 00 00       	push   $0x12c4
     c5d:	6a 01                	push   $0x1
     c5f:	e8 ac f7 ff ff       	call   410 <printf>
     c64:	83 c4 10             	add    $0x10,%esp
     c67:	eb a3                	jmp    c0c <bsem_up+0xac>
     c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c70 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     c70:	55                   	push   %ebp
     c71:	89 e5                	mov    %esp,%ebp
     c73:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     c76:	68 2c 13 00 00       	push   $0x132c
     c7b:	6a 01                	push   $0x1
     c7d:	e8 8e f7 ff ff       	call   410 <printf>
     c82:	b8 c0 19 00 00       	mov    $0x19c0,%eax
     c87:	83 c4 10             	add    $0x10,%esp
     c8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     c90:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     c96:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     c9d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     ca0:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     ca7:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     cae:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     cb5:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     cbc:	3d c0 22 00 00       	cmp    $0x22c0,%eax
     cc1:	75 cd                	jne    c90 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cc3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     cc6:	c7 05 c0 19 00 00 00 	movl   $0x0,0x19c0
     ccd:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     cd0:	c7 05 c8 19 00 00 03 	movl   $0x3,0x19c8
     cd7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cda:	68 70 0e 00 00       	push   $0xe70
     cdf:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     ce1:	c7 05 c4 19 00 00 00 	movl   $0x0,0x19c4
     ce8:	00 00 00 

  id_number_thread = 1;
     ceb:	c7 05 e4 a8 00 00 01 	movl   $0x1,0xa8e4
     cf2:	00 00 00 
  index_currently_running = 0;
     cf5:	c7 05 e8 a8 00 00 00 	movl   $0x0,0xa8e8
     cfc:	00 00 00 
  currently_running = 0;
     cff:	c7 05 c0 22 00 00 00 	movl   $0x0,0x22c0
     d06:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d09:	e8 34 f6 ff ff       	call   342 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     d0e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     d15:	e8 40 f6 ff ff       	call   35a <alarm>
  return 0;
}
     d1a:	31 c0                	xor    %eax,%eax
     d1c:	c9                   	leave  
     d1d:	c3                   	ret    
     d1e:	66 90                	xchg   %ax,%ax

00000d20 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	56                   	push   %esi
     d24:	53                   	push   %ebx
  alarm(0);
     d25:	83 ec 0c             	sub    $0xc,%esp
     d28:	6a 00                	push   $0x0
     d2a:	e8 2b f6 ff ff       	call   35a <alarm>
  printf(1, "------ creating a new thread ------\n");
     d2f:	5b                   	pop    %ebx
     d30:	5e                   	pop    %esi
     d31:	68 58 13 00 00       	push   $0x1358
     d36:	6a 01                	push   $0x1
     d38:	e8 d3 f6 ff ff       	call   410 <printf>
     d3d:	ba c8 19 00 00       	mov    $0x19c8,%edx
     d42:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     d45:	31 c0                	xor    %eax,%eax
     d47:	eb 12                	jmp    d5b <uthread_create+0x3b>
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d50:	83 c0 01             	add    $0x1,%eax
     d53:	83 c2 24             	add    $0x24,%edx
     d56:	83 f8 40             	cmp    $0x40,%eax
     d59:	74 7d                	je     dd8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     d5b:	8b 0a                	mov    (%edx),%ecx
     d5d:	85 c9                	test   %ecx,%ecx
     d5f:	75 ef                	jne    d50 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d61:	8b 15 e4 a8 00 00    	mov    0xa8e4,%edx
     d67:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d6a:	83 ec 0c             	sub    $0xc,%esp
     d6d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d72:	c1 e3 02             	shl    $0x2,%ebx
     d75:	89 93 c0 19 00 00    	mov    %edx,0x19c0(%ebx)
  id_number_thread++;
     d7b:	83 c2 01             	add    $0x1,%edx
     d7e:	89 15 e4 a8 00 00    	mov    %edx,0xa8e4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d84:	e8 b7 f8 ff ff       	call   640 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     d89:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     d8c:	c7 80 f4 0f 00 00 70 	movl   $0x770,0xff4(%eax)
     d93:	07 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d96:	89 83 c4 19 00 00    	mov    %eax,0x19c4(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     d9c:	c7 83 c8 19 00 00 02 	movl   $0x2,0x19c8(%ebx)
     da3:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     da6:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     dac:	8b 55 0c             	mov    0xc(%ebp),%edx
     daf:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     db5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dbc:	e8 99 f5 ff ff       	call   35a <alarm>
  return   threads[free_thread].thread_id;
     dc1:	8b 83 c0 19 00 00    	mov    0x19c0(%ebx),%eax
     dc7:	83 c4 10             	add    $0x10,%esp
}
     dca:	8d 65 f8             	lea    -0x8(%ebp),%esp
     dcd:	5b                   	pop    %ebx
     dce:	5e                   	pop    %esi
     dcf:	5d                   	pop    %ebp
     dd0:	c3                   	ret    
     dd1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     dd8:	83 ec 08             	sub    $0x8,%esp
     ddb:	68 ce 13 00 00       	push   $0x13ce
     de0:	6a 01                	push   $0x1
     de2:	e8 29 f6 ff ff       	call   410 <printf>
    alarm(UTHREAD_QUANTA);
     de7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dee:	e8 67 f5 ff ff       	call   35a <alarm>
    return -1;
     df3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     df6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     df9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     dfe:	5b                   	pop    %ebx
     dff:	5e                   	pop    %esi
     e00:	5d                   	pop    %ebp
     e01:	c3                   	ret    
     e02:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e10 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     e10:	55                   	push   %ebp
     e11:	89 e5                	mov    %esp,%ebp
     e13:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     e16:	85 c0                	test   %eax,%eax
     e18:	74 14                	je     e2e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     e1a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e1d:	89 e2                	mov    %esp,%edx
     e1f:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
     e26:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     e29:	89 ea                	mov    %ebp,%edx
     e2b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e2e:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     e33:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e36:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e3d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e40:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e47:	85 d2                	test   %edx,%edx
     e49:	74 0d                	je     e58 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     e4b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     e4d:	8b 40 0c             	mov    0xc(%eax),%eax
     e50:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     e52:	5d                   	pop    %ebp
     e53:	c3                   	ret    
     e54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e58:	8b 40 04             	mov    0x4(%eax),%eax
     e5b:	05 f4 0f 00 00       	add    $0xff4,%eax
     e60:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e62:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     e64:	b8 30 07 00 00       	mov    $0x730,%eax
     e69:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     e6b:	5d                   	pop    %ebp
     e6c:	c3                   	ret    
     e6d:	8d 76 00             	lea    0x0(%esi),%esi

00000e70 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	56                   	push   %esi
     e74:	53                   	push   %ebx
     e75:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     e78:	83 ec 0c             	sub    $0xc,%esp
     e7b:	6a 00                	push   $0x0
     e7d:	e8 d8 f4 ff ff       	call   35a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     e82:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     e87:	83 c4 10             	add    $0x10,%esp
     e8a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     e8d:	8d 14 95 c0 19 00 00 	lea    0x19c0(,%edx,4),%edx
     e94:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     e98:	75 0b                	jne    ea5 <uthread_schedule+0x35>
     e9a:	85 c0                	test   %eax,%eax
     e9c:	74 07                	je     ea5 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     e9e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     ea5:	bb c8 19 00 00       	mov    $0x19c8,%ebx
     eaa:	eb 0f                	jmp    ebb <uthread_schedule+0x4b>
     eac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     eb0:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     eb3:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     eb9:	74 55                	je     f10 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     ebb:	83 3b 01             	cmpl   $0x1,(%ebx)
     ebe:	75 f0                	jne    eb0 <uthread_schedule+0x40>
     ec0:	8b 73 14             	mov    0x14(%ebx),%esi
     ec3:	85 f6                	test   %esi,%esi
     ec5:	0f 85 a5 00 00 00    	jne    f70 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     ecb:	8b 43 18             	mov    0x18(%ebx),%eax
     ece:	83 f8 ff             	cmp    $0xffffffff,%eax
     ed1:	74 dd                	je     eb0 <uthread_schedule+0x40>
     ed3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ed6:	8b 14 95 c8 19 00 00 	mov    0x19c8(,%edx,4),%edx
     edd:	85 d2                	test   %edx,%edx
     edf:	75 cf                	jne    eb0 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     ee1:	50                   	push   %eax
     ee2:	ff 73 f8             	pushl  -0x8(%ebx)
     ee5:	83 c3 24             	add    $0x24,%ebx
     ee8:	68 80 13 00 00       	push   $0x1380
     eed:	6a 01                	push   $0x1
     eef:	e8 1c f5 ff ff       	call   410 <printf>
      threads[i].join = -1;
     ef4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     efb:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     f02:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f05:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     f0b:	75 ae                	jne    ebb <uthread_schedule+0x4b>
     f0d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     f10:	8b 15 e8 a8 00 00    	mov    0xa8e8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     f16:	b9 40 00 00 00       	mov    $0x40,%ecx
     f1b:	8d 42 01             	lea    0x1(%edx),%eax
     f1e:	eb 08                	jmp    f28 <uthread_schedule+0xb8>
     f20:	83 c0 01             	add    $0x1,%eax
     f23:	83 e9 01             	sub    $0x1,%ecx
     f26:	74 78                	je     fa0 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     f28:	89 c3                	mov    %eax,%ebx
     f2a:	c1 fb 1f             	sar    $0x1f,%ebx
     f2d:	c1 eb 1a             	shr    $0x1a,%ebx
     f30:	01 d8                	add    %ebx,%eax
     f32:	83 e0 3f             	and    $0x3f,%eax
     f35:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     f37:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     f3a:	83 3c 9d c8 19 00 00 	cmpl   $0x2,0x19c8(,%ebx,4)
     f41:	02 
     f42:	75 dc                	jne    f20 <uthread_schedule+0xb0>
     f44:	39 c2                	cmp    %eax,%edx
     f46:	74 d8                	je     f20 <uthread_schedule+0xb0>
      index_currently_running = i;
     f48:	a3 e8 a8 00 00       	mov    %eax,0xa8e8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     f4d:	83 ec 08             	sub    $0x8,%esp
     f50:	50                   	push   %eax
     f51:	52                   	push   %edx
     f52:	e8 b9 fe ff ff       	call   e10 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     f57:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f5e:	e8 f7 f3 ff ff       	call   35a <alarm>
}
     f63:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f66:	5b                   	pop    %ebx
     f67:	5e                   	pop    %esi
     f68:	5d                   	pop    %ebp
     f69:	c3                   	ret    
     f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f70:	e8 c5 f3 ff ff       	call   33a <uptime>
     f75:	39 c6                	cmp    %eax,%esi
     f77:	7f 17                	jg     f90 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
     f79:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
     f7f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
     f86:	e9 25 ff ff ff       	jmp    eb0 <uthread_schedule+0x40>
     f8b:	90                   	nop
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     f90:	83 3b 01             	cmpl   $0x1,(%ebx)
     f93:	0f 84 32 ff ff ff    	je     ecb <uthread_schedule+0x5b>
     f99:	e9 12 ff ff ff       	jmp    eb0 <uthread_schedule+0x40>
     f9e:	66 90                	xchg   %ax,%ax
     fa0:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
     fa3:	83 3c 85 c8 19 00 00 	cmpl   $0x2,0x19c8(,%eax,4)
     faa:	02 
     fab:	0f 85 c7 fe ff ff    	jne    e78 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     fb1:	89 d0                	mov    %edx,%eax
     fb3:	eb 98                	jmp    f4d <uthread_schedule+0xdd>
     fb5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000fc0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fc0:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
  exit();
}

int
uthread_self()
{
     fc5:	55                   	push   %ebp
     fc6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
     fc8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
     fcb:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fcc:	8b 04 85 c0 19 00 00 	mov    0x19c0(,%eax,4),%eax
}
     fd3:	c3                   	ret    
     fd4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fda:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000fe0 <uthread_join>:

int
uthread_join(int tid)
{
     fe0:	55                   	push   %ebp
     fe1:	89 e5                	mov    %esp,%ebp
     fe3:	56                   	push   %esi
     fe4:	53                   	push   %ebx
     fe5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
     fe8:	39 35 e4 a8 00 00    	cmp    %esi,0xa8e4
     fee:	0f 8c ab 00 00 00    	jl     109f <uthread_join+0xbf>
     ff4:	89 f0                	mov    %esi,%eax
     ff6:	c1 e8 1f             	shr    $0x1f,%eax
     ff9:	84 c0                	test   %al,%al
     ffb:	0f 85 9e 00 00 00    	jne    109f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1001:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1004:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1006:	6a 00                	push   $0x0
    1008:	e8 4d f3 ff ff       	call   35a <alarm>
    100d:	b8 c0 19 00 00       	mov    $0x19c0,%eax
    1012:	83 c4 10             	add    $0x10,%esp
    1015:	eb 14                	jmp    102b <uthread_join+0x4b>
    1017:	89 f6                	mov    %esi,%esi
    1019:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1020:	83 c3 01             	add    $0x1,%ebx
    1023:	83 c0 24             	add    $0x24,%eax
    1026:	83 fb 40             	cmp    $0x40,%ebx
    1029:	74 55                	je     1080 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    102b:	3b 30                	cmp    (%eax),%esi
    102d:	75 f1                	jne    1020 <uthread_join+0x40>
    102f:	8b 50 08             	mov    0x8(%eax),%edx
    1032:	85 d2                	test   %edx,%edx
    1034:	74 ea                	je     1020 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1036:	53                   	push   %ebx
    1037:	ff 35 e8 a8 00 00    	pushl  0xa8e8
    103d:	68 0a 14 00 00       	push   $0x140a
    1042:	6a 01                	push   $0x1
    1044:	e8 c7 f3 ff ff       	call   410 <printf>
    threads[index_currently_running].join=found_tid;
    1049:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
    104e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1051:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
    1058:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    105b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1062:	e8 bb f2 ff ff       	call   322 <getpid>
    1067:	5a                   	pop    %edx
    1068:	59                   	pop    %ecx
    1069:	6a 0e                	push   $0xe
    106b:	50                   	push   %eax
    106c:	e8 d9 f2 ff ff       	call   34a <sigsend>
  }
  return 0;
    1071:	83 c4 10             	add    $0x10,%esp

}
    1074:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1077:	31 c0                	xor    %eax,%eax

}
    1079:	5b                   	pop    %ebx
    107a:	5e                   	pop    %esi
    107b:	5d                   	pop    %ebp
    107c:	c3                   	ret    
    107d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1080:	83 ec 04             	sub    $0x4,%esp
    1083:	56                   	push   %esi
    1084:	68 ec 13 00 00       	push   $0x13ec
    1089:	6a 01                	push   $0x1
    108b:	e8 80 f3 ff ff       	call   410 <printf>
    alarm(UTHREAD_QUANTA);
    1090:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1097:	e8 be f2 ff ff       	call   35a <alarm>
    return -1;
    109c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    109f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    10a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    10a7:	5b                   	pop    %ebx
    10a8:	5e                   	pop    %esi
    10a9:	5d                   	pop    %ebp
    10aa:	c3                   	ret    
    10ab:	90                   	nop
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010b0 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    10b0:	55                   	push   %ebp
    10b1:	89 e5                	mov    %esp,%ebp
    10b3:	53                   	push   %ebx
    10b4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    10b7:	6a 00                	push   $0x0
    10b9:	e8 9c f2 ff ff       	call   35a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    10be:	8b 1d e8 a8 00 00    	mov    0xa8e8,%ebx
    10c4:	e8 71 f2 ff ff       	call   33a <uptime>
    10c9:	03 45 08             	add    0x8(%ebp),%eax
    10cc:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    10cf:	89 04 95 dc 19 00 00 	mov    %eax,0x19dc(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    10d6:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
    10db:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10de:	c7 04 85 c8 19 00 00 	movl   $0x1,0x19c8(,%eax,4)
    10e5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    10e9:	e8 34 f2 ff ff       	call   322 <getpid>
    10ee:	5a                   	pop    %edx
    10ef:	59                   	pop    %ecx
    10f0:	6a 0e                	push   $0xe
    10f2:	50                   	push   %eax
    10f3:	e8 52 f2 ff ff       	call   34a <sigsend>
  return 0;
}
    10f8:	31 c0                	xor    %eax,%eax
    10fa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10fd:	c9                   	leave  
    10fe:	c3                   	ret    
    10ff:	90                   	nop

00001100 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	53                   	push   %ebx
    1104:	83 ec 04             	sub    $0x4,%esp
    1107:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    110a:	8b 45 0c             	mov    0xc(%ebp),%eax
    110d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1110:	e8 bb f7 ff ff       	call   8d0 <bsem_alloc>
    1115:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1117:	e8 b4 f7 ff ff       	call   8d0 <bsem_alloc>
    111c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    111f:	83 c4 04             	add    $0x4,%esp
    1122:	5b                   	pop    %ebx
    1123:	5d                   	pop    %ebp
    1124:	c3                   	ret    
    1125:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1129:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001130 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	53                   	push   %ebx
    1134:	83 ec 10             	sub    $0x10,%esp
    1137:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    113a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1141:	ff 33                	pushl  (%ebx)
    1143:	e8 78 f8 ff ff       	call   9c0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1148:	8b 43 04             	mov    0x4(%ebx),%eax
    114b:	83 c4 10             	add    $0x10,%esp
}
    114e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1151:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1154:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1155:	e9 66 f8 ff ff       	jmp    9c0 <bsem_free>
    115a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001160 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	53                   	push   %ebx
    1164:	83 ec 10             	sub    $0x10,%esp
    1167:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    116a:	ff 73 04             	pushl  0x4(%ebx)
    116d:	e8 de f8 ff ff       	call   a50 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1172:	58                   	pop    %eax
    1173:	ff 33                	pushl  (%ebx)
    1175:	e8 d6 f8 ff ff       	call   a50 <bsem_down>
  csem->value--;
    117a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    117d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1180:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1183:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1185:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1188:	7e 0e                	jle    1198 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    118a:	83 ec 0c             	sub    $0xc,%esp
    118d:	ff 73 04             	pushl  0x4(%ebx)
    1190:	e8 cb f9 ff ff       	call   b60 <bsem_up>
    1195:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1198:	8b 03                	mov    (%ebx),%eax
}
    119a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    119d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11a0:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11a1:	e9 ba f9 ff ff       	jmp    b60 <bsem_up>
    11a6:	8d 76 00             	lea    0x0(%esi),%esi
    11a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011b0 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	83 ec 10             	sub    $0x10,%esp
    11b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    11ba:	ff 33                	pushl  (%ebx)
    11bc:	e8 8f f8 ff ff       	call   a50 <bsem_down>
  csem->value++;
    11c1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    11c4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11c7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    11ca:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11cd:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    11d0:	74 0e                	je     11e0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11d2:	8b 03                	mov    (%ebx),%eax
}
    11d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11d7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11da:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11db:	e9 80 f9 ff ff       	jmp    b60 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11e0:	83 ec 0c             	sub    $0xc,%esp
    11e3:	ff 73 04             	pushl  0x4(%ebx)
    11e6:	e8 75 f9 ff ff       	call   b60 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    11eb:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11ed:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    11f0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11f3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11f6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11f7:	e9 64 f9 ff ff       	jmp    b60 <bsem_up>
