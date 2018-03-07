
_echo:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	57                   	push   %edi
       e:	56                   	push   %esi
       f:	53                   	push   %ebx
      10:	51                   	push   %ecx
      11:	83 ec 08             	sub    $0x8,%esp
      14:	8b 31                	mov    (%ecx),%esi
      16:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  for(i = 1; i < argc; i++)
      19:	83 fe 01             	cmp    $0x1,%esi
      1c:	7e 41                	jle    5f <main+0x5f>
      1e:	bb 01 00 00 00       	mov    $0x1,%ebx
      23:	eb 1b                	jmp    40 <main+0x40>
      25:	8d 76 00             	lea    0x0(%esi),%esi
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
      28:	68 0c 12 00 00       	push   $0x120c
      2d:	ff 74 9f fc          	pushl  -0x4(%edi,%ebx,4)
      31:	68 0e 12 00 00       	push   $0x120e
      36:	6a 01                	push   $0x1
      38:	e8 e3 03 00 00       	call   420 <printf>
      3d:	83 c4 10             	add    $0x10,%esp
      40:	83 c3 01             	add    $0x1,%ebx
      43:	39 de                	cmp    %ebx,%esi
      45:	75 e1                	jne    28 <main+0x28>
      47:	68 aa 13 00 00       	push   $0x13aa
      4c:	ff 74 b7 fc          	pushl  -0x4(%edi,%esi,4)
      50:	68 0e 12 00 00       	push   $0x120e
      55:	6a 01                	push   $0x1
      57:	e8 c4 03 00 00       	call   420 <printf>
      5c:	83 c4 10             	add    $0x10,%esp
  exit();
      5f:	e8 4e 02 00 00       	call   2b2 <exit>
      64:	66 90                	xchg   %ax,%ax
      66:	66 90                	xchg   %ax,%ax
      68:	66 90                	xchg   %ax,%ax
      6a:	66 90                	xchg   %ax,%ax
      6c:	66 90                	xchg   %ax,%ax
      6e:	66 90                	xchg   %ax,%ax

00000070 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      70:	55                   	push   %ebp
      71:	89 e5                	mov    %esp,%ebp
      73:	53                   	push   %ebx
      74:	8b 45 08             	mov    0x8(%ebp),%eax
      77:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      7a:	89 c2                	mov    %eax,%edx
      7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      80:	83 c1 01             	add    $0x1,%ecx
      83:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
      87:	83 c2 01             	add    $0x1,%edx
      8a:	84 db                	test   %bl,%bl
      8c:	88 5a ff             	mov    %bl,-0x1(%edx)
      8f:	75 ef                	jne    80 <strcpy+0x10>
    ;
  return os;
}
      91:	5b                   	pop    %ebx
      92:	5d                   	pop    %ebp
      93:	c3                   	ret    
      94:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      9a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000a0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      a0:	55                   	push   %ebp
      a1:	89 e5                	mov    %esp,%ebp
      a3:	56                   	push   %esi
      a4:	53                   	push   %ebx
      a5:	8b 55 08             	mov    0x8(%ebp),%edx
      a8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
      ab:	0f b6 02             	movzbl (%edx),%eax
      ae:	0f b6 19             	movzbl (%ecx),%ebx
      b1:	84 c0                	test   %al,%al
      b3:	75 1e                	jne    d3 <strcmp+0x33>
      b5:	eb 29                	jmp    e0 <strcmp+0x40>
      b7:	89 f6                	mov    %esi,%esi
      b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
      c0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      c3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
      c6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      c9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
      cd:	84 c0                	test   %al,%al
      cf:	74 0f                	je     e0 <strcmp+0x40>
      d1:	89 f1                	mov    %esi,%ecx
      d3:	38 d8                	cmp    %bl,%al
      d5:	74 e9                	je     c0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      d7:	29 d8                	sub    %ebx,%eax
}
      d9:	5b                   	pop    %ebx
      da:	5e                   	pop    %esi
      db:	5d                   	pop    %ebp
      dc:	c3                   	ret    
      dd:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      e0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
      e2:	29 d8                	sub    %ebx,%eax
}
      e4:	5b                   	pop    %ebx
      e5:	5e                   	pop    %esi
      e6:	5d                   	pop    %ebp
      e7:	c3                   	ret    
      e8:	90                   	nop
      e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000000f0 <strlen>:

uint
strlen(char *s)
{
      f0:	55                   	push   %ebp
      f1:	89 e5                	mov    %esp,%ebp
      f3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
      f6:	80 39 00             	cmpb   $0x0,(%ecx)
      f9:	74 12                	je     10d <strlen+0x1d>
      fb:	31 d2                	xor    %edx,%edx
      fd:	8d 76 00             	lea    0x0(%esi),%esi
     100:	83 c2 01             	add    $0x1,%edx
     103:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     107:	89 d0                	mov    %edx,%eax
     109:	75 f5                	jne    100 <strlen+0x10>
    ;
  return n;
}
     10b:	5d                   	pop    %ebp
     10c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     10d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     10f:	5d                   	pop    %ebp
     110:	c3                   	ret    
     111:	eb 0d                	jmp    120 <memset>
     113:	90                   	nop
     114:	90                   	nop
     115:	90                   	nop
     116:	90                   	nop
     117:	90                   	nop
     118:	90                   	nop
     119:	90                   	nop
     11a:	90                   	nop
     11b:	90                   	nop
     11c:	90                   	nop
     11d:	90                   	nop
     11e:	90                   	nop
     11f:	90                   	nop

00000120 <memset>:

void*
memset(void *dst, int c, uint n)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	57                   	push   %edi
     124:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     127:	8b 4d 10             	mov    0x10(%ebp),%ecx
     12a:	8b 45 0c             	mov    0xc(%ebp),%eax
     12d:	89 d7                	mov    %edx,%edi
     12f:	fc                   	cld    
     130:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     132:	89 d0                	mov    %edx,%eax
     134:	5f                   	pop    %edi
     135:	5d                   	pop    %ebp
     136:	c3                   	ret    
     137:	89 f6                	mov    %esi,%esi
     139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000140 <strchr>:

char*
strchr(const char *s, char c)
{
     140:	55                   	push   %ebp
     141:	89 e5                	mov    %esp,%ebp
     143:	53                   	push   %ebx
     144:	8b 45 08             	mov    0x8(%ebp),%eax
     147:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     14a:	0f b6 10             	movzbl (%eax),%edx
     14d:	84 d2                	test   %dl,%dl
     14f:	74 1d                	je     16e <strchr+0x2e>
    if(*s == c)
     151:	38 d3                	cmp    %dl,%bl
     153:	89 d9                	mov    %ebx,%ecx
     155:	75 0d                	jne    164 <strchr+0x24>
     157:	eb 17                	jmp    170 <strchr+0x30>
     159:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     160:	38 ca                	cmp    %cl,%dl
     162:	74 0c                	je     170 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     164:	83 c0 01             	add    $0x1,%eax
     167:	0f b6 10             	movzbl (%eax),%edx
     16a:	84 d2                	test   %dl,%dl
     16c:	75 f2                	jne    160 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     16e:	31 c0                	xor    %eax,%eax
}
     170:	5b                   	pop    %ebx
     171:	5d                   	pop    %ebp
     172:	c3                   	ret    
     173:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     179:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000180 <gets>:

char*
gets(char *buf, int max)
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	57                   	push   %edi
     184:	56                   	push   %esi
     185:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     186:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     188:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     18b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     18e:	eb 29                	jmp    1b9 <gets+0x39>
    cc = read(0, &c, 1);
     190:	83 ec 04             	sub    $0x4,%esp
     193:	6a 01                	push   $0x1
     195:	57                   	push   %edi
     196:	6a 00                	push   $0x0
     198:	e8 2d 01 00 00       	call   2ca <read>
    if(cc < 1)
     19d:	83 c4 10             	add    $0x10,%esp
     1a0:	85 c0                	test   %eax,%eax
     1a2:	7e 1d                	jle    1c1 <gets+0x41>
      break;
    buf[i++] = c;
     1a4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     1a8:	8b 55 08             	mov    0x8(%ebp),%edx
     1ab:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     1ad:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     1af:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     1b3:	74 1b                	je     1d0 <gets+0x50>
     1b5:	3c 0d                	cmp    $0xd,%al
     1b7:	74 17                	je     1d0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1b9:	8d 5e 01             	lea    0x1(%esi),%ebx
     1bc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     1bf:	7c cf                	jl     190 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1c1:	8b 45 08             	mov    0x8(%ebp),%eax
     1c4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1c8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1cb:	5b                   	pop    %ebx
     1cc:	5e                   	pop    %esi
     1cd:	5f                   	pop    %edi
     1ce:	5d                   	pop    %ebp
     1cf:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1d0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1d3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1d5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1dc:	5b                   	pop    %ebx
     1dd:	5e                   	pop    %esi
     1de:	5f                   	pop    %edi
     1df:	5d                   	pop    %ebp
     1e0:	c3                   	ret    
     1e1:	eb 0d                	jmp    1f0 <stat>
     1e3:	90                   	nop
     1e4:	90                   	nop
     1e5:	90                   	nop
     1e6:	90                   	nop
     1e7:	90                   	nop
     1e8:	90                   	nop
     1e9:	90                   	nop
     1ea:	90                   	nop
     1eb:	90                   	nop
     1ec:	90                   	nop
     1ed:	90                   	nop
     1ee:	90                   	nop
     1ef:	90                   	nop

000001f0 <stat>:

int
stat(char *n, struct stat *st)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	56                   	push   %esi
     1f4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     1f5:	83 ec 08             	sub    $0x8,%esp
     1f8:	6a 00                	push   $0x0
     1fa:	ff 75 08             	pushl  0x8(%ebp)
     1fd:	e8 f0 00 00 00       	call   2f2 <open>
  if(fd < 0)
     202:	83 c4 10             	add    $0x10,%esp
     205:	85 c0                	test   %eax,%eax
     207:	78 27                	js     230 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     209:	83 ec 08             	sub    $0x8,%esp
     20c:	ff 75 0c             	pushl  0xc(%ebp)
     20f:	89 c3                	mov    %eax,%ebx
     211:	50                   	push   %eax
     212:	e8 f3 00 00 00       	call   30a <fstat>
     217:	89 c6                	mov    %eax,%esi
  close(fd);
     219:	89 1c 24             	mov    %ebx,(%esp)
     21c:	e8 b9 00 00 00       	call   2da <close>
  return r;
     221:	83 c4 10             	add    $0x10,%esp
     224:	89 f0                	mov    %esi,%eax
}
     226:	8d 65 f8             	lea    -0x8(%ebp),%esp
     229:	5b                   	pop    %ebx
     22a:	5e                   	pop    %esi
     22b:	5d                   	pop    %ebp
     22c:	c3                   	ret    
     22d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     230:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     235:	eb ef                	jmp    226 <stat+0x36>
     237:	89 f6                	mov    %esi,%esi
     239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000240 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     240:	55                   	push   %ebp
     241:	89 e5                	mov    %esp,%ebp
     243:	53                   	push   %ebx
     244:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     247:	0f be 11             	movsbl (%ecx),%edx
     24a:	8d 42 d0             	lea    -0x30(%edx),%eax
     24d:	3c 09                	cmp    $0x9,%al
     24f:	b8 00 00 00 00       	mov    $0x0,%eax
     254:	77 1f                	ja     275 <atoi+0x35>
     256:	8d 76 00             	lea    0x0(%esi),%esi
     259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     260:	8d 04 80             	lea    (%eax,%eax,4),%eax
     263:	83 c1 01             	add    $0x1,%ecx
     266:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     26a:	0f be 11             	movsbl (%ecx),%edx
     26d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     270:	80 fb 09             	cmp    $0x9,%bl
     273:	76 eb                	jbe    260 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     275:	5b                   	pop    %ebx
     276:	5d                   	pop    %ebp
     277:	c3                   	ret    
     278:	90                   	nop
     279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000280 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     280:	55                   	push   %ebp
     281:	89 e5                	mov    %esp,%ebp
     283:	56                   	push   %esi
     284:	53                   	push   %ebx
     285:	8b 5d 10             	mov    0x10(%ebp),%ebx
     288:	8b 45 08             	mov    0x8(%ebp),%eax
     28b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     28e:	85 db                	test   %ebx,%ebx
     290:	7e 14                	jle    2a6 <memmove+0x26>
     292:	31 d2                	xor    %edx,%edx
     294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     29f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2a2:	39 da                	cmp    %ebx,%edx
     2a4:	75 f2                	jne    298 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     2a6:	5b                   	pop    %ebx
     2a7:	5e                   	pop    %esi
     2a8:	5d                   	pop    %ebp
     2a9:	c3                   	ret    

000002aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2aa:	b8 01 00 00 00       	mov    $0x1,%eax
     2af:	cd 40                	int    $0x40
     2b1:	c3                   	ret    

000002b2 <exit>:
SYSCALL(exit)
     2b2:	b8 02 00 00 00       	mov    $0x2,%eax
     2b7:	cd 40                	int    $0x40
     2b9:	c3                   	ret    

000002ba <wait>:
SYSCALL(wait)
     2ba:	b8 03 00 00 00       	mov    $0x3,%eax
     2bf:	cd 40                	int    $0x40
     2c1:	c3                   	ret    

000002c2 <pipe>:
SYSCALL(pipe)
     2c2:	b8 04 00 00 00       	mov    $0x4,%eax
     2c7:	cd 40                	int    $0x40
     2c9:	c3                   	ret    

000002ca <read>:
SYSCALL(read)
     2ca:	b8 05 00 00 00       	mov    $0x5,%eax
     2cf:	cd 40                	int    $0x40
     2d1:	c3                   	ret    

000002d2 <write>:
SYSCALL(write)
     2d2:	b8 10 00 00 00       	mov    $0x10,%eax
     2d7:	cd 40                	int    $0x40
     2d9:	c3                   	ret    

000002da <close>:
SYSCALL(close)
     2da:	b8 15 00 00 00       	mov    $0x15,%eax
     2df:	cd 40                	int    $0x40
     2e1:	c3                   	ret    

000002e2 <kill>:
SYSCALL(kill)
     2e2:	b8 06 00 00 00       	mov    $0x6,%eax
     2e7:	cd 40                	int    $0x40
     2e9:	c3                   	ret    

000002ea <exec>:
SYSCALL(exec)
     2ea:	b8 07 00 00 00       	mov    $0x7,%eax
     2ef:	cd 40                	int    $0x40
     2f1:	c3                   	ret    

000002f2 <open>:
SYSCALL(open)
     2f2:	b8 0f 00 00 00       	mov    $0xf,%eax
     2f7:	cd 40                	int    $0x40
     2f9:	c3                   	ret    

000002fa <mknod>:
SYSCALL(mknod)
     2fa:	b8 11 00 00 00       	mov    $0x11,%eax
     2ff:	cd 40                	int    $0x40
     301:	c3                   	ret    

00000302 <unlink>:
SYSCALL(unlink)
     302:	b8 12 00 00 00       	mov    $0x12,%eax
     307:	cd 40                	int    $0x40
     309:	c3                   	ret    

0000030a <fstat>:
SYSCALL(fstat)
     30a:	b8 08 00 00 00       	mov    $0x8,%eax
     30f:	cd 40                	int    $0x40
     311:	c3                   	ret    

00000312 <link>:
SYSCALL(link)
     312:	b8 13 00 00 00       	mov    $0x13,%eax
     317:	cd 40                	int    $0x40
     319:	c3                   	ret    

0000031a <mkdir>:
SYSCALL(mkdir)
     31a:	b8 14 00 00 00       	mov    $0x14,%eax
     31f:	cd 40                	int    $0x40
     321:	c3                   	ret    

00000322 <chdir>:
SYSCALL(chdir)
     322:	b8 09 00 00 00       	mov    $0x9,%eax
     327:	cd 40                	int    $0x40
     329:	c3                   	ret    

0000032a <dup>:
SYSCALL(dup)
     32a:	b8 0a 00 00 00       	mov    $0xa,%eax
     32f:	cd 40                	int    $0x40
     331:	c3                   	ret    

00000332 <getpid>:
SYSCALL(getpid)
     332:	b8 0b 00 00 00       	mov    $0xb,%eax
     337:	cd 40                	int    $0x40
     339:	c3                   	ret    

0000033a <sbrk>:
SYSCALL(sbrk)
     33a:	b8 0c 00 00 00       	mov    $0xc,%eax
     33f:	cd 40                	int    $0x40
     341:	c3                   	ret    

00000342 <sleep>:
SYSCALL(sleep)
     342:	b8 0d 00 00 00       	mov    $0xd,%eax
     347:	cd 40                	int    $0x40
     349:	c3                   	ret    

0000034a <uptime>:
SYSCALL(uptime)
     34a:	b8 0e 00 00 00       	mov    $0xe,%eax
     34f:	cd 40                	int    $0x40
     351:	c3                   	ret    

00000352 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     352:	b8 16 00 00 00       	mov    $0x16,%eax
     357:	cd 40                	int    $0x40
     359:	c3                   	ret    

0000035a <sigsend>:
SYSCALL(sigsend)
     35a:	b8 17 00 00 00       	mov    $0x17,%eax
     35f:	cd 40                	int    $0x40
     361:	c3                   	ret    

00000362 <sigreturn>:
SYSCALL(sigreturn)
     362:	b8 18 00 00 00       	mov    $0x18,%eax
     367:	cd 40                	int    $0x40
     369:	c3                   	ret    

0000036a <alarm>:
SYSCALL(alarm)
     36a:	b8 19 00 00 00       	mov    $0x19,%eax
     36f:	cd 40                	int    $0x40
     371:	c3                   	ret    
     372:	66 90                	xchg   %ax,%ax
     374:	66 90                	xchg   %ax,%ax
     376:	66 90                	xchg   %ax,%ax
     378:	66 90                	xchg   %ax,%ax
     37a:	66 90                	xchg   %ax,%ax
     37c:	66 90                	xchg   %ax,%ax
     37e:	66 90                	xchg   %ax,%ax

00000380 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	57                   	push   %edi
     384:	56                   	push   %esi
     385:	53                   	push   %ebx
     386:	89 c6                	mov    %eax,%esi
     388:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     38b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     38e:	85 db                	test   %ebx,%ebx
     390:	74 7e                	je     410 <printint+0x90>
     392:	89 d0                	mov    %edx,%eax
     394:	c1 e8 1f             	shr    $0x1f,%eax
     397:	84 c0                	test   %al,%al
     399:	74 75                	je     410 <printint+0x90>
    neg = 1;
    x = -xx;
     39b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     39d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     3a4:	f7 d8                	neg    %eax
     3a6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     3a9:	31 ff                	xor    %edi,%edi
     3ab:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     3ae:	89 ce                	mov    %ecx,%esi
     3b0:	eb 08                	jmp    3ba <printint+0x3a>
     3b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     3b8:	89 cf                	mov    %ecx,%edi
     3ba:	31 d2                	xor    %edx,%edx
     3bc:	8d 4f 01             	lea    0x1(%edi),%ecx
     3bf:	f7 f6                	div    %esi
     3c1:	0f b6 92 1c 12 00 00 	movzbl 0x121c(%edx),%edx
  }while((x /= base) != 0);
     3c8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     3ca:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     3cd:	75 e9                	jne    3b8 <printint+0x38>
  if(neg)
     3cf:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     3d2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     3d5:	85 c0                	test   %eax,%eax
     3d7:	74 08                	je     3e1 <printint+0x61>
    buf[i++] = '-';
     3d9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     3de:	8d 4f 02             	lea    0x2(%edi),%ecx
     3e1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     3e5:	8d 76 00             	lea    0x0(%esi),%esi
     3e8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     3eb:	83 ec 04             	sub    $0x4,%esp
     3ee:	83 ef 01             	sub    $0x1,%edi
     3f1:	6a 01                	push   $0x1
     3f3:	53                   	push   %ebx
     3f4:	56                   	push   %esi
     3f5:	88 45 d7             	mov    %al,-0x29(%ebp)
     3f8:	e8 d5 fe ff ff       	call   2d2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     3fd:	83 c4 10             	add    $0x10,%esp
     400:	39 df                	cmp    %ebx,%edi
     402:	75 e4                	jne    3e8 <printint+0x68>
    putc(fd, buf[i]);
}
     404:	8d 65 f4             	lea    -0xc(%ebp),%esp
     407:	5b                   	pop    %ebx
     408:	5e                   	pop    %esi
     409:	5f                   	pop    %edi
     40a:	5d                   	pop    %ebp
     40b:	c3                   	ret    
     40c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     410:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     412:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     419:	eb 8b                	jmp    3a6 <printint+0x26>
     41b:	90                   	nop
     41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000420 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	57                   	push   %edi
     424:	56                   	push   %esi
     425:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     426:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     429:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     42c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     42f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     432:	89 45 d0             	mov    %eax,-0x30(%ebp)
     435:	0f b6 1e             	movzbl (%esi),%ebx
     438:	83 c6 01             	add    $0x1,%esi
     43b:	84 db                	test   %bl,%bl
     43d:	0f 84 b0 00 00 00    	je     4f3 <printf+0xd3>
     443:	31 d2                	xor    %edx,%edx
     445:	eb 39                	jmp    480 <printf+0x60>
     447:	89 f6                	mov    %esi,%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     450:	83 f8 25             	cmp    $0x25,%eax
     453:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     456:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     45b:	74 18                	je     475 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     45d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     460:	83 ec 04             	sub    $0x4,%esp
     463:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     466:	6a 01                	push   $0x1
     468:	50                   	push   %eax
     469:	57                   	push   %edi
     46a:	e8 63 fe ff ff       	call   2d2 <write>
     46f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     472:	83 c4 10             	add    $0x10,%esp
     475:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     478:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     47c:	84 db                	test   %bl,%bl
     47e:	74 73                	je     4f3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     480:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     482:	0f be cb             	movsbl %bl,%ecx
     485:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     488:	74 c6                	je     450 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     48a:	83 fa 25             	cmp    $0x25,%edx
     48d:	75 e6                	jne    475 <printf+0x55>
      if(c == 'd'){
     48f:	83 f8 64             	cmp    $0x64,%eax
     492:	0f 84 f8 00 00 00    	je     590 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     498:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     49e:	83 f9 70             	cmp    $0x70,%ecx
     4a1:	74 5d                	je     500 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     4a3:	83 f8 73             	cmp    $0x73,%eax
     4a6:	0f 84 84 00 00 00    	je     530 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     4ac:	83 f8 63             	cmp    $0x63,%eax
     4af:	0f 84 ea 00 00 00    	je     59f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     4b5:	83 f8 25             	cmp    $0x25,%eax
     4b8:	0f 84 c2 00 00 00    	je     580 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4be:	8d 45 e7             	lea    -0x19(%ebp),%eax
     4c1:	83 ec 04             	sub    $0x4,%esp
     4c4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     4c8:	6a 01                	push   $0x1
     4ca:	50                   	push   %eax
     4cb:	57                   	push   %edi
     4cc:	e8 01 fe ff ff       	call   2d2 <write>
     4d1:	83 c4 0c             	add    $0xc,%esp
     4d4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     4d7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     4da:	6a 01                	push   $0x1
     4dc:	50                   	push   %eax
     4dd:	57                   	push   %edi
     4de:	83 c6 01             	add    $0x1,%esi
     4e1:	e8 ec fd ff ff       	call   2d2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4e6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4ea:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     4ed:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4ef:	84 db                	test   %bl,%bl
     4f1:	75 8d                	jne    480 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     4f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4f6:	5b                   	pop    %ebx
     4f7:	5e                   	pop    %esi
     4f8:	5f                   	pop    %edi
     4f9:	5d                   	pop    %ebp
     4fa:	c3                   	ret    
     4fb:	90                   	nop
     4fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     500:	83 ec 0c             	sub    $0xc,%esp
     503:	b9 10 00 00 00       	mov    $0x10,%ecx
     508:	6a 00                	push   $0x0
     50a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     50d:	89 f8                	mov    %edi,%eax
     50f:	8b 13                	mov    (%ebx),%edx
     511:	e8 6a fe ff ff       	call   380 <printint>
        ap++;
     516:	89 d8                	mov    %ebx,%eax
     518:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     51b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     51d:	83 c0 04             	add    $0x4,%eax
     520:	89 45 d0             	mov    %eax,-0x30(%ebp)
     523:	e9 4d ff ff ff       	jmp    475 <printf+0x55>
     528:	90                   	nop
     529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     530:	8b 45 d0             	mov    -0x30(%ebp),%eax
     533:	8b 18                	mov    (%eax),%ebx
        ap++;
     535:	83 c0 04             	add    $0x4,%eax
     538:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     53b:	b8 13 12 00 00       	mov    $0x1213,%eax
     540:	85 db                	test   %ebx,%ebx
     542:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     545:	0f b6 03             	movzbl (%ebx),%eax
     548:	84 c0                	test   %al,%al
     54a:	74 23                	je     56f <printf+0x14f>
     54c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     550:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     553:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     556:	83 ec 04             	sub    $0x4,%esp
     559:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     55b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     55e:	50                   	push   %eax
     55f:	57                   	push   %edi
     560:	e8 6d fd ff ff       	call   2d2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     565:	0f b6 03             	movzbl (%ebx),%eax
     568:	83 c4 10             	add    $0x10,%esp
     56b:	84 c0                	test   %al,%al
     56d:	75 e1                	jne    550 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     56f:	31 d2                	xor    %edx,%edx
     571:	e9 ff fe ff ff       	jmp    475 <printf+0x55>
     576:	8d 76 00             	lea    0x0(%esi),%esi
     579:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     580:	83 ec 04             	sub    $0x4,%esp
     583:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     586:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     589:	6a 01                	push   $0x1
     58b:	e9 4c ff ff ff       	jmp    4dc <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     590:	83 ec 0c             	sub    $0xc,%esp
     593:	b9 0a 00 00 00       	mov    $0xa,%ecx
     598:	6a 01                	push   $0x1
     59a:	e9 6b ff ff ff       	jmp    50a <printf+0xea>
     59f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5a2:	83 ec 04             	sub    $0x4,%esp
     5a5:	8b 03                	mov    (%ebx),%eax
     5a7:	6a 01                	push   $0x1
     5a9:	88 45 e4             	mov    %al,-0x1c(%ebp)
     5ac:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     5af:	50                   	push   %eax
     5b0:	57                   	push   %edi
     5b1:	e8 1c fd ff ff       	call   2d2 <write>
     5b6:	e9 5b ff ff ff       	jmp    516 <printf+0xf6>
     5bb:	66 90                	xchg   %ax,%ax
     5bd:	66 90                	xchg   %ax,%ax
     5bf:	90                   	nop

000005c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     5c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5c1:	a1 a0 19 00 00       	mov    0x19a0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     5c6:	89 e5                	mov    %esp,%ebp
     5c8:	57                   	push   %edi
     5c9:	56                   	push   %esi
     5ca:	53                   	push   %ebx
     5cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5ce:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     5d0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5d3:	39 c8                	cmp    %ecx,%eax
     5d5:	73 19                	jae    5f0 <free+0x30>
     5d7:	89 f6                	mov    %esi,%esi
     5d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5e0:	39 d1                	cmp    %edx,%ecx
     5e2:	72 1c                	jb     600 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5e4:	39 d0                	cmp    %edx,%eax
     5e6:	73 18                	jae    600 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     5e8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5ea:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5ec:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5ee:	72 f0                	jb     5e0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5f0:	39 d0                	cmp    %edx,%eax
     5f2:	72 f4                	jb     5e8 <free+0x28>
     5f4:	39 d1                	cmp    %edx,%ecx
     5f6:	73 f0                	jae    5e8 <free+0x28>
     5f8:	90                   	nop
     5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     600:	8b 73 fc             	mov    -0x4(%ebx),%esi
     603:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     606:	39 d7                	cmp    %edx,%edi
     608:	74 19                	je     623 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     60a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     60d:	8b 50 04             	mov    0x4(%eax),%edx
     610:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     613:	39 f1                	cmp    %esi,%ecx
     615:	74 23                	je     63a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     617:	89 08                	mov    %ecx,(%eax)
  freep = p;
     619:	a3 a0 19 00 00       	mov    %eax,0x19a0
}
     61e:	5b                   	pop    %ebx
     61f:	5e                   	pop    %esi
     620:	5f                   	pop    %edi
     621:	5d                   	pop    %ebp
     622:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     623:	03 72 04             	add    0x4(%edx),%esi
     626:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     629:	8b 10                	mov    (%eax),%edx
     62b:	8b 12                	mov    (%edx),%edx
     62d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     630:	8b 50 04             	mov    0x4(%eax),%edx
     633:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     636:	39 f1                	cmp    %esi,%ecx
     638:	75 dd                	jne    617 <free+0x57>
    p->s.size += bp->s.size;
     63a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     63d:	a3 a0 19 00 00       	mov    %eax,0x19a0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     642:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     645:	8b 53 f8             	mov    -0x8(%ebx),%edx
     648:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     64a:	5b                   	pop    %ebx
     64b:	5e                   	pop    %esi
     64c:	5f                   	pop    %edi
     64d:	5d                   	pop    %ebp
     64e:	c3                   	ret    
     64f:	90                   	nop

00000650 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     659:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     65c:	8b 15 a0 19 00 00    	mov    0x19a0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     662:	8d 78 07             	lea    0x7(%eax),%edi
     665:	c1 ef 03             	shr    $0x3,%edi
     668:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     66b:	85 d2                	test   %edx,%edx
     66d:	0f 84 a3 00 00 00    	je     716 <malloc+0xc6>
     673:	8b 02                	mov    (%edx),%eax
     675:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     678:	39 cf                	cmp    %ecx,%edi
     67a:	76 74                	jbe    6f0 <malloc+0xa0>
     67c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     682:	be 00 10 00 00       	mov    $0x1000,%esi
     687:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     68e:	0f 43 f7             	cmovae %edi,%esi
     691:	ba 00 80 00 00       	mov    $0x8000,%edx
     696:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     69c:	0f 46 da             	cmovbe %edx,%ebx
     69f:	eb 10                	jmp    6b1 <malloc+0x61>
     6a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     6a8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     6aa:	8b 48 04             	mov    0x4(%eax),%ecx
     6ad:	39 cf                	cmp    %ecx,%edi
     6af:	76 3f                	jbe    6f0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     6b1:	39 05 a0 19 00 00    	cmp    %eax,0x19a0
     6b7:	89 c2                	mov    %eax,%edx
     6b9:	75 ed                	jne    6a8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     6bb:	83 ec 0c             	sub    $0xc,%esp
     6be:	53                   	push   %ebx
     6bf:	e8 76 fc ff ff       	call   33a <sbrk>
  if(p == (char*)-1)
     6c4:	83 c4 10             	add    $0x10,%esp
     6c7:	83 f8 ff             	cmp    $0xffffffff,%eax
     6ca:	74 1c                	je     6e8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     6cc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     6cf:	83 ec 0c             	sub    $0xc,%esp
     6d2:	83 c0 08             	add    $0x8,%eax
     6d5:	50                   	push   %eax
     6d6:	e8 e5 fe ff ff       	call   5c0 <free>
  return freep;
     6db:	8b 15 a0 19 00 00    	mov    0x19a0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     6e1:	83 c4 10             	add    $0x10,%esp
     6e4:	85 d2                	test   %edx,%edx
     6e6:	75 c0                	jne    6a8 <malloc+0x58>
        return 0;
     6e8:	31 c0                	xor    %eax,%eax
     6ea:	eb 1c                	jmp    708 <malloc+0xb8>
     6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     6f0:	39 cf                	cmp    %ecx,%edi
     6f2:	74 1c                	je     710 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     6f4:	29 f9                	sub    %edi,%ecx
     6f6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     6f9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     6fc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     6ff:	89 15 a0 19 00 00    	mov    %edx,0x19a0
      return (void*)(p + 1);
     705:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     708:	8d 65 f4             	lea    -0xc(%ebp),%esp
     70b:	5b                   	pop    %ebx
     70c:	5e                   	pop    %esi
     70d:	5f                   	pop    %edi
     70e:	5d                   	pop    %ebp
     70f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     710:	8b 08                	mov    (%eax),%ecx
     712:	89 0a                	mov    %ecx,(%edx)
     714:	eb e9                	jmp    6ff <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     716:	c7 05 a0 19 00 00 a4 	movl   $0x19a4,0x19a0
     71d:	19 00 00 
     720:	c7 05 a4 19 00 00 a4 	movl   $0x19a4,0x19a4
     727:	19 00 00 
    base.s.size = 0;
     72a:	b8 a4 19 00 00       	mov    $0x19a4,%eax
     72f:	c7 05 a8 19 00 00 00 	movl   $0x0,0x19a8
     736:	00 00 00 
     739:	e9 3e ff ff ff       	jmp    67c <malloc+0x2c>
     73e:	66 90                	xchg   %ax,%ax

00000740 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	56                   	push   %esi
     744:	53                   	push   %ebx
     745:	8b 75 0c             	mov    0xc(%ebp),%esi
     748:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     74b:	83 ec 08             	sub    $0x8,%esp
     74e:	68 30 12 00 00       	push   $0x1230
     753:	6a 01                	push   $0x1
     755:	e8 c6 fc ff ff       	call   420 <printf>
  alarm(UTHREAD_QUANTA);
     75a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     761:	e8 04 fc ff ff       	call   36a <alarm>
  start_func(arg);
     766:	89 75 08             	mov    %esi,0x8(%ebp)
     769:	83 c4 10             	add    $0x10,%esp
}
     76c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     76f:	89 d8                	mov    %ebx,%eax
}
     771:	5b                   	pop    %ebx
     772:	5e                   	pop    %esi
     773:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     774:	ff e0                	jmp    *%eax
     776:	8d 76 00             	lea    0x0(%esi),%esi
     779:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000780 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     780:	55                   	push   %ebp
     781:	89 e5                	mov    %esp,%ebp
     783:	53                   	push   %ebx
     784:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     787:	6a 00                	push   $0x0
     789:	e8 dc fb ff ff       	call   36a <alarm>
  printf(1,"exiting...\n");
     78e:	5a                   	pop    %edx
     78f:	59                   	pop    %ecx
     790:	68 a0 13 00 00       	push   $0x13a0
     795:	6a 01                	push   $0x1
     797:	e8 84 fc ff ff       	call   420 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     79c:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     7a1:	83 c4 10             	add    $0x10,%esp
     7a4:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7a7:	8b 1c 95 c0 19 00 00 	mov    0x19c0(,%edx,4),%ebx
     7ae:	85 db                	test   %ebx,%ebx
     7b0:	75 0a                	jne    7bc <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     7b2:	c7 05 c8 19 00 00 00 	movl   $0x0,0x19c8
     7b9:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     7bc:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     7bf:	83 ec 0c             	sub    $0xc,%esp
     7c2:	ff 34 85 c4 19 00 00 	pushl  0x19c4(,%eax,4)
     7c9:	e8 f2 fd ff ff       	call   5c0 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     7ce:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     7d3:	83 c4 10             	add    $0x10,%esp
     7d6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7d9:	b8 c8 19 00 00       	mov    $0x19c8,%eax
     7de:	c1 e2 02             	shl    $0x2,%edx
     7e1:	c7 82 c8 19 00 00 00 	movl   $0x0,0x19c8(%edx)
     7e8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     7eb:	c7 82 c0 19 00 00 ff 	movl   $0xffffffff,0x19c0(%edx)
     7f2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     7f5:	c7 82 cc 19 00 00 00 	movl   $0x0,0x19cc(%edx)
     7fc:	00 00 00 
  threads[index_currently_running].esp = 0;
     7ff:	c7 82 d0 19 00 00 00 	movl   $0x0,0x19d0(%edx)
     806:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     809:	c7 82 dc 19 00 00 00 	movl   $0x0,0x19dc(%edx)
     810:	00 00 00 
  threads[index_currently_running].join = -1;
     813:	c7 82 e0 19 00 00 ff 	movl   $0xffffffff,0x19e0(%edx)
     81a:	ff ff ff 
     81d:	eb 0b                	jmp    82a <uthread_exit+0xaa>
     81f:	90                   	nop
     820:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     823:	3d c8 22 00 00       	cmp    $0x22c8,%eax
     828:	74 15                	je     83f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     82a:	83 38 04             	cmpl   $0x4,(%eax)
     82d:	75 f1                	jne    820 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     82f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     835:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     838:	3d c8 22 00 00       	cmp    $0x22c8,%eax
     83d:	75 eb                	jne    82a <uthread_exit+0xaa>
     83f:	bb ec 19 00 00       	mov    $0x19ec,%ebx
     844:	eb 15                	jmp    85b <uthread_exit+0xdb>
     846:	8d 76 00             	lea    0x0(%esi),%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     850:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     853:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     859:	74 24                	je     87f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     85b:	8b 03                	mov    (%ebx),%eax
     85d:	85 c0                	test   %eax,%eax
     85f:	74 ef                	je     850 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     861:	e8 cc fa ff ff       	call   332 <getpid>
     866:	83 ec 08             	sub    $0x8,%esp
     869:	83 c3 24             	add    $0x24,%ebx
     86c:	6a 0e                	push   $0xe
     86e:	50                   	push   %eax
     86f:	e8 e6 fa ff ff       	call   35a <sigsend>
     874:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     877:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     87d:	75 dc                	jne    85b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     87f:	e8 2e fa ff ff       	call   2b2 <exit>
     884:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     88a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000890 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     890:	55                   	push   %ebp
     891:	ba e8 23 00 00       	mov    $0x23e8,%edx
     896:	89 e5                	mov    %esp,%ebp
     898:	90                   	nop
     899:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8a0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     8a6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     8ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     8b0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     8b6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     8b9:	39 d0                	cmp    %edx,%eax
     8bb:	75 f3                	jne    8b0 <init_bsem+0x20>
     8bd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     8c3:	81 fa e8 a9 00 00    	cmp    $0xa9e8,%edx
     8c9:	75 d5                	jne    8a0 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     8cb:	c7 05 ac 19 00 00 01 	movl   $0x1,0x19ac
     8d2:	00 00 00 
}
     8d5:	5d                   	pop    %ebp
     8d6:	c3                   	ret    
     8d7:	89 f6                	mov    %esi,%esi
     8d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008e0 <bsem_alloc>:

int bsem_alloc() {
     8e0:	55                   	push   %ebp
     8e1:	89 e5                	mov    %esp,%ebp
     8e3:	53                   	push   %ebx
     8e4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     8e7:	6a 00                	push   $0x0
     8e9:	e8 7c fa ff ff       	call   36a <alarm>
  int i;
  if(first_run_bsem == 0)
     8ee:	a1 ac 19 00 00       	mov    0x19ac,%eax
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	85 c0                	test   %eax,%eax
     8f8:	75 3b                	jne    935 <bsem_alloc+0x55>
     8fa:	ba e8 23 00 00       	mov    $0x23e8,%edx
     8ff:	90                   	nop
     900:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     906:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     90c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     910:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     916:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     919:	39 d0                	cmp    %edx,%eax
     91b:	75 f3                	jne    910 <bsem_alloc+0x30>
     91d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     923:	81 fa e8 a9 00 00    	cmp    $0xa9e8,%edx
     929:	75 d5                	jne    900 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     92b:	c7 05 ac 19 00 00 01 	movl   $0x1,0x19ac
     932:	00 00 00 
     935:	ba e8 23 00 00       	mov    $0x23e8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     93a:	31 c0                	xor    %eax,%eax
     93c:	eb 10                	jmp    94e <bsem_alloc+0x6e>
     93e:	83 c0 01             	add    $0x1,%eax
     941:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     947:	3d 80 00 00 00       	cmp    $0x80,%eax
     94c:	74 4f                	je     99d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     94e:	83 3a 01             	cmpl   $0x1,(%edx)
     951:	75 eb                	jne    93e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     953:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     959:	8b 15 80 19 00 00    	mov    0x1980,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     95f:	83 ec 0c             	sub    $0xc,%esp
     962:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     964:	8d 98 e0 22 00 00    	lea    0x22e0(%eax),%ebx
     96a:	89 90 e4 22 00 00    	mov    %edx,0x22e4(%eax)
    binSemCounter++;
     970:	83 c2 01             	add    $0x1,%edx
     973:	89 15 80 19 00 00    	mov    %edx,0x1980
    binSemaphore[i].lock = 1; // not locked
     979:	c7 80 e0 22 00 00 01 	movl   $0x1,0x22e0(%eax)
     980:	00 00 00 
    binSemaphore[i].state = USED;
     983:	c7 80 e8 23 00 00 00 	movl   $0x0,0x23e8(%eax)
     98a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     98d:	e8 d8 f9 ff ff       	call   36a <alarm>
    return binSemaphore[i].id;
     992:	8b 43 04             	mov    0x4(%ebx),%eax
     995:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     998:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     99b:	c9                   	leave  
     99c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     99d:	83 ec 08             	sub    $0x8,%esp
     9a0:	68 50 12 00 00       	push   $0x1250
     9a5:	6a 01                	push   $0x1
     9a7:	e8 74 fa ff ff       	call   420 <printf>
    alarm(UTHREAD_QUANTA);
     9ac:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     9b3:	e8 b2 f9 ff ff       	call   36a <alarm>
    return -1;
     9b8:	83 c4 10             	add    $0x10,%esp
     9bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     9c0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9c3:	c9                   	leave  
     9c4:	c3                   	ret    
     9c5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009d0 <bsem_free>:

void bsem_free(int id) {
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	53                   	push   %ebx
     9d4:	83 ec 10             	sub    $0x10,%esp
     9d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     9da:	6a 00                	push   $0x0
     9dc:	e8 89 f9 ff ff       	call   36a <alarm>
     9e1:	ba e4 22 00 00       	mov    $0x22e4,%edx
     9e6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     9e9:	31 c0                	xor    %eax,%eax
     9eb:	eb 13                	jmp    a00 <bsem_free+0x30>
     9ed:	8d 76 00             	lea    0x0(%esi),%esi
     9f0:	83 c0 01             	add    $0x1,%eax
     9f3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     9f9:	3d 80 00 00 00       	cmp    $0x80,%eax
     9fe:	74 38                	je     a38 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     a00:	39 1a                	cmp    %ebx,(%edx)
     a02:	75 ec                	jne    9f0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     a04:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     a0a:	05 e0 22 00 00       	add    $0x22e0,%eax
     a0f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     a16:	74 0a                	je     a22 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     a18:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     a1f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a22:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a29:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a2c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a2d:	e9 38 f9 ff ff       	jmp    36a <alarm>
     a32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     a38:	83 ec 04             	sub    $0x4,%esp
     a3b:	53                   	push   %ebx
     a3c:	68 ac 13 00 00       	push   $0x13ac
     a41:	6a 01                	push   $0x1
     a43:	e8 d8 f9 ff ff       	call   420 <printf>
     a48:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a4b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a52:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a55:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a56:	e9 0f f9 ff ff       	jmp    36a <alarm>
     a5b:	90                   	nop
     a5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a60 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	53                   	push   %ebx
     a64:	83 ec 10             	sub    $0x10,%esp
     a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a6a:	6a 00                	push   $0x0
     a6c:	e8 f9 f8 ff ff       	call   36a <alarm>
     a71:	b8 e4 22 00 00       	mov    $0x22e4,%eax
     a76:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a79:	31 d2                	xor    %edx,%edx
     a7b:	eb 17                	jmp    a94 <bsem_down+0x34>
     a7d:	8d 76 00             	lea    0x0(%esi),%esi
     a80:	83 c2 01             	add    $0x1,%edx
     a83:	05 0c 01 00 00       	add    $0x10c,%eax
     a88:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     a8e:	0f 84 8c 00 00 00    	je     b20 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     a94:	39 18                	cmp    %ebx,(%eax)
     a96:	75 e8                	jne    a80 <bsem_down+0x20>
     a98:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     a9e:	85 c9                	test   %ecx,%ecx
     aa0:	75 de                	jne    a80 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     aa2:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     aa8:	31 c0                	xor    %eax,%eax
     aaa:	83 b9 e0 22 00 00 01 	cmpl   $0x1,0x22e0(%ecx)
     ab1:	75 15                	jne    ac8 <bsem_down+0x68>
     ab3:	e9 93 00 00 00       	jmp    b4b <bsem_down+0xeb>
     ab8:	90                   	nop
     ab9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     ac0:	83 c0 01             	add    $0x1,%eax
     ac3:	83 f8 40             	cmp    $0x40,%eax
     ac6:	74 7b                	je     b43 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     ac8:	83 bc 81 e8 22 00 00 	cmpl   $0xffffffff,0x22e8(%ecx,%eax,4)
     acf:	ff 
     ad0:	75 ee                	jne    ac0 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     ad2:	8b 0d e8 a8 00 00    	mov    0xa8e8,%ecx
     ad8:	6b d2 43             	imul   $0x43,%edx,%edx
     adb:	01 c2                	add    %eax,%edx
     add:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     ae0:	8b 04 85 c0 19 00 00 	mov    0x19c0(,%eax,4),%eax
     ae7:	89 04 95 e8 22 00 00 	mov    %eax,0x22e8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     aee:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     af1:	c7 04 85 c8 19 00 00 	movl   $0x4,0x19c8(,%eax,4)
     af8:	04 00 00 00 

	 sigsend(getpid(),14);
     afc:	e8 31 f8 ff ff       	call   332 <getpid>
     b01:	83 ec 08             	sub    $0x8,%esp
     b04:	6a 0e                	push   $0xe
     b06:	50                   	push   %eax
     b07:	e8 4e f8 ff ff       	call   35a <sigsend>
     b0c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b0f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b16:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b19:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b1a:	e9 4b f8 ff ff       	jmp    36a <alarm>
     b1f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     b20:	83 ec 04             	sub    $0x4,%esp
     b23:	53                   	push   %ebx
     b24:	68 70 12 00 00       	push   $0x1270
     b29:	6a 01                	push   $0x1
     b2b:	e8 f0 f8 ff ff       	call   420 <printf>
     b30:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     b33:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b3a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b3d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b3e:	e9 27 f8 ff ff       	jmp    36a <alarm>
     b43:	8b 0d e8 a8 00 00    	mov    0xa8e8,%ecx
     b49:	eb a3                	jmp    aee <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     b4b:	c7 81 e0 22 00 00 00 	movl   $0x0,0x22e0(%ecx)
     b52:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b55:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b5c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b5f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b60:	e9 05 f8 ff ff       	jmp    36a <alarm>
     b65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b70 <bsem_up>:
}

void bsem_up(int id) {
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	57                   	push   %edi
     b74:	56                   	push   %esi
     b75:	53                   	push   %ebx
     b76:	83 ec 28             	sub    $0x28,%esp
     b79:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b7c:	6a 00                	push   $0x0
     b7e:	e8 e7 f7 ff ff       	call   36a <alarm>
     b83:	ba e4 22 00 00       	mov    $0x22e4,%edx
     b88:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b8b:	31 c0                	xor    %eax,%eax
     b8d:	eb 15                	jmp    ba4 <bsem_up+0x34>
     b8f:	90                   	nop
     b90:	83 c0 01             	add    $0x1,%eax
     b93:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     b99:	3d 80 00 00 00       	cmp    $0x80,%eax
     b9e:	0f 84 ac 00 00 00    	je     c50 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     ba4:	39 1a                	cmp    %ebx,(%edx)
     ba6:	75 e8                	jne    b90 <bsem_up+0x20>
     ba8:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     bae:	85 c9                	test   %ecx,%ecx
     bb0:	75 de                	jne    b90 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     bb2:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     bb8:	8b 97 e0 22 00 00    	mov    0x22e0(%edi),%edx
     bbe:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     bc1:	85 d2                	test   %edx,%edx
     bc3:	0f 85 9c 00 00 00    	jne    c65 <bsem_up+0xf5>
     bc9:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     bcb:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     bce:	8b b4 be e8 22 00 00 	mov    0x22e8(%esi,%edi,4),%esi
     bd5:	83 fe ff             	cmp    $0xffffffff,%esi
     bd8:	74 56                	je     c30 <bsem_up+0xc0>
     bda:	b9 c0 19 00 00       	mov    $0x19c0,%ecx
     bdf:	31 d2                	xor    %edx,%edx
     be1:	eb 10                	jmp    bf3 <bsem_up+0x83>
     be3:	90                   	nop
     be4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     be8:	83 c2 01             	add    $0x1,%edx
     beb:	83 c1 24             	add    $0x24,%ecx
     bee:	83 fa 40             	cmp    $0x40,%edx
     bf1:	74 3d                	je     c30 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     bf3:	8b 19                	mov    (%ecx),%ebx
     bf5:	39 de                	cmp    %ebx,%esi
     bf7:	75 ef                	jne    be8 <bsem_up+0x78>
     bf9:	83 fb ff             	cmp    $0xffffffff,%ebx
     bfc:	74 ea                	je     be8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     bfe:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     c01:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     c04:	c7 04 95 c8 19 00 00 	movl   $0x2,0x19c8(,%edx,4)
     c0b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     c0f:	01 c7                	add    %eax,%edi
     c11:	c7 04 bd e8 22 00 00 	movl   $0xffffffff,0x22e8(,%edi,4)
     c18:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c1c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     c23:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c26:	5b                   	pop    %ebx
     c27:	5e                   	pop    %esi
     c28:	5f                   	pop    %edi
     c29:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c2a:	e9 3b f7 ff ff       	jmp    36a <alarm>
     c2f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     c30:	83 c7 01             	add    $0x1,%edi
     c33:	83 ff 40             	cmp    $0x40,%edi
     c36:	75 93                	jne    bcb <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     c38:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c3e:	c7 80 e0 22 00 00 01 	movl   $0x1,0x22e0(%eax)
     c45:	00 00 00 
     c48:	eb d2                	jmp    c1c <bsem_up+0xac>
     c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     c50:	83 ec 04             	sub    $0x4,%esp
     c53:	53                   	push   %ebx
     c54:	68 d8 12 00 00       	push   $0x12d8
     c59:	6a 01                	push   $0x1
     c5b:	e8 c0 f7 ff ff       	call   420 <printf>
     c60:	83 c4 10             	add    $0x10,%esp
     c63:	eb b7                	jmp    c1c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     c65:	83 ec 08             	sub    $0x8,%esp
     c68:	68 b4 12 00 00       	push   $0x12b4
     c6d:	6a 01                	push   $0x1
     c6f:	e8 ac f7 ff ff       	call   420 <printf>
     c74:	83 c4 10             	add    $0x10,%esp
     c77:	eb a3                	jmp    c1c <bsem_up+0xac>
     c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c80 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     c86:	68 1c 13 00 00       	push   $0x131c
     c8b:	6a 01                	push   $0x1
     c8d:	e8 8e f7 ff ff       	call   420 <printf>
     c92:	b8 c0 19 00 00       	mov    $0x19c0,%eax
     c97:	83 c4 10             	add    $0x10,%esp
     c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     ca0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     ca6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     cad:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     cb0:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     cb7:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     cbe:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     cc5:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     ccc:	3d c0 22 00 00       	cmp    $0x22c0,%eax
     cd1:	75 cd                	jne    ca0 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cd3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     cd6:	c7 05 c0 19 00 00 00 	movl   $0x0,0x19c0
     cdd:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     ce0:	c7 05 c8 19 00 00 03 	movl   $0x3,0x19c8
     ce7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cea:	68 80 0e 00 00       	push   $0xe80
     cef:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     cf1:	c7 05 c4 19 00 00 00 	movl   $0x0,0x19c4
     cf8:	00 00 00 

  id_number_thread = 1;
     cfb:	c7 05 e4 a8 00 00 01 	movl   $0x1,0xa8e4
     d02:	00 00 00 
  index_currently_running = 0;
     d05:	c7 05 e8 a8 00 00 00 	movl   $0x0,0xa8e8
     d0c:	00 00 00 
  currently_running = 0;
     d0f:	c7 05 c0 22 00 00 00 	movl   $0x0,0x22c0
     d16:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d19:	e8 34 f6 ff ff       	call   352 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     d1e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     d25:	e8 40 f6 ff ff       	call   36a <alarm>
  return 0;
}
     d2a:	31 c0                	xor    %eax,%eax
     d2c:	c9                   	leave  
     d2d:	c3                   	ret    
     d2e:	66 90                	xchg   %ax,%ax

00000d30 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	56                   	push   %esi
     d34:	53                   	push   %ebx
  alarm(0);
     d35:	83 ec 0c             	sub    $0xc,%esp
     d38:	6a 00                	push   $0x0
     d3a:	e8 2b f6 ff ff       	call   36a <alarm>
  printf(1, "------ creating a new thread ------\n");
     d3f:	5b                   	pop    %ebx
     d40:	5e                   	pop    %esi
     d41:	68 48 13 00 00       	push   $0x1348
     d46:	6a 01                	push   $0x1
     d48:	e8 d3 f6 ff ff       	call   420 <printf>
     d4d:	ba c8 19 00 00       	mov    $0x19c8,%edx
     d52:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     d55:	31 c0                	xor    %eax,%eax
     d57:	eb 12                	jmp    d6b <uthread_create+0x3b>
     d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d60:	83 c0 01             	add    $0x1,%eax
     d63:	83 c2 24             	add    $0x24,%edx
     d66:	83 f8 40             	cmp    $0x40,%eax
     d69:	74 7d                	je     de8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     d6b:	8b 0a                	mov    (%edx),%ecx
     d6d:	85 c9                	test   %ecx,%ecx
     d6f:	75 ef                	jne    d60 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d71:	8b 15 e4 a8 00 00    	mov    0xa8e4,%edx
     d77:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d7a:	83 ec 0c             	sub    $0xc,%esp
     d7d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d82:	c1 e3 02             	shl    $0x2,%ebx
     d85:	89 93 c0 19 00 00    	mov    %edx,0x19c0(%ebx)
  id_number_thread++;
     d8b:	83 c2 01             	add    $0x1,%edx
     d8e:	89 15 e4 a8 00 00    	mov    %edx,0xa8e4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d94:	e8 b7 f8 ff ff       	call   650 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     d99:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     d9c:	c7 80 f4 0f 00 00 80 	movl   $0x780,0xff4(%eax)
     da3:	07 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     da6:	89 83 c4 19 00 00    	mov    %eax,0x19c4(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     dac:	c7 83 c8 19 00 00 02 	movl   $0x2,0x19c8(%ebx)
     db3:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     db6:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     dbc:	8b 55 0c             	mov    0xc(%ebp),%edx
     dbf:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     dc5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dcc:	e8 99 f5 ff ff       	call   36a <alarm>
  return   threads[free_thread].thread_id;
     dd1:	8b 83 c0 19 00 00    	mov    0x19c0(%ebx),%eax
     dd7:	83 c4 10             	add    $0x10,%esp
}
     dda:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ddd:	5b                   	pop    %ebx
     dde:	5e                   	pop    %esi
     ddf:	5d                   	pop    %ebp
     de0:	c3                   	ret    
     de1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     de8:	83 ec 08             	sub    $0x8,%esp
     deb:	68 be 13 00 00       	push   $0x13be
     df0:	6a 01                	push   $0x1
     df2:	e8 29 f6 ff ff       	call   420 <printf>
    alarm(UTHREAD_QUANTA);
     df7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dfe:	e8 67 f5 ff ff       	call   36a <alarm>
    return -1;
     e03:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e06:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     e09:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e0e:	5b                   	pop    %ebx
     e0f:	5e                   	pop    %esi
     e10:	5d                   	pop    %ebp
     e11:	c3                   	ret    
     e12:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e20 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     e26:	85 c0                	test   %eax,%eax
     e28:	74 14                	je     e3e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     e2a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e2d:	89 e2                	mov    %esp,%edx
     e2f:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
     e36:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     e39:	89 ea                	mov    %ebp,%edx
     e3b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e3e:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     e43:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e46:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e4d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e50:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e57:	85 d2                	test   %edx,%edx
     e59:	74 0d                	je     e68 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     e5b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     e5d:	8b 40 0c             	mov    0xc(%eax),%eax
     e60:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     e62:	5d                   	pop    %ebp
     e63:	c3                   	ret    
     e64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e68:	8b 40 04             	mov    0x4(%eax),%eax
     e6b:	05 f4 0f 00 00       	add    $0xff4,%eax
     e70:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e72:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     e74:	b8 40 07 00 00       	mov    $0x740,%eax
     e79:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     e7b:	5d                   	pop    %ebp
     e7c:	c3                   	ret    
     e7d:	8d 76 00             	lea    0x0(%esi),%esi

00000e80 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     e80:	55                   	push   %ebp
     e81:	89 e5                	mov    %esp,%ebp
     e83:	56                   	push   %esi
     e84:	53                   	push   %ebx
     e85:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     e88:	83 ec 0c             	sub    $0xc,%esp
     e8b:	6a 00                	push   $0x0
     e8d:	e8 d8 f4 ff ff       	call   36a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     e92:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
     e97:	83 c4 10             	add    $0x10,%esp
     e9a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     e9d:	8d 14 95 c0 19 00 00 	lea    0x19c0(,%edx,4),%edx
     ea4:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     ea8:	75 0b                	jne    eb5 <uthread_schedule+0x35>
     eaa:	85 c0                	test   %eax,%eax
     eac:	74 07                	je     eb5 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     eae:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     eb5:	bb c8 19 00 00       	mov    $0x19c8,%ebx
     eba:	eb 0f                	jmp    ecb <uthread_schedule+0x4b>
     ebc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ec0:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     ec3:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     ec9:	74 55                	je     f20 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     ecb:	83 3b 01             	cmpl   $0x1,(%ebx)
     ece:	75 f0                	jne    ec0 <uthread_schedule+0x40>
     ed0:	8b 73 14             	mov    0x14(%ebx),%esi
     ed3:	85 f6                	test   %esi,%esi
     ed5:	0f 85 a5 00 00 00    	jne    f80 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     edb:	8b 43 18             	mov    0x18(%ebx),%eax
     ede:	83 f8 ff             	cmp    $0xffffffff,%eax
     ee1:	74 dd                	je     ec0 <uthread_schedule+0x40>
     ee3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ee6:	8b 14 95 c8 19 00 00 	mov    0x19c8(,%edx,4),%edx
     eed:	85 d2                	test   %edx,%edx
     eef:	75 cf                	jne    ec0 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     ef1:	50                   	push   %eax
     ef2:	ff 73 f8             	pushl  -0x8(%ebx)
     ef5:	83 c3 24             	add    $0x24,%ebx
     ef8:	68 70 13 00 00       	push   $0x1370
     efd:	6a 01                	push   $0x1
     eff:	e8 1c f5 ff ff       	call   420 <printf>
      threads[i].join = -1;
     f04:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     f0b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     f12:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f15:	81 fb c8 22 00 00    	cmp    $0x22c8,%ebx
     f1b:	75 ae                	jne    ecb <uthread_schedule+0x4b>
     f1d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     f20:	8b 15 e8 a8 00 00    	mov    0xa8e8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     f26:	b9 40 00 00 00       	mov    $0x40,%ecx
     f2b:	8d 42 01             	lea    0x1(%edx),%eax
     f2e:	eb 08                	jmp    f38 <uthread_schedule+0xb8>
     f30:	83 c0 01             	add    $0x1,%eax
     f33:	83 e9 01             	sub    $0x1,%ecx
     f36:	74 78                	je     fb0 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     f38:	89 c3                	mov    %eax,%ebx
     f3a:	c1 fb 1f             	sar    $0x1f,%ebx
     f3d:	c1 eb 1a             	shr    $0x1a,%ebx
     f40:	01 d8                	add    %ebx,%eax
     f42:	83 e0 3f             	and    $0x3f,%eax
     f45:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     f47:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     f4a:	83 3c 9d c8 19 00 00 	cmpl   $0x2,0x19c8(,%ebx,4)
     f51:	02 
     f52:	75 dc                	jne    f30 <uthread_schedule+0xb0>
     f54:	39 c2                	cmp    %eax,%edx
     f56:	74 d8                	je     f30 <uthread_schedule+0xb0>
      index_currently_running = i;
     f58:	a3 e8 a8 00 00       	mov    %eax,0xa8e8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     f5d:	83 ec 08             	sub    $0x8,%esp
     f60:	50                   	push   %eax
     f61:	52                   	push   %edx
     f62:	e8 b9 fe ff ff       	call   e20 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     f67:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f6e:	e8 f7 f3 ff ff       	call   36a <alarm>
}
     f73:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f76:	5b                   	pop    %ebx
     f77:	5e                   	pop    %esi
     f78:	5d                   	pop    %ebp
     f79:	c3                   	ret    
     f7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f80:	e8 c5 f3 ff ff       	call   34a <uptime>
     f85:	39 c6                	cmp    %eax,%esi
     f87:	7f 17                	jg     fa0 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
     f89:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
     f8f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
     f96:	e9 25 ff ff ff       	jmp    ec0 <uthread_schedule+0x40>
     f9b:	90                   	nop
     f9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     fa0:	83 3b 01             	cmpl   $0x1,(%ebx)
     fa3:	0f 84 32 ff ff ff    	je     edb <uthread_schedule+0x5b>
     fa9:	e9 12 ff ff ff       	jmp    ec0 <uthread_schedule+0x40>
     fae:	66 90                	xchg   %ax,%ax
     fb0:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
     fb3:	83 3c 85 c8 19 00 00 	cmpl   $0x2,0x19c8(,%eax,4)
     fba:	02 
     fbb:	0f 85 c7 fe ff ff    	jne    e88 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     fc1:	89 d0                	mov    %edx,%eax
     fc3:	eb 98                	jmp    f5d <uthread_schedule+0xdd>
     fc5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000fd0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fd0:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
  exit();
}

int
uthread_self()
{
     fd5:	55                   	push   %ebp
     fd6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
     fd8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
     fdb:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fdc:	8b 04 85 c0 19 00 00 	mov    0x19c0(,%eax,4),%eax
}
     fe3:	c3                   	ret    
     fe4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     fea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000ff0 <uthread_join>:

int
uthread_join(int tid)
{
     ff0:	55                   	push   %ebp
     ff1:	89 e5                	mov    %esp,%ebp
     ff3:	56                   	push   %esi
     ff4:	53                   	push   %ebx
     ff5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
     ff8:	39 35 e4 a8 00 00    	cmp    %esi,0xa8e4
     ffe:	0f 8c ab 00 00 00    	jl     10af <uthread_join+0xbf>
    1004:	89 f0                	mov    %esi,%eax
    1006:	c1 e8 1f             	shr    $0x1f,%eax
    1009:	84 c0                	test   %al,%al
    100b:	0f 85 9e 00 00 00    	jne    10af <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1011:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1014:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1016:	6a 00                	push   $0x0
    1018:	e8 4d f3 ff ff       	call   36a <alarm>
    101d:	b8 c0 19 00 00       	mov    $0x19c0,%eax
    1022:	83 c4 10             	add    $0x10,%esp
    1025:	eb 14                	jmp    103b <uthread_join+0x4b>
    1027:	89 f6                	mov    %esi,%esi
    1029:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1030:	83 c3 01             	add    $0x1,%ebx
    1033:	83 c0 24             	add    $0x24,%eax
    1036:	83 fb 40             	cmp    $0x40,%ebx
    1039:	74 55                	je     1090 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    103b:	3b 30                	cmp    (%eax),%esi
    103d:	75 f1                	jne    1030 <uthread_join+0x40>
    103f:	8b 50 08             	mov    0x8(%eax),%edx
    1042:	85 d2                	test   %edx,%edx
    1044:	74 ea                	je     1030 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1046:	53                   	push   %ebx
    1047:	ff 35 e8 a8 00 00    	pushl  0xa8e8
    104d:	68 fa 13 00 00       	push   $0x13fa
    1052:	6a 01                	push   $0x1
    1054:	e8 c7 f3 ff ff       	call   420 <printf>
    threads[index_currently_running].join=found_tid;
    1059:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
    105e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1061:	8d 04 85 c0 19 00 00 	lea    0x19c0(,%eax,4),%eax
    1068:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    106b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1072:	e8 bb f2 ff ff       	call   332 <getpid>
    1077:	5a                   	pop    %edx
    1078:	59                   	pop    %ecx
    1079:	6a 0e                	push   $0xe
    107b:	50                   	push   %eax
    107c:	e8 d9 f2 ff ff       	call   35a <sigsend>
  }
  return 0;
    1081:	83 c4 10             	add    $0x10,%esp

}
    1084:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1087:	31 c0                	xor    %eax,%eax

}
    1089:	5b                   	pop    %ebx
    108a:	5e                   	pop    %esi
    108b:	5d                   	pop    %ebp
    108c:	c3                   	ret    
    108d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1090:	83 ec 04             	sub    $0x4,%esp
    1093:	56                   	push   %esi
    1094:	68 dc 13 00 00       	push   $0x13dc
    1099:	6a 01                	push   $0x1
    109b:	e8 80 f3 ff ff       	call   420 <printf>
    alarm(UTHREAD_QUANTA);
    10a0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    10a7:	e8 be f2 ff ff       	call   36a <alarm>
    return -1;
    10ac:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    10af:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    10b2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    10b7:	5b                   	pop    %ebx
    10b8:	5e                   	pop    %esi
    10b9:	5d                   	pop    %ebp
    10ba:	c3                   	ret    
    10bb:	90                   	nop
    10bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010c0 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	53                   	push   %ebx
    10c4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    10c7:	6a 00                	push   $0x0
    10c9:	e8 9c f2 ff ff       	call   36a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    10ce:	8b 1d e8 a8 00 00    	mov    0xa8e8,%ebx
    10d4:	e8 71 f2 ff ff       	call   34a <uptime>
    10d9:	03 45 08             	add    0x8(%ebp),%eax
    10dc:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    10df:	89 04 95 dc 19 00 00 	mov    %eax,0x19dc(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    10e6:	a1 e8 a8 00 00       	mov    0xa8e8,%eax
    10eb:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10ee:	c7 04 85 c8 19 00 00 	movl   $0x1,0x19c8(,%eax,4)
    10f5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    10f9:	e8 34 f2 ff ff       	call   332 <getpid>
    10fe:	5a                   	pop    %edx
    10ff:	59                   	pop    %ecx
    1100:	6a 0e                	push   $0xe
    1102:	50                   	push   %eax
    1103:	e8 52 f2 ff ff       	call   35a <sigsend>
  return 0;
}
    1108:	31 c0                	xor    %eax,%eax
    110a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    110d:	c9                   	leave  
    110e:	c3                   	ret    
    110f:	90                   	nop

00001110 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1110:	55                   	push   %ebp
    1111:	89 e5                	mov    %esp,%ebp
    1113:	53                   	push   %ebx
    1114:	83 ec 04             	sub    $0x4,%esp
    1117:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    111a:	8b 45 0c             	mov    0xc(%ebp),%eax
    111d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1120:	e8 bb f7 ff ff       	call   8e0 <bsem_alloc>
    1125:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1127:	e8 b4 f7 ff ff       	call   8e0 <bsem_alloc>
    112c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    112f:	83 c4 04             	add    $0x4,%esp
    1132:	5b                   	pop    %ebx
    1133:	5d                   	pop    %ebp
    1134:	c3                   	ret    
    1135:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001140 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	83 ec 10             	sub    $0x10,%esp
    1147:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    114a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1151:	ff 33                	pushl  (%ebx)
    1153:	e8 78 f8 ff ff       	call   9d0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1158:	8b 43 04             	mov    0x4(%ebx),%eax
    115b:	83 c4 10             	add    $0x10,%esp
}
    115e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1161:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1164:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1165:	e9 66 f8 ff ff       	jmp    9d0 <bsem_free>
    116a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001170 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1170:	55                   	push   %ebp
    1171:	89 e5                	mov    %esp,%ebp
    1173:	53                   	push   %ebx
    1174:	83 ec 10             	sub    $0x10,%esp
    1177:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    117a:	ff 73 04             	pushl  0x4(%ebx)
    117d:	e8 de f8 ff ff       	call   a60 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1182:	58                   	pop    %eax
    1183:	ff 33                	pushl  (%ebx)
    1185:	e8 d6 f8 ff ff       	call   a60 <bsem_down>
  csem->value--;
    118a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    118d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1190:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1193:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1195:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1198:	7e 0e                	jle    11a8 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    119a:	83 ec 0c             	sub    $0xc,%esp
    119d:	ff 73 04             	pushl  0x4(%ebx)
    11a0:	e8 cb f9 ff ff       	call   b70 <bsem_up>
    11a5:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    11a8:	8b 03                	mov    (%ebx),%eax
}
    11aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11ad:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11b0:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11b1:	e9 ba f9 ff ff       	jmp    b70 <bsem_up>
    11b6:	8d 76 00             	lea    0x0(%esi),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	83 ec 10             	sub    $0x10,%esp
    11c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    11ca:	ff 33                	pushl  (%ebx)
    11cc:	e8 8f f8 ff ff       	call   a60 <bsem_down>
  csem->value++;
    11d1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    11d4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11d7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    11da:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11dd:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    11e0:	74 0e                	je     11f0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11e2:	8b 03                	mov    (%ebx),%eax
}
    11e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11e7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11ea:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11eb:	e9 80 f9 ff ff       	jmp    b70 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11f0:	83 ec 0c             	sub    $0xc,%esp
    11f3:	ff 73 04             	pushl  0x4(%ebx)
    11f6:	e8 75 f9 ff ff       	call   b70 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    11fb:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    11fd:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1200:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1203:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1206:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1207:	e9 64 f9 ff ff       	jmp    b70 <bsem_up>
