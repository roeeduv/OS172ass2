
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  close(fd);
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
      11:	bb 01 00 00 00       	mov    $0x1,%ebx
      16:	83 ec 08             	sub    $0x8,%esp
      19:	8b 31                	mov    (%ecx),%esi
      1b:	8b 79 04             	mov    0x4(%ecx),%edi
  int i;

  if(argc < 2){
      1e:	83 fe 01             	cmp    $0x1,%esi
      21:	7e 1f                	jle    42 <main+0x42>
      23:	90                   	nop
      24:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
    ls(argv[i]);
      28:	83 ec 0c             	sub    $0xc,%esp
      2b:	ff 34 9f             	pushl  (%edi,%ebx,4)

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
      2e:	83 c3 01             	add    $0x1,%ebx
    ls(argv[i]);
      31:	e8 ca 00 00 00       	call   100 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
      36:	83 c4 10             	add    $0x10,%esp
      39:	39 de                	cmp    %ebx,%esi
      3b:	75 eb                	jne    28 <main+0x28>
    ls(argv[i]);
  exit();
      3d:	e8 40 05 00 00       	call   582 <exit>
main(int argc, char *argv[])
{
  int i;

  if(argc < 2){
    ls(".");
      42:	83 ec 0c             	sub    $0xc,%esp
      45:	68 24 15 00 00       	push   $0x1524
      4a:	e8 b1 00 00 00       	call   100 <ls>
    exit();
      4f:	e8 2e 05 00 00       	call   582 <exit>
      54:	66 90                	xchg   %ax,%ax
      56:	66 90                	xchg   %ax,%ax
      58:	66 90                	xchg   %ax,%ax
      5a:	66 90                	xchg   %ax,%ax
      5c:	66 90                	xchg   %ax,%ax
      5e:	66 90                	xchg   %ax,%ax

00000060 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
      60:	55                   	push   %ebp
      61:	89 e5                	mov    %esp,%ebp
      63:	56                   	push   %esi
      64:	53                   	push   %ebx
      65:	8b 5d 08             	mov    0x8(%ebp),%ebx
  static char buf[DIRSIZ+1];
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
      68:	83 ec 0c             	sub    $0xc,%esp
      6b:	53                   	push   %ebx
      6c:	e8 4f 03 00 00       	call   3c0 <strlen>
      71:	83 c4 10             	add    $0x10,%esp
      74:	01 d8                	add    %ebx,%eax
      76:	73 0f                	jae    87 <fmtname+0x27>
      78:	eb 12                	jmp    8c <fmtname+0x2c>
      7a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      80:	83 e8 01             	sub    $0x1,%eax
      83:	39 c3                	cmp    %eax,%ebx
      85:	77 05                	ja     8c <fmtname+0x2c>
      87:	80 38 2f             	cmpb   $0x2f,(%eax)
      8a:	75 f4                	jne    80 <fmtname+0x20>
    ;
  p++;
      8c:	8d 58 01             	lea    0x1(%eax),%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
      8f:	83 ec 0c             	sub    $0xc,%esp
      92:	53                   	push   %ebx
      93:	e8 28 03 00 00       	call   3c0 <strlen>
      98:	83 c4 10             	add    $0x10,%esp
      9b:	83 f8 0d             	cmp    $0xd,%eax
      9e:	77 4a                	ja     ea <fmtname+0x8a>
    return p;
  memmove(buf, p, strlen(p));
      a0:	83 ec 0c             	sub    $0xc,%esp
      a3:	53                   	push   %ebx
      a4:	e8 17 03 00 00       	call   3c0 <strlen>
      a9:	83 c4 0c             	add    $0xc,%esp
      ac:	50                   	push   %eax
      ad:	53                   	push   %ebx
      ae:	68 00 1d 00 00       	push   $0x1d00
      b3:	e8 98 04 00 00       	call   550 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      b8:	89 1c 24             	mov    %ebx,(%esp)
      bb:	e8 00 03 00 00       	call   3c0 <strlen>
      c0:	89 1c 24             	mov    %ebx,(%esp)
      c3:	89 c6                	mov    %eax,%esi
  return buf;
      c5:	bb 00 1d 00 00       	mov    $0x1d00,%ebx

  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
    return p;
  memmove(buf, p, strlen(p));
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
      ca:	e8 f1 02 00 00       	call   3c0 <strlen>
      cf:	ba 0e 00 00 00       	mov    $0xe,%edx
      d4:	83 c4 0c             	add    $0xc,%esp
      d7:	05 00 1d 00 00       	add    $0x1d00,%eax
      dc:	29 f2                	sub    %esi,%edx
      de:	52                   	push   %edx
      df:	6a 20                	push   $0x20
      e1:	50                   	push   %eax
      e2:	e8 09 03 00 00       	call   3f0 <memset>
  return buf;
      e7:	83 c4 10             	add    $0x10,%esp
}
      ea:	8d 65 f8             	lea    -0x8(%ebp),%esp
      ed:	89 d8                	mov    %ebx,%eax
      ef:	5b                   	pop    %ebx
      f0:	5e                   	pop    %esi
      f1:	5d                   	pop    %ebp
      f2:	c3                   	ret    
      f3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000100 <ls>:

void
ls(char *path)
{
     100:	55                   	push   %ebp
     101:	89 e5                	mov    %esp,%ebp
     103:	57                   	push   %edi
     104:	56                   	push   %esi
     105:	53                   	push   %ebx
     106:	81 ec 64 02 00 00    	sub    $0x264,%esp
     10c:	8b 7d 08             	mov    0x8(%ebp),%edi
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
     10f:	6a 00                	push   $0x0
     111:	57                   	push   %edi
     112:	e8 ab 04 00 00       	call   5c2 <open>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	85 c0                	test   %eax,%eax
     11c:	0f 88 9e 01 00 00    	js     2c0 <ls+0x1c0>
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
     122:	8d b5 d4 fd ff ff    	lea    -0x22c(%ebp),%esi
     128:	83 ec 08             	sub    $0x8,%esp
     12b:	89 c3                	mov    %eax,%ebx
     12d:	56                   	push   %esi
     12e:	50                   	push   %eax
     12f:	e8 a6 04 00 00       	call   5da <fstat>
     134:	83 c4 10             	add    $0x10,%esp
     137:	85 c0                	test   %eax,%eax
     139:	0f 88 c1 01 00 00    	js     300 <ls+0x200>
    printf(2, "ls: cannot stat %s\n", path);
    close(fd);
    return;
  }

  switch(st.type){
     13f:	0f b7 85 d4 fd ff ff 	movzwl -0x22c(%ebp),%eax
     146:	66 83 f8 01          	cmp    $0x1,%ax
     14a:	74 54                	je     1a0 <ls+0xa0>
     14c:	66 83 f8 02          	cmp    $0x2,%ax
     150:	75 37                	jne    189 <ls+0x89>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
     152:	83 ec 0c             	sub    $0xc,%esp
     155:	8b 95 e4 fd ff ff    	mov    -0x21c(%ebp),%edx
     15b:	8b b5 dc fd ff ff    	mov    -0x224(%ebp),%esi
     161:	57                   	push   %edi
     162:	89 95 b4 fd ff ff    	mov    %edx,-0x24c(%ebp)
     168:	e8 f3 fe ff ff       	call   60 <fmtname>
     16d:	8b 95 b4 fd ff ff    	mov    -0x24c(%ebp),%edx
     173:	59                   	pop    %ecx
     174:	5f                   	pop    %edi
     175:	52                   	push   %edx
     176:	56                   	push   %esi
     177:	6a 02                	push   $0x2
     179:	50                   	push   %eax
     17a:	68 04 15 00 00       	push   $0x1504
     17f:	6a 01                	push   $0x1
     181:	e8 6a 05 00 00       	call   6f0 <printf>
    break;
     186:	83 c4 20             	add    $0x20,%esp
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
     189:	83 ec 0c             	sub    $0xc,%esp
     18c:	53                   	push   %ebx
     18d:	e8 18 04 00 00       	call   5aa <close>
     192:	83 c4 10             	add    $0x10,%esp
}
     195:	8d 65 f4             	lea    -0xc(%ebp),%esp
     198:	5b                   	pop    %ebx
     199:	5e                   	pop    %esi
     19a:	5f                   	pop    %edi
     19b:	5d                   	pop    %ebp
     19c:	c3                   	ret    
     19d:	8d 76 00             	lea    0x0(%esi),%esi
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
     1a0:	83 ec 0c             	sub    $0xc,%esp
     1a3:	57                   	push   %edi
     1a4:	e8 17 02 00 00       	call   3c0 <strlen>
     1a9:	83 c0 10             	add    $0x10,%eax
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	3d 00 02 00 00       	cmp    $0x200,%eax
     1b4:	0f 87 26 01 00 00    	ja     2e0 <ls+0x1e0>
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
     1ba:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     1c0:	83 ec 08             	sub    $0x8,%esp
     1c3:	57                   	push   %edi
     1c4:	8d bd c4 fd ff ff    	lea    -0x23c(%ebp),%edi
     1ca:	50                   	push   %eax
     1cb:	e8 70 01 00 00       	call   340 <strcpy>
    p = buf+strlen(buf);
     1d0:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     1d6:	89 04 24             	mov    %eax,(%esp)
     1d9:	e8 e2 01 00 00       	call   3c0 <strlen>
     1de:	8d 95 e8 fd ff ff    	lea    -0x218(%ebp),%edx
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     1e4:	83 c4 10             	add    $0x10,%esp
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
     1e7:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
    *p++ = '/';
     1ea:	8d 84 05 e9 fd ff ff 	lea    -0x217(%ebp,%eax,1),%eax
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
     1f1:	89 8d a8 fd ff ff    	mov    %ecx,-0x258(%ebp)
    *p++ = '/';
     1f7:	89 85 a4 fd ff ff    	mov    %eax,-0x25c(%ebp)
     1fd:	c6 01 2f             	movb   $0x2f,(%ecx)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
     200:	83 ec 04             	sub    $0x4,%esp
     203:	6a 10                	push   $0x10
     205:	57                   	push   %edi
     206:	53                   	push   %ebx
     207:	e8 8e 03 00 00       	call   59a <read>
     20c:	83 c4 10             	add    $0x10,%esp
     20f:	83 f8 10             	cmp    $0x10,%eax
     212:	0f 85 71 ff ff ff    	jne    189 <ls+0x89>
      if(de.inum == 0)
     218:	66 83 bd c4 fd ff ff 	cmpw   $0x0,-0x23c(%ebp)
     21f:	00 
     220:	74 de                	je     200 <ls+0x100>
        continue;
      memmove(p, de.name, DIRSIZ);
     222:	8d 85 c6 fd ff ff    	lea    -0x23a(%ebp),%eax
     228:	83 ec 04             	sub    $0x4,%esp
     22b:	6a 0e                	push   $0xe
     22d:	50                   	push   %eax
     22e:	ff b5 a4 fd ff ff    	pushl  -0x25c(%ebp)
     234:	e8 17 03 00 00       	call   550 <memmove>
      p[DIRSIZ] = 0;
     239:	8b 85 a8 fd ff ff    	mov    -0x258(%ebp),%eax
     23f:	c6 40 0f 00          	movb   $0x0,0xf(%eax)
      if(stat(buf, &st) < 0){
     243:	58                   	pop    %eax
     244:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     24a:	5a                   	pop    %edx
     24b:	56                   	push   %esi
     24c:	50                   	push   %eax
     24d:	e8 6e 02 00 00       	call   4c0 <stat>
     252:	83 c4 10             	add    $0x10,%esp
     255:	85 c0                	test   %eax,%eax
     257:	0f 88 c3 00 00 00    	js     320 <ls+0x220>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
     25d:	8b 8d e4 fd ff ff    	mov    -0x21c(%ebp),%ecx
     263:	0f bf 85 d4 fd ff ff 	movswl -0x22c(%ebp),%eax
     26a:	83 ec 0c             	sub    $0xc,%esp
     26d:	8b 95 dc fd ff ff    	mov    -0x224(%ebp),%edx
     273:	89 8d ac fd ff ff    	mov    %ecx,-0x254(%ebp)
     279:	8d 8d e8 fd ff ff    	lea    -0x218(%ebp),%ecx
     27f:	89 95 b0 fd ff ff    	mov    %edx,-0x250(%ebp)
     285:	89 85 b4 fd ff ff    	mov    %eax,-0x24c(%ebp)
     28b:	51                   	push   %ecx
     28c:	e8 cf fd ff ff       	call   60 <fmtname>
     291:	5a                   	pop    %edx
     292:	8b 95 b0 fd ff ff    	mov    -0x250(%ebp),%edx
     298:	59                   	pop    %ecx
     299:	8b 8d ac fd ff ff    	mov    -0x254(%ebp),%ecx
     29f:	51                   	push   %ecx
     2a0:	52                   	push   %edx
     2a1:	ff b5 b4 fd ff ff    	pushl  -0x24c(%ebp)
     2a7:	50                   	push   %eax
     2a8:	68 04 15 00 00       	push   $0x1504
     2ad:	6a 01                	push   $0x1
     2af:	e8 3c 04 00 00       	call   6f0 <printf>
     2b4:	83 c4 20             	add    $0x20,%esp
     2b7:	e9 44 ff ff ff       	jmp    200 <ls+0x100>
     2bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  struct dirent de;
  struct stat st;

  if((fd = open(path, 0)) < 0){
    printf(2, "ls: cannot open %s\n", path);
     2c0:	83 ec 04             	sub    $0x4,%esp
     2c3:	57                   	push   %edi
     2c4:	68 dc 14 00 00       	push   $0x14dc
     2c9:	6a 02                	push   $0x2
     2cb:	e8 20 04 00 00       	call   6f0 <printf>
    return;
     2d0:	83 c4 10             	add    $0x10,%esp
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
}
     2d3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     2d6:	5b                   	pop    %ebx
     2d7:	5e                   	pop    %esi
     2d8:	5f                   	pop    %edi
     2d9:	5d                   	pop    %ebp
     2da:	c3                   	ret    
     2db:	90                   	nop
     2dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
    break;

  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
      printf(1, "ls: path too long\n");
     2e0:	83 ec 08             	sub    $0x8,%esp
     2e3:	68 11 15 00 00       	push   $0x1511
     2e8:	6a 01                	push   $0x1
     2ea:	e8 01 04 00 00       	call   6f0 <printf>
      break;
     2ef:	83 c4 10             	add    $0x10,%esp
     2f2:	e9 92 fe ff ff       	jmp    189 <ls+0x89>
     2f7:	89 f6                	mov    %esi,%esi
     2f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    printf(2, "ls: cannot open %s\n", path);
    return;
  }

  if(fstat(fd, &st) < 0){
    printf(2, "ls: cannot stat %s\n", path);
     300:	83 ec 04             	sub    $0x4,%esp
     303:	57                   	push   %edi
     304:	68 f0 14 00 00       	push   $0x14f0
     309:	6a 02                	push   $0x2
     30b:	e8 e0 03 00 00       	call   6f0 <printf>
    close(fd);
     310:	89 1c 24             	mov    %ebx,(%esp)
     313:	e8 92 02 00 00       	call   5aa <close>
    return;
     318:	83 c4 10             	add    $0x10,%esp
     31b:	e9 75 fe ff ff       	jmp    195 <ls+0x95>
      if(de.inum == 0)
        continue;
      memmove(p, de.name, DIRSIZ);
      p[DIRSIZ] = 0;
      if(stat(buf, &st) < 0){
        printf(1, "ls: cannot stat %s\n", buf);
     320:	8d 85 e8 fd ff ff    	lea    -0x218(%ebp),%eax
     326:	83 ec 04             	sub    $0x4,%esp
     329:	50                   	push   %eax
     32a:	68 f0 14 00 00       	push   $0x14f0
     32f:	6a 01                	push   $0x1
     331:	e8 ba 03 00 00       	call   6f0 <printf>
        continue;
     336:	83 c4 10             	add    $0x10,%esp
     339:	e9 c2 fe ff ff       	jmp    200 <ls+0x100>
     33e:	66 90                	xchg   %ax,%ax

00000340 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     340:	55                   	push   %ebp
     341:	89 e5                	mov    %esp,%ebp
     343:	53                   	push   %ebx
     344:	8b 45 08             	mov    0x8(%ebp),%eax
     347:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     34a:	89 c2                	mov    %eax,%edx
     34c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     350:	83 c1 01             	add    $0x1,%ecx
     353:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     357:	83 c2 01             	add    $0x1,%edx
     35a:	84 db                	test   %bl,%bl
     35c:	88 5a ff             	mov    %bl,-0x1(%edx)
     35f:	75 ef                	jne    350 <strcpy+0x10>
    ;
  return os;
}
     361:	5b                   	pop    %ebx
     362:	5d                   	pop    %ebp
     363:	c3                   	ret    
     364:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     36a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000370 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     370:	55                   	push   %ebp
     371:	89 e5                	mov    %esp,%ebp
     373:	56                   	push   %esi
     374:	53                   	push   %ebx
     375:	8b 55 08             	mov    0x8(%ebp),%edx
     378:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     37b:	0f b6 02             	movzbl (%edx),%eax
     37e:	0f b6 19             	movzbl (%ecx),%ebx
     381:	84 c0                	test   %al,%al
     383:	75 1e                	jne    3a3 <strcmp+0x33>
     385:	eb 29                	jmp    3b0 <strcmp+0x40>
     387:	89 f6                	mov    %esi,%esi
     389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     390:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     393:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     396:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     399:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     39d:	84 c0                	test   %al,%al
     39f:	74 0f                	je     3b0 <strcmp+0x40>
     3a1:	89 f1                	mov    %esi,%ecx
     3a3:	38 d8                	cmp    %bl,%al
     3a5:	74 e9                	je     390 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3a7:	29 d8                	sub    %ebx,%eax
}
     3a9:	5b                   	pop    %ebx
     3aa:	5e                   	pop    %esi
     3ab:	5d                   	pop    %ebp
     3ac:	c3                   	ret    
     3ad:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     3b0:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     3b2:	29 d8                	sub    %ebx,%eax
}
     3b4:	5b                   	pop    %ebx
     3b5:	5e                   	pop    %esi
     3b6:	5d                   	pop    %ebp
     3b7:	c3                   	ret    
     3b8:	90                   	nop
     3b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003c0 <strlen>:

uint
strlen(char *s)
{
     3c0:	55                   	push   %ebp
     3c1:	89 e5                	mov    %esp,%ebp
     3c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     3c6:	80 39 00             	cmpb   $0x0,(%ecx)
     3c9:	74 12                	je     3dd <strlen+0x1d>
     3cb:	31 d2                	xor    %edx,%edx
     3cd:	8d 76 00             	lea    0x0(%esi),%esi
     3d0:	83 c2 01             	add    $0x1,%edx
     3d3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     3d7:	89 d0                	mov    %edx,%eax
     3d9:	75 f5                	jne    3d0 <strlen+0x10>
    ;
  return n;
}
     3db:	5d                   	pop    %ebp
     3dc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     3dd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     3df:	5d                   	pop    %ebp
     3e0:	c3                   	ret    
     3e1:	eb 0d                	jmp    3f0 <memset>
     3e3:	90                   	nop
     3e4:	90                   	nop
     3e5:	90                   	nop
     3e6:	90                   	nop
     3e7:	90                   	nop
     3e8:	90                   	nop
     3e9:	90                   	nop
     3ea:	90                   	nop
     3eb:	90                   	nop
     3ec:	90                   	nop
     3ed:	90                   	nop
     3ee:	90                   	nop
     3ef:	90                   	nop

000003f0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	57                   	push   %edi
     3f4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     3f7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     3fa:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fd:	89 d7                	mov    %edx,%edi
     3ff:	fc                   	cld    
     400:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     402:	89 d0                	mov    %edx,%eax
     404:	5f                   	pop    %edi
     405:	5d                   	pop    %ebp
     406:	c3                   	ret    
     407:	89 f6                	mov    %esi,%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <strchr>:

char*
strchr(const char *s, char c)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	8b 45 08             	mov    0x8(%ebp),%eax
     417:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     41a:	0f b6 10             	movzbl (%eax),%edx
     41d:	84 d2                	test   %dl,%dl
     41f:	74 1d                	je     43e <strchr+0x2e>
    if(*s == c)
     421:	38 d3                	cmp    %dl,%bl
     423:	89 d9                	mov    %ebx,%ecx
     425:	75 0d                	jne    434 <strchr+0x24>
     427:	eb 17                	jmp    440 <strchr+0x30>
     429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     430:	38 ca                	cmp    %cl,%dl
     432:	74 0c                	je     440 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     434:	83 c0 01             	add    $0x1,%eax
     437:	0f b6 10             	movzbl (%eax),%edx
     43a:	84 d2                	test   %dl,%dl
     43c:	75 f2                	jne    430 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     43e:	31 c0                	xor    %eax,%eax
}
     440:	5b                   	pop    %ebx
     441:	5d                   	pop    %ebp
     442:	c3                   	ret    
     443:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <gets>:

char*
gets(char *buf, int max)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	57                   	push   %edi
     454:	56                   	push   %esi
     455:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     456:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     458:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     45b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     45e:	eb 29                	jmp    489 <gets+0x39>
    cc = read(0, &c, 1);
     460:	83 ec 04             	sub    $0x4,%esp
     463:	6a 01                	push   $0x1
     465:	57                   	push   %edi
     466:	6a 00                	push   $0x0
     468:	e8 2d 01 00 00       	call   59a <read>
    if(cc < 1)
     46d:	83 c4 10             	add    $0x10,%esp
     470:	85 c0                	test   %eax,%eax
     472:	7e 1d                	jle    491 <gets+0x41>
      break;
    buf[i++] = c;
     474:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     478:	8b 55 08             	mov    0x8(%ebp),%edx
     47b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     47d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     47f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     483:	74 1b                	je     4a0 <gets+0x50>
     485:	3c 0d                	cmp    $0xd,%al
     487:	74 17                	je     4a0 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     489:	8d 5e 01             	lea    0x1(%esi),%ebx
     48c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     48f:	7c cf                	jl     460 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     491:	8b 45 08             	mov    0x8(%ebp),%eax
     494:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     498:	8d 65 f4             	lea    -0xc(%ebp),%esp
     49b:	5b                   	pop    %ebx
     49c:	5e                   	pop    %esi
     49d:	5f                   	pop    %edi
     49e:	5d                   	pop    %ebp
     49f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     4a0:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     4a3:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     4a5:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     4a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4ac:	5b                   	pop    %ebx
     4ad:	5e                   	pop    %esi
     4ae:	5f                   	pop    %edi
     4af:	5d                   	pop    %ebp
     4b0:	c3                   	ret    
     4b1:	eb 0d                	jmp    4c0 <stat>
     4b3:	90                   	nop
     4b4:	90                   	nop
     4b5:	90                   	nop
     4b6:	90                   	nop
     4b7:	90                   	nop
     4b8:	90                   	nop
     4b9:	90                   	nop
     4ba:	90                   	nop
     4bb:	90                   	nop
     4bc:	90                   	nop
     4bd:	90                   	nop
     4be:	90                   	nop
     4bf:	90                   	nop

000004c0 <stat>:

int
stat(char *n, struct stat *st)
{
     4c0:	55                   	push   %ebp
     4c1:	89 e5                	mov    %esp,%ebp
     4c3:	56                   	push   %esi
     4c4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4c5:	83 ec 08             	sub    $0x8,%esp
     4c8:	6a 00                	push   $0x0
     4ca:	ff 75 08             	pushl  0x8(%ebp)
     4cd:	e8 f0 00 00 00       	call   5c2 <open>
  if(fd < 0)
     4d2:	83 c4 10             	add    $0x10,%esp
     4d5:	85 c0                	test   %eax,%eax
     4d7:	78 27                	js     500 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     4d9:	83 ec 08             	sub    $0x8,%esp
     4dc:	ff 75 0c             	pushl  0xc(%ebp)
     4df:	89 c3                	mov    %eax,%ebx
     4e1:	50                   	push   %eax
     4e2:	e8 f3 00 00 00       	call   5da <fstat>
     4e7:	89 c6                	mov    %eax,%esi
  close(fd);
     4e9:	89 1c 24             	mov    %ebx,(%esp)
     4ec:	e8 b9 00 00 00       	call   5aa <close>
  return r;
     4f1:	83 c4 10             	add    $0x10,%esp
     4f4:	89 f0                	mov    %esi,%eax
}
     4f6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4f9:	5b                   	pop    %ebx
     4fa:	5e                   	pop    %esi
     4fb:	5d                   	pop    %ebp
     4fc:	c3                   	ret    
     4fd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     500:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     505:	eb ef                	jmp    4f6 <stat+0x36>
     507:	89 f6                	mov    %esi,%esi
     509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000510 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     510:	55                   	push   %ebp
     511:	89 e5                	mov    %esp,%ebp
     513:	53                   	push   %ebx
     514:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     517:	0f be 11             	movsbl (%ecx),%edx
     51a:	8d 42 d0             	lea    -0x30(%edx),%eax
     51d:	3c 09                	cmp    $0x9,%al
     51f:	b8 00 00 00 00       	mov    $0x0,%eax
     524:	77 1f                	ja     545 <atoi+0x35>
     526:	8d 76 00             	lea    0x0(%esi),%esi
     529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     530:	8d 04 80             	lea    (%eax,%eax,4),%eax
     533:	83 c1 01             	add    $0x1,%ecx
     536:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     53a:	0f be 11             	movsbl (%ecx),%edx
     53d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     540:	80 fb 09             	cmp    $0x9,%bl
     543:	76 eb                	jbe    530 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     545:	5b                   	pop    %ebx
     546:	5d                   	pop    %ebp
     547:	c3                   	ret    
     548:	90                   	nop
     549:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000550 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     550:	55                   	push   %ebp
     551:	89 e5                	mov    %esp,%ebp
     553:	56                   	push   %esi
     554:	53                   	push   %ebx
     555:	8b 5d 10             	mov    0x10(%ebp),%ebx
     558:	8b 45 08             	mov    0x8(%ebp),%eax
     55b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     55e:	85 db                	test   %ebx,%ebx
     560:	7e 14                	jle    576 <memmove+0x26>
     562:	31 d2                	xor    %edx,%edx
     564:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     568:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     56c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     56f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     572:	39 da                	cmp    %ebx,%edx
     574:	75 f2                	jne    568 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     576:	5b                   	pop    %ebx
     577:	5e                   	pop    %esi
     578:	5d                   	pop    %ebp
     579:	c3                   	ret    

0000057a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     57a:	b8 01 00 00 00       	mov    $0x1,%eax
     57f:	cd 40                	int    $0x40
     581:	c3                   	ret    

00000582 <exit>:
SYSCALL(exit)
     582:	b8 02 00 00 00       	mov    $0x2,%eax
     587:	cd 40                	int    $0x40
     589:	c3                   	ret    

0000058a <wait>:
SYSCALL(wait)
     58a:	b8 03 00 00 00       	mov    $0x3,%eax
     58f:	cd 40                	int    $0x40
     591:	c3                   	ret    

00000592 <pipe>:
SYSCALL(pipe)
     592:	b8 04 00 00 00       	mov    $0x4,%eax
     597:	cd 40                	int    $0x40
     599:	c3                   	ret    

0000059a <read>:
SYSCALL(read)
     59a:	b8 05 00 00 00       	mov    $0x5,%eax
     59f:	cd 40                	int    $0x40
     5a1:	c3                   	ret    

000005a2 <write>:
SYSCALL(write)
     5a2:	b8 10 00 00 00       	mov    $0x10,%eax
     5a7:	cd 40                	int    $0x40
     5a9:	c3                   	ret    

000005aa <close>:
SYSCALL(close)
     5aa:	b8 15 00 00 00       	mov    $0x15,%eax
     5af:	cd 40                	int    $0x40
     5b1:	c3                   	ret    

000005b2 <kill>:
SYSCALL(kill)
     5b2:	b8 06 00 00 00       	mov    $0x6,%eax
     5b7:	cd 40                	int    $0x40
     5b9:	c3                   	ret    

000005ba <exec>:
SYSCALL(exec)
     5ba:	b8 07 00 00 00       	mov    $0x7,%eax
     5bf:	cd 40                	int    $0x40
     5c1:	c3                   	ret    

000005c2 <open>:
SYSCALL(open)
     5c2:	b8 0f 00 00 00       	mov    $0xf,%eax
     5c7:	cd 40                	int    $0x40
     5c9:	c3                   	ret    

000005ca <mknod>:
SYSCALL(mknod)
     5ca:	b8 11 00 00 00       	mov    $0x11,%eax
     5cf:	cd 40                	int    $0x40
     5d1:	c3                   	ret    

000005d2 <unlink>:
SYSCALL(unlink)
     5d2:	b8 12 00 00 00       	mov    $0x12,%eax
     5d7:	cd 40                	int    $0x40
     5d9:	c3                   	ret    

000005da <fstat>:
SYSCALL(fstat)
     5da:	b8 08 00 00 00       	mov    $0x8,%eax
     5df:	cd 40                	int    $0x40
     5e1:	c3                   	ret    

000005e2 <link>:
SYSCALL(link)
     5e2:	b8 13 00 00 00       	mov    $0x13,%eax
     5e7:	cd 40                	int    $0x40
     5e9:	c3                   	ret    

000005ea <mkdir>:
SYSCALL(mkdir)
     5ea:	b8 14 00 00 00       	mov    $0x14,%eax
     5ef:	cd 40                	int    $0x40
     5f1:	c3                   	ret    

000005f2 <chdir>:
SYSCALL(chdir)
     5f2:	b8 09 00 00 00       	mov    $0x9,%eax
     5f7:	cd 40                	int    $0x40
     5f9:	c3                   	ret    

000005fa <dup>:
SYSCALL(dup)
     5fa:	b8 0a 00 00 00       	mov    $0xa,%eax
     5ff:	cd 40                	int    $0x40
     601:	c3                   	ret    

00000602 <getpid>:
SYSCALL(getpid)
     602:	b8 0b 00 00 00       	mov    $0xb,%eax
     607:	cd 40                	int    $0x40
     609:	c3                   	ret    

0000060a <sbrk>:
SYSCALL(sbrk)
     60a:	b8 0c 00 00 00       	mov    $0xc,%eax
     60f:	cd 40                	int    $0x40
     611:	c3                   	ret    

00000612 <sleep>:
SYSCALL(sleep)
     612:	b8 0d 00 00 00       	mov    $0xd,%eax
     617:	cd 40                	int    $0x40
     619:	c3                   	ret    

0000061a <uptime>:
SYSCALL(uptime)
     61a:	b8 0e 00 00 00       	mov    $0xe,%eax
     61f:	cd 40                	int    $0x40
     621:	c3                   	ret    

00000622 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     622:	b8 16 00 00 00       	mov    $0x16,%eax
     627:	cd 40                	int    $0x40
     629:	c3                   	ret    

0000062a <sigsend>:
SYSCALL(sigsend)
     62a:	b8 17 00 00 00       	mov    $0x17,%eax
     62f:	cd 40                	int    $0x40
     631:	c3                   	ret    

00000632 <sigreturn>:
SYSCALL(sigreturn)
     632:	b8 18 00 00 00       	mov    $0x18,%eax
     637:	cd 40                	int    $0x40
     639:	c3                   	ret    

0000063a <alarm>:
SYSCALL(alarm)
     63a:	b8 19 00 00 00       	mov    $0x19,%eax
     63f:	cd 40                	int    $0x40
     641:	c3                   	ret    
     642:	66 90                	xchg   %ax,%ax
     644:	66 90                	xchg   %ax,%ax
     646:	66 90                	xchg   %ax,%ax
     648:	66 90                	xchg   %ax,%ax
     64a:	66 90                	xchg   %ax,%ax
     64c:	66 90                	xchg   %ax,%ax
     64e:	66 90                	xchg   %ax,%ax

00000650 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	57                   	push   %edi
     654:	56                   	push   %esi
     655:	53                   	push   %ebx
     656:	89 c6                	mov    %eax,%esi
     658:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     65b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     65e:	85 db                	test   %ebx,%ebx
     660:	74 7e                	je     6e0 <printint+0x90>
     662:	89 d0                	mov    %edx,%eax
     664:	c1 e8 1f             	shr    $0x1f,%eax
     667:	84 c0                	test   %al,%al
     669:	74 75                	je     6e0 <printint+0x90>
    neg = 1;
    x = -xx;
     66b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     66d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     674:	f7 d8                	neg    %eax
     676:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     679:	31 ff                	xor    %edi,%edi
     67b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     67e:	89 ce                	mov    %ecx,%esi
     680:	eb 08                	jmp    68a <printint+0x3a>
     682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     688:	89 cf                	mov    %ecx,%edi
     68a:	31 d2                	xor    %edx,%edx
     68c:	8d 4f 01             	lea    0x1(%edi),%ecx
     68f:	f7 f6                	div    %esi
     691:	0f b6 92 30 15 00 00 	movzbl 0x1530(%edx),%edx
  }while((x /= base) != 0);
     698:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     69a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     69d:	75 e9                	jne    688 <printint+0x38>
  if(neg)
     69f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     6a2:	8b 75 c0             	mov    -0x40(%ebp),%esi
     6a5:	85 c0                	test   %eax,%eax
     6a7:	74 08                	je     6b1 <printint+0x61>
    buf[i++] = '-';
     6a9:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     6ae:	8d 4f 02             	lea    0x2(%edi),%ecx
     6b1:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     6b5:	8d 76 00             	lea    0x0(%esi),%esi
     6b8:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     6bb:	83 ec 04             	sub    $0x4,%esp
     6be:	83 ef 01             	sub    $0x1,%edi
     6c1:	6a 01                	push   $0x1
     6c3:	53                   	push   %ebx
     6c4:	56                   	push   %esi
     6c5:	88 45 d7             	mov    %al,-0x29(%ebp)
     6c8:	e8 d5 fe ff ff       	call   5a2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     6cd:	83 c4 10             	add    $0x10,%esp
     6d0:	39 df                	cmp    %ebx,%edi
     6d2:	75 e4                	jne    6b8 <printint+0x68>
    putc(fd, buf[i]);
}
     6d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6d7:	5b                   	pop    %ebx
     6d8:	5e                   	pop    %esi
     6d9:	5f                   	pop    %edi
     6da:	5d                   	pop    %ebp
     6db:	c3                   	ret    
     6dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     6e0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6e2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     6e9:	eb 8b                	jmp    676 <printint+0x26>
     6eb:	90                   	nop
     6ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006f0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6f6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6f9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6fc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6ff:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     702:	89 45 d0             	mov    %eax,-0x30(%ebp)
     705:	0f b6 1e             	movzbl (%esi),%ebx
     708:	83 c6 01             	add    $0x1,%esi
     70b:	84 db                	test   %bl,%bl
     70d:	0f 84 b0 00 00 00    	je     7c3 <printf+0xd3>
     713:	31 d2                	xor    %edx,%edx
     715:	eb 39                	jmp    750 <printf+0x60>
     717:	89 f6                	mov    %esi,%esi
     719:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     720:	83 f8 25             	cmp    $0x25,%eax
     723:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     726:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     72b:	74 18                	je     745 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     72d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     730:	83 ec 04             	sub    $0x4,%esp
     733:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     736:	6a 01                	push   $0x1
     738:	50                   	push   %eax
     739:	57                   	push   %edi
     73a:	e8 63 fe ff ff       	call   5a2 <write>
     73f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     742:	83 c4 10             	add    $0x10,%esp
     745:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     748:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     74c:	84 db                	test   %bl,%bl
     74e:	74 73                	je     7c3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     750:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     752:	0f be cb             	movsbl %bl,%ecx
     755:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     758:	74 c6                	je     720 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     75a:	83 fa 25             	cmp    $0x25,%edx
     75d:	75 e6                	jne    745 <printf+0x55>
      if(c == 'd'){
     75f:	83 f8 64             	cmp    $0x64,%eax
     762:	0f 84 f8 00 00 00    	je     860 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     768:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     76e:	83 f9 70             	cmp    $0x70,%ecx
     771:	74 5d                	je     7d0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     773:	83 f8 73             	cmp    $0x73,%eax
     776:	0f 84 84 00 00 00    	je     800 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     77c:	83 f8 63             	cmp    $0x63,%eax
     77f:	0f 84 ea 00 00 00    	je     86f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     785:	83 f8 25             	cmp    $0x25,%eax
     788:	0f 84 c2 00 00 00    	je     850 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     78e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     791:	83 ec 04             	sub    $0x4,%esp
     794:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     798:	6a 01                	push   $0x1
     79a:	50                   	push   %eax
     79b:	57                   	push   %edi
     79c:	e8 01 fe ff ff       	call   5a2 <write>
     7a1:	83 c4 0c             	add    $0xc,%esp
     7a4:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     7a7:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     7aa:	6a 01                	push   $0x1
     7ac:	50                   	push   %eax
     7ad:	57                   	push   %edi
     7ae:	83 c6 01             	add    $0x1,%esi
     7b1:	e8 ec fd ff ff       	call   5a2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7b6:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     7ba:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     7bd:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     7bf:	84 db                	test   %bl,%bl
     7c1:	75 8d                	jne    750 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7c3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7c6:	5b                   	pop    %ebx
     7c7:	5e                   	pop    %esi
     7c8:	5f                   	pop    %edi
     7c9:	5d                   	pop    %ebp
     7ca:	c3                   	ret    
     7cb:	90                   	nop
     7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     7d0:	83 ec 0c             	sub    $0xc,%esp
     7d3:	b9 10 00 00 00       	mov    $0x10,%ecx
     7d8:	6a 00                	push   $0x0
     7da:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     7dd:	89 f8                	mov    %edi,%eax
     7df:	8b 13                	mov    (%ebx),%edx
     7e1:	e8 6a fe ff ff       	call   650 <printint>
        ap++;
     7e6:	89 d8                	mov    %ebx,%eax
     7e8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     7eb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     7ed:	83 c0 04             	add    $0x4,%eax
     7f0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7f3:	e9 4d ff ff ff       	jmp    745 <printf+0x55>
     7f8:	90                   	nop
     7f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     800:	8b 45 d0             	mov    -0x30(%ebp),%eax
     803:	8b 18                	mov    (%eax),%ebx
        ap++;
     805:	83 c0 04             	add    $0x4,%eax
     808:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     80b:	b8 26 15 00 00       	mov    $0x1526,%eax
     810:	85 db                	test   %ebx,%ebx
     812:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     815:	0f b6 03             	movzbl (%ebx),%eax
     818:	84 c0                	test   %al,%al
     81a:	74 23                	je     83f <printf+0x14f>
     81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     820:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     823:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     826:	83 ec 04             	sub    $0x4,%esp
     829:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     82b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     82e:	50                   	push   %eax
     82f:	57                   	push   %edi
     830:	e8 6d fd ff ff       	call   5a2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     835:	0f b6 03             	movzbl (%ebx),%eax
     838:	83 c4 10             	add    $0x10,%esp
     83b:	84 c0                	test   %al,%al
     83d:	75 e1                	jne    820 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     83f:	31 d2                	xor    %edx,%edx
     841:	e9 ff fe ff ff       	jmp    745 <printf+0x55>
     846:	8d 76 00             	lea    0x0(%esi),%esi
     849:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     850:	83 ec 04             	sub    $0x4,%esp
     853:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     856:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     859:	6a 01                	push   $0x1
     85b:	e9 4c ff ff ff       	jmp    7ac <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     860:	83 ec 0c             	sub    $0xc,%esp
     863:	b9 0a 00 00 00       	mov    $0xa,%ecx
     868:	6a 01                	push   $0x1
     86a:	e9 6b ff ff ff       	jmp    7da <printf+0xea>
     86f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     872:	83 ec 04             	sub    $0x4,%esp
     875:	8b 03                	mov    (%ebx),%eax
     877:	6a 01                	push   $0x1
     879:	88 45 e4             	mov    %al,-0x1c(%ebp)
     87c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     87f:	50                   	push   %eax
     880:	57                   	push   %edi
     881:	e8 1c fd ff ff       	call   5a2 <write>
     886:	e9 5b ff ff ff       	jmp    7e6 <printf+0xf6>
     88b:	66 90                	xchg   %ax,%ax
     88d:	66 90                	xchg   %ax,%ax
     88f:	90                   	nop

00000890 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     890:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     891:	a1 10 1d 00 00       	mov    0x1d10,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     896:	89 e5                	mov    %esp,%ebp
     898:	57                   	push   %edi
     899:	56                   	push   %esi
     89a:	53                   	push   %ebx
     89b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     89e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     8a0:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8a3:	39 c8                	cmp    %ecx,%eax
     8a5:	73 19                	jae    8c0 <free+0x30>
     8a7:	89 f6                	mov    %esi,%esi
     8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     8b0:	39 d1                	cmp    %edx,%ecx
     8b2:	72 1c                	jb     8d0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8b4:	39 d0                	cmp    %edx,%eax
     8b6:	73 18                	jae    8d0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     8b8:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8ba:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8bc:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     8be:	72 f0                	jb     8b0 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8c0:	39 d0                	cmp    %edx,%eax
     8c2:	72 f4                	jb     8b8 <free+0x28>
     8c4:	39 d1                	cmp    %edx,%ecx
     8c6:	73 f0                	jae    8b8 <free+0x28>
     8c8:	90                   	nop
     8c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     8d0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     8d3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     8d6:	39 d7                	cmp    %edx,%edi
     8d8:	74 19                	je     8f3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     8da:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     8dd:	8b 50 04             	mov    0x4(%eax),%edx
     8e0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     8e3:	39 f1                	cmp    %esi,%ecx
     8e5:	74 23                	je     90a <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     8e7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     8e9:	a3 10 1d 00 00       	mov    %eax,0x1d10
}
     8ee:	5b                   	pop    %ebx
     8ef:	5e                   	pop    %esi
     8f0:	5f                   	pop    %edi
     8f1:	5d                   	pop    %ebp
     8f2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     8f3:	03 72 04             	add    0x4(%edx),%esi
     8f6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     8f9:	8b 10                	mov    (%eax),%edx
     8fb:	8b 12                	mov    (%edx),%edx
     8fd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     900:	8b 50 04             	mov    0x4(%eax),%edx
     903:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     906:	39 f1                	cmp    %esi,%ecx
     908:	75 dd                	jne    8e7 <free+0x57>
    p->s.size += bp->s.size;
     90a:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     90d:	a3 10 1d 00 00       	mov    %eax,0x1d10
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     912:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     915:	8b 53 f8             	mov    -0x8(%ebx),%edx
     918:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     91a:	5b                   	pop    %ebx
     91b:	5e                   	pop    %esi
     91c:	5f                   	pop    %edi
     91d:	5d                   	pop    %ebp
     91e:	c3                   	ret    
     91f:	90                   	nop

00000920 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     920:	55                   	push   %ebp
     921:	89 e5                	mov    %esp,%ebp
     923:	57                   	push   %edi
     924:	56                   	push   %esi
     925:	53                   	push   %ebx
     926:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     929:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     92c:	8b 15 10 1d 00 00    	mov    0x1d10,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     932:	8d 78 07             	lea    0x7(%eax),%edi
     935:	c1 ef 03             	shr    $0x3,%edi
     938:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     93b:	85 d2                	test   %edx,%edx
     93d:	0f 84 a3 00 00 00    	je     9e6 <malloc+0xc6>
     943:	8b 02                	mov    (%edx),%eax
     945:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     948:	39 cf                	cmp    %ecx,%edi
     94a:	76 74                	jbe    9c0 <malloc+0xa0>
     94c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     952:	be 00 10 00 00       	mov    $0x1000,%esi
     957:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     95e:	0f 43 f7             	cmovae %edi,%esi
     961:	ba 00 80 00 00       	mov    $0x8000,%edx
     966:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     96c:	0f 46 da             	cmovbe %edx,%ebx
     96f:	eb 10                	jmp    981 <malloc+0x61>
     971:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     978:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     97a:	8b 48 04             	mov    0x4(%eax),%ecx
     97d:	39 cf                	cmp    %ecx,%edi
     97f:	76 3f                	jbe    9c0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     981:	39 05 10 1d 00 00    	cmp    %eax,0x1d10
     987:	89 c2                	mov    %eax,%edx
     989:	75 ed                	jne    978 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     98b:	83 ec 0c             	sub    $0xc,%esp
     98e:	53                   	push   %ebx
     98f:	e8 76 fc ff ff       	call   60a <sbrk>
  if(p == (char*)-1)
     994:	83 c4 10             	add    $0x10,%esp
     997:	83 f8 ff             	cmp    $0xffffffff,%eax
     99a:	74 1c                	je     9b8 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     99c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     99f:	83 ec 0c             	sub    $0xc,%esp
     9a2:	83 c0 08             	add    $0x8,%eax
     9a5:	50                   	push   %eax
     9a6:	e8 e5 fe ff ff       	call   890 <free>
  return freep;
     9ab:	8b 15 10 1d 00 00    	mov    0x1d10,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     9b1:	83 c4 10             	add    $0x10,%esp
     9b4:	85 d2                	test   %edx,%edx
     9b6:	75 c0                	jne    978 <malloc+0x58>
        return 0;
     9b8:	31 c0                	xor    %eax,%eax
     9ba:	eb 1c                	jmp    9d8 <malloc+0xb8>
     9bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     9c0:	39 cf                	cmp    %ecx,%edi
     9c2:	74 1c                	je     9e0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     9c4:	29 f9                	sub    %edi,%ecx
     9c6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     9c9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     9cc:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     9cf:	89 15 10 1d 00 00    	mov    %edx,0x1d10
      return (void*)(p + 1);
     9d5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     9d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9db:	5b                   	pop    %ebx
     9dc:	5e                   	pop    %esi
     9dd:	5f                   	pop    %edi
     9de:	5d                   	pop    %ebp
     9df:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     9e0:	8b 08                	mov    (%eax),%ecx
     9e2:	89 0a                	mov    %ecx,(%edx)
     9e4:	eb e9                	jmp    9cf <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     9e6:	c7 05 10 1d 00 00 14 	movl   $0x1d14,0x1d10
     9ed:	1d 00 00 
     9f0:	c7 05 14 1d 00 00 14 	movl   $0x1d14,0x1d14
     9f7:	1d 00 00 
    base.s.size = 0;
     9fa:	b8 14 1d 00 00       	mov    $0x1d14,%eax
     9ff:	c7 05 18 1d 00 00 00 	movl   $0x0,0x1d18
     a06:	00 00 00 
     a09:	e9 3e ff ff ff       	jmp    94c <malloc+0x2c>
     a0e:	66 90                	xchg   %ax,%ax

00000a10 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     a10:	55                   	push   %ebp
     a11:	89 e5                	mov    %esp,%ebp
     a13:	56                   	push   %esi
     a14:	53                   	push   %ebx
     a15:	8b 75 0c             	mov    0xc(%ebp),%esi
     a18:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     a1b:	83 ec 08             	sub    $0x8,%esp
     a1e:	68 44 15 00 00       	push   $0x1544
     a23:	6a 01                	push   $0x1
     a25:	e8 c6 fc ff ff       	call   6f0 <printf>
  alarm(UTHREAD_QUANTA);
     a2a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     a31:	e8 04 fc ff ff       	call   63a <alarm>
  start_func(arg);
     a36:	89 75 08             	mov    %esi,0x8(%ebp)
     a39:	83 c4 10             	add    $0x10,%esp
}
     a3c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     a3f:	89 d8                	mov    %ebx,%eax
}
     a41:	5b                   	pop    %ebx
     a42:	5e                   	pop    %esi
     a43:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     a44:	ff e0                	jmp    *%eax
     a46:	8d 76 00             	lea    0x0(%esi),%esi
     a49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a50 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     a50:	55                   	push   %ebp
     a51:	89 e5                	mov    %esp,%ebp
     a53:	53                   	push   %ebx
     a54:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     a57:	6a 00                	push   $0x0
     a59:	e8 dc fb ff ff       	call   63a <alarm>
  printf(1,"exiting...\n");
     a5e:	5a                   	pop    %edx
     a5f:	59                   	pop    %ecx
     a60:	68 b4 16 00 00       	push   $0x16b4
     a65:	6a 01                	push   $0x1
     a67:	e8 84 fc ff ff       	call   6f0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     a6c:	a1 48 ac 00 00       	mov    0xac48,%eax
     a71:	83 c4 10             	add    $0x10,%esp
     a74:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     a77:	8b 1c 95 20 1d 00 00 	mov    0x1d20(,%edx,4),%ebx
     a7e:	85 db                	test   %ebx,%ebx
     a80:	75 0a                	jne    a8c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     a82:	c7 05 28 1d 00 00 00 	movl   $0x0,0x1d28
     a89:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     a8c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     a8f:	83 ec 0c             	sub    $0xc,%esp
     a92:	ff 34 85 24 1d 00 00 	pushl  0x1d24(,%eax,4)
     a99:	e8 f2 fd ff ff       	call   890 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     a9e:	a1 48 ac 00 00       	mov    0xac48,%eax
     aa3:	83 c4 10             	add    $0x10,%esp
     aa6:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     aa9:	b8 28 1d 00 00       	mov    $0x1d28,%eax
     aae:	c1 e2 02             	shl    $0x2,%edx
     ab1:	c7 82 28 1d 00 00 00 	movl   $0x0,0x1d28(%edx)
     ab8:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     abb:	c7 82 20 1d 00 00 ff 	movl   $0xffffffff,0x1d20(%edx)
     ac2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     ac5:	c7 82 2c 1d 00 00 00 	movl   $0x0,0x1d2c(%edx)
     acc:	00 00 00 
  threads[index_currently_running].esp = 0;
     acf:	c7 82 30 1d 00 00 00 	movl   $0x0,0x1d30(%edx)
     ad6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     ad9:	c7 82 3c 1d 00 00 00 	movl   $0x0,0x1d3c(%edx)
     ae0:	00 00 00 
  threads[index_currently_running].join = -1;
     ae3:	c7 82 40 1d 00 00 ff 	movl   $0xffffffff,0x1d40(%edx)
     aea:	ff ff ff 
     aed:	eb 0b                	jmp    afa <uthread_exit+0xaa>
     aef:	90                   	nop
     af0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     af3:	3d 28 26 00 00       	cmp    $0x2628,%eax
     af8:	74 15                	je     b0f <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     afa:	83 38 04             	cmpl   $0x4,(%eax)
     afd:	75 f1                	jne    af0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     aff:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     b05:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     b08:	3d 28 26 00 00       	cmp    $0x2628,%eax
     b0d:	75 eb                	jne    afa <uthread_exit+0xaa>
     b0f:	bb 4c 1d 00 00       	mov    $0x1d4c,%ebx
     b14:	eb 15                	jmp    b2b <uthread_exit+0xdb>
     b16:	8d 76 00             	lea    0x0(%esi),%esi
     b19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     b20:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     b23:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
     b29:	74 24                	je     b4f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     b2b:	8b 03                	mov    (%ebx),%eax
     b2d:	85 c0                	test   %eax,%eax
     b2f:	74 ef                	je     b20 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     b31:	e8 cc fa ff ff       	call   602 <getpid>
     b36:	83 ec 08             	sub    $0x8,%esp
     b39:	83 c3 24             	add    $0x24,%ebx
     b3c:	6a 0e                	push   $0xe
     b3e:	50                   	push   %eax
     b3f:	e8 e6 fa ff ff       	call   62a <sigsend>
     b44:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     b47:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
     b4d:	75 dc                	jne    b2b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     b4f:	e8 2e fa ff ff       	call   582 <exit>
     b54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b60 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     b60:	55                   	push   %ebp
     b61:	ba 48 27 00 00       	mov    $0x2748,%edx
     b66:	89 e5                	mov    %esp,%ebp
     b68:	90                   	nop
     b69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b70:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     b76:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     b80:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     b86:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     b89:	39 d0                	cmp    %edx,%eax
     b8b:	75 f3                	jne    b80 <init_bsem+0x20>
     b8d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     b93:	81 fa 48 ad 00 00    	cmp    $0xad48,%edx
     b99:	75 d5                	jne    b70 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     b9b:	c7 05 1c 1d 00 00 01 	movl   $0x1,0x1d1c
     ba2:	00 00 00 
}
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
     ba7:	89 f6                	mov    %esi,%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <bsem_alloc>:

int bsem_alloc() {
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	53                   	push   %ebx
     bb4:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     bb7:	6a 00                	push   $0x0
     bb9:	e8 7c fa ff ff       	call   63a <alarm>
  int i;
  if(first_run_bsem == 0)
     bbe:	a1 1c 1d 00 00       	mov    0x1d1c,%eax
     bc3:	83 c4 10             	add    $0x10,%esp
     bc6:	85 c0                	test   %eax,%eax
     bc8:	75 3b                	jne    c05 <bsem_alloc+0x55>
     bca:	ba 48 27 00 00       	mov    $0x2748,%edx
     bcf:	90                   	nop
     bd0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     bd6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     bdc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     be0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     be6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     be9:	39 d0                	cmp    %edx,%eax
     beb:	75 f3                	jne    be0 <bsem_alloc+0x30>
     bed:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     bf3:	81 fa 48 ad 00 00    	cmp    $0xad48,%edx
     bf9:	75 d5                	jne    bd0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     bfb:	c7 05 1c 1d 00 00 01 	movl   $0x1,0x1d1c
     c02:	00 00 00 
     c05:	ba 48 27 00 00       	mov    $0x2748,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     c0a:	31 c0                	xor    %eax,%eax
     c0c:	eb 10                	jmp    c1e <bsem_alloc+0x6e>
     c0e:	83 c0 01             	add    $0x1,%eax
     c11:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     c17:	3d 80 00 00 00       	cmp    $0x80,%eax
     c1c:	74 4f                	je     c6d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     c1e:	83 3a 01             	cmpl   $0x1,(%edx)
     c21:	75 eb                	jne    c0e <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     c23:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c29:	8b 15 fc 1c 00 00    	mov    0x1cfc,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     c2f:	83 ec 0c             	sub    $0xc,%esp
     c32:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     c34:	8d 98 40 26 00 00    	lea    0x2640(%eax),%ebx
     c3a:	89 90 44 26 00 00    	mov    %edx,0x2644(%eax)
    binSemCounter++;
     c40:	83 c2 01             	add    $0x1,%edx
     c43:	89 15 fc 1c 00 00    	mov    %edx,0x1cfc
    binSemaphore[i].lock = 1; // not locked
     c49:	c7 80 40 26 00 00 01 	movl   $0x1,0x2640(%eax)
     c50:	00 00 00 
    binSemaphore[i].state = USED;
     c53:	c7 80 48 27 00 00 00 	movl   $0x0,0x2748(%eax)
     c5a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     c5d:	e8 d8 f9 ff ff       	call   63a <alarm>
    return binSemaphore[i].id;
     c62:	8b 43 04             	mov    0x4(%ebx),%eax
     c65:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     c68:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c6b:	c9                   	leave  
     c6c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     c6d:	83 ec 08             	sub    $0x8,%esp
     c70:	68 64 15 00 00       	push   $0x1564
     c75:	6a 01                	push   $0x1
     c77:	e8 74 fa ff ff       	call   6f0 <printf>
    alarm(UTHREAD_QUANTA);
     c7c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     c83:	e8 b2 f9 ff ff       	call   63a <alarm>
    return -1;
     c88:	83 c4 10             	add    $0x10,%esp
     c8b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     c90:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c93:	c9                   	leave  
     c94:	c3                   	ret    
     c95:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ca0 <bsem_free>:

void bsem_free(int id) {
     ca0:	55                   	push   %ebp
     ca1:	89 e5                	mov    %esp,%ebp
     ca3:	53                   	push   %ebx
     ca4:	83 ec 10             	sub    $0x10,%esp
     ca7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     caa:	6a 00                	push   $0x0
     cac:	e8 89 f9 ff ff       	call   63a <alarm>
     cb1:	ba 44 26 00 00       	mov    $0x2644,%edx
     cb6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     cb9:	31 c0                	xor    %eax,%eax
     cbb:	eb 13                	jmp    cd0 <bsem_free+0x30>
     cbd:	8d 76 00             	lea    0x0(%esi),%esi
     cc0:	83 c0 01             	add    $0x1,%eax
     cc3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     cc9:	3d 80 00 00 00       	cmp    $0x80,%eax
     cce:	74 38                	je     d08 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     cd0:	39 1a                	cmp    %ebx,(%edx)
     cd2:	75 ec                	jne    cc0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     cd4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     cda:	05 40 26 00 00       	add    $0x2640,%eax
     cdf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     ce6:	74 0a                	je     cf2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     ce8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     cef:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     cf2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     cf9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cfc:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     cfd:	e9 38 f9 ff ff       	jmp    63a <alarm>
     d02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     d08:	83 ec 04             	sub    $0x4,%esp
     d0b:	53                   	push   %ebx
     d0c:	68 c0 16 00 00       	push   $0x16c0
     d11:	6a 01                	push   $0x1
     d13:	e8 d8 f9 ff ff       	call   6f0 <printf>
     d18:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     d1b:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     d22:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d25:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     d26:	e9 0f f9 ff ff       	jmp    63a <alarm>
     d2b:	90                   	nop
     d2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d30 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     d30:	55                   	push   %ebp
     d31:	89 e5                	mov    %esp,%ebp
     d33:	53                   	push   %ebx
     d34:	83 ec 10             	sub    $0x10,%esp
     d37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     d3a:	6a 00                	push   $0x0
     d3c:	e8 f9 f8 ff ff       	call   63a <alarm>
     d41:	b8 44 26 00 00       	mov    $0x2644,%eax
     d46:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     d49:	31 d2                	xor    %edx,%edx
     d4b:	eb 17                	jmp    d64 <bsem_down+0x34>
     d4d:	8d 76 00             	lea    0x0(%esi),%esi
     d50:	83 c2 01             	add    $0x1,%edx
     d53:	05 0c 01 00 00       	add    $0x10c,%eax
     d58:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     d5e:	0f 84 8c 00 00 00    	je     df0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     d64:	39 18                	cmp    %ebx,(%eax)
     d66:	75 e8                	jne    d50 <bsem_down+0x20>
     d68:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     d6e:	85 c9                	test   %ecx,%ecx
     d70:	75 de                	jne    d50 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     d72:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     d78:	31 c0                	xor    %eax,%eax
     d7a:	83 b9 40 26 00 00 01 	cmpl   $0x1,0x2640(%ecx)
     d81:	75 15                	jne    d98 <bsem_down+0x68>
     d83:	e9 93 00 00 00       	jmp    e1b <bsem_down+0xeb>
     d88:	90                   	nop
     d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     d90:	83 c0 01             	add    $0x1,%eax
     d93:	83 f8 40             	cmp    $0x40,%eax
     d96:	74 7b                	je     e13 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     d98:	83 bc 81 48 26 00 00 	cmpl   $0xffffffff,0x2648(%ecx,%eax,4)
     d9f:	ff 
     da0:	75 ee                	jne    d90 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     da2:	8b 0d 48 ac 00 00    	mov    0xac48,%ecx
     da8:	6b d2 43             	imul   $0x43,%edx,%edx
     dab:	01 c2                	add    %eax,%edx
     dad:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     db0:	8b 04 85 20 1d 00 00 	mov    0x1d20(,%eax,4),%eax
     db7:	89 04 95 48 26 00 00 	mov    %eax,0x2648(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     dbe:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     dc1:	c7 04 85 28 1d 00 00 	movl   $0x4,0x1d28(,%eax,4)
     dc8:	04 00 00 00 

	 sigsend(getpid(),14);
     dcc:	e8 31 f8 ff ff       	call   602 <getpid>
     dd1:	83 ec 08             	sub    $0x8,%esp
     dd4:	6a 0e                	push   $0xe
     dd6:	50                   	push   %eax
     dd7:	e8 4e f8 ff ff       	call   62a <sigsend>
     ddc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     ddf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     de6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     de9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     dea:	e9 4b f8 ff ff       	jmp    63a <alarm>
     def:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     df0:	83 ec 04             	sub    $0x4,%esp
     df3:	53                   	push   %ebx
     df4:	68 84 15 00 00       	push   $0x1584
     df9:	6a 01                	push   $0x1
     dfb:	e8 f0 f8 ff ff       	call   6f0 <printf>
     e00:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     e03:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     e0a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e0d:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     e0e:	e9 27 f8 ff ff       	jmp    63a <alarm>
     e13:	8b 0d 48 ac 00 00    	mov    0xac48,%ecx
     e19:	eb a3                	jmp    dbe <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     e1b:	c7 81 40 26 00 00 00 	movl   $0x0,0x2640(%ecx)
     e22:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     e25:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     e2c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e2f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     e30:	e9 05 f8 ff ff       	jmp    63a <alarm>
     e35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e40 <bsem_up>:
}

void bsem_up(int id) {
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	57                   	push   %edi
     e44:	56                   	push   %esi
     e45:	53                   	push   %ebx
     e46:	83 ec 28             	sub    $0x28,%esp
     e49:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     e4c:	6a 00                	push   $0x0
     e4e:	e8 e7 f7 ff ff       	call   63a <alarm>
     e53:	ba 44 26 00 00       	mov    $0x2644,%edx
     e58:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     e5b:	31 c0                	xor    %eax,%eax
     e5d:	eb 15                	jmp    e74 <bsem_up+0x34>
     e5f:	90                   	nop
     e60:	83 c0 01             	add    $0x1,%eax
     e63:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     e69:	3d 80 00 00 00       	cmp    $0x80,%eax
     e6e:	0f 84 ac 00 00 00    	je     f20 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     e74:	39 1a                	cmp    %ebx,(%edx)
     e76:	75 e8                	jne    e60 <bsem_up+0x20>
     e78:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     e7e:	85 c9                	test   %ecx,%ecx
     e80:	75 de                	jne    e60 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     e82:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     e88:	8b 97 40 26 00 00    	mov    0x2640(%edi),%edx
     e8e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e91:	85 d2                	test   %edx,%edx
     e93:	0f 85 9c 00 00 00    	jne    f35 <bsem_up+0xf5>
     e99:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     e9b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     e9e:	8b b4 be 48 26 00 00 	mov    0x2648(%esi,%edi,4),%esi
     ea5:	83 fe ff             	cmp    $0xffffffff,%esi
     ea8:	74 56                	je     f00 <bsem_up+0xc0>
     eaa:	b9 20 1d 00 00       	mov    $0x1d20,%ecx
     eaf:	31 d2                	xor    %edx,%edx
     eb1:	eb 10                	jmp    ec3 <bsem_up+0x83>
     eb3:	90                   	nop
     eb4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     eb8:	83 c2 01             	add    $0x1,%edx
     ebb:	83 c1 24             	add    $0x24,%ecx
     ebe:	83 fa 40             	cmp    $0x40,%edx
     ec1:	74 3d                	je     f00 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     ec3:	8b 19                	mov    (%ecx),%ebx
     ec5:	39 de                	cmp    %ebx,%esi
     ec7:	75 ef                	jne    eb8 <bsem_up+0x78>
     ec9:	83 fb ff             	cmp    $0xffffffff,%ebx
     ecc:	74 ea                	je     eb8 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     ece:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     ed1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     ed4:	c7 04 95 28 1d 00 00 	movl   $0x2,0x1d28(,%edx,4)
     edb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     edf:	01 c7                	add    %eax,%edi
     ee1:	c7 04 bd 48 26 00 00 	movl   $0xffffffff,0x2648(,%edi,4)
     ee8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     eec:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     ef3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ef6:	5b                   	pop    %ebx
     ef7:	5e                   	pop    %esi
     ef8:	5f                   	pop    %edi
     ef9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     efa:	e9 3b f7 ff ff       	jmp    63a <alarm>
     eff:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     f00:	83 c7 01             	add    $0x1,%edi
     f03:	83 ff 40             	cmp    $0x40,%edi
     f06:	75 93                	jne    e9b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     f08:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     f0e:	c7 80 40 26 00 00 01 	movl   $0x1,0x2640(%eax)
     f15:	00 00 00 
     f18:	eb d2                	jmp    eec <bsem_up+0xac>
     f1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     f20:	83 ec 04             	sub    $0x4,%esp
     f23:	53                   	push   %ebx
     f24:	68 ec 15 00 00       	push   $0x15ec
     f29:	6a 01                	push   $0x1
     f2b:	e8 c0 f7 ff ff       	call   6f0 <printf>
     f30:	83 c4 10             	add    $0x10,%esp
     f33:	eb b7                	jmp    eec <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     f35:	83 ec 08             	sub    $0x8,%esp
     f38:	68 c8 15 00 00       	push   $0x15c8
     f3d:	6a 01                	push   $0x1
     f3f:	e8 ac f7 ff ff       	call   6f0 <printf>
     f44:	83 c4 10             	add    $0x10,%esp
     f47:	eb a3                	jmp    eec <bsem_up+0xac>
     f49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f50 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     f50:	55                   	push   %ebp
     f51:	89 e5                	mov    %esp,%ebp
     f53:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     f56:	68 30 16 00 00       	push   $0x1630
     f5b:	6a 01                	push   $0x1
     f5d:	e8 8e f7 ff ff       	call   6f0 <printf>
     f62:	b8 20 1d 00 00       	mov    $0x1d20,%eax
     f67:	83 c4 10             	add    $0x10,%esp
     f6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     f70:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     f76:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     f7d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     f80:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     f87:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     f8e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     f95:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     f9c:	3d 20 26 00 00       	cmp    $0x2620,%eax
     fa1:	75 cd                	jne    f70 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     fa3:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     fa6:	c7 05 20 1d 00 00 00 	movl   $0x0,0x1d20
     fad:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     fb0:	c7 05 28 1d 00 00 03 	movl   $0x3,0x1d28
     fb7:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     fba:	68 50 11 00 00       	push   $0x1150
     fbf:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     fc1:	c7 05 24 1d 00 00 00 	movl   $0x0,0x1d24
     fc8:	00 00 00 

  id_number_thread = 1;
     fcb:	c7 05 44 ac 00 00 01 	movl   $0x1,0xac44
     fd2:	00 00 00 
  index_currently_running = 0;
     fd5:	c7 05 48 ac 00 00 00 	movl   $0x0,0xac48
     fdc:	00 00 00 
  currently_running = 0;
     fdf:	c7 05 20 26 00 00 00 	movl   $0x0,0x2620
     fe6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     fe9:	e8 34 f6 ff ff       	call   622 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     fee:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     ff5:	e8 40 f6 ff ff       	call   63a <alarm>
  return 0;
}
     ffa:	31 c0                	xor    %eax,%eax
     ffc:	c9                   	leave  
     ffd:	c3                   	ret    
     ffe:	66 90                	xchg   %ax,%ax

00001000 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
    1000:	55                   	push   %ebp
    1001:	89 e5                	mov    %esp,%ebp
    1003:	56                   	push   %esi
    1004:	53                   	push   %ebx
  alarm(0);
    1005:	83 ec 0c             	sub    $0xc,%esp
    1008:	6a 00                	push   $0x0
    100a:	e8 2b f6 ff ff       	call   63a <alarm>
  printf(1, "------ creating a new thread ------\n");
    100f:	5b                   	pop    %ebx
    1010:	5e                   	pop    %esi
    1011:	68 5c 16 00 00       	push   $0x165c
    1016:	6a 01                	push   $0x1
    1018:	e8 d3 f6 ff ff       	call   6f0 <printf>
    101d:	ba 28 1d 00 00       	mov    $0x1d28,%edx
    1022:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
    1025:	31 c0                	xor    %eax,%eax
    1027:	eb 12                	jmp    103b <uthread_create+0x3b>
    1029:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1030:	83 c0 01             	add    $0x1,%eax
    1033:	83 c2 24             	add    $0x24,%edx
    1036:	83 f8 40             	cmp    $0x40,%eax
    1039:	74 7d                	je     10b8 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
    103b:	8b 0a                	mov    (%edx),%ecx
    103d:	85 c9                	test   %ecx,%ecx
    103f:	75 ef                	jne    1030 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    1041:	8b 15 44 ac 00 00    	mov    0xac44,%edx
    1047:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    104a:	83 ec 0c             	sub    $0xc,%esp
    104d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    1052:	c1 e3 02             	shl    $0x2,%ebx
    1055:	89 93 20 1d 00 00    	mov    %edx,0x1d20(%ebx)
  id_number_thread++;
    105b:	83 c2 01             	add    $0x1,%edx
    105e:	89 15 44 ac 00 00    	mov    %edx,0xac44

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1064:	e8 b7 f8 ff ff       	call   920 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1069:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
    106c:	c7 80 f4 0f 00 00 50 	movl   $0xa50,0xff4(%eax)
    1073:	0a 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1076:	89 83 24 1d 00 00    	mov    %eax,0x1d24(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
    107c:	c7 83 28 1d 00 00 02 	movl   $0x2,0x1d28(%ebx)
    1083:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1086:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
    108c:	8b 55 0c             	mov    0xc(%ebp),%edx
    108f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
    1095:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    109c:	e8 99 f5 ff ff       	call   63a <alarm>
  return   threads[free_thread].thread_id;
    10a1:	8b 83 20 1d 00 00    	mov    0x1d20(%ebx),%eax
    10a7:	83 c4 10             	add    $0x10,%esp
}
    10aa:	8d 65 f8             	lea    -0x8(%ebp),%esp
    10ad:	5b                   	pop    %ebx
    10ae:	5e                   	pop    %esi
    10af:	5d                   	pop    %ebp
    10b0:	c3                   	ret    
    10b1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    10b8:	83 ec 08             	sub    $0x8,%esp
    10bb:	68 d2 16 00 00       	push   $0x16d2
    10c0:	6a 01                	push   $0x1
    10c2:	e8 29 f6 ff ff       	call   6f0 <printf>
    alarm(UTHREAD_QUANTA);
    10c7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    10ce:	e8 67 f5 ff ff       	call   63a <alarm>
    return -1;
    10d3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    10d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
    10d9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    10de:	5b                   	pop    %ebx
    10df:	5e                   	pop    %esi
    10e0:	5d                   	pop    %ebp
    10e1:	c3                   	ret    
    10e2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010f0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
    10f0:	55                   	push   %ebp
    10f1:	89 e5                	mov    %esp,%ebp
    10f3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
    10f6:	85 c0                	test   %eax,%eax
    10f8:	74 14                	je     110e <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    10fa:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10fd:	89 e2                	mov    %esp,%edx
    10ff:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
    1106:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
    1109:	89 ea                	mov    %ebp,%edx
    110b:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    110e:	a1 48 ac 00 00       	mov    0xac48,%eax
    1113:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1116:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    111d:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    1120:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    1127:	85 d2                	test   %edx,%edx
    1129:	74 0d                	je     1138 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    112b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
    112d:	8b 40 0c             	mov    0xc(%eax),%eax
    1130:	89 c5                	mov    %eax,%ebp
  }
  return;
}
    1132:	5d                   	pop    %ebp
    1133:	c3                   	ret    
    1134:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    1138:	8b 40 04             	mov    0x4(%eax),%eax
    113b:	05 f4 0f 00 00       	add    $0xff4,%eax
    1140:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    1142:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
    1144:	b8 10 0a 00 00       	mov    $0xa10,%eax
    1149:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
    114b:	5d                   	pop    %ebp
    114c:	c3                   	ret    
    114d:	8d 76 00             	lea    0x0(%esi),%esi

00001150 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	56                   	push   %esi
    1154:	53                   	push   %ebx
    1155:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
    1158:	83 ec 0c             	sub    $0xc,%esp
    115b:	6a 00                	push   $0x0
    115d:	e8 d8 f4 ff ff       	call   63a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    1162:	a1 48 ac 00 00       	mov    0xac48,%eax
    1167:	83 c4 10             	add    $0x10,%esp
    116a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    116d:	8d 14 95 20 1d 00 00 	lea    0x1d20(,%edx,4),%edx
    1174:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
    1178:	75 0b                	jne    1185 <uthread_schedule+0x35>
    117a:	85 c0                	test   %eax,%eax
    117c:	74 07                	je     1185 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
    117e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
    1185:	bb 28 1d 00 00       	mov    $0x1d28,%ebx
    118a:	eb 0f                	jmp    119b <uthread_schedule+0x4b>
    118c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1190:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1193:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
    1199:	74 55                	je     11f0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    119b:	83 3b 01             	cmpl   $0x1,(%ebx)
    119e:	75 f0                	jne    1190 <uthread_schedule+0x40>
    11a0:	8b 73 14             	mov    0x14(%ebx),%esi
    11a3:	85 f6                	test   %esi,%esi
    11a5:	0f 85 a5 00 00 00    	jne    1250 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    11ab:	8b 43 18             	mov    0x18(%ebx),%eax
    11ae:	83 f8 ff             	cmp    $0xffffffff,%eax
    11b1:	74 dd                	je     1190 <uthread_schedule+0x40>
    11b3:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    11b6:	8b 14 95 28 1d 00 00 	mov    0x1d28(,%edx,4),%edx
    11bd:	85 d2                	test   %edx,%edx
    11bf:	75 cf                	jne    1190 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
    11c1:	50                   	push   %eax
    11c2:	ff 73 f8             	pushl  -0x8(%ebx)
    11c5:	83 c3 24             	add    $0x24,%ebx
    11c8:	68 84 16 00 00       	push   $0x1684
    11cd:	6a 01                	push   $0x1
    11cf:	e8 1c f5 ff ff       	call   6f0 <printf>
      threads[i].join = -1;
    11d4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
    11db:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
    11e2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    11e5:	81 fb 28 26 00 00    	cmp    $0x2628,%ebx
    11eb:	75 ae                	jne    119b <uthread_schedule+0x4b>
    11ed:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    11f0:	8b 15 48 ac 00 00    	mov    0xac48,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    11f6:	b9 40 00 00 00       	mov    $0x40,%ecx
    11fb:	8d 42 01             	lea    0x1(%edx),%eax
    11fe:	eb 08                	jmp    1208 <uthread_schedule+0xb8>
    1200:	83 c0 01             	add    $0x1,%eax
    1203:	83 e9 01             	sub    $0x1,%ecx
    1206:	74 78                	je     1280 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    1208:	89 c3                	mov    %eax,%ebx
    120a:	c1 fb 1f             	sar    $0x1f,%ebx
    120d:	c1 eb 1a             	shr    $0x1a,%ebx
    1210:	01 d8                	add    %ebx,%eax
    1212:	83 e0 3f             	and    $0x3f,%eax
    1215:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    1217:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    121a:	83 3c 9d 28 1d 00 00 	cmpl   $0x2,0x1d28(,%ebx,4)
    1221:	02 
    1222:	75 dc                	jne    1200 <uthread_schedule+0xb0>
    1224:	39 c2                	cmp    %eax,%edx
    1226:	74 d8                	je     1200 <uthread_schedule+0xb0>
      index_currently_running = i;
    1228:	a3 48 ac 00 00       	mov    %eax,0xac48
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    122d:	83 ec 08             	sub    $0x8,%esp
    1230:	50                   	push   %eax
    1231:	52                   	push   %edx
    1232:	e8 b9 fe ff ff       	call   10f0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    1237:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    123e:	e8 f7 f3 ff ff       	call   63a <alarm>
}
    1243:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1246:	5b                   	pop    %ebx
    1247:	5e                   	pop    %esi
    1248:	5d                   	pop    %ebp
    1249:	c3                   	ret    
    124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1250:	e8 c5 f3 ff ff       	call   61a <uptime>
    1255:	39 c6                	cmp    %eax,%esi
    1257:	7f 17                	jg     1270 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1259:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    125f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1266:	e9 25 ff ff ff       	jmp    1190 <uthread_schedule+0x40>
    126b:	90                   	nop
    126c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1270:	83 3b 01             	cmpl   $0x1,(%ebx)
    1273:	0f 84 32 ff ff ff    	je     11ab <uthread_schedule+0x5b>
    1279:	e9 12 ff ff ff       	jmp    1190 <uthread_schedule+0x40>
    127e:	66 90                	xchg   %ax,%ax
    1280:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1283:	83 3c 85 28 1d 00 00 	cmpl   $0x2,0x1d28(,%eax,4)
    128a:	02 
    128b:	0f 85 c7 fe ff ff    	jne    1158 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1291:	89 d0                	mov    %edx,%eax
    1293:	eb 98                	jmp    122d <uthread_schedule+0xdd>
    1295:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000012a0 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    12a0:	a1 48 ac 00 00       	mov    0xac48,%eax
  exit();
}

int
uthread_self()
{
    12a5:	55                   	push   %ebp
    12a6:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    12a8:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    12ab:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    12ac:	8b 04 85 20 1d 00 00 	mov    0x1d20(,%eax,4),%eax
}
    12b3:	c3                   	ret    
    12b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000012c0 <uthread_join>:

int
uthread_join(int tid)
{
    12c0:	55                   	push   %ebp
    12c1:	89 e5                	mov    %esp,%ebp
    12c3:	56                   	push   %esi
    12c4:	53                   	push   %ebx
    12c5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    12c8:	39 35 44 ac 00 00    	cmp    %esi,0xac44
    12ce:	0f 8c ab 00 00 00    	jl     137f <uthread_join+0xbf>
    12d4:	89 f0                	mov    %esi,%eax
    12d6:	c1 e8 1f             	shr    $0x1f,%eax
    12d9:	84 c0                	test   %al,%al
    12db:	0f 85 9e 00 00 00    	jne    137f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    12e1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    12e4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    12e6:	6a 00                	push   $0x0
    12e8:	e8 4d f3 ff ff       	call   63a <alarm>
    12ed:	b8 20 1d 00 00       	mov    $0x1d20,%eax
    12f2:	83 c4 10             	add    $0x10,%esp
    12f5:	eb 14                	jmp    130b <uthread_join+0x4b>
    12f7:	89 f6                	mov    %esi,%esi
    12f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1300:	83 c3 01             	add    $0x1,%ebx
    1303:	83 c0 24             	add    $0x24,%eax
    1306:	83 fb 40             	cmp    $0x40,%ebx
    1309:	74 55                	je     1360 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    130b:	3b 30                	cmp    (%eax),%esi
    130d:	75 f1                	jne    1300 <uthread_join+0x40>
    130f:	8b 50 08             	mov    0x8(%eax),%edx
    1312:	85 d2                	test   %edx,%edx
    1314:	74 ea                	je     1300 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1316:	53                   	push   %ebx
    1317:	ff 35 48 ac 00 00    	pushl  0xac48
    131d:	68 0e 17 00 00       	push   $0x170e
    1322:	6a 01                	push   $0x1
    1324:	e8 c7 f3 ff ff       	call   6f0 <printf>
    threads[index_currently_running].join=found_tid;
    1329:	a1 48 ac 00 00       	mov    0xac48,%eax
    132e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1331:	8d 04 85 20 1d 00 00 	lea    0x1d20(,%eax,4),%eax
    1338:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    133b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1342:	e8 bb f2 ff ff       	call   602 <getpid>
    1347:	5a                   	pop    %edx
    1348:	59                   	pop    %ecx
    1349:	6a 0e                	push   $0xe
    134b:	50                   	push   %eax
    134c:	e8 d9 f2 ff ff       	call   62a <sigsend>
  }
  return 0;
    1351:	83 c4 10             	add    $0x10,%esp

}
    1354:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1357:	31 c0                	xor    %eax,%eax

}
    1359:	5b                   	pop    %ebx
    135a:	5e                   	pop    %esi
    135b:	5d                   	pop    %ebp
    135c:	c3                   	ret    
    135d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1360:	83 ec 04             	sub    $0x4,%esp
    1363:	56                   	push   %esi
    1364:	68 f0 16 00 00       	push   $0x16f0
    1369:	6a 01                	push   $0x1
    136b:	e8 80 f3 ff ff       	call   6f0 <printf>
    alarm(UTHREAD_QUANTA);
    1370:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1377:	e8 be f2 ff ff       	call   63a <alarm>
    return -1;
    137c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    137f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1382:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1387:	5b                   	pop    %ebx
    1388:	5e                   	pop    %esi
    1389:	5d                   	pop    %ebp
    138a:	c3                   	ret    
    138b:	90                   	nop
    138c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001390 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1390:	55                   	push   %ebp
    1391:	89 e5                	mov    %esp,%ebp
    1393:	53                   	push   %ebx
    1394:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1397:	6a 00                	push   $0x0
    1399:	e8 9c f2 ff ff       	call   63a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    139e:	8b 1d 48 ac 00 00    	mov    0xac48,%ebx
    13a4:	e8 71 f2 ff ff       	call   61a <uptime>
    13a9:	03 45 08             	add    0x8(%ebp),%eax
    13ac:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    13af:	89 04 95 3c 1d 00 00 	mov    %eax,0x1d3c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    13b6:	a1 48 ac 00 00       	mov    0xac48,%eax
    13bb:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    13be:	c7 04 85 28 1d 00 00 	movl   $0x1,0x1d28(,%eax,4)
    13c5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    13c9:	e8 34 f2 ff ff       	call   602 <getpid>
    13ce:	5a                   	pop    %edx
    13cf:	59                   	pop    %ecx
    13d0:	6a 0e                	push   $0xe
    13d2:	50                   	push   %eax
    13d3:	e8 52 f2 ff ff       	call   62a <sigsend>
  return 0;
}
    13d8:	31 c0                	xor    %eax,%eax
    13da:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13dd:	c9                   	leave  
    13de:	c3                   	ret    
    13df:	90                   	nop

000013e0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	53                   	push   %ebx
    13e4:	83 ec 04             	sub    $0x4,%esp
    13e7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    13ea:	8b 45 0c             	mov    0xc(%ebp),%eax
    13ed:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    13f0:	e8 bb f7 ff ff       	call   bb0 <bsem_alloc>
    13f5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    13f7:	e8 b4 f7 ff ff       	call   bb0 <bsem_alloc>
    13fc:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    13ff:	83 c4 04             	add    $0x4,%esp
    1402:	5b                   	pop    %ebx
    1403:	5d                   	pop    %ebp
    1404:	c3                   	ret    
    1405:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001410 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1410:	55                   	push   %ebp
    1411:	89 e5                	mov    %esp,%ebp
    1413:	53                   	push   %ebx
    1414:	83 ec 10             	sub    $0x10,%esp
    1417:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    141a:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1421:	ff 33                	pushl  (%ebx)
    1423:	e8 78 f8 ff ff       	call   ca0 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1428:	8b 43 04             	mov    0x4(%ebx),%eax
    142b:	83 c4 10             	add    $0x10,%esp
}
    142e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1431:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1434:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1435:	e9 66 f8 ff ff       	jmp    ca0 <bsem_free>
    143a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001440 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	53                   	push   %ebx
    1444:	83 ec 10             	sub    $0x10,%esp
    1447:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    144a:	ff 73 04             	pushl  0x4(%ebx)
    144d:	e8 de f8 ff ff       	call   d30 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1452:	58                   	pop    %eax
    1453:	ff 33                	pushl  (%ebx)
    1455:	e8 d6 f8 ff ff       	call   d30 <bsem_down>
  csem->value--;
    145a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    145d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1460:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1463:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1465:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1468:	7e 0e                	jle    1478 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    146a:	83 ec 0c             	sub    $0xc,%esp
    146d:	ff 73 04             	pushl  0x4(%ebx)
    1470:	e8 cb f9 ff ff       	call   e40 <bsem_up>
    1475:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1478:	8b 03                	mov    (%ebx),%eax
}
    147a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    147d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1480:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1481:	e9 ba f9 ff ff       	jmp    e40 <bsem_up>
    1486:	8d 76 00             	lea    0x0(%esi),%esi
    1489:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001490 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	53                   	push   %ebx
    1494:	83 ec 10             	sub    $0x10,%esp
    1497:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    149a:	ff 33                	pushl  (%ebx)
    149c:	e8 8f f8 ff ff       	call   d30 <bsem_down>
  csem->value++;
    14a1:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    14a4:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    14a7:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    14aa:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    14ad:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    14b0:	74 0e                	je     14c0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14b2:	8b 03                	mov    (%ebx),%eax
}
    14b4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14b7:	89 45 08             	mov    %eax,0x8(%ebp)
}
    14ba:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14bb:	e9 80 f9 ff ff       	jmp    e40 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    14c0:	83 ec 0c             	sub    $0xc,%esp
    14c3:	ff 73 04             	pushl  0x4(%ebx)
    14c6:	e8 75 f9 ff ff       	call   e40 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    14cb:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    14cd:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    14d0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14d3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    14d6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14d7:	e9 64 f9 ff ff       	jmp    e40 <bsem_up>
