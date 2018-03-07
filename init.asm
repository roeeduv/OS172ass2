
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	pushl  -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	53                   	push   %ebx
       e:	51                   	push   %ecx
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
       f:	83 ec 08             	sub    $0x8,%esp
      12:	6a 02                	push   $0x2
      14:	68 8c 12 00 00       	push   $0x128c
      19:	e8 54 03 00 00       	call   372 <open>
      1e:	83 c4 10             	add    $0x10,%esp
      21:	85 c0                	test   %eax,%eax
      23:	0f 88 9f 00 00 00    	js     c8 <main+0xc8>
    mknod("console", 1, 1);
    open("console", O_RDWR);
  }
  dup(0);  // stdout
      29:	83 ec 0c             	sub    $0xc,%esp
      2c:	6a 00                	push   $0x0
      2e:	e8 77 03 00 00       	call   3aa <dup>
  dup(0);  // stderr
      33:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      3a:	e8 6b 03 00 00       	call   3aa <dup>
      3f:	83 c4 10             	add    $0x10,%esp
      42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  for(;;){
    printf(1, "init: starting sh\n");
      48:	83 ec 08             	sub    $0x8,%esp
      4b:	68 94 12 00 00       	push   $0x1294
      50:	6a 01                	push   $0x1
      52:	e8 49 04 00 00       	call   4a0 <printf>
    pid = fork();
      57:	e8 ce 02 00 00       	call   32a <fork>
    if(pid < 0){
      5c:	83 c4 10             	add    $0x10,%esp
      5f:	85 c0                	test   %eax,%eax
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
      61:	89 c3                	mov    %eax,%ebx
    if(pid < 0){
      63:	78 2c                	js     91 <main+0x91>
      printf(1, "init: fork failed\n");
      exit();
    }
    if(pid == 0){
      65:	74 3d                	je     a4 <main+0xa4>
      67:	89 f6                	mov    %esi,%esi
      69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      70:	e8 c5 02 00 00       	call   33a <wait>
      75:	85 c0                	test   %eax,%eax
      77:	78 cf                	js     48 <main+0x48>
      79:	39 c3                	cmp    %eax,%ebx
      7b:	74 cb                	je     48 <main+0x48>
      printf(1, "zombie!\n");
      7d:	83 ec 08             	sub    $0x8,%esp
      80:	68 d3 12 00 00       	push   $0x12d3
      85:	6a 01                	push   $0x1
      87:	e8 14 04 00 00       	call   4a0 <printf>
      8c:	83 c4 10             	add    $0x10,%esp
      8f:	eb df                	jmp    70 <main+0x70>

  for(;;){
    printf(1, "init: starting sh\n");
    pid = fork();
    if(pid < 0){
      printf(1, "init: fork failed\n");
      91:	53                   	push   %ebx
      92:	53                   	push   %ebx
      93:	68 a7 12 00 00       	push   $0x12a7
      98:	6a 01                	push   $0x1
      9a:	e8 01 04 00 00       	call   4a0 <printf>
      exit();
      9f:	e8 8e 02 00 00       	call   332 <exit>
    }
    if(pid == 0){
      exec("sh", argv);
      a4:	50                   	push   %eax
      a5:	50                   	push   %eax
      a6:	68 40 1a 00 00       	push   $0x1a40
      ab:	68 ba 12 00 00       	push   $0x12ba
      b0:	e8 b5 02 00 00       	call   36a <exec>
      printf(1, "init: exec sh failed\n");
      b5:	5a                   	pop    %edx
      b6:	59                   	pop    %ecx
      b7:	68 bd 12 00 00       	push   $0x12bd
      bc:	6a 01                	push   $0x1
      be:	e8 dd 03 00 00       	call   4a0 <printf>
      exit();
      c3:	e8 6a 02 00 00       	call   332 <exit>
main(void)
{
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
    mknod("console", 1, 1);
      c8:	50                   	push   %eax
      c9:	6a 01                	push   $0x1
      cb:	6a 01                	push   $0x1
      cd:	68 8c 12 00 00       	push   $0x128c
      d2:	e8 a3 02 00 00       	call   37a <mknod>
    open("console", O_RDWR);
      d7:	58                   	pop    %eax
      d8:	5a                   	pop    %edx
      d9:	6a 02                	push   $0x2
      db:	68 8c 12 00 00       	push   $0x128c
      e0:	e8 8d 02 00 00       	call   372 <open>
      e5:	83 c4 10             	add    $0x10,%esp
      e8:	e9 3c ff ff ff       	jmp    29 <main+0x29>
      ed:	66 90                	xchg   %ax,%ax
      ef:	90                   	nop

000000f0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
      f0:	55                   	push   %ebp
      f1:	89 e5                	mov    %esp,%ebp
      f3:	53                   	push   %ebx
      f4:	8b 45 08             	mov    0x8(%ebp),%eax
      f7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
      fa:	89 c2                	mov    %eax,%edx
      fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     100:	83 c1 01             	add    $0x1,%ecx
     103:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     107:	83 c2 01             	add    $0x1,%edx
     10a:	84 db                	test   %bl,%bl
     10c:	88 5a ff             	mov    %bl,-0x1(%edx)
     10f:	75 ef                	jne    100 <strcpy+0x10>
    ;
  return os;
}
     111:	5b                   	pop    %ebx
     112:	5d                   	pop    %ebp
     113:	c3                   	ret    
     114:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     11a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000120 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     120:	55                   	push   %ebp
     121:	89 e5                	mov    %esp,%ebp
     123:	56                   	push   %esi
     124:	53                   	push   %ebx
     125:	8b 55 08             	mov    0x8(%ebp),%edx
     128:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     12b:	0f b6 02             	movzbl (%edx),%eax
     12e:	0f b6 19             	movzbl (%ecx),%ebx
     131:	84 c0                	test   %al,%al
     133:	75 1e                	jne    153 <strcmp+0x33>
     135:	eb 29                	jmp    160 <strcmp+0x40>
     137:	89 f6                	mov    %esi,%esi
     139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     140:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     143:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     146:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     149:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     14d:	84 c0                	test   %al,%al
     14f:	74 0f                	je     160 <strcmp+0x40>
     151:	89 f1                	mov    %esi,%ecx
     153:	38 d8                	cmp    %bl,%al
     155:	74 e9                	je     140 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     157:	29 d8                	sub    %ebx,%eax
}
     159:	5b                   	pop    %ebx
     15a:	5e                   	pop    %esi
     15b:	5d                   	pop    %ebp
     15c:	c3                   	ret    
     15d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     160:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     162:	29 d8                	sub    %ebx,%eax
}
     164:	5b                   	pop    %ebx
     165:	5e                   	pop    %esi
     166:	5d                   	pop    %ebp
     167:	c3                   	ret    
     168:	90                   	nop
     169:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000170 <strlen>:

uint
strlen(char *s)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     176:	80 39 00             	cmpb   $0x0,(%ecx)
     179:	74 12                	je     18d <strlen+0x1d>
     17b:	31 d2                	xor    %edx,%edx
     17d:	8d 76 00             	lea    0x0(%esi),%esi
     180:	83 c2 01             	add    $0x1,%edx
     183:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     187:	89 d0                	mov    %edx,%eax
     189:	75 f5                	jne    180 <strlen+0x10>
    ;
  return n;
}
     18b:	5d                   	pop    %ebp
     18c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     18d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     18f:	5d                   	pop    %ebp
     190:	c3                   	ret    
     191:	eb 0d                	jmp    1a0 <memset>
     193:	90                   	nop
     194:	90                   	nop
     195:	90                   	nop
     196:	90                   	nop
     197:	90                   	nop
     198:	90                   	nop
     199:	90                   	nop
     19a:	90                   	nop
     19b:	90                   	nop
     19c:	90                   	nop
     19d:	90                   	nop
     19e:	90                   	nop
     19f:	90                   	nop

000001a0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1a0:	55                   	push   %ebp
     1a1:	89 e5                	mov    %esp,%ebp
     1a3:	57                   	push   %edi
     1a4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     1a7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     1aa:	8b 45 0c             	mov    0xc(%ebp),%eax
     1ad:	89 d7                	mov    %edx,%edi
     1af:	fc                   	cld    
     1b0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     1b2:	89 d0                	mov    %edx,%eax
     1b4:	5f                   	pop    %edi
     1b5:	5d                   	pop    %ebp
     1b6:	c3                   	ret    
     1b7:	89 f6                	mov    %esi,%esi
     1b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001c0 <strchr>:

char*
strchr(const char *s, char c)
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	53                   	push   %ebx
     1c4:	8b 45 08             	mov    0x8(%ebp),%eax
     1c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     1ca:	0f b6 10             	movzbl (%eax),%edx
     1cd:	84 d2                	test   %dl,%dl
     1cf:	74 1d                	je     1ee <strchr+0x2e>
    if(*s == c)
     1d1:	38 d3                	cmp    %dl,%bl
     1d3:	89 d9                	mov    %ebx,%ecx
     1d5:	75 0d                	jne    1e4 <strchr+0x24>
     1d7:	eb 17                	jmp    1f0 <strchr+0x30>
     1d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     1e0:	38 ca                	cmp    %cl,%dl
     1e2:	74 0c                	je     1f0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     1e4:	83 c0 01             	add    $0x1,%eax
     1e7:	0f b6 10             	movzbl (%eax),%edx
     1ea:	84 d2                	test   %dl,%dl
     1ec:	75 f2                	jne    1e0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     1ee:	31 c0                	xor    %eax,%eax
}
     1f0:	5b                   	pop    %ebx
     1f1:	5d                   	pop    %ebp
     1f2:	c3                   	ret    
     1f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000200 <gets>:

char*
gets(char *buf, int max)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	57                   	push   %edi
     204:	56                   	push   %esi
     205:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     206:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     208:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     20b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     20e:	eb 29                	jmp    239 <gets+0x39>
    cc = read(0, &c, 1);
     210:	83 ec 04             	sub    $0x4,%esp
     213:	6a 01                	push   $0x1
     215:	57                   	push   %edi
     216:	6a 00                	push   $0x0
     218:	e8 2d 01 00 00       	call   34a <read>
    if(cc < 1)
     21d:	83 c4 10             	add    $0x10,%esp
     220:	85 c0                	test   %eax,%eax
     222:	7e 1d                	jle    241 <gets+0x41>
      break;
    buf[i++] = c;
     224:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     228:	8b 55 08             	mov    0x8(%ebp),%edx
     22b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     22d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     22f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     233:	74 1b                	je     250 <gets+0x50>
     235:	3c 0d                	cmp    $0xd,%al
     237:	74 17                	je     250 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     239:	8d 5e 01             	lea    0x1(%esi),%ebx
     23c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     23f:	7c cf                	jl     210 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     241:	8b 45 08             	mov    0x8(%ebp),%eax
     244:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     248:	8d 65 f4             	lea    -0xc(%ebp),%esp
     24b:	5b                   	pop    %ebx
     24c:	5e                   	pop    %esi
     24d:	5f                   	pop    %edi
     24e:	5d                   	pop    %ebp
     24f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     250:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     253:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     255:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     259:	8d 65 f4             	lea    -0xc(%ebp),%esp
     25c:	5b                   	pop    %ebx
     25d:	5e                   	pop    %esi
     25e:	5f                   	pop    %edi
     25f:	5d                   	pop    %ebp
     260:	c3                   	ret    
     261:	eb 0d                	jmp    270 <stat>
     263:	90                   	nop
     264:	90                   	nop
     265:	90                   	nop
     266:	90                   	nop
     267:	90                   	nop
     268:	90                   	nop
     269:	90                   	nop
     26a:	90                   	nop
     26b:	90                   	nop
     26c:	90                   	nop
     26d:	90                   	nop
     26e:	90                   	nop
     26f:	90                   	nop

00000270 <stat>:

int
stat(char *n, struct stat *st)
{
     270:	55                   	push   %ebp
     271:	89 e5                	mov    %esp,%ebp
     273:	56                   	push   %esi
     274:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     275:	83 ec 08             	sub    $0x8,%esp
     278:	6a 00                	push   $0x0
     27a:	ff 75 08             	pushl  0x8(%ebp)
     27d:	e8 f0 00 00 00       	call   372 <open>
  if(fd < 0)
     282:	83 c4 10             	add    $0x10,%esp
     285:	85 c0                	test   %eax,%eax
     287:	78 27                	js     2b0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     289:	83 ec 08             	sub    $0x8,%esp
     28c:	ff 75 0c             	pushl  0xc(%ebp)
     28f:	89 c3                	mov    %eax,%ebx
     291:	50                   	push   %eax
     292:	e8 f3 00 00 00       	call   38a <fstat>
     297:	89 c6                	mov    %eax,%esi
  close(fd);
     299:	89 1c 24             	mov    %ebx,(%esp)
     29c:	e8 b9 00 00 00       	call   35a <close>
  return r;
     2a1:	83 c4 10             	add    $0x10,%esp
     2a4:	89 f0                	mov    %esi,%eax
}
     2a6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2a9:	5b                   	pop    %ebx
     2aa:	5e                   	pop    %esi
     2ab:	5d                   	pop    %ebp
     2ac:	c3                   	ret    
     2ad:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     2b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     2b5:	eb ef                	jmp    2a6 <stat+0x36>
     2b7:	89 f6                	mov    %esi,%esi
     2b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002c0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	53                   	push   %ebx
     2c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     2c7:	0f be 11             	movsbl (%ecx),%edx
     2ca:	8d 42 d0             	lea    -0x30(%edx),%eax
     2cd:	3c 09                	cmp    $0x9,%al
     2cf:	b8 00 00 00 00       	mov    $0x0,%eax
     2d4:	77 1f                	ja     2f5 <atoi+0x35>
     2d6:	8d 76 00             	lea    0x0(%esi),%esi
     2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     2e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     2e3:	83 c1 01             	add    $0x1,%ecx
     2e6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     2ea:	0f be 11             	movsbl (%ecx),%edx
     2ed:	8d 5a d0             	lea    -0x30(%edx),%ebx
     2f0:	80 fb 09             	cmp    $0x9,%bl
     2f3:	76 eb                	jbe    2e0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     2f5:	5b                   	pop    %ebx
     2f6:	5d                   	pop    %ebp
     2f7:	c3                   	ret    
     2f8:	90                   	nop
     2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	56                   	push   %esi
     304:	53                   	push   %ebx
     305:	8b 5d 10             	mov    0x10(%ebp),%ebx
     308:	8b 45 08             	mov    0x8(%ebp),%eax
     30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     30e:	85 db                	test   %ebx,%ebx
     310:	7e 14                	jle    326 <memmove+0x26>
     312:	31 d2                	xor    %edx,%edx
     314:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     318:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     31c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     31f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     322:	39 da                	cmp    %ebx,%edx
     324:	75 f2                	jne    318 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     326:	5b                   	pop    %ebx
     327:	5e                   	pop    %esi
     328:	5d                   	pop    %ebp
     329:	c3                   	ret    

0000032a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     32a:	b8 01 00 00 00       	mov    $0x1,%eax
     32f:	cd 40                	int    $0x40
     331:	c3                   	ret    

00000332 <exit>:
SYSCALL(exit)
     332:	b8 02 00 00 00       	mov    $0x2,%eax
     337:	cd 40                	int    $0x40
     339:	c3                   	ret    

0000033a <wait>:
SYSCALL(wait)
     33a:	b8 03 00 00 00       	mov    $0x3,%eax
     33f:	cd 40                	int    $0x40
     341:	c3                   	ret    

00000342 <pipe>:
SYSCALL(pipe)
     342:	b8 04 00 00 00       	mov    $0x4,%eax
     347:	cd 40                	int    $0x40
     349:	c3                   	ret    

0000034a <read>:
SYSCALL(read)
     34a:	b8 05 00 00 00       	mov    $0x5,%eax
     34f:	cd 40                	int    $0x40
     351:	c3                   	ret    

00000352 <write>:
SYSCALL(write)
     352:	b8 10 00 00 00       	mov    $0x10,%eax
     357:	cd 40                	int    $0x40
     359:	c3                   	ret    

0000035a <close>:
SYSCALL(close)
     35a:	b8 15 00 00 00       	mov    $0x15,%eax
     35f:	cd 40                	int    $0x40
     361:	c3                   	ret    

00000362 <kill>:
SYSCALL(kill)
     362:	b8 06 00 00 00       	mov    $0x6,%eax
     367:	cd 40                	int    $0x40
     369:	c3                   	ret    

0000036a <exec>:
SYSCALL(exec)
     36a:	b8 07 00 00 00       	mov    $0x7,%eax
     36f:	cd 40                	int    $0x40
     371:	c3                   	ret    

00000372 <open>:
SYSCALL(open)
     372:	b8 0f 00 00 00       	mov    $0xf,%eax
     377:	cd 40                	int    $0x40
     379:	c3                   	ret    

0000037a <mknod>:
SYSCALL(mknod)
     37a:	b8 11 00 00 00       	mov    $0x11,%eax
     37f:	cd 40                	int    $0x40
     381:	c3                   	ret    

00000382 <unlink>:
SYSCALL(unlink)
     382:	b8 12 00 00 00       	mov    $0x12,%eax
     387:	cd 40                	int    $0x40
     389:	c3                   	ret    

0000038a <fstat>:
SYSCALL(fstat)
     38a:	b8 08 00 00 00       	mov    $0x8,%eax
     38f:	cd 40                	int    $0x40
     391:	c3                   	ret    

00000392 <link>:
SYSCALL(link)
     392:	b8 13 00 00 00       	mov    $0x13,%eax
     397:	cd 40                	int    $0x40
     399:	c3                   	ret    

0000039a <mkdir>:
SYSCALL(mkdir)
     39a:	b8 14 00 00 00       	mov    $0x14,%eax
     39f:	cd 40                	int    $0x40
     3a1:	c3                   	ret    

000003a2 <chdir>:
SYSCALL(chdir)
     3a2:	b8 09 00 00 00       	mov    $0x9,%eax
     3a7:	cd 40                	int    $0x40
     3a9:	c3                   	ret    

000003aa <dup>:
SYSCALL(dup)
     3aa:	b8 0a 00 00 00       	mov    $0xa,%eax
     3af:	cd 40                	int    $0x40
     3b1:	c3                   	ret    

000003b2 <getpid>:
SYSCALL(getpid)
     3b2:	b8 0b 00 00 00       	mov    $0xb,%eax
     3b7:	cd 40                	int    $0x40
     3b9:	c3                   	ret    

000003ba <sbrk>:
SYSCALL(sbrk)
     3ba:	b8 0c 00 00 00       	mov    $0xc,%eax
     3bf:	cd 40                	int    $0x40
     3c1:	c3                   	ret    

000003c2 <sleep>:
SYSCALL(sleep)
     3c2:	b8 0d 00 00 00       	mov    $0xd,%eax
     3c7:	cd 40                	int    $0x40
     3c9:	c3                   	ret    

000003ca <uptime>:
SYSCALL(uptime)
     3ca:	b8 0e 00 00 00       	mov    $0xe,%eax
     3cf:	cd 40                	int    $0x40
     3d1:	c3                   	ret    

000003d2 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     3d2:	b8 16 00 00 00       	mov    $0x16,%eax
     3d7:	cd 40                	int    $0x40
     3d9:	c3                   	ret    

000003da <sigsend>:
SYSCALL(sigsend)
     3da:	b8 17 00 00 00       	mov    $0x17,%eax
     3df:	cd 40                	int    $0x40
     3e1:	c3                   	ret    

000003e2 <sigreturn>:
SYSCALL(sigreturn)
     3e2:	b8 18 00 00 00       	mov    $0x18,%eax
     3e7:	cd 40                	int    $0x40
     3e9:	c3                   	ret    

000003ea <alarm>:
SYSCALL(alarm)
     3ea:	b8 19 00 00 00       	mov    $0x19,%eax
     3ef:	cd 40                	int    $0x40
     3f1:	c3                   	ret    
     3f2:	66 90                	xchg   %ax,%ax
     3f4:	66 90                	xchg   %ax,%ax
     3f6:	66 90                	xchg   %ax,%ax
     3f8:	66 90                	xchg   %ax,%ax
     3fa:	66 90                	xchg   %ax,%ax
     3fc:	66 90                	xchg   %ax,%ax
     3fe:	66 90                	xchg   %ax,%ax

00000400 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     400:	55                   	push   %ebp
     401:	89 e5                	mov    %esp,%ebp
     403:	57                   	push   %edi
     404:	56                   	push   %esi
     405:	53                   	push   %ebx
     406:	89 c6                	mov    %eax,%esi
     408:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     40b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     40e:	85 db                	test   %ebx,%ebx
     410:	74 7e                	je     490 <printint+0x90>
     412:	89 d0                	mov    %edx,%eax
     414:	c1 e8 1f             	shr    $0x1f,%eax
     417:	84 c0                	test   %al,%al
     419:	74 75                	je     490 <printint+0x90>
    neg = 1;
    x = -xx;
     41b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     41d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     424:	f7 d8                	neg    %eax
     426:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     429:	31 ff                	xor    %edi,%edi
     42b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     42e:	89 ce                	mov    %ecx,%esi
     430:	eb 08                	jmp    43a <printint+0x3a>
     432:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     438:	89 cf                	mov    %ecx,%edi
     43a:	31 d2                	xor    %edx,%edx
     43c:	8d 4f 01             	lea    0x1(%edi),%ecx
     43f:	f7 f6                	div    %esi
     441:	0f b6 92 e4 12 00 00 	movzbl 0x12e4(%edx),%edx
  }while((x /= base) != 0);
     448:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     44a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     44d:	75 e9                	jne    438 <printint+0x38>
  if(neg)
     44f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     452:	8b 75 c0             	mov    -0x40(%ebp),%esi
     455:	85 c0                	test   %eax,%eax
     457:	74 08                	je     461 <printint+0x61>
    buf[i++] = '-';
     459:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     45e:	8d 4f 02             	lea    0x2(%edi),%ecx
     461:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     465:	8d 76 00             	lea    0x0(%esi),%esi
     468:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     46b:	83 ec 04             	sub    $0x4,%esp
     46e:	83 ef 01             	sub    $0x1,%edi
     471:	6a 01                	push   $0x1
     473:	53                   	push   %ebx
     474:	56                   	push   %esi
     475:	88 45 d7             	mov    %al,-0x29(%ebp)
     478:	e8 d5 fe ff ff       	call   352 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     47d:	83 c4 10             	add    $0x10,%esp
     480:	39 df                	cmp    %ebx,%edi
     482:	75 e4                	jne    468 <printint+0x68>
    putc(fd, buf[i]);
}
     484:	8d 65 f4             	lea    -0xc(%ebp),%esp
     487:	5b                   	pop    %ebx
     488:	5e                   	pop    %esi
     489:	5f                   	pop    %edi
     48a:	5d                   	pop    %ebp
     48b:	c3                   	ret    
     48c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     490:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     492:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     499:	eb 8b                	jmp    426 <printint+0x26>
     49b:	90                   	nop
     49c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004a0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	57                   	push   %edi
     4a4:	56                   	push   %esi
     4a5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4a6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4a9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4ac:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4af:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4b2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     4b5:	0f b6 1e             	movzbl (%esi),%ebx
     4b8:	83 c6 01             	add    $0x1,%esi
     4bb:	84 db                	test   %bl,%bl
     4bd:	0f 84 b0 00 00 00    	je     573 <printf+0xd3>
     4c3:	31 d2                	xor    %edx,%edx
     4c5:	eb 39                	jmp    500 <printf+0x60>
     4c7:	89 f6                	mov    %esi,%esi
     4c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     4d0:	83 f8 25             	cmp    $0x25,%eax
     4d3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     4d6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     4db:	74 18                	je     4f5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4dd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     4e0:	83 ec 04             	sub    $0x4,%esp
     4e3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     4e6:	6a 01                	push   $0x1
     4e8:	50                   	push   %eax
     4e9:	57                   	push   %edi
     4ea:	e8 63 fe ff ff       	call   352 <write>
     4ef:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     4f2:	83 c4 10             	add    $0x10,%esp
     4f5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4f8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     4fc:	84 db                	test   %bl,%bl
     4fe:	74 73                	je     573 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     500:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     502:	0f be cb             	movsbl %bl,%ecx
     505:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     508:	74 c6                	je     4d0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     50a:	83 fa 25             	cmp    $0x25,%edx
     50d:	75 e6                	jne    4f5 <printf+0x55>
      if(c == 'd'){
     50f:	83 f8 64             	cmp    $0x64,%eax
     512:	0f 84 f8 00 00 00    	je     610 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     518:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     51e:	83 f9 70             	cmp    $0x70,%ecx
     521:	74 5d                	je     580 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     523:	83 f8 73             	cmp    $0x73,%eax
     526:	0f 84 84 00 00 00    	je     5b0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     52c:	83 f8 63             	cmp    $0x63,%eax
     52f:	0f 84 ea 00 00 00    	je     61f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     535:	83 f8 25             	cmp    $0x25,%eax
     538:	0f 84 c2 00 00 00    	je     600 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     53e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     541:	83 ec 04             	sub    $0x4,%esp
     544:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     548:	6a 01                	push   $0x1
     54a:	50                   	push   %eax
     54b:	57                   	push   %edi
     54c:	e8 01 fe ff ff       	call   352 <write>
     551:	83 c4 0c             	add    $0xc,%esp
     554:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     557:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     55a:	6a 01                	push   $0x1
     55c:	50                   	push   %eax
     55d:	57                   	push   %edi
     55e:	83 c6 01             	add    $0x1,%esi
     561:	e8 ec fd ff ff       	call   352 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     566:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     56a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     56d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     56f:	84 db                	test   %bl,%bl
     571:	75 8d                	jne    500 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     573:	8d 65 f4             	lea    -0xc(%ebp),%esp
     576:	5b                   	pop    %ebx
     577:	5e                   	pop    %esi
     578:	5f                   	pop    %edi
     579:	5d                   	pop    %ebp
     57a:	c3                   	ret    
     57b:	90                   	nop
     57c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     580:	83 ec 0c             	sub    $0xc,%esp
     583:	b9 10 00 00 00       	mov    $0x10,%ecx
     588:	6a 00                	push   $0x0
     58a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     58d:	89 f8                	mov    %edi,%eax
     58f:	8b 13                	mov    (%ebx),%edx
     591:	e8 6a fe ff ff       	call   400 <printint>
        ap++;
     596:	89 d8                	mov    %ebx,%eax
     598:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     59b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     59d:	83 c0 04             	add    $0x4,%eax
     5a0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     5a3:	e9 4d ff ff ff       	jmp    4f5 <printf+0x55>
     5a8:	90                   	nop
     5a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     5b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5b3:	8b 18                	mov    (%eax),%ebx
        ap++;
     5b5:	83 c0 04             	add    $0x4,%eax
     5b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     5bb:	b8 dc 12 00 00       	mov    $0x12dc,%eax
     5c0:	85 db                	test   %ebx,%ebx
     5c2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     5c5:	0f b6 03             	movzbl (%ebx),%eax
     5c8:	84 c0                	test   %al,%al
     5ca:	74 23                	je     5ef <printf+0x14f>
     5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     5d0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5d3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     5d6:	83 ec 04             	sub    $0x4,%esp
     5d9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     5db:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5de:	50                   	push   %eax
     5df:	57                   	push   %edi
     5e0:	e8 6d fd ff ff       	call   352 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     5e5:	0f b6 03             	movzbl (%ebx),%eax
     5e8:	83 c4 10             	add    $0x10,%esp
     5eb:	84 c0                	test   %al,%al
     5ed:	75 e1                	jne    5d0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     5ef:	31 d2                	xor    %edx,%edx
     5f1:	e9 ff fe ff ff       	jmp    4f5 <printf+0x55>
     5f6:	8d 76 00             	lea    0x0(%esi),%esi
     5f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     600:	83 ec 04             	sub    $0x4,%esp
     603:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     606:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     609:	6a 01                	push   $0x1
     60b:	e9 4c ff ff ff       	jmp    55c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     610:	83 ec 0c             	sub    $0xc,%esp
     613:	b9 0a 00 00 00       	mov    $0xa,%ecx
     618:	6a 01                	push   $0x1
     61a:	e9 6b ff ff ff       	jmp    58a <printf+0xea>
     61f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     622:	83 ec 04             	sub    $0x4,%esp
     625:	8b 03                	mov    (%ebx),%eax
     627:	6a 01                	push   $0x1
     629:	88 45 e4             	mov    %al,-0x1c(%ebp)
     62c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     62f:	50                   	push   %eax
     630:	57                   	push   %edi
     631:	e8 1c fd ff ff       	call   352 <write>
     636:	e9 5b ff ff ff       	jmp    596 <printf+0xf6>
     63b:	66 90                	xchg   %ax,%ax
     63d:	66 90                	xchg   %ax,%ax
     63f:	90                   	nop

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     640:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     641:	a1 60 1a 00 00       	mov    0x1a60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     646:	89 e5                	mov    %esp,%ebp
     648:	57                   	push   %edi
     649:	56                   	push   %esi
     64a:	53                   	push   %ebx
     64b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     64e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     650:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     653:	39 c8                	cmp    %ecx,%eax
     655:	73 19                	jae    670 <free+0x30>
     657:	89 f6                	mov    %esi,%esi
     659:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     660:	39 d1                	cmp    %edx,%ecx
     662:	72 1c                	jb     680 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     664:	39 d0                	cmp    %edx,%eax
     666:	73 18                	jae    680 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     668:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     66a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     66c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     66e:	72 f0                	jb     660 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     670:	39 d0                	cmp    %edx,%eax
     672:	72 f4                	jb     668 <free+0x28>
     674:	39 d1                	cmp    %edx,%ecx
     676:	73 f0                	jae    668 <free+0x28>
     678:	90                   	nop
     679:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     680:	8b 73 fc             	mov    -0x4(%ebx),%esi
     683:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     686:	39 d7                	cmp    %edx,%edi
     688:	74 19                	je     6a3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     68a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     68d:	8b 50 04             	mov    0x4(%eax),%edx
     690:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     693:	39 f1                	cmp    %esi,%ecx
     695:	74 23                	je     6ba <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     697:	89 08                	mov    %ecx,(%eax)
  freep = p;
     699:	a3 60 1a 00 00       	mov    %eax,0x1a60
}
     69e:	5b                   	pop    %ebx
     69f:	5e                   	pop    %esi
     6a0:	5f                   	pop    %edi
     6a1:	5d                   	pop    %ebp
     6a2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     6a3:	03 72 04             	add    0x4(%edx),%esi
     6a6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     6a9:	8b 10                	mov    (%eax),%edx
     6ab:	8b 12                	mov    (%edx),%edx
     6ad:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     6b0:	8b 50 04             	mov    0x4(%eax),%edx
     6b3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     6b6:	39 f1                	cmp    %esi,%ecx
     6b8:	75 dd                	jne    697 <free+0x57>
    p->s.size += bp->s.size;
     6ba:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     6bd:	a3 60 1a 00 00       	mov    %eax,0x1a60
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     6c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     6c5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     6c8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     6ca:	5b                   	pop    %ebx
     6cb:	5e                   	pop    %esi
     6cc:	5f                   	pop    %edi
     6cd:	5d                   	pop    %ebp
     6ce:	c3                   	ret    
     6cf:	90                   	nop

000006d0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
     6d6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     6d9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     6dc:	8b 15 60 1a 00 00    	mov    0x1a60,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     6e2:	8d 78 07             	lea    0x7(%eax),%edi
     6e5:	c1 ef 03             	shr    $0x3,%edi
     6e8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     6eb:	85 d2                	test   %edx,%edx
     6ed:	0f 84 a3 00 00 00    	je     796 <malloc+0xc6>
     6f3:	8b 02                	mov    (%edx),%eax
     6f5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     6f8:	39 cf                	cmp    %ecx,%edi
     6fa:	76 74                	jbe    770 <malloc+0xa0>
     6fc:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     702:	be 00 10 00 00       	mov    $0x1000,%esi
     707:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     70e:	0f 43 f7             	cmovae %edi,%esi
     711:	ba 00 80 00 00       	mov    $0x8000,%edx
     716:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     71c:	0f 46 da             	cmovbe %edx,%ebx
     71f:	eb 10                	jmp    731 <malloc+0x61>
     721:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     728:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     72a:	8b 48 04             	mov    0x4(%eax),%ecx
     72d:	39 cf                	cmp    %ecx,%edi
     72f:	76 3f                	jbe    770 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     731:	39 05 60 1a 00 00    	cmp    %eax,0x1a60
     737:	89 c2                	mov    %eax,%edx
     739:	75 ed                	jne    728 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     73b:	83 ec 0c             	sub    $0xc,%esp
     73e:	53                   	push   %ebx
     73f:	e8 76 fc ff ff       	call   3ba <sbrk>
  if(p == (char*)-1)
     744:	83 c4 10             	add    $0x10,%esp
     747:	83 f8 ff             	cmp    $0xffffffff,%eax
     74a:	74 1c                	je     768 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     74c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     74f:	83 ec 0c             	sub    $0xc,%esp
     752:	83 c0 08             	add    $0x8,%eax
     755:	50                   	push   %eax
     756:	e8 e5 fe ff ff       	call   640 <free>
  return freep;
     75b:	8b 15 60 1a 00 00    	mov    0x1a60,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     761:	83 c4 10             	add    $0x10,%esp
     764:	85 d2                	test   %edx,%edx
     766:	75 c0                	jne    728 <malloc+0x58>
        return 0;
     768:	31 c0                	xor    %eax,%eax
     76a:	eb 1c                	jmp    788 <malloc+0xb8>
     76c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     770:	39 cf                	cmp    %ecx,%edi
     772:	74 1c                	je     790 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     774:	29 f9                	sub    %edi,%ecx
     776:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     779:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     77c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     77f:	89 15 60 1a 00 00    	mov    %edx,0x1a60
      return (void*)(p + 1);
     785:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     788:	8d 65 f4             	lea    -0xc(%ebp),%esp
     78b:	5b                   	pop    %ebx
     78c:	5e                   	pop    %esi
     78d:	5f                   	pop    %edi
     78e:	5d                   	pop    %ebp
     78f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     790:	8b 08                	mov    (%eax),%ecx
     792:	89 0a                	mov    %ecx,(%edx)
     794:	eb e9                	jmp    77f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     796:	c7 05 60 1a 00 00 64 	movl   $0x1a64,0x1a60
     79d:	1a 00 00 
     7a0:	c7 05 64 1a 00 00 64 	movl   $0x1a64,0x1a64
     7a7:	1a 00 00 
    base.s.size = 0;
     7aa:	b8 64 1a 00 00       	mov    $0x1a64,%eax
     7af:	c7 05 68 1a 00 00 00 	movl   $0x0,0x1a68
     7b6:	00 00 00 
     7b9:	e9 3e ff ff ff       	jmp    6fc <malloc+0x2c>
     7be:	66 90                	xchg   %ax,%ax

000007c0 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     7c0:	55                   	push   %ebp
     7c1:	89 e5                	mov    %esp,%ebp
     7c3:	56                   	push   %esi
     7c4:	53                   	push   %ebx
     7c5:	8b 75 0c             	mov    0xc(%ebp),%esi
     7c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     7cb:	83 ec 08             	sub    $0x8,%esp
     7ce:	68 f8 12 00 00       	push   $0x12f8
     7d3:	6a 01                	push   $0x1
     7d5:	e8 c6 fc ff ff       	call   4a0 <printf>
  alarm(UTHREAD_QUANTA);
     7da:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     7e1:	e8 04 fc ff ff       	call   3ea <alarm>
  start_func(arg);
     7e6:	89 75 08             	mov    %esi,0x8(%ebp)
     7e9:	83 c4 10             	add    $0x10,%esp
}
     7ec:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     7ef:	89 d8                	mov    %ebx,%eax
}
     7f1:	5b                   	pop    %ebx
     7f2:	5e                   	pop    %esi
     7f3:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     7f4:	ff e0                	jmp    *%eax
     7f6:	8d 76 00             	lea    0x0(%esi),%esi
     7f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000800 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     800:	55                   	push   %ebp
     801:	89 e5                	mov    %esp,%ebp
     803:	53                   	push   %ebx
     804:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     807:	6a 00                	push   $0x0
     809:	e8 dc fb ff ff       	call   3ea <alarm>
  printf(1,"exiting...\n");
     80e:	5a                   	pop    %edx
     80f:	59                   	pop    %ecx
     810:	68 68 14 00 00       	push   $0x1468
     815:	6a 01                	push   $0x1
     817:	e8 84 fc ff ff       	call   4a0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     81c:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
     821:	83 c4 10             	add    $0x10,%esp
     824:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     827:	8b 1c 95 80 1a 00 00 	mov    0x1a80(,%edx,4),%ebx
     82e:	85 db                	test   %ebx,%ebx
     830:	75 0a                	jne    83c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     832:	c7 05 88 1a 00 00 00 	movl   $0x0,0x1a88
     839:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     83c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     83f:	83 ec 0c             	sub    $0xc,%esp
     842:	ff 34 85 84 1a 00 00 	pushl  0x1a84(,%eax,4)
     849:	e8 f2 fd ff ff       	call   640 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     84e:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
     853:	83 c4 10             	add    $0x10,%esp
     856:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     859:	b8 88 1a 00 00       	mov    $0x1a88,%eax
     85e:	c1 e2 02             	shl    $0x2,%edx
     861:	c7 82 88 1a 00 00 00 	movl   $0x0,0x1a88(%edx)
     868:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     86b:	c7 82 80 1a 00 00 ff 	movl   $0xffffffff,0x1a80(%edx)
     872:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     875:	c7 82 8c 1a 00 00 00 	movl   $0x0,0x1a8c(%edx)
     87c:	00 00 00 
  threads[index_currently_running].esp = 0;
     87f:	c7 82 90 1a 00 00 00 	movl   $0x0,0x1a90(%edx)
     886:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     889:	c7 82 9c 1a 00 00 00 	movl   $0x0,0x1a9c(%edx)
     890:	00 00 00 
  threads[index_currently_running].join = -1;
     893:	c7 82 a0 1a 00 00 ff 	movl   $0xffffffff,0x1aa0(%edx)
     89a:	ff ff ff 
     89d:	eb 0b                	jmp    8aa <uthread_exit+0xaa>
     89f:	90                   	nop
     8a0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     8a3:	3d 88 23 00 00       	cmp    $0x2388,%eax
     8a8:	74 15                	je     8bf <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     8aa:	83 38 04             	cmpl   $0x4,(%eax)
     8ad:	75 f1                	jne    8a0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     8af:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     8b5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     8b8:	3d 88 23 00 00       	cmp    $0x2388,%eax
     8bd:	75 eb                	jne    8aa <uthread_exit+0xaa>
     8bf:	bb ac 1a 00 00       	mov    $0x1aac,%ebx
     8c4:	eb 15                	jmp    8db <uthread_exit+0xdb>
     8c6:	8d 76 00             	lea    0x0(%esi),%esi
     8c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     8d0:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     8d3:	81 fb 88 23 00 00    	cmp    $0x2388,%ebx
     8d9:	74 24                	je     8ff <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     8db:	8b 03                	mov    (%ebx),%eax
     8dd:	85 c0                	test   %eax,%eax
     8df:	74 ef                	je     8d0 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     8e1:	e8 cc fa ff ff       	call   3b2 <getpid>
     8e6:	83 ec 08             	sub    $0x8,%esp
     8e9:	83 c3 24             	add    $0x24,%ebx
     8ec:	6a 0e                	push   $0xe
     8ee:	50                   	push   %eax
     8ef:	e8 e6 fa ff ff       	call   3da <sigsend>
     8f4:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     8f7:	81 fb 88 23 00 00    	cmp    $0x2388,%ebx
     8fd:	75 dc                	jne    8db <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     8ff:	e8 2e fa ff ff       	call   332 <exit>
     904:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     90a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000910 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     910:	55                   	push   %ebp
     911:	ba a8 24 00 00       	mov    $0x24a8,%edx
     916:	89 e5                	mov    %esp,%ebp
     918:	90                   	nop
     919:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     920:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     926:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     930:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     936:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     939:	39 d0                	cmp    %edx,%eax
     93b:	75 f3                	jne    930 <init_bsem+0x20>
     93d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     943:	81 fa a8 aa 00 00    	cmp    $0xaaa8,%edx
     949:	75 d5                	jne    920 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     94b:	c7 05 6c 1a 00 00 01 	movl   $0x1,0x1a6c
     952:	00 00 00 
}
     955:	5d                   	pop    %ebp
     956:	c3                   	ret    
     957:	89 f6                	mov    %esi,%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000960 <bsem_alloc>:

int bsem_alloc() {
     960:	55                   	push   %ebp
     961:	89 e5                	mov    %esp,%ebp
     963:	53                   	push   %ebx
     964:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     967:	6a 00                	push   $0x0
     969:	e8 7c fa ff ff       	call   3ea <alarm>
  int i;
  if(first_run_bsem == 0)
     96e:	a1 6c 1a 00 00       	mov    0x1a6c,%eax
     973:	83 c4 10             	add    $0x10,%esp
     976:	85 c0                	test   %eax,%eax
     978:	75 3b                	jne    9b5 <bsem_alloc+0x55>
     97a:	ba a8 24 00 00       	mov    $0x24a8,%edx
     97f:	90                   	nop
     980:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     986:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     98c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     990:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     996:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     999:	39 d0                	cmp    %edx,%eax
     99b:	75 f3                	jne    990 <bsem_alloc+0x30>
     99d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     9a3:	81 fa a8 aa 00 00    	cmp    $0xaaa8,%edx
     9a9:	75 d5                	jne    980 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     9ab:	c7 05 6c 1a 00 00 01 	movl   $0x1,0x1a6c
     9b2:	00 00 00 
     9b5:	ba a8 24 00 00       	mov    $0x24a8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     9ba:	31 c0                	xor    %eax,%eax
     9bc:	eb 10                	jmp    9ce <bsem_alloc+0x6e>
     9be:	83 c0 01             	add    $0x1,%eax
     9c1:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     9c7:	3d 80 00 00 00       	cmp    $0x80,%eax
     9cc:	74 4f                	je     a1d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     9ce:	83 3a 01             	cmpl   $0x1,(%edx)
     9d1:	75 eb                	jne    9be <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     9d3:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     9d9:	8b 15 48 1a 00 00    	mov    0x1a48,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     9df:	83 ec 0c             	sub    $0xc,%esp
     9e2:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     9e4:	8d 98 a0 23 00 00    	lea    0x23a0(%eax),%ebx
     9ea:	89 90 a4 23 00 00    	mov    %edx,0x23a4(%eax)
    binSemCounter++;
     9f0:	83 c2 01             	add    $0x1,%edx
     9f3:	89 15 48 1a 00 00    	mov    %edx,0x1a48
    binSemaphore[i].lock = 1; // not locked
     9f9:	c7 80 a0 23 00 00 01 	movl   $0x1,0x23a0(%eax)
     a00:	00 00 00 
    binSemaphore[i].state = USED;
     a03:	c7 80 a8 24 00 00 00 	movl   $0x0,0x24a8(%eax)
     a0a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a0d:	e8 d8 f9 ff ff       	call   3ea <alarm>
    return binSemaphore[i].id;
     a12:	8b 43 04             	mov    0x4(%ebx),%eax
     a15:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     a18:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a1b:	c9                   	leave  
     a1c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     a1d:	83 ec 08             	sub    $0x8,%esp
     a20:	68 18 13 00 00       	push   $0x1318
     a25:	6a 01                	push   $0x1
     a27:	e8 74 fa ff ff       	call   4a0 <printf>
    alarm(UTHREAD_QUANTA);
     a2c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     a33:	e8 b2 f9 ff ff       	call   3ea <alarm>
    return -1;
     a38:	83 c4 10             	add    $0x10,%esp
     a3b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     a40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a43:	c9                   	leave  
     a44:	c3                   	ret    
     a45:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <bsem_free>:

void bsem_free(int id) {
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	53                   	push   %ebx
     a54:	83 ec 10             	sub    $0x10,%esp
     a57:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a5a:	6a 00                	push   $0x0
     a5c:	e8 89 f9 ff ff       	call   3ea <alarm>
     a61:	ba a4 23 00 00       	mov    $0x23a4,%edx
     a66:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a69:	31 c0                	xor    %eax,%eax
     a6b:	eb 13                	jmp    a80 <bsem_free+0x30>
     a6d:	8d 76 00             	lea    0x0(%esi),%esi
     a70:	83 c0 01             	add    $0x1,%eax
     a73:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     a79:	3d 80 00 00 00       	cmp    $0x80,%eax
     a7e:	74 38                	je     ab8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     a80:	39 1a                	cmp    %ebx,(%edx)
     a82:	75 ec                	jne    a70 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     a84:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     a8a:	05 a0 23 00 00       	add    $0x23a0,%eax
     a8f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     a96:	74 0a                	je     aa2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     a98:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     a9f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     aa2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     aa9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aac:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     aad:	e9 38 f9 ff ff       	jmp    3ea <alarm>
     ab2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     ab8:	83 ec 04             	sub    $0x4,%esp
     abb:	53                   	push   %ebx
     abc:	68 74 14 00 00       	push   $0x1474
     ac1:	6a 01                	push   $0x1
     ac3:	e8 d8 f9 ff ff       	call   4a0 <printf>
     ac8:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     acb:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     ad2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ad5:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     ad6:	e9 0f f9 ff ff       	jmp    3ea <alarm>
     adb:	90                   	nop
     adc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ae0 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	53                   	push   %ebx
     ae4:	83 ec 10             	sub    $0x10,%esp
     ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     aea:	6a 00                	push   $0x0
     aec:	e8 f9 f8 ff ff       	call   3ea <alarm>
     af1:	b8 a4 23 00 00       	mov    $0x23a4,%eax
     af6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     af9:	31 d2                	xor    %edx,%edx
     afb:	eb 17                	jmp    b14 <bsem_down+0x34>
     afd:	8d 76 00             	lea    0x0(%esi),%esi
     b00:	83 c2 01             	add    $0x1,%edx
     b03:	05 0c 01 00 00       	add    $0x10c,%eax
     b08:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     b0e:	0f 84 8c 00 00 00    	je     ba0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     b14:	39 18                	cmp    %ebx,(%eax)
     b16:	75 e8                	jne    b00 <bsem_down+0x20>
     b18:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     b1e:	85 c9                	test   %ecx,%ecx
     b20:	75 de                	jne    b00 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     b22:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     b28:	31 c0                	xor    %eax,%eax
     b2a:	83 b9 a0 23 00 00 01 	cmpl   $0x1,0x23a0(%ecx)
     b31:	75 15                	jne    b48 <bsem_down+0x68>
     b33:	e9 93 00 00 00       	jmp    bcb <bsem_down+0xeb>
     b38:	90                   	nop
     b39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     b40:	83 c0 01             	add    $0x1,%eax
     b43:	83 f8 40             	cmp    $0x40,%eax
     b46:	74 7b                	je     bc3 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     b48:	83 bc 81 a8 23 00 00 	cmpl   $0xffffffff,0x23a8(%ecx,%eax,4)
     b4f:	ff 
     b50:	75 ee                	jne    b40 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     b52:	8b 0d a8 a9 00 00    	mov    0xa9a8,%ecx
     b58:	6b d2 43             	imul   $0x43,%edx,%edx
     b5b:	01 c2                	add    %eax,%edx
     b5d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     b60:	8b 04 85 80 1a 00 00 	mov    0x1a80(,%eax,4),%eax
     b67:	89 04 95 a8 23 00 00 	mov    %eax,0x23a8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     b6e:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     b71:	c7 04 85 88 1a 00 00 	movl   $0x4,0x1a88(,%eax,4)
     b78:	04 00 00 00 

	 sigsend(getpid(),14);
     b7c:	e8 31 f8 ff ff       	call   3b2 <getpid>
     b81:	83 ec 08             	sub    $0x8,%esp
     b84:	6a 0e                	push   $0xe
     b86:	50                   	push   %eax
     b87:	e8 4e f8 ff ff       	call   3da <sigsend>
     b8c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b8f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     b96:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b99:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     b9a:	e9 4b f8 ff ff       	jmp    3ea <alarm>
     b9f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     ba0:	83 ec 04             	sub    $0x4,%esp
     ba3:	53                   	push   %ebx
     ba4:	68 38 13 00 00       	push   $0x1338
     ba9:	6a 01                	push   $0x1
     bab:	e8 f0 f8 ff ff       	call   4a0 <printf>
     bb0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     bb3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     bba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bbd:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bbe:	e9 27 f8 ff ff       	jmp    3ea <alarm>
     bc3:	8b 0d a8 a9 00 00    	mov    0xa9a8,%ecx
     bc9:	eb a3                	jmp    b6e <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     bcb:	c7 81 a0 23 00 00 00 	movl   $0x0,0x23a0(%ecx)
     bd2:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bd5:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     bdc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bdf:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     be0:	e9 05 f8 ff ff       	jmp    3ea <alarm>
     be5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bf0 <bsem_up>:
}

void bsem_up(int id) {
     bf0:	55                   	push   %ebp
     bf1:	89 e5                	mov    %esp,%ebp
     bf3:	57                   	push   %edi
     bf4:	56                   	push   %esi
     bf5:	53                   	push   %ebx
     bf6:	83 ec 28             	sub    $0x28,%esp
     bf9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     bfc:	6a 00                	push   $0x0
     bfe:	e8 e7 f7 ff ff       	call   3ea <alarm>
     c03:	ba a4 23 00 00       	mov    $0x23a4,%edx
     c08:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c0b:	31 c0                	xor    %eax,%eax
     c0d:	eb 15                	jmp    c24 <bsem_up+0x34>
     c0f:	90                   	nop
     c10:	83 c0 01             	add    $0x1,%eax
     c13:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     c19:	3d 80 00 00 00       	cmp    $0x80,%eax
     c1e:	0f 84 ac 00 00 00    	je     cd0 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     c24:	39 1a                	cmp    %ebx,(%edx)
     c26:	75 e8                	jne    c10 <bsem_up+0x20>
     c28:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     c2e:	85 c9                	test   %ecx,%ecx
     c30:	75 de                	jne    c10 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     c32:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     c38:	8b 97 a0 23 00 00    	mov    0x23a0(%edi),%edx
     c3e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     c41:	85 d2                	test   %edx,%edx
     c43:	0f 85 9c 00 00 00    	jne    ce5 <bsem_up+0xf5>
     c49:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     c4b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     c4e:	8b b4 be a8 23 00 00 	mov    0x23a8(%esi,%edi,4),%esi
     c55:	83 fe ff             	cmp    $0xffffffff,%esi
     c58:	74 56                	je     cb0 <bsem_up+0xc0>
     c5a:	b9 80 1a 00 00       	mov    $0x1a80,%ecx
     c5f:	31 d2                	xor    %edx,%edx
     c61:	eb 10                	jmp    c73 <bsem_up+0x83>
     c63:	90                   	nop
     c64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     c68:	83 c2 01             	add    $0x1,%edx
     c6b:	83 c1 24             	add    $0x24,%ecx
     c6e:	83 fa 40             	cmp    $0x40,%edx
     c71:	74 3d                	je     cb0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     c73:	8b 19                	mov    (%ecx),%ebx
     c75:	39 de                	cmp    %ebx,%esi
     c77:	75 ef                	jne    c68 <bsem_up+0x78>
     c79:	83 fb ff             	cmp    $0xffffffff,%ebx
     c7c:	74 ea                	je     c68 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     c7e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     c81:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     c84:	c7 04 95 88 1a 00 00 	movl   $0x2,0x1a88(,%edx,4)
     c8b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     c8f:	01 c7                	add    %eax,%edi
     c91:	c7 04 bd a8 23 00 00 	movl   $0xffffffff,0x23a8(,%edi,4)
     c98:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     c9c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     ca3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ca6:	5b                   	pop    %ebx
     ca7:	5e                   	pop    %esi
     ca8:	5f                   	pop    %edi
     ca9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     caa:	e9 3b f7 ff ff       	jmp    3ea <alarm>
     caf:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     cb0:	83 c7 01             	add    $0x1,%edi
     cb3:	83 ff 40             	cmp    $0x40,%edi
     cb6:	75 93                	jne    c4b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     cb8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     cbe:	c7 80 a0 23 00 00 01 	movl   $0x1,0x23a0(%eax)
     cc5:	00 00 00 
     cc8:	eb d2                	jmp    c9c <bsem_up+0xac>
     cca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     cd0:	83 ec 04             	sub    $0x4,%esp
     cd3:	53                   	push   %ebx
     cd4:	68 a0 13 00 00       	push   $0x13a0
     cd9:	6a 01                	push   $0x1
     cdb:	e8 c0 f7 ff ff       	call   4a0 <printf>
     ce0:	83 c4 10             	add    $0x10,%esp
     ce3:	eb b7                	jmp    c9c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     ce5:	83 ec 08             	sub    $0x8,%esp
     ce8:	68 7c 13 00 00       	push   $0x137c
     ced:	6a 01                	push   $0x1
     cef:	e8 ac f7 ff ff       	call   4a0 <printf>
     cf4:	83 c4 10             	add    $0x10,%esp
     cf7:	eb a3                	jmp    c9c <bsem_up+0xac>
     cf9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d00 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     d00:	55                   	push   %ebp
     d01:	89 e5                	mov    %esp,%ebp
     d03:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     d06:	68 e4 13 00 00       	push   $0x13e4
     d0b:	6a 01                	push   $0x1
     d0d:	e8 8e f7 ff ff       	call   4a0 <printf>
     d12:	b8 80 1a 00 00       	mov    $0x1a80,%eax
     d17:	83 c4 10             	add    $0x10,%esp
     d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     d20:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     d26:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     d2d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     d30:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     d37:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     d3e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     d45:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     d4c:	3d 80 23 00 00       	cmp    $0x2380,%eax
     d51:	75 cd                	jne    d20 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d53:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     d56:	c7 05 80 1a 00 00 00 	movl   $0x0,0x1a80
     d5d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     d60:	c7 05 88 1a 00 00 03 	movl   $0x3,0x1a88
     d67:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d6a:	68 00 0f 00 00       	push   $0xf00
     d6f:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     d71:	c7 05 84 1a 00 00 00 	movl   $0x0,0x1a84
     d78:	00 00 00 

  id_number_thread = 1;
     d7b:	c7 05 a4 a9 00 00 01 	movl   $0x1,0xa9a4
     d82:	00 00 00 
  index_currently_running = 0;
     d85:	c7 05 a8 a9 00 00 00 	movl   $0x0,0xa9a8
     d8c:	00 00 00 
  currently_running = 0;
     d8f:	c7 05 80 23 00 00 00 	movl   $0x0,0x2380
     d96:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d99:	e8 34 f6 ff ff       	call   3d2 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     d9e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     da5:	e8 40 f6 ff ff       	call   3ea <alarm>
  return 0;
}
     daa:	31 c0                	xor    %eax,%eax
     dac:	c9                   	leave  
     dad:	c3                   	ret    
     dae:	66 90                	xchg   %ax,%ax

00000db0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     db0:	55                   	push   %ebp
     db1:	89 e5                	mov    %esp,%ebp
     db3:	56                   	push   %esi
     db4:	53                   	push   %ebx
  alarm(0);
     db5:	83 ec 0c             	sub    $0xc,%esp
     db8:	6a 00                	push   $0x0
     dba:	e8 2b f6 ff ff       	call   3ea <alarm>
  printf(1, "------ creating a new thread ------\n");
     dbf:	5b                   	pop    %ebx
     dc0:	5e                   	pop    %esi
     dc1:	68 10 14 00 00       	push   $0x1410
     dc6:	6a 01                	push   $0x1
     dc8:	e8 d3 f6 ff ff       	call   4a0 <printf>
     dcd:	ba 88 1a 00 00       	mov    $0x1a88,%edx
     dd2:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     dd5:	31 c0                	xor    %eax,%eax
     dd7:	eb 12                	jmp    deb <uthread_create+0x3b>
     dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     de0:	83 c0 01             	add    $0x1,%eax
     de3:	83 c2 24             	add    $0x24,%edx
     de6:	83 f8 40             	cmp    $0x40,%eax
     de9:	74 7d                	je     e68 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     deb:	8b 0a                	mov    (%edx),%ecx
     ded:	85 c9                	test   %ecx,%ecx
     def:	75 ef                	jne    de0 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     df1:	8b 15 a4 a9 00 00    	mov    0xa9a4,%edx
     df7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     dfa:	83 ec 0c             	sub    $0xc,%esp
     dfd:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e02:	c1 e3 02             	shl    $0x2,%ebx
     e05:	89 93 80 1a 00 00    	mov    %edx,0x1a80(%ebx)
  id_number_thread++;
     e0b:	83 c2 01             	add    $0x1,%edx
     e0e:	89 15 a4 a9 00 00    	mov    %edx,0xa9a4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e14:	e8 b7 f8 ff ff       	call   6d0 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e19:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     e1c:	c7 80 f4 0f 00 00 00 	movl   $0x800,0xff4(%eax)
     e23:	08 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e26:	89 83 84 1a 00 00    	mov    %eax,0x1a84(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     e2c:	c7 83 88 1a 00 00 02 	movl   $0x2,0x1a88(%ebx)
     e33:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e36:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     e3c:	8b 55 0c             	mov    0xc(%ebp),%edx
     e3f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     e45:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e4c:	e8 99 f5 ff ff       	call   3ea <alarm>
  return   threads[free_thread].thread_id;
     e51:	8b 83 80 1a 00 00    	mov    0x1a80(%ebx),%eax
     e57:	83 c4 10             	add    $0x10,%esp
}
     e5a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e5d:	5b                   	pop    %ebx
     e5e:	5e                   	pop    %esi
     e5f:	5d                   	pop    %ebp
     e60:	c3                   	ret    
     e61:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     e68:	83 ec 08             	sub    $0x8,%esp
     e6b:	68 86 14 00 00       	push   $0x1486
     e70:	6a 01                	push   $0x1
     e72:	e8 29 f6 ff ff       	call   4a0 <printf>
    alarm(UTHREAD_QUANTA);
     e77:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e7e:	e8 67 f5 ff ff       	call   3ea <alarm>
    return -1;
     e83:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e86:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     e89:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     e8e:	5b                   	pop    %ebx
     e8f:	5e                   	pop    %esi
     e90:	5d                   	pop    %ebp
     e91:	c3                   	ret    
     e92:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ea0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     ea0:	55                   	push   %ebp
     ea1:	89 e5                	mov    %esp,%ebp
     ea3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     ea6:	85 c0                	test   %eax,%eax
     ea8:	74 14                	je     ebe <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     eaa:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     ead:	89 e2                	mov    %esp,%edx
     eaf:	8d 04 85 80 1a 00 00 	lea    0x1a80(,%eax,4),%eax
     eb6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     eb9:	89 ea                	mov    %ebp,%edx
     ebb:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     ebe:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
     ec3:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     ec6:	8d 04 85 80 1a 00 00 	lea    0x1a80(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     ecd:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     ed0:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     ed7:	85 d2                	test   %edx,%edx
     ed9:	74 0d                	je     ee8 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     edb:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     edd:	8b 40 0c             	mov    0xc(%eax),%eax
     ee0:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     ee2:	5d                   	pop    %ebp
     ee3:	c3                   	ret    
     ee4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     ee8:	8b 40 04             	mov    0x4(%eax),%eax
     eeb:	05 f4 0f 00 00       	add    $0xff4,%eax
     ef0:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     ef2:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     ef4:	b8 c0 07 00 00       	mov    $0x7c0,%eax
     ef9:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     efb:	5d                   	pop    %ebp
     efc:	c3                   	ret    
     efd:	8d 76 00             	lea    0x0(%esi),%esi

00000f00 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     f00:	55                   	push   %ebp
     f01:	89 e5                	mov    %esp,%ebp
     f03:	56                   	push   %esi
     f04:	53                   	push   %ebx
     f05:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     f08:	83 ec 0c             	sub    $0xc,%esp
     f0b:	6a 00                	push   $0x0
     f0d:	e8 d8 f4 ff ff       	call   3ea <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     f12:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
     f17:	83 c4 10             	add    $0x10,%esp
     f1a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     f1d:	8d 14 95 80 1a 00 00 	lea    0x1a80(,%edx,4),%edx
     f24:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     f28:	75 0b                	jne    f35 <uthread_schedule+0x35>
     f2a:	85 c0                	test   %eax,%eax
     f2c:	74 07                	je     f35 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     f2e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     f35:	bb 88 1a 00 00       	mov    $0x1a88,%ebx
     f3a:	eb 0f                	jmp    f4b <uthread_schedule+0x4b>
     f3c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f40:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f43:	81 fb 88 23 00 00    	cmp    $0x2388,%ebx
     f49:	74 55                	je     fa0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f4b:	83 3b 01             	cmpl   $0x1,(%ebx)
     f4e:	75 f0                	jne    f40 <uthread_schedule+0x40>
     f50:	8b 73 14             	mov    0x14(%ebx),%esi
     f53:	85 f6                	test   %esi,%esi
     f55:	0f 85 a5 00 00 00    	jne    1000 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     f5b:	8b 43 18             	mov    0x18(%ebx),%eax
     f5e:	83 f8 ff             	cmp    $0xffffffff,%eax
     f61:	74 dd                	je     f40 <uthread_schedule+0x40>
     f63:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     f66:	8b 14 95 88 1a 00 00 	mov    0x1a88(,%edx,4),%edx
     f6d:	85 d2                	test   %edx,%edx
     f6f:	75 cf                	jne    f40 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     f71:	50                   	push   %eax
     f72:	ff 73 f8             	pushl  -0x8(%ebx)
     f75:	83 c3 24             	add    $0x24,%ebx
     f78:	68 38 14 00 00       	push   $0x1438
     f7d:	6a 01                	push   $0x1
     f7f:	e8 1c f5 ff ff       	call   4a0 <printf>
      threads[i].join = -1;
     f84:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     f8b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     f92:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f95:	81 fb 88 23 00 00    	cmp    $0x2388,%ebx
     f9b:	75 ae                	jne    f4b <uthread_schedule+0x4b>
     f9d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     fa0:	8b 15 a8 a9 00 00    	mov    0xa9a8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     fa6:	b9 40 00 00 00       	mov    $0x40,%ecx
     fab:	8d 42 01             	lea    0x1(%edx),%eax
     fae:	eb 08                	jmp    fb8 <uthread_schedule+0xb8>
     fb0:	83 c0 01             	add    $0x1,%eax
     fb3:	83 e9 01             	sub    $0x1,%ecx
     fb6:	74 78                	je     1030 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     fb8:	89 c3                	mov    %eax,%ebx
     fba:	c1 fb 1f             	sar    $0x1f,%ebx
     fbd:	c1 eb 1a             	shr    $0x1a,%ebx
     fc0:	01 d8                	add    %ebx,%eax
     fc2:	83 e0 3f             	and    $0x3f,%eax
     fc5:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     fc7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     fca:	83 3c 9d 88 1a 00 00 	cmpl   $0x2,0x1a88(,%ebx,4)
     fd1:	02 
     fd2:	75 dc                	jne    fb0 <uthread_schedule+0xb0>
     fd4:	39 c2                	cmp    %eax,%edx
     fd6:	74 d8                	je     fb0 <uthread_schedule+0xb0>
      index_currently_running = i;
     fd8:	a3 a8 a9 00 00       	mov    %eax,0xa9a8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     fdd:	83 ec 08             	sub    $0x8,%esp
     fe0:	50                   	push   %eax
     fe1:	52                   	push   %edx
     fe2:	e8 b9 fe ff ff       	call   ea0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
     fe7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     fee:	e8 f7 f3 ff ff       	call   3ea <alarm>
}
     ff3:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ff6:	5b                   	pop    %ebx
     ff7:	5e                   	pop    %esi
     ff8:	5d                   	pop    %ebp
     ff9:	c3                   	ret    
     ffa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1000:	e8 c5 f3 ff ff       	call   3ca <uptime>
    1005:	39 c6                	cmp    %eax,%esi
    1007:	7f 17                	jg     1020 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1009:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    100f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1016:	e9 25 ff ff ff       	jmp    f40 <uthread_schedule+0x40>
    101b:	90                   	nop
    101c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1020:	83 3b 01             	cmpl   $0x1,(%ebx)
    1023:	0f 84 32 ff ff ff    	je     f5b <uthread_schedule+0x5b>
    1029:	e9 12 ff ff ff       	jmp    f40 <uthread_schedule+0x40>
    102e:	66 90                	xchg   %ax,%ax
    1030:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1033:	83 3c 85 88 1a 00 00 	cmpl   $0x2,0x1a88(,%eax,4)
    103a:	02 
    103b:	0f 85 c7 fe ff ff    	jne    f08 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1041:	89 d0                	mov    %edx,%eax
    1043:	eb 98                	jmp    fdd <uthread_schedule+0xdd>
    1045:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001050 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1050:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
  exit();
}

int
uthread_self()
{
    1055:	55                   	push   %ebp
    1056:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    1058:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    105b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    105c:	8b 04 85 80 1a 00 00 	mov    0x1a80(,%eax,4),%eax
}
    1063:	c3                   	ret    
    1064:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    106a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001070 <uthread_join>:

int
uthread_join(int tid)
{
    1070:	55                   	push   %ebp
    1071:	89 e5                	mov    %esp,%ebp
    1073:	56                   	push   %esi
    1074:	53                   	push   %ebx
    1075:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1078:	39 35 a4 a9 00 00    	cmp    %esi,0xa9a4
    107e:	0f 8c ab 00 00 00    	jl     112f <uthread_join+0xbf>
    1084:	89 f0                	mov    %esi,%eax
    1086:	c1 e8 1f             	shr    $0x1f,%eax
    1089:	84 c0                	test   %al,%al
    108b:	0f 85 9e 00 00 00    	jne    112f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1091:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1094:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1096:	6a 00                	push   $0x0
    1098:	e8 4d f3 ff ff       	call   3ea <alarm>
    109d:	b8 80 1a 00 00       	mov    $0x1a80,%eax
    10a2:	83 c4 10             	add    $0x10,%esp
    10a5:	eb 14                	jmp    10bb <uthread_join+0x4b>
    10a7:	89 f6                	mov    %esi,%esi
    10a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    10b0:	83 c3 01             	add    $0x1,%ebx
    10b3:	83 c0 24             	add    $0x24,%eax
    10b6:	83 fb 40             	cmp    $0x40,%ebx
    10b9:	74 55                	je     1110 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    10bb:	3b 30                	cmp    (%eax),%esi
    10bd:	75 f1                	jne    10b0 <uthread_join+0x40>
    10bf:	8b 50 08             	mov    0x8(%eax),%edx
    10c2:	85 d2                	test   %edx,%edx
    10c4:	74 ea                	je     10b0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    10c6:	53                   	push   %ebx
    10c7:	ff 35 a8 a9 00 00    	pushl  0xa9a8
    10cd:	68 c2 14 00 00       	push   $0x14c2
    10d2:	6a 01                	push   $0x1
    10d4:	e8 c7 f3 ff ff       	call   4a0 <printf>
    threads[index_currently_running].join=found_tid;
    10d9:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
    10de:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10e1:	8d 04 85 80 1a 00 00 	lea    0x1a80(,%eax,4),%eax
    10e8:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    10eb:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    10f2:	e8 bb f2 ff ff       	call   3b2 <getpid>
    10f7:	5a                   	pop    %edx
    10f8:	59                   	pop    %ecx
    10f9:	6a 0e                	push   $0xe
    10fb:	50                   	push   %eax
    10fc:	e8 d9 f2 ff ff       	call   3da <sigsend>
  }
  return 0;
    1101:	83 c4 10             	add    $0x10,%esp

}
    1104:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1107:	31 c0                	xor    %eax,%eax

}
    1109:	5b                   	pop    %ebx
    110a:	5e                   	pop    %esi
    110b:	5d                   	pop    %ebp
    110c:	c3                   	ret    
    110d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1110:	83 ec 04             	sub    $0x4,%esp
    1113:	56                   	push   %esi
    1114:	68 a4 14 00 00       	push   $0x14a4
    1119:	6a 01                	push   $0x1
    111b:	e8 80 f3 ff ff       	call   4a0 <printf>
    alarm(UTHREAD_QUANTA);
    1120:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1127:	e8 be f2 ff ff       	call   3ea <alarm>
    return -1;
    112c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    112f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1132:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1137:	5b                   	pop    %ebx
    1138:	5e                   	pop    %esi
    1139:	5d                   	pop    %ebp
    113a:	c3                   	ret    
    113b:	90                   	nop
    113c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001140 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1140:	55                   	push   %ebp
    1141:	89 e5                	mov    %esp,%ebp
    1143:	53                   	push   %ebx
    1144:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1147:	6a 00                	push   $0x0
    1149:	e8 9c f2 ff ff       	call   3ea <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    114e:	8b 1d a8 a9 00 00    	mov    0xa9a8,%ebx
    1154:	e8 71 f2 ff ff       	call   3ca <uptime>
    1159:	03 45 08             	add    0x8(%ebp),%eax
    115c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    115f:	89 04 95 9c 1a 00 00 	mov    %eax,0x1a9c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    1166:	a1 a8 a9 00 00       	mov    0xa9a8,%eax
    116b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    116e:	c7 04 85 88 1a 00 00 	movl   $0x1,0x1a88(,%eax,4)
    1175:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1179:	e8 34 f2 ff ff       	call   3b2 <getpid>
    117e:	5a                   	pop    %edx
    117f:	59                   	pop    %ecx
    1180:	6a 0e                	push   $0xe
    1182:	50                   	push   %eax
    1183:	e8 52 f2 ff ff       	call   3da <sigsend>
  return 0;
}
    1188:	31 c0                	xor    %eax,%eax
    118a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    118d:	c9                   	leave  
    118e:	c3                   	ret    
    118f:	90                   	nop

00001190 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	53                   	push   %ebx
    1194:	83 ec 04             	sub    $0x4,%esp
    1197:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    119a:	8b 45 0c             	mov    0xc(%ebp),%eax
    119d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    11a0:	e8 bb f7 ff ff       	call   960 <bsem_alloc>
    11a5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    11a7:	e8 b4 f7 ff ff       	call   960 <bsem_alloc>
    11ac:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    11af:	83 c4 04             	add    $0x4,%esp
    11b2:	5b                   	pop    %ebx
    11b3:	5d                   	pop    %ebp
    11b4:	c3                   	ret    
    11b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011c0 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    11c0:	55                   	push   %ebp
    11c1:	89 e5                	mov    %esp,%ebp
    11c3:	53                   	push   %ebx
    11c4:	83 ec 10             	sub    $0x10,%esp
    11c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    11ca:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    11d1:	ff 33                	pushl  (%ebx)
    11d3:	e8 78 f8 ff ff       	call   a50 <bsem_free>
  bsem_free(csem->bsem_2_id);
    11d8:	8b 43 04             	mov    0x4(%ebx),%eax
    11db:	83 c4 10             	add    $0x10,%esp
}
    11de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    11e1:	89 45 08             	mov    %eax,0x8(%ebp)
}
    11e4:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    11e5:	e9 66 f8 ff ff       	jmp    a50 <bsem_free>
    11ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

000011f0 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	83 ec 10             	sub    $0x10,%esp
    11f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    11fa:	ff 73 04             	pushl  0x4(%ebx)
    11fd:	e8 de f8 ff ff       	call   ae0 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1202:	58                   	pop    %eax
    1203:	ff 33                	pushl  (%ebx)
    1205:	e8 d6 f8 ff ff       	call   ae0 <bsem_down>
  csem->value--;
    120a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    120d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1210:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1213:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1215:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1218:	7e 0e                	jle    1228 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    121a:	83 ec 0c             	sub    $0xc,%esp
    121d:	ff 73 04             	pushl  0x4(%ebx)
    1220:	e8 cb f9 ff ff       	call   bf0 <bsem_up>
    1225:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1228:	8b 03                	mov    (%ebx),%eax
}
    122a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    122d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1230:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1231:	e9 ba f9 ff ff       	jmp    bf0 <bsem_up>
    1236:	8d 76 00             	lea    0x0(%esi),%esi
    1239:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001240 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	83 ec 10             	sub    $0x10,%esp
    1247:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    124a:	ff 33                	pushl  (%ebx)
    124c:	e8 8f f8 ff ff       	call   ae0 <bsem_down>
  csem->value++;
    1251:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1254:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1257:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    125a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    125d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1260:	74 0e                	je     1270 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1262:	8b 03                	mov    (%ebx),%eax
}
    1264:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1267:	89 45 08             	mov    %eax,0x8(%ebp)
}
    126a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    126b:	e9 80 f9 ff ff       	jmp    bf0 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1270:	83 ec 0c             	sub    $0xc,%esp
    1273:	ff 73 04             	pushl  0x4(%ebx)
    1276:	e8 75 f9 ff ff       	call   bf0 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    127b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    127d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1280:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1283:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1286:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1287:	e9 64 f9 ff ff       	jmp    bf0 <bsem_up>
