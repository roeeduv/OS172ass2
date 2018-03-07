
_mkdir:     file format elf32-i386


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
      11:	bf 01 00 00 00       	mov    $0x1,%edi
      16:	83 ec 08             	sub    $0x8,%esp
      19:	8b 31                	mov    (%ecx),%esi
      1b:	8b 59 04             	mov    0x4(%ecx),%ebx
      1e:	83 c3 04             	add    $0x4,%ebx
  int i;

  if(argc < 2){
      21:	83 fe 01             	cmp    $0x1,%esi
      24:	7e 3e                	jle    64 <main+0x64>
      26:	8d 76 00             	lea    0x0(%esi),%esi
      29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      30:	83 ec 0c             	sub    $0xc,%esp
      33:	ff 33                	pushl  (%ebx)
      35:	e8 f0 02 00 00       	call   32a <mkdir>
      3a:	83 c4 10             	add    $0x10,%esp
      3d:	85 c0                	test   %eax,%eax
      3f:	78 0f                	js     50 <main+0x50>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
      41:	83 c7 01             	add    $0x1,%edi
      44:	83 c3 04             	add    $0x4,%ebx
      47:	39 fe                	cmp    %edi,%esi
      49:	75 e5                	jne    30 <main+0x30>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
      4b:	e8 72 02 00 00       	call   2c2 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if(mkdir(argv[i]) < 0){
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      50:	50                   	push   %eax
      51:	ff 33                	pushl  (%ebx)
      53:	68 33 12 00 00       	push   $0x1233
      58:	6a 02                	push   $0x2
      5a:	e8 d1 03 00 00       	call   430 <printf>
      break;
      5f:	83 c4 10             	add    $0x10,%esp
      62:	eb e7                	jmp    4b <main+0x4b>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
      64:	52                   	push   %edx
      65:	52                   	push   %edx
      66:	68 1c 12 00 00       	push   $0x121c
      6b:	6a 02                	push   $0x2
      6d:	e8 be 03 00 00       	call   430 <printf>
    exit();
      72:	e8 4b 02 00 00       	call   2c2 <exit>
      77:	66 90                	xchg   %ax,%ax
      79:	66 90                	xchg   %ax,%ax
      7b:	66 90                	xchg   %ax,%ax
      7d:	66 90                	xchg   %ax,%ax
      7f:	90                   	nop

00000080 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      80:	55                   	push   %ebp
      81:	89 e5                	mov    %esp,%ebp
      83:	53                   	push   %ebx
      84:	8b 45 08             	mov    0x8(%ebp),%eax
      87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      8a:	89 c2                	mov    %eax,%edx
      8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      90:	83 c1 01             	add    $0x1,%ecx
      93:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
      97:	83 c2 01             	add    $0x1,%edx
      9a:	84 db                	test   %bl,%bl
      9c:	88 5a ff             	mov    %bl,-0x1(%edx)
      9f:	75 ef                	jne    90 <strcpy+0x10>
    ;
  return os;
}
      a1:	5b                   	pop    %ebx
      a2:	5d                   	pop    %ebp
      a3:	c3                   	ret    
      a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	56                   	push   %esi
      b4:	53                   	push   %ebx
      b5:	8b 55 08             	mov    0x8(%ebp),%edx
      b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
      bb:	0f b6 02             	movzbl (%edx),%eax
      be:	0f b6 19             	movzbl (%ecx),%ebx
      c1:	84 c0                	test   %al,%al
      c3:	75 1e                	jne    e3 <strcmp+0x33>
      c5:	eb 29                	jmp    f0 <strcmp+0x40>
      c7:	89 f6                	mov    %esi,%esi
      c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
      d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
      d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
      dd:	84 c0                	test   %al,%al
      df:	74 0f                	je     f0 <strcmp+0x40>
      e1:	89 f1                	mov    %esi,%ecx
      e3:	38 d8                	cmp    %bl,%al
      e5:	74 e9                	je     d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
      e7:	29 d8                	sub    %ebx,%eax
}
      e9:	5b                   	pop    %ebx
      ea:	5e                   	pop    %esi
      eb:	5d                   	pop    %ebp
      ec:	c3                   	ret    
      ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
      f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
      f2:	29 d8                	sub    %ebx,%eax
}
      f4:	5b                   	pop    %ebx
      f5:	5e                   	pop    %esi
      f6:	5d                   	pop    %ebp
      f7:	c3                   	ret    
      f8:	90                   	nop
      f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000100 <strlen>:

uint
strlen(char *s)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     106:	80 39 00             	cmpb   $0x0,(%ecx)
     109:	74 12                	je     11d <strlen+0x1d>
     10b:	31 d2                	xor    %edx,%edx
     10d:	8d 76 00             	lea    0x0(%esi),%esi
     110:	83 c2 01             	add    $0x1,%edx
     113:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     117:	89 d0                	mov    %edx,%eax
     119:	75 f5                	jne    110 <strlen+0x10>
    ;
  return n;
}
     11b:	5d                   	pop    %ebp
     11c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     11d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     11f:	5d                   	pop    %ebp
     120:	c3                   	ret    
     121:	eb 0d                	jmp    130 <memset>
     123:	90                   	nop
     124:	90                   	nop
     125:	90                   	nop
     126:	90                   	nop
     127:	90                   	nop
     128:	90                   	nop
     129:	90                   	nop
     12a:	90                   	nop
     12b:	90                   	nop
     12c:	90                   	nop
     12d:	90                   	nop
     12e:	90                   	nop
     12f:	90                   	nop

00000130 <memset>:

void*
memset(void *dst, int c, uint n)
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	57                   	push   %edi
     134:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     137:	8b 4d 10             	mov    0x10(%ebp),%ecx
     13a:	8b 45 0c             	mov    0xc(%ebp),%eax
     13d:	89 d7                	mov    %edx,%edi
     13f:	fc                   	cld    
     140:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     142:	89 d0                	mov    %edx,%eax
     144:	5f                   	pop    %edi
     145:	5d                   	pop    %ebp
     146:	c3                   	ret    
     147:	89 f6                	mov    %esi,%esi
     149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000150 <strchr>:

char*
strchr(const char *s, char c)
{
     150:	55                   	push   %ebp
     151:	89 e5                	mov    %esp,%ebp
     153:	53                   	push   %ebx
     154:	8b 45 08             	mov    0x8(%ebp),%eax
     157:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     15a:	0f b6 10             	movzbl (%eax),%edx
     15d:	84 d2                	test   %dl,%dl
     15f:	74 1d                	je     17e <strchr+0x2e>
    if(*s == c)
     161:	38 d3                	cmp    %dl,%bl
     163:	89 d9                	mov    %ebx,%ecx
     165:	75 0d                	jne    174 <strchr+0x24>
     167:	eb 17                	jmp    180 <strchr+0x30>
     169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     170:	38 ca                	cmp    %cl,%dl
     172:	74 0c                	je     180 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     174:	83 c0 01             	add    $0x1,%eax
     177:	0f b6 10             	movzbl (%eax),%edx
     17a:	84 d2                	test   %dl,%dl
     17c:	75 f2                	jne    170 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     17e:	31 c0                	xor    %eax,%eax
}
     180:	5b                   	pop    %ebx
     181:	5d                   	pop    %ebp
     182:	c3                   	ret    
     183:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <gets>:

char*
gets(char *buf, int max)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	57                   	push   %edi
     194:	56                   	push   %esi
     195:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     196:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     198:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     19b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     19e:	eb 29                	jmp    1c9 <gets+0x39>
    cc = read(0, &c, 1);
     1a0:	83 ec 04             	sub    $0x4,%esp
     1a3:	6a 01                	push   $0x1
     1a5:	57                   	push   %edi
     1a6:	6a 00                	push   $0x0
     1a8:	e8 2d 01 00 00       	call   2da <read>
    if(cc < 1)
     1ad:	83 c4 10             	add    $0x10,%esp
     1b0:	85 c0                	test   %eax,%eax
     1b2:	7e 1d                	jle    1d1 <gets+0x41>
      break;
    buf[i++] = c;
     1b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     1b8:	8b 55 08             	mov    0x8(%ebp),%edx
     1bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     1bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     1bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     1c3:	74 1b                	je     1e0 <gets+0x50>
     1c5:	3c 0d                	cmp    $0xd,%al
     1c7:	74 17                	je     1e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1c9:	8d 5e 01             	lea    0x1(%esi),%ebx
     1cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     1cf:	7c cf                	jl     1a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1d1:	8b 45 08             	mov    0x8(%ebp),%eax
     1d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1db:	5b                   	pop    %ebx
     1dc:	5e                   	pop    %esi
     1dd:	5f                   	pop    %edi
     1de:	5d                   	pop    %ebp
     1df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     1e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     1e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     1e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1ec:	5b                   	pop    %ebx
     1ed:	5e                   	pop    %esi
     1ee:	5f                   	pop    %edi
     1ef:	5d                   	pop    %ebp
     1f0:	c3                   	ret    
     1f1:	eb 0d                	jmp    200 <stat>
     1f3:	90                   	nop
     1f4:	90                   	nop
     1f5:	90                   	nop
     1f6:	90                   	nop
     1f7:	90                   	nop
     1f8:	90                   	nop
     1f9:	90                   	nop
     1fa:	90                   	nop
     1fb:	90                   	nop
     1fc:	90                   	nop
     1fd:	90                   	nop
     1fe:	90                   	nop
     1ff:	90                   	nop

00000200 <stat>:

int
stat(char *n, struct stat *st)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	56                   	push   %esi
     204:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     205:	83 ec 08             	sub    $0x8,%esp
     208:	6a 00                	push   $0x0
     20a:	ff 75 08             	pushl  0x8(%ebp)
     20d:	e8 f0 00 00 00       	call   302 <open>
  if(fd < 0)
     212:	83 c4 10             	add    $0x10,%esp
     215:	85 c0                	test   %eax,%eax
     217:	78 27                	js     240 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     219:	83 ec 08             	sub    $0x8,%esp
     21c:	ff 75 0c             	pushl  0xc(%ebp)
     21f:	89 c3                	mov    %eax,%ebx
     221:	50                   	push   %eax
     222:	e8 f3 00 00 00       	call   31a <fstat>
     227:	89 c6                	mov    %eax,%esi
  close(fd);
     229:	89 1c 24             	mov    %ebx,(%esp)
     22c:	e8 b9 00 00 00       	call   2ea <close>
  return r;
     231:	83 c4 10             	add    $0x10,%esp
     234:	89 f0                	mov    %esi,%eax
}
     236:	8d 65 f8             	lea    -0x8(%ebp),%esp
     239:	5b                   	pop    %ebx
     23a:	5e                   	pop    %esi
     23b:	5d                   	pop    %ebp
     23c:	c3                   	ret    
     23d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     240:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     245:	eb ef                	jmp    236 <stat+0x36>
     247:	89 f6                	mov    %esi,%esi
     249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	53                   	push   %ebx
     254:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     257:	0f be 11             	movsbl (%ecx),%edx
     25a:	8d 42 d0             	lea    -0x30(%edx),%eax
     25d:	3c 09                	cmp    $0x9,%al
     25f:	b8 00 00 00 00       	mov    $0x0,%eax
     264:	77 1f                	ja     285 <atoi+0x35>
     266:	8d 76 00             	lea    0x0(%esi),%esi
     269:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     270:	8d 04 80             	lea    (%eax,%eax,4),%eax
     273:	83 c1 01             	add    $0x1,%ecx
     276:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     27a:	0f be 11             	movsbl (%ecx),%edx
     27d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     280:	80 fb 09             	cmp    $0x9,%bl
     283:	76 eb                	jbe    270 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     285:	5b                   	pop    %ebx
     286:	5d                   	pop    %ebp
     287:	c3                   	ret    
     288:	90                   	nop
     289:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000290 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	56                   	push   %esi
     294:	53                   	push   %ebx
     295:	8b 5d 10             	mov    0x10(%ebp),%ebx
     298:	8b 45 08             	mov    0x8(%ebp),%eax
     29b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     29e:	85 db                	test   %ebx,%ebx
     2a0:	7e 14                	jle    2b6 <memmove+0x26>
     2a2:	31 d2                	xor    %edx,%edx
     2a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     2a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     2ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     2af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     2b2:	39 da                	cmp    %ebx,%edx
     2b4:	75 f2                	jne    2a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     2b6:	5b                   	pop    %ebx
     2b7:	5e                   	pop    %esi
     2b8:	5d                   	pop    %ebp
     2b9:	c3                   	ret    

000002ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     2ba:	b8 01 00 00 00       	mov    $0x1,%eax
     2bf:	cd 40                	int    $0x40
     2c1:	c3                   	ret    

000002c2 <exit>:
SYSCALL(exit)
     2c2:	b8 02 00 00 00       	mov    $0x2,%eax
     2c7:	cd 40                	int    $0x40
     2c9:	c3                   	ret    

000002ca <wait>:
SYSCALL(wait)
     2ca:	b8 03 00 00 00       	mov    $0x3,%eax
     2cf:	cd 40                	int    $0x40
     2d1:	c3                   	ret    

000002d2 <pipe>:
SYSCALL(pipe)
     2d2:	b8 04 00 00 00       	mov    $0x4,%eax
     2d7:	cd 40                	int    $0x40
     2d9:	c3                   	ret    

000002da <read>:
SYSCALL(read)
     2da:	b8 05 00 00 00       	mov    $0x5,%eax
     2df:	cd 40                	int    $0x40
     2e1:	c3                   	ret    

000002e2 <write>:
SYSCALL(write)
     2e2:	b8 10 00 00 00       	mov    $0x10,%eax
     2e7:	cd 40                	int    $0x40
     2e9:	c3                   	ret    

000002ea <close>:
SYSCALL(close)
     2ea:	b8 15 00 00 00       	mov    $0x15,%eax
     2ef:	cd 40                	int    $0x40
     2f1:	c3                   	ret    

000002f2 <kill>:
SYSCALL(kill)
     2f2:	b8 06 00 00 00       	mov    $0x6,%eax
     2f7:	cd 40                	int    $0x40
     2f9:	c3                   	ret    

000002fa <exec>:
SYSCALL(exec)
     2fa:	b8 07 00 00 00       	mov    $0x7,%eax
     2ff:	cd 40                	int    $0x40
     301:	c3                   	ret    

00000302 <open>:
SYSCALL(open)
     302:	b8 0f 00 00 00       	mov    $0xf,%eax
     307:	cd 40                	int    $0x40
     309:	c3                   	ret    

0000030a <mknod>:
SYSCALL(mknod)
     30a:	b8 11 00 00 00       	mov    $0x11,%eax
     30f:	cd 40                	int    $0x40
     311:	c3                   	ret    

00000312 <unlink>:
SYSCALL(unlink)
     312:	b8 12 00 00 00       	mov    $0x12,%eax
     317:	cd 40                	int    $0x40
     319:	c3                   	ret    

0000031a <fstat>:
SYSCALL(fstat)
     31a:	b8 08 00 00 00       	mov    $0x8,%eax
     31f:	cd 40                	int    $0x40
     321:	c3                   	ret    

00000322 <link>:
SYSCALL(link)
     322:	b8 13 00 00 00       	mov    $0x13,%eax
     327:	cd 40                	int    $0x40
     329:	c3                   	ret    

0000032a <mkdir>:
SYSCALL(mkdir)
     32a:	b8 14 00 00 00       	mov    $0x14,%eax
     32f:	cd 40                	int    $0x40
     331:	c3                   	ret    

00000332 <chdir>:
SYSCALL(chdir)
     332:	b8 09 00 00 00       	mov    $0x9,%eax
     337:	cd 40                	int    $0x40
     339:	c3                   	ret    

0000033a <dup>:
SYSCALL(dup)
     33a:	b8 0a 00 00 00       	mov    $0xa,%eax
     33f:	cd 40                	int    $0x40
     341:	c3                   	ret    

00000342 <getpid>:
SYSCALL(getpid)
     342:	b8 0b 00 00 00       	mov    $0xb,%eax
     347:	cd 40                	int    $0x40
     349:	c3                   	ret    

0000034a <sbrk>:
SYSCALL(sbrk)
     34a:	b8 0c 00 00 00       	mov    $0xc,%eax
     34f:	cd 40                	int    $0x40
     351:	c3                   	ret    

00000352 <sleep>:
SYSCALL(sleep)
     352:	b8 0d 00 00 00       	mov    $0xd,%eax
     357:	cd 40                	int    $0x40
     359:	c3                   	ret    

0000035a <uptime>:
SYSCALL(uptime)
     35a:	b8 0e 00 00 00       	mov    $0xe,%eax
     35f:	cd 40                	int    $0x40
     361:	c3                   	ret    

00000362 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     362:	b8 16 00 00 00       	mov    $0x16,%eax
     367:	cd 40                	int    $0x40
     369:	c3                   	ret    

0000036a <sigsend>:
SYSCALL(sigsend)
     36a:	b8 17 00 00 00       	mov    $0x17,%eax
     36f:	cd 40                	int    $0x40
     371:	c3                   	ret    

00000372 <sigreturn>:
SYSCALL(sigreturn)
     372:	b8 18 00 00 00       	mov    $0x18,%eax
     377:	cd 40                	int    $0x40
     379:	c3                   	ret    

0000037a <alarm>:
SYSCALL(alarm)
     37a:	b8 19 00 00 00       	mov    $0x19,%eax
     37f:	cd 40                	int    $0x40
     381:	c3                   	ret    
     382:	66 90                	xchg   %ax,%ax
     384:	66 90                	xchg   %ax,%ax
     386:	66 90                	xchg   %ax,%ax
     388:	66 90                	xchg   %ax,%ax
     38a:	66 90                	xchg   %ax,%ax
     38c:	66 90                	xchg   %ax,%ax
     38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	57                   	push   %edi
     394:	56                   	push   %esi
     395:	53                   	push   %ebx
     396:	89 c6                	mov    %eax,%esi
     398:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     39e:	85 db                	test   %ebx,%ebx
     3a0:	74 7e                	je     420 <printint+0x90>
     3a2:	89 d0                	mov    %edx,%eax
     3a4:	c1 e8 1f             	shr    $0x1f,%eax
     3a7:	84 c0                	test   %al,%al
     3a9:	74 75                	je     420 <printint+0x90>
    neg = 1;
    x = -xx;
     3ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     3ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     3b4:	f7 d8                	neg    %eax
     3b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     3b9:	31 ff                	xor    %edi,%edi
     3bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     3be:	89 ce                	mov    %ecx,%esi
     3c0:	eb 08                	jmp    3ca <printint+0x3a>
     3c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     3c8:	89 cf                	mov    %ecx,%edi
     3ca:	31 d2                	xor    %edx,%edx
     3cc:	8d 4f 01             	lea    0x1(%edi),%ecx
     3cf:	f7 f6                	div    %esi
     3d1:	0f b6 92 58 12 00 00 	movzbl 0x1258(%edx),%edx
  }while((x /= base) != 0);
     3d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     3da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     3dd:	75 e9                	jne    3c8 <printint+0x38>
  if(neg)
     3df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     3e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     3e5:	85 c0                	test   %eax,%eax
     3e7:	74 08                	je     3f1 <printint+0x61>
    buf[i++] = '-';
     3e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     3ee:	8d 4f 02             	lea    0x2(%edi),%ecx
     3f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     3f5:	8d 76 00             	lea    0x0(%esi),%esi
     3f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     3fb:	83 ec 04             	sub    $0x4,%esp
     3fe:	83 ef 01             	sub    $0x1,%edi
     401:	6a 01                	push   $0x1
     403:	53                   	push   %ebx
     404:	56                   	push   %esi
     405:	88 45 d7             	mov    %al,-0x29(%ebp)
     408:	e8 d5 fe ff ff       	call   2e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     40d:	83 c4 10             	add    $0x10,%esp
     410:	39 df                	cmp    %ebx,%edi
     412:	75 e4                	jne    3f8 <printint+0x68>
    putc(fd, buf[i]);
}
     414:	8d 65 f4             	lea    -0xc(%ebp),%esp
     417:	5b                   	pop    %ebx
     418:	5e                   	pop    %esi
     419:	5f                   	pop    %edi
     41a:	5d                   	pop    %ebp
     41b:	c3                   	ret    
     41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     420:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     422:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     429:	eb 8b                	jmp    3b6 <printint+0x26>
     42b:	90                   	nop
     42c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000430 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	57                   	push   %edi
     434:	56                   	push   %esi
     435:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     436:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     439:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     43c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     43f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     442:	89 45 d0             	mov    %eax,-0x30(%ebp)
     445:	0f b6 1e             	movzbl (%esi),%ebx
     448:	83 c6 01             	add    $0x1,%esi
     44b:	84 db                	test   %bl,%bl
     44d:	0f 84 b0 00 00 00    	je     503 <printf+0xd3>
     453:	31 d2                	xor    %edx,%edx
     455:	eb 39                	jmp    490 <printf+0x60>
     457:	89 f6                	mov    %esi,%esi
     459:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     460:	83 f8 25             	cmp    $0x25,%eax
     463:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     466:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     46b:	74 18                	je     485 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     46d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     470:	83 ec 04             	sub    $0x4,%esp
     473:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     476:	6a 01                	push   $0x1
     478:	50                   	push   %eax
     479:	57                   	push   %edi
     47a:	e8 63 fe ff ff       	call   2e2 <write>
     47f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     482:	83 c4 10             	add    $0x10,%esp
     485:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     488:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     48c:	84 db                	test   %bl,%bl
     48e:	74 73                	je     503 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     490:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     492:	0f be cb             	movsbl %bl,%ecx
     495:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     498:	74 c6                	je     460 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     49a:	83 fa 25             	cmp    $0x25,%edx
     49d:	75 e6                	jne    485 <printf+0x55>
      if(c == 'd'){
     49f:	83 f8 64             	cmp    $0x64,%eax
     4a2:	0f 84 f8 00 00 00    	je     5a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     4a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     4ae:	83 f9 70             	cmp    $0x70,%ecx
     4b1:	74 5d                	je     510 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     4b3:	83 f8 73             	cmp    $0x73,%eax
     4b6:	0f 84 84 00 00 00    	je     540 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     4bc:	83 f8 63             	cmp    $0x63,%eax
     4bf:	0f 84 ea 00 00 00    	je     5af <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     4c5:	83 f8 25             	cmp    $0x25,%eax
     4c8:	0f 84 c2 00 00 00    	je     590 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
     4d1:	83 ec 04             	sub    $0x4,%esp
     4d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     4d8:	6a 01                	push   $0x1
     4da:	50                   	push   %eax
     4db:	57                   	push   %edi
     4dc:	e8 01 fe ff ff       	call   2e2 <write>
     4e1:	83 c4 0c             	add    $0xc,%esp
     4e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     4e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     4ea:	6a 01                	push   $0x1
     4ec:	50                   	push   %eax
     4ed:	57                   	push   %edi
     4ee:	83 c6 01             	add    $0x1,%esi
     4f1:	e8 ec fd ff ff       	call   2e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     4fd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4ff:	84 db                	test   %bl,%bl
     501:	75 8d                	jne    490 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     503:	8d 65 f4             	lea    -0xc(%ebp),%esp
     506:	5b                   	pop    %ebx
     507:	5e                   	pop    %esi
     508:	5f                   	pop    %edi
     509:	5d                   	pop    %ebp
     50a:	c3                   	ret    
     50b:	90                   	nop
     50c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     510:	83 ec 0c             	sub    $0xc,%esp
     513:	b9 10 00 00 00       	mov    $0x10,%ecx
     518:	6a 00                	push   $0x0
     51a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     51d:	89 f8                	mov    %edi,%eax
     51f:	8b 13                	mov    (%ebx),%edx
     521:	e8 6a fe ff ff       	call   390 <printint>
        ap++;
     526:	89 d8                	mov    %ebx,%eax
     528:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     52b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     52d:	83 c0 04             	add    $0x4,%eax
     530:	89 45 d0             	mov    %eax,-0x30(%ebp)
     533:	e9 4d ff ff ff       	jmp    485 <printf+0x55>
     538:	90                   	nop
     539:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     540:	8b 45 d0             	mov    -0x30(%ebp),%eax
     543:	8b 18                	mov    (%eax),%ebx
        ap++;
     545:	83 c0 04             	add    $0x4,%eax
     548:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     54b:	b8 4f 12 00 00       	mov    $0x124f,%eax
     550:	85 db                	test   %ebx,%ebx
     552:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     555:	0f b6 03             	movzbl (%ebx),%eax
     558:	84 c0                	test   %al,%al
     55a:	74 23                	je     57f <printf+0x14f>
     55c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     560:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     563:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     566:	83 ec 04             	sub    $0x4,%esp
     569:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     56b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     56e:	50                   	push   %eax
     56f:	57                   	push   %edi
     570:	e8 6d fd ff ff       	call   2e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     575:	0f b6 03             	movzbl (%ebx),%eax
     578:	83 c4 10             	add    $0x10,%esp
     57b:	84 c0                	test   %al,%al
     57d:	75 e1                	jne    560 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     57f:	31 d2                	xor    %edx,%edx
     581:	e9 ff fe ff ff       	jmp    485 <printf+0x55>
     586:	8d 76 00             	lea    0x0(%esi),%esi
     589:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     590:	83 ec 04             	sub    $0x4,%esp
     593:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     596:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     599:	6a 01                	push   $0x1
     59b:	e9 4c ff ff ff       	jmp    4ec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     5a0:	83 ec 0c             	sub    $0xc,%esp
     5a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     5a8:	6a 01                	push   $0x1
     5aa:	e9 6b ff ff ff       	jmp    51a <printf+0xea>
     5af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5b2:	83 ec 04             	sub    $0x4,%esp
     5b5:	8b 03                	mov    (%ebx),%eax
     5b7:	6a 01                	push   $0x1
     5b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
     5bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     5bf:	50                   	push   %eax
     5c0:	57                   	push   %edi
     5c1:	e8 1c fd ff ff       	call   2e2 <write>
     5c6:	e9 5b ff ff ff       	jmp    526 <printf+0xf6>
     5cb:	66 90                	xchg   %ax,%ax
     5cd:	66 90                	xchg   %ax,%ax
     5cf:	90                   	nop

000005d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     5d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5d1:	a1 c0 19 00 00       	mov    0x19c0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     5d6:	89 e5                	mov    %esp,%ebp
     5d8:	57                   	push   %edi
     5d9:	56                   	push   %esi
     5da:	53                   	push   %ebx
     5db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5de:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     5e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5e3:	39 c8                	cmp    %ecx,%eax
     5e5:	73 19                	jae    600 <free+0x30>
     5e7:	89 f6                	mov    %esi,%esi
     5e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     5f0:	39 d1                	cmp    %edx,%ecx
     5f2:	72 1c                	jb     610 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5f4:	39 d0                	cmp    %edx,%eax
     5f6:	73 18                	jae    610 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     5f8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5fa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     5fc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     5fe:	72 f0                	jb     5f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     600:	39 d0                	cmp    %edx,%eax
     602:	72 f4                	jb     5f8 <free+0x28>
     604:	39 d1                	cmp    %edx,%ecx
     606:	73 f0                	jae    5f8 <free+0x28>
     608:	90                   	nop
     609:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     610:	8b 73 fc             	mov    -0x4(%ebx),%esi
     613:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     616:	39 d7                	cmp    %edx,%edi
     618:	74 19                	je     633 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     61a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     61d:	8b 50 04             	mov    0x4(%eax),%edx
     620:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     623:	39 f1                	cmp    %esi,%ecx
     625:	74 23                	je     64a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     627:	89 08                	mov    %ecx,(%eax)
  freep = p;
     629:	a3 c0 19 00 00       	mov    %eax,0x19c0
}
     62e:	5b                   	pop    %ebx
     62f:	5e                   	pop    %esi
     630:	5f                   	pop    %edi
     631:	5d                   	pop    %ebp
     632:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     633:	03 72 04             	add    0x4(%edx),%esi
     636:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     639:	8b 10                	mov    (%eax),%edx
     63b:	8b 12                	mov    (%edx),%edx
     63d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     640:	8b 50 04             	mov    0x4(%eax),%edx
     643:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     646:	39 f1                	cmp    %esi,%ecx
     648:	75 dd                	jne    627 <free+0x57>
    p->s.size += bp->s.size;
     64a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     64d:	a3 c0 19 00 00       	mov    %eax,0x19c0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     652:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     655:	8b 53 f8             	mov    -0x8(%ebx),%edx
     658:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     65a:	5b                   	pop    %ebx
     65b:	5e                   	pop    %esi
     65c:	5f                   	pop    %edi
     65d:	5d                   	pop    %ebp
     65e:	c3                   	ret    
     65f:	90                   	nop

00000660 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	57                   	push   %edi
     664:	56                   	push   %esi
     665:	53                   	push   %ebx
     666:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     669:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     66c:	8b 15 c0 19 00 00    	mov    0x19c0,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     672:	8d 78 07             	lea    0x7(%eax),%edi
     675:	c1 ef 03             	shr    $0x3,%edi
     678:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     67b:	85 d2                	test   %edx,%edx
     67d:	0f 84 a3 00 00 00    	je     726 <malloc+0xc6>
     683:	8b 02                	mov    (%edx),%eax
     685:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     688:	39 cf                	cmp    %ecx,%edi
     68a:	76 74                	jbe    700 <malloc+0xa0>
     68c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     692:	be 00 10 00 00       	mov    $0x1000,%esi
     697:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     69e:	0f 43 f7             	cmovae %edi,%esi
     6a1:	ba 00 80 00 00       	mov    $0x8000,%edx
     6a6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     6ac:	0f 46 da             	cmovbe %edx,%ebx
     6af:	eb 10                	jmp    6c1 <malloc+0x61>
     6b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     6b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     6ba:	8b 48 04             	mov    0x4(%eax),%ecx
     6bd:	39 cf                	cmp    %ecx,%edi
     6bf:	76 3f                	jbe    700 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     6c1:	39 05 c0 19 00 00    	cmp    %eax,0x19c0
     6c7:	89 c2                	mov    %eax,%edx
     6c9:	75 ed                	jne    6b8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     6cb:	83 ec 0c             	sub    $0xc,%esp
     6ce:	53                   	push   %ebx
     6cf:	e8 76 fc ff ff       	call   34a <sbrk>
  if(p == (char*)-1)
     6d4:	83 c4 10             	add    $0x10,%esp
     6d7:	83 f8 ff             	cmp    $0xffffffff,%eax
     6da:	74 1c                	je     6f8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     6dc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     6df:	83 ec 0c             	sub    $0xc,%esp
     6e2:	83 c0 08             	add    $0x8,%eax
     6e5:	50                   	push   %eax
     6e6:	e8 e5 fe ff ff       	call   5d0 <free>
  return freep;
     6eb:	8b 15 c0 19 00 00    	mov    0x19c0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     6f1:	83 c4 10             	add    $0x10,%esp
     6f4:	85 d2                	test   %edx,%edx
     6f6:	75 c0                	jne    6b8 <malloc+0x58>
        return 0;
     6f8:	31 c0                	xor    %eax,%eax
     6fa:	eb 1c                	jmp    718 <malloc+0xb8>
     6fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     700:	39 cf                	cmp    %ecx,%edi
     702:	74 1c                	je     720 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     704:	29 f9                	sub    %edi,%ecx
     706:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     709:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     70c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     70f:	89 15 c0 19 00 00    	mov    %edx,0x19c0
      return (void*)(p + 1);
     715:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     718:	8d 65 f4             	lea    -0xc(%ebp),%esp
     71b:	5b                   	pop    %ebx
     71c:	5e                   	pop    %esi
     71d:	5f                   	pop    %edi
     71e:	5d                   	pop    %ebp
     71f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     720:	8b 08                	mov    (%eax),%ecx
     722:	89 0a                	mov    %ecx,(%edx)
     724:	eb e9                	jmp    70f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     726:	c7 05 c0 19 00 00 c4 	movl   $0x19c4,0x19c0
     72d:	19 00 00 
     730:	c7 05 c4 19 00 00 c4 	movl   $0x19c4,0x19c4
     737:	19 00 00 
    base.s.size = 0;
     73a:	b8 c4 19 00 00       	mov    $0x19c4,%eax
     73f:	c7 05 c8 19 00 00 00 	movl   $0x0,0x19c8
     746:	00 00 00 
     749:	e9 3e ff ff ff       	jmp    68c <malloc+0x2c>
     74e:	66 90                	xchg   %ax,%ax

00000750 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     750:	55                   	push   %ebp
     751:	89 e5                	mov    %esp,%ebp
     753:	56                   	push   %esi
     754:	53                   	push   %ebx
     755:	8b 75 0c             	mov    0xc(%ebp),%esi
     758:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     75b:	83 ec 08             	sub    $0x8,%esp
     75e:	68 6c 12 00 00       	push   $0x126c
     763:	6a 01                	push   $0x1
     765:	e8 c6 fc ff ff       	call   430 <printf>
  alarm(UTHREAD_QUANTA);
     76a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     771:	e8 04 fc ff ff       	call   37a <alarm>
  start_func(arg);
     776:	89 75 08             	mov    %esi,0x8(%ebp)
     779:	83 c4 10             	add    $0x10,%esp
}
     77c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     77f:	89 d8                	mov    %ebx,%eax
}
     781:	5b                   	pop    %ebx
     782:	5e                   	pop    %esi
     783:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     784:	ff e0                	jmp    *%eax
     786:	8d 76 00             	lea    0x0(%esi),%esi
     789:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000790 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     790:	55                   	push   %ebp
     791:	89 e5                	mov    %esp,%ebp
     793:	53                   	push   %ebx
     794:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     797:	6a 00                	push   $0x0
     799:	e8 dc fb ff ff       	call   37a <alarm>
  printf(1,"exiting...\n");
     79e:	5a                   	pop    %edx
     79f:	59                   	pop    %ecx
     7a0:	68 dc 13 00 00       	push   $0x13dc
     7a5:	6a 01                	push   $0x1
     7a7:	e8 84 fc ff ff       	call   430 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     7ac:	a1 08 a9 00 00       	mov    0xa908,%eax
     7b1:	83 c4 10             	add    $0x10,%esp
     7b4:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7b7:	8b 1c 95 e0 19 00 00 	mov    0x19e0(,%edx,4),%ebx
     7be:	85 db                	test   %ebx,%ebx
     7c0:	75 0a                	jne    7cc <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     7c2:	c7 05 e8 19 00 00 00 	movl   $0x0,0x19e8
     7c9:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     7cc:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     7cf:	83 ec 0c             	sub    $0xc,%esp
     7d2:	ff 34 85 e4 19 00 00 	pushl  0x19e4(,%eax,4)
     7d9:	e8 f2 fd ff ff       	call   5d0 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     7de:	a1 08 a9 00 00       	mov    0xa908,%eax
     7e3:	83 c4 10             	add    $0x10,%esp
     7e6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     7e9:	b8 e8 19 00 00       	mov    $0x19e8,%eax
     7ee:	c1 e2 02             	shl    $0x2,%edx
     7f1:	c7 82 e8 19 00 00 00 	movl   $0x0,0x19e8(%edx)
     7f8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     7fb:	c7 82 e0 19 00 00 ff 	movl   $0xffffffff,0x19e0(%edx)
     802:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     805:	c7 82 ec 19 00 00 00 	movl   $0x0,0x19ec(%edx)
     80c:	00 00 00 
  threads[index_currently_running].esp = 0;
     80f:	c7 82 f0 19 00 00 00 	movl   $0x0,0x19f0(%edx)
     816:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     819:	c7 82 fc 19 00 00 00 	movl   $0x0,0x19fc(%edx)
     820:	00 00 00 
  threads[index_currently_running].join = -1;
     823:	c7 82 00 1a 00 00 ff 	movl   $0xffffffff,0x1a00(%edx)
     82a:	ff ff ff 
     82d:	eb 0b                	jmp    83a <uthread_exit+0xaa>
     82f:	90                   	nop
     830:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     833:	3d e8 22 00 00       	cmp    $0x22e8,%eax
     838:	74 15                	je     84f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     83a:	83 38 04             	cmpl   $0x4,(%eax)
     83d:	75 f1                	jne    830 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     83f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     845:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     848:	3d e8 22 00 00       	cmp    $0x22e8,%eax
     84d:	75 eb                	jne    83a <uthread_exit+0xaa>
     84f:	bb 0c 1a 00 00       	mov    $0x1a0c,%ebx
     854:	eb 15                	jmp    86b <uthread_exit+0xdb>
     856:	8d 76 00             	lea    0x0(%esi),%esi
     859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     860:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     863:	81 fb e8 22 00 00    	cmp    $0x22e8,%ebx
     869:	74 24                	je     88f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     86b:	8b 03                	mov    (%ebx),%eax
     86d:	85 c0                	test   %eax,%eax
     86f:	74 ef                	je     860 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     871:	e8 cc fa ff ff       	call   342 <getpid>
     876:	83 ec 08             	sub    $0x8,%esp
     879:	83 c3 24             	add    $0x24,%ebx
     87c:	6a 0e                	push   $0xe
     87e:	50                   	push   %eax
     87f:	e8 e6 fa ff ff       	call   36a <sigsend>
     884:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     887:	81 fb e8 22 00 00    	cmp    $0x22e8,%ebx
     88d:	75 dc                	jne    86b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     88f:	e8 2e fa ff ff       	call   2c2 <exit>
     894:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     89a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000008a0 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     8a0:	55                   	push   %ebp
     8a1:	ba 08 24 00 00       	mov    $0x2408,%edx
     8a6:	89 e5                	mov    %esp,%ebp
     8a8:	90                   	nop
     8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     8b0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     8b6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     8bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     8c0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     8c6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     8c9:	39 d0                	cmp    %edx,%eax
     8cb:	75 f3                	jne    8c0 <init_bsem+0x20>
     8cd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     8d3:	81 fa 08 aa 00 00    	cmp    $0xaa08,%edx
     8d9:	75 d5                	jne    8b0 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     8db:	c7 05 cc 19 00 00 01 	movl   $0x1,0x19cc
     8e2:	00 00 00 
}
     8e5:	5d                   	pop    %ebp
     8e6:	c3                   	ret    
     8e7:	89 f6                	mov    %esi,%esi
     8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008f0 <bsem_alloc>:

int bsem_alloc() {
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	53                   	push   %ebx
     8f4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     8f7:	6a 00                	push   $0x0
     8f9:	e8 7c fa ff ff       	call   37a <alarm>
  int i;
  if(first_run_bsem == 0)
     8fe:	a1 cc 19 00 00       	mov    0x19cc,%eax
     903:	83 c4 10             	add    $0x10,%esp
     906:	85 c0                	test   %eax,%eax
     908:	75 3b                	jne    945 <bsem_alloc+0x55>
     90a:	ba 08 24 00 00       	mov    $0x2408,%edx
     90f:	90                   	nop
     910:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     916:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     920:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     926:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     929:	39 d0                	cmp    %edx,%eax
     92b:	75 f3                	jne    920 <bsem_alloc+0x30>
     92d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     933:	81 fa 08 aa 00 00    	cmp    $0xaa08,%edx
     939:	75 d5                	jne    910 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     93b:	c7 05 cc 19 00 00 01 	movl   $0x1,0x19cc
     942:	00 00 00 
     945:	ba 08 24 00 00       	mov    $0x2408,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     94a:	31 c0                	xor    %eax,%eax
     94c:	eb 10                	jmp    95e <bsem_alloc+0x6e>
     94e:	83 c0 01             	add    $0x1,%eax
     951:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     957:	3d 80 00 00 00       	cmp    $0x80,%eax
     95c:	74 4f                	je     9ad <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     95e:	83 3a 01             	cmpl   $0x1,(%edx)
     961:	75 eb                	jne    94e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     963:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     969:	8b 15 bc 19 00 00    	mov    0x19bc,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     96f:	83 ec 0c             	sub    $0xc,%esp
     972:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     974:	8d 98 00 23 00 00    	lea    0x2300(%eax),%ebx
     97a:	89 90 04 23 00 00    	mov    %edx,0x2304(%eax)
    binSemCounter++;
     980:	83 c2 01             	add    $0x1,%edx
     983:	89 15 bc 19 00 00    	mov    %edx,0x19bc
    binSemaphore[i].lock = 1; // not locked
     989:	c7 80 00 23 00 00 01 	movl   $0x1,0x2300(%eax)
     990:	00 00 00 
    binSemaphore[i].state = USED;
     993:	c7 80 08 24 00 00 00 	movl   $0x0,0x2408(%eax)
     99a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     99d:	e8 d8 f9 ff ff       	call   37a <alarm>
    return binSemaphore[i].id;
     9a2:	8b 43 04             	mov    0x4(%ebx),%eax
     9a5:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     9a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9ab:	c9                   	leave  
     9ac:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     9ad:	83 ec 08             	sub    $0x8,%esp
     9b0:	68 8c 12 00 00       	push   $0x128c
     9b5:	6a 01                	push   $0x1
     9b7:	e8 74 fa ff ff       	call   430 <printf>
    alarm(UTHREAD_QUANTA);
     9bc:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     9c3:	e8 b2 f9 ff ff       	call   37a <alarm>
    return -1;
     9c8:	83 c4 10             	add    $0x10,%esp
     9cb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     9d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9d3:	c9                   	leave  
     9d4:	c3                   	ret    
     9d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     9d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009e0 <bsem_free>:

void bsem_free(int id) {
     9e0:	55                   	push   %ebp
     9e1:	89 e5                	mov    %esp,%ebp
     9e3:	53                   	push   %ebx
     9e4:	83 ec 10             	sub    $0x10,%esp
     9e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     9ea:	6a 00                	push   $0x0
     9ec:	e8 89 f9 ff ff       	call   37a <alarm>
     9f1:	ba 04 23 00 00       	mov    $0x2304,%edx
     9f6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     9f9:	31 c0                	xor    %eax,%eax
     9fb:	eb 13                	jmp    a10 <bsem_free+0x30>
     9fd:	8d 76 00             	lea    0x0(%esi),%esi
     a00:	83 c0 01             	add    $0x1,%eax
     a03:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     a09:	3d 80 00 00 00       	cmp    $0x80,%eax
     a0e:	74 38                	je     a48 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     a10:	39 1a                	cmp    %ebx,(%edx)
     a12:	75 ec                	jne    a00 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     a14:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     a1a:	05 00 23 00 00       	add    $0x2300,%eax
     a1f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     a26:	74 0a                	je     a32 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     a28:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     a2f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a32:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a3c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a3d:	e9 38 f9 ff ff       	jmp    37a <alarm>
     a42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     a48:	83 ec 04             	sub    $0x4,%esp
     a4b:	53                   	push   %ebx
     a4c:	68 e8 13 00 00       	push   $0x13e8
     a51:	6a 01                	push   $0x1
     a53:	e8 d8 f9 ff ff       	call   430 <printf>
     a58:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a5b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     a62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a65:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     a66:	e9 0f f9 ff ff       	jmp    37a <alarm>
     a6b:	90                   	nop
     a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	53                   	push   %ebx
     a74:	83 ec 10             	sub    $0x10,%esp
     a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a7a:	6a 00                	push   $0x0
     a7c:	e8 f9 f8 ff ff       	call   37a <alarm>
     a81:	b8 04 23 00 00       	mov    $0x2304,%eax
     a86:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a89:	31 d2                	xor    %edx,%edx
     a8b:	eb 17                	jmp    aa4 <bsem_down+0x34>
     a8d:	8d 76 00             	lea    0x0(%esi),%esi
     a90:	83 c2 01             	add    $0x1,%edx
     a93:	05 0c 01 00 00       	add    $0x10c,%eax
     a98:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     a9e:	0f 84 8c 00 00 00    	je     b30 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     aa4:	39 18                	cmp    %ebx,(%eax)
     aa6:	75 e8                	jne    a90 <bsem_down+0x20>
     aa8:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     aae:	85 c9                	test   %ecx,%ecx
     ab0:	75 de                	jne    a90 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     ab2:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     ab8:	31 c0                	xor    %eax,%eax
     aba:	83 b9 00 23 00 00 01 	cmpl   $0x1,0x2300(%ecx)
     ac1:	75 15                	jne    ad8 <bsem_down+0x68>
     ac3:	e9 93 00 00 00       	jmp    b5b <bsem_down+0xeb>
     ac8:	90                   	nop
     ac9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     ad0:	83 c0 01             	add    $0x1,%eax
     ad3:	83 f8 40             	cmp    $0x40,%eax
     ad6:	74 7b                	je     b53 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     ad8:	83 bc 81 08 23 00 00 	cmpl   $0xffffffff,0x2308(%ecx,%eax,4)
     adf:	ff 
     ae0:	75 ee                	jne    ad0 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     ae2:	8b 0d 08 a9 00 00    	mov    0xa908,%ecx
     ae8:	6b d2 43             	imul   $0x43,%edx,%edx
     aeb:	01 c2                	add    %eax,%edx
     aed:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     af0:	8b 04 85 e0 19 00 00 	mov    0x19e0(,%eax,4),%eax
     af7:	89 04 95 08 23 00 00 	mov    %eax,0x2308(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     afe:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     b01:	c7 04 85 e8 19 00 00 	movl   $0x4,0x19e8(,%eax,4)
     b08:	04 00 00 00 

	 sigsend(getpid(),14);
     b0c:	e8 31 f8 ff ff       	call   342 <getpid>
     b11:	83 ec 08             	sub    $0x8,%esp
     b14:	6a 0e                	push   $0xe
     b16:	50                   	push   %eax
     b17:	e8 4e f8 ff ff       	call   36a <sigsend>
     b1c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b1f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b29:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b2a:	e9 4b f8 ff ff       	jmp    37a <alarm>
     b2f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     b30:	83 ec 04             	sub    $0x4,%esp
     b33:	53                   	push   %ebx
     b34:	68 ac 12 00 00       	push   $0x12ac
     b39:	6a 01                	push   $0x1
     b3b:	e8 f0 f8 ff ff       	call   430 <printf>
     b40:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     b43:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b4a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b4d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b4e:	e9 27 f8 ff ff       	jmp    37a <alarm>
     b53:	8b 0d 08 a9 00 00    	mov    0xa908,%ecx
     b59:	eb a3                	jmp    afe <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     b5b:	c7 81 00 23 00 00 00 	movl   $0x0,0x2300(%ecx)
     b62:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b65:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b6f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b70:	e9 05 f8 ff ff       	jmp    37a <alarm>
     b75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     b79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b80 <bsem_up>:
}

void bsem_up(int id) {
     b80:	55                   	push   %ebp
     b81:	89 e5                	mov    %esp,%ebp
     b83:	57                   	push   %edi
     b84:	56                   	push   %esi
     b85:	53                   	push   %ebx
     b86:	83 ec 28             	sub    $0x28,%esp
     b89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b8c:	6a 00                	push   $0x0
     b8e:	e8 e7 f7 ff ff       	call   37a <alarm>
     b93:	ba 04 23 00 00       	mov    $0x2304,%edx
     b98:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b9b:	31 c0                	xor    %eax,%eax
     b9d:	eb 15                	jmp    bb4 <bsem_up+0x34>
     b9f:	90                   	nop
     ba0:	83 c0 01             	add    $0x1,%eax
     ba3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     ba9:	3d 80 00 00 00       	cmp    $0x80,%eax
     bae:	0f 84 ac 00 00 00    	je     c60 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     bb4:	39 1a                	cmp    %ebx,(%edx)
     bb6:	75 e8                	jne    ba0 <bsem_up+0x20>
     bb8:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     bbe:	85 c9                	test   %ecx,%ecx
     bc0:	75 de                	jne    ba0 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     bc2:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     bc8:	8b 97 00 23 00 00    	mov    0x2300(%edi),%edx
     bce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     bd1:	85 d2                	test   %edx,%edx
     bd3:	0f 85 9c 00 00 00    	jne    c75 <bsem_up+0xf5>
     bd9:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     bdb:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     bde:	8b b4 be 08 23 00 00 	mov    0x2308(%esi,%edi,4),%esi
     be5:	83 fe ff             	cmp    $0xffffffff,%esi
     be8:	74 56                	je     c40 <bsem_up+0xc0>
     bea:	b9 e0 19 00 00       	mov    $0x19e0,%ecx
     bef:	31 d2                	xor    %edx,%edx
     bf1:	eb 10                	jmp    c03 <bsem_up+0x83>
     bf3:	90                   	nop
     bf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     bf8:	83 c2 01             	add    $0x1,%edx
     bfb:	83 c1 24             	add    $0x24,%ecx
     bfe:	83 fa 40             	cmp    $0x40,%edx
     c01:	74 3d                	je     c40 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     c03:	8b 19                	mov    (%ecx),%ebx
     c05:	39 de                	cmp    %ebx,%esi
     c07:	75 ef                	jne    bf8 <bsem_up+0x78>
     c09:	83 fb ff             	cmp    $0xffffffff,%ebx
     c0c:	74 ea                	je     bf8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     c0e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     c11:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     c14:	c7 04 95 e8 19 00 00 	movl   $0x2,0x19e8(,%edx,4)
     c1b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     c1f:	01 c7                	add    %eax,%edi
     c21:	c7 04 bd 08 23 00 00 	movl   $0xffffffff,0x2308(,%edi,4)
     c28:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c2c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     c33:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c36:	5b                   	pop    %ebx
     c37:	5e                   	pop    %esi
     c38:	5f                   	pop    %edi
     c39:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c3a:	e9 3b f7 ff ff       	jmp    37a <alarm>
     c3f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     c40:	83 c7 01             	add    $0x1,%edi
     c43:	83 ff 40             	cmp    $0x40,%edi
     c46:	75 93                	jne    bdb <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     c48:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c4e:	c7 80 00 23 00 00 01 	movl   $0x1,0x2300(%eax)
     c55:	00 00 00 
     c58:	eb d2                	jmp    c2c <bsem_up+0xac>
     c5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     c60:	83 ec 04             	sub    $0x4,%esp
     c63:	53                   	push   %ebx
     c64:	68 14 13 00 00       	push   $0x1314
     c69:	6a 01                	push   $0x1
     c6b:	e8 c0 f7 ff ff       	call   430 <printf>
     c70:	83 c4 10             	add    $0x10,%esp
     c73:	eb b7                	jmp    c2c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     c75:	83 ec 08             	sub    $0x8,%esp
     c78:	68 f0 12 00 00       	push   $0x12f0
     c7d:	6a 01                	push   $0x1
     c7f:	e8 ac f7 ff ff       	call   430 <printf>
     c84:	83 c4 10             	add    $0x10,%esp
     c87:	eb a3                	jmp    c2c <bsem_up+0xac>
     c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c90 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     c96:	68 58 13 00 00       	push   $0x1358
     c9b:	6a 01                	push   $0x1
     c9d:	e8 8e f7 ff ff       	call   430 <printf>
     ca2:	b8 e0 19 00 00       	mov    $0x19e0,%eax
     ca7:	83 c4 10             	add    $0x10,%esp
     caa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     cb0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     cb6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     cbd:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     cc0:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     cc7:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     cce:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     cd5:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     cdc:	3d e0 22 00 00       	cmp    $0x22e0,%eax
     ce1:	75 cd                	jne    cb0 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     ce3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     ce6:	c7 05 e0 19 00 00 00 	movl   $0x0,0x19e0
     ced:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     cf0:	c7 05 e8 19 00 00 03 	movl   $0x3,0x19e8
     cf7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     cfa:	68 90 0e 00 00       	push   $0xe90
     cff:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     d01:	c7 05 e4 19 00 00 00 	movl   $0x0,0x19e4
     d08:	00 00 00 

  id_number_thread = 1;
     d0b:	c7 05 04 a9 00 00 01 	movl   $0x1,0xa904
     d12:	00 00 00 
  index_currently_running = 0;
     d15:	c7 05 08 a9 00 00 00 	movl   $0x0,0xa908
     d1c:	00 00 00 
  currently_running = 0;
     d1f:	c7 05 e0 22 00 00 00 	movl   $0x0,0x22e0
     d26:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d29:	e8 34 f6 ff ff       	call   362 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     d2e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     d35:	e8 40 f6 ff ff       	call   37a <alarm>
  return 0;
}
     d3a:	31 c0                	xor    %eax,%eax
     d3c:	c9                   	leave  
     d3d:	c3                   	ret    
     d3e:	66 90                	xchg   %ax,%ax

00000d40 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	56                   	push   %esi
     d44:	53                   	push   %ebx
  alarm(0);
     d45:	83 ec 0c             	sub    $0xc,%esp
     d48:	6a 00                	push   $0x0
     d4a:	e8 2b f6 ff ff       	call   37a <alarm>
  printf(1, "------ creating a new thread ------\n");
     d4f:	5b                   	pop    %ebx
     d50:	5e                   	pop    %esi
     d51:	68 84 13 00 00       	push   $0x1384
     d56:	6a 01                	push   $0x1
     d58:	e8 d3 f6 ff ff       	call   430 <printf>
     d5d:	ba e8 19 00 00       	mov    $0x19e8,%edx
     d62:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     d65:	31 c0                	xor    %eax,%eax
     d67:	eb 12                	jmp    d7b <uthread_create+0x3b>
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d70:	83 c0 01             	add    $0x1,%eax
     d73:	83 c2 24             	add    $0x24,%edx
     d76:	83 f8 40             	cmp    $0x40,%eax
     d79:	74 7d                	je     df8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     d7b:	8b 0a                	mov    (%edx),%ecx
     d7d:	85 c9                	test   %ecx,%ecx
     d7f:	75 ef                	jne    d70 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d81:	8b 15 04 a9 00 00    	mov    0xa904,%edx
     d87:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     d8a:	83 ec 0c             	sub    $0xc,%esp
     d8d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     d92:	c1 e3 02             	shl    $0x2,%ebx
     d95:	89 93 e0 19 00 00    	mov    %edx,0x19e0(%ebx)
  id_number_thread++;
     d9b:	83 c2 01             	add    $0x1,%edx
     d9e:	89 15 04 a9 00 00    	mov    %edx,0xa904

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     da4:	e8 b7 f8 ff ff       	call   660 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     da9:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     dac:	c7 80 f4 0f 00 00 90 	movl   $0x790,0xff4(%eax)
     db3:	07 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     db6:	89 83 e4 19 00 00    	mov    %eax,0x19e4(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     dbc:	c7 83 e8 19 00 00 02 	movl   $0x2,0x19e8(%ebx)
     dc3:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     dc6:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     dcc:	8b 55 0c             	mov    0xc(%ebp),%edx
     dcf:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     dd5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     ddc:	e8 99 f5 ff ff       	call   37a <alarm>
  return   threads[free_thread].thread_id;
     de1:	8b 83 e0 19 00 00    	mov    0x19e0(%ebx),%eax
     de7:	83 c4 10             	add    $0x10,%esp
}
     dea:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ded:	5b                   	pop    %ebx
     dee:	5e                   	pop    %esi
     def:	5d                   	pop    %ebp
     df0:	c3                   	ret    
     df1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     df8:	83 ec 08             	sub    $0x8,%esp
     dfb:	68 fa 13 00 00       	push   $0x13fa
     e00:	6a 01                	push   $0x1
     e02:	e8 29 f6 ff ff       	call   430 <printf>
    alarm(UTHREAD_QUANTA);
     e07:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e0e:	e8 67 f5 ff ff       	call   37a <alarm>
    return -1;
     e13:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e16:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     e19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e1e:	5b                   	pop    %ebx
     e1f:	5e                   	pop    %esi
     e20:	5d                   	pop    %ebp
     e21:	c3                   	ret    
     e22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e30 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     e30:	55                   	push   %ebp
     e31:	89 e5                	mov    %esp,%ebp
     e33:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     e36:	85 c0                	test   %eax,%eax
     e38:	74 14                	je     e4e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     e3a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e3d:	89 e2                	mov    %esp,%edx
     e3f:	8d 04 85 e0 19 00 00 	lea    0x19e0(,%eax,4),%eax
     e46:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     e49:	89 ea                	mov    %ebp,%edx
     e4b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e4e:	a1 08 a9 00 00       	mov    0xa908,%eax
     e53:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     e56:	8d 04 85 e0 19 00 00 	lea    0x19e0(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e5d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     e60:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     e67:	85 d2                	test   %edx,%edx
     e69:	74 0d                	je     e78 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     e6b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     e6d:	8b 40 0c             	mov    0xc(%eax),%eax
     e70:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     e72:	5d                   	pop    %ebp
     e73:	c3                   	ret    
     e74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e78:	8b 40 04             	mov    0x4(%eax),%eax
     e7b:	05 f4 0f 00 00       	add    $0xff4,%eax
     e80:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     e82:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     e84:	b8 50 07 00 00       	mov    $0x750,%eax
     e89:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     e8b:	5d                   	pop    %ebp
     e8c:	c3                   	ret    
     e8d:	8d 76 00             	lea    0x0(%esi),%esi

00000e90 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	56                   	push   %esi
     e94:	53                   	push   %ebx
     e95:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     e98:	83 ec 0c             	sub    $0xc,%esp
     e9b:	6a 00                	push   $0x0
     e9d:	e8 d8 f4 ff ff       	call   37a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     ea2:	a1 08 a9 00 00       	mov    0xa908,%eax
     ea7:	83 c4 10             	add    $0x10,%esp
     eaa:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ead:	8d 14 95 e0 19 00 00 	lea    0x19e0(,%edx,4),%edx
     eb4:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     eb8:	75 0b                	jne    ec5 <uthread_schedule+0x35>
     eba:	85 c0                	test   %eax,%eax
     ebc:	74 07                	je     ec5 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     ebe:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     ec5:	bb e8 19 00 00       	mov    $0x19e8,%ebx
     eca:	eb 0f                	jmp    edb <uthread_schedule+0x4b>
     ecc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ed0:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     ed3:	81 fb e8 22 00 00    	cmp    $0x22e8,%ebx
     ed9:	74 55                	je     f30 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     edb:	83 3b 01             	cmpl   $0x1,(%ebx)
     ede:	75 f0                	jne    ed0 <uthread_schedule+0x40>
     ee0:	8b 73 14             	mov    0x14(%ebx),%esi
     ee3:	85 f6                	test   %esi,%esi
     ee5:	0f 85 a5 00 00 00    	jne    f90 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     eeb:	8b 43 18             	mov    0x18(%ebx),%eax
     eee:	83 f8 ff             	cmp    $0xffffffff,%eax
     ef1:	74 dd                	je     ed0 <uthread_schedule+0x40>
     ef3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ef6:	8b 14 95 e8 19 00 00 	mov    0x19e8(,%edx,4),%edx
     efd:	85 d2                	test   %edx,%edx
     eff:	75 cf                	jne    ed0 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     f01:	50                   	push   %eax
     f02:	ff 73 f8             	pushl  -0x8(%ebx)
     f05:	83 c3 24             	add    $0x24,%ebx
     f08:	68 ac 13 00 00       	push   $0x13ac
     f0d:	6a 01                	push   $0x1
     f0f:	e8 1c f5 ff ff       	call   430 <printf>
      threads[i].join = -1;
     f14:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     f1b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     f22:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f25:	81 fb e8 22 00 00    	cmp    $0x22e8,%ebx
     f2b:	75 ae                	jne    edb <uthread_schedule+0x4b>
     f2d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     f30:	8b 15 08 a9 00 00    	mov    0xa908,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     f36:	b9 40 00 00 00       	mov    $0x40,%ecx
     f3b:	8d 42 01             	lea    0x1(%edx),%eax
     f3e:	eb 08                	jmp    f48 <uthread_schedule+0xb8>
     f40:	83 c0 01             	add    $0x1,%eax
     f43:	83 e9 01             	sub    $0x1,%ecx
     f46:	74 78                	je     fc0 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     f48:	89 c3                	mov    %eax,%ebx
     f4a:	c1 fb 1f             	sar    $0x1f,%ebx
     f4d:	c1 eb 1a             	shr    $0x1a,%ebx
     f50:	01 d8                	add    %ebx,%eax
     f52:	83 e0 3f             	and    $0x3f,%eax
     f55:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     f57:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     f5a:	83 3c 9d e8 19 00 00 	cmpl   $0x2,0x19e8(,%ebx,4)
     f61:	02 
     f62:	75 dc                	jne    f40 <uthread_schedule+0xb0>
     f64:	39 c2                	cmp    %eax,%edx
     f66:	74 d8                	je     f40 <uthread_schedule+0xb0>
      index_currently_running = i;
     f68:	a3 08 a9 00 00       	mov    %eax,0xa908
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     f6d:	83 ec 08             	sub    $0x8,%esp
     f70:	50                   	push   %eax
     f71:	52                   	push   %edx
     f72:	e8 b9 fe ff ff       	call   e30 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     f77:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f7e:	e8 f7 f3 ff ff       	call   37a <alarm>
}
     f83:	8d 65 f8             	lea    -0x8(%ebp),%esp
     f86:	5b                   	pop    %ebx
     f87:	5e                   	pop    %esi
     f88:	5d                   	pop    %ebp
     f89:	c3                   	ret    
     f8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f90:	e8 c5 f3 ff ff       	call   35a <uptime>
     f95:	39 c6                	cmp    %eax,%esi
     f97:	7f 17                	jg     fb0 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
     f99:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
     f9f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
     fa6:	e9 25 ff ff ff       	jmp    ed0 <uthread_schedule+0x40>
     fab:	90                   	nop
     fac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     fb0:	83 3b 01             	cmpl   $0x1,(%ebx)
     fb3:	0f 84 32 ff ff ff    	je     eeb <uthread_schedule+0x5b>
     fb9:	e9 12 ff ff ff       	jmp    ed0 <uthread_schedule+0x40>
     fbe:	66 90                	xchg   %ax,%ax
     fc0:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
     fc3:	83 3c 85 e8 19 00 00 	cmpl   $0x2,0x19e8(,%eax,4)
     fca:	02 
     fcb:	0f 85 c7 fe ff ff    	jne    e98 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     fd1:	89 d0                	mov    %edx,%eax
     fd3:	eb 98                	jmp    f6d <uthread_schedule+0xdd>
     fd5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fd9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000fe0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fe0:	a1 08 a9 00 00       	mov    0xa908,%eax
  exit();
}

int
uthread_self()
{
     fe5:	55                   	push   %ebp
     fe6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
     fe8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
     feb:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
     fec:	8b 04 85 e0 19 00 00 	mov    0x19e0(,%eax,4),%eax
}
     ff3:	c3                   	ret    
     ff4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ffa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001000 <uthread_join>:

int
uthread_join(int tid)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	56                   	push   %esi
    1004:	53                   	push   %ebx
    1005:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1008:	39 35 04 a9 00 00    	cmp    %esi,0xa904
    100e:	0f 8c ab 00 00 00    	jl     10bf <uthread_join+0xbf>
    1014:	89 f0                	mov    %esi,%eax
    1016:	c1 e8 1f             	shr    $0x1f,%eax
    1019:	84 c0                	test   %al,%al
    101b:	0f 85 9e 00 00 00    	jne    10bf <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1021:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1024:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1026:	6a 00                	push   $0x0
    1028:	e8 4d f3 ff ff       	call   37a <alarm>
    102d:	b8 e0 19 00 00       	mov    $0x19e0,%eax
    1032:	83 c4 10             	add    $0x10,%esp
    1035:	eb 14                	jmp    104b <uthread_join+0x4b>
    1037:	89 f6                	mov    %esi,%esi
    1039:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1040:	83 c3 01             	add    $0x1,%ebx
    1043:	83 c0 24             	add    $0x24,%eax
    1046:	83 fb 40             	cmp    $0x40,%ebx
    1049:	74 55                	je     10a0 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    104b:	3b 30                	cmp    (%eax),%esi
    104d:	75 f1                	jne    1040 <uthread_join+0x40>
    104f:	8b 50 08             	mov    0x8(%eax),%edx
    1052:	85 d2                	test   %edx,%edx
    1054:	74 ea                	je     1040 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1056:	53                   	push   %ebx
    1057:	ff 35 08 a9 00 00    	pushl  0xa908
    105d:	68 36 14 00 00       	push   $0x1436
    1062:	6a 01                	push   $0x1
    1064:	e8 c7 f3 ff ff       	call   430 <printf>
    threads[index_currently_running].join=found_tid;
    1069:	a1 08 a9 00 00       	mov    0xa908,%eax
    106e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1071:	8d 04 85 e0 19 00 00 	lea    0x19e0(,%eax,4),%eax
    1078:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    107b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1082:	e8 bb f2 ff ff       	call   342 <getpid>
    1087:	5a                   	pop    %edx
    1088:	59                   	pop    %ecx
    1089:	6a 0e                	push   $0xe
    108b:	50                   	push   %eax
    108c:	e8 d9 f2 ff ff       	call   36a <sigsend>
  }
  return 0;
    1091:	83 c4 10             	add    $0x10,%esp

}
    1094:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1097:	31 c0                	xor    %eax,%eax

}
    1099:	5b                   	pop    %ebx
    109a:	5e                   	pop    %esi
    109b:	5d                   	pop    %ebp
    109c:	c3                   	ret    
    109d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	56                   	push   %esi
    10a4:	68 18 14 00 00       	push   $0x1418
    10a9:	6a 01                	push   $0x1
    10ab:	e8 80 f3 ff ff       	call   430 <printf>
    alarm(UTHREAD_QUANTA);
    10b0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    10b7:	e8 be f2 ff ff       	call   37a <alarm>
    return -1;
    10bc:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    10bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    10c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    10c7:	5b                   	pop    %ebx
    10c8:	5e                   	pop    %esi
    10c9:	5d                   	pop    %ebp
    10ca:	c3                   	ret    
    10cb:	90                   	nop
    10cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000010d0 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	53                   	push   %ebx
    10d4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    10d7:	6a 00                	push   $0x0
    10d9:	e8 9c f2 ff ff       	call   37a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    10de:	8b 1d 08 a9 00 00    	mov    0xa908,%ebx
    10e4:	e8 71 f2 ff ff       	call   35a <uptime>
    10e9:	03 45 08             	add    0x8(%ebp),%eax
    10ec:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    10ef:	89 04 95 fc 19 00 00 	mov    %eax,0x19fc(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    10f6:	a1 08 a9 00 00       	mov    0xa908,%eax
    10fb:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10fe:	c7 04 85 e8 19 00 00 	movl   $0x1,0x19e8(,%eax,4)
    1105:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1109:	e8 34 f2 ff ff       	call   342 <getpid>
    110e:	5a                   	pop    %edx
    110f:	59                   	pop    %ecx
    1110:	6a 0e                	push   $0xe
    1112:	50                   	push   %eax
    1113:	e8 52 f2 ff ff       	call   36a <sigsend>
  return 0;
}
    1118:	31 c0                	xor    %eax,%eax
    111a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    111d:	c9                   	leave  
    111e:	c3                   	ret    
    111f:	90                   	nop

00001120 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1120:	55                   	push   %ebp
    1121:	89 e5                	mov    %esp,%ebp
    1123:	53                   	push   %ebx
    1124:	83 ec 04             	sub    $0x4,%esp
    1127:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    112a:	8b 45 0c             	mov    0xc(%ebp),%eax
    112d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1130:	e8 bb f7 ff ff       	call   8f0 <bsem_alloc>
    1135:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1137:	e8 b4 f7 ff ff       	call   8f0 <bsem_alloc>
    113c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    113f:	83 c4 04             	add    $0x4,%esp
    1142:	5b                   	pop    %ebx
    1143:	5d                   	pop    %ebp
    1144:	c3                   	ret    
    1145:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1149:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001150 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	83 ec 10             	sub    $0x10,%esp
    1157:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    115a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1161:	ff 33                	pushl  (%ebx)
    1163:	e8 78 f8 ff ff       	call   9e0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1168:	8b 43 04             	mov    0x4(%ebx),%eax
    116b:	83 c4 10             	add    $0x10,%esp
}
    116e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1171:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1174:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1175:	e9 66 f8 ff ff       	jmp    9e0 <bsem_free>
    117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001180 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1180:	55                   	push   %ebp
    1181:	89 e5                	mov    %esp,%ebp
    1183:	53                   	push   %ebx
    1184:	83 ec 10             	sub    $0x10,%esp
    1187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    118a:	ff 73 04             	pushl  0x4(%ebx)
    118d:	e8 de f8 ff ff       	call   a70 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1192:	58                   	pop    %eax
    1193:	ff 33                	pushl  (%ebx)
    1195:	e8 d6 f8 ff ff       	call   a70 <bsem_down>
  csem->value--;
    119a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    119d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    11a0:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    11a3:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    11a5:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    11a8:	7e 0e                	jle    11b8 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    11aa:	83 ec 0c             	sub    $0xc,%esp
    11ad:	ff 73 04             	pushl  0x4(%ebx)
    11b0:	e8 cb f9 ff ff       	call   b80 <bsem_up>
    11b5:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    11b8:	8b 03                	mov    (%ebx),%eax
}
    11ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11bd:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11c0:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11c1:	e9 ba f9 ff ff       	jmp    b80 <bsem_up>
    11c6:	8d 76 00             	lea    0x0(%esi),%esi
    11c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011d0 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	53                   	push   %ebx
    11d4:	83 ec 10             	sub    $0x10,%esp
    11d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    11da:	ff 33                	pushl  (%ebx)
    11dc:	e8 8f f8 ff ff       	call   a70 <bsem_down>
  csem->value++;
    11e1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    11e4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11e7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    11ea:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    11ed:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    11f0:	74 0e                	je     1200 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11f2:	8b 03                	mov    (%ebx),%eax
}
    11f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11f7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11fa:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    11fb:	e9 80 f9 ff ff       	jmp    b80 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1200:	83 ec 0c             	sub    $0xc,%esp
    1203:	ff 73 04             	pushl  0x4(%ebx)
    1206:	e8 75 f9 ff ff       	call   b80 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    120b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    120d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1210:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1213:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1216:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1217:	e9 64 f9 ff ff       	jmp    b80 <bsem_up>
