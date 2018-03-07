
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  }
}

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
      11:	be 01 00 00 00       	mov    $0x1,%esi
      16:	83 ec 18             	sub    $0x18,%esp
      19:	8b 01                	mov    (%ecx),%eax
      1b:	8b 59 04             	mov    0x4(%ecx),%ebx
      1e:	83 c3 04             	add    $0x4,%ebx
  int fd, i;

  if(argc <= 1){
      21:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
      24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
      27:	7e 54                	jle    7d <main+0x7d>
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      30:	83 ec 08             	sub    $0x8,%esp
      33:	6a 00                	push   $0x0
      35:	ff 33                	pushl  (%ebx)
      37:	e8 56 03 00 00       	call   392 <open>
      3c:	83 c4 10             	add    $0x10,%esp
      3f:	85 c0                	test   %eax,%eax
      41:	89 c7                	mov    %eax,%edi
      43:	78 24                	js     69 <main+0x69>
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
      45:	83 ec 0c             	sub    $0xc,%esp
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
      48:	83 c6 01             	add    $0x1,%esi
      4b:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      exit();
    }
    cat(fd);
      4e:	50                   	push   %eax
      4f:	e8 3c 00 00 00       	call   90 <cat>
    close(fd);
      54:	89 3c 24             	mov    %edi,(%esp)
      57:	e8 1e 03 00 00       	call   37a <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
      5c:	83 c4 10             	add    $0x10,%esp
      5f:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      62:	75 cc                	jne    30 <main+0x30>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
      64:	e8 e9 02 00 00       	call   352 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "cat: cannot open %s\n", argv[i]);
      69:	50                   	push   %eax
      6a:	ff 33                	pushl  (%ebx)
      6c:	68 cf 12 00 00       	push   $0x12cf
      71:	6a 01                	push   $0x1
      73:	e8 48 04 00 00       	call   4c0 <printf>
      exit();
      78:	e8 d5 02 00 00       	call   352 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    cat(0);
      7d:	83 ec 0c             	sub    $0xc,%esp
      80:	6a 00                	push   $0x0
      82:	e8 09 00 00 00       	call   90 <cat>
    exit();
      87:	e8 c6 02 00 00       	call   352 <exit>
      8c:	66 90                	xchg   %ax,%ax
      8e:	66 90                	xchg   %ax,%ax

00000090 <cat>:

char buf[512];

void
cat(int fd)
{
      90:	55                   	push   %ebp
      91:	89 e5                	mov    %esp,%ebp
      93:	56                   	push   %esi
      94:	53                   	push   %ebx
      95:	8b 75 08             	mov    0x8(%ebp),%esi
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
      98:	eb 1d                	jmp    b7 <cat+0x27>
      9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    if (write(1, buf, n) != n) {
      a0:	83 ec 04             	sub    $0x4,%esp
      a3:	53                   	push   %ebx
      a4:	68 a0 1a 00 00       	push   $0x1aa0
      a9:	6a 01                	push   $0x1
      ab:	e8 c2 02 00 00       	call   372 <write>
      b0:	83 c4 10             	add    $0x10,%esp
      b3:	39 c3                	cmp    %eax,%ebx
      b5:	75 26                	jne    dd <cat+0x4d>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
      b7:	83 ec 04             	sub    $0x4,%esp
      ba:	68 00 02 00 00       	push   $0x200
      bf:	68 a0 1a 00 00       	push   $0x1aa0
      c4:	56                   	push   %esi
      c5:	e8 a0 02 00 00       	call   36a <read>
      ca:	83 c4 10             	add    $0x10,%esp
      cd:	83 f8 00             	cmp    $0x0,%eax
      d0:	89 c3                	mov    %eax,%ebx
      d2:	7f cc                	jg     a0 <cat+0x10>
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      exit();
    }
  }
  if(n < 0){
      d4:	75 1b                	jne    f1 <cat+0x61>
    printf(1, "cat: read error\n");
    exit();
  }
}
      d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
      d9:	5b                   	pop    %ebx
      da:	5e                   	pop    %esi
      db:	5d                   	pop    %ebp
      dc:	c3                   	ret    
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0) {
    if (write(1, buf, n) != n) {
      printf(1, "cat: write error\n");
      dd:	83 ec 08             	sub    $0x8,%esp
      e0:	68 ac 12 00 00       	push   $0x12ac
      e5:	6a 01                	push   $0x1
      e7:	e8 d4 03 00 00       	call   4c0 <printf>
      exit();
      ec:	e8 61 02 00 00       	call   352 <exit>
    }
  }
  if(n < 0){
    printf(1, "cat: read error\n");
      f1:	83 ec 08             	sub    $0x8,%esp
      f4:	68 be 12 00 00       	push   $0x12be
      f9:	6a 01                	push   $0x1
      fb:	e8 c0 03 00 00       	call   4c0 <printf>
    exit();
     100:	e8 4d 02 00 00       	call   352 <exit>
     105:	66 90                	xchg   %ax,%ax
     107:	66 90                	xchg   %ax,%ax
     109:	66 90                	xchg   %ax,%ax
     10b:	66 90                	xchg   %ax,%ax
     10d:	66 90                	xchg   %ax,%ax
     10f:	90                   	nop

00000110 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	53                   	push   %ebx
     114:	8b 45 08             	mov    0x8(%ebp),%eax
     117:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     11a:	89 c2                	mov    %eax,%edx
     11c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     120:	83 c1 01             	add    $0x1,%ecx
     123:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     127:	83 c2 01             	add    $0x1,%edx
     12a:	84 db                	test   %bl,%bl
     12c:	88 5a ff             	mov    %bl,-0x1(%edx)
     12f:	75 ef                	jne    120 <strcpy+0x10>
    ;
  return os;
}
     131:	5b                   	pop    %ebx
     132:	5d                   	pop    %ebp
     133:	c3                   	ret    
     134:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     13a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000140 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     140:	55                   	push   %ebp
     141:	89 e5                	mov    %esp,%ebp
     143:	56                   	push   %esi
     144:	53                   	push   %ebx
     145:	8b 55 08             	mov    0x8(%ebp),%edx
     148:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     14b:	0f b6 02             	movzbl (%edx),%eax
     14e:	0f b6 19             	movzbl (%ecx),%ebx
     151:	84 c0                	test   %al,%al
     153:	75 1e                	jne    173 <strcmp+0x33>
     155:	eb 29                	jmp    180 <strcmp+0x40>
     157:	89 f6                	mov    %esi,%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     160:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     163:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     166:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     169:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     16d:	84 c0                	test   %al,%al
     16f:	74 0f                	je     180 <strcmp+0x40>
     171:	89 f1                	mov    %esi,%ecx
     173:	38 d8                	cmp    %bl,%al
     175:	74 e9                	je     160 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     177:	29 d8                	sub    %ebx,%eax
}
     179:	5b                   	pop    %ebx
     17a:	5e                   	pop    %esi
     17b:	5d                   	pop    %ebp
     17c:	c3                   	ret    
     17d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     180:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     182:	29 d8                	sub    %ebx,%eax
}
     184:	5b                   	pop    %ebx
     185:	5e                   	pop    %esi
     186:	5d                   	pop    %ebp
     187:	c3                   	ret    
     188:	90                   	nop
     189:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000190 <strlen>:

uint
strlen(char *s)
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     196:	80 39 00             	cmpb   $0x0,(%ecx)
     199:	74 12                	je     1ad <strlen+0x1d>
     19b:	31 d2                	xor    %edx,%edx
     19d:	8d 76 00             	lea    0x0(%esi),%esi
     1a0:	83 c2 01             	add    $0x1,%edx
     1a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     1a7:	89 d0                	mov    %edx,%eax
     1a9:	75 f5                	jne    1a0 <strlen+0x10>
    ;
  return n;
}
     1ab:	5d                   	pop    %ebp
     1ac:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     1ad:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     1af:	5d                   	pop    %ebp
     1b0:	c3                   	ret    
     1b1:	eb 0d                	jmp    1c0 <memset>
     1b3:	90                   	nop
     1b4:	90                   	nop
     1b5:	90                   	nop
     1b6:	90                   	nop
     1b7:	90                   	nop
     1b8:	90                   	nop
     1b9:	90                   	nop
     1ba:	90                   	nop
     1bb:	90                   	nop
     1bc:	90                   	nop
     1bd:	90                   	nop
     1be:	90                   	nop
     1bf:	90                   	nop

000001c0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	57                   	push   %edi
     1c4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     1c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     1ca:	8b 45 0c             	mov    0xc(%ebp),%eax
     1cd:	89 d7                	mov    %edx,%edi
     1cf:	fc                   	cld    
     1d0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     1d2:	89 d0                	mov    %edx,%eax
     1d4:	5f                   	pop    %edi
     1d5:	5d                   	pop    %ebp
     1d6:	c3                   	ret    
     1d7:	89 f6                	mov    %esi,%esi
     1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <strchr>:

char*
strchr(const char *s, char c)
{
     1e0:	55                   	push   %ebp
     1e1:	89 e5                	mov    %esp,%ebp
     1e3:	53                   	push   %ebx
     1e4:	8b 45 08             	mov    0x8(%ebp),%eax
     1e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     1ea:	0f b6 10             	movzbl (%eax),%edx
     1ed:	84 d2                	test   %dl,%dl
     1ef:	74 1d                	je     20e <strchr+0x2e>
    if(*s == c)
     1f1:	38 d3                	cmp    %dl,%bl
     1f3:	89 d9                	mov    %ebx,%ecx
     1f5:	75 0d                	jne    204 <strchr+0x24>
     1f7:	eb 17                	jmp    210 <strchr+0x30>
     1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     200:	38 ca                	cmp    %cl,%dl
     202:	74 0c                	je     210 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     204:	83 c0 01             	add    $0x1,%eax
     207:	0f b6 10             	movzbl (%eax),%edx
     20a:	84 d2                	test   %dl,%dl
     20c:	75 f2                	jne    200 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     20e:	31 c0                	xor    %eax,%eax
}
     210:	5b                   	pop    %ebx
     211:	5d                   	pop    %ebp
     212:	c3                   	ret    
     213:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     219:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000220 <gets>:

char*
gets(char *buf, int max)
{
     220:	55                   	push   %ebp
     221:	89 e5                	mov    %esp,%ebp
     223:	57                   	push   %edi
     224:	56                   	push   %esi
     225:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     226:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     228:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     22b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     22e:	eb 29                	jmp    259 <gets+0x39>
    cc = read(0, &c, 1);
     230:	83 ec 04             	sub    $0x4,%esp
     233:	6a 01                	push   $0x1
     235:	57                   	push   %edi
     236:	6a 00                	push   $0x0
     238:	e8 2d 01 00 00       	call   36a <read>
    if(cc < 1)
     23d:	83 c4 10             	add    $0x10,%esp
     240:	85 c0                	test   %eax,%eax
     242:	7e 1d                	jle    261 <gets+0x41>
      break;
    buf[i++] = c;
     244:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     248:	8b 55 08             	mov    0x8(%ebp),%edx
     24b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     24d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     24f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     253:	74 1b                	je     270 <gets+0x50>
     255:	3c 0d                	cmp    $0xd,%al
     257:	74 17                	je     270 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     259:	8d 5e 01             	lea    0x1(%esi),%ebx
     25c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     25f:	7c cf                	jl     230 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     261:	8b 45 08             	mov    0x8(%ebp),%eax
     264:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     268:	8d 65 f4             	lea    -0xc(%ebp),%esp
     26b:	5b                   	pop    %ebx
     26c:	5e                   	pop    %esi
     26d:	5f                   	pop    %edi
     26e:	5d                   	pop    %ebp
     26f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     270:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     273:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     275:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     279:	8d 65 f4             	lea    -0xc(%ebp),%esp
     27c:	5b                   	pop    %ebx
     27d:	5e                   	pop    %esi
     27e:	5f                   	pop    %edi
     27f:	5d                   	pop    %ebp
     280:	c3                   	ret    
     281:	eb 0d                	jmp    290 <stat>
     283:	90                   	nop
     284:	90                   	nop
     285:	90                   	nop
     286:	90                   	nop
     287:	90                   	nop
     288:	90                   	nop
     289:	90                   	nop
     28a:	90                   	nop
     28b:	90                   	nop
     28c:	90                   	nop
     28d:	90                   	nop
     28e:	90                   	nop
     28f:	90                   	nop

00000290 <stat>:

int
stat(char *n, struct stat *st)
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	56                   	push   %esi
     294:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     295:	83 ec 08             	sub    $0x8,%esp
     298:	6a 00                	push   $0x0
     29a:	ff 75 08             	pushl  0x8(%ebp)
     29d:	e8 f0 00 00 00       	call   392 <open>
  if(fd < 0)
     2a2:	83 c4 10             	add    $0x10,%esp
     2a5:	85 c0                	test   %eax,%eax
     2a7:	78 27                	js     2d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     2a9:	83 ec 08             	sub    $0x8,%esp
     2ac:	ff 75 0c             	pushl  0xc(%ebp)
     2af:	89 c3                	mov    %eax,%ebx
     2b1:	50                   	push   %eax
     2b2:	e8 f3 00 00 00       	call   3aa <fstat>
     2b7:	89 c6                	mov    %eax,%esi
  close(fd);
     2b9:	89 1c 24             	mov    %ebx,(%esp)
     2bc:	e8 b9 00 00 00       	call   37a <close>
  return r;
     2c1:	83 c4 10             	add    $0x10,%esp
     2c4:	89 f0                	mov    %esi,%eax
}
     2c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2c9:	5b                   	pop    %ebx
     2ca:	5e                   	pop    %esi
     2cb:	5d                   	pop    %ebp
     2cc:	c3                   	ret    
     2cd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     2d0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     2d5:	eb ef                	jmp    2c6 <stat+0x36>
     2d7:	89 f6                	mov    %esi,%esi
     2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	53                   	push   %ebx
     2e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     2e7:	0f be 11             	movsbl (%ecx),%edx
     2ea:	8d 42 d0             	lea    -0x30(%edx),%eax
     2ed:	3c 09                	cmp    $0x9,%al
     2ef:	b8 00 00 00 00       	mov    $0x0,%eax
     2f4:	77 1f                	ja     315 <atoi+0x35>
     2f6:	8d 76 00             	lea    0x0(%esi),%esi
     2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     300:	8d 04 80             	lea    (%eax,%eax,4),%eax
     303:	83 c1 01             	add    $0x1,%ecx
     306:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     30a:	0f be 11             	movsbl (%ecx),%edx
     30d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     310:	80 fb 09             	cmp    $0x9,%bl
     313:	76 eb                	jbe    300 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     315:	5b                   	pop    %ebx
     316:	5d                   	pop    %ebp
     317:	c3                   	ret    
     318:	90                   	nop
     319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000320 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	56                   	push   %esi
     324:	53                   	push   %ebx
     325:	8b 5d 10             	mov    0x10(%ebp),%ebx
     328:	8b 45 08             	mov    0x8(%ebp),%eax
     32b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     32e:	85 db                	test   %ebx,%ebx
     330:	7e 14                	jle    346 <memmove+0x26>
     332:	31 d2                	xor    %edx,%edx
     334:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     338:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     33c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     33f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     342:	39 da                	cmp    %ebx,%edx
     344:	75 f2                	jne    338 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     346:	5b                   	pop    %ebx
     347:	5e                   	pop    %esi
     348:	5d                   	pop    %ebp
     349:	c3                   	ret    

0000034a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     34a:	b8 01 00 00 00       	mov    $0x1,%eax
     34f:	cd 40                	int    $0x40
     351:	c3                   	ret    

00000352 <exit>:
SYSCALL(exit)
     352:	b8 02 00 00 00       	mov    $0x2,%eax
     357:	cd 40                	int    $0x40
     359:	c3                   	ret    

0000035a <wait>:
SYSCALL(wait)
     35a:	b8 03 00 00 00       	mov    $0x3,%eax
     35f:	cd 40                	int    $0x40
     361:	c3                   	ret    

00000362 <pipe>:
SYSCALL(pipe)
     362:	b8 04 00 00 00       	mov    $0x4,%eax
     367:	cd 40                	int    $0x40
     369:	c3                   	ret    

0000036a <read>:
SYSCALL(read)
     36a:	b8 05 00 00 00       	mov    $0x5,%eax
     36f:	cd 40                	int    $0x40
     371:	c3                   	ret    

00000372 <write>:
SYSCALL(write)
     372:	b8 10 00 00 00       	mov    $0x10,%eax
     377:	cd 40                	int    $0x40
     379:	c3                   	ret    

0000037a <close>:
SYSCALL(close)
     37a:	b8 15 00 00 00       	mov    $0x15,%eax
     37f:	cd 40                	int    $0x40
     381:	c3                   	ret    

00000382 <kill>:
SYSCALL(kill)
     382:	b8 06 00 00 00       	mov    $0x6,%eax
     387:	cd 40                	int    $0x40
     389:	c3                   	ret    

0000038a <exec>:
SYSCALL(exec)
     38a:	b8 07 00 00 00       	mov    $0x7,%eax
     38f:	cd 40                	int    $0x40
     391:	c3                   	ret    

00000392 <open>:
SYSCALL(open)
     392:	b8 0f 00 00 00       	mov    $0xf,%eax
     397:	cd 40                	int    $0x40
     399:	c3                   	ret    

0000039a <mknod>:
SYSCALL(mknod)
     39a:	b8 11 00 00 00       	mov    $0x11,%eax
     39f:	cd 40                	int    $0x40
     3a1:	c3                   	ret    

000003a2 <unlink>:
SYSCALL(unlink)
     3a2:	b8 12 00 00 00       	mov    $0x12,%eax
     3a7:	cd 40                	int    $0x40
     3a9:	c3                   	ret    

000003aa <fstat>:
SYSCALL(fstat)
     3aa:	b8 08 00 00 00       	mov    $0x8,%eax
     3af:	cd 40                	int    $0x40
     3b1:	c3                   	ret    

000003b2 <link>:
SYSCALL(link)
     3b2:	b8 13 00 00 00       	mov    $0x13,%eax
     3b7:	cd 40                	int    $0x40
     3b9:	c3                   	ret    

000003ba <mkdir>:
SYSCALL(mkdir)
     3ba:	b8 14 00 00 00       	mov    $0x14,%eax
     3bf:	cd 40                	int    $0x40
     3c1:	c3                   	ret    

000003c2 <chdir>:
SYSCALL(chdir)
     3c2:	b8 09 00 00 00       	mov    $0x9,%eax
     3c7:	cd 40                	int    $0x40
     3c9:	c3                   	ret    

000003ca <dup>:
SYSCALL(dup)
     3ca:	b8 0a 00 00 00       	mov    $0xa,%eax
     3cf:	cd 40                	int    $0x40
     3d1:	c3                   	ret    

000003d2 <getpid>:
SYSCALL(getpid)
     3d2:	b8 0b 00 00 00       	mov    $0xb,%eax
     3d7:	cd 40                	int    $0x40
     3d9:	c3                   	ret    

000003da <sbrk>:
SYSCALL(sbrk)
     3da:	b8 0c 00 00 00       	mov    $0xc,%eax
     3df:	cd 40                	int    $0x40
     3e1:	c3                   	ret    

000003e2 <sleep>:
SYSCALL(sleep)
     3e2:	b8 0d 00 00 00       	mov    $0xd,%eax
     3e7:	cd 40                	int    $0x40
     3e9:	c3                   	ret    

000003ea <uptime>:
SYSCALL(uptime)
     3ea:	b8 0e 00 00 00       	mov    $0xe,%eax
     3ef:	cd 40                	int    $0x40
     3f1:	c3                   	ret    

000003f2 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     3f2:	b8 16 00 00 00       	mov    $0x16,%eax
     3f7:	cd 40                	int    $0x40
     3f9:	c3                   	ret    

000003fa <sigsend>:
SYSCALL(sigsend)
     3fa:	b8 17 00 00 00       	mov    $0x17,%eax
     3ff:	cd 40                	int    $0x40
     401:	c3                   	ret    

00000402 <sigreturn>:
SYSCALL(sigreturn)
     402:	b8 18 00 00 00       	mov    $0x18,%eax
     407:	cd 40                	int    $0x40
     409:	c3                   	ret    

0000040a <alarm>:
SYSCALL(alarm)
     40a:	b8 19 00 00 00       	mov    $0x19,%eax
     40f:	cd 40                	int    $0x40
     411:	c3                   	ret    
     412:	66 90                	xchg   %ax,%ax
     414:	66 90                	xchg   %ax,%ax
     416:	66 90                	xchg   %ax,%ax
     418:	66 90                	xchg   %ax,%ax
     41a:	66 90                	xchg   %ax,%ax
     41c:	66 90                	xchg   %ax,%ax
     41e:	66 90                	xchg   %ax,%ax

00000420 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     420:	55                   	push   %ebp
     421:	89 e5                	mov    %esp,%ebp
     423:	57                   	push   %edi
     424:	56                   	push   %esi
     425:	53                   	push   %ebx
     426:	89 c6                	mov    %eax,%esi
     428:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     42b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     42e:	85 db                	test   %ebx,%ebx
     430:	74 7e                	je     4b0 <printint+0x90>
     432:	89 d0                	mov    %edx,%eax
     434:	c1 e8 1f             	shr    $0x1f,%eax
     437:	84 c0                	test   %al,%al
     439:	74 75                	je     4b0 <printint+0x90>
    neg = 1;
    x = -xx;
     43b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     43d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     444:	f7 d8                	neg    %eax
     446:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     449:	31 ff                	xor    %edi,%edi
     44b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     44e:	89 ce                	mov    %ecx,%esi
     450:	eb 08                	jmp    45a <printint+0x3a>
     452:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     458:	89 cf                	mov    %ecx,%edi
     45a:	31 d2                	xor    %edx,%edx
     45c:	8d 4f 01             	lea    0x1(%edi),%ecx
     45f:	f7 f6                	div    %esi
     461:	0f b6 92 ec 12 00 00 	movzbl 0x12ec(%edx),%edx
  }while((x /= base) != 0);
     468:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     46a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     46d:	75 e9                	jne    458 <printint+0x38>
  if(neg)
     46f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     472:	8b 75 c0             	mov    -0x40(%ebp),%esi
     475:	85 c0                	test   %eax,%eax
     477:	74 08                	je     481 <printint+0x61>
    buf[i++] = '-';
     479:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     47e:	8d 4f 02             	lea    0x2(%edi),%ecx
     481:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     485:	8d 76 00             	lea    0x0(%esi),%esi
     488:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     48b:	83 ec 04             	sub    $0x4,%esp
     48e:	83 ef 01             	sub    $0x1,%edi
     491:	6a 01                	push   $0x1
     493:	53                   	push   %ebx
     494:	56                   	push   %esi
     495:	88 45 d7             	mov    %al,-0x29(%ebp)
     498:	e8 d5 fe ff ff       	call   372 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     49d:	83 c4 10             	add    $0x10,%esp
     4a0:	39 df                	cmp    %ebx,%edi
     4a2:	75 e4                	jne    488 <printint+0x68>
    putc(fd, buf[i]);
}
     4a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4a7:	5b                   	pop    %ebx
     4a8:	5e                   	pop    %esi
     4a9:	5f                   	pop    %edi
     4aa:	5d                   	pop    %ebp
     4ab:	c3                   	ret    
     4ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     4b0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     4b2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     4b9:	eb 8b                	jmp    446 <printint+0x26>
     4bb:	90                   	nop
     4bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004c0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	57                   	push   %edi
     4c4:	56                   	push   %esi
     4c5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4c6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4c9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4cc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4cf:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     4d5:	0f b6 1e             	movzbl (%esi),%ebx
     4d8:	83 c6 01             	add    $0x1,%esi
     4db:	84 db                	test   %bl,%bl
     4dd:	0f 84 b0 00 00 00    	je     593 <printf+0xd3>
     4e3:	31 d2                	xor    %edx,%edx
     4e5:	eb 39                	jmp    520 <printf+0x60>
     4e7:	89 f6                	mov    %esi,%esi
     4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     4f0:	83 f8 25             	cmp    $0x25,%eax
     4f3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     4f6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     4fb:	74 18                	je     515 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4fd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     500:	83 ec 04             	sub    $0x4,%esp
     503:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     506:	6a 01                	push   $0x1
     508:	50                   	push   %eax
     509:	57                   	push   %edi
     50a:	e8 63 fe ff ff       	call   372 <write>
     50f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     512:	83 c4 10             	add    $0x10,%esp
     515:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     518:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     51c:	84 db                	test   %bl,%bl
     51e:	74 73                	je     593 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     520:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     522:	0f be cb             	movsbl %bl,%ecx
     525:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     528:	74 c6                	je     4f0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     52a:	83 fa 25             	cmp    $0x25,%edx
     52d:	75 e6                	jne    515 <printf+0x55>
      if(c == 'd'){
     52f:	83 f8 64             	cmp    $0x64,%eax
     532:	0f 84 f8 00 00 00    	je     630 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     538:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     53e:	83 f9 70             	cmp    $0x70,%ecx
     541:	74 5d                	je     5a0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     543:	83 f8 73             	cmp    $0x73,%eax
     546:	0f 84 84 00 00 00    	je     5d0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     54c:	83 f8 63             	cmp    $0x63,%eax
     54f:	0f 84 ea 00 00 00    	je     63f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     555:	83 f8 25             	cmp    $0x25,%eax
     558:	0f 84 c2 00 00 00    	je     620 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     55e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     561:	83 ec 04             	sub    $0x4,%esp
     564:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     568:	6a 01                	push   $0x1
     56a:	50                   	push   %eax
     56b:	57                   	push   %edi
     56c:	e8 01 fe ff ff       	call   372 <write>
     571:	83 c4 0c             	add    $0xc,%esp
     574:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     577:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     57a:	6a 01                	push   $0x1
     57c:	50                   	push   %eax
     57d:	57                   	push   %edi
     57e:	83 c6 01             	add    $0x1,%esi
     581:	e8 ec fd ff ff       	call   372 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     586:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     58a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     58d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     58f:	84 db                	test   %bl,%bl
     591:	75 8d                	jne    520 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     593:	8d 65 f4             	lea    -0xc(%ebp),%esp
     596:	5b                   	pop    %ebx
     597:	5e                   	pop    %esi
     598:	5f                   	pop    %edi
     599:	5d                   	pop    %ebp
     59a:	c3                   	ret    
     59b:	90                   	nop
     59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     5a0:	83 ec 0c             	sub    $0xc,%esp
     5a3:	b9 10 00 00 00       	mov    $0x10,%ecx
     5a8:	6a 00                	push   $0x0
     5aa:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     5ad:	89 f8                	mov    %edi,%eax
     5af:	8b 13                	mov    (%ebx),%edx
     5b1:	e8 6a fe ff ff       	call   420 <printint>
        ap++;
     5b6:	89 d8                	mov    %ebx,%eax
     5b8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     5bb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     5bd:	83 c0 04             	add    $0x4,%eax
     5c0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     5c3:	e9 4d ff ff ff       	jmp    515 <printf+0x55>
     5c8:	90                   	nop
     5c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     5d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     5d3:	8b 18                	mov    (%eax),%ebx
        ap++;
     5d5:	83 c0 04             	add    $0x4,%eax
     5d8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     5db:	b8 e4 12 00 00       	mov    $0x12e4,%eax
     5e0:	85 db                	test   %ebx,%ebx
     5e2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     5e5:	0f b6 03             	movzbl (%ebx),%eax
     5e8:	84 c0                	test   %al,%al
     5ea:	74 23                	je     60f <printf+0x14f>
     5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     5f0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5f3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     5f6:	83 ec 04             	sub    $0x4,%esp
     5f9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     5fb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5fe:	50                   	push   %eax
     5ff:	57                   	push   %edi
     600:	e8 6d fd ff ff       	call   372 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     605:	0f b6 03             	movzbl (%ebx),%eax
     608:	83 c4 10             	add    $0x10,%esp
     60b:	84 c0                	test   %al,%al
     60d:	75 e1                	jne    5f0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     60f:	31 d2                	xor    %edx,%edx
     611:	e9 ff fe ff ff       	jmp    515 <printf+0x55>
     616:	8d 76 00             	lea    0x0(%esi),%esi
     619:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     620:	83 ec 04             	sub    $0x4,%esp
     623:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     626:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     629:	6a 01                	push   $0x1
     62b:	e9 4c ff ff ff       	jmp    57c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     630:	83 ec 0c             	sub    $0xc,%esp
     633:	b9 0a 00 00 00       	mov    $0xa,%ecx
     638:	6a 01                	push   $0x1
     63a:	e9 6b ff ff ff       	jmp    5aa <printf+0xea>
     63f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     642:	83 ec 04             	sub    $0x4,%esp
     645:	8b 03                	mov    (%ebx),%eax
     647:	6a 01                	push   $0x1
     649:	88 45 e4             	mov    %al,-0x1c(%ebp)
     64c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     64f:	50                   	push   %eax
     650:	57                   	push   %edi
     651:	e8 1c fd ff ff       	call   372 <write>
     656:	e9 5b ff ff ff       	jmp    5b6 <printf+0xf6>
     65b:	66 90                	xchg   %ax,%ax
     65d:	66 90                	xchg   %ax,%ax
     65f:	90                   	nop

00000660 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     660:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     661:	a1 80 1a 00 00       	mov    0x1a80,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     666:	89 e5                	mov    %esp,%ebp
     668:	57                   	push   %edi
     669:	56                   	push   %esi
     66a:	53                   	push   %ebx
     66b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     66e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     670:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     673:	39 c8                	cmp    %ecx,%eax
     675:	73 19                	jae    690 <free+0x30>
     677:	89 f6                	mov    %esi,%esi
     679:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     680:	39 d1                	cmp    %edx,%ecx
     682:	72 1c                	jb     6a0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     684:	39 d0                	cmp    %edx,%eax
     686:	73 18                	jae    6a0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     688:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     68a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     68c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     68e:	72 f0                	jb     680 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     690:	39 d0                	cmp    %edx,%eax
     692:	72 f4                	jb     688 <free+0x28>
     694:	39 d1                	cmp    %edx,%ecx
     696:	73 f0                	jae    688 <free+0x28>
     698:	90                   	nop
     699:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     6a0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6a3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6a6:	39 d7                	cmp    %edx,%edi
     6a8:	74 19                	je     6c3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     6aa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     6ad:	8b 50 04             	mov    0x4(%eax),%edx
     6b0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     6b3:	39 f1                	cmp    %esi,%ecx
     6b5:	74 23                	je     6da <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     6b7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     6b9:	a3 80 1a 00 00       	mov    %eax,0x1a80
}
     6be:	5b                   	pop    %ebx
     6bf:	5e                   	pop    %esi
     6c0:	5f                   	pop    %edi
     6c1:	5d                   	pop    %ebp
     6c2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     6c3:	03 72 04             	add    0x4(%edx),%esi
     6c6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     6c9:	8b 10                	mov    (%eax),%edx
     6cb:	8b 12                	mov    (%edx),%edx
     6cd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     6d0:	8b 50 04             	mov    0x4(%eax),%edx
     6d3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     6d6:	39 f1                	cmp    %esi,%ecx
     6d8:	75 dd                	jne    6b7 <free+0x57>
    p->s.size += bp->s.size;
     6da:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     6dd:	a3 80 1a 00 00       	mov    %eax,0x1a80
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     6e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     6e5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     6e8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     6ea:	5b                   	pop    %ebx
     6eb:	5e                   	pop    %esi
     6ec:	5f                   	pop    %edi
     6ed:	5d                   	pop    %ebp
     6ee:	c3                   	ret    
     6ef:	90                   	nop

000006f0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
     6f6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     6f9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     6fc:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     702:	8d 78 07             	lea    0x7(%eax),%edi
     705:	c1 ef 03             	shr    $0x3,%edi
     708:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     70b:	85 d2                	test   %edx,%edx
     70d:	0f 84 a3 00 00 00    	je     7b6 <malloc+0xc6>
     713:	8b 02                	mov    (%edx),%eax
     715:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     718:	39 cf                	cmp    %ecx,%edi
     71a:	76 74                	jbe    790 <malloc+0xa0>
     71c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     722:	be 00 10 00 00       	mov    $0x1000,%esi
     727:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     72e:	0f 43 f7             	cmovae %edi,%esi
     731:	ba 00 80 00 00       	mov    $0x8000,%edx
     736:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     73c:	0f 46 da             	cmovbe %edx,%ebx
     73f:	eb 10                	jmp    751 <malloc+0x61>
     741:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     748:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     74a:	8b 48 04             	mov    0x4(%eax),%ecx
     74d:	39 cf                	cmp    %ecx,%edi
     74f:	76 3f                	jbe    790 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     751:	39 05 80 1a 00 00    	cmp    %eax,0x1a80
     757:	89 c2                	mov    %eax,%edx
     759:	75 ed                	jne    748 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     75b:	83 ec 0c             	sub    $0xc,%esp
     75e:	53                   	push   %ebx
     75f:	e8 76 fc ff ff       	call   3da <sbrk>
  if(p == (char*)-1)
     764:	83 c4 10             	add    $0x10,%esp
     767:	83 f8 ff             	cmp    $0xffffffff,%eax
     76a:	74 1c                	je     788 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     76c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     76f:	83 ec 0c             	sub    $0xc,%esp
     772:	83 c0 08             	add    $0x8,%eax
     775:	50                   	push   %eax
     776:	e8 e5 fe ff ff       	call   660 <free>
  return freep;
     77b:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     781:	83 c4 10             	add    $0x10,%esp
     784:	85 d2                	test   %edx,%edx
     786:	75 c0                	jne    748 <malloc+0x58>
        return 0;
     788:	31 c0                	xor    %eax,%eax
     78a:	eb 1c                	jmp    7a8 <malloc+0xb8>
     78c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     790:	39 cf                	cmp    %ecx,%edi
     792:	74 1c                	je     7b0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     794:	29 f9                	sub    %edi,%ecx
     796:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     799:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     79c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     79f:	89 15 80 1a 00 00    	mov    %edx,0x1a80
      return (void*)(p + 1);
     7a5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     7a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7ab:	5b                   	pop    %ebx
     7ac:	5e                   	pop    %esi
     7ad:	5f                   	pop    %edi
     7ae:	5d                   	pop    %ebp
     7af:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     7b0:	8b 08                	mov    (%eax),%ecx
     7b2:	89 0a                	mov    %ecx,(%edx)
     7b4:	eb e9                	jmp    79f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     7b6:	c7 05 80 1a 00 00 84 	movl   $0x1a84,0x1a80
     7bd:	1a 00 00 
     7c0:	c7 05 84 1a 00 00 84 	movl   $0x1a84,0x1a84
     7c7:	1a 00 00 
    base.s.size = 0;
     7ca:	b8 84 1a 00 00       	mov    $0x1a84,%eax
     7cf:	c7 05 88 1a 00 00 00 	movl   $0x0,0x1a88
     7d6:	00 00 00 
     7d9:	e9 3e ff ff ff       	jmp    71c <malloc+0x2c>
     7de:	66 90                	xchg   %ax,%ax

000007e0 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     7e0:	55                   	push   %ebp
     7e1:	89 e5                	mov    %esp,%ebp
     7e3:	56                   	push   %esi
     7e4:	53                   	push   %ebx
     7e5:	8b 75 0c             	mov    0xc(%ebp),%esi
     7e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     7eb:	83 ec 08             	sub    $0x8,%esp
     7ee:	68 00 13 00 00       	push   $0x1300
     7f3:	6a 01                	push   $0x1
     7f5:	e8 c6 fc ff ff       	call   4c0 <printf>
  alarm(UTHREAD_QUANTA);
     7fa:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     801:	e8 04 fc ff ff       	call   40a <alarm>
  start_func(arg);
     806:	89 75 08             	mov    %esi,0x8(%ebp)
     809:	83 c4 10             	add    $0x10,%esp
}
     80c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     80f:	89 d8                	mov    %ebx,%eax
}
     811:	5b                   	pop    %ebx
     812:	5e                   	pop    %esi
     813:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     814:	ff e0                	jmp    *%eax
     816:	8d 76 00             	lea    0x0(%esi),%esi
     819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000820 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	53                   	push   %ebx
     824:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     827:	6a 00                	push   $0x0
     829:	e8 dc fb ff ff       	call   40a <alarm>
  printf(1,"exiting...\n");
     82e:	5a                   	pop    %edx
     82f:	59                   	pop    %ecx
     830:	68 70 14 00 00       	push   $0x1470
     835:	6a 01                	push   $0x1
     837:	e8 84 fc ff ff       	call   4c0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     83c:	a1 c8 ab 00 00       	mov    0xabc8,%eax
     841:	83 c4 10             	add    $0x10,%esp
     844:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     847:	8b 1c 95 a0 1c 00 00 	mov    0x1ca0(,%edx,4),%ebx
     84e:	85 db                	test   %ebx,%ebx
     850:	75 0a                	jne    85c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     852:	c7 05 a8 1c 00 00 00 	movl   $0x0,0x1ca8
     859:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     85c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     85f:	83 ec 0c             	sub    $0xc,%esp
     862:	ff 34 85 a4 1c 00 00 	pushl  0x1ca4(,%eax,4)
     869:	e8 f2 fd ff ff       	call   660 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     86e:	a1 c8 ab 00 00       	mov    0xabc8,%eax
     873:	83 c4 10             	add    $0x10,%esp
     876:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     879:	b8 a8 1c 00 00       	mov    $0x1ca8,%eax
     87e:	c1 e2 02             	shl    $0x2,%edx
     881:	c7 82 a8 1c 00 00 00 	movl   $0x0,0x1ca8(%edx)
     888:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     88b:	c7 82 a0 1c 00 00 ff 	movl   $0xffffffff,0x1ca0(%edx)
     892:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     895:	c7 82 ac 1c 00 00 00 	movl   $0x0,0x1cac(%edx)
     89c:	00 00 00 
  threads[index_currently_running].esp = 0;
     89f:	c7 82 b0 1c 00 00 00 	movl   $0x0,0x1cb0(%edx)
     8a6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     8a9:	c7 82 bc 1c 00 00 00 	movl   $0x0,0x1cbc(%edx)
     8b0:	00 00 00 
  threads[index_currently_running].join = -1;
     8b3:	c7 82 c0 1c 00 00 ff 	movl   $0xffffffff,0x1cc0(%edx)
     8ba:	ff ff ff 
     8bd:	eb 0b                	jmp    8ca <uthread_exit+0xaa>
     8bf:	90                   	nop
     8c0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     8c3:	3d a8 25 00 00       	cmp    $0x25a8,%eax
     8c8:	74 15                	je     8df <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     8ca:	83 38 04             	cmpl   $0x4,(%eax)
     8cd:	75 f1                	jne    8c0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     8cf:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     8d5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     8d8:	3d a8 25 00 00       	cmp    $0x25a8,%eax
     8dd:	75 eb                	jne    8ca <uthread_exit+0xaa>
     8df:	bb cc 1c 00 00       	mov    $0x1ccc,%ebx
     8e4:	eb 15                	jmp    8fb <uthread_exit+0xdb>
     8e6:	8d 76 00             	lea    0x0(%esi),%esi
     8e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     8f0:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     8f3:	81 fb a8 25 00 00    	cmp    $0x25a8,%ebx
     8f9:	74 24                	je     91f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     8fb:	8b 03                	mov    (%ebx),%eax
     8fd:	85 c0                	test   %eax,%eax
     8ff:	74 ef                	je     8f0 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     901:	e8 cc fa ff ff       	call   3d2 <getpid>
     906:	83 ec 08             	sub    $0x8,%esp
     909:	83 c3 24             	add    $0x24,%ebx
     90c:	6a 0e                	push   $0xe
     90e:	50                   	push   %eax
     90f:	e8 e6 fa ff ff       	call   3fa <sigsend>
     914:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     917:	81 fb a8 25 00 00    	cmp    $0x25a8,%ebx
     91d:	75 dc                	jne    8fb <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     91f:	e8 2e fa ff ff       	call   352 <exit>
     924:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     92a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000930 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     930:	55                   	push   %ebp
     931:	ba c8 26 00 00       	mov    $0x26c8,%edx
     936:	89 e5                	mov    %esp,%ebp
     938:	90                   	nop
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     940:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     946:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     94c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     950:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     956:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     959:	39 d0                	cmp    %edx,%eax
     95b:	75 f3                	jne    950 <init_bsem+0x20>
     95d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     963:	81 fa c8 ac 00 00    	cmp    $0xacc8,%edx
     969:	75 d5                	jne    940 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     96b:	c7 05 8c 1a 00 00 01 	movl   $0x1,0x1a8c
     972:	00 00 00 
}
     975:	5d                   	pop    %ebp
     976:	c3                   	ret    
     977:	89 f6                	mov    %esi,%esi
     979:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000980 <bsem_alloc>:

int bsem_alloc() {
     980:	55                   	push   %ebp
     981:	89 e5                	mov    %esp,%ebp
     983:	53                   	push   %ebx
     984:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     987:	6a 00                	push   $0x0
     989:	e8 7c fa ff ff       	call   40a <alarm>
  int i;
  if(first_run_bsem == 0)
     98e:	a1 8c 1a 00 00       	mov    0x1a8c,%eax
     993:	83 c4 10             	add    $0x10,%esp
     996:	85 c0                	test   %eax,%eax
     998:	75 3b                	jne    9d5 <bsem_alloc+0x55>
     99a:	ba c8 26 00 00       	mov    $0x26c8,%edx
     99f:	90                   	nop
     9a0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     9a6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     9ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     9b0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     9b6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     9b9:	39 d0                	cmp    %edx,%eax
     9bb:	75 f3                	jne    9b0 <bsem_alloc+0x30>
     9bd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     9c3:	81 fa c8 ac 00 00    	cmp    $0xacc8,%edx
     9c9:	75 d5                	jne    9a0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     9cb:	c7 05 8c 1a 00 00 01 	movl   $0x1,0x1a8c
     9d2:	00 00 00 
     9d5:	ba c8 26 00 00       	mov    $0x26c8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     9da:	31 c0                	xor    %eax,%eax
     9dc:	eb 10                	jmp    9ee <bsem_alloc+0x6e>
     9de:	83 c0 01             	add    $0x1,%eax
     9e1:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     9e7:	3d 80 00 00 00       	cmp    $0x80,%eax
     9ec:	74 4f                	je     a3d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     9ee:	83 3a 01             	cmpl   $0x1,(%edx)
     9f1:	75 eb                	jne    9de <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     9f3:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     9f9:	8b 15 7c 1a 00 00    	mov    0x1a7c,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     9ff:	83 ec 0c             	sub    $0xc,%esp
     a02:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     a04:	8d 98 c0 25 00 00    	lea    0x25c0(%eax),%ebx
     a0a:	89 90 c4 25 00 00    	mov    %edx,0x25c4(%eax)
    binSemCounter++;
     a10:	83 c2 01             	add    $0x1,%edx
     a13:	89 15 7c 1a 00 00    	mov    %edx,0x1a7c
    binSemaphore[i].lock = 1; // not locked
     a19:	c7 80 c0 25 00 00 01 	movl   $0x1,0x25c0(%eax)
     a20:	00 00 00 
    binSemaphore[i].state = USED;
     a23:	c7 80 c8 26 00 00 00 	movl   $0x0,0x26c8(%eax)
     a2a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a2d:	e8 d8 f9 ff ff       	call   40a <alarm>
    return binSemaphore[i].id;
     a32:	8b 43 04             	mov    0x4(%ebx),%eax
     a35:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     a38:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a3b:	c9                   	leave  
     a3c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     a3d:	83 ec 08             	sub    $0x8,%esp
     a40:	68 20 13 00 00       	push   $0x1320
     a45:	6a 01                	push   $0x1
     a47:	e8 74 fa ff ff       	call   4c0 <printf>
    alarm(UTHREAD_QUANTA);
     a4c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     a53:	e8 b2 f9 ff ff       	call   40a <alarm>
    return -1;
     a58:	83 c4 10             	add    $0x10,%esp
     a5b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     a60:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a63:	c9                   	leave  
     a64:	c3                   	ret    
     a65:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a69:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a70 <bsem_free>:

void bsem_free(int id) {
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	53                   	push   %ebx
     a74:	83 ec 10             	sub    $0x10,%esp
     a77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     a7a:	6a 00                	push   $0x0
     a7c:	e8 89 f9 ff ff       	call   40a <alarm>
     a81:	ba c4 25 00 00       	mov    $0x25c4,%edx
     a86:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     a89:	31 c0                	xor    %eax,%eax
     a8b:	eb 13                	jmp    aa0 <bsem_free+0x30>
     a8d:	8d 76 00             	lea    0x0(%esi),%esi
     a90:	83 c0 01             	add    $0x1,%eax
     a93:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     a99:	3d 80 00 00 00       	cmp    $0x80,%eax
     a9e:	74 38                	je     ad8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     aa0:	39 1a                	cmp    %ebx,(%edx)
     aa2:	75 ec                	jne    a90 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     aa4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     aaa:	05 c0 25 00 00       	add    $0x25c0,%eax
     aaf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     ab6:	74 0a                	je     ac2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     ab8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     abf:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     ac2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     ac9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     acc:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     acd:	e9 38 f9 ff ff       	jmp    40a <alarm>
     ad2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     ad8:	83 ec 04             	sub    $0x4,%esp
     adb:	53                   	push   %ebx
     adc:	68 7c 14 00 00       	push   $0x147c
     ae1:	6a 01                	push   $0x1
     ae3:	e8 d8 f9 ff ff       	call   4c0 <printf>
     ae8:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     aeb:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     af2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     af5:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     af6:	e9 0f f9 ff ff       	jmp    40a <alarm>
     afb:	90                   	nop
     afc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b00 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	53                   	push   %ebx
     b04:	83 ec 10             	sub    $0x10,%esp
     b07:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b0a:	6a 00                	push   $0x0
     b0c:	e8 f9 f8 ff ff       	call   40a <alarm>
     b11:	b8 c4 25 00 00       	mov    $0x25c4,%eax
     b16:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b19:	31 d2                	xor    %edx,%edx
     b1b:	eb 17                	jmp    b34 <bsem_down+0x34>
     b1d:	8d 76 00             	lea    0x0(%esi),%esi
     b20:	83 c2 01             	add    $0x1,%edx
     b23:	05 0c 01 00 00       	add    $0x10c,%eax
     b28:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     b2e:	0f 84 8c 00 00 00    	je     bc0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     b34:	39 18                	cmp    %ebx,(%eax)
     b36:	75 e8                	jne    b20 <bsem_down+0x20>
     b38:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     b3e:	85 c9                	test   %ecx,%ecx
     b40:	75 de                	jne    b20 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     b42:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     b48:	31 c0                	xor    %eax,%eax
     b4a:	83 b9 c0 25 00 00 01 	cmpl   $0x1,0x25c0(%ecx)
     b51:	75 15                	jne    b68 <bsem_down+0x68>
     b53:	e9 93 00 00 00       	jmp    beb <bsem_down+0xeb>
     b58:	90                   	nop
     b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     b60:	83 c0 01             	add    $0x1,%eax
     b63:	83 f8 40             	cmp    $0x40,%eax
     b66:	74 7b                	je     be3 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     b68:	83 bc 81 c8 25 00 00 	cmpl   $0xffffffff,0x25c8(%ecx,%eax,4)
     b6f:	ff 
     b70:	75 ee                	jne    b60 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     b72:	8b 0d c8 ab 00 00    	mov    0xabc8,%ecx
     b78:	6b d2 43             	imul   $0x43,%edx,%edx
     b7b:	01 c2                	add    %eax,%edx
     b7d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     b80:	8b 04 85 a0 1c 00 00 	mov    0x1ca0(,%eax,4),%eax
     b87:	89 04 95 c8 25 00 00 	mov    %eax,0x25c8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     b8e:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     b91:	c7 04 85 a8 1c 00 00 	movl   $0x4,0x1ca8(,%eax,4)
     b98:	04 00 00 00 

	 sigsend(getpid(),14);
     b9c:	e8 31 f8 ff ff       	call   3d2 <getpid>
     ba1:	83 ec 08             	sub    $0x8,%esp
     ba4:	6a 0e                	push   $0xe
     ba6:	50                   	push   %eax
     ba7:	e8 4e f8 ff ff       	call   3fa <sigsend>
     bac:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     baf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     bb6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bb9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bba:	e9 4b f8 ff ff       	jmp    40a <alarm>
     bbf:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     bc0:	83 ec 04             	sub    $0x4,%esp
     bc3:	53                   	push   %ebx
     bc4:	68 40 13 00 00       	push   $0x1340
     bc9:	6a 01                	push   $0x1
     bcb:	e8 f0 f8 ff ff       	call   4c0 <printf>
     bd0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     bd3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     bda:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bdd:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bde:	e9 27 f8 ff ff       	jmp    40a <alarm>
     be3:	8b 0d c8 ab 00 00    	mov    0xabc8,%ecx
     be9:	eb a3                	jmp    b8e <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     beb:	c7 81 c0 25 00 00 00 	movl   $0x0,0x25c0(%ecx)
     bf2:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bf5:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     bfc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bff:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c00:	e9 05 f8 ff ff       	jmp    40a <alarm>
     c05:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c09:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c10 <bsem_up>:
}

void bsem_up(int id) {
     c10:	55                   	push   %ebp
     c11:	89 e5                	mov    %esp,%ebp
     c13:	57                   	push   %edi
     c14:	56                   	push   %esi
     c15:	53                   	push   %ebx
     c16:	83 ec 28             	sub    $0x28,%esp
     c19:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     c1c:	6a 00                	push   $0x0
     c1e:	e8 e7 f7 ff ff       	call   40a <alarm>
     c23:	ba c4 25 00 00       	mov    $0x25c4,%edx
     c28:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c2b:	31 c0                	xor    %eax,%eax
     c2d:	eb 15                	jmp    c44 <bsem_up+0x34>
     c2f:	90                   	nop
     c30:	83 c0 01             	add    $0x1,%eax
     c33:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     c39:	3d 80 00 00 00       	cmp    $0x80,%eax
     c3e:	0f 84 ac 00 00 00    	je     cf0 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     c44:	39 1a                	cmp    %ebx,(%edx)
     c46:	75 e8                	jne    c30 <bsem_up+0x20>
     c48:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     c4e:	85 c9                	test   %ecx,%ecx
     c50:	75 de                	jne    c30 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     c52:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     c58:	8b 97 c0 25 00 00    	mov    0x25c0(%edi),%edx
     c5e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     c61:	85 d2                	test   %edx,%edx
     c63:	0f 85 9c 00 00 00    	jne    d05 <bsem_up+0xf5>
     c69:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     c6b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     c6e:	8b b4 be c8 25 00 00 	mov    0x25c8(%esi,%edi,4),%esi
     c75:	83 fe ff             	cmp    $0xffffffff,%esi
     c78:	74 56                	je     cd0 <bsem_up+0xc0>
     c7a:	b9 a0 1c 00 00       	mov    $0x1ca0,%ecx
     c7f:	31 d2                	xor    %edx,%edx
     c81:	eb 10                	jmp    c93 <bsem_up+0x83>
     c83:	90                   	nop
     c84:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     c88:	83 c2 01             	add    $0x1,%edx
     c8b:	83 c1 24             	add    $0x24,%ecx
     c8e:	83 fa 40             	cmp    $0x40,%edx
     c91:	74 3d                	je     cd0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     c93:	8b 19                	mov    (%ecx),%ebx
     c95:	39 de                	cmp    %ebx,%esi
     c97:	75 ef                	jne    c88 <bsem_up+0x78>
     c99:	83 fb ff             	cmp    $0xffffffff,%ebx
     c9c:	74 ea                	je     c88 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     c9e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     ca1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     ca4:	c7 04 95 a8 1c 00 00 	movl   $0x2,0x1ca8(,%edx,4)
     cab:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     caf:	01 c7                	add    %eax,%edi
     cb1:	c7 04 bd c8 25 00 00 	movl   $0xffffffff,0x25c8(,%edi,4)
     cb8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     cbc:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     cc3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cc6:	5b                   	pop    %ebx
     cc7:	5e                   	pop    %esi
     cc8:	5f                   	pop    %edi
     cc9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     cca:	e9 3b f7 ff ff       	jmp    40a <alarm>
     ccf:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     cd0:	83 c7 01             	add    $0x1,%edi
     cd3:	83 ff 40             	cmp    $0x40,%edi
     cd6:	75 93                	jne    c6b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     cd8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     cde:	c7 80 c0 25 00 00 01 	movl   $0x1,0x25c0(%eax)
     ce5:	00 00 00 
     ce8:	eb d2                	jmp    cbc <bsem_up+0xac>
     cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     cf0:	83 ec 04             	sub    $0x4,%esp
     cf3:	53                   	push   %ebx
     cf4:	68 a8 13 00 00       	push   $0x13a8
     cf9:	6a 01                	push   $0x1
     cfb:	e8 c0 f7 ff ff       	call   4c0 <printf>
     d00:	83 c4 10             	add    $0x10,%esp
     d03:	eb b7                	jmp    cbc <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     d05:	83 ec 08             	sub    $0x8,%esp
     d08:	68 84 13 00 00       	push   $0x1384
     d0d:	6a 01                	push   $0x1
     d0f:	e8 ac f7 ff ff       	call   4c0 <printf>
     d14:	83 c4 10             	add    $0x10,%esp
     d17:	eb a3                	jmp    cbc <bsem_up+0xac>
     d19:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d20 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     d20:	55                   	push   %ebp
     d21:	89 e5                	mov    %esp,%ebp
     d23:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     d26:	68 ec 13 00 00       	push   $0x13ec
     d2b:	6a 01                	push   $0x1
     d2d:	e8 8e f7 ff ff       	call   4c0 <printf>
     d32:	b8 a0 1c 00 00       	mov    $0x1ca0,%eax
     d37:	83 c4 10             	add    $0x10,%esp
     d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     d40:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     d46:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     d4d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     d50:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     d57:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     d5e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     d65:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     d6c:	3d a0 25 00 00       	cmp    $0x25a0,%eax
     d71:	75 cd                	jne    d40 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d73:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     d76:	c7 05 a0 1c 00 00 00 	movl   $0x0,0x1ca0
     d7d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     d80:	c7 05 a8 1c 00 00 03 	movl   $0x3,0x1ca8
     d87:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     d8a:	68 20 0f 00 00       	push   $0xf20
     d8f:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     d91:	c7 05 a4 1c 00 00 00 	movl   $0x0,0x1ca4
     d98:	00 00 00 

  id_number_thread = 1;
     d9b:	c7 05 c4 ab 00 00 01 	movl   $0x1,0xabc4
     da2:	00 00 00 
  index_currently_running = 0;
     da5:	c7 05 c8 ab 00 00 00 	movl   $0x0,0xabc8
     dac:	00 00 00 
  currently_running = 0;
     daf:	c7 05 a0 25 00 00 00 	movl   $0x0,0x25a0
     db6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     db9:	e8 34 f6 ff ff       	call   3f2 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     dbe:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     dc5:	e8 40 f6 ff ff       	call   40a <alarm>
  return 0;
}
     dca:	31 c0                	xor    %eax,%eax
     dcc:	c9                   	leave  
     dcd:	c3                   	ret    
     dce:	66 90                	xchg   %ax,%ax

00000dd0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     dd0:	55                   	push   %ebp
     dd1:	89 e5                	mov    %esp,%ebp
     dd3:	56                   	push   %esi
     dd4:	53                   	push   %ebx
  alarm(0);
     dd5:	83 ec 0c             	sub    $0xc,%esp
     dd8:	6a 00                	push   $0x0
     dda:	e8 2b f6 ff ff       	call   40a <alarm>
  printf(1, "------ creating a new thread ------\n");
     ddf:	5b                   	pop    %ebx
     de0:	5e                   	pop    %esi
     de1:	68 18 14 00 00       	push   $0x1418
     de6:	6a 01                	push   $0x1
     de8:	e8 d3 f6 ff ff       	call   4c0 <printf>
     ded:	ba a8 1c 00 00       	mov    $0x1ca8,%edx
     df2:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     df5:	31 c0                	xor    %eax,%eax
     df7:	eb 12                	jmp    e0b <uthread_create+0x3b>
     df9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e00:	83 c0 01             	add    $0x1,%eax
     e03:	83 c2 24             	add    $0x24,%edx
     e06:	83 f8 40             	cmp    $0x40,%eax
     e09:	74 7d                	je     e88 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     e0b:	8b 0a                	mov    (%edx),%ecx
     e0d:	85 c9                	test   %ecx,%ecx
     e0f:	75 ef                	jne    e00 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e11:	8b 15 c4 ab 00 00    	mov    0xabc4,%edx
     e17:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e1a:	83 ec 0c             	sub    $0xc,%esp
     e1d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e22:	c1 e3 02             	shl    $0x2,%ebx
     e25:	89 93 a0 1c 00 00    	mov    %edx,0x1ca0(%ebx)
  id_number_thread++;
     e2b:	83 c2 01             	add    $0x1,%edx
     e2e:	89 15 c4 ab 00 00    	mov    %edx,0xabc4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e34:	e8 b7 f8 ff ff       	call   6f0 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e39:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     e3c:	c7 80 f4 0f 00 00 20 	movl   $0x820,0xff4(%eax)
     e43:	08 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e46:	89 83 a4 1c 00 00    	mov    %eax,0x1ca4(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     e4c:	c7 83 a8 1c 00 00 02 	movl   $0x2,0x1ca8(%ebx)
     e53:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e56:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     e5c:	8b 55 0c             	mov    0xc(%ebp),%edx
     e5f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     e65:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e6c:	e8 99 f5 ff ff       	call   40a <alarm>
  return   threads[free_thread].thread_id;
     e71:	8b 83 a0 1c 00 00    	mov    0x1ca0(%ebx),%eax
     e77:	83 c4 10             	add    $0x10,%esp
}
     e7a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     e7d:	5b                   	pop    %ebx
     e7e:	5e                   	pop    %esi
     e7f:	5d                   	pop    %ebp
     e80:	c3                   	ret    
     e81:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     e88:	83 ec 08             	sub    $0x8,%esp
     e8b:	68 8e 14 00 00       	push   $0x148e
     e90:	6a 01                	push   $0x1
     e92:	e8 29 f6 ff ff       	call   4c0 <printf>
    alarm(UTHREAD_QUANTA);
     e97:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e9e:	e8 67 f5 ff ff       	call   40a <alarm>
    return -1;
     ea3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     ea6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     ea9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     eae:	5b                   	pop    %ebx
     eaf:	5e                   	pop    %esi
     eb0:	5d                   	pop    %ebp
     eb1:	c3                   	ret    
     eb2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ec0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     ec0:	55                   	push   %ebp
     ec1:	89 e5                	mov    %esp,%ebp
     ec3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     ec6:	85 c0                	test   %eax,%eax
     ec8:	74 14                	je     ede <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     eca:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     ecd:	89 e2                	mov    %esp,%edx
     ecf:	8d 04 85 a0 1c 00 00 	lea    0x1ca0(,%eax,4),%eax
     ed6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     ed9:	89 ea                	mov    %ebp,%edx
     edb:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     ede:	a1 c8 ab 00 00       	mov    0xabc8,%eax
     ee3:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     ee6:	8d 04 85 a0 1c 00 00 	lea    0x1ca0(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     eed:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     ef0:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     ef7:	85 d2                	test   %edx,%edx
     ef9:	74 0d                	je     f08 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     efb:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     efd:	8b 40 0c             	mov    0xc(%eax),%eax
     f00:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     f02:	5d                   	pop    %ebp
     f03:	c3                   	ret    
     f04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f08:	8b 40 04             	mov    0x4(%eax),%eax
     f0b:	05 f4 0f 00 00       	add    $0xff4,%eax
     f10:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f12:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     f14:	b8 e0 07 00 00       	mov    $0x7e0,%eax
     f19:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     f1b:	5d                   	pop    %ebp
     f1c:	c3                   	ret    
     f1d:	8d 76 00             	lea    0x0(%esi),%esi

00000f20 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     f20:	55                   	push   %ebp
     f21:	89 e5                	mov    %esp,%ebp
     f23:	56                   	push   %esi
     f24:	53                   	push   %ebx
     f25:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     f28:	83 ec 0c             	sub    $0xc,%esp
     f2b:	6a 00                	push   $0x0
     f2d:	e8 d8 f4 ff ff       	call   40a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     f32:	a1 c8 ab 00 00       	mov    0xabc8,%eax
     f37:	83 c4 10             	add    $0x10,%esp
     f3a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     f3d:	8d 14 95 a0 1c 00 00 	lea    0x1ca0(,%edx,4),%edx
     f44:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     f48:	75 0b                	jne    f55 <uthread_schedule+0x35>
     f4a:	85 c0                	test   %eax,%eax
     f4c:	74 07                	je     f55 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     f4e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     f55:	bb a8 1c 00 00       	mov    $0x1ca8,%ebx
     f5a:	eb 0f                	jmp    f6b <uthread_schedule+0x4b>
     f5c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f60:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f63:	81 fb a8 25 00 00    	cmp    $0x25a8,%ebx
     f69:	74 55                	je     fc0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f6b:	83 3b 01             	cmpl   $0x1,(%ebx)
     f6e:	75 f0                	jne    f60 <uthread_schedule+0x40>
     f70:	8b 73 14             	mov    0x14(%ebx),%esi
     f73:	85 f6                	test   %esi,%esi
     f75:	0f 85 a5 00 00 00    	jne    1020 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     f7b:	8b 43 18             	mov    0x18(%ebx),%eax
     f7e:	83 f8 ff             	cmp    $0xffffffff,%eax
     f81:	74 dd                	je     f60 <uthread_schedule+0x40>
     f83:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     f86:	8b 14 95 a8 1c 00 00 	mov    0x1ca8(,%edx,4),%edx
     f8d:	85 d2                	test   %edx,%edx
     f8f:	75 cf                	jne    f60 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     f91:	50                   	push   %eax
     f92:	ff 73 f8             	pushl  -0x8(%ebx)
     f95:	83 c3 24             	add    $0x24,%ebx
     f98:	68 40 14 00 00       	push   $0x1440
     f9d:	6a 01                	push   $0x1
     f9f:	e8 1c f5 ff ff       	call   4c0 <printf>
      threads[i].join = -1;
     fa4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     fab:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     fb2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     fb5:	81 fb a8 25 00 00    	cmp    $0x25a8,%ebx
     fbb:	75 ae                	jne    f6b <uthread_schedule+0x4b>
     fbd:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     fc0:	8b 15 c8 ab 00 00    	mov    0xabc8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     fc6:	b9 40 00 00 00       	mov    $0x40,%ecx
     fcb:	8d 42 01             	lea    0x1(%edx),%eax
     fce:	eb 08                	jmp    fd8 <uthread_schedule+0xb8>
     fd0:	83 c0 01             	add    $0x1,%eax
     fd3:	83 e9 01             	sub    $0x1,%ecx
     fd6:	74 78                	je     1050 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
     fd8:	89 c3                	mov    %eax,%ebx
     fda:	c1 fb 1f             	sar    $0x1f,%ebx
     fdd:	c1 eb 1a             	shr    $0x1a,%ebx
     fe0:	01 d8                	add    %ebx,%eax
     fe2:	83 e0 3f             	and    $0x3f,%eax
     fe5:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
     fe7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
     fea:	83 3c 9d a8 1c 00 00 	cmpl   $0x2,0x1ca8(,%ebx,4)
     ff1:	02 
     ff2:	75 dc                	jne    fd0 <uthread_schedule+0xb0>
     ff4:	39 c2                	cmp    %eax,%edx
     ff6:	74 d8                	je     fd0 <uthread_schedule+0xb0>
      index_currently_running = i;
     ff8:	a3 c8 ab 00 00       	mov    %eax,0xabc8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
     ffd:	83 ec 08             	sub    $0x8,%esp
    1000:	50                   	push   %eax
    1001:	52                   	push   %edx
    1002:	e8 b9 fe ff ff       	call   ec0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    1007:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    100e:	e8 f7 f3 ff ff       	call   40a <alarm>
}
    1013:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1016:	5b                   	pop    %ebx
    1017:	5e                   	pop    %esi
    1018:	5d                   	pop    %ebp
    1019:	c3                   	ret    
    101a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1020:	e8 c5 f3 ff ff       	call   3ea <uptime>
    1025:	39 c6                	cmp    %eax,%esi
    1027:	7f 17                	jg     1040 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1029:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    102f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1036:	e9 25 ff ff ff       	jmp    f60 <uthread_schedule+0x40>
    103b:	90                   	nop
    103c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1040:	83 3b 01             	cmpl   $0x1,(%ebx)
    1043:	0f 84 32 ff ff ff    	je     f7b <uthread_schedule+0x5b>
    1049:	e9 12 ff ff ff       	jmp    f60 <uthread_schedule+0x40>
    104e:	66 90                	xchg   %ax,%ax
    1050:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1053:	83 3c 85 a8 1c 00 00 	cmpl   $0x2,0x1ca8(,%eax,4)
    105a:	02 
    105b:	0f 85 c7 fe ff ff    	jne    f28 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1061:	89 d0                	mov    %edx,%eax
    1063:	eb 98                	jmp    ffd <uthread_schedule+0xdd>
    1065:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1069:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001070 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1070:	a1 c8 ab 00 00       	mov    0xabc8,%eax
  exit();
}

int
uthread_self()
{
    1075:	55                   	push   %ebp
    1076:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    1078:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    107b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    107c:	8b 04 85 a0 1c 00 00 	mov    0x1ca0(,%eax,4),%eax
}
    1083:	c3                   	ret    
    1084:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    108a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001090 <uthread_join>:

int
uthread_join(int tid)
{
    1090:	55                   	push   %ebp
    1091:	89 e5                	mov    %esp,%ebp
    1093:	56                   	push   %esi
    1094:	53                   	push   %ebx
    1095:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1098:	39 35 c4 ab 00 00    	cmp    %esi,0xabc4
    109e:	0f 8c ab 00 00 00    	jl     114f <uthread_join+0xbf>
    10a4:	89 f0                	mov    %esi,%eax
    10a6:	c1 e8 1f             	shr    $0x1f,%eax
    10a9:	84 c0                	test   %al,%al
    10ab:	0f 85 9e 00 00 00    	jne    114f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    10b1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    10b4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    10b6:	6a 00                	push   $0x0
    10b8:	e8 4d f3 ff ff       	call   40a <alarm>
    10bd:	b8 a0 1c 00 00       	mov    $0x1ca0,%eax
    10c2:	83 c4 10             	add    $0x10,%esp
    10c5:	eb 14                	jmp    10db <uthread_join+0x4b>
    10c7:	89 f6                	mov    %esi,%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    10d0:	83 c3 01             	add    $0x1,%ebx
    10d3:	83 c0 24             	add    $0x24,%eax
    10d6:	83 fb 40             	cmp    $0x40,%ebx
    10d9:	74 55                	je     1130 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    10db:	3b 30                	cmp    (%eax),%esi
    10dd:	75 f1                	jne    10d0 <uthread_join+0x40>
    10df:	8b 50 08             	mov    0x8(%eax),%edx
    10e2:	85 d2                	test   %edx,%edx
    10e4:	74 ea                	je     10d0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    10e6:	53                   	push   %ebx
    10e7:	ff 35 c8 ab 00 00    	pushl  0xabc8
    10ed:	68 ca 14 00 00       	push   $0x14ca
    10f2:	6a 01                	push   $0x1
    10f4:	e8 c7 f3 ff ff       	call   4c0 <printf>
    threads[index_currently_running].join=found_tid;
    10f9:	a1 c8 ab 00 00       	mov    0xabc8,%eax
    10fe:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1101:	8d 04 85 a0 1c 00 00 	lea    0x1ca0(,%eax,4),%eax
    1108:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    110b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1112:	e8 bb f2 ff ff       	call   3d2 <getpid>
    1117:	5a                   	pop    %edx
    1118:	59                   	pop    %ecx
    1119:	6a 0e                	push   $0xe
    111b:	50                   	push   %eax
    111c:	e8 d9 f2 ff ff       	call   3fa <sigsend>
  }
  return 0;
    1121:	83 c4 10             	add    $0x10,%esp

}
    1124:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1127:	31 c0                	xor    %eax,%eax

}
    1129:	5b                   	pop    %ebx
    112a:	5e                   	pop    %esi
    112b:	5d                   	pop    %ebp
    112c:	c3                   	ret    
    112d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1130:	83 ec 04             	sub    $0x4,%esp
    1133:	56                   	push   %esi
    1134:	68 ac 14 00 00       	push   $0x14ac
    1139:	6a 01                	push   $0x1
    113b:	e8 80 f3 ff ff       	call   4c0 <printf>
    alarm(UTHREAD_QUANTA);
    1140:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1147:	e8 be f2 ff ff       	call   40a <alarm>
    return -1;
    114c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    114f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1152:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1157:	5b                   	pop    %ebx
    1158:	5e                   	pop    %esi
    1159:	5d                   	pop    %ebp
    115a:	c3                   	ret    
    115b:	90                   	nop
    115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001160 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	53                   	push   %ebx
    1164:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1167:	6a 00                	push   $0x0
    1169:	e8 9c f2 ff ff       	call   40a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    116e:	8b 1d c8 ab 00 00    	mov    0xabc8,%ebx
    1174:	e8 71 f2 ff ff       	call   3ea <uptime>
    1179:	03 45 08             	add    0x8(%ebp),%eax
    117c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    117f:	89 04 95 bc 1c 00 00 	mov    %eax,0x1cbc(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    1186:	a1 c8 ab 00 00       	mov    0xabc8,%eax
    118b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    118e:	c7 04 85 a8 1c 00 00 	movl   $0x1,0x1ca8(,%eax,4)
    1195:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1199:	e8 34 f2 ff ff       	call   3d2 <getpid>
    119e:	5a                   	pop    %edx
    119f:	59                   	pop    %ecx
    11a0:	6a 0e                	push   $0xe
    11a2:	50                   	push   %eax
    11a3:	e8 52 f2 ff ff       	call   3fa <sigsend>
  return 0;
}
    11a8:	31 c0                	xor    %eax,%eax
    11aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11ad:	c9                   	leave  
    11ae:	c3                   	ret    
    11af:	90                   	nop

000011b0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	53                   	push   %ebx
    11b4:	83 ec 04             	sub    $0x4,%esp
    11b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    11ba:	8b 45 0c             	mov    0xc(%ebp),%eax
    11bd:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    11c0:	e8 bb f7 ff ff       	call   980 <bsem_alloc>
    11c5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    11c7:	e8 b4 f7 ff ff       	call   980 <bsem_alloc>
    11cc:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    11cf:	83 c4 04             	add    $0x4,%esp
    11d2:	5b                   	pop    %ebx
    11d3:	5d                   	pop    %ebp
    11d4:	c3                   	ret    
    11d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    11d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011e0 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	83 ec 10             	sub    $0x10,%esp
    11e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    11ea:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    11f1:	ff 33                	pushl  (%ebx)
    11f3:	e8 78 f8 ff ff       	call   a70 <bsem_free>
  bsem_free(csem->bsem_2_id);
    11f8:	8b 43 04             	mov    0x4(%ebx),%eax
    11fb:	83 c4 10             	add    $0x10,%esp
}
    11fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1201:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1204:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1205:	e9 66 f8 ff ff       	jmp    a70 <bsem_free>
    120a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001210 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	83 ec 10             	sub    $0x10,%esp
    1217:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    121a:	ff 73 04             	pushl  0x4(%ebx)
    121d:	e8 de f8 ff ff       	call   b00 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1222:	58                   	pop    %eax
    1223:	ff 33                	pushl  (%ebx)
    1225:	e8 d6 f8 ff ff       	call   b00 <bsem_down>
  csem->value--;
    122a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    122d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1230:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1233:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1235:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1238:	7e 0e                	jle    1248 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    123a:	83 ec 0c             	sub    $0xc,%esp
    123d:	ff 73 04             	pushl  0x4(%ebx)
    1240:	e8 cb f9 ff ff       	call   c10 <bsem_up>
    1245:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1248:	8b 03                	mov    (%ebx),%eax
}
    124a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    124d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1250:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1251:	e9 ba f9 ff ff       	jmp    c10 <bsem_up>
    1256:	8d 76 00             	lea    0x0(%esi),%esi
    1259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001260 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1260:	55                   	push   %ebp
    1261:	89 e5                	mov    %esp,%ebp
    1263:	53                   	push   %ebx
    1264:	83 ec 10             	sub    $0x10,%esp
    1267:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    126a:	ff 33                	pushl  (%ebx)
    126c:	e8 8f f8 ff ff       	call   b00 <bsem_down>
  csem->value++;
    1271:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1274:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1277:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    127a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    127d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1280:	74 0e                	je     1290 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1282:	8b 03                	mov    (%ebx),%eax
}
    1284:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1287:	89 45 08             	mov    %eax,0x8(%ebp)
}
    128a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    128b:	e9 80 f9 ff ff       	jmp    c10 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1290:	83 ec 0c             	sub    $0xc,%esp
    1293:	ff 73 04             	pushl  0x4(%ebx)
    1296:	e8 75 f9 ff ff       	call   c10 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    129b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    129d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    12a0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12a3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12a6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12a7:	e9 64 f9 ff ff       	jmp    c10 <bsem_up>
