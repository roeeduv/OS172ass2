
_grep:     file format elf32-i386


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
      11:	83 ec 18             	sub    $0x18,%esp
      14:	8b 01                	mov    (%ecx),%eax
      16:	8b 59 04             	mov    0x4(%ecx),%ebx
  int fd, i;
  char *pattern;

  if(argc <= 1){
      19:	83 f8 01             	cmp    $0x1,%eax
  }
}

int
main(int argc, char *argv[])
{
      1c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  int fd, i;
  char *pattern;

  if(argc <= 1){
      1f:	7e 76                	jle    97 <main+0x97>
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
      21:	8b 43 04             	mov    0x4(%ebx),%eax
      24:	83 c3 08             	add    $0x8,%ebx

  if(argc <= 2){
      27:	83 7d e4 02          	cmpl   $0x2,-0x1c(%ebp)
      2b:	be 02 00 00 00       	mov    $0x2,%esi

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
    exit();
  }
  pattern = argv[1];
      30:	89 45 e0             	mov    %eax,-0x20(%ebp)

  if(argc <= 2){
      33:	74 53                	je     88 <main+0x88>
      35:	8d 76 00             	lea    0x0(%esi),%esi
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      38:	83 ec 08             	sub    $0x8,%esp
      3b:	6a 00                	push   $0x0
      3d:	ff 33                	pushl  (%ebx)
      3f:	e8 5e 05 00 00       	call   5a2 <open>
      44:	83 c4 10             	add    $0x10,%esp
      47:	85 c0                	test   %eax,%eax
      49:	89 c7                	mov    %eax,%edi
      4b:	78 27                	js     74 <main+0x74>
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
      4d:	83 ec 08             	sub    $0x8,%esp
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
      50:	83 c6 01             	add    $0x1,%esi
      53:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      exit();
    }
    grep(pattern, fd);
      56:	50                   	push   %eax
      57:	ff 75 e0             	pushl  -0x20(%ebp)
      5a:	e8 c1 01 00 00       	call   220 <grep>
    close(fd);
      5f:	89 3c 24             	mov    %edi,(%esp)
      62:	e8 23 05 00 00       	call   58a <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
      67:	83 c4 10             	add    $0x10,%esp
      6a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
      6d:	7f c9                	jg     38 <main+0x38>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
      6f:	e8 ee 04 00 00       	call   562 <exit>
    exit();
  }

  for(i = 2; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "grep: cannot open %s\n", argv[i]);
      74:	50                   	push   %eax
      75:	ff 33                	pushl  (%ebx)
      77:	68 dc 14 00 00       	push   $0x14dc
      7c:	6a 01                	push   $0x1
      7e:	e8 4d 06 00 00       	call   6d0 <printf>
      exit();
      83:	e8 da 04 00 00       	call   562 <exit>
    exit();
  }
  pattern = argv[1];

  if(argc <= 2){
    grep(pattern, 0);
      88:	52                   	push   %edx
      89:	52                   	push   %edx
      8a:	6a 00                	push   $0x0
      8c:	50                   	push   %eax
      8d:	e8 8e 01 00 00       	call   220 <grep>
    exit();
      92:	e8 cb 04 00 00       	call   562 <exit>
{
  int fd, i;
  char *pattern;

  if(argc <= 1){
    printf(2, "usage: grep pattern [file ...]\n");
      97:	51                   	push   %ecx
      98:	51                   	push   %ecx
      99:	68 bc 14 00 00       	push   $0x14bc
      9e:	6a 02                	push   $0x2
      a0:	e8 2b 06 00 00       	call   6d0 <printf>
    exit();
      a5:	e8 b8 04 00 00       	call   562 <exit>
      aa:	66 90                	xchg   %ax,%ax
      ac:	66 90                	xchg   %ax,%ax
      ae:	66 90                	xchg   %ax,%ax

000000b0 <matchstar>:
  return 0;
}

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
      b0:	55                   	push   %ebp
      b1:	89 e5                	mov    %esp,%ebp
      b3:	57                   	push   %edi
      b4:	56                   	push   %esi
      b5:	53                   	push   %ebx
      b6:	83 ec 0c             	sub    $0xc,%esp
      b9:	8b 75 08             	mov    0x8(%ebp),%esi
      bc:	8b 7d 0c             	mov    0xc(%ebp),%edi
      bf:	8b 5d 10             	mov    0x10(%ebp),%ebx
      c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      c8:	83 ec 08             	sub    $0x8,%esp
      cb:	53                   	push   %ebx
      cc:	57                   	push   %edi
      cd:	e8 3e 00 00 00       	call   110 <matchhere>
      d2:	83 c4 10             	add    $0x10,%esp
      d5:	85 c0                	test   %eax,%eax
      d7:	75 1f                	jne    f8 <matchstar+0x48>
      return 1;
  }while(*text!='\0' && (*text++==c || c=='.'));
      d9:	0f be 13             	movsbl (%ebx),%edx
      dc:	84 d2                	test   %dl,%dl
      de:	74 0c                	je     ec <matchstar+0x3c>
      e0:	83 c3 01             	add    $0x1,%ebx
      e3:	83 fe 2e             	cmp    $0x2e,%esi
      e6:	74 e0                	je     c8 <matchstar+0x18>
      e8:	39 f2                	cmp    %esi,%edx
      ea:	74 dc                	je     c8 <matchstar+0x18>
  return 0;
}
      ec:	8d 65 f4             	lea    -0xc(%ebp),%esp
      ef:	5b                   	pop    %ebx
      f0:	5e                   	pop    %esi
      f1:	5f                   	pop    %edi
      f2:	5d                   	pop    %ebp
      f3:	c3                   	ret    
      f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      f8:	8d 65 f4             	lea    -0xc(%ebp),%esp
// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
      return 1;
      fb:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text!='\0' && (*text++==c || c=='.'));
  return 0;
}
     100:	5b                   	pop    %ebx
     101:	5e                   	pop    %esi
     102:	5f                   	pop    %edi
     103:	5d                   	pop    %ebp
     104:	c3                   	ret    
     105:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <matchhere>:
  return 0;
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	57                   	push   %edi
     114:	56                   	push   %esi
     115:	53                   	push   %ebx
     116:	83 ec 0c             	sub    $0xc,%esp
     119:	8b 45 08             	mov    0x8(%ebp),%eax
     11c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  if(re[0] == '\0')
     11f:	0f b6 18             	movzbl (%eax),%ebx
     122:	84 db                	test   %bl,%bl
     124:	74 63                	je     189 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
     126:	0f be 50 01          	movsbl 0x1(%eax),%edx
     12a:	80 fa 2a             	cmp    $0x2a,%dl
     12d:	74 7b                	je     1aa <matchhere+0x9a>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
     12f:	80 fb 24             	cmp    $0x24,%bl
     132:	75 08                	jne    13c <matchhere+0x2c>
     134:	84 d2                	test   %dl,%dl
     136:	0f 84 8a 00 00 00    	je     1c6 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     13c:	0f b6 37             	movzbl (%edi),%esi
     13f:	89 f1                	mov    %esi,%ecx
     141:	84 c9                	test   %cl,%cl
     143:	74 5b                	je     1a0 <matchhere+0x90>
     145:	38 cb                	cmp    %cl,%bl
     147:	74 05                	je     14e <matchhere+0x3e>
     149:	80 fb 2e             	cmp    $0x2e,%bl
     14c:	75 52                	jne    1a0 <matchhere+0x90>
    return matchhere(re+1, text+1);
     14e:	83 c7 01             	add    $0x1,%edi
     151:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
     154:	84 d2                	test   %dl,%dl
     156:	74 31                	je     189 <matchhere+0x79>
    return 1;
  if(re[1] == '*')
     158:	0f b6 58 01          	movzbl 0x1(%eax),%ebx
     15c:	80 fb 2a             	cmp    $0x2a,%bl
     15f:	74 4c                	je     1ad <matchhere+0x9d>
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
     161:	80 fa 24             	cmp    $0x24,%dl
     164:	75 04                	jne    16a <matchhere+0x5a>
     166:	84 db                	test   %bl,%bl
     168:	74 5c                	je     1c6 <matchhere+0xb6>
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
     16a:	0f b6 37             	movzbl (%edi),%esi
     16d:	89 f1                	mov    %esi,%ecx
     16f:	84 c9                	test   %cl,%cl
     171:	74 2d                	je     1a0 <matchhere+0x90>
     173:	80 fa 2e             	cmp    $0x2e,%dl
     176:	74 04                	je     17c <matchhere+0x6c>
     178:	38 d1                	cmp    %dl,%cl
     17a:	75 24                	jne    1a0 <matchhere+0x90>
     17c:	0f be d3             	movsbl %bl,%edx
    return matchhere(re+1, text+1);
     17f:	83 c7 01             	add    $0x1,%edi
     182:	83 c0 01             	add    $0x1,%eax
}

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
     185:	84 d2                	test   %dl,%dl
     187:	75 cf                	jne    158 <matchhere+0x48>
    return 1;
     189:	b8 01 00 00 00       	mov    $0x1,%eax
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
     18e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     191:	5b                   	pop    %ebx
     192:	5e                   	pop    %esi
     193:	5f                   	pop    %edi
     194:	5d                   	pop    %ebp
     195:	c3                   	ret    
     196:	8d 76 00             	lea    0x0(%esi),%esi
     199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     1a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
     1a3:	31 c0                	xor    %eax,%eax
}
     1a5:	5b                   	pop    %ebx
     1a6:	5e                   	pop    %esi
     1a7:	5f                   	pop    %edi
     1a8:	5d                   	pop    %ebp
     1a9:	c3                   	ret    
// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
     1aa:	0f be d3             	movsbl %bl,%edx
    return matchstar(re[0], re+2, text);
     1ad:	83 ec 04             	sub    $0x4,%esp
     1b0:	83 c0 02             	add    $0x2,%eax
     1b3:	57                   	push   %edi
     1b4:	50                   	push   %eax
     1b5:	52                   	push   %edx
     1b6:	e8 f5 fe ff ff       	call   b0 <matchstar>
     1bb:	83 c4 10             	add    $0x10,%esp
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
    return matchhere(re+1, text+1);
  return 0;
}
     1be:	8d 65 f4             	lea    -0xc(%ebp),%esp
     1c1:	5b                   	pop    %ebx
     1c2:	5e                   	pop    %esi
     1c3:	5f                   	pop    %edi
     1c4:	5d                   	pop    %ebp
     1c5:	c3                   	ret    
  if(re[0] == '\0')
    return 1;
  if(re[1] == '*')
    return matchstar(re[0], re+2, text);
  if(re[0] == '$' && re[1] == '\0')
    return *text == '\0';
     1c6:	31 c0                	xor    %eax,%eax
     1c8:	80 3f 00             	cmpb   $0x0,(%edi)
     1cb:	0f 94 c0             	sete   %al
     1ce:	eb be                	jmp    18e <matchhere+0x7e>

000001d0 <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
     1d0:	55                   	push   %ebp
     1d1:	89 e5                	mov    %esp,%ebp
     1d3:	56                   	push   %esi
     1d4:	53                   	push   %ebx
     1d5:	8b 75 08             	mov    0x8(%ebp),%esi
     1d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  if(re[0] == '^')
     1db:	80 3e 5e             	cmpb   $0x5e,(%esi)
     1de:	75 11                	jne    1f1 <match+0x21>
     1e0:	eb 2c                	jmp    20e <match+0x3e>
     1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
     1e8:	83 c3 01             	add    $0x1,%ebx
     1eb:	80 7b ff 00          	cmpb   $0x0,-0x1(%ebx)
     1ef:	74 16                	je     207 <match+0x37>
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
  do{  // must look at empty string
    if(matchhere(re, text))
     1f1:	83 ec 08             	sub    $0x8,%esp
     1f4:	53                   	push   %ebx
     1f5:	56                   	push   %esi
     1f6:	e8 15 ff ff ff       	call   110 <matchhere>
     1fb:	83 c4 10             	add    $0x10,%esp
     1fe:	85 c0                	test   %eax,%eax
     200:	74 e6                	je     1e8 <match+0x18>
      return 1;
     202:	b8 01 00 00 00       	mov    $0x1,%eax
  }while(*text++ != '\0');
  return 0;
}
     207:	8d 65 f8             	lea    -0x8(%ebp),%esp
     20a:	5b                   	pop    %ebx
     20b:	5e                   	pop    %esi
     20c:	5d                   	pop    %ebp
     20d:	c3                   	ret    

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
     20e:	83 c6 01             	add    $0x1,%esi
     211:	89 75 08             	mov    %esi,0x8(%ebp)
  do{  // must look at empty string
    if(matchhere(re, text))
      return 1;
  }while(*text++ != '\0');
  return 0;
}
     214:	8d 65 f8             	lea    -0x8(%ebp),%esp
     217:	5b                   	pop    %ebx
     218:	5e                   	pop    %esi
     219:	5d                   	pop    %ebp

int
match(char *re, char *text)
{
  if(re[0] == '^')
    return matchhere(re+1, text);
     21a:	e9 f1 fe ff ff       	jmp    110 <matchhere>
     21f:	90                   	nop

00000220 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
     220:	55                   	push   %ebp
     221:	89 e5                	mov    %esp,%ebp
     223:	57                   	push   %edi
     224:	56                   	push   %esi
     225:	53                   	push   %ebx
     226:	83 ec 1c             	sub    $0x1c,%esp
     229:	8b 75 08             	mov    0x8(%ebp),%esi
  int n, m;
  char *p, *q;

  m = 0;
     22c:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     233:	90                   	nop
     234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
     238:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
     23b:	b8 ff 03 00 00       	mov    $0x3ff,%eax
     240:	83 ec 04             	sub    $0x4,%esp
     243:	29 c8                	sub    %ecx,%eax
     245:	50                   	push   %eax
     246:	8d 81 80 1d 00 00    	lea    0x1d80(%ecx),%eax
     24c:	50                   	push   %eax
     24d:	ff 75 0c             	pushl  0xc(%ebp)
     250:	e8 25 03 00 00       	call   57a <read>
     255:	83 c4 10             	add    $0x10,%esp
     258:	85 c0                	test   %eax,%eax
     25a:	0f 8e ac 00 00 00    	jle    30c <grep+0xec>
    m += n;
     260:	01 45 e4             	add    %eax,-0x1c(%ebp)
    buf[m] = '\0';
    p = buf;
     263:	bb 80 1d 00 00       	mov    $0x1d80,%ebx
  int n, m;
  char *p, *q;

  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
     268:	8b 55 e4             	mov    -0x1c(%ebp),%edx
    buf[m] = '\0';
     26b:	c6 82 80 1d 00 00 00 	movb   $0x0,0x1d80(%edx)
     272:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    p = buf;
    while((q = strchr(p, '\n')) != 0){
     278:	83 ec 08             	sub    $0x8,%esp
     27b:	6a 0a                	push   $0xa
     27d:	53                   	push   %ebx
     27e:	e8 6d 01 00 00       	call   3f0 <strchr>
     283:	83 c4 10             	add    $0x10,%esp
     286:	85 c0                	test   %eax,%eax
     288:	89 c7                	mov    %eax,%edi
     28a:	74 3c                	je     2c8 <grep+0xa8>
      *q = 0;
      if(match(pattern, p)){
     28c:	83 ec 08             	sub    $0x8,%esp
  while((n = read(fd, buf+m, sizeof(buf)-m-1)) > 0){
    m += n;
    buf[m] = '\0';
    p = buf;
    while((q = strchr(p, '\n')) != 0){
      *q = 0;
     28f:	c6 07 00             	movb   $0x0,(%edi)
      if(match(pattern, p)){
     292:	53                   	push   %ebx
     293:	56                   	push   %esi
     294:	e8 37 ff ff ff       	call   1d0 <match>
     299:	83 c4 10             	add    $0x10,%esp
     29c:	85 c0                	test   %eax,%eax
     29e:	75 08                	jne    2a8 <grep+0x88>
     2a0:	8d 5f 01             	lea    0x1(%edi),%ebx
     2a3:	eb d3                	jmp    278 <grep+0x58>
     2a5:	8d 76 00             	lea    0x0(%esi),%esi
        *q = '\n';
     2a8:	c6 07 0a             	movb   $0xa,(%edi)
        write(1, p, q+1 - p);
     2ab:	83 c7 01             	add    $0x1,%edi
     2ae:	83 ec 04             	sub    $0x4,%esp
     2b1:	89 f8                	mov    %edi,%eax
     2b3:	29 d8                	sub    %ebx,%eax
     2b5:	50                   	push   %eax
     2b6:	53                   	push   %ebx
     2b7:	89 fb                	mov    %edi,%ebx
     2b9:	6a 01                	push   $0x1
     2bb:	e8 c2 02 00 00       	call   582 <write>
     2c0:	83 c4 10             	add    $0x10,%esp
     2c3:	eb b3                	jmp    278 <grep+0x58>
     2c5:	8d 76 00             	lea    0x0(%esi),%esi
      }
      p = q+1;
    }
    if(p == buf)
     2c8:	81 fb 80 1d 00 00    	cmp    $0x1d80,%ebx
     2ce:	74 30                	je     300 <grep+0xe0>
      m = 0;
    if(m > 0){
     2d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     2d3:	85 c0                	test   %eax,%eax
     2d5:	0f 8e 5d ff ff ff    	jle    238 <grep+0x18>
      m -= p - buf;
     2db:	89 d8                	mov    %ebx,%eax
      memmove(buf, p, m);
     2dd:	83 ec 04             	sub    $0x4,%esp
      p = q+1;
    }
    if(p == buf)
      m = 0;
    if(m > 0){
      m -= p - buf;
     2e0:	2d 80 1d 00 00       	sub    $0x1d80,%eax
     2e5:	29 45 e4             	sub    %eax,-0x1c(%ebp)
     2e8:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
      memmove(buf, p, m);
     2eb:	51                   	push   %ecx
     2ec:	53                   	push   %ebx
     2ed:	68 80 1d 00 00       	push   $0x1d80
     2f2:	e8 39 02 00 00       	call   530 <memmove>
     2f7:	83 c4 10             	add    $0x10,%esp
     2fa:	e9 39 ff ff ff       	jmp    238 <grep+0x18>
     2ff:	90                   	nop
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
      m = 0;
     300:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     307:	e9 2c ff ff ff       	jmp    238 <grep+0x18>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
     30c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     30f:	5b                   	pop    %ebx
     310:	5e                   	pop    %esi
     311:	5f                   	pop    %edi
     312:	5d                   	pop    %ebp
     313:	c3                   	ret    
     314:	66 90                	xchg   %ax,%ax
     316:	66 90                	xchg   %ax,%ax
     318:	66 90                	xchg   %ax,%ax
     31a:	66 90                	xchg   %ax,%ax
     31c:	66 90                	xchg   %ax,%ax
     31e:	66 90                	xchg   %ax,%ax

00000320 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     320:	55                   	push   %ebp
     321:	89 e5                	mov    %esp,%ebp
     323:	53                   	push   %ebx
     324:	8b 45 08             	mov    0x8(%ebp),%eax
     327:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     32a:	89 c2                	mov    %eax,%edx
     32c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     330:	83 c1 01             	add    $0x1,%ecx
     333:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     337:	83 c2 01             	add    $0x1,%edx
     33a:	84 db                	test   %bl,%bl
     33c:	88 5a ff             	mov    %bl,-0x1(%edx)
     33f:	75 ef                	jne    330 <strcpy+0x10>
    ;
  return os;
}
     341:	5b                   	pop    %ebx
     342:	5d                   	pop    %ebp
     343:	c3                   	ret    
     344:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     34a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000350 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	56                   	push   %esi
     354:	53                   	push   %ebx
     355:	8b 55 08             	mov    0x8(%ebp),%edx
     358:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     35b:	0f b6 02             	movzbl (%edx),%eax
     35e:	0f b6 19             	movzbl (%ecx),%ebx
     361:	84 c0                	test   %al,%al
     363:	75 1e                	jne    383 <strcmp+0x33>
     365:	eb 29                	jmp    390 <strcmp+0x40>
     367:	89 f6                	mov    %esi,%esi
     369:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     370:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     373:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     376:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     379:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     37d:	84 c0                	test   %al,%al
     37f:	74 0f                	je     390 <strcmp+0x40>
     381:	89 f1                	mov    %esi,%ecx
     383:	38 d8                	cmp    %bl,%al
     385:	74 e9                	je     370 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     387:	29 d8                	sub    %ebx,%eax
}
     389:	5b                   	pop    %ebx
     38a:	5e                   	pop    %esi
     38b:	5d                   	pop    %ebp
     38c:	c3                   	ret    
     38d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     390:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     392:	29 d8                	sub    %ebx,%eax
}
     394:	5b                   	pop    %ebx
     395:	5e                   	pop    %esi
     396:	5d                   	pop    %ebp
     397:	c3                   	ret    
     398:	90                   	nop
     399:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003a0 <strlen>:

uint
strlen(char *s)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     3a6:	80 39 00             	cmpb   $0x0,(%ecx)
     3a9:	74 12                	je     3bd <strlen+0x1d>
     3ab:	31 d2                	xor    %edx,%edx
     3ad:	8d 76 00             	lea    0x0(%esi),%esi
     3b0:	83 c2 01             	add    $0x1,%edx
     3b3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     3b7:	89 d0                	mov    %edx,%eax
     3b9:	75 f5                	jne    3b0 <strlen+0x10>
    ;
  return n;
}
     3bb:	5d                   	pop    %ebp
     3bc:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     3bd:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     3bf:	5d                   	pop    %ebp
     3c0:	c3                   	ret    
     3c1:	eb 0d                	jmp    3d0 <memset>
     3c3:	90                   	nop
     3c4:	90                   	nop
     3c5:	90                   	nop
     3c6:	90                   	nop
     3c7:	90                   	nop
     3c8:	90                   	nop
     3c9:	90                   	nop
     3ca:	90                   	nop
     3cb:	90                   	nop
     3cc:	90                   	nop
     3cd:	90                   	nop
     3ce:	90                   	nop
     3cf:	90                   	nop

000003d0 <memset>:

void*
memset(void *dst, int c, uint n)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	57                   	push   %edi
     3d4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     3d7:	8b 4d 10             	mov    0x10(%ebp),%ecx
     3da:	8b 45 0c             	mov    0xc(%ebp),%eax
     3dd:	89 d7                	mov    %edx,%edi
     3df:	fc                   	cld    
     3e0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     3e2:	89 d0                	mov    %edx,%eax
     3e4:	5f                   	pop    %edi
     3e5:	5d                   	pop    %ebp
     3e6:	c3                   	ret    
     3e7:	89 f6                	mov    %esi,%esi
     3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <strchr>:

char*
strchr(const char *s, char c)
{
     3f0:	55                   	push   %ebp
     3f1:	89 e5                	mov    %esp,%ebp
     3f3:	53                   	push   %ebx
     3f4:	8b 45 08             	mov    0x8(%ebp),%eax
     3f7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     3fa:	0f b6 10             	movzbl (%eax),%edx
     3fd:	84 d2                	test   %dl,%dl
     3ff:	74 1d                	je     41e <strchr+0x2e>
    if(*s == c)
     401:	38 d3                	cmp    %dl,%bl
     403:	89 d9                	mov    %ebx,%ecx
     405:	75 0d                	jne    414 <strchr+0x24>
     407:	eb 17                	jmp    420 <strchr+0x30>
     409:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     410:	38 ca                	cmp    %cl,%dl
     412:	74 0c                	je     420 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     414:	83 c0 01             	add    $0x1,%eax
     417:	0f b6 10             	movzbl (%eax),%edx
     41a:	84 d2                	test   %dl,%dl
     41c:	75 f2                	jne    410 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     41e:	31 c0                	xor    %eax,%eax
}
     420:	5b                   	pop    %ebx
     421:	5d                   	pop    %ebp
     422:	c3                   	ret    
     423:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     429:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000430 <gets>:

char*
gets(char *buf, int max)
{
     430:	55                   	push   %ebp
     431:	89 e5                	mov    %esp,%ebp
     433:	57                   	push   %edi
     434:	56                   	push   %esi
     435:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     436:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     438:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     43b:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     43e:	eb 29                	jmp    469 <gets+0x39>
    cc = read(0, &c, 1);
     440:	83 ec 04             	sub    $0x4,%esp
     443:	6a 01                	push   $0x1
     445:	57                   	push   %edi
     446:	6a 00                	push   $0x0
     448:	e8 2d 01 00 00       	call   57a <read>
    if(cc < 1)
     44d:	83 c4 10             	add    $0x10,%esp
     450:	85 c0                	test   %eax,%eax
     452:	7e 1d                	jle    471 <gets+0x41>
      break;
    buf[i++] = c;
     454:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     458:	8b 55 08             	mov    0x8(%ebp),%edx
     45b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     45d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     45f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     463:	74 1b                	je     480 <gets+0x50>
     465:	3c 0d                	cmp    $0xd,%al
     467:	74 17                	je     480 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     469:	8d 5e 01             	lea    0x1(%esi),%ebx
     46c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     46f:	7c cf                	jl     440 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     471:	8b 45 08             	mov    0x8(%ebp),%eax
     474:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     478:	8d 65 f4             	lea    -0xc(%ebp),%esp
     47b:	5b                   	pop    %ebx
     47c:	5e                   	pop    %esi
     47d:	5f                   	pop    %edi
     47e:	5d                   	pop    %ebp
     47f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     480:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     483:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     485:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     489:	8d 65 f4             	lea    -0xc(%ebp),%esp
     48c:	5b                   	pop    %ebx
     48d:	5e                   	pop    %esi
     48e:	5f                   	pop    %edi
     48f:	5d                   	pop    %ebp
     490:	c3                   	ret    
     491:	eb 0d                	jmp    4a0 <stat>
     493:	90                   	nop
     494:	90                   	nop
     495:	90                   	nop
     496:	90                   	nop
     497:	90                   	nop
     498:	90                   	nop
     499:	90                   	nop
     49a:	90                   	nop
     49b:	90                   	nop
     49c:	90                   	nop
     49d:	90                   	nop
     49e:	90                   	nop
     49f:	90                   	nop

000004a0 <stat>:

int
stat(char *n, struct stat *st)
{
     4a0:	55                   	push   %ebp
     4a1:	89 e5                	mov    %esp,%ebp
     4a3:	56                   	push   %esi
     4a4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     4a5:	83 ec 08             	sub    $0x8,%esp
     4a8:	6a 00                	push   $0x0
     4aa:	ff 75 08             	pushl  0x8(%ebp)
     4ad:	e8 f0 00 00 00       	call   5a2 <open>
  if(fd < 0)
     4b2:	83 c4 10             	add    $0x10,%esp
     4b5:	85 c0                	test   %eax,%eax
     4b7:	78 27                	js     4e0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     4b9:	83 ec 08             	sub    $0x8,%esp
     4bc:	ff 75 0c             	pushl  0xc(%ebp)
     4bf:	89 c3                	mov    %eax,%ebx
     4c1:	50                   	push   %eax
     4c2:	e8 f3 00 00 00       	call   5ba <fstat>
     4c7:	89 c6                	mov    %eax,%esi
  close(fd);
     4c9:	89 1c 24             	mov    %ebx,(%esp)
     4cc:	e8 b9 00 00 00       	call   58a <close>
  return r;
     4d1:	83 c4 10             	add    $0x10,%esp
     4d4:	89 f0                	mov    %esi,%eax
}
     4d6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     4d9:	5b                   	pop    %ebx
     4da:	5e                   	pop    %esi
     4db:	5d                   	pop    %ebp
     4dc:	c3                   	ret    
     4dd:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     4e0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     4e5:	eb ef                	jmp    4d6 <stat+0x36>
     4e7:	89 f6                	mov    %esi,%esi
     4e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000004f0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     4f0:	55                   	push   %ebp
     4f1:	89 e5                	mov    %esp,%ebp
     4f3:	53                   	push   %ebx
     4f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     4f7:	0f be 11             	movsbl (%ecx),%edx
     4fa:	8d 42 d0             	lea    -0x30(%edx),%eax
     4fd:	3c 09                	cmp    $0x9,%al
     4ff:	b8 00 00 00 00       	mov    $0x0,%eax
     504:	77 1f                	ja     525 <atoi+0x35>
     506:	8d 76 00             	lea    0x0(%esi),%esi
     509:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     510:	8d 04 80             	lea    (%eax,%eax,4),%eax
     513:	83 c1 01             	add    $0x1,%ecx
     516:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     51a:	0f be 11             	movsbl (%ecx),%edx
     51d:	8d 5a d0             	lea    -0x30(%edx),%ebx
     520:	80 fb 09             	cmp    $0x9,%bl
     523:	76 eb                	jbe    510 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     525:	5b                   	pop    %ebx
     526:	5d                   	pop    %ebp
     527:	c3                   	ret    
     528:	90                   	nop
     529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000530 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     530:	55                   	push   %ebp
     531:	89 e5                	mov    %esp,%ebp
     533:	56                   	push   %esi
     534:	53                   	push   %ebx
     535:	8b 5d 10             	mov    0x10(%ebp),%ebx
     538:	8b 45 08             	mov    0x8(%ebp),%eax
     53b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     53e:	85 db                	test   %ebx,%ebx
     540:	7e 14                	jle    556 <memmove+0x26>
     542:	31 d2                	xor    %edx,%edx
     544:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     548:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     54c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     54f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     552:	39 da                	cmp    %ebx,%edx
     554:	75 f2                	jne    548 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     556:	5b                   	pop    %ebx
     557:	5e                   	pop    %esi
     558:	5d                   	pop    %ebp
     559:	c3                   	ret    

0000055a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     55a:	b8 01 00 00 00       	mov    $0x1,%eax
     55f:	cd 40                	int    $0x40
     561:	c3                   	ret    

00000562 <exit>:
SYSCALL(exit)
     562:	b8 02 00 00 00       	mov    $0x2,%eax
     567:	cd 40                	int    $0x40
     569:	c3                   	ret    

0000056a <wait>:
SYSCALL(wait)
     56a:	b8 03 00 00 00       	mov    $0x3,%eax
     56f:	cd 40                	int    $0x40
     571:	c3                   	ret    

00000572 <pipe>:
SYSCALL(pipe)
     572:	b8 04 00 00 00       	mov    $0x4,%eax
     577:	cd 40                	int    $0x40
     579:	c3                   	ret    

0000057a <read>:
SYSCALL(read)
     57a:	b8 05 00 00 00       	mov    $0x5,%eax
     57f:	cd 40                	int    $0x40
     581:	c3                   	ret    

00000582 <write>:
SYSCALL(write)
     582:	b8 10 00 00 00       	mov    $0x10,%eax
     587:	cd 40                	int    $0x40
     589:	c3                   	ret    

0000058a <close>:
SYSCALL(close)
     58a:	b8 15 00 00 00       	mov    $0x15,%eax
     58f:	cd 40                	int    $0x40
     591:	c3                   	ret    

00000592 <kill>:
SYSCALL(kill)
     592:	b8 06 00 00 00       	mov    $0x6,%eax
     597:	cd 40                	int    $0x40
     599:	c3                   	ret    

0000059a <exec>:
SYSCALL(exec)
     59a:	b8 07 00 00 00       	mov    $0x7,%eax
     59f:	cd 40                	int    $0x40
     5a1:	c3                   	ret    

000005a2 <open>:
SYSCALL(open)
     5a2:	b8 0f 00 00 00       	mov    $0xf,%eax
     5a7:	cd 40                	int    $0x40
     5a9:	c3                   	ret    

000005aa <mknod>:
SYSCALL(mknod)
     5aa:	b8 11 00 00 00       	mov    $0x11,%eax
     5af:	cd 40                	int    $0x40
     5b1:	c3                   	ret    

000005b2 <unlink>:
SYSCALL(unlink)
     5b2:	b8 12 00 00 00       	mov    $0x12,%eax
     5b7:	cd 40                	int    $0x40
     5b9:	c3                   	ret    

000005ba <fstat>:
SYSCALL(fstat)
     5ba:	b8 08 00 00 00       	mov    $0x8,%eax
     5bf:	cd 40                	int    $0x40
     5c1:	c3                   	ret    

000005c2 <link>:
SYSCALL(link)
     5c2:	b8 13 00 00 00       	mov    $0x13,%eax
     5c7:	cd 40                	int    $0x40
     5c9:	c3                   	ret    

000005ca <mkdir>:
SYSCALL(mkdir)
     5ca:	b8 14 00 00 00       	mov    $0x14,%eax
     5cf:	cd 40                	int    $0x40
     5d1:	c3                   	ret    

000005d2 <chdir>:
SYSCALL(chdir)
     5d2:	b8 09 00 00 00       	mov    $0x9,%eax
     5d7:	cd 40                	int    $0x40
     5d9:	c3                   	ret    

000005da <dup>:
SYSCALL(dup)
     5da:	b8 0a 00 00 00       	mov    $0xa,%eax
     5df:	cd 40                	int    $0x40
     5e1:	c3                   	ret    

000005e2 <getpid>:
SYSCALL(getpid)
     5e2:	b8 0b 00 00 00       	mov    $0xb,%eax
     5e7:	cd 40                	int    $0x40
     5e9:	c3                   	ret    

000005ea <sbrk>:
SYSCALL(sbrk)
     5ea:	b8 0c 00 00 00       	mov    $0xc,%eax
     5ef:	cd 40                	int    $0x40
     5f1:	c3                   	ret    

000005f2 <sleep>:
SYSCALL(sleep)
     5f2:	b8 0d 00 00 00       	mov    $0xd,%eax
     5f7:	cd 40                	int    $0x40
     5f9:	c3                   	ret    

000005fa <uptime>:
SYSCALL(uptime)
     5fa:	b8 0e 00 00 00       	mov    $0xe,%eax
     5ff:	cd 40                	int    $0x40
     601:	c3                   	ret    

00000602 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     602:	b8 16 00 00 00       	mov    $0x16,%eax
     607:	cd 40                	int    $0x40
     609:	c3                   	ret    

0000060a <sigsend>:
SYSCALL(sigsend)
     60a:	b8 17 00 00 00       	mov    $0x17,%eax
     60f:	cd 40                	int    $0x40
     611:	c3                   	ret    

00000612 <sigreturn>:
SYSCALL(sigreturn)
     612:	b8 18 00 00 00       	mov    $0x18,%eax
     617:	cd 40                	int    $0x40
     619:	c3                   	ret    

0000061a <alarm>:
SYSCALL(alarm)
     61a:	b8 19 00 00 00       	mov    $0x19,%eax
     61f:	cd 40                	int    $0x40
     621:	c3                   	ret    
     622:	66 90                	xchg   %ax,%ax
     624:	66 90                	xchg   %ax,%ax
     626:	66 90                	xchg   %ax,%ax
     628:	66 90                	xchg   %ax,%ax
     62a:	66 90                	xchg   %ax,%ax
     62c:	66 90                	xchg   %ax,%ax
     62e:	66 90                	xchg   %ax,%ax

00000630 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     630:	55                   	push   %ebp
     631:	89 e5                	mov    %esp,%ebp
     633:	57                   	push   %edi
     634:	56                   	push   %esi
     635:	53                   	push   %ebx
     636:	89 c6                	mov    %eax,%esi
     638:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     63b:	8b 5d 08             	mov    0x8(%ebp),%ebx
     63e:	85 db                	test   %ebx,%ebx
     640:	74 7e                	je     6c0 <printint+0x90>
     642:	89 d0                	mov    %edx,%eax
     644:	c1 e8 1f             	shr    $0x1f,%eax
     647:	84 c0                	test   %al,%al
     649:	74 75                	je     6c0 <printint+0x90>
    neg = 1;
    x = -xx;
     64b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     64d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     654:	f7 d8                	neg    %eax
     656:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     659:	31 ff                	xor    %edi,%edi
     65b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     65e:	89 ce                	mov    %ecx,%esi
     660:	eb 08                	jmp    66a <printint+0x3a>
     662:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     668:	89 cf                	mov    %ecx,%edi
     66a:	31 d2                	xor    %edx,%edx
     66c:	8d 4f 01             	lea    0x1(%edi),%ecx
     66f:	f7 f6                	div    %esi
     671:	0f b6 92 fc 14 00 00 	movzbl 0x14fc(%edx),%edx
  }while((x /= base) != 0);
     678:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     67a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     67d:	75 e9                	jne    668 <printint+0x38>
  if(neg)
     67f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     682:	8b 75 c0             	mov    -0x40(%ebp),%esi
     685:	85 c0                	test   %eax,%eax
     687:	74 08                	je     691 <printint+0x61>
    buf[i++] = '-';
     689:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     68e:	8d 4f 02             	lea    0x2(%edi),%ecx
     691:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     695:	8d 76 00             	lea    0x0(%esi),%esi
     698:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     69b:	83 ec 04             	sub    $0x4,%esp
     69e:	83 ef 01             	sub    $0x1,%edi
     6a1:	6a 01                	push   $0x1
     6a3:	53                   	push   %ebx
     6a4:	56                   	push   %esi
     6a5:	88 45 d7             	mov    %al,-0x29(%ebp)
     6a8:	e8 d5 fe ff ff       	call   582 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     6ad:	83 c4 10             	add    $0x10,%esp
     6b0:	39 df                	cmp    %ebx,%edi
     6b2:	75 e4                	jne    698 <printint+0x68>
    putc(fd, buf[i]);
}
     6b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6b7:	5b                   	pop    %ebx
     6b8:	5e                   	pop    %esi
     6b9:	5f                   	pop    %edi
     6ba:	5d                   	pop    %ebp
     6bb:	c3                   	ret    
     6bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     6c0:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     6c2:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     6c9:	eb 8b                	jmp    656 <printint+0x26>
     6cb:	90                   	nop
     6cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000006d0 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6d0:	55                   	push   %ebp
     6d1:	89 e5                	mov    %esp,%ebp
     6d3:	57                   	push   %edi
     6d4:	56                   	push   %esi
     6d5:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6d6:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6d9:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6dc:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     6df:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     6e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     6e5:	0f b6 1e             	movzbl (%esi),%ebx
     6e8:	83 c6 01             	add    $0x1,%esi
     6eb:	84 db                	test   %bl,%bl
     6ed:	0f 84 b0 00 00 00    	je     7a3 <printf+0xd3>
     6f3:	31 d2                	xor    %edx,%edx
     6f5:	eb 39                	jmp    730 <printf+0x60>
     6f7:	89 f6                	mov    %esi,%esi
     6f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     700:	83 f8 25             	cmp    $0x25,%eax
     703:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     706:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     70b:	74 18                	je     725 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     70d:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     710:	83 ec 04             	sub    $0x4,%esp
     713:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     716:	6a 01                	push   $0x1
     718:	50                   	push   %eax
     719:	57                   	push   %edi
     71a:	e8 63 fe ff ff       	call   582 <write>
     71f:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     722:	83 c4 10             	add    $0x10,%esp
     725:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     728:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     72c:	84 db                	test   %bl,%bl
     72e:	74 73                	je     7a3 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     730:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     732:	0f be cb             	movsbl %bl,%ecx
     735:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     738:	74 c6                	je     700 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     73a:	83 fa 25             	cmp    $0x25,%edx
     73d:	75 e6                	jne    725 <printf+0x55>
      if(c == 'd'){
     73f:	83 f8 64             	cmp    $0x64,%eax
     742:	0f 84 f8 00 00 00    	je     840 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     748:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     74e:	83 f9 70             	cmp    $0x70,%ecx
     751:	74 5d                	je     7b0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     753:	83 f8 73             	cmp    $0x73,%eax
     756:	0f 84 84 00 00 00    	je     7e0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     75c:	83 f8 63             	cmp    $0x63,%eax
     75f:	0f 84 ea 00 00 00    	je     84f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     765:	83 f8 25             	cmp    $0x25,%eax
     768:	0f 84 c2 00 00 00    	je     830 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     76e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     771:	83 ec 04             	sub    $0x4,%esp
     774:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     778:	6a 01                	push   $0x1
     77a:	50                   	push   %eax
     77b:	57                   	push   %edi
     77c:	e8 01 fe ff ff       	call   582 <write>
     781:	83 c4 0c             	add    $0xc,%esp
     784:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     787:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     78a:	6a 01                	push   $0x1
     78c:	50                   	push   %eax
     78d:	57                   	push   %edi
     78e:	83 c6 01             	add    $0x1,%esi
     791:	e8 ec fd ff ff       	call   582 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     796:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     79a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     79d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     79f:	84 db                	test   %bl,%bl
     7a1:	75 8d                	jne    730 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     7a3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7a6:	5b                   	pop    %ebx
     7a7:	5e                   	pop    %esi
     7a8:	5f                   	pop    %edi
     7a9:	5d                   	pop    %ebp
     7aa:	c3                   	ret    
     7ab:	90                   	nop
     7ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     7b0:	83 ec 0c             	sub    $0xc,%esp
     7b3:	b9 10 00 00 00       	mov    $0x10,%ecx
     7b8:	6a 00                	push   $0x0
     7ba:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     7bd:	89 f8                	mov    %edi,%eax
     7bf:	8b 13                	mov    (%ebx),%edx
     7c1:	e8 6a fe ff ff       	call   630 <printint>
        ap++;
     7c6:	89 d8                	mov    %ebx,%eax
     7c8:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     7cb:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     7cd:	83 c0 04             	add    $0x4,%eax
     7d0:	89 45 d0             	mov    %eax,-0x30(%ebp)
     7d3:	e9 4d ff ff ff       	jmp    725 <printf+0x55>
     7d8:	90                   	nop
     7d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     7e0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     7e3:	8b 18                	mov    (%eax),%ebx
        ap++;
     7e5:	83 c0 04             	add    $0x4,%eax
     7e8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     7eb:	b8 f2 14 00 00       	mov    $0x14f2,%eax
     7f0:	85 db                	test   %ebx,%ebx
     7f2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     7f5:	0f b6 03             	movzbl (%ebx),%eax
     7f8:	84 c0                	test   %al,%al
     7fa:	74 23                	je     81f <printf+0x14f>
     7fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     800:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     803:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     806:	83 ec 04             	sub    $0x4,%esp
     809:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     80b:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     80e:	50                   	push   %eax
     80f:	57                   	push   %edi
     810:	e8 6d fd ff ff       	call   582 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     815:	0f b6 03             	movzbl (%ebx),%eax
     818:	83 c4 10             	add    $0x10,%esp
     81b:	84 c0                	test   %al,%al
     81d:	75 e1                	jne    800 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     81f:	31 d2                	xor    %edx,%edx
     821:	e9 ff fe ff ff       	jmp    725 <printf+0x55>
     826:	8d 76 00             	lea    0x0(%esi),%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     830:	83 ec 04             	sub    $0x4,%esp
     833:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     836:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     839:	6a 01                	push   $0x1
     83b:	e9 4c ff ff ff       	jmp    78c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
     840:	83 ec 0c             	sub    $0xc,%esp
     843:	b9 0a 00 00 00       	mov    $0xa,%ecx
     848:	6a 01                	push   $0x1
     84a:	e9 6b ff ff ff       	jmp    7ba <printf+0xea>
     84f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     852:	83 ec 04             	sub    $0x4,%esp
     855:	8b 03                	mov    (%ebx),%eax
     857:	6a 01                	push   $0x1
     859:	88 45 e4             	mov    %al,-0x1c(%ebp)
     85c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     85f:	50                   	push   %eax
     860:	57                   	push   %edi
     861:	e8 1c fd ff ff       	call   582 <write>
     866:	e9 5b ff ff ff       	jmp    7c6 <printf+0xf6>
     86b:	66 90                	xchg   %ax,%ax
     86d:	66 90                	xchg   %ax,%ax
     86f:	90                   	nop

00000870 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     870:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     871:	a1 60 1d 00 00       	mov    0x1d60,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
     876:	89 e5                	mov    %esp,%ebp
     878:	57                   	push   %edi
     879:	56                   	push   %esi
     87a:	53                   	push   %ebx
     87b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     87e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
     880:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     883:	39 c8                	cmp    %ecx,%eax
     885:	73 19                	jae    8a0 <free+0x30>
     887:	89 f6                	mov    %esi,%esi
     889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     890:	39 d1                	cmp    %edx,%ecx
     892:	72 1c                	jb     8b0 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     894:	39 d0                	cmp    %edx,%eax
     896:	73 18                	jae    8b0 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
     898:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     89a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     89c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     89e:	72 f0                	jb     890 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     8a0:	39 d0                	cmp    %edx,%eax
     8a2:	72 f4                	jb     898 <free+0x28>
     8a4:	39 d1                	cmp    %edx,%ecx
     8a6:	73 f0                	jae    898 <free+0x28>
     8a8:	90                   	nop
     8a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
     8b0:	8b 73 fc             	mov    -0x4(%ebx),%esi
     8b3:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
     8b6:	39 d7                	cmp    %edx,%edi
     8b8:	74 19                	je     8d3 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
     8ba:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
     8bd:	8b 50 04             	mov    0x4(%eax),%edx
     8c0:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     8c3:	39 f1                	cmp    %esi,%ecx
     8c5:	74 23                	je     8ea <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
     8c7:	89 08                	mov    %ecx,(%eax)
  freep = p;
     8c9:	a3 60 1d 00 00       	mov    %eax,0x1d60
}
     8ce:	5b                   	pop    %ebx
     8cf:	5e                   	pop    %esi
     8d0:	5f                   	pop    %edi
     8d1:	5d                   	pop    %ebp
     8d2:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
     8d3:	03 72 04             	add    0x4(%edx),%esi
     8d6:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
     8d9:	8b 10                	mov    (%eax),%edx
     8db:	8b 12                	mov    (%edx),%edx
     8dd:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
     8e0:	8b 50 04             	mov    0x4(%eax),%edx
     8e3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
     8e6:	39 f1                	cmp    %esi,%ecx
     8e8:	75 dd                	jne    8c7 <free+0x57>
    p->s.size += bp->s.size;
     8ea:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
     8ed:	a3 60 1d 00 00       	mov    %eax,0x1d60
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
     8f2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     8f5:	8b 53 f8             	mov    -0x8(%ebx),%edx
     8f8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
     8fa:	5b                   	pop    %ebx
     8fb:	5e                   	pop    %esi
     8fc:	5f                   	pop    %edi
     8fd:	5d                   	pop    %ebp
     8fe:	c3                   	ret    
     8ff:	90                   	nop

00000900 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
     900:	55                   	push   %ebp
     901:	89 e5                	mov    %esp,%ebp
     903:	57                   	push   %edi
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     909:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
     90c:	8b 15 60 1d 00 00    	mov    0x1d60,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     912:	8d 78 07             	lea    0x7(%eax),%edi
     915:	c1 ef 03             	shr    $0x3,%edi
     918:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
     91b:	85 d2                	test   %edx,%edx
     91d:	0f 84 a3 00 00 00    	je     9c6 <malloc+0xc6>
     923:	8b 02                	mov    (%edx),%eax
     925:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
     928:	39 cf                	cmp    %ecx,%edi
     92a:	76 74                	jbe    9a0 <malloc+0xa0>
     92c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
     932:	be 00 10 00 00       	mov    $0x1000,%esi
     937:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
     93e:	0f 43 f7             	cmovae %edi,%esi
     941:	ba 00 80 00 00       	mov    $0x8000,%edx
     946:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
     94c:	0f 46 da             	cmovbe %edx,%ebx
     94f:	eb 10                	jmp    961 <malloc+0x61>
     951:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     958:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
     95a:	8b 48 04             	mov    0x4(%eax),%ecx
     95d:	39 cf                	cmp    %ecx,%edi
     95f:	76 3f                	jbe    9a0 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
     961:	39 05 60 1d 00 00    	cmp    %eax,0x1d60
     967:	89 c2                	mov    %eax,%edx
     969:	75 ed                	jne    958 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
     96b:	83 ec 0c             	sub    $0xc,%esp
     96e:	53                   	push   %ebx
     96f:	e8 76 fc ff ff       	call   5ea <sbrk>
  if(p == (char*)-1)
     974:	83 c4 10             	add    $0x10,%esp
     977:	83 f8 ff             	cmp    $0xffffffff,%eax
     97a:	74 1c                	je     998 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
     97c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
     97f:	83 ec 0c             	sub    $0xc,%esp
     982:	83 c0 08             	add    $0x8,%eax
     985:	50                   	push   %eax
     986:	e8 e5 fe ff ff       	call   870 <free>
  return freep;
     98b:	8b 15 60 1d 00 00    	mov    0x1d60,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
     991:	83 c4 10             	add    $0x10,%esp
     994:	85 d2                	test   %edx,%edx
     996:	75 c0                	jne    958 <malloc+0x58>
        return 0;
     998:	31 c0                	xor    %eax,%eax
     99a:	eb 1c                	jmp    9b8 <malloc+0xb8>
     99c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
     9a0:	39 cf                	cmp    %ecx,%edi
     9a2:	74 1c                	je     9c0 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
     9a4:	29 f9                	sub    %edi,%ecx
     9a6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
     9a9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
     9ac:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
     9af:	89 15 60 1d 00 00    	mov    %edx,0x1d60
      return (void*)(p + 1);
     9b5:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
     9b8:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9bb:	5b                   	pop    %ebx
     9bc:	5e                   	pop    %esi
     9bd:	5f                   	pop    %edi
     9be:	5d                   	pop    %ebp
     9bf:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
     9c0:	8b 08                	mov    (%eax),%ecx
     9c2:	89 0a                	mov    %ecx,(%edx)
     9c4:	eb e9                	jmp    9af <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
     9c6:	c7 05 60 1d 00 00 64 	movl   $0x1d64,0x1d60
     9cd:	1d 00 00 
     9d0:	c7 05 64 1d 00 00 64 	movl   $0x1d64,0x1d64
     9d7:	1d 00 00 
    base.s.size = 0;
     9da:	b8 64 1d 00 00       	mov    $0x1d64,%eax
     9df:	c7 05 68 1d 00 00 00 	movl   $0x0,0x1d68
     9e6:	00 00 00 
     9e9:	e9 3e ff ff ff       	jmp    92c <malloc+0x2c>
     9ee:	66 90                	xchg   %ax,%ax

000009f0 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
     9f0:	55                   	push   %ebp
     9f1:	89 e5                	mov    %esp,%ebp
     9f3:	56                   	push   %esi
     9f4:	53                   	push   %ebx
     9f5:	8b 75 0c             	mov    0xc(%ebp),%esi
     9f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
     9fb:	83 ec 08             	sub    $0x8,%esp
     9fe:	68 10 15 00 00       	push   $0x1510
     a03:	6a 01                	push   $0x1
     a05:	e8 c6 fc ff ff       	call   6d0 <printf>
  alarm(UTHREAD_QUANTA);
     a0a:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     a11:	e8 04 fc ff ff       	call   61a <alarm>
  start_func(arg);
     a16:	89 75 08             	mov    %esi,0x8(%ebp)
     a19:	83 c4 10             	add    $0x10,%esp
}
     a1c:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     a1f:	89 d8                	mov    %ebx,%eax
}
     a21:	5b                   	pop    %ebx
     a22:	5e                   	pop    %esi
     a23:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
     a24:	ff e0                	jmp    *%eax
     a26:	8d 76 00             	lea    0x0(%esi),%esi
     a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a30 <uthread_exit>:
  return;
}

void
uthread_exit()
{
     a30:	55                   	push   %ebp
     a31:	89 e5                	mov    %esp,%ebp
     a33:	53                   	push   %ebx
     a34:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
     a37:	6a 00                	push   $0x0
     a39:	e8 dc fb ff ff       	call   61a <alarm>
  printf(1,"exiting...\n");
     a3e:	5a                   	pop    %edx
     a3f:	59                   	pop    %ecx
     a40:	68 80 16 00 00       	push   $0x1680
     a45:	6a 01                	push   $0x1
     a47:	e8 84 fc ff ff       	call   6d0 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
     a4c:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
     a51:	83 c4 10             	add    $0x10,%esp
     a54:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     a57:	8b 1c 95 80 21 00 00 	mov    0x2180(,%edx,4),%ebx
     a5e:	85 db                	test   %ebx,%ebx
     a60:	75 0a                	jne    a6c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
     a62:	c7 05 88 21 00 00 00 	movl   $0x0,0x2188
     a69:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
     a6c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
     a6f:	83 ec 0c             	sub    $0xc,%esp
     a72:	ff 34 85 84 21 00 00 	pushl  0x2184(,%eax,4)
     a79:	e8 f2 fd ff ff       	call   870 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
     a7e:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
     a83:	83 c4 10             	add    $0x10,%esp
     a86:	8d 14 c0             	lea    (%eax,%eax,8),%edx
     a89:	b8 88 21 00 00       	mov    $0x2188,%eax
     a8e:	c1 e2 02             	shl    $0x2,%edx
     a91:	c7 82 88 21 00 00 00 	movl   $0x0,0x2188(%edx)
     a98:	00 00 00 
  threads[index_currently_running].thread_id = -1;
     a9b:	c7 82 80 21 00 00 ff 	movl   $0xffffffff,0x2180(%edx)
     aa2:	ff ff ff 
  threads[index_currently_running].ebp = 0;
     aa5:	c7 82 8c 21 00 00 00 	movl   $0x0,0x218c(%edx)
     aac:	00 00 00 
  threads[index_currently_running].esp = 0;
     aaf:	c7 82 90 21 00 00 00 	movl   $0x0,0x2190(%edx)
     ab6:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
     ab9:	c7 82 9c 21 00 00 00 	movl   $0x0,0x219c(%edx)
     ac0:	00 00 00 
  threads[index_currently_running].join = -1;
     ac3:	c7 82 a0 21 00 00 ff 	movl   $0xffffffff,0x21a0(%edx)
     aca:	ff ff ff 
     acd:	eb 0b                	jmp    ada <uthread_exit+0xaa>
     acf:	90                   	nop
     ad0:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     ad3:	3d 88 2a 00 00       	cmp    $0x2a88,%eax
     ad8:	74 15                	je     aef <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
     ada:	83 38 04             	cmpl   $0x4,(%eax)
     add:	75 f1                	jne    ad0 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
     adf:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
     ae5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
     ae8:	3d 88 2a 00 00       	cmp    $0x2a88,%eax
     aed:	75 eb                	jne    ada <uthread_exit+0xaa>
     aef:	bb ac 21 00 00       	mov    $0x21ac,%ebx
     af4:	eb 15                	jmp    b0b <uthread_exit+0xdb>
     af6:	8d 76 00             	lea    0x0(%esi),%esi
     af9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
     b00:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     b03:	81 fb 88 2a 00 00    	cmp    $0x2a88,%ebx
     b09:	74 24                	je     b2f <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
     b0b:	8b 03                	mov    (%ebx),%eax
     b0d:	85 c0                	test   %eax,%eax
     b0f:	74 ef                	je     b00 <uthread_exit+0xd0>
    sigsend(getpid(),14);
     b11:	e8 cc fa ff ff       	call   5e2 <getpid>
     b16:	83 ec 08             	sub    $0x8,%esp
     b19:	83 c3 24             	add    $0x24,%ebx
     b1c:	6a 0e                	push   $0xe
     b1e:	50                   	push   %eax
     b1f:	e8 e6 fa ff ff       	call   60a <sigsend>
     b24:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
     b27:	81 fb 88 2a 00 00    	cmp    $0x2a88,%ebx
     b2d:	75 dc                	jne    b0b <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
     b2f:	e8 2e fa ff ff       	call   562 <exit>
     b34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b40 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
     b40:	55                   	push   %ebp
     b41:	ba a8 2b 00 00       	mov    $0x2ba8,%edx
     b46:	89 e5                	mov    %esp,%ebp
     b48:	90                   	nop
     b49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b50:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
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
     b6b:	75 f3                	jne    b60 <init_bsem+0x20>
     b6d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     b73:	81 fa a8 b1 00 00    	cmp    $0xb1a8,%edx
     b79:	75 d5                	jne    b50 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     b7b:	c7 05 6c 1d 00 00 01 	movl   $0x1,0x1d6c
     b82:	00 00 00 
}
     b85:	5d                   	pop    %ebp
     b86:	c3                   	ret    
     b87:	89 f6                	mov    %esi,%esi
     b89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000b90 <bsem_alloc>:

int bsem_alloc() {
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	53                   	push   %ebx
     b94:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
     b97:	6a 00                	push   $0x0
     b99:	e8 7c fa ff ff       	call   61a <alarm>
  int i;
  if(first_run_bsem == 0)
     b9e:	a1 6c 1d 00 00       	mov    0x1d6c,%eax
     ba3:	83 c4 10             	add    $0x10,%esp
     ba6:	85 c0                	test   %eax,%eax
     ba8:	75 3b                	jne    be5 <bsem_alloc+0x55>
     baa:	ba a8 2b 00 00       	mov    $0x2ba8,%edx
     baf:	90                   	nop
     bb0:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
     bb6:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
     bbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
     bc0:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
     bc6:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
     bc9:	39 d0                	cmp    %edx,%eax
     bcb:	75 f3                	jne    bc0 <bsem_alloc+0x30>
     bcd:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
     bd3:	81 fa a8 b1 00 00    	cmp    $0xb1a8,%edx
     bd9:	75 d5                	jne    bb0 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
     bdb:	c7 05 6c 1d 00 00 01 	movl   $0x1,0x1d6c
     be2:	00 00 00 
     be5:	ba a8 2b 00 00       	mov    $0x2ba8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
     bea:	31 c0                	xor    %eax,%eax
     bec:	eb 10                	jmp    bfe <bsem_alloc+0x6e>
     bee:	83 c0 01             	add    $0x1,%eax
     bf1:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     bf7:	3d 80 00 00 00       	cmp    $0x80,%eax
     bfc:	74 4f                	je     c4d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
     bfe:	83 3a 01             	cmpl   $0x1,(%edx)
     c01:	75 eb                	jne    bee <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     c03:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     c09:	8b 15 48 1d 00 00    	mov    0x1d48,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     c0f:	83 ec 0c             	sub    $0xc,%esp
     c12:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
     c14:	8d 98 a0 2a 00 00    	lea    0x2aa0(%eax),%ebx
     c1a:	89 90 a4 2a 00 00    	mov    %edx,0x2aa4(%eax)
    binSemCounter++;
     c20:	83 c2 01             	add    $0x1,%edx
     c23:	89 15 48 1d 00 00    	mov    %edx,0x1d48
    binSemaphore[i].lock = 1; // not locked
     c29:	c7 80 a0 2a 00 00 01 	movl   $0x1,0x2aa0(%eax)
     c30:	00 00 00 
    binSemaphore[i].state = USED;
     c33:	c7 80 a8 2b 00 00 00 	movl   $0x0,0x2ba8(%eax)
     c3a:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
     c3d:	e8 d8 f9 ff ff       	call   61a <alarm>
    return binSemaphore[i].id;
     c42:	8b 43 04             	mov    0x4(%ebx),%eax
     c45:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
     c48:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c4b:	c9                   	leave  
     c4c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
     c4d:	83 ec 08             	sub    $0x8,%esp
     c50:	68 30 15 00 00       	push   $0x1530
     c55:	6a 01                	push   $0x1
     c57:	e8 74 fa ff ff       	call   6d0 <printf>
    alarm(UTHREAD_QUANTA);
     c5c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     c63:	e8 b2 f9 ff ff       	call   61a <alarm>
    return -1;
     c68:	83 c4 10             	add    $0x10,%esp
     c6b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
     c70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c73:	c9                   	leave  
     c74:	c3                   	ret    
     c75:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c80 <bsem_free>:

void bsem_free(int id) {
     c80:	55                   	push   %ebp
     c81:	89 e5                	mov    %esp,%ebp
     c83:	53                   	push   %ebx
     c84:	83 ec 10             	sub    $0x10,%esp
     c87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     c8a:	6a 00                	push   $0x0
     c8c:	e8 89 f9 ff ff       	call   61a <alarm>
     c91:	ba a4 2a 00 00       	mov    $0x2aa4,%edx
     c96:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     c99:	31 c0                	xor    %eax,%eax
     c9b:	eb 13                	jmp    cb0 <bsem_free+0x30>
     c9d:	8d 76 00             	lea    0x0(%esi),%esi
     ca0:	83 c0 01             	add    $0x1,%eax
     ca3:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     ca9:	3d 80 00 00 00       	cmp    $0x80,%eax
     cae:	74 38                	je     ce8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
     cb0:	39 1a                	cmp    %ebx,(%edx)
     cb2:	75 ec                	jne    ca0 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
     cb4:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     cba:	05 a0 2a 00 00       	add    $0x2aa0,%eax
     cbf:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
     cc6:	74 0a                	je     cd2 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
     cc8:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
     ccf:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     cd2:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     cd9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     cdc:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     cdd:	e9 38 f9 ff ff       	jmp    61a <alarm>
     ce2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
     ce8:	83 ec 04             	sub    $0x4,%esp
     ceb:	53                   	push   %ebx
     cec:	68 8c 16 00 00       	push   $0x168c
     cf1:	6a 01                	push   $0x1
     cf3:	e8 d8 f9 ff ff       	call   6d0 <printf>
     cf8:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     cfb:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
     d02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d05:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
     d06:	e9 0f f9 ff ff       	jmp    61a <alarm>
     d0b:	90                   	nop
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d10 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
     d10:	55                   	push   %ebp
     d11:	89 e5                	mov    %esp,%ebp
     d13:	53                   	push   %ebx
     d14:	83 ec 10             	sub    $0x10,%esp
     d17:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     d1a:	6a 00                	push   $0x0
     d1c:	e8 f9 f8 ff ff       	call   61a <alarm>
     d21:	b8 a4 2a 00 00       	mov    $0x2aa4,%eax
     d26:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     d29:	31 d2                	xor    %edx,%edx
     d2b:	eb 17                	jmp    d44 <bsem_down+0x34>
     d2d:	8d 76 00             	lea    0x0(%esi),%esi
     d30:	83 c2 01             	add    $0x1,%edx
     d33:	05 0c 01 00 00       	add    $0x10c,%eax
     d38:	81 fa 80 00 00 00    	cmp    $0x80,%edx
     d3e:	0f 84 8c 00 00 00    	je     dd0 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     d44:	39 18                	cmp    %ebx,(%eax)
     d46:	75 e8                	jne    d30 <bsem_down+0x20>
     d48:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
     d4e:	85 c9                	test   %ecx,%ecx
     d50:	75 de                	jne    d30 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
     d52:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
     d58:	31 c0                	xor    %eax,%eax
     d5a:	83 b9 a0 2a 00 00 01 	cmpl   $0x1,0x2aa0(%ecx)
     d61:	75 15                	jne    d78 <bsem_down+0x68>
     d63:	e9 93 00 00 00       	jmp    dfb <bsem_down+0xeb>
     d68:	90                   	nop
     d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
     d70:	83 c0 01             	add    $0x1,%eax
     d73:	83 f8 40             	cmp    $0x40,%eax
     d76:	74 7b                	je     df3 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
     d78:	83 bc 81 a8 2a 00 00 	cmpl   $0xffffffff,0x2aa8(%ecx,%eax,4)
     d7f:	ff 
     d80:	75 ee                	jne    d70 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
     d82:	8b 0d a8 b0 00 00    	mov    0xb0a8,%ecx
     d88:	6b d2 43             	imul   $0x43,%edx,%edx
     d8b:	01 c2                	add    %eax,%edx
     d8d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     d90:	8b 04 85 80 21 00 00 	mov    0x2180(,%eax,4),%eax
     d97:	89 04 95 a8 2a 00 00 	mov    %eax,0x2aa8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
     d9e:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
     da1:	c7 04 85 88 21 00 00 	movl   $0x4,0x2188(,%eax,4)
     da8:	04 00 00 00 

	 sigsend(getpid(),14);
     dac:	e8 31 f8 ff ff       	call   5e2 <getpid>
     db1:	83 ec 08             	sub    $0x8,%esp
     db4:	6a 0e                	push   $0xe
     db6:	50                   	push   %eax
     db7:	e8 4e f8 ff ff       	call   60a <sigsend>
     dbc:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     dbf:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     dc6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     dc9:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     dca:	e9 4b f8 ff ff       	jmp    61a <alarm>
     dcf:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
     dd0:	83 ec 04             	sub    $0x4,%esp
     dd3:	53                   	push   %ebx
     dd4:	68 50 15 00 00       	push   $0x1550
     dd9:	6a 01                	push   $0x1
     ddb:	e8 f0 f8 ff ff       	call   6d0 <printf>
     de0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
     de3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     dea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ded:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     dee:	e9 27 f8 ff ff       	jmp    61a <alarm>
     df3:	8b 0d a8 b0 00 00    	mov    0xb0a8,%ecx
     df9:	eb a3                	jmp    d9e <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
     dfb:	c7 81 a0 2a 00 00 00 	movl   $0x0,0x2aa0(%ecx)
     e02:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     e05:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
     e0c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e0f:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
     e10:	e9 05 f8 ff ff       	jmp    61a <alarm>
     e15:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     e19:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e20 <bsem_up>:
}

void bsem_up(int id) {
     e20:	55                   	push   %ebp
     e21:	89 e5                	mov    %esp,%ebp
     e23:	57                   	push   %edi
     e24:	56                   	push   %esi
     e25:	53                   	push   %ebx
     e26:	83 ec 28             	sub    $0x28,%esp
     e29:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
     e2c:	6a 00                	push   $0x0
     e2e:	e8 e7 f7 ff ff       	call   61a <alarm>
     e33:	ba a4 2a 00 00       	mov    $0x2aa4,%edx
     e38:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
     e3b:	31 c0                	xor    %eax,%eax
     e3d:	eb 15                	jmp    e54 <bsem_up+0x34>
     e3f:	90                   	nop
     e40:	83 c0 01             	add    $0x1,%eax
     e43:	81 c2 0c 01 00 00    	add    $0x10c,%edx
     e49:	3d 80 00 00 00       	cmp    $0x80,%eax
     e4e:	0f 84 ac 00 00 00    	je     f00 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
     e54:	39 1a                	cmp    %ebx,(%edx)
     e56:	75 e8                	jne    e40 <bsem_up+0x20>
     e58:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
     e5e:	85 c9                	test   %ecx,%ecx
     e60:	75 de                	jne    e40 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
     e62:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
     e68:	8b 97 a0 2a 00 00    	mov    0x2aa0(%edi),%edx
     e6e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
     e71:	85 d2                	test   %edx,%edx
     e73:	0f 85 9c 00 00 00    	jne    f15 <bsem_up+0xf5>
     e79:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
     e7b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
     e7e:	8b b4 be a8 2a 00 00 	mov    0x2aa8(%esi,%edi,4),%esi
     e85:	83 fe ff             	cmp    $0xffffffff,%esi
     e88:	74 56                	je     ee0 <bsem_up+0xc0>
     e8a:	b9 80 21 00 00       	mov    $0x2180,%ecx
     e8f:	31 d2                	xor    %edx,%edx
     e91:	eb 10                	jmp    ea3 <bsem_up+0x83>
     e93:	90                   	nop
     e94:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
     e98:	83 c2 01             	add    $0x1,%edx
     e9b:	83 c1 24             	add    $0x24,%ecx
     e9e:	83 fa 40             	cmp    $0x40,%edx
     ea1:	74 3d                	je     ee0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
     ea3:	8b 19                	mov    (%ecx),%ebx
     ea5:	39 de                	cmp    %ebx,%esi
     ea7:	75 ef                	jne    e98 <bsem_up+0x78>
     ea9:	83 fb ff             	cmp    $0xffffffff,%ebx
     eac:	74 ea                	je     e98 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
     eae:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
     eb1:	8d 14 d2             	lea    (%edx,%edx,8),%edx
     eb4:	c7 04 95 88 21 00 00 	movl   $0x2,0x2188(,%edx,4)
     ebb:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
     ebf:	01 c7                	add    %eax,%edi
     ec1:	c7 04 bd a8 2a 00 00 	movl   $0xffffffff,0x2aa8(,%edi,4)
     ec8:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     ecc:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
     ed3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     ed6:	5b                   	pop    %ebx
     ed7:	5e                   	pop    %esi
     ed8:	5f                   	pop    %edi
     ed9:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
     eda:	e9 3b f7 ff ff       	jmp    61a <alarm>
     edf:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
     ee0:	83 c7 01             	add    $0x1,%edi
     ee3:	83 ff 40             	cmp    $0x40,%edi
     ee6:	75 93                	jne    e7b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
     ee8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
     eee:	c7 80 a0 2a 00 00 01 	movl   $0x1,0x2aa0(%eax)
     ef5:	00 00 00 
     ef8:	eb d2                	jmp    ecc <bsem_up+0xac>
     efa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
     f00:	83 ec 04             	sub    $0x4,%esp
     f03:	53                   	push   %ebx
     f04:	68 b8 15 00 00       	push   $0x15b8
     f09:	6a 01                	push   $0x1
     f0b:	e8 c0 f7 ff ff       	call   6d0 <printf>
     f10:	83 c4 10             	add    $0x10,%esp
     f13:	eb b7                	jmp    ecc <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
     f15:	83 ec 08             	sub    $0x8,%esp
     f18:	68 94 15 00 00       	push   $0x1594
     f1d:	6a 01                	push   $0x1
     f1f:	e8 ac f7 ff ff       	call   6d0 <printf>
     f24:	83 c4 10             	add    $0x10,%esp
     f27:	eb a3                	jmp    ecc <bsem_up+0xac>
     f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f30 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
     f36:	68 fc 15 00 00       	push   $0x15fc
     f3b:	6a 01                	push   $0x1
     f3d:	e8 8e f7 ff ff       	call   6d0 <printf>
     f42:	b8 80 21 00 00       	mov    $0x2180,%eax
     f47:	83 c4 10             	add    $0x10,%esp
     f4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
     f50:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
     f56:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
     f5d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
     f60:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
     f67:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
     f6e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
     f75:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
     f7c:	3d 80 2a 00 00       	cmp    $0x2a80,%eax
     f81:	75 cd                	jne    f50 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     f83:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
     f86:	c7 05 80 21 00 00 00 	movl   $0x0,0x2180
     f8d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
     f90:	c7 05 88 21 00 00 03 	movl   $0x3,0x2188
     f97:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     f9a:	68 30 11 00 00       	push   $0x1130
     f9f:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
     fa1:	c7 05 84 21 00 00 00 	movl   $0x0,0x2184
     fa8:	00 00 00 

  id_number_thread = 1;
     fab:	c7 05 a4 b0 00 00 01 	movl   $0x1,0xb0a4
     fb2:	00 00 00 
  index_currently_running = 0;
     fb5:	c7 05 a8 b0 00 00 00 	movl   $0x0,0xb0a8
     fbc:	00 00 00 
  currently_running = 0;
     fbf:	c7 05 80 2a 00 00 00 	movl   $0x0,0x2a80
     fc6:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
     fc9:	e8 34 f6 ff ff       	call   602 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
     fce:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
     fd5:	e8 40 f6 ff ff       	call   61a <alarm>
  return 0;
}
     fda:	31 c0                	xor    %eax,%eax
     fdc:	c9                   	leave  
     fdd:	c3                   	ret    
     fde:	66 90                	xchg   %ax,%ax

00000fe0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
     fe0:	55                   	push   %ebp
     fe1:	89 e5                	mov    %esp,%ebp
     fe3:	56                   	push   %esi
     fe4:	53                   	push   %ebx
  alarm(0);
     fe5:	83 ec 0c             	sub    $0xc,%esp
     fe8:	6a 00                	push   $0x0
     fea:	e8 2b f6 ff ff       	call   61a <alarm>
  printf(1, "------ creating a new thread ------\n");
     fef:	5b                   	pop    %ebx
     ff0:	5e                   	pop    %esi
     ff1:	68 28 16 00 00       	push   $0x1628
     ff6:	6a 01                	push   $0x1
     ff8:	e8 d3 f6 ff ff       	call   6d0 <printf>
     ffd:	ba 88 21 00 00       	mov    $0x2188,%edx
    1002:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
    1005:	31 c0                	xor    %eax,%eax
    1007:	eb 12                	jmp    101b <uthread_create+0x3b>
    1009:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1010:	83 c0 01             	add    $0x1,%eax
    1013:	83 c2 24             	add    $0x24,%edx
    1016:	83 f8 40             	cmp    $0x40,%eax
    1019:	74 7d                	je     1098 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
    101b:	8b 0a                	mov    (%edx),%ecx
    101d:	85 c9                	test   %ecx,%ecx
    101f:	75 ef                	jne    1010 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    1021:	8b 15 a4 b0 00 00    	mov    0xb0a4,%edx
    1027:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    102a:	83 ec 0c             	sub    $0xc,%esp
    102d:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    1032:	c1 e3 02             	shl    $0x2,%ebx
    1035:	89 93 80 21 00 00    	mov    %edx,0x2180(%ebx)
  id_number_thread++;
    103b:	83 c2 01             	add    $0x1,%edx
    103e:	89 15 a4 b0 00 00    	mov    %edx,0xb0a4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1044:	e8 b7 f8 ff ff       	call   900 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1049:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
    104c:	c7 80 f4 0f 00 00 30 	movl   $0xa30,0xff4(%eax)
    1053:	0a 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1056:	89 83 84 21 00 00    	mov    %eax,0x2184(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
    105c:	c7 83 88 21 00 00 02 	movl   $0x2,0x2188(%ebx)
    1063:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1066:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
    106c:	8b 55 0c             	mov    0xc(%ebp),%edx
    106f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
    1075:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    107c:	e8 99 f5 ff ff       	call   61a <alarm>
  return   threads[free_thread].thread_id;
    1081:	8b 83 80 21 00 00    	mov    0x2180(%ebx),%eax
    1087:	83 c4 10             	add    $0x10,%esp
}
    108a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    108d:	5b                   	pop    %ebx
    108e:	5e                   	pop    %esi
    108f:	5d                   	pop    %ebp
    1090:	c3                   	ret    
    1091:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    1098:	83 ec 08             	sub    $0x8,%esp
    109b:	68 9e 16 00 00       	push   $0x169e
    10a0:	6a 01                	push   $0x1
    10a2:	e8 29 f6 ff ff       	call   6d0 <printf>
    alarm(UTHREAD_QUANTA);
    10a7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    10ae:	e8 67 f5 ff ff       	call   61a <alarm>
    return -1;
    10b3:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    10b6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
    10b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    10be:	5b                   	pop    %ebx
    10bf:	5e                   	pop    %esi
    10c0:	5d                   	pop    %ebp
    10c1:	c3                   	ret    
    10c2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000010d0 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
    10d0:	55                   	push   %ebp
    10d1:	89 e5                	mov    %esp,%ebp
    10d3:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
    10d6:	85 c0                	test   %eax,%eax
    10d8:	74 14                	je     10ee <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    10da:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10dd:	89 e2                	mov    %esp,%edx
    10df:	8d 04 85 80 21 00 00 	lea    0x2180(,%eax,4),%eax
    10e6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
    10e9:	89 ea                	mov    %ebp,%edx
    10eb:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    10ee:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
    10f3:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    10f6:	8d 04 85 80 21 00 00 	lea    0x2180(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    10fd:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    1100:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    1107:	85 d2                	test   %edx,%edx
    1109:	74 0d                	je     1118 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    110b:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
    110d:	8b 40 0c             	mov    0xc(%eax),%eax
    1110:	89 c5                	mov    %eax,%ebp
  }
  return;
}
    1112:	5d                   	pop    %ebp
    1113:	c3                   	ret    
    1114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    1118:	8b 40 04             	mov    0x4(%eax),%eax
    111b:	05 f4 0f 00 00       	add    $0xff4,%eax
    1120:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    1122:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
    1124:	b8 f0 09 00 00       	mov    $0x9f0,%eax
    1129:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
    112b:	5d                   	pop    %ebp
    112c:	c3                   	ret    
    112d:	8d 76 00             	lea    0x0(%esi),%esi

00001130 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
    1130:	55                   	push   %ebp
    1131:	89 e5                	mov    %esp,%ebp
    1133:	56                   	push   %esi
    1134:	53                   	push   %ebx
    1135:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
    1138:	83 ec 0c             	sub    $0xc,%esp
    113b:	6a 00                	push   $0x0
    113d:	e8 d8 f4 ff ff       	call   61a <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    1142:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
    1147:	83 c4 10             	add    $0x10,%esp
    114a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    114d:	8d 14 95 80 21 00 00 	lea    0x2180(,%edx,4),%edx
    1154:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
    1158:	75 0b                	jne    1165 <uthread_schedule+0x35>
    115a:	85 c0                	test   %eax,%eax
    115c:	74 07                	je     1165 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
    115e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
    1165:	bb 88 21 00 00       	mov    $0x2188,%ebx
    116a:	eb 0f                	jmp    117b <uthread_schedule+0x4b>
    116c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1170:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1173:	81 fb 88 2a 00 00    	cmp    $0x2a88,%ebx
    1179:	74 55                	je     11d0 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    117b:	83 3b 01             	cmpl   $0x1,(%ebx)
    117e:	75 f0                	jne    1170 <uthread_schedule+0x40>
    1180:	8b 73 14             	mov    0x14(%ebx),%esi
    1183:	85 f6                	test   %esi,%esi
    1185:	0f 85 a5 00 00 00    	jne    1230 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    118b:	8b 43 18             	mov    0x18(%ebx),%eax
    118e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1191:	74 dd                	je     1170 <uthread_schedule+0x40>
    1193:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    1196:	8b 14 95 88 21 00 00 	mov    0x2188(,%edx,4),%edx
    119d:	85 d2                	test   %edx,%edx
    119f:	75 cf                	jne    1170 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
    11a1:	50                   	push   %eax
    11a2:	ff 73 f8             	pushl  -0x8(%ebx)
    11a5:	83 c3 24             	add    $0x24,%ebx
    11a8:	68 50 16 00 00       	push   $0x1650
    11ad:	6a 01                	push   $0x1
    11af:	e8 1c f5 ff ff       	call   6d0 <printf>
      threads[i].join = -1;
    11b4:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
    11bb:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
    11c2:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    11c5:	81 fb 88 2a 00 00    	cmp    $0x2a88,%ebx
    11cb:	75 ae                	jne    117b <uthread_schedule+0x4b>
    11cd:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    11d0:	8b 15 a8 b0 00 00    	mov    0xb0a8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    11d6:	b9 40 00 00 00       	mov    $0x40,%ecx
    11db:	8d 42 01             	lea    0x1(%edx),%eax
    11de:	eb 08                	jmp    11e8 <uthread_schedule+0xb8>
    11e0:	83 c0 01             	add    $0x1,%eax
    11e3:	83 e9 01             	sub    $0x1,%ecx
    11e6:	74 78                	je     1260 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    11e8:	89 c3                	mov    %eax,%ebx
    11ea:	c1 fb 1f             	sar    $0x1f,%ebx
    11ed:	c1 eb 1a             	shr    $0x1a,%ebx
    11f0:	01 d8                	add    %ebx,%eax
    11f2:	83 e0 3f             	and    $0x3f,%eax
    11f5:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    11f7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    11fa:	83 3c 9d 88 21 00 00 	cmpl   $0x2,0x2188(,%ebx,4)
    1201:	02 
    1202:	75 dc                	jne    11e0 <uthread_schedule+0xb0>
    1204:	39 c2                	cmp    %eax,%edx
    1206:	74 d8                	je     11e0 <uthread_schedule+0xb0>
      index_currently_running = i;
    1208:	a3 a8 b0 00 00       	mov    %eax,0xb0a8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    120d:	83 ec 08             	sub    $0x8,%esp
    1210:	50                   	push   %eax
    1211:	52                   	push   %edx
    1212:	e8 b9 fe ff ff       	call   10d0 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    1217:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    121e:	e8 f7 f3 ff ff       	call   61a <alarm>
}
    1223:	8d 65 f8             	lea    -0x8(%ebp),%esp
    1226:	5b                   	pop    %ebx
    1227:	5e                   	pop    %esi
    1228:	5d                   	pop    %ebp
    1229:	c3                   	ret    
    122a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    1230:	e8 c5 f3 ff ff       	call   5fa <uptime>
    1235:	39 c6                	cmp    %eax,%esi
    1237:	7f 17                	jg     1250 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    1239:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    123f:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1246:	e9 25 ff ff ff       	jmp    1170 <uthread_schedule+0x40>
    124b:	90                   	nop
    124c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1250:	83 3b 01             	cmpl   $0x1,(%ebx)
    1253:	0f 84 32 ff ff ff    	je     118b <uthread_schedule+0x5b>
    1259:	e9 12 ff ff ff       	jmp    1170 <uthread_schedule+0x40>
    125e:	66 90                	xchg   %ax,%ax
    1260:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1263:	83 3c 85 88 21 00 00 	cmpl   $0x2,0x2188(,%eax,4)
    126a:	02 
    126b:	0f 85 c7 fe ff ff    	jne    1138 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1271:	89 d0                	mov    %edx,%eax
    1273:	eb 98                	jmp    120d <uthread_schedule+0xdd>
    1275:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1279:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001280 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1280:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
  exit();
}

int
uthread_self()
{
    1285:	55                   	push   %ebp
    1286:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    1288:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    128b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    128c:	8b 04 85 80 21 00 00 	mov    0x2180(,%eax,4),%eax
}
    1293:	c3                   	ret    
    1294:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    129a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000012a0 <uthread_join>:

int
uthread_join(int tid)
{
    12a0:	55                   	push   %ebp
    12a1:	89 e5                	mov    %esp,%ebp
    12a3:	56                   	push   %esi
    12a4:	53                   	push   %ebx
    12a5:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    12a8:	39 35 a4 b0 00 00    	cmp    %esi,0xb0a4
    12ae:	0f 8c ab 00 00 00    	jl     135f <uthread_join+0xbf>
    12b4:	89 f0                	mov    %esi,%eax
    12b6:	c1 e8 1f             	shr    $0x1f,%eax
    12b9:	84 c0                	test   %al,%al
    12bb:	0f 85 9e 00 00 00    	jne    135f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    12c1:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    12c4:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    12c6:	6a 00                	push   $0x0
    12c8:	e8 4d f3 ff ff       	call   61a <alarm>
    12cd:	b8 80 21 00 00       	mov    $0x2180,%eax
    12d2:	83 c4 10             	add    $0x10,%esp
    12d5:	eb 14                	jmp    12eb <uthread_join+0x4b>
    12d7:	89 f6                	mov    %esi,%esi
    12d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    12e0:	83 c3 01             	add    $0x1,%ebx
    12e3:	83 c0 24             	add    $0x24,%eax
    12e6:	83 fb 40             	cmp    $0x40,%ebx
    12e9:	74 55                	je     1340 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    12eb:	3b 30                	cmp    (%eax),%esi
    12ed:	75 f1                	jne    12e0 <uthread_join+0x40>
    12ef:	8b 50 08             	mov    0x8(%eax),%edx
    12f2:	85 d2                	test   %edx,%edx
    12f4:	74 ea                	je     12e0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    12f6:	53                   	push   %ebx
    12f7:	ff 35 a8 b0 00 00    	pushl  0xb0a8
    12fd:	68 da 16 00 00       	push   $0x16da
    1302:	6a 01                	push   $0x1
    1304:	e8 c7 f3 ff ff       	call   6d0 <printf>
    threads[index_currently_running].join=found_tid;
    1309:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
    130e:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1311:	8d 04 85 80 21 00 00 	lea    0x2180(,%eax,4),%eax
    1318:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    131b:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1322:	e8 bb f2 ff ff       	call   5e2 <getpid>
    1327:	5a                   	pop    %edx
    1328:	59                   	pop    %ecx
    1329:	6a 0e                	push   $0xe
    132b:	50                   	push   %eax
    132c:	e8 d9 f2 ff ff       	call   60a <sigsend>
  }
  return 0;
    1331:	83 c4 10             	add    $0x10,%esp

}
    1334:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1337:	31 c0                	xor    %eax,%eax

}
    1339:	5b                   	pop    %ebx
    133a:	5e                   	pop    %esi
    133b:	5d                   	pop    %ebp
    133c:	c3                   	ret    
    133d:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1340:	83 ec 04             	sub    $0x4,%esp
    1343:	56                   	push   %esi
    1344:	68 bc 16 00 00       	push   $0x16bc
    1349:	6a 01                	push   $0x1
    134b:	e8 80 f3 ff ff       	call   6d0 <printf>
    alarm(UTHREAD_QUANTA);
    1350:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1357:	e8 be f2 ff ff       	call   61a <alarm>
    return -1;
    135c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    135f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1362:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1367:	5b                   	pop    %ebx
    1368:	5e                   	pop    %esi
    1369:	5d                   	pop    %ebp
    136a:	c3                   	ret    
    136b:	90                   	nop
    136c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001370 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1370:	55                   	push   %ebp
    1371:	89 e5                	mov    %esp,%ebp
    1373:	53                   	push   %ebx
    1374:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1377:	6a 00                	push   $0x0
    1379:	e8 9c f2 ff ff       	call   61a <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    137e:	8b 1d a8 b0 00 00    	mov    0xb0a8,%ebx
    1384:	e8 71 f2 ff ff       	call   5fa <uptime>
    1389:	03 45 08             	add    0x8(%ebp),%eax
    138c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    138f:	89 04 95 9c 21 00 00 	mov    %eax,0x219c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    1396:	a1 a8 b0 00 00       	mov    0xb0a8,%eax
    139b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    139e:	c7 04 85 88 21 00 00 	movl   $0x1,0x2188(,%eax,4)
    13a5:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    13a9:	e8 34 f2 ff ff       	call   5e2 <getpid>
    13ae:	5a                   	pop    %edx
    13af:	59                   	pop    %ecx
    13b0:	6a 0e                	push   $0xe
    13b2:	50                   	push   %eax
    13b3:	e8 52 f2 ff ff       	call   60a <sigsend>
  return 0;
}
    13b8:	31 c0                	xor    %eax,%eax
    13ba:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13bd:	c9                   	leave  
    13be:	c3                   	ret    
    13bf:	90                   	nop

000013c0 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    13c0:	55                   	push   %ebp
    13c1:	89 e5                	mov    %esp,%ebp
    13c3:	53                   	push   %ebx
    13c4:	83 ec 04             	sub    $0x4,%esp
    13c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    13ca:	8b 45 0c             	mov    0xc(%ebp),%eax
    13cd:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    13d0:	e8 bb f7 ff ff       	call   b90 <bsem_alloc>
    13d5:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    13d7:	e8 b4 f7 ff ff       	call   b90 <bsem_alloc>
    13dc:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    13df:	83 c4 04             	add    $0x4,%esp
    13e2:	5b                   	pop    %ebx
    13e3:	5d                   	pop    %ebp
    13e4:	c3                   	ret    
    13e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    13e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000013f0 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    13f0:	55                   	push   %ebp
    13f1:	89 e5                	mov    %esp,%ebp
    13f3:	53                   	push   %ebx
    13f4:	83 ec 10             	sub    $0x10,%esp
    13f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    13fa:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1401:	ff 33                	pushl  (%ebx)
    1403:	e8 78 f8 ff ff       	call   c80 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1408:	8b 43 04             	mov    0x4(%ebx),%eax
    140b:	83 c4 10             	add    $0x10,%esp
}
    140e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1411:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1414:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1415:	e9 66 f8 ff ff       	jmp    c80 <bsem_free>
    141a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001420 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1420:	55                   	push   %ebp
    1421:	89 e5                	mov    %esp,%ebp
    1423:	53                   	push   %ebx
    1424:	83 ec 10             	sub    $0x10,%esp
    1427:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    142a:	ff 73 04             	pushl  0x4(%ebx)
    142d:	e8 de f8 ff ff       	call   d10 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1432:	58                   	pop    %eax
    1433:	ff 33                	pushl  (%ebx)
    1435:	e8 d6 f8 ff ff       	call   d10 <bsem_down>
  csem->value--;
    143a:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    143d:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1440:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1443:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1445:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1448:	7e 0e                	jle    1458 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    144a:	83 ec 0c             	sub    $0xc,%esp
    144d:	ff 73 04             	pushl  0x4(%ebx)
    1450:	e8 cb f9 ff ff       	call   e20 <bsem_up>
    1455:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1458:	8b 03                	mov    (%ebx),%eax
}
    145a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    145d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1460:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1461:	e9 ba f9 ff ff       	jmp    e20 <bsem_up>
    1466:	8d 76 00             	lea    0x0(%esi),%esi
    1469:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001470 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1470:	55                   	push   %ebp
    1471:	89 e5                	mov    %esp,%ebp
    1473:	53                   	push   %ebx
    1474:	83 ec 10             	sub    $0x10,%esp
    1477:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    147a:	ff 33                	pushl  (%ebx)
    147c:	e8 8f f8 ff ff       	call   d10 <bsem_down>
  csem->value++;
    1481:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1484:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1487:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    148a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    148d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1490:	74 0e                	je     14a0 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1492:	8b 03                	mov    (%ebx),%eax
}
    1494:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1497:	89 45 08             	mov    %eax,0x8(%ebp)
}
    149a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    149b:	e9 80 f9 ff ff       	jmp    e20 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    14a0:	83 ec 0c             	sub    $0xc,%esp
    14a3:	ff 73 04             	pushl  0x4(%ebx)
    14a6:	e8 75 f9 ff ff       	call   e20 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    14ab:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    14ad:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    14b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14b3:	89 45 08             	mov    %eax,0x8(%ebp)
}
    14b6:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    14b7:	e9 64 f9 ff ff       	jmp    e20 <bsem_up>
