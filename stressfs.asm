
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
  int fd, i;
  char path[] = "stressfs0";
       7:	b8 30 00 00 00       	mov    $0x30,%eax
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
       c:	ff 71 fc             	pushl  -0x4(%ecx)
       f:	55                   	push   %ebp
      10:	89 e5                	mov    %esp,%ebp
      12:	57                   	push   %edi
      13:	56                   	push   %esi
      14:	53                   	push   %ebx
      15:	51                   	push   %ecx
  int fd, i;
  char path[] = "stressfs0";
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));
      16:	8d b5 e8 fd ff ff    	lea    -0x218(%ebp),%esi

  for(i = 0; i < 4; i++)
      1c:	31 db                	xor    %ebx,%ebx
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
      1e:	81 ec 20 02 00 00    	sub    $0x220,%esp
  int fd, i;
  char path[] = "stressfs0";
      24:	66 89 85 e6 fd ff ff 	mov    %ax,-0x21a(%ebp)
      2b:	c7 85 de fd ff ff 73 	movl   $0x65727473,-0x222(%ebp)
      32:	74 72 65 
  char data[512];

  printf(1, "stressfs starting\n");
      35:	68 dc 12 00 00       	push   $0x12dc
      3a:	6a 01                	push   $0x1

int
main(int argc, char *argv[])
{
  int fd, i;
  char path[] = "stressfs0";
      3c:	c7 85 e2 fd ff ff 73 	movl   $0x73667373,-0x21e(%ebp)
      43:	73 66 73 
  char data[512];

  printf(1, "stressfs starting\n");
      46:	e8 a5 04 00 00       	call   4f0 <printf>
  memset(data, 'a', sizeof(data));
      4b:	83 c4 0c             	add    $0xc,%esp
      4e:	68 00 02 00 00       	push   $0x200
      53:	6a 61                	push   $0x61
      55:	56                   	push   %esi
      56:	e8 95 01 00 00       	call   1f0 <memset>
      5b:	83 c4 10             	add    $0x10,%esp

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      5e:	e8 17 03 00 00       	call   37a <fork>
      63:	85 c0                	test   %eax,%eax
      65:	0f 8f bf 00 00 00    	jg     12a <main+0x12a>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
      6b:	83 c3 01             	add    $0x1,%ebx
      6e:	83 fb 04             	cmp    $0x4,%ebx
      71:	75 eb                	jne    5e <main+0x5e>
      73:	bf 04 00 00 00       	mov    $0x4,%edi
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
      78:	83 ec 04             	sub    $0x4,%esp
      7b:	53                   	push   %ebx
      7c:	68 ef 12 00 00       	push   $0x12ef

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
      81:	bb 14 00 00 00       	mov    $0x14,%ebx

  for(i = 0; i < 4; i++)
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
      86:	6a 01                	push   $0x1
      88:	e8 63 04 00 00       	call   4f0 <printf>

  path[8] += i;
      8d:	89 f8                	mov    %edi,%eax
      8f:	00 85 e6 fd ff ff    	add    %al,-0x21a(%ebp)
  fd = open(path, O_CREATE | O_RDWR);
      95:	5f                   	pop    %edi
      96:	58                   	pop    %eax
      97:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
      9d:	68 02 02 00 00       	push   $0x202
      a2:	50                   	push   %eax
      a3:	e8 1a 03 00 00       	call   3c2 <open>
      a8:	83 c4 10             	add    $0x10,%esp
      ab:	89 c7                	mov    %eax,%edi
      ad:	8d 76 00             	lea    0x0(%esi),%esi
  for(i = 0; i < 20; i++)
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
      b0:	83 ec 04             	sub    $0x4,%esp
      b3:	68 00 02 00 00       	push   $0x200
      b8:	56                   	push   %esi
      b9:	57                   	push   %edi
      ba:	e8 e3 02 00 00       	call   3a2 <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
      bf:	83 c4 10             	add    $0x10,%esp
      c2:	83 eb 01             	sub    $0x1,%ebx
      c5:	75 e9                	jne    b0 <main+0xb0>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
      c7:	83 ec 0c             	sub    $0xc,%esp
      ca:	57                   	push   %edi
      cb:	e8 da 02 00 00       	call   3aa <close>

  printf(1, "read\n");
      d0:	58                   	pop    %eax
      d1:	5a                   	pop    %edx
      d2:	68 ba 14 00 00       	push   $0x14ba
      d7:	6a 01                	push   $0x1
      d9:	e8 12 04 00 00       	call   4f0 <printf>

  fd = open(path, O_RDONLY);
      de:	59                   	pop    %ecx
      df:	8d 85 de fd ff ff    	lea    -0x222(%ebp),%eax
      e5:	5b                   	pop    %ebx
      e6:	6a 00                	push   $0x0
      e8:	50                   	push   %eax
      e9:	bb 14 00 00 00       	mov    $0x14,%ebx
      ee:	e8 cf 02 00 00       	call   3c2 <open>
      f3:	83 c4 10             	add    $0x10,%esp
      f6:	89 c7                	mov    %eax,%edi
      f8:	90                   	nop
      f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for (i = 0; i < 20; i++)
    read(fd, data, sizeof(data));
     100:	83 ec 04             	sub    $0x4,%esp
     103:	68 00 02 00 00       	push   $0x200
     108:	56                   	push   %esi
     109:	57                   	push   %edi
     10a:	e8 8b 02 00 00       	call   39a <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
     10f:	83 c4 10             	add    $0x10,%esp
     112:	83 eb 01             	sub    $0x1,%ebx
     115:	75 e9                	jne    100 <main+0x100>
    read(fd, data, sizeof(data));
  close(fd);
     117:	83 ec 0c             	sub    $0xc,%esp
     11a:	57                   	push   %edi
     11b:	e8 8a 02 00 00       	call   3aa <close>

  wait();
     120:	e8 65 02 00 00       	call   38a <wait>

  exit();
     125:	e8 58 02 00 00       	call   382 <exit>
     12a:	89 df                	mov    %ebx,%edi
     12c:	e9 47 ff ff ff       	jmp    78 <main+0x78>
     131:	66 90                	xchg   %ax,%ax
     133:	66 90                	xchg   %ax,%ax
     135:	66 90                	xchg   %ax,%ax
     137:	66 90                	xchg   %ax,%ax
     139:	66 90                	xchg   %ax,%ax
     13b:	66 90                	xchg   %ax,%ax
     13d:	66 90                	xchg   %ax,%ax
     13f:	90                   	nop

00000140 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     140:	55                   	push   %ebp
     141:	89 e5                	mov    %esp,%ebp
     143:	53                   	push   %ebx
     144:	8b 45 08             	mov    0x8(%ebp),%eax
     147:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     14a:	89 c2                	mov    %eax,%edx
     14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     150:	83 c1 01             	add    $0x1,%ecx
     153:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     157:	83 c2 01             	add    $0x1,%edx
     15a:	84 db                	test   %bl,%bl
     15c:	88 5a ff             	mov    %bl,-0x1(%edx)
     15f:	75 ef                	jne    150 <strcpy+0x10>
    ;
  return os;
}
     161:	5b                   	pop    %ebx
     162:	5d                   	pop    %ebp
     163:	c3                   	ret    
     164:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     16a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	56                   	push   %esi
     174:	53                   	push   %ebx
     175:	8b 55 08             	mov    0x8(%ebp),%edx
     178:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     17b:	0f b6 02             	movzbl (%edx),%eax
     17e:	0f b6 19             	movzbl (%ecx),%ebx
     181:	84 c0                	test   %al,%al
     183:	75 1e                	jne    1a3 <strcmp+0x33>
     185:	eb 29                	jmp    1b0 <strcmp+0x40>
     187:	89 f6                	mov    %esi,%esi
     189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     190:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     193:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     196:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     199:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     19d:	84 c0                	test   %al,%al
     19f:	74 0f                	je     1b0 <strcmp+0x40>
     1a1:	89 f1                	mov    %esi,%ecx
     1a3:	38 d8                	cmp    %bl,%al
     1a5:	74 e9                	je     190 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     1a7:	29 d8                	sub    %ebx,%eax
}
     1a9:	5b                   	pop    %ebx
     1aa:	5e                   	pop    %esi
     1ab:	5d                   	pop    %ebp
     1ac:	c3                   	ret    
     1ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     1b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     1b2:	29 d8                	sub    %ebx,%eax
}
     1b4:	5b                   	pop    %ebx
     1b5:	5e                   	pop    %esi
     1b6:	5d                   	pop    %ebp
     1b7:	c3                   	ret    
     1b8:	90                   	nop
     1b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000001c0 <strlen>:

uint
strlen(char *s)
{
     1c0:	55                   	push   %ebp
     1c1:	89 e5                	mov    %esp,%ebp
     1c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     1c6:	80 39 00             	cmpb   $0x0,(%ecx)
     1c9:	74 12                	je     1dd <strlen+0x1d>
     1cb:	31 d2                	xor    %edx,%edx
     1cd:	8d 76 00             	lea    0x0(%esi),%esi
     1d0:	83 c2 01             	add    $0x1,%edx
     1d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     1d7:	89 d0                	mov    %edx,%eax
     1d9:	75 f5                	jne    1d0 <strlen+0x10>
    ;
  return n;
}
     1db:	5d                   	pop    %ebp
     1dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     1dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     1df:	5d                   	pop    %ebp
     1e0:	c3                   	ret    
     1e1:	eb 0d                	jmp    1f0 <memset>
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

000001f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     1f0:	55                   	push   %ebp
     1f1:	89 e5                	mov    %esp,%ebp
     1f3:	57                   	push   %edi
     1f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     1f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     1fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     1fd:	89 d7                	mov    %edx,%edi
     1ff:	fc                   	cld    
     200:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     202:	89 d0                	mov    %edx,%eax
     204:	5f                   	pop    %edi
     205:	5d                   	pop    %ebp
     206:	c3                   	ret    
     207:	89 f6                	mov    %esi,%esi
     209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000210 <strchr>:

char*
strchr(const char *s, char c)
{
     210:	55                   	push   %ebp
     211:	89 e5                	mov    %esp,%ebp
     213:	53                   	push   %ebx
     214:	8b 45 08             	mov    0x8(%ebp),%eax
     217:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     21a:	0f b6 10             	movzbl (%eax),%edx
     21d:	84 d2                	test   %dl,%dl
     21f:	74 1d                	je     23e <strchr+0x2e>
    if(*s == c)
     221:	38 d3                	cmp    %dl,%bl
     223:	89 d9                	mov    %ebx,%ecx
     225:	75 0d                	jne    234 <strchr+0x24>
     227:	eb 17                	jmp    240 <strchr+0x30>
     229:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     230:	38 ca                	cmp    %cl,%dl
     232:	74 0c                	je     240 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     234:	83 c0 01             	add    $0x1,%eax
     237:	0f b6 10             	movzbl (%eax),%edx
     23a:	84 d2                	test   %dl,%dl
     23c:	75 f2                	jne    230 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     23e:	31 c0                	xor    %eax,%eax
}
     240:	5b                   	pop    %ebx
     241:	5d                   	pop    %ebp
     242:	c3                   	ret    
     243:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     249:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000250 <gets>:

char*
gets(char *buf, int max)
{
     250:	55                   	push   %ebp
     251:	89 e5                	mov    %esp,%ebp
     253:	57                   	push   %edi
     254:	56                   	push   %esi
     255:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     256:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     258:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     25b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     25e:	eb 29                	jmp    289 <gets+0x39>
    cc = read(0, &c, 1);
     260:	83 ec 04             	sub    $0x4,%esp
     263:	6a 01                	push   $0x1
     265:	57                   	push   %edi
     266:	6a 00                	push   $0x0
     268:	e8 2d 01 00 00       	call   39a <read>
    if(cc < 1)
     26d:	83 c4 10             	add    $0x10,%esp
     270:	85 c0                	test   %eax,%eax
     272:	7e 1d                	jle    291 <gets+0x41>
      break;
    buf[i++] = c;
     274:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     278:	8b 55 08             	mov    0x8(%ebp),%edx
     27b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     27d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     27f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     283:	74 1b                	je     2a0 <gets+0x50>
     285:	3c 0d                	cmp    $0xd,%al
     287:	74 17                	je     2a0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     289:	8d 5e 01             	lea    0x1(%esi),%ebx
     28c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     28f:	7c cf                	jl     260 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     291:	8b 45 08             	mov    0x8(%ebp),%eax
     294:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     298:	8d 65 f4             	lea    -0xc(%ebp),%esp
     29b:	5b                   	pop    %ebx
     29c:	5e                   	pop    %esi
     29d:	5f                   	pop    %edi
     29e:	5d                   	pop    %ebp
     29f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2a0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     2a3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     2a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     2a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2ac:	5b                   	pop    %ebx
     2ad:	5e                   	pop    %esi
     2ae:	5f                   	pop    %edi
     2af:	5d                   	pop    %ebp
     2b0:	c3                   	ret    
     2b1:	eb 0d                	jmp    2c0 <stat>
     2b3:	90                   	nop
     2b4:	90                   	nop
     2b5:	90                   	nop
     2b6:	90                   	nop
     2b7:	90                   	nop
     2b8:	90                   	nop
     2b9:	90                   	nop
     2ba:	90                   	nop
     2bb:	90                   	nop
     2bc:	90                   	nop
     2bd:	90                   	nop
     2be:	90                   	nop
     2bf:	90                   	nop

000002c0 <stat>:

int
stat(char *n, struct stat *st)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	56                   	push   %esi
     2c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     2c5:	83 ec 08             	sub    $0x8,%esp
     2c8:	6a 00                	push   $0x0
     2ca:	ff 75 08             	pushl  0x8(%ebp)
     2cd:	e8 f0 00 00 00       	call   3c2 <open>
  if(fd < 0)
     2d2:	83 c4 10             	add    $0x10,%esp
     2d5:	85 c0                	test   %eax,%eax
     2d7:	78 27                	js     300 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     2d9:	83 ec 08             	sub    $0x8,%esp
     2dc:	ff 75 0c             	pushl  0xc(%ebp)
     2df:	89 c3                	mov    %eax,%ebx
     2e1:	50                   	push   %eax
     2e2:	e8 f3 00 00 00       	call   3da <fstat>
     2e7:	89 c6                	mov    %eax,%esi
  close(fd);
     2e9:	89 1c 24             	mov    %ebx,(%esp)
     2ec:	e8 b9 00 00 00       	call   3aa <close>
  return r;
     2f1:	83 c4 10             	add    $0x10,%esp
     2f4:	89 f0                	mov    %esi,%eax
}
     2f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     2f9:	5b                   	pop    %ebx
     2fa:	5e                   	pop    %esi
     2fb:	5d                   	pop    %ebp
     2fc:	c3                   	ret    
     2fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     300:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     305:	eb ef                	jmp    2f6 <stat+0x36>
     307:	89 f6                	mov    %esi,%esi
     309:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000310 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     317:	0f be 11             	movsbl (%ecx),%edx
     31a:	8d 42 d0             	lea    -0x30(%edx),%eax
     31d:	3c 09                	cmp    $0x9,%al
     31f:	b8 00 00 00 00       	mov    $0x0,%eax
     324:	77 1f                	ja     345 <atoi+0x35>
     326:	8d 76 00             	lea    0x0(%esi),%esi
     329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     330:	8d 04 80             	lea    (%eax,%eax,4),%eax
     333:	83 c1 01             	add    $0x1,%ecx
     336:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     33a:	0f be 11             	movsbl (%ecx),%edx
     33d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     340:	80 fb 09             	cmp    $0x9,%bl
     343:	76 eb                	jbe    330 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     345:	5b                   	pop    %ebx
     346:	5d                   	pop    %ebp
     347:	c3                   	ret    
     348:	90                   	nop
     349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000350 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	56                   	push   %esi
     354:	53                   	push   %ebx
     355:	8b 5d 10             	mov    0x10(%ebp),%ebx
     358:	8b 45 08             	mov    0x8(%ebp),%eax
     35b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     35e:	85 db                	test   %ebx,%ebx
     360:	7e 14                	jle    376 <memmove+0x26>
     362:	31 d2                	xor    %edx,%edx
     364:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     368:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     36c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     36f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     372:	39 da                	cmp    %ebx,%edx
     374:	75 f2                	jne    368 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     376:	5b                   	pop    %ebx
     377:	5e                   	pop    %esi
     378:	5d                   	pop    %ebp
     379:	c3                   	ret    

0000037a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     37a:	b8 01 00 00 00       	mov    $0x1,%eax
     37f:	cd 40                	int    $0x40
     381:	c3                   	ret    

00000382 <exit>:
SYSCALL(exit)
     382:	b8 02 00 00 00       	mov    $0x2,%eax
     387:	cd 40                	int    $0x40
     389:	c3                   	ret    

0000038a <wait>:
SYSCALL(wait)
     38a:	b8 03 00 00 00       	mov    $0x3,%eax
     38f:	cd 40                	int    $0x40
     391:	c3                   	ret    

00000392 <pipe>:
SYSCALL(pipe)
     392:	b8 04 00 00 00       	mov    $0x4,%eax
     397:	cd 40                	int    $0x40
     399:	c3                   	ret    

0000039a <read>:
SYSCALL(read)
     39a:	b8 05 00 00 00       	mov    $0x5,%eax
     39f:	cd 40                	int    $0x40
     3a1:	c3                   	ret    

000003a2 <write>:
SYSCALL(write)
     3a2:	b8 10 00 00 00       	mov    $0x10,%eax
     3a7:	cd 40                	int    $0x40
     3a9:	c3                   	ret    

000003aa <close>:
SYSCALL(close)
     3aa:	b8 15 00 00 00       	mov    $0x15,%eax
     3af:	cd 40                	int    $0x40
     3b1:	c3                   	ret    

000003b2 <kill>:
SYSCALL(kill)
     3b2:	b8 06 00 00 00       	mov    $0x6,%eax
     3b7:	cd 40                	int    $0x40
     3b9:	c3                   	ret    

000003ba <exec>:
SYSCALL(exec)
     3ba:	b8 07 00 00 00       	mov    $0x7,%eax
     3bf:	cd 40                	int    $0x40
     3c1:	c3                   	ret    

000003c2 <open>:
SYSCALL(open)
     3c2:	b8 0f 00 00 00       	mov    $0xf,%eax
     3c7:	cd 40                	int    $0x40
     3c9:	c3                   	ret    

000003ca <mknod>:
SYSCALL(mknod)
     3ca:	b8 11 00 00 00       	mov    $0x11,%eax
     3cf:	cd 40                	int    $0x40
     3d1:	c3                   	ret    

000003d2 <unlink>:
SYSCALL(unlink)
     3d2:	b8 12 00 00 00       	mov    $0x12,%eax
     3d7:	cd 40                	int    $0x40
     3d9:	c3                   	ret    

000003da <fstat>:
SYSCALL(fstat)
     3da:	b8 08 00 00 00       	mov    $0x8,%eax
     3df:	cd 40                	int    $0x40
     3e1:	c3                   	ret    

000003e2 <link>:
SYSCALL(link)
     3e2:	b8 13 00 00 00       	mov    $0x13,%eax
     3e7:	cd 40                	int    $0x40
     3e9:	c3                   	ret    

000003ea <mkdir>:
SYSCALL(mkdir)
     3ea:	b8 14 00 00 00       	mov    $0x14,%eax
     3ef:	cd 40                	int    $0x40
     3f1:	c3                   	ret    

000003f2 <chdir>:
SYSCALL(chdir)
     3f2:	b8 09 00 00 00       	mov    $0x9,%eax
     3f7:	cd 40                	int    $0x40
     3f9:	c3                   	ret    

000003fa <dup>:
SYSCALL(dup)
     3fa:	b8 0a 00 00 00       	mov    $0xa,%eax
     3ff:	cd 40                	int    $0x40
     401:	c3                   	ret    

00000402 <getpid>:
SYSCALL(getpid)
     402:	b8 0b 00 00 00       	mov    $0xb,%eax
     407:	cd 40                	int    $0x40
     409:	c3                   	ret    

0000040a <sbrk>:
SYSCALL(sbrk)
     40a:	b8 0c 00 00 00       	mov    $0xc,%eax
     40f:	cd 40                	int    $0x40
     411:	c3                   	ret    

00000412 <sleep>:
SYSCALL(sleep)
     412:	b8 0d 00 00 00       	mov    $0xd,%eax
     417:	cd 40                	int    $0x40
     419:	c3                   	ret    

0000041a <uptime>:
SYSCALL(uptime)
     41a:	b8 0e 00 00 00       	mov    $0xe,%eax
     41f:	cd 40                	int    $0x40
     421:	c3                   	ret    

00000422 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     422:	b8 16 00 00 00       	mov    $0x16,%eax
     427:	cd 40                	int    $0x40
     429:	c3                   	ret    

0000042a <sigsend>:
SYSCALL(sigsend)
     42a:	b8 17 00 00 00       	mov    $0x17,%eax
     42f:	cd 40                	int    $0x40
     431:	c3                   	ret    

00000432 <sigreturn>:
SYSCALL(sigreturn)
     432:	b8 18 00 00 00       	mov    $0x18,%eax
     437:	cd 40                	int    $0x40
     439:	c3                   	ret    

0000043a <alarm>:
SYSCALL(alarm)
     43a:	b8 19 00 00 00       	mov    $0x19,%eax
     43f:	cd 40                	int    $0x40
     441:	c3                   	ret    
     442:	66 90                	xchg   %ax,%ax
     444:	66 90                	xchg   %ax,%ax
     446:	66 90                	xchg   %ax,%ax
     448:	66 90                	xchg   %ax,%ax
     44a:	66 90                	xchg   %ax,%ax
     44c:	66 90                	xchg   %ax,%ax
     44e:	66 90                	xchg   %ax,%ax

00000450 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
     456:	89 c6                	mov    %eax,%esi
     458:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     45b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     45e:	85 db                	test   %ebx,%ebx
     460:	74 7e                	je     4e0 <printint+0x90>
     462:	89 d0                	mov    %edx,%eax
     464:	c1 e8 1f             	shr    $0x1f,%eax
     467:	84 c0                	test   %al,%al
     469:	74 75                	je     4e0 <printint+0x90>
    neg = 1;
    x = -xx;
     46b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     46d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     474:	f7 d8                	neg    %eax
     476:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     479:	31 ff                	xor    %edi,%edi
     47b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     47e:	89 ce                	mov    %ecx,%esi
     480:	eb 08                	jmp    48a <printint+0x3a>
     482:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     488:	89 cf                	mov    %ecx,%edi
     48a:	31 d2                	xor    %edx,%edx
     48c:	8d 4f 01             	lea    0x1(%edi),%ecx
     48f:	f7 f6                	div    %esi
     491:	0f b6 92 00 13 00 00 	movzbl 0x1300(%edx),%edx
  }while((x /= base) != 0);
     498:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     49a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     49d:	75 e9                	jne    488 <printint+0x38>
  if(neg)
     49f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     4a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     4a5:	85 c0                	test   %eax,%eax
     4a7:	74 08                	je     4b1 <printint+0x61>
    buf[i++] = '-';
     4a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     4ae:	8d 4f 02             	lea    0x2(%edi),%ecx
     4b1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     4b5:	8d 76 00             	lea    0x0(%esi),%esi
     4b8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     4bb:	83 ec 04             	sub    $0x4,%esp
     4be:	83 ef 01             	sub    $0x1,%edi
     4c1:	6a 01                	push   $0x1
     4c3:	53                   	push   %ebx
     4c4:	56                   	push   %esi
     4c5:	88 45 d7             	mov    %al,-0x29(%ebp)
     4c8:	e8 d5 fe ff ff       	call   3a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     4cd:	83 c4 10             	add    $0x10,%esp
     4d0:	39 df                	cmp    %ebx,%edi
     4d2:	75 e4                	jne    4b8 <printint+0x68>
    putc(fd, buf[i]);
}
     4d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4d7:	5b                   	pop    %ebx
     4d8:	5e                   	pop    %esi
     4d9:	5f                   	pop    %edi
     4da:	5d                   	pop    %ebp
     4db:	c3                   	ret    
     4dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     4e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     4e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     4e9:	eb 8b                	jmp    476 <printint+0x26>
     4eb:	90                   	nop
     4ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000004f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	57                   	push   %edi
     4f4:	56                   	push   %esi
     4f5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4f6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4f9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     4fc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     4ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     502:	89 45 d0             	mov    %eax,-0x30(%ebp)
     505:	0f b6 1e             	movzbl (%esi),%ebx
     508:	83 c6 01             	add    $0x1,%esi
     50b:	84 db                	test   %bl,%bl
     50d:	0f 84 b0 00 00 00    	je     5c3 <printf+0xd3>
     513:	31 d2                	xor    %edx,%edx
     515:	eb 39                	jmp    550 <printf+0x60>
     517:	89 f6                	mov    %esi,%esi
     519:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     520:	83 f8 25             	cmp    $0x25,%eax
     523:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     526:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     52b:	74 18                	je     545 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     52d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     530:	83 ec 04             	sub    $0x4,%esp
     533:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     536:	6a 01                	push   $0x1
     538:	50                   	push   %eax
     539:	57                   	push   %edi
     53a:	e8 63 fe ff ff       	call   3a2 <write>
     53f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     542:	83 c4 10             	add    $0x10,%esp
     545:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     548:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     54c:	84 db                	test   %bl,%bl
     54e:	74 73                	je     5c3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     550:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     552:	0f be cb             	movsbl %bl,%ecx
     555:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     558:	74 c6                	je     520 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     55a:	83 fa 25             	cmp    $0x25,%edx
     55d:	75 e6                	jne    545 <printf+0x55>
      if(c == 'd'){
     55f:	83 f8 64             	cmp    $0x64,%eax
     562:	0f 84 f8 00 00 00    	je     660 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     568:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     56e:	83 f9 70             	cmp    $0x70,%ecx
     571:	74 5d                	je     5d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     573:	83 f8 73             	cmp    $0x73,%eax
     576:	0f 84 84 00 00 00    	je     600 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     57c:	83 f8 63             	cmp    $0x63,%eax
     57f:	0f 84 ea 00 00 00    	je     66f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     585:	83 f8 25             	cmp    $0x25,%eax
     588:	0f 84 c2 00 00 00    	je     650 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     58e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     591:	83 ec 04             	sub    $0x4,%esp
     594:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     598:	6a 01                	push   $0x1
     59a:	50                   	push   %eax
     59b:	57                   	push   %edi
     59c:	e8 01 fe ff ff       	call   3a2 <write>
     5a1:	83 c4 0c             	add    $0xc,%esp
     5a4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     5a7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     5aa:	6a 01                	push   $0x1
     5ac:	50                   	push   %eax
     5ad:	57                   	push   %edi
     5ae:	83 c6 01             	add    $0x1,%esi
     5b1:	e8 ec fd ff ff       	call   3a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     5b6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     5ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     5bd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     5bf:	84 db                	test   %bl,%bl
     5c1:	75 8d                	jne    550 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     5c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5c6:	5b                   	pop    %ebx
     5c7:	5e                   	pop    %esi
     5c8:	5f                   	pop    %edi
     5c9:	5d                   	pop    %ebp
     5ca:	c3                   	ret    
     5cb:	90                   	nop
     5cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     5d0:	83 ec 0c             	sub    $0xc,%esp
     5d3:	b9 10 00 00 00       	mov    $0x10,%ecx
     5d8:	6a 00                	push   $0x0
     5da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     5dd:	89 f8                	mov    %edi,%eax
     5df:	8b 13                	mov    (%ebx),%edx
     5e1:	e8 6a fe ff ff       	call   450 <printint>
        ap++;
     5e6:	89 d8                	mov    %ebx,%eax
     5e8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     5eb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     5ed:	83 c0 04             	add    $0x4,%eax
     5f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     5f3:	e9 4d ff ff ff       	jmp    545 <printf+0x55>
     5f8:	90                   	nop
     5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     600:	8b 45 d0             	mov    -0x30(%ebp),%eax
     603:	8b 18                	mov    (%eax),%ebx
        ap++;
     605:	83 c0 04             	add    $0x4,%eax
     608:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     60b:	b8 f9 12 00 00       	mov    $0x12f9,%eax
     610:	85 db                	test   %ebx,%ebx
     612:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     615:	0f b6 03             	movzbl (%ebx),%eax
     618:	84 c0                	test   %al,%al
     61a:	74 23                	je     63f <printf+0x14f>
     61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     620:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     623:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     626:	83 ec 04             	sub    $0x4,%esp
     629:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     62b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     62e:	50                   	push   %eax
     62f:	57                   	push   %edi
     630:	e8 6d fd ff ff       	call   3a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     635:	0f b6 03             	movzbl (%ebx),%eax
     638:	83 c4 10             	add    $0x10,%esp
     63b:	84 c0                	test   %al,%al
     63d:	75 e1                	jne    620 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     63f:	31 d2                	xor    %edx,%edx
     641:	e9 ff fe ff ff       	jmp    545 <printf+0x55>
     646:	8d 76 00             	lea    0x0(%esi),%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     650:	83 ec 04             	sub    $0x4,%esp
     653:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     656:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     659:	6a 01                	push   $0x1
     65b:	e9 4c ff ff ff       	jmp    5ac <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     660:	83 ec 0c             	sub    $0xc,%esp
     663:	b9 0a 00 00 00       	mov    $0xa,%ecx
     668:	6a 01                	push   $0x1
     66a:	e9 6b ff ff ff       	jmp    5da <printf+0xea>
     66f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     672:	83 ec 04             	sub    $0x4,%esp
     675:	8b 03                	mov    (%ebx),%eax
     677:	6a 01                	push   $0x1
     679:	88 45 e4             	mov    %al,-0x1c(%ebp)
     67c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     67f:	50                   	push   %eax
     680:	57                   	push   %edi
     681:	e8 1c fd ff ff       	call   3a2 <write>
     686:	e9 5b ff ff ff       	jmp    5e6 <printf+0xf6>
     68b:	66 90                	xchg   %ax,%ax
     68d:	66 90                	xchg   %ax,%ax
     68f:	90                   	nop

00000690 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     690:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     691:	a1 80 1a 00 00       	mov    0x1a80,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     696:	89 e5                	mov    %esp,%ebp
     698:	57                   	push   %edi
     699:	56                   	push   %esi
     69a:	53                   	push   %ebx
     69b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     69e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     6a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6a3:	39 c8                	cmp    %ecx,%eax
     6a5:	73 19                	jae    6c0 <free+0x30>
     6a7:	89 f6                	mov    %esi,%esi
     6a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     6b0:	39 d1                	cmp    %edx,%ecx
     6b2:	72 1c                	jb     6d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6b4:	39 d0                	cmp    %edx,%eax
     6b6:	73 18                	jae    6d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     6b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     6be:	72 f0                	jb     6b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     6c0:	39 d0                	cmp    %edx,%eax
     6c2:	72 f4                	jb     6b8 <free+0x28>
     6c4:	39 d1                	cmp    %edx,%ecx
     6c6:	73 f0                	jae    6b8 <free+0x28>
     6c8:	90                   	nop
     6c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     6d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     6d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     6d6:	39 d7                	cmp    %edx,%edi
     6d8:	74 19                	je     6f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     6da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     6dd:	8b 50 04             	mov    0x4(%eax),%edx
     6e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     6e3:	39 f1                	cmp    %esi,%ecx
     6e5:	74 23                	je     70a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     6e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     6e9:	a3 80 1a 00 00       	mov    %eax,0x1a80
}
     6ee:	5b                   	pop    %ebx
     6ef:	5e                   	pop    %esi
     6f0:	5f                   	pop    %edi
     6f1:	5d                   	pop    %ebp
     6f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     6f3:	03 72 04             	add    0x4(%edx),%esi
     6f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     6f9:	8b 10                	mov    (%eax),%edx
     6fb:	8b 12                	mov    (%edx),%edx
     6fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     700:	8b 50 04             	mov    0x4(%eax),%edx
     703:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     706:	39 f1                	cmp    %esi,%ecx
     708:	75 dd                	jne    6e7 <free+0x57>
    p->s.size += bp->s.size;
     70a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     70d:	a3 80 1a 00 00       	mov    %eax,0x1a80
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     712:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     715:	8b 53 f8             	mov    -0x8(%ebx),%edx
     718:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     71a:	5b                   	pop    %ebx
     71b:	5e                   	pop    %esi
     71c:	5f                   	pop    %edi
     71d:	5d                   	pop    %ebp
     71e:	c3                   	ret    
     71f:	90                   	nop

00000720 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     720:	55                   	push   %ebp
     721:	89 e5                	mov    %esp,%ebp
     723:	57                   	push   %edi
     724:	56                   	push   %esi
     725:	53                   	push   %ebx
     726:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     729:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     72c:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     732:	8d 78 07             	lea    0x7(%eax),%edi
     735:	c1 ef 03             	shr    $0x3,%edi
     738:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     73b:	85 d2                	test   %edx,%edx
     73d:	0f 84 a3 00 00 00    	je     7e6 <malloc+0xc6>
     743:	8b 02                	mov    (%edx),%eax
     745:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     748:	39 cf                	cmp    %ecx,%edi
     74a:	76 74                	jbe    7c0 <malloc+0xa0>
     74c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     752:	be 00 10 00 00       	mov    $0x1000,%esi
     757:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     75e:	0f 43 f7             	cmovae %edi,%esi
     761:	ba 00 80 00 00       	mov    $0x8000,%edx
     766:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     76c:	0f 46 da             	cmovbe %edx,%ebx
     76f:	eb 10                	jmp    781 <malloc+0x61>
     771:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     778:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     77a:	8b 48 04             	mov    0x4(%eax),%ecx
     77d:	39 cf                	cmp    %ecx,%edi
     77f:	76 3f                	jbe    7c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     781:	39 05 80 1a 00 00    	cmp    %eax,0x1a80
     787:	89 c2                	mov    %eax,%edx
     789:	75 ed                	jne    778 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     78b:	83 ec 0c             	sub    $0xc,%esp
     78e:	53                   	push   %ebx
     78f:	e8 76 fc ff ff       	call   40a <sbrk>
  if(p == (char*)-1)
     794:	83 c4 10             	add    $0x10,%esp
     797:	83 f8 ff             	cmp    $0xffffffff,%eax
     79a:	74 1c                	je     7b8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     79c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     79f:	83 ec 0c             	sub    $0xc,%esp
     7a2:	83 c0 08             	add    $0x8,%eax
     7a5:	50                   	push   %eax
     7a6:	e8 e5 fe ff ff       	call   690 <free>
  return freep;
     7ab:	8b 15 80 1a 00 00    	mov    0x1a80,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     7b1:	83 c4 10             	add    $0x10,%esp
     7b4:	85 d2                	test   %edx,%edx
     7b6:	75 c0                	jne    778 <malloc+0x58>
        return 0;
     7b8:	31 c0                	xor    %eax,%eax
     7ba:	eb 1c                	jmp    7d8 <malloc+0xb8>
     7bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     7c0:	39 cf                	cmp    %ecx,%edi
     7c2:	74 1c                	je     7e0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     7c4:	29 f9                	sub    %edi,%ecx
     7c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     7c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     7cc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     7cf:	89 15 80 1a 00 00    	mov    %edx,0x1a80
      return (void*)(p + 1);
     7d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     7d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7db:	5b                   	pop    %ebx
     7dc:	5e                   	pop    %esi
     7dd:	5f                   	pop    %edi
     7de:	5d                   	pop    %ebp
     7df:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     7e0:	8b 08                	mov    (%eax),%ecx
     7e2:	89 0a                	mov    %ecx,(%edx)
     7e4:	eb e9                	jmp    7cf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     7e6:	c7 05 80 1a 00 00 84 	movl   $0x1a84,0x1a80
     7ed:	1a 00 00 
     7f0:	c7 05 84 1a 00 00 84 	movl   $0x1a84,0x1a84
     7f7:	1a 00 00 
    base.s.size = 0;
     7fa:	b8 84 1a 00 00       	mov    $0x1a84,%eax
     7ff:	c7 05 88 1a 00 00 00 	movl   $0x0,0x1a88
     806:	00 00 00 
     809:	e9 3e ff ff ff       	jmp    74c <malloc+0x2c>
     80e:	66 90                	xchg   %ax,%ax

00000810 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     810:	55                   	push   %ebp
     811:	89 e5                	mov    %esp,%ebp
     813:	56                   	push   %esi
     814:	53                   	push   %ebx
     815:	8b 75 0c             	mov    0xc(%ebp),%esi
     818:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     81b:	83 ec 08             	sub    $0x8,%esp
     81e:	68 14 13 00 00       	push   $0x1314
     823:	6a 01                	push   $0x1
     825:	e8 c6 fc ff ff       	call   4f0 <printf>
  alarm(UTHREAD_QUANTA);
     82a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     831:	e8 04 fc ff ff       	call   43a <alarm>
  start_func(arg);
     836:	89 75 08             	mov    %esi,0x8(%ebp)
     839:	83 c4 10             	add    $0x10,%esp
}
     83c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     83f:	89 d8                	mov    %ebx,%eax
}
     841:	5b                   	pop    %ebx
     842:	5e                   	pop    %esi
     843:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     844:	ff e0                	jmp    *%eax
     846:	8d 76 00             	lea    0x0(%esi),%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000850 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     850:	55                   	push   %ebp
     851:	89 e5                	mov    %esp,%ebp
     853:	53                   	push   %ebx
     854:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     857:	6a 00                	push   $0x0
     859:	e8 dc fb ff ff       	call   43a <alarm>
  printf(1,"exiting...\n");
     85e:	5a                   	pop    %edx
     85f:	59                   	pop    %ecx
     860:	68 84 14 00 00       	push   $0x1484
     865:	6a 01                	push   $0x1
     867:	e8 84 fc ff ff       	call   4f0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     86c:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
     871:	83 c4 10             	add    $0x10,%esp
     874:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     877:	8b 1c 95 a0 1a 00 00 	mov    0x1aa0(,%edx,4),%ebx
     87e:	85 db                	test   %ebx,%ebx
     880:	75 0a                	jne    88c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     882:	c7 05 a8 1a 00 00 00 	movl   $0x0,0x1aa8
     889:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     88c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     88f:	83 ec 0c             	sub    $0xc,%esp
     892:	ff 34 85 a4 1a 00 00 	pushl  0x1aa4(,%eax,4)
     899:	e8 f2 fd ff ff       	call   690 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     89e:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
     8a3:	83 c4 10             	add    $0x10,%esp
     8a6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     8a9:	b8 a8 1a 00 00       	mov    $0x1aa8,%eax
     8ae:	c1 e2 02             	shl    $0x2,%edx
     8b1:	c7 82 a8 1a 00 00 00 	movl   $0x0,0x1aa8(%edx)
     8b8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     8bb:	c7 82 a0 1a 00 00 ff 	movl   $0xffffffff,0x1aa0(%edx)
     8c2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     8c5:	c7 82 ac 1a 00 00 00 	movl   $0x0,0x1aac(%edx)
     8cc:	00 00 00 
  threads[index_currently_running].esp = 0;
     8cf:	c7 82 b0 1a 00 00 00 	movl   $0x0,0x1ab0(%edx)
     8d6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     8d9:	c7 82 bc 1a 00 00 00 	movl   $0x0,0x1abc(%edx)
     8e0:	00 00 00 
  threads[index_currently_running].join = -1;
     8e3:	c7 82 c0 1a 00 00 ff 	movl   $0xffffffff,0x1ac0(%edx)
     8ea:	ff ff ff 
     8ed:	eb 0b                	jmp    8fa <uthread_exit+0xaa>
     8ef:	90                   	nop
     8f0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     8f3:	3d a8 23 00 00       	cmp    $0x23a8,%eax
     8f8:	74 15                	je     90f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     8fa:	83 38 04             	cmpl   $0x4,(%eax)
     8fd:	75 f1                	jne    8f0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     8ff:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     905:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     908:	3d a8 23 00 00       	cmp    $0x23a8,%eax
     90d:	75 eb                	jne    8fa <uthread_exit+0xaa>
     90f:	bb cc 1a 00 00       	mov    $0x1acc,%ebx
     914:	eb 15                	jmp    92b <uthread_exit+0xdb>
     916:	8d 76 00             	lea    0x0(%esi),%esi
     919:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     920:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     923:	81 fb a8 23 00 00    	cmp    $0x23a8,%ebx
     929:	74 24                	je     94f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     92b:	8b 03                	mov    (%ebx),%eax
     92d:	85 c0                	test   %eax,%eax
     92f:	74 ef                	je     920 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     931:	e8 cc fa ff ff       	call   402 <getpid>
     936:	83 ec 08             	sub    $0x8,%esp
     939:	83 c3 24             	add    $0x24,%ebx
     93c:	6a 0e                	push   $0xe
     93e:	50                   	push   %eax
     93f:	e8 e6 fa ff ff       	call   42a <sigsend>
     944:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     947:	81 fb a8 23 00 00    	cmp    $0x23a8,%ebx
     94d:	75 dc                	jne    92b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     94f:	e8 2e fa ff ff       	call   382 <exit>
     954:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     95a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000960 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     960:	55                   	push   %ebp
     961:	ba c8 24 00 00       	mov    $0x24c8,%edx
     966:	89 e5                	mov    %esp,%ebp
     968:	90                   	nop
     969:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     970:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     976:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     97c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     980:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     986:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     989:	39 d0                	cmp    %edx,%eax
     98b:	75 f3                	jne    980 <init_bsem+0x20>
     98d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     993:	81 fa c8 aa 00 00    	cmp    $0xaac8,%edx
     999:	75 d5                	jne    970 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     99b:	c7 05 8c 1a 00 00 01 	movl   $0x1,0x1a8c
     9a2:	00 00 00 
}
     9a5:	5d                   	pop    %ebp
     9a6:	c3                   	ret    
     9a7:	89 f6                	mov    %esi,%esi
     9a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009b0 <bsem_alloc>:

int bsem_alloc() {
     9b0:	55                   	push   %ebp
     9b1:	89 e5                	mov    %esp,%ebp
     9b3:	53                   	push   %ebx
     9b4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     9b7:	6a 00                	push   $0x0
     9b9:	e8 7c fa ff ff       	call   43a <alarm>
  int i;
  if(first_run_bsem == 0)
     9be:	a1 8c 1a 00 00       	mov    0x1a8c,%eax
     9c3:	83 c4 10             	add    $0x10,%esp
     9c6:	85 c0                	test   %eax,%eax
     9c8:	75 3b                	jne    a05 <bsem_alloc+0x55>
     9ca:	ba c8 24 00 00       	mov    $0x24c8,%edx
     9cf:	90                   	nop
     9d0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     9d6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     9dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     9e0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     9e6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     9e9:	39 d0                	cmp    %edx,%eax
     9eb:	75 f3                	jne    9e0 <bsem_alloc+0x30>
     9ed:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     9f3:	81 fa c8 aa 00 00    	cmp    $0xaac8,%edx
     9f9:	75 d5                	jne    9d0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     9fb:	c7 05 8c 1a 00 00 01 	movl   $0x1,0x1a8c
     a02:	00 00 00 
     a05:	ba c8 24 00 00       	mov    $0x24c8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     a0a:	31 c0                	xor    %eax,%eax
     a0c:	eb 10                	jmp    a1e <bsem_alloc+0x6e>
     a0e:	83 c0 01             	add    $0x1,%eax
     a11:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     a17:	3d 80 00 00 00       	cmp    $0x80,%eax
     a1c:	74 4f                	je     a6d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     a1e:	83 3a 01             	cmpl   $0x1,(%edx)
     a21:	75 eb                	jne    a0e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     a23:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     a29:	8b 15 64 1a 00 00    	mov    0x1a64,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a2f:	83 ec 0c             	sub    $0xc,%esp
     a32:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     a34:	8d 98 c0 23 00 00    	lea    0x23c0(%eax),%ebx
     a3a:	89 90 c4 23 00 00    	mov    %edx,0x23c4(%eax)
    binSemCounter++;
     a40:	83 c2 01             	add    $0x1,%edx
     a43:	89 15 64 1a 00 00    	mov    %edx,0x1a64
    binSemaphore[i].lock = 1; // not locked
     a49:	c7 80 c0 23 00 00 01 	movl   $0x1,0x23c0(%eax)
     a50:	00 00 00 
    binSemaphore[i].state = USED;
     a53:	c7 80 c8 24 00 00 00 	movl   $0x0,0x24c8(%eax)
     a5a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     a5d:	e8 d8 f9 ff ff       	call   43a <alarm>
    return binSemaphore[i].id;
     a62:	8b 43 04             	mov    0x4(%ebx),%eax
     a65:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     a68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a6b:	c9                   	leave  
     a6c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     a6d:	83 ec 08             	sub    $0x8,%esp
     a70:	68 34 13 00 00       	push   $0x1334
     a75:	6a 01                	push   $0x1
     a77:	e8 74 fa ff ff       	call   4f0 <printf>
    alarm(UTHREAD_QUANTA);
     a7c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     a83:	e8 b2 f9 ff ff       	call   43a <alarm>
    return -1;
     a88:	83 c4 10             	add    $0x10,%esp
     a8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     a90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a93:	c9                   	leave  
     a94:	c3                   	ret    
     a95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000aa0 <bsem_free>:

void bsem_free(int id) {
     aa0:	55                   	push   %ebp
     aa1:	89 e5                	mov    %esp,%ebp
     aa3:	53                   	push   %ebx
     aa4:	83 ec 10             	sub    $0x10,%esp
     aa7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     aaa:	6a 00                	push   $0x0
     aac:	e8 89 f9 ff ff       	call   43a <alarm>
     ab1:	ba c4 23 00 00       	mov    $0x23c4,%edx
     ab6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     ab9:	31 c0                	xor    %eax,%eax
     abb:	eb 13                	jmp    ad0 <bsem_free+0x30>
     abd:	8d 76 00             	lea    0x0(%esi),%esi
     ac0:	83 c0 01             	add    $0x1,%eax
     ac3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     ac9:	3d 80 00 00 00       	cmp    $0x80,%eax
     ace:	74 38                	je     b08 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     ad0:	39 1a                	cmp    %ebx,(%edx)
     ad2:	75 ec                	jne    ac0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     ad4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     ada:	05 c0 23 00 00       	add    $0x23c0,%eax
     adf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     ae6:	74 0a                	je     af2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     ae8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     aef:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     af2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     af9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     afc:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     afd:	e9 38 f9 ff ff       	jmp    43a <alarm>
     b02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     b08:	83 ec 04             	sub    $0x4,%esp
     b0b:	53                   	push   %ebx
     b0c:	68 90 14 00 00       	push   $0x1490
     b11:	6a 01                	push   $0x1
     b13:	e8 d8 f9 ff ff       	call   4f0 <printf>
     b18:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b1b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     b22:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b25:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     b26:	e9 0f f9 ff ff       	jmp    43a <alarm>
     b2b:	90                   	nop
     b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000b30 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     b30:	55                   	push   %ebp
     b31:	89 e5                	mov    %esp,%ebp
     b33:	53                   	push   %ebx
     b34:	83 ec 10             	sub    $0x10,%esp
     b37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     b3a:	6a 00                	push   $0x0
     b3c:	e8 f9 f8 ff ff       	call   43a <alarm>
     b41:	b8 c4 23 00 00       	mov    $0x23c4,%eax
     b46:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     b49:	31 d2                	xor    %edx,%edx
     b4b:	eb 17                	jmp    b64 <bsem_down+0x34>
     b4d:	8d 76 00             	lea    0x0(%esi),%esi
     b50:	83 c2 01             	add    $0x1,%edx
     b53:	05 0c 01 00 00       	add    $0x10c,%eax
     b58:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     b5e:	0f 84 8c 00 00 00    	je     bf0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     b64:	39 18                	cmp    %ebx,(%eax)
     b66:	75 e8                	jne    b50 <bsem_down+0x20>
     b68:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     b6e:	85 c9                	test   %ecx,%ecx
     b70:	75 de                	jne    b50 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     b72:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     b78:	31 c0                	xor    %eax,%eax
     b7a:	83 b9 c0 23 00 00 01 	cmpl   $0x1,0x23c0(%ecx)
     b81:	75 15                	jne    b98 <bsem_down+0x68>
     b83:	e9 93 00 00 00       	jmp    c1b <bsem_down+0xeb>
     b88:	90                   	nop
     b89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     b90:	83 c0 01             	add    $0x1,%eax
     b93:	83 f8 40             	cmp    $0x40,%eax
     b96:	74 7b                	je     c13 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     b98:	83 bc 81 c8 23 00 00 	cmpl   $0xffffffff,0x23c8(%ecx,%eax,4)
     b9f:	ff 
     ba0:	75 ee                	jne    b90 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     ba2:	8b 0d c8 a9 00 00    	mov    0xa9c8,%ecx
     ba8:	6b d2 43             	imul   $0x43,%edx,%edx
     bab:	01 c2                	add    %eax,%edx
     bad:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     bb0:	8b 04 85 a0 1a 00 00 	mov    0x1aa0(,%eax,4),%eax
     bb7:	89 04 95 c8 23 00 00 	mov    %eax,0x23c8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     bbe:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     bc1:	c7 04 85 a8 1a 00 00 	movl   $0x4,0x1aa8(,%eax,4)
     bc8:	04 00 00 00 

	 sigsend(getpid(),14);
     bcc:	e8 31 f8 ff ff       	call   402 <getpid>
     bd1:	83 ec 08             	sub    $0x8,%esp
     bd4:	6a 0e                	push   $0xe
     bd6:	50                   	push   %eax
     bd7:	e8 4e f8 ff ff       	call   42a <sigsend>
     bdc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bdf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     be6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     be9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     bea:	e9 4b f8 ff ff       	jmp    43a <alarm>
     bef:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     bf0:	83 ec 04             	sub    $0x4,%esp
     bf3:	53                   	push   %ebx
     bf4:	68 54 13 00 00       	push   $0x1354
     bf9:	6a 01                	push   $0x1
     bfb:	e8 f0 f8 ff ff       	call   4f0 <printf>
     c00:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     c03:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     c0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c0d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c0e:	e9 27 f8 ff ff       	jmp    43a <alarm>
     c13:	8b 0d c8 a9 00 00    	mov    0xa9c8,%ecx
     c19:	eb a3                	jmp    bbe <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     c1b:	c7 81 c0 23 00 00 00 	movl   $0x0,0x23c0(%ecx)
     c22:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c25:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     c2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c2f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     c30:	e9 05 f8 ff ff       	jmp    43a <alarm>
     c35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c40 <bsem_up>:
}

void bsem_up(int id) {
     c40:	55                   	push   %ebp
     c41:	89 e5                	mov    %esp,%ebp
     c43:	57                   	push   %edi
     c44:	56                   	push   %esi
     c45:	53                   	push   %ebx
     c46:	83 ec 28             	sub    $0x28,%esp
     c49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     c4c:	6a 00                	push   $0x0
     c4e:	e8 e7 f7 ff ff       	call   43a <alarm>
     c53:	ba c4 23 00 00       	mov    $0x23c4,%edx
     c58:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c5b:	31 c0                	xor    %eax,%eax
     c5d:	eb 15                	jmp    c74 <bsem_up+0x34>
     c5f:	90                   	nop
     c60:	83 c0 01             	add    $0x1,%eax
     c63:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     c69:	3d 80 00 00 00       	cmp    $0x80,%eax
     c6e:	0f 84 ac 00 00 00    	je     d20 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     c74:	39 1a                	cmp    %ebx,(%edx)
     c76:	75 e8                	jne    c60 <bsem_up+0x20>
     c78:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     c7e:	85 c9                	test   %ecx,%ecx
     c80:	75 de                	jne    c60 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     c82:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     c88:	8b 97 c0 23 00 00    	mov    0x23c0(%edi),%edx
     c8e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     c91:	85 d2                	test   %edx,%edx
     c93:	0f 85 9c 00 00 00    	jne    d35 <bsem_up+0xf5>
     c99:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     c9b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     c9e:	8b b4 be c8 23 00 00 	mov    0x23c8(%esi,%edi,4),%esi
     ca5:	83 fe ff             	cmp    $0xffffffff,%esi
     ca8:	74 56                	je     d00 <bsem_up+0xc0>
     caa:	b9 a0 1a 00 00       	mov    $0x1aa0,%ecx
     caf:	31 d2                	xor    %edx,%edx
     cb1:	eb 10                	jmp    cc3 <bsem_up+0x83>
     cb3:	90                   	nop
     cb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     cb8:	83 c2 01             	add    $0x1,%edx
     cbb:	83 c1 24             	add    $0x24,%ecx
     cbe:	83 fa 40             	cmp    $0x40,%edx
     cc1:	74 3d                	je     d00 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     cc3:	8b 19                	mov    (%ecx),%ebx
     cc5:	39 de                	cmp    %ebx,%esi
     cc7:	75 ef                	jne    cb8 <bsem_up+0x78>
     cc9:	83 fb ff             	cmp    $0xffffffff,%ebx
     ccc:	74 ea                	je     cb8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     cce:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     cd1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     cd4:	c7 04 95 a8 1a 00 00 	movl   $0x2,0x1aa8(,%edx,4)
     cdb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     cdf:	01 c7                	add    %eax,%edi
     ce1:	c7 04 bd c8 23 00 00 	movl   $0xffffffff,0x23c8(,%edi,4)
     ce8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     cec:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     cf3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cf6:	5b                   	pop    %ebx
     cf7:	5e                   	pop    %esi
     cf8:	5f                   	pop    %edi
     cf9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     cfa:	e9 3b f7 ff ff       	jmp    43a <alarm>
     cff:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     d00:	83 c7 01             	add    $0x1,%edi
     d03:	83 ff 40             	cmp    $0x40,%edi
     d06:	75 93                	jne    c9b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     d08:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     d0e:	c7 80 c0 23 00 00 01 	movl   $0x1,0x23c0(%eax)
     d15:	00 00 00 
     d18:	eb d2                	jmp    cec <bsem_up+0xac>
     d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     d20:	83 ec 04             	sub    $0x4,%esp
     d23:	53                   	push   %ebx
     d24:	68 bc 13 00 00       	push   $0x13bc
     d29:	6a 01                	push   $0x1
     d2b:	e8 c0 f7 ff ff       	call   4f0 <printf>
     d30:	83 c4 10             	add    $0x10,%esp
     d33:	eb b7                	jmp    cec <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     d35:	83 ec 08             	sub    $0x8,%esp
     d38:	68 98 13 00 00       	push   $0x1398
     d3d:	6a 01                	push   $0x1
     d3f:	e8 ac f7 ff ff       	call   4f0 <printf>
     d44:	83 c4 10             	add    $0x10,%esp
     d47:	eb a3                	jmp    cec <bsem_up+0xac>
     d49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000d50 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     d50:	55                   	push   %ebp
     d51:	89 e5                	mov    %esp,%ebp
     d53:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     d56:	68 00 14 00 00       	push   $0x1400
     d5b:	6a 01                	push   $0x1
     d5d:	e8 8e f7 ff ff       	call   4f0 <printf>
     d62:	b8 a0 1a 00 00       	mov    $0x1aa0,%eax
     d67:	83 c4 10             	add    $0x10,%esp
     d6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     d70:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     d76:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     d7d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     d80:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     d87:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     d8e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     d95:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     d9c:	3d a0 23 00 00       	cmp    $0x23a0,%eax
     da1:	75 cd                	jne    d70 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     da3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     da6:	c7 05 a0 1a 00 00 00 	movl   $0x0,0x1aa0
     dad:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     db0:	c7 05 a8 1a 00 00 03 	movl   $0x3,0x1aa8
     db7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     dba:	68 50 0f 00 00       	push   $0xf50
     dbf:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     dc1:	c7 05 a4 1a 00 00 00 	movl   $0x0,0x1aa4
     dc8:	00 00 00 

  id_number_thread = 1;
     dcb:	c7 05 c4 a9 00 00 01 	movl   $0x1,0xa9c4
     dd2:	00 00 00 
  index_currently_running = 0;
     dd5:	c7 05 c8 a9 00 00 00 	movl   $0x0,0xa9c8
     ddc:	00 00 00 
  currently_running = 0;
     ddf:	c7 05 a0 23 00 00 00 	movl   $0x0,0x23a0
     de6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     de9:	e8 34 f6 ff ff       	call   422 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     dee:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     df5:	e8 40 f6 ff ff       	call   43a <alarm>
  return 0;
}
     dfa:	31 c0                	xor    %eax,%eax
     dfc:	c9                   	leave  
     dfd:	c3                   	ret    
     dfe:	66 90                	xchg   %ax,%ax

00000e00 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     e00:	55                   	push   %ebp
     e01:	89 e5                	mov    %esp,%ebp
     e03:	56                   	push   %esi
     e04:	53                   	push   %ebx
  alarm(0);
     e05:	83 ec 0c             	sub    $0xc,%esp
     e08:	6a 00                	push   $0x0
     e0a:	e8 2b f6 ff ff       	call   43a <alarm>
  printf(1, "------ creating a new thread ------\n");
     e0f:	5b                   	pop    %ebx
     e10:	5e                   	pop    %esi
     e11:	68 2c 14 00 00       	push   $0x142c
     e16:	6a 01                	push   $0x1
     e18:	e8 d3 f6 ff ff       	call   4f0 <printf>
     e1d:	ba a8 1a 00 00       	mov    $0x1aa8,%edx
     e22:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
     e25:	31 c0                	xor    %eax,%eax
     e27:	eb 12                	jmp    e3b <uthread_create+0x3b>
     e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     e30:	83 c0 01             	add    $0x1,%eax
     e33:	83 c2 24             	add    $0x24,%edx
     e36:	83 f8 40             	cmp    $0x40,%eax
     e39:	74 7d                	je     eb8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
     e3b:	8b 0a                	mov    (%edx),%ecx
     e3d:	85 c9                	test   %ecx,%ecx
     e3f:	75 ef                	jne    e30 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e41:	8b 15 c4 a9 00 00    	mov    0xa9c4,%edx
     e47:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e4a:	83 ec 0c             	sub    $0xc,%esp
     e4d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
     e52:	c1 e3 02             	shl    $0x2,%ebx
     e55:	89 93 a0 1a 00 00    	mov    %edx,0x1aa0(%ebx)
  id_number_thread++;
     e5b:	83 c2 01             	add    $0x1,%edx
     e5e:	89 15 c4 a9 00 00    	mov    %edx,0xa9c4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e64:	e8 b7 f8 ff ff       	call   720 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e69:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
     e6c:	c7 80 f4 0f 00 00 50 	movl   $0x850,0xff4(%eax)
     e73:	08 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
     e76:	89 83 a4 1a 00 00    	mov    %eax,0x1aa4(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
     e7c:	c7 83 a8 1a 00 00 02 	movl   $0x2,0x1aa8(%ebx)
     e83:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
     e86:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
     e8c:	8b 55 0c             	mov    0xc(%ebp),%edx
     e8f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
     e95:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     e9c:	e8 99 f5 ff ff       	call   43a <alarm>
  return   threads[free_thread].thread_id;
     ea1:	8b 83 a0 1a 00 00    	mov    0x1aa0(%ebx),%eax
     ea7:	83 c4 10             	add    $0x10,%esp
}
     eaa:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ead:	5b                   	pop    %ebx
     eae:	5e                   	pop    %esi
     eaf:	5d                   	pop    %ebp
     eb0:	c3                   	ret    
     eb1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
     eb8:	83 ec 08             	sub    $0x8,%esp
     ebb:	68 a2 14 00 00       	push   $0x14a2
     ec0:	6a 01                	push   $0x1
     ec2:	e8 29 f6 ff ff       	call   4f0 <printf>
    alarm(UTHREAD_QUANTA);
     ec7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     ece:	e8 67 f5 ff ff       	call   43a <alarm>
    return -1;
     ed3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     ed6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
     ed9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
     ede:	5b                   	pop    %ebx
     edf:	5e                   	pop    %esi
     ee0:	5d                   	pop    %ebp
     ee1:	c3                   	ret    
     ee2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ee9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ef0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
     ef0:	55                   	push   %ebp
     ef1:	89 e5                	mov    %esp,%ebp
     ef3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
     ef6:	85 c0                	test   %eax,%eax
     ef8:	74 14                	je     f0e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
     efa:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     efd:	89 e2                	mov    %esp,%edx
     eff:	8d 04 85 a0 1a 00 00 	lea    0x1aa0(,%eax,4),%eax
     f06:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
     f09:	89 ea                	mov    %ebp,%edx
     f0b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     f0e:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
     f13:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     f16:	8d 04 85 a0 1a 00 00 	lea    0x1aa0(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     f1d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
     f20:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
     f27:	85 d2                	test   %edx,%edx
     f29:	74 0d                	je     f38 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
     f2b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
     f2d:	8b 40 0c             	mov    0xc(%eax),%eax
     f30:	89 c5                	mov    %eax,%ebp
  }
  return;
}
     f32:	5d                   	pop    %ebp
     f33:	c3                   	ret    
     f34:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f38:	8b 40 04             	mov    0x4(%eax),%eax
     f3b:	05 f4 0f 00 00       	add    $0xff4,%eax
     f40:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
     f42:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
     f44:	b8 10 08 00 00       	mov    $0x810,%eax
     f49:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
     f4b:	5d                   	pop    %ebp
     f4c:	c3                   	ret    
     f4d:	8d 76 00             	lea    0x0(%esi),%esi

00000f50 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	56                   	push   %esi
     f54:	53                   	push   %ebx
     f55:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
     f58:	83 ec 0c             	sub    $0xc,%esp
     f5b:	6a 00                	push   $0x0
     f5d:	e8 d8 f4 ff ff       	call   43a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
     f62:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
     f67:	83 c4 10             	add    $0x10,%esp
     f6a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     f6d:	8d 14 95 a0 1a 00 00 	lea    0x1aa0(,%edx,4),%edx
     f74:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
     f78:	75 0b                	jne    f85 <uthread_schedule+0x35>
     f7a:	85 c0                	test   %eax,%eax
     f7c:	74 07                	je     f85 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
     f7e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
     f85:	bb a8 1a 00 00       	mov    $0x1aa8,%ebx
     f8a:	eb 0f                	jmp    f9b <uthread_schedule+0x4b>
     f8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f90:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     f93:	81 fb a8 23 00 00    	cmp    $0x23a8,%ebx
     f99:	74 55                	je     ff0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
     f9b:	83 3b 01             	cmpl   $0x1,(%ebx)
     f9e:	75 f0                	jne    f90 <uthread_schedule+0x40>
     fa0:	8b 73 14             	mov    0x14(%ebx),%esi
     fa3:	85 f6                	test   %esi,%esi
     fa5:	0f 85 a5 00 00 00    	jne    1050 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
     fab:	8b 43 18             	mov    0x18(%ebx),%eax
     fae:	83 f8 ff             	cmp    $0xffffffff,%eax
     fb1:	74 dd                	je     f90 <uthread_schedule+0x40>
     fb3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     fb6:	8b 14 95 a8 1a 00 00 	mov    0x1aa8(,%edx,4),%edx
     fbd:	85 d2                	test   %edx,%edx
     fbf:	75 cf                	jne    f90 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
     fc1:	50                   	push   %eax
     fc2:	ff 73 f8             	pushl  -0x8(%ebx)
     fc5:	83 c3 24             	add    $0x24,%ebx
     fc8:	68 54 14 00 00       	push   $0x1454
     fcd:	6a 01                	push   $0x1
     fcf:	e8 1c f5 ff ff       	call   4f0 <printf>
      threads[i].join = -1;
     fd4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
     fdb:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
     fe2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     fe5:	81 fb a8 23 00 00    	cmp    $0x23a8,%ebx
     feb:	75 ae                	jne    f9b <uthread_schedule+0x4b>
     fed:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
     ff0:	8b 15 c8 a9 00 00    	mov    0xa9c8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
     ff6:	b9 40 00 00 00       	mov    $0x40,%ecx
     ffb:	8d 42 01             	lea    0x1(%edx),%eax
     ffe:	eb 08                	jmp    1008 <uthread_schedule+0xb8>
    1000:	83 c0 01             	add    $0x1,%eax
    1003:	83 e9 01             	sub    $0x1,%ecx
    1006:	74 78                	je     1080 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    1008:	89 c3                	mov    %eax,%ebx
    100a:	c1 fb 1f             	sar    $0x1f,%ebx
    100d:	c1 eb 1a             	shr    $0x1a,%ebx
    1010:	01 d8                	add    %ebx,%eax
    1012:	83 e0 3f             	and    $0x3f,%eax
    1015:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    1017:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    101a:	83 3c 9d a8 1a 00 00 	cmpl   $0x2,0x1aa8(,%ebx,4)
    1021:	02 
    1022:	75 dc                	jne    1000 <uthread_schedule+0xb0>
    1024:	39 c2                	cmp    %eax,%edx
    1026:	74 d8                	je     1000 <uthread_schedule+0xb0>
      index_currently_running = i;
    1028:	a3 c8 a9 00 00       	mov    %eax,0xa9c8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    102d:	83 ec 08             	sub    $0x8,%esp
    1030:	50                   	push   %eax
    1031:	52                   	push   %edx
    1032:	e8 b9 fe ff ff       	call   ef0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    1037:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    103e:	e8 f7 f3 ff ff       	call   43a <alarm>
}
    1043:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1046:	5b                   	pop    %ebx
    1047:	5e                   	pop    %esi
    1048:	5d                   	pop    %ebp
    1049:	c3                   	ret    
    104a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1050:	e8 c5 f3 ff ff       	call   41a <uptime>
    1055:	39 c6                	cmp    %eax,%esi
    1057:	7f 17                	jg     1070 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1059:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    105f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1066:	e9 25 ff ff ff       	jmp    f90 <uthread_schedule+0x40>
    106b:	90                   	nop
    106c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1070:	83 3b 01             	cmpl   $0x1,(%ebx)
    1073:	0f 84 32 ff ff ff    	je     fab <uthread_schedule+0x5b>
    1079:	e9 12 ff ff ff       	jmp    f90 <uthread_schedule+0x40>
    107e:	66 90                	xchg   %ax,%ax
    1080:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1083:	83 3c 85 a8 1a 00 00 	cmpl   $0x2,0x1aa8(,%eax,4)
    108a:	02 
    108b:	0f 85 c7 fe ff ff    	jne    f58 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1091:	89 d0                	mov    %edx,%eax
    1093:	eb 98                	jmp    102d <uthread_schedule+0xdd>
    1095:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1099:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010a0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    10a0:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
  exit();
}

int
uthread_self()
{
    10a5:	55                   	push   %ebp
    10a6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    10a8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    10ab:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    10ac:	8b 04 85 a0 1a 00 00 	mov    0x1aa0(,%eax,4),%eax
}
    10b3:	c3                   	ret    
    10b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    10ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000010c0 <uthread_join>:

int
uthread_join(int tid)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	56                   	push   %esi
    10c4:	53                   	push   %ebx
    10c5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    10c8:	39 35 c4 a9 00 00    	cmp    %esi,0xa9c4
    10ce:	0f 8c ab 00 00 00    	jl     117f <uthread_join+0xbf>
    10d4:	89 f0                	mov    %esi,%eax
    10d6:	c1 e8 1f             	shr    $0x1f,%eax
    10d9:	84 c0                	test   %al,%al
    10db:	0f 85 9e 00 00 00    	jne    117f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    10e1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    10e4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    10e6:	6a 00                	push   $0x0
    10e8:	e8 4d f3 ff ff       	call   43a <alarm>
    10ed:	b8 a0 1a 00 00       	mov    $0x1aa0,%eax
    10f2:	83 c4 10             	add    $0x10,%esp
    10f5:	eb 14                	jmp    110b <uthread_join+0x4b>
    10f7:	89 f6                	mov    %esi,%esi
    10f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1100:	83 c3 01             	add    $0x1,%ebx
    1103:	83 c0 24             	add    $0x24,%eax
    1106:	83 fb 40             	cmp    $0x40,%ebx
    1109:	74 55                	je     1160 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    110b:	3b 30                	cmp    (%eax),%esi
    110d:	75 f1                	jne    1100 <uthread_join+0x40>
    110f:	8b 50 08             	mov    0x8(%eax),%edx
    1112:	85 d2                	test   %edx,%edx
    1114:	74 ea                	je     1100 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1116:	53                   	push   %ebx
    1117:	ff 35 c8 a9 00 00    	pushl  0xa9c8
    111d:	68 de 14 00 00       	push   $0x14de
    1122:	6a 01                	push   $0x1
    1124:	e8 c7 f3 ff ff       	call   4f0 <printf>
    threads[index_currently_running].join=found_tid;
    1129:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
    112e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1131:	8d 04 85 a0 1a 00 00 	lea    0x1aa0(,%eax,4),%eax
    1138:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    113b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1142:	e8 bb f2 ff ff       	call   402 <getpid>
    1147:	5a                   	pop    %edx
    1148:	59                   	pop    %ecx
    1149:	6a 0e                	push   $0xe
    114b:	50                   	push   %eax
    114c:	e8 d9 f2 ff ff       	call   42a <sigsend>
  }
  return 0;
    1151:	83 c4 10             	add    $0x10,%esp

}
    1154:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1157:	31 c0                	xor    %eax,%eax

}
    1159:	5b                   	pop    %ebx
    115a:	5e                   	pop    %esi
    115b:	5d                   	pop    %ebp
    115c:	c3                   	ret    
    115d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1160:	83 ec 04             	sub    $0x4,%esp
    1163:	56                   	push   %esi
    1164:	68 c0 14 00 00       	push   $0x14c0
    1169:	6a 01                	push   $0x1
    116b:	e8 80 f3 ff ff       	call   4f0 <printf>
    alarm(UTHREAD_QUANTA);
    1170:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1177:	e8 be f2 ff ff       	call   43a <alarm>
    return -1;
    117c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    117f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1182:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1187:	5b                   	pop    %ebx
    1188:	5e                   	pop    %esi
    1189:	5d                   	pop    %ebp
    118a:	c3                   	ret    
    118b:	90                   	nop
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001190 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1190:	55                   	push   %ebp
    1191:	89 e5                	mov    %esp,%ebp
    1193:	53                   	push   %ebx
    1194:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1197:	6a 00                	push   $0x0
    1199:	e8 9c f2 ff ff       	call   43a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    119e:	8b 1d c8 a9 00 00    	mov    0xa9c8,%ebx
    11a4:	e8 71 f2 ff ff       	call   41a <uptime>
    11a9:	03 45 08             	add    0x8(%ebp),%eax
    11ac:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    11af:	89 04 95 bc 1a 00 00 	mov    %eax,0x1abc(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    11b6:	a1 c8 a9 00 00       	mov    0xa9c8,%eax
    11bb:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    11be:	c7 04 85 a8 1a 00 00 	movl   $0x1,0x1aa8(,%eax,4)
    11c5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    11c9:	e8 34 f2 ff ff       	call   402 <getpid>
    11ce:	5a                   	pop    %edx
    11cf:	59                   	pop    %ecx
    11d0:	6a 0e                	push   $0xe
    11d2:	50                   	push   %eax
    11d3:	e8 52 f2 ff ff       	call   42a <sigsend>
  return 0;
}
    11d8:	31 c0                	xor    %eax,%eax
    11da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11dd:	c9                   	leave  
    11de:	c3                   	ret    
    11df:	90                   	nop

000011e0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    11e0:	55                   	push   %ebp
    11e1:	89 e5                	mov    %esp,%ebp
    11e3:	53                   	push   %ebx
    11e4:	83 ec 04             	sub    $0x4,%esp
    11e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    11ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    11ed:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    11f0:	e8 bb f7 ff ff       	call   9b0 <bsem_alloc>
    11f5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    11f7:	e8 b4 f7 ff ff       	call   9b0 <bsem_alloc>
    11fc:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    11ff:	83 c4 04             	add    $0x4,%esp
    1202:	5b                   	pop    %ebx
    1203:	5d                   	pop    %ebp
    1204:	c3                   	ret    
    1205:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1209:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001210 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1210:	55                   	push   %ebp
    1211:	89 e5                	mov    %esp,%ebp
    1213:	53                   	push   %ebx
    1214:	83 ec 10             	sub    $0x10,%esp
    1217:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    121a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1221:	ff 33                	pushl  (%ebx)
    1223:	e8 78 f8 ff ff       	call   aa0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1228:	8b 43 04             	mov    0x4(%ebx),%eax
    122b:	83 c4 10             	add    $0x10,%esp
}
    122e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1231:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1234:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1235:	e9 66 f8 ff ff       	jmp    aa0 <bsem_free>
    123a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001240 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1240:	55                   	push   %ebp
    1241:	89 e5                	mov    %esp,%ebp
    1243:	53                   	push   %ebx
    1244:	83 ec 10             	sub    $0x10,%esp
    1247:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    124a:	ff 73 04             	pushl  0x4(%ebx)
    124d:	e8 de f8 ff ff       	call   b30 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1252:	58                   	pop    %eax
    1253:	ff 33                	pushl  (%ebx)
    1255:	e8 d6 f8 ff ff       	call   b30 <bsem_down>
  csem->value--;
    125a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    125d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1260:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1263:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1265:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1268:	7e 0e                	jle    1278 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    126a:	83 ec 0c             	sub    $0xc,%esp
    126d:	ff 73 04             	pushl  0x4(%ebx)
    1270:	e8 cb f9 ff ff       	call   c40 <bsem_up>
    1275:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1278:	8b 03                	mov    (%ebx),%eax
}
    127a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    127d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1280:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1281:	e9 ba f9 ff ff       	jmp    c40 <bsem_up>
    1286:	8d 76 00             	lea    0x0(%esi),%esi
    1289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001290 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	53                   	push   %ebx
    1294:	83 ec 10             	sub    $0x10,%esp
    1297:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    129a:	ff 33                	pushl  (%ebx)
    129c:	e8 8f f8 ff ff       	call   b30 <bsem_down>
  csem->value++;
    12a1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    12a4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    12a7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    12aa:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    12ad:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    12b0:	74 0e                	je     12c0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12b2:	8b 03                	mov    (%ebx),%eax
}
    12b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12b7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12ba:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12bb:	e9 80 f9 ff ff       	jmp    c40 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    12c0:	83 ec 0c             	sub    $0xc,%esp
    12c3:	ff 73 04             	pushl  0x4(%ebx)
    12c6:	e8 75 f9 ff ff       	call   c40 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    12cb:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    12cd:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    12d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12d3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    12d6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    12d7:	e9 64 f9 ff ff       	jmp    c40 <bsem_up>
