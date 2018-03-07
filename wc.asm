
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
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
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
      24:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;

  if(argc <= 1){
      27:	7e 56                	jle    7f <main+0x7f>
      29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      30:	83 ec 08             	sub    $0x8,%esp
      33:	6a 00                	push   $0x0
      35:	ff 33                	pushl  (%ebx)
      37:	e8 c6 03 00 00       	call   402 <open>
      3c:	83 c4 10             	add    $0x10,%esp
      3f:	85 c0                	test   %eax,%eax
      41:	89 c7                	mov    %eax,%edi
      43:	78 26                	js     6b <main+0x6b>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
      45:	83 ec 08             	sub    $0x8,%esp
      48:	ff 33                	pushl  (%ebx)
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
      4a:	83 c6 01             	add    $0x1,%esi
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
      4d:	50                   	push   %eax
      4e:	83 c3 04             	add    $0x4,%ebx
      51:	e8 4a 00 00 00       	call   a0 <wc>
    close(fd);
      56:	89 3c 24             	mov    %edi,(%esp)
      59:	e8 8c 03 00 00       	call   3ea <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
      5e:	83 c4 10             	add    $0x10,%esp
      61:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      64:	75 ca                	jne    30 <main+0x30>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
      66:	e8 57 03 00 00       	call   3c2 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      6b:	50                   	push   %eax
      6c:	ff 33                	pushl  (%ebx)
      6e:	68 3f 13 00 00       	push   $0x133f
      73:	6a 01                	push   $0x1
      75:	e8 b6 04 00 00       	call   530 <printf>
      exit();
      7a:	e8 43 03 00 00       	call   3c2 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
      7f:	52                   	push   %edx
      80:	52                   	push   %edx
      81:	68 eb 14 00 00       	push   $0x14eb
      86:	6a 00                	push   $0x0
      88:	e8 13 00 00 00       	call   a0 <wc>
    exit();
      8d:	e8 30 03 00 00       	call   3c2 <exit>
      92:	66 90                	xchg   %ax,%ax
      94:	66 90                	xchg   %ax,%ax
      96:	66 90                	xchg   %ax,%ax
      98:	66 90                	xchg   %ax,%ax
      9a:	66 90                	xchg   %ax,%ax
      9c:	66 90                	xchg   %ax,%ax
      9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
      a0:	55                   	push   %ebp
      a1:	89 e5                	mov    %esp,%ebp
      a3:	57                   	push   %edi
      a4:	56                   	push   %esi
      a5:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
      a6:	31 f6                	xor    %esi,%esi
wc(int fd, char *name)
{
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
      a8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
      aa:	83 ec 1c             	sub    $0x1c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
      ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
      b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
      bb:	90                   	nop
      bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
      c0:	83 ec 04             	sub    $0x4,%esp
      c3:	68 00 02 00 00       	push   $0x200
      c8:	68 20 1b 00 00       	push   $0x1b20
      cd:	ff 75 08             	pushl  0x8(%ebp)
      d0:	e8 05 03 00 00       	call   3da <read>
      d5:	83 c4 10             	add    $0x10,%esp
      d8:	83 f8 00             	cmp    $0x0,%eax
      db:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      de:	7e 5f                	jle    13f <wc+0x9f>
      e0:	31 ff                	xor    %edi,%edi
      e2:	eb 0e                	jmp    f2 <wc+0x52>
      e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      e8:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      ea:	83 c7 01             	add    $0x1,%edi
      ed:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
      f0:	74 3a                	je     12c <wc+0x8c>
      c++;
      if(buf[i] == '\n')
      f2:	0f be 87 20 1b 00 00 	movsbl 0x1b20(%edi),%eax
        l++;
      f9:	31 c9                	xor    %ecx,%ecx
      fb:	3c 0a                	cmp    $0xa,%al
      fd:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
     100:	83 ec 08             	sub    $0x8,%esp
     103:	50                   	push   %eax
     104:	68 1c 13 00 00       	push   $0x131c
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
     109:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
     10b:	e8 40 01 00 00       	call   250 <strchr>
     110:	83 c4 10             	add    $0x10,%esp
     113:	85 c0                	test   %eax,%eax
     115:	75 d1                	jne    e8 <wc+0x48>
        inword = 0;
      else if(!inword){
     117:	85 f6                	test   %esi,%esi
     119:	75 1d                	jne    138 <wc+0x98>
        w++;
     11b:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
     11f:	83 c7 01             	add    $0x1,%edi
     122:	39 7d e4             	cmp    %edi,-0x1c(%ebp)
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
     125:	be 01 00 00 00       	mov    $0x1,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
     12a:	75 c6                	jne    f2 <wc+0x52>
     12c:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     12f:	01 55 dc             	add    %edx,-0x24(%ebp)
     132:	eb 8c                	jmp    c0 <wc+0x20>
     134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     138:	be 01 00 00 00       	mov    $0x1,%esi
     13d:	eb ab                	jmp    ea <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
     13f:	75 24                	jne    165 <wc+0xc5>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
     141:	83 ec 08             	sub    $0x8,%esp
     144:	ff 75 0c             	pushl  0xc(%ebp)
     147:	ff 75 dc             	pushl  -0x24(%ebp)
     14a:	ff 75 e0             	pushl  -0x20(%ebp)
     14d:	53                   	push   %ebx
     14e:	68 32 13 00 00       	push   $0x1332
     153:	6a 01                	push   $0x1
     155:	e8 d6 03 00 00       	call   530 <printf>
}
     15a:	83 c4 20             	add    $0x20,%esp
     15d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     160:	5b                   	pop    %ebx
     161:	5e                   	pop    %esi
     162:	5f                   	pop    %edi
     163:	5d                   	pop    %ebp
     164:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
     165:	83 ec 08             	sub    $0x8,%esp
     168:	68 22 13 00 00       	push   $0x1322
     16d:	6a 01                	push   $0x1
     16f:	e8 bc 03 00 00       	call   530 <printf>
    exit();
     174:	e8 49 02 00 00       	call   3c2 <exit>
     179:	66 90                	xchg   %ax,%ax
     17b:	66 90                	xchg   %ax,%ax
     17d:	66 90                	xchg   %ax,%ax
     17f:	90                   	nop

00000180 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	53                   	push   %ebx
     184:	8b 45 08             	mov    0x8(%ebp),%eax
     187:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     18a:	89 c2                	mov    %eax,%edx
     18c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     190:	83 c1 01             	add    $0x1,%ecx
     193:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     197:	83 c2 01             	add    $0x1,%edx
     19a:	84 db                	test   %bl,%bl
     19c:	88 5a ff             	mov    %bl,-0x1(%edx)
     19f:	75 ef                	jne    190 <strcpy+0x10>
    ;
  return os;
}
     1a1:	5b                   	pop    %ebx
     1a2:	5d                   	pop    %ebp
     1a3:	c3                   	ret    
     1a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     1aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     1b0:	55                   	push   %ebp
     1b1:	89 e5                	mov    %esp,%ebp
     1b3:	56                   	push   %esi
     1b4:	53                   	push   %ebx
     1b5:	8b 55 08             	mov    0x8(%ebp),%edx
     1b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     1bb:	0f b6 02             	movzbl (%edx),%eax
     1be:	0f b6 19             	movzbl (%ecx),%ebx
     1c1:	84 c0                	test   %al,%al
     1c3:	75 1e                	jne    1e3 <strcmp+0x33>
     1c5:	eb 29                	jmp    1f0 <strcmp+0x40>
     1c7:	89 f6                	mov    %esi,%esi
     1c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     1d0:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     1d3:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     1d6:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     1d9:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     1dd:	84 c0                	test   %al,%al
     1df:	74 0f                	je     1f0 <strcmp+0x40>
     1e1:	89 f1                	mov    %esi,%ecx
     1e3:	38 d8                	cmp    %bl,%al
     1e5:	74 e9                	je     1d0 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     1e7:	29 d8                	sub    %ebx,%eax
}
     1e9:	5b                   	pop    %ebx
     1ea:	5e                   	pop    %esi
     1eb:	5d                   	pop    %ebp
     1ec:	c3                   	ret    
     1ed:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     1f0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     1f2:	29 d8                	sub    %ebx,%eax
}
     1f4:	5b                   	pop    %ebx
     1f5:	5e                   	pop    %esi
     1f6:	5d                   	pop    %ebp
     1f7:	c3                   	ret    
     1f8:	90                   	nop
     1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <strlen>:

uint
strlen(char *s)
{
     200:	55                   	push   %ebp
     201:	89 e5                	mov    %esp,%ebp
     203:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     206:	80 39 00             	cmpb   $0x0,(%ecx)
     209:	74 12                	je     21d <strlen+0x1d>
     20b:	31 d2                	xor    %edx,%edx
     20d:	8d 76 00             	lea    0x0(%esi),%esi
     210:	83 c2 01             	add    $0x1,%edx
     213:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     217:	89 d0                	mov    %edx,%eax
     219:	75 f5                	jne    210 <strlen+0x10>
    ;
  return n;
}
     21b:	5d                   	pop    %ebp
     21c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     21d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     21f:	5d                   	pop    %ebp
     220:	c3                   	ret    
     221:	eb 0d                	jmp    230 <memset>
     223:	90                   	nop
     224:	90                   	nop
     225:	90                   	nop
     226:	90                   	nop
     227:	90                   	nop
     228:	90                   	nop
     229:	90                   	nop
     22a:	90                   	nop
     22b:	90                   	nop
     22c:	90                   	nop
     22d:	90                   	nop
     22e:	90                   	nop
     22f:	90                   	nop

00000230 <memset>:

void*
memset(void *dst, int c, uint n)
{
     230:	55                   	push   %ebp
     231:	89 e5                	mov    %esp,%ebp
     233:	57                   	push   %edi
     234:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     237:	8b 4d 10             	mov    0x10(%ebp),%ecx
     23a:	8b 45 0c             	mov    0xc(%ebp),%eax
     23d:	89 d7                	mov    %edx,%edi
     23f:	fc                   	cld    
     240:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     242:	89 d0                	mov    %edx,%eax
     244:	5f                   	pop    %edi
     245:	5d                   	pop    %ebp
     246:	c3                   	ret    
     247:	89 f6                	mov    %esi,%esi
     249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <strchr>:

char*
strchr(const char *s, char c)
{
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	53                   	push   %ebx
     254:	8b 45 08             	mov    0x8(%ebp),%eax
     257:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     25a:	0f b6 10             	movzbl (%eax),%edx
     25d:	84 d2                	test   %dl,%dl
     25f:	74 1d                	je     27e <strchr+0x2e>
    if(*s == c)
     261:	38 d3                	cmp    %dl,%bl
     263:	89 d9                	mov    %ebx,%ecx
     265:	75 0d                	jne    274 <strchr+0x24>
     267:	eb 17                	jmp    280 <strchr+0x30>
     269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     270:	38 ca                	cmp    %cl,%dl
     272:	74 0c                	je     280 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     274:	83 c0 01             	add    $0x1,%eax
     277:	0f b6 10             	movzbl (%eax),%edx
     27a:	84 d2                	test   %dl,%dl
     27c:	75 f2                	jne    270 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     27e:	31 c0                	xor    %eax,%eax
}
     280:	5b                   	pop    %ebx
     281:	5d                   	pop    %ebp
     282:	c3                   	ret    
     283:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <gets>:

char*
gets(char *buf, int max)
{
     290:	55                   	push   %ebp
     291:	89 e5                	mov    %esp,%ebp
     293:	57                   	push   %edi
     294:	56                   	push   %esi
     295:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     296:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     298:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     29b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     29e:	eb 29                	jmp    2c9 <gets+0x39>
    cc = read(0, &c, 1);
     2a0:	83 ec 04             	sub    $0x4,%esp
     2a3:	6a 01                	push   $0x1
     2a5:	57                   	push   %edi
     2a6:	6a 00                	push   $0x0
     2a8:	e8 2d 01 00 00       	call   3da <read>
    if(cc < 1)
     2ad:	83 c4 10             	add    $0x10,%esp
     2b0:	85 c0                	test   %eax,%eax
     2b2:	7e 1d                	jle    2d1 <gets+0x41>
      break;
    buf[i++] = c;
     2b4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     2b8:	8b 55 08             	mov    0x8(%ebp),%edx
     2bb:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     2bd:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     2bf:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     2c3:	74 1b                	je     2e0 <gets+0x50>
     2c5:	3c 0d                	cmp    $0xd,%al
     2c7:	74 17                	je     2e0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2c9:	8d 5e 01             	lea    0x1(%esi),%ebx
     2cc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     2cf:	7c cf                	jl     2a0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2d1:	8b 45 08             	mov    0x8(%ebp),%eax
     2d4:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     2d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2db:	5b                   	pop    %ebx
     2dc:	5e                   	pop    %esi
     2dd:	5f                   	pop    %edi
     2de:	5d                   	pop    %ebp
     2df:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2e0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2e3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2e5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     2e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2ec:	5b                   	pop    %ebx
     2ed:	5e                   	pop    %esi
     2ee:	5f                   	pop    %edi
     2ef:	5d                   	pop    %ebp
     2f0:	c3                   	ret    
     2f1:	eb 0d                	jmp    300 <stat>
     2f3:	90                   	nop
     2f4:	90                   	nop
     2f5:	90                   	nop
     2f6:	90                   	nop
     2f7:	90                   	nop
     2f8:	90                   	nop
     2f9:	90                   	nop
     2fa:	90                   	nop
     2fb:	90                   	nop
     2fc:	90                   	nop
     2fd:	90                   	nop
     2fe:	90                   	nop
     2ff:	90                   	nop

00000300 <stat>:

int
stat(char *n, struct stat *st)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	56                   	push   %esi
     304:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     305:	83 ec 08             	sub    $0x8,%esp
     308:	6a 00                	push   $0x0
     30a:	ff 75 08             	pushl  0x8(%ebp)
     30d:	e8 f0 00 00 00       	call   402 <open>
  if(fd < 0)
     312:	83 c4 10             	add    $0x10,%esp
     315:	85 c0                	test   %eax,%eax
     317:	78 27                	js     340 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     319:	83 ec 08             	sub    $0x8,%esp
     31c:	ff 75 0c             	pushl  0xc(%ebp)
     31f:	89 c3                	mov    %eax,%ebx
     321:	50                   	push   %eax
     322:	e8 f3 00 00 00       	call   41a <fstat>
     327:	89 c6                	mov    %eax,%esi
  close(fd);
     329:	89 1c 24             	mov    %ebx,(%esp)
     32c:	e8 b9 00 00 00       	call   3ea <close>
  return r;
     331:	83 c4 10             	add    $0x10,%esp
     334:	89 f0                	mov    %esi,%eax
}
     336:	8d 65 f8             	lea    -0x8(%ebp),%esp
     339:	5b                   	pop    %ebx
     33a:	5e                   	pop    %esi
     33b:	5d                   	pop    %ebp
     33c:	c3                   	ret    
     33d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     340:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     345:	eb ef                	jmp    336 <stat+0x36>
     347:	89 f6                	mov    %esi,%esi
     349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000350 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     357:	0f be 11             	movsbl (%ecx),%edx
     35a:	8d 42 d0             	lea    -0x30(%edx),%eax
     35d:	3c 09                	cmp    $0x9,%al
     35f:	b8 00 00 00 00       	mov    $0x0,%eax
     364:	77 1f                	ja     385 <atoi+0x35>
     366:	8d 76 00             	lea    0x0(%esi),%esi
     369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     370:	8d 04 80             	lea    (%eax,%eax,4),%eax
     373:	83 c1 01             	add    $0x1,%ecx
     376:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     37a:	0f be 11             	movsbl (%ecx),%edx
     37d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     380:	80 fb 09             	cmp    $0x9,%bl
     383:	76 eb                	jbe    370 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     385:	5b                   	pop    %ebx
     386:	5d                   	pop    %ebp
     387:	c3                   	ret    
     388:	90                   	nop
     389:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000390 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	56                   	push   %esi
     394:	53                   	push   %ebx
     395:	8b 5d 10             	mov    0x10(%ebp),%ebx
     398:	8b 45 08             	mov    0x8(%ebp),%eax
     39b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     39e:	85 db                	test   %ebx,%ebx
     3a0:	7e 14                	jle    3b6 <memmove+0x26>
     3a2:	31 d2                	xor    %edx,%edx
     3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     3a8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     3ac:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     3af:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     3b2:	39 da                	cmp    %ebx,%edx
     3b4:	75 f2                	jne    3a8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     3b6:	5b                   	pop    %ebx
     3b7:	5e                   	pop    %esi
     3b8:	5d                   	pop    %ebp
     3b9:	c3                   	ret    

000003ba <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     3ba:	b8 01 00 00 00       	mov    $0x1,%eax
     3bf:	cd 40                	int    $0x40
     3c1:	c3                   	ret    

000003c2 <exit>:
SYSCALL(exit)
     3c2:	b8 02 00 00 00       	mov    $0x2,%eax
     3c7:	cd 40                	int    $0x40
     3c9:	c3                   	ret    

000003ca <wait>:
SYSCALL(wait)
     3ca:	b8 03 00 00 00       	mov    $0x3,%eax
     3cf:	cd 40                	int    $0x40
     3d1:	c3                   	ret    

000003d2 <pipe>:
SYSCALL(pipe)
     3d2:	b8 04 00 00 00       	mov    $0x4,%eax
     3d7:	cd 40                	int    $0x40
     3d9:	c3                   	ret    

000003da <read>:
SYSCALL(read)
     3da:	b8 05 00 00 00       	mov    $0x5,%eax
     3df:	cd 40                	int    $0x40
     3e1:	c3                   	ret    

000003e2 <write>:
SYSCALL(write)
     3e2:	b8 10 00 00 00       	mov    $0x10,%eax
     3e7:	cd 40                	int    $0x40
     3e9:	c3                   	ret    

000003ea <close>:
SYSCALL(close)
     3ea:	b8 15 00 00 00       	mov    $0x15,%eax
     3ef:	cd 40                	int    $0x40
     3f1:	c3                   	ret    

000003f2 <kill>:
SYSCALL(kill)
     3f2:	b8 06 00 00 00       	mov    $0x6,%eax
     3f7:	cd 40                	int    $0x40
     3f9:	c3                   	ret    

000003fa <exec>:
SYSCALL(exec)
     3fa:	b8 07 00 00 00       	mov    $0x7,%eax
     3ff:	cd 40                	int    $0x40
     401:	c3                   	ret    

00000402 <open>:
SYSCALL(open)
     402:	b8 0f 00 00 00       	mov    $0xf,%eax
     407:	cd 40                	int    $0x40
     409:	c3                   	ret    

0000040a <mknod>:
SYSCALL(mknod)
     40a:	b8 11 00 00 00       	mov    $0x11,%eax
     40f:	cd 40                	int    $0x40
     411:	c3                   	ret    

00000412 <unlink>:
SYSCALL(unlink)
     412:	b8 12 00 00 00       	mov    $0x12,%eax
     417:	cd 40                	int    $0x40
     419:	c3                   	ret    

0000041a <fstat>:
SYSCALL(fstat)
     41a:	b8 08 00 00 00       	mov    $0x8,%eax
     41f:	cd 40                	int    $0x40
     421:	c3                   	ret    

00000422 <link>:
SYSCALL(link)
     422:	b8 13 00 00 00       	mov    $0x13,%eax
     427:	cd 40                	int    $0x40
     429:	c3                   	ret    

0000042a <mkdir>:
SYSCALL(mkdir)
     42a:	b8 14 00 00 00       	mov    $0x14,%eax
     42f:	cd 40                	int    $0x40
     431:	c3                   	ret    

00000432 <chdir>:
SYSCALL(chdir)
     432:	b8 09 00 00 00       	mov    $0x9,%eax
     437:	cd 40                	int    $0x40
     439:	c3                   	ret    

0000043a <dup>:
SYSCALL(dup)
     43a:	b8 0a 00 00 00       	mov    $0xa,%eax
     43f:	cd 40                	int    $0x40
     441:	c3                   	ret    

00000442 <getpid>:
SYSCALL(getpid)
     442:	b8 0b 00 00 00       	mov    $0xb,%eax
     447:	cd 40                	int    $0x40
     449:	c3                   	ret    

0000044a <sbrk>:
SYSCALL(sbrk)
     44a:	b8 0c 00 00 00       	mov    $0xc,%eax
     44f:	cd 40                	int    $0x40
     451:	c3                   	ret    

00000452 <sleep>:
SYSCALL(sleep)
     452:	b8 0d 00 00 00       	mov    $0xd,%eax
     457:	cd 40                	int    $0x40
     459:	c3                   	ret    

0000045a <uptime>:
SYSCALL(uptime)
     45a:	b8 0e 00 00 00       	mov    $0xe,%eax
     45f:	cd 40                	int    $0x40
     461:	c3                   	ret    

00000462 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     462:	b8 16 00 00 00       	mov    $0x16,%eax
     467:	cd 40                	int    $0x40
     469:	c3                   	ret    

0000046a <sigsend>:
SYSCALL(sigsend)
     46a:	b8 17 00 00 00       	mov    $0x17,%eax
     46f:	cd 40                	int    $0x40
     471:	c3                   	ret    

00000472 <sigreturn>:
SYSCALL(sigreturn)
     472:	b8 18 00 00 00       	mov    $0x18,%eax
     477:	cd 40                	int    $0x40
     479:	c3                   	ret    

0000047a <alarm>:
SYSCALL(alarm)
     47a:	b8 19 00 00 00       	mov    $0x19,%eax
     47f:	cd 40                	int    $0x40
     481:	c3                   	ret    
     482:	66 90                	xchg   %ax,%ax
     484:	66 90                	xchg   %ax,%ax
     486:	66 90                	xchg   %ax,%ax
     488:	66 90                	xchg   %ax,%ax
     48a:	66 90                	xchg   %ax,%ax
     48c:	66 90                	xchg   %ax,%ax
     48e:	66 90                	xchg   %ax,%ax

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     490:	55                   	push   %ebp
     491:	89 e5                	mov    %esp,%ebp
     493:	57                   	push   %edi
     494:	56                   	push   %esi
     495:	53                   	push   %ebx
     496:	89 c6                	mov    %eax,%esi
     498:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     49b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     49e:	85 db                	test   %ebx,%ebx
     4a0:	74 7e                	je     520 <printint+0x90>
     4a2:	89 d0                	mov    %edx,%eax
     4a4:	c1 e8 1f             	shr    $0x1f,%eax
     4a7:	84 c0                	test   %al,%al
     4a9:	74 75                	je     520 <printint+0x90>
    neg = 1;
    x = -xx;
     4ab:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     4ad:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     4b4:	f7 d8                	neg    %eax
     4b6:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     4b9:	31 ff                	xor    %edi,%edi
     4bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     4be:	89 ce                	mov    %ecx,%esi
     4c0:	eb 08                	jmp    4ca <printint+0x3a>
     4c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     4c8:	89 cf                	mov    %ecx,%edi
     4ca:	31 d2                	xor    %edx,%edx
     4cc:	8d 4f 01             	lea    0x1(%edi),%ecx
     4cf:	f7 f6                	div    %esi
     4d1:	0f b6 92 5c 13 00 00 	movzbl 0x135c(%edx),%edx
  }while((x /= base) != 0);
     4d8:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     4da:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     4dd:	75 e9                	jne    4c8 <printint+0x38>
  if(neg)
     4df:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     4e2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     4e5:	85 c0                	test   %eax,%eax
     4e7:	74 08                	je     4f1 <printint+0x61>
    buf[i++] = '-';
     4e9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     4ee:	8d 4f 02             	lea    0x2(%edi),%ecx
     4f1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     4f5:	8d 76 00             	lea    0x0(%esi),%esi
     4f8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4fb:	83 ec 04             	sub    $0x4,%esp
     4fe:	83 ef 01             	sub    $0x1,%edi
     501:	6a 01                	push   $0x1
     503:	53                   	push   %ebx
     504:	56                   	push   %esi
     505:	88 45 d7             	mov    %al,-0x29(%ebp)
     508:	e8 d5 fe ff ff       	call   3e2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     50d:	83 c4 10             	add    $0x10,%esp
     510:	39 df                	cmp    %ebx,%edi
     512:	75 e4                	jne    4f8 <printint+0x68>
    putc(fd, buf[i]);
}
     514:	8d 65 f4             	lea    -0xc(%ebp),%esp
     517:	5b                   	pop    %ebx
     518:	5e                   	pop    %esi
     519:	5f                   	pop    %edi
     51a:	5d                   	pop    %ebp
     51b:	c3                   	ret    
     51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     520:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     522:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     529:	eb 8b                	jmp    4b6 <printint+0x26>
     52b:	90                   	nop
     52c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000530 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	57                   	push   %edi
     534:	56                   	push   %esi
     535:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     536:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     539:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     53c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     53f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     542:	89 45 d0             	mov    %eax,-0x30(%ebp)
     545:	0f b6 1e             	movzbl (%esi),%ebx
     548:	83 c6 01             	add    $0x1,%esi
     54b:	84 db                	test   %bl,%bl
     54d:	0f 84 b0 00 00 00    	je     603 <printf+0xd3>
     553:	31 d2                	xor    %edx,%edx
     555:	eb 39                	jmp    590 <printf+0x60>
     557:	89 f6                	mov    %esi,%esi
     559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     560:	83 f8 25             	cmp    $0x25,%eax
     563:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     566:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     56b:	74 18                	je     585 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     56d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     570:	83 ec 04             	sub    $0x4,%esp
     573:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     576:	6a 01                	push   $0x1
     578:	50                   	push   %eax
     579:	57                   	push   %edi
     57a:	e8 63 fe ff ff       	call   3e2 <write>
     57f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     582:	83 c4 10             	add    $0x10,%esp
     585:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     588:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     58c:	84 db                	test   %bl,%bl
     58e:	74 73                	je     603 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     590:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     592:	0f be cb             	movsbl %bl,%ecx
     595:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     598:	74 c6                	je     560 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     59a:	83 fa 25             	cmp    $0x25,%edx
     59d:	75 e6                	jne    585 <printf+0x55>
      if(c == 'd'){
     59f:	83 f8 64             	cmp    $0x64,%eax
     5a2:	0f 84 f8 00 00 00    	je     6a0 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     5a8:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     5ae:	83 f9 70             	cmp    $0x70,%ecx
     5b1:	74 5d                	je     610 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     5b3:	83 f8 73             	cmp    $0x73,%eax
     5b6:	0f 84 84 00 00 00    	je     640 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     5bc:	83 f8 63             	cmp    $0x63,%eax
     5bf:	0f 84 ea 00 00 00    	je     6af <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     5c5:	83 f8 25             	cmp    $0x25,%eax
     5c8:	0f 84 c2 00 00 00    	je     690 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5ce:	8d 45 e7             	lea    -0x19(%ebp),%eax
     5d1:	83 ec 04             	sub    $0x4,%esp
     5d4:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     5d8:	6a 01                	push   $0x1
     5da:	50                   	push   %eax
     5db:	57                   	push   %edi
     5dc:	e8 01 fe ff ff       	call   3e2 <write>
     5e1:	83 c4 0c             	add    $0xc,%esp
     5e4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     5e7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     5ea:	6a 01                	push   $0x1
     5ec:	50                   	push   %eax
     5ed:	57                   	push   %edi
     5ee:	83 c6 01             	add    $0x1,%esi
     5f1:	e8 ec fd ff ff       	call   3e2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     5f6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5fa:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     5fd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     5ff:	84 db                	test   %bl,%bl
     601:	75 8d                	jne    590 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     603:	8d 65 f4             	lea    -0xc(%ebp),%esp
     606:	5b                   	pop    %ebx
     607:	5e                   	pop    %esi
     608:	5f                   	pop    %edi
     609:	5d                   	pop    %ebp
     60a:	c3                   	ret    
     60b:	90                   	nop
     60c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     610:	83 ec 0c             	sub    $0xc,%esp
     613:	b9 10 00 00 00       	mov    $0x10,%ecx
     618:	6a 00                	push   $0x0
     61a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     61d:	89 f8                	mov    %edi,%eax
     61f:	8b 13                	mov    (%ebx),%edx
     621:	e8 6a fe ff ff       	call   490 <printint>
        ap++;
     626:	89 d8                	mov    %ebx,%eax
     628:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     62b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     62d:	83 c0 04             	add    $0x4,%eax
     630:	89 45 d0             	mov    %eax,-0x30(%ebp)
     633:	e9 4d ff ff ff       	jmp    585 <printf+0x55>
     638:	90                   	nop
     639:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     640:	8b 45 d0             	mov    -0x30(%ebp),%eax
     643:	8b 18                	mov    (%eax),%ebx
        ap++;
     645:	83 c0 04             	add    $0x4,%eax
     648:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     64b:	b8 53 13 00 00       	mov    $0x1353,%eax
     650:	85 db                	test   %ebx,%ebx
     652:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     655:	0f b6 03             	movzbl (%ebx),%eax
     658:	84 c0                	test   %al,%al
     65a:	74 23                	je     67f <printf+0x14f>
     65c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     660:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     663:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     666:	83 ec 04             	sub    $0x4,%esp
     669:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     66b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     66e:	50                   	push   %eax
     66f:	57                   	push   %edi
     670:	e8 6d fd ff ff       	call   3e2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     675:	0f b6 03             	movzbl (%ebx),%eax
     678:	83 c4 10             	add    $0x10,%esp
     67b:	84 c0                	test   %al,%al
     67d:	75 e1                	jne    660 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     67f:	31 d2                	xor    %edx,%edx
     681:	e9 ff fe ff ff       	jmp    585 <printf+0x55>
     686:	8d 76 00             	lea    0x0(%esi),%esi
     689:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     690:	83 ec 04             	sub    $0x4,%esp
     693:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     696:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     699:	6a 01                	push   $0x1
     69b:	e9 4c ff ff ff       	jmp    5ec <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     6a0:	83 ec 0c             	sub    $0xc,%esp
     6a3:	b9 0a 00 00 00       	mov    $0xa,%ecx
     6a8:	6a 01                	push   $0x1
     6aa:	e9 6b ff ff ff       	jmp    61a <printf+0xea>
     6af:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     6b2:	83 ec 04             	sub    $0x4,%esp
     6b5:	8b 03                	mov    (%ebx),%eax
     6b7:	6a 01                	push   $0x1
     6b9:	88 45 e4             	mov    %al,-0x1c(%ebp)
     6bc:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     6bf:	50                   	push   %eax
     6c0:	57                   	push   %edi
     6c1:	e8 1c fd ff ff       	call   3e2 <write>
     6c6:	e9 5b ff ff ff       	jmp    626 <printf+0xf6>
     6cb:	66 90                	xchg   %ax,%ax
     6cd:	66 90                	xchg   %ax,%ax
     6cf:	90                   	nop

000006d0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     6d0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6d1:	a1 00 1b 00 00       	mov    0x1b00,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     6d6:	89 e5                	mov    %esp,%ebp
     6d8:	57                   	push   %edi
     6d9:	56                   	push   %esi
     6da:	53                   	push   %ebx
     6db:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6de:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     6e0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6e3:	39 c8                	cmp    %ecx,%eax
     6e5:	73 19                	jae    700 <free+0x30>
     6e7:	89 f6                	mov    %esi,%esi
     6e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     6f0:	39 d1                	cmp    %edx,%ecx
     6f2:	72 1c                	jb     710 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6f4:	39 d0                	cmp    %edx,%eax
     6f6:	73 18                	jae    710 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     6f8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6fa:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6fc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6fe:	72 f0                	jb     6f0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     700:	39 d0                	cmp    %edx,%eax
     702:	72 f4                	jb     6f8 <free+0x28>
     704:	39 d1                	cmp    %edx,%ecx
     706:	73 f0                	jae    6f8 <free+0x28>
     708:	90                   	nop
     709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     710:	8b 73 fc             	mov    -0x4(%ebx),%esi
     713:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     716:	39 d7                	cmp    %edx,%edi
     718:	74 19                	je     733 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     71a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     71d:	8b 50 04             	mov    0x4(%eax),%edx
     720:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     723:	39 f1                	cmp    %esi,%ecx
     725:	74 23                	je     74a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     727:	89 08                	mov    %ecx,(%eax)
  freep = p;
     729:	a3 00 1b 00 00       	mov    %eax,0x1b00
}
     72e:	5b                   	pop    %ebx
     72f:	5e                   	pop    %esi
     730:	5f                   	pop    %edi
     731:	5d                   	pop    %ebp
     732:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     733:	03 72 04             	add    0x4(%edx),%esi
     736:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     739:	8b 10                	mov    (%eax),%edx
     73b:	8b 12                	mov    (%edx),%edx
     73d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     740:	8b 50 04             	mov    0x4(%eax),%edx
     743:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     746:	39 f1                	cmp    %esi,%ecx
     748:	75 dd                	jne    727 <free+0x57>
    p->s.size += bp->s.size;
     74a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     74d:	a3 00 1b 00 00       	mov    %eax,0x1b00
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     752:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     755:	8b 53 f8             	mov    -0x8(%ebx),%edx
     758:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     75a:	5b                   	pop    %ebx
     75b:	5e                   	pop    %esi
     75c:	5f                   	pop    %edi
     75d:	5d                   	pop    %ebp
     75e:	c3                   	ret    
     75f:	90                   	nop

00000760 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     760:	55                   	push   %ebp
     761:	89 e5                	mov    %esp,%ebp
     763:	57                   	push   %edi
     764:	56                   	push   %esi
     765:	53                   	push   %ebx
     766:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     769:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     76c:	8b 15 00 1b 00 00    	mov    0x1b00,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     772:	8d 78 07             	lea    0x7(%eax),%edi
     775:	c1 ef 03             	shr    $0x3,%edi
     778:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     77b:	85 d2                	test   %edx,%edx
     77d:	0f 84 a3 00 00 00    	je     826 <malloc+0xc6>
     783:	8b 02                	mov    (%edx),%eax
     785:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     788:	39 cf                	cmp    %ecx,%edi
     78a:	76 74                	jbe    800 <malloc+0xa0>
     78c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     792:	be 00 10 00 00       	mov    $0x1000,%esi
     797:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     79e:	0f 43 f7             	cmovae %edi,%esi
     7a1:	ba 00 80 00 00       	mov    $0x8000,%edx
     7a6:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     7ac:	0f 46 da             	cmovbe %edx,%ebx
     7af:	eb 10                	jmp    7c1 <malloc+0x61>
     7b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     7b8:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     7ba:	8b 48 04             	mov    0x4(%eax),%ecx
     7bd:	39 cf                	cmp    %ecx,%edi
     7bf:	76 3f                	jbe    800 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     7c1:	39 05 00 1b 00 00    	cmp    %eax,0x1b00
     7c7:	89 c2                	mov    %eax,%edx
     7c9:	75 ed                	jne    7b8 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     7cb:	83 ec 0c             	sub    $0xc,%esp
     7ce:	53                   	push   %ebx
     7cf:	e8 76 fc ff ff       	call   44a <sbrk>
  if(p == (char*)-1)
     7d4:	83 c4 10             	add    $0x10,%esp
     7d7:	83 f8 ff             	cmp    $0xffffffff,%eax
     7da:	74 1c                	je     7f8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     7dc:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     7df:	83 ec 0c             	sub    $0xc,%esp
     7e2:	83 c0 08             	add    $0x8,%eax
     7e5:	50                   	push   %eax
     7e6:	e8 e5 fe ff ff       	call   6d0 <free>
  return freep;
     7eb:	8b 15 00 1b 00 00    	mov    0x1b00,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     7f1:	83 c4 10             	add    $0x10,%esp
     7f4:	85 d2                	test   %edx,%edx
     7f6:	75 c0                	jne    7b8 <malloc+0x58>
        return 0;
     7f8:	31 c0                	xor    %eax,%eax
     7fa:	eb 1c                	jmp    818 <malloc+0xb8>
     7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     800:	39 cf                	cmp    %ecx,%edi
     802:	74 1c                	je     820 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     804:	29 f9                	sub    %edi,%ecx
     806:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     809:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     80c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     80f:	89 15 00 1b 00 00    	mov    %edx,0x1b00
      return (void*)(p + 1);
     815:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     818:	8d 65 f4             	lea    -0xc(%ebp),%esp
     81b:	5b                   	pop    %ebx
     81c:	5e                   	pop    %esi
     81d:	5f                   	pop    %edi
     81e:	5d                   	pop    %ebp
     81f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     820:	8b 08                	mov    (%eax),%ecx
     822:	89 0a                	mov    %ecx,(%edx)
     824:	eb e9                	jmp    80f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     826:	c7 05 00 1b 00 00 04 	movl   $0x1b04,0x1b00
     82d:	1b 00 00 
     830:	c7 05 04 1b 00 00 04 	movl   $0x1b04,0x1b04
     837:	1b 00 00 
    base.s.size = 0;
     83a:	b8 04 1b 00 00       	mov    $0x1b04,%eax
     83f:	c7 05 08 1b 00 00 00 	movl   $0x0,0x1b08
     846:	00 00 00 
     849:	e9 3e ff ff ff       	jmp    78c <malloc+0x2c>
     84e:	66 90                	xchg   %ax,%ax

00000850 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	56                   	push   %esi
     854:	53                   	push   %ebx
     855:	8b 75 0c             	mov    0xc(%ebp),%esi
     858:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     85b:	83 ec 08             	sub    $0x8,%esp
     85e:	68 70 13 00 00       	push   $0x1370
     863:	6a 01                	push   $0x1
     865:	e8 c6 fc ff ff       	call   530 <printf>
  alarm(UTHREAD_QUANTA);
     86a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     871:	e8 04 fc ff ff       	call   47a <alarm>
  start_func(arg);
     876:	89 75 08             	mov    %esi,0x8(%ebp)
     879:	83 c4 10             	add    $0x10,%esp
}
     87c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     87f:	89 d8                	mov    %ebx,%eax
}
     881:	5b                   	pop    %ebx
     882:	5e                   	pop    %esi
     883:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     884:	ff e0                	jmp    *%eax
     886:	8d 76 00             	lea    0x0(%esi),%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000890 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	53                   	push   %ebx
     894:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     897:	6a 00                	push   $0x0
     899:	e8 dc fb ff ff       	call   47a <alarm>
  printf(1,"exiting...\n");
     89e:	5a                   	pop    %edx
     89f:	59                   	pop    %ecx
     8a0:	68 e0 14 00 00       	push   $0x14e0
     8a5:	6a 01                	push   $0x1
     8a7:	e8 84 fc ff ff       	call   530 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     8ac:	a1 48 ac 00 00       	mov    0xac48,%eax
     8b1:	83 c4 10             	add    $0x10,%esp
     8b4:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     8b7:	8b 1c 95 20 1d 00 00 	mov    0x1d20(,%edx,4),%ebx
     8be:	85 db                	test   %ebx,%ebx
     8c0:	75 0a                	jne    8cc <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     8c2:	c7 05 28 1d 00 00 00 	movl   $0x0,0x1d28
     8c9:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     8cc:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     8cf:	83 ec 0c             	sub    $0xc,%esp
     8d2:	ff 34 85 24 1d 00 00 	pushl  0x1d24(,%eax,4)
     8d9:	e8 f2 fd ff ff       	call   6d0 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     8de:	a1 48 ac 00 00       	mov    0xac48,%eax
     8e3:	83 c4 10             	add    $0x10,%esp
     8e6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     8e9:	b8 28 1d 00 00       	mov    $0x1d28,%eax
     8ee:	c1 e2 02             	shl    $0x2,%edx
     8f1:	c7 82 28 1d 00 00 00 	movl   $0x0,0x1d28(%edx)
     8f8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     8fb:	c7 82 20 1d 00 00 ff 	movl   $0xffffffff,0x1d20(%edx)
     902:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     905:	c7 82 2c 1d 00 00 00 	movl   $0x0,0x1d2c(%edx)
     90c:	00 00 00 
  threads[index_currently_running].esp = 0;
     90f:	c7 82 30 1d 00 00 00 	movl   $0x0,0x1d30(%edx)
     916:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     919:	c7 82 3c 1d 00 00 00 	movl   $0x0,0x1d3c(%edx)
     920:	00 00 00 
  threads[index_currently_running].join = -1;
     923:	c7 82 40 1d 00 00 ff 	movl   $0xffffffff,0x1d40(%edx)
     92a:	ff ff ff 
     92d:	eb 0b                	jmp    93a <uthread_exit+0xaa>
     92f:	90                   	nop
     930:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     933:	3d 28 26 00 00       	cmp    $0x2628,%eax
     938:	74 15                	je     94f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     93a:	83 38 04             	cmpl   $0x4,(%eax)
     93d:	75 f1                	jne    930 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     93f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     945:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     948:	3d 28 26 00 00       	cmp    $0x2628,%eax
     94d:	75 eb                	jne    93a <uthread_exit+0xaa>
     94f:	bb 4c 1d 00 00       	mov    $0x1d4c,%ebx
     954:	eb 15                	jmp    96b <uthread_exit+0xdb>
     956:	8d 76 00             	lea    0x0(%esi),%esi
     959:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     960:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     963:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
     969:	74 24                	je     98f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     96b:	8b 03                	mov    (%ebx),%eax
     96d:	85 c0                	test   %eax,%eax
     96f:	74 ef                	je     960 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     971:	e8 cc fa ff ff       	call   442 <getpid>
     976:	83 ec 08             	sub    $0x8,%esp
     979:	83 c3 24             	add    $0x24,%ebx
     97c:	6a 0e                	push   $0xe
     97e:	50                   	push   %eax
     97f:	e8 e6 fa ff ff       	call   46a <sigsend>
     984:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     987:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
     98d:	75 dc                	jne    96b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     98f:	e8 2e fa ff ff       	call   3c2 <exit>
     994:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     99a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000009a0 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     9a0:	55                   	push   %ebp
     9a1:	ba 48 27 00 00       	mov    $0x2748,%edx
     9a6:	89 e5                	mov    %esp,%ebp
     9a8:	90                   	nop
     9a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     9b0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     9b6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     9c0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     9c6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     9c9:	39 d0                	cmp    %edx,%eax
     9cb:	75 f3                	jne    9c0 <init_bsem+0x20>
     9cd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     9d3:	81 fa 48 ad 00 00    	cmp    $0xad48,%edx
     9d9:	75 d5                	jne    9b0 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     9db:	c7 05 0c 1b 00 00 01 	movl   $0x1,0x1b0c
     9e2:	00 00 00 
}
     9e5:	5d                   	pop    %ebp
     9e6:	c3                   	ret    
     9e7:	89 f6                	mov    %esi,%esi
     9e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009f0 <bsem_alloc>:

int bsem_alloc() {
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	53                   	push   %ebx
     9f4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     9f7:	6a 00                	push   $0x0
     9f9:	e8 7c fa ff ff       	call   47a <alarm>
  int i;
  if(first_run_bsem == 0)
     9fe:	a1 0c 1b 00 00       	mov    0x1b0c,%eax
     a03:	83 c4 10             	add    $0x10,%esp
     a06:	85 c0                	test   %eax,%eax
     a08:	75 3b                	jne    a45 <bsem_alloc+0x55>
     a0a:	ba 48 27 00 00       	mov    $0x2748,%edx
     a0f:	90                   	nop
     a10:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     a16:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     a1c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     a20:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     a26:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     a29:	39 d0                	cmp    %edx,%eax
     a2b:	75 f3                	jne    a20 <bsem_alloc+0x30>
     a2d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     a33:	81 fa 48 ad 00 00    	cmp    $0xad48,%edx
     a39:	75 d5                	jne    a10 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     a3b:	c7 05 0c 1b 00 00 01 	movl   $0x1,0x1b0c
     a42:	00 00 00 
     a45:	ba 48 27 00 00       	mov    $0x2748,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     a4a:	31 c0                	xor    %eax,%eax
     a4c:	eb 10                	jmp    a5e <bsem_alloc+0x6e>
     a4e:	83 c0 01             	add    $0x1,%eax
     a51:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     a57:	3d 80 00 00 00       	cmp    $0x80,%eax
     a5c:	74 4f                	je     aad <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     a5e:	83 3a 01             	cmpl   $0x1,(%edx)
     a61:	75 eb                	jne    a4e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     a63:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     a69:	8b 15 f0 1a 00 00    	mov    0x1af0,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a6f:	83 ec 0c             	sub    $0xc,%esp
     a72:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     a74:	8d 98 40 26 00 00    	lea    0x2640(%eax),%ebx
     a7a:	89 90 44 26 00 00    	mov    %edx,0x2644(%eax)
    binSemCounter++;
     a80:	83 c2 01             	add    $0x1,%edx
     a83:	89 15 f0 1a 00 00    	mov    %edx,0x1af0
    binSemaphore[i].lock = 1; // not locked
     a89:	c7 80 40 26 00 00 01 	movl   $0x1,0x2640(%eax)
     a90:	00 00 00 
    binSemaphore[i].state = USED;
     a93:	c7 80 48 27 00 00 00 	movl   $0x0,0x2748(%eax)
     a9a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a9d:	e8 d8 f9 ff ff       	call   47a <alarm>
    return binSemaphore[i].id;
     aa2:	8b 43 04             	mov    0x4(%ebx),%eax
     aa5:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     aa8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     aab:	c9                   	leave  
     aac:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     aad:	83 ec 08             	sub    $0x8,%esp
     ab0:	68 90 13 00 00       	push   $0x1390
     ab5:	6a 01                	push   $0x1
     ab7:	e8 74 fa ff ff       	call   530 <printf>
    alarm(UTHREAD_QUANTA);
     abc:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     ac3:	e8 b2 f9 ff ff       	call   47a <alarm>
    return -1;
     ac8:	83 c4 10             	add    $0x10,%esp
     acb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     ad0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ad3:	c9                   	leave  
     ad4:	c3                   	ret    
     ad5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     ad9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ae0 <bsem_free>:

void bsem_free(int id) {
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	53                   	push   %ebx
     ae4:	83 ec 10             	sub    $0x10,%esp
     ae7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     aea:	6a 00                	push   $0x0
     aec:	e8 89 f9 ff ff       	call   47a <alarm>
     af1:	ba 44 26 00 00       	mov    $0x2644,%edx
     af6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     af9:	31 c0                	xor    %eax,%eax
     afb:	eb 13                	jmp    b10 <bsem_free+0x30>
     afd:	8d 76 00             	lea    0x0(%esi),%esi
     b00:	83 c0 01             	add    $0x1,%eax
     b03:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     b09:	3d 80 00 00 00       	cmp    $0x80,%eax
     b0e:	74 38                	je     b48 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     b10:	39 1a                	cmp    %ebx,(%edx)
     b12:	75 ec                	jne    b00 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     b14:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     b1a:	05 40 26 00 00       	add    $0x2640,%eax
     b1f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     b26:	74 0a                	je     b32 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     b28:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     b2f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b32:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     b39:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b3c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b3d:	e9 38 f9 ff ff       	jmp    47a <alarm>
     b42:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     b48:	83 ec 04             	sub    $0x4,%esp
     b4b:	53                   	push   %ebx
     b4c:	68 ec 14 00 00       	push   $0x14ec
     b51:	6a 01                	push   $0x1
     b53:	e8 d8 f9 ff ff       	call   530 <printf>
     b58:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b5b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     b62:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b65:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b66:	e9 0f f9 ff ff       	jmp    47a <alarm>
     b6b:	90                   	nop
     b6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b70 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     b70:	55                   	push   %ebp
     b71:	89 e5                	mov    %esp,%ebp
     b73:	53                   	push   %ebx
     b74:	83 ec 10             	sub    $0x10,%esp
     b77:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b7a:	6a 00                	push   $0x0
     b7c:	e8 f9 f8 ff ff       	call   47a <alarm>
     b81:	b8 44 26 00 00       	mov    $0x2644,%eax
     b86:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b89:	31 d2                	xor    %edx,%edx
     b8b:	eb 17                	jmp    ba4 <bsem_down+0x34>
     b8d:	8d 76 00             	lea    0x0(%esi),%esi
     b90:	83 c2 01             	add    $0x1,%edx
     b93:	05 0c 01 00 00       	add    $0x10c,%eax
     b98:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     b9e:	0f 84 8c 00 00 00    	je     c30 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     ba4:	39 18                	cmp    %ebx,(%eax)
     ba6:	75 e8                	jne    b90 <bsem_down+0x20>
     ba8:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     bae:	85 c9                	test   %ecx,%ecx
     bb0:	75 de                	jne    b90 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     bb2:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     bb8:	31 c0                	xor    %eax,%eax
     bba:	83 b9 40 26 00 00 01 	cmpl   $0x1,0x2640(%ecx)
     bc1:	75 15                	jne    bd8 <bsem_down+0x68>
     bc3:	e9 93 00 00 00       	jmp    c5b <bsem_down+0xeb>
     bc8:	90                   	nop
     bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     bd0:	83 c0 01             	add    $0x1,%eax
     bd3:	83 f8 40             	cmp    $0x40,%eax
     bd6:	74 7b                	je     c53 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     bd8:	83 bc 81 48 26 00 00 	cmpl   $0xffffffff,0x2648(%ecx,%eax,4)
     bdf:	ff 
     be0:	75 ee                	jne    bd0 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     be2:	8b 0d 48 ac 00 00    	mov    0xac48,%ecx
     be8:	6b d2 43             	imul   $0x43,%edx,%edx
     beb:	01 c2                	add    %eax,%edx
     bed:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     bf0:	8b 04 85 20 1d 00 00 	mov    0x1d20(,%eax,4),%eax
     bf7:	89 04 95 48 26 00 00 	mov    %eax,0x2648(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     bfe:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     c01:	c7 04 85 28 1d 00 00 	movl   $0x4,0x1d28(,%eax,4)
     c08:	04 00 00 00 

	 sigsend(getpid(),14);
     c0c:	e8 31 f8 ff ff       	call   442 <getpid>
     c11:	83 ec 08             	sub    $0x8,%esp
     c14:	6a 0e                	push   $0xe
     c16:	50                   	push   %eax
     c17:	e8 4e f8 ff ff       	call   46a <sigsend>
     c1c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c1f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     c26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c29:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c2a:	e9 4b f8 ff ff       	jmp    47a <alarm>
     c2f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     c30:	83 ec 04             	sub    $0x4,%esp
     c33:	53                   	push   %ebx
     c34:	68 b0 13 00 00       	push   $0x13b0
     c39:	6a 01                	push   $0x1
     c3b:	e8 f0 f8 ff ff       	call   530 <printf>
     c40:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     c43:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     c4a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c4e:	e9 27 f8 ff ff       	jmp    47a <alarm>
     c53:	8b 0d 48 ac 00 00    	mov    0xac48,%ecx
     c59:	eb a3                	jmp    bfe <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     c5b:	c7 81 40 26 00 00 00 	movl   $0x0,0x2640(%ecx)
     c62:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c65:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     c6c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c6f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c70:	e9 05 f8 ff ff       	jmp    47a <alarm>
     c75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c80 <bsem_up>:
}

void bsem_up(int id) {
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	57                   	push   %edi
     c84:	56                   	push   %esi
     c85:	53                   	push   %ebx
     c86:	83 ec 28             	sub    $0x28,%esp
     c89:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     c8c:	6a 00                	push   $0x0
     c8e:	e8 e7 f7 ff ff       	call   47a <alarm>
     c93:	ba 44 26 00 00       	mov    $0x2644,%edx
     c98:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c9b:	31 c0                	xor    %eax,%eax
     c9d:	eb 15                	jmp    cb4 <bsem_up+0x34>
     c9f:	90                   	nop
     ca0:	83 c0 01             	add    $0x1,%eax
     ca3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     ca9:	3d 80 00 00 00       	cmp    $0x80,%eax
     cae:	0f 84 ac 00 00 00    	je     d60 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     cb4:	39 1a                	cmp    %ebx,(%edx)
     cb6:	75 e8                	jne    ca0 <bsem_up+0x20>
     cb8:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     cbe:	85 c9                	test   %ecx,%ecx
     cc0:	75 de                	jne    ca0 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     cc2:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     cc8:	8b 97 40 26 00 00    	mov    0x2640(%edi),%edx
     cce:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     cd1:	85 d2                	test   %edx,%edx
     cd3:	0f 85 9c 00 00 00    	jne    d75 <bsem_up+0xf5>
     cd9:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     cdb:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     cde:	8b b4 be 48 26 00 00 	mov    0x2648(%esi,%edi,4),%esi
     ce5:	83 fe ff             	cmp    $0xffffffff,%esi
     ce8:	74 56                	je     d40 <bsem_up+0xc0>
     cea:	b9 20 1d 00 00       	mov    $0x1d20,%ecx
     cef:	31 d2                	xor    %edx,%edx
     cf1:	eb 10                	jmp    d03 <bsem_up+0x83>
     cf3:	90                   	nop
     cf4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     cf8:	83 c2 01             	add    $0x1,%edx
     cfb:	83 c1 24             	add    $0x24,%ecx
     cfe:	83 fa 40             	cmp    $0x40,%edx
     d01:	74 3d                	je     d40 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     d03:	8b 19                	mov    (%ecx),%ebx
     d05:	39 de                	cmp    %ebx,%esi
     d07:	75 ef                	jne    cf8 <bsem_up+0x78>
     d09:	83 fb ff             	cmp    $0xffffffff,%ebx
     d0c:	74 ea                	je     cf8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     d0e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     d11:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     d14:	c7 04 95 28 1d 00 00 	movl   $0x2,0x1d28(,%edx,4)
     d1b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     d1f:	01 c7                	add    %eax,%edi
     d21:	c7 04 bd 48 26 00 00 	movl   $0xffffffff,0x2648(,%edi,4)
     d28:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     d2c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
     d36:	5b                   	pop    %ebx
     d37:	5e                   	pop    %esi
     d38:	5f                   	pop    %edi
     d39:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     d3a:	e9 3b f7 ff ff       	jmp    47a <alarm>
     d3f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     d40:	83 c7 01             	add    $0x1,%edi
     d43:	83 ff 40             	cmp    $0x40,%edi
     d46:	75 93                	jne    cdb <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     d48:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     d4e:	c7 80 40 26 00 00 01 	movl   $0x1,0x2640(%eax)
     d55:	00 00 00 
     d58:	eb d2                	jmp    d2c <bsem_up+0xac>
     d5a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     d60:	83 ec 04             	sub    $0x4,%esp
     d63:	53                   	push   %ebx
     d64:	68 18 14 00 00       	push   $0x1418
     d69:	6a 01                	push   $0x1
     d6b:	e8 c0 f7 ff ff       	call   530 <printf>
     d70:	83 c4 10             	add    $0x10,%esp
     d73:	eb b7                	jmp    d2c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     d75:	83 ec 08             	sub    $0x8,%esp
     d78:	68 f4 13 00 00       	push   $0x13f4
     d7d:	6a 01                	push   $0x1
     d7f:	e8 ac f7 ff ff       	call   530 <printf>
     d84:	83 c4 10             	add    $0x10,%esp
     d87:	eb a3                	jmp    d2c <bsem_up+0xac>
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d90 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     d90:	55                   	push   %ebp
     d91:	89 e5                	mov    %esp,%ebp
     d93:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     d96:	68 5c 14 00 00       	push   $0x145c
     d9b:	6a 01                	push   $0x1
     d9d:	e8 8e f7 ff ff       	call   530 <printf>
     da2:	b8 20 1d 00 00       	mov    $0x1d20,%eax
     da7:	83 c4 10             	add    $0x10,%esp
     daa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     db0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     db6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     dbd:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     dc0:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     dc7:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     dce:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     dd5:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     ddc:	3d 20 26 00 00       	cmp    $0x2620,%eax
     de1:	75 cd                	jne    db0 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     de3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     de6:	c7 05 20 1d 00 00 00 	movl   $0x0,0x1d20
     ded:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     df0:	c7 05 28 1d 00 00 03 	movl   $0x3,0x1d28
     df7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     dfa:	68 90 0f 00 00       	push   $0xf90
     dff:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     e01:	c7 05 24 1d 00 00 00 	movl   $0x0,0x1d24
     e08:	00 00 00 

  id_number_thread = 1;
     e0b:	c7 05 44 ac 00 00 01 	movl   $0x1,0xac44
     e12:	00 00 00 
  index_currently_running = 0;
     e15:	c7 05 48 ac 00 00 00 	movl   $0x0,0xac48
     e1c:	00 00 00 
  currently_running = 0;
     e1f:	c7 05 20 26 00 00 00 	movl   $0x0,0x2620
     e26:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     e29:	e8 34 f6 ff ff       	call   462 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     e2e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e35:	e8 40 f6 ff ff       	call   47a <alarm>
  return 0;
}
     e3a:	31 c0                	xor    %eax,%eax
     e3c:	c9                   	leave  
     e3d:	c3                   	ret    
     e3e:	66 90                	xchg   %ax,%ax

00000e40 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	56                   	push   %esi
     e44:	53                   	push   %ebx
  alarm(0);
     e45:	83 ec 0c             	sub    $0xc,%esp
     e48:	6a 00                	push   $0x0
     e4a:	e8 2b f6 ff ff       	call   47a <alarm>
  printf(1, "------ creating a new thread ------\n");
     e4f:	5b                   	pop    %ebx
     e50:	5e                   	pop    %esi
     e51:	68 88 14 00 00       	push   $0x1488
     e56:	6a 01                	push   $0x1
     e58:	e8 d3 f6 ff ff       	call   530 <printf>
     e5d:	ba 28 1d 00 00       	mov    $0x1d28,%edx
     e62:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     e65:	31 c0                	xor    %eax,%eax
     e67:	eb 12                	jmp    e7b <uthread_create+0x3b>
     e69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e70:	83 c0 01             	add    $0x1,%eax
     e73:	83 c2 24             	add    $0x24,%edx
     e76:	83 f8 40             	cmp    $0x40,%eax
     e79:	74 7d                	je     ef8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     e7b:	8b 0a                	mov    (%edx),%ecx
     e7d:	85 c9                	test   %ecx,%ecx
     e7f:	75 ef                	jne    e70 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e81:	8b 15 44 ac 00 00    	mov    0xac44,%edx
     e87:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e8a:	83 ec 0c             	sub    $0xc,%esp
     e8d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e92:	c1 e3 02             	shl    $0x2,%ebx
     e95:	89 93 20 1d 00 00    	mov    %edx,0x1d20(%ebx)
  id_number_thread++;
     e9b:	83 c2 01             	add    $0x1,%edx
     e9e:	89 15 44 ac 00 00    	mov    %edx,0xac44

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     ea4:	e8 b7 f8 ff ff       	call   760 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     ea9:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     eac:	c7 80 f4 0f 00 00 90 	movl   $0x890,0xff4(%eax)
     eb3:	08 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     eb6:	89 83 24 1d 00 00    	mov    %eax,0x1d24(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     ebc:	c7 83 28 1d 00 00 02 	movl   $0x2,0x1d28(%ebx)
     ec3:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     ec6:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     ecc:	8b 55 0c             	mov    0xc(%ebp),%edx
     ecf:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     ed5:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     edc:	e8 99 f5 ff ff       	call   47a <alarm>
  return   threads[free_thread].thread_id;
     ee1:	8b 83 20 1d 00 00    	mov    0x1d20(%ebx),%eax
     ee7:	83 c4 10             	add    $0x10,%esp
}
     eea:	8d 65 f8             	lea    -0x8(%ebp),%esp
     eed:	5b                   	pop    %ebx
     eee:	5e                   	pop    %esi
     eef:	5d                   	pop    %ebp
     ef0:	c3                   	ret    
     ef1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     ef8:	83 ec 08             	sub    $0x8,%esp
     efb:	68 fe 14 00 00       	push   $0x14fe
     f00:	6a 01                	push   $0x1
     f02:	e8 29 f6 ff ff       	call   530 <printf>
    alarm(UTHREAD_QUANTA);
     f07:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     f0e:	e8 67 f5 ff ff       	call   47a <alarm>
    return -1;
     f13:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     f16:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     f19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     f1e:	5b                   	pop    %ebx
     f1f:	5e                   	pop    %esi
     f20:	5d                   	pop    %ebp
     f21:	c3                   	ret    
     f22:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000f30 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     f36:	85 c0                	test   %eax,%eax
     f38:	74 14                	je     f4e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     f3a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     f3d:	89 e2                	mov    %esp,%edx
     f3f:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
     f46:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     f49:	89 ea                	mov    %ebp,%edx
     f4b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     f4e:	a1 48 ac 00 00       	mov    0xac48,%eax
     f53:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     f56:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     f5d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     f60:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     f67:	85 d2                	test   %edx,%edx
     f69:	74 0d                	je     f78 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     f6b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     f6d:	8b 40 0c             	mov    0xc(%eax),%eax
     f70:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     f72:	5d                   	pop    %ebp
     f73:	c3                   	ret    
     f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f78:	8b 40 04             	mov    0x4(%eax),%eax
     f7b:	05 f4 0f 00 00       	add    $0xff4,%eax
     f80:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f82:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     f84:	b8 50 08 00 00       	mov    $0x850,%eax
     f89:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     f8b:	5d                   	pop    %ebp
     f8c:	c3                   	ret    
     f8d:	8d 76 00             	lea    0x0(%esi),%esi

00000f90 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     f90:	55                   	push   %ebp
     f91:	89 e5                	mov    %esp,%ebp
     f93:	56                   	push   %esi
     f94:	53                   	push   %ebx
     f95:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     f98:	83 ec 0c             	sub    $0xc,%esp
     f9b:	6a 00                	push   $0x0
     f9d:	e8 d8 f4 ff ff       	call   47a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     fa2:	a1 48 ac 00 00       	mov    0xac48,%eax
     fa7:	83 c4 10             	add    $0x10,%esp
     faa:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     fad:	8d 14 95 20 1d 00 00 	lea    0x1d20(,%edx,4),%edx
     fb4:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     fb8:	75 0b                	jne    fc5 <uthread_schedule+0x35>
     fba:	85 c0                	test   %eax,%eax
     fbc:	74 07                	je     fc5 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     fbe:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     fc5:	bb 28 1d 00 00       	mov    $0x1d28,%ebx
     fca:	eb 0f                	jmp    fdb <uthread_schedule+0x4b>
     fcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fd0:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     fd3:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
     fd9:	74 55                	je     1030 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     fdb:	83 3b 01             	cmpl   $0x1,(%ebx)
     fde:	75 f0                	jne    fd0 <uthread_schedule+0x40>
     fe0:	8b 73 14             	mov    0x14(%ebx),%esi
     fe3:	85 f6                	test   %esi,%esi
     fe5:	0f 85 a5 00 00 00    	jne    1090 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     feb:	8b 43 18             	mov    0x18(%ebx),%eax
     fee:	83 f8 ff             	cmp    $0xffffffff,%eax
     ff1:	74 dd                	je     fd0 <uthread_schedule+0x40>
     ff3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     ff6:	8b 14 95 28 1d 00 00 	mov    0x1d28(,%edx,4),%edx
     ffd:	85 d2                	test   %edx,%edx
     fff:	75 cf                	jne    fd0 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
    1001:	50                   	push   %eax
    1002:	ff 73 f8             	pushl  -0x8(%ebx)
    1005:	83 c3 24             	add    $0x24,%ebx
    1008:	68 b0 14 00 00       	push   $0x14b0
    100d:	6a 01                	push   $0x1
    100f:	e8 1c f5 ff ff       	call   530 <printf>
      threads[i].join = -1;
    1014:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
    101b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
    1022:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1025:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
    102b:	75 ae                	jne    fdb <uthread_schedule+0x4b>
    102d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1030:	8b 15 48 ac 00 00    	mov    0xac48,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    1036:	b9 40 00 00 00       	mov    $0x40,%ecx
    103b:	8d 42 01             	lea    0x1(%edx),%eax
    103e:	eb 08                	jmp    1048 <uthread_schedule+0xb8>
    1040:	83 c0 01             	add    $0x1,%eax
    1043:	83 e9 01             	sub    $0x1,%ecx
    1046:	74 78                	je     10c0 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    1048:	89 c3                	mov    %eax,%ebx
    104a:	c1 fb 1f             	sar    $0x1f,%ebx
    104d:	c1 eb 1a             	shr    $0x1a,%ebx
    1050:	01 d8                	add    %ebx,%eax
    1052:	83 e0 3f             	and    $0x3f,%eax
    1055:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    1057:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    105a:	83 3c 9d 28 1d 00 00 	cmpl   $0x2,0x1d28(,%ebx,4)
    1061:	02 
    1062:	75 dc                	jne    1040 <uthread_schedule+0xb0>
    1064:	39 c2                	cmp    %eax,%edx
    1066:	74 d8                	je     1040 <uthread_schedule+0xb0>
      index_currently_running = i;
    1068:	a3 48 ac 00 00       	mov    %eax,0xac48
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    106d:	83 ec 08             	sub    $0x8,%esp
    1070:	50                   	push   %eax
    1071:	52                   	push   %edx
    1072:	e8 b9 fe ff ff       	call   f30 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    1077:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    107e:	e8 f7 f3 ff ff       	call   47a <alarm>
}
    1083:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1086:	5b                   	pop    %ebx
    1087:	5e                   	pop    %esi
    1088:	5d                   	pop    %ebp
    1089:	c3                   	ret    
    108a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1090:	e8 c5 f3 ff ff       	call   45a <uptime>
    1095:	39 c6                	cmp    %eax,%esi
    1097:	7f 17                	jg     10b0 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1099:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    109f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    10a6:	e9 25 ff ff ff       	jmp    fd0 <uthread_schedule+0x40>
    10ab:	90                   	nop
    10ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    10b0:	83 3b 01             	cmpl   $0x1,(%ebx)
    10b3:	0f 84 32 ff ff ff    	je     feb <uthread_schedule+0x5b>
    10b9:	e9 12 ff ff ff       	jmp    fd0 <uthread_schedule+0x40>
    10be:	66 90                	xchg   %ax,%ax
    10c0:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    10c3:	83 3c 85 28 1d 00 00 	cmpl   $0x2,0x1d28(,%eax,4)
    10ca:	02 
    10cb:	0f 85 c7 fe ff ff    	jne    f98 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    10d1:	89 d0                	mov    %edx,%eax
    10d3:	eb 98                	jmp    106d <uthread_schedule+0xdd>
    10d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    10d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010e0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    10e0:	a1 48 ac 00 00       	mov    0xac48,%eax
  exit();
}

int
uthread_self()
{
    10e5:	55                   	push   %ebp
    10e6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    10e8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    10eb:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    10ec:	8b 04 85 20 1d 00 00 	mov    0x1d20(,%eax,4),%eax
}
    10f3:	c3                   	ret    
    10f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001100 <uthread_join>:

int
uthread_join(int tid)
{
    1100:	55                   	push   %ebp
    1101:	89 e5                	mov    %esp,%ebp
    1103:	56                   	push   %esi
    1104:	53                   	push   %ebx
    1105:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1108:	39 35 44 ac 00 00    	cmp    %esi,0xac44
    110e:	0f 8c ab 00 00 00    	jl     11bf <uthread_join+0xbf>
    1114:	89 f0                	mov    %esi,%eax
    1116:	c1 e8 1f             	shr    $0x1f,%eax
    1119:	84 c0                	test   %al,%al
    111b:	0f 85 9e 00 00 00    	jne    11bf <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1121:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1124:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1126:	6a 00                	push   $0x0
    1128:	e8 4d f3 ff ff       	call   47a <alarm>
    112d:	b8 20 1d 00 00       	mov    $0x1d20,%eax
    1132:	83 c4 10             	add    $0x10,%esp
    1135:	eb 14                	jmp    114b <uthread_join+0x4b>
    1137:	89 f6                	mov    %esi,%esi
    1139:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1140:	83 c3 01             	add    $0x1,%ebx
    1143:	83 c0 24             	add    $0x24,%eax
    1146:	83 fb 40             	cmp    $0x40,%ebx
    1149:	74 55                	je     11a0 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    114b:	3b 30                	cmp    (%eax),%esi
    114d:	75 f1                	jne    1140 <uthread_join+0x40>
    114f:	8b 50 08             	mov    0x8(%eax),%edx
    1152:	85 d2                	test   %edx,%edx
    1154:	74 ea                	je     1140 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1156:	53                   	push   %ebx
    1157:	ff 35 48 ac 00 00    	pushl  0xac48
    115d:	68 3a 15 00 00       	push   $0x153a
    1162:	6a 01                	push   $0x1
    1164:	e8 c7 f3 ff ff       	call   530 <printf>
    threads[index_currently_running].join=found_tid;
    1169:	a1 48 ac 00 00       	mov    0xac48,%eax
    116e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1171:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
    1178:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    117b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1182:	e8 bb f2 ff ff       	call   442 <getpid>
    1187:	5a                   	pop    %edx
    1188:	59                   	pop    %ecx
    1189:	6a 0e                	push   $0xe
    118b:	50                   	push   %eax
    118c:	e8 d9 f2 ff ff       	call   46a <sigsend>
  }
  return 0;
    1191:	83 c4 10             	add    $0x10,%esp

}
    1194:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1197:	31 c0                	xor    %eax,%eax

}
    1199:	5b                   	pop    %ebx
    119a:	5e                   	pop    %esi
    119b:	5d                   	pop    %ebp
    119c:	c3                   	ret    
    119d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    11a0:	83 ec 04             	sub    $0x4,%esp
    11a3:	56                   	push   %esi
    11a4:	68 1c 15 00 00       	push   $0x151c
    11a9:	6a 01                	push   $0x1
    11ab:	e8 80 f3 ff ff       	call   530 <printf>
    alarm(UTHREAD_QUANTA);
    11b0:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    11b7:	e8 be f2 ff ff       	call   47a <alarm>
    return -1;
    11bc:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    11bf:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    11c2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    11c7:	5b                   	pop    %ebx
    11c8:	5e                   	pop    %esi
    11c9:	5d                   	pop    %ebp
    11ca:	c3                   	ret    
    11cb:	90                   	nop
    11cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000011d0 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    11d0:	55                   	push   %ebp
    11d1:	89 e5                	mov    %esp,%ebp
    11d3:	53                   	push   %ebx
    11d4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    11d7:	6a 00                	push   $0x0
    11d9:	e8 9c f2 ff ff       	call   47a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    11de:	8b 1d 48 ac 00 00    	mov    0xac48,%ebx
    11e4:	e8 71 f2 ff ff       	call   45a <uptime>
    11e9:	03 45 08             	add    0x8(%ebp),%eax
    11ec:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    11ef:	89 04 95 3c 1d 00 00 	mov    %eax,0x1d3c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    11f6:	a1 48 ac 00 00       	mov    0xac48,%eax
    11fb:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    11fe:	c7 04 85 28 1d 00 00 	movl   $0x1,0x1d28(,%eax,4)
    1205:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1209:	e8 34 f2 ff ff       	call   442 <getpid>
    120e:	5a                   	pop    %edx
    120f:	59                   	pop    %ecx
    1210:	6a 0e                	push   $0xe
    1212:	50                   	push   %eax
    1213:	e8 52 f2 ff ff       	call   46a <sigsend>
  return 0;
}
    1218:	31 c0                	xor    %eax,%eax
    121a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    121d:	c9                   	leave  
    121e:	c3                   	ret    
    121f:	90                   	nop

00001220 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1220:	55                   	push   %ebp
    1221:	89 e5                	mov    %esp,%ebp
    1223:	53                   	push   %ebx
    1224:	83 ec 04             	sub    $0x4,%esp
    1227:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    122a:	8b 45 0c             	mov    0xc(%ebp),%eax
    122d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1230:	e8 bb f7 ff ff       	call   9f0 <bsem_alloc>
    1235:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1237:	e8 b4 f7 ff ff       	call   9f0 <bsem_alloc>
    123c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    123f:	83 c4 04             	add    $0x4,%esp
    1242:	5b                   	pop    %ebx
    1243:	5d                   	pop    %ebp
    1244:	c3                   	ret    
    1245:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001250 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1250:	55                   	push   %ebp
    1251:	89 e5                	mov    %esp,%ebp
    1253:	53                   	push   %ebx
    1254:	83 ec 10             	sub    $0x10,%esp
    1257:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    125a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1261:	ff 33                	pushl  (%ebx)
    1263:	e8 78 f8 ff ff       	call   ae0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1268:	8b 43 04             	mov    0x4(%ebx),%eax
    126b:	83 c4 10             	add    $0x10,%esp
}
    126e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1271:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1274:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1275:	e9 66 f8 ff ff       	jmp    ae0 <bsem_free>
    127a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001280 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1280:	55                   	push   %ebp
    1281:	89 e5                	mov    %esp,%ebp
    1283:	53                   	push   %ebx
    1284:	83 ec 10             	sub    $0x10,%esp
    1287:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    128a:	ff 73 04             	pushl  0x4(%ebx)
    128d:	e8 de f8 ff ff       	call   b70 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1292:	58                   	pop    %eax
    1293:	ff 33                	pushl  (%ebx)
    1295:	e8 d6 f8 ff ff       	call   b70 <bsem_down>
  csem->value--;
    129a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    129d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    12a0:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    12a3:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    12a5:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    12a8:	7e 0e                	jle    12b8 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    12aa:	83 ec 0c             	sub    $0xc,%esp
    12ad:	ff 73 04             	pushl  0x4(%ebx)
    12b0:	e8 cb f9 ff ff       	call   c80 <bsem_up>
    12b5:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    12b8:	8b 03                	mov    (%ebx),%eax
}
    12ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12bd:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12c0:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12c1:	e9 ba f9 ff ff       	jmp    c80 <bsem_up>
    12c6:	8d 76 00             	lea    0x0(%esi),%esi
    12c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012d0 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    12d0:	55                   	push   %ebp
    12d1:	89 e5                	mov    %esp,%ebp
    12d3:	53                   	push   %ebx
    12d4:	83 ec 10             	sub    $0x10,%esp
    12d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    12da:	ff 33                	pushl  (%ebx)
    12dc:	e8 8f f8 ff ff       	call   b70 <bsem_down>
  csem->value++;
    12e1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    12e4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    12e7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    12ea:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    12ed:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    12f0:	74 0e                	je     1300 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12f2:	8b 03                	mov    (%ebx),%eax
}
    12f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12f7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12fa:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12fb:	e9 80 f9 ff ff       	jmp    c80 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1300:	83 ec 0c             	sub    $0xc,%esp
    1303:	ff 73 04             	pushl  0x4(%ebx)
    1306:	e8 75 f9 ff ff       	call   c80 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    130b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    130d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1310:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1313:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1316:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1317:	e9 64 f9 ff ff       	jmp    c80 <bsem_up>
