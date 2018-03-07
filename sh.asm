
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

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
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	90                   	nop
      14:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f c3 00 00 00    	jg     e4 <main+0xe4>
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 1d 1d 00 00       	push   $0x1d1d
      2b:	e8 32 0d 00 00       	call   d62 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d 02 28 00 00 20 	cmpb   $0x20,0x2802
      47:	74 5d                	je     a6 <main+0xa6>
      49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 c5 0c 00 00       	call   d1a <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	74 3f                	je     99 <main+0x99>
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      5a:	85 c0                	test   %eax,%eax
      5c:	0f 84 98 00 00 00    	je     fa <main+0xfa>
      runcmd(parsecmd(buf));
    wait();
      62:	e8 c3 0c 00 00       	call   d2a <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	6a 64                	push   $0x64
      6c:	68 00 28 00 00       	push   $0x2800
      71:	e8 9a 00 00 00       	call   110 <getcmd>
      76:	83 c4 10             	add    $0x10,%esp
      79:	85 c0                	test   %eax,%eax
      7b:	78 78                	js     f5 <main+0xf5>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      7d:	80 3d 00 28 00 00 63 	cmpb   $0x63,0x2800
      84:	75 ca                	jne    50 <main+0x50>
      86:	80 3d 01 28 00 00 64 	cmpb   $0x64,0x2801
      8d:	74 b1                	je     40 <main+0x40>
int
fork1(void)
{
  int pid;

  pid = fork();
      8f:	e8 86 0c 00 00       	call   d1a <fork>
  if(pid == -1)
      94:	83 f8 ff             	cmp    $0xffffffff,%eax
      97:	75 c1                	jne    5a <main+0x5a>
    panic("fork");
      99:	83 ec 0c             	sub    $0xc,%esp
      9c:	68 a6 1c 00 00       	push   $0x1ca6
      a1:	e8 ba 00 00 00       	call   160 <panic>

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      a6:	83 ec 0c             	sub    $0xc,%esp
      a9:	68 00 28 00 00       	push   $0x2800
      ae:	e8 ad 0a 00 00       	call   b60 <strlen>
      if(chdir(buf+3) < 0)
      b3:	c7 04 24 03 28 00 00 	movl   $0x2803,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      ba:	c6 80 ff 27 00 00 00 	movb   $0x0,0x27ff(%eax)
      if(chdir(buf+3) < 0)
      c1:	e8 cc 0c 00 00       	call   d92 <chdir>
      c6:	83 c4 10             	add    $0x10,%esp
      c9:	85 c0                	test   %eax,%eax
      cb:	79 9a                	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
      cd:	50                   	push   %eax
      ce:	68 03 28 00 00       	push   $0x2803
      d3:	68 25 1d 00 00       	push   $0x1d25
      d8:	6a 02                	push   $0x2
      da:	e8 b1 0d 00 00       	call   e90 <printf>
      df:	83 c4 10             	add    $0x10,%esp
      e2:	eb 83                	jmp    67 <main+0x67>
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      e4:	83 ec 0c             	sub    $0xc,%esp
      e7:	50                   	push   %eax
      e8:	e8 5d 0c 00 00       	call   d4a <close>
      break;
      ed:	83 c4 10             	add    $0x10,%esp
      f0:	e9 72 ff ff ff       	jmp    67 <main+0x67>
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
      f5:	e8 28 0c 00 00       	call   d22 <exit>
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
      fa:	83 ec 0c             	sub    $0xc,%esp
      fd:	68 00 28 00 00       	push   $0x2800
     102:	e8 69 09 00 00       	call   a70 <parsecmd>
     107:	89 04 24             	mov    %eax,(%esp)
     10a:	e8 71 00 00 00       	call   180 <runcmd>
     10f:	90                   	nop

00000110 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     110:	55                   	push   %ebp
     111:	89 e5                	mov    %esp,%ebp
     113:	56                   	push   %esi
     114:	53                   	push   %ebx
     115:	8b 75 0c             	mov    0xc(%ebp),%esi
     118:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(2, "$ ");
     11b:	83 ec 08             	sub    $0x8,%esp
     11e:	68 7c 1c 00 00       	push   $0x1c7c
     123:	6a 02                	push   $0x2
     125:	e8 66 0d 00 00       	call   e90 <printf>
  memset(buf, 0, nbuf);
     12a:	83 c4 0c             	add    $0xc,%esp
     12d:	56                   	push   %esi
     12e:	6a 00                	push   $0x0
     130:	53                   	push   %ebx
     131:	e8 5a 0a 00 00       	call   b90 <memset>
  gets(buf, nbuf);
     136:	58                   	pop    %eax
     137:	5a                   	pop    %edx
     138:	56                   	push   %esi
     139:	53                   	push   %ebx
     13a:	e8 b1 0a 00 00       	call   bf0 <gets>
     13f:	83 c4 10             	add    $0x10,%esp
     142:	31 c0                	xor    %eax,%eax
     144:	80 3b 00             	cmpb   $0x0,(%ebx)
     147:	0f 94 c0             	sete   %al
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}
     14a:	8d 65 f8             	lea    -0x8(%ebp),%esp
     14d:	f7 d8                	neg    %eax
     14f:	5b                   	pop    %ebx
     150:	5e                   	pop    %esi
     151:	5d                   	pop    %ebp
     152:	c3                   	ret    
     153:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <panic>:
  exit();
}

void
panic(char *s)
{
     160:	55                   	push   %ebp
     161:	89 e5                	mov    %esp,%ebp
     163:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     166:	ff 75 08             	pushl  0x8(%ebp)
     169:	68 19 1d 00 00       	push   $0x1d19
     16e:	6a 02                	push   $0x2
     170:	e8 1b 0d 00 00       	call   e90 <printf>
  exit();
     175:	e8 a8 0b 00 00       	call   d22 <exit>
     17a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000180 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     180:	55                   	push   %ebp
     181:	89 e5                	mov    %esp,%ebp
     183:	53                   	push   %ebx
     184:	83 ec 14             	sub    $0x14,%esp
     187:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     18a:	85 db                	test   %ebx,%ebx
     18c:	74 76                	je     204 <runcmd+0x84>
    exit();

  switch(cmd->type){
     18e:	83 3b 05             	cmpl   $0x5,(%ebx)
     191:	0f 87 f8 00 00 00    	ja     28f <runcmd+0x10f>
     197:	8b 03                	mov    (%ebx),%eax
     199:	ff 24 85 34 1d 00 00 	jmp    *0x1d34(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     1a0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     1a3:	83 ec 0c             	sub    $0xc,%esp
     1a6:	50                   	push   %eax
     1a7:	e8 86 0b 00 00       	call   d32 <pipe>
     1ac:	83 c4 10             	add    $0x10,%esp
     1af:	85 c0                	test   %eax,%eax
     1b1:	0f 88 07 01 00 00    	js     2be <runcmd+0x13e>
int
fork1(void)
{
  int pid;

  pid = fork();
     1b7:	e8 5e 0b 00 00       	call   d1a <fork>
  if(pid == -1)
     1bc:	83 f8 ff             	cmp    $0xffffffff,%eax
     1bf:	0f 84 d7 00 00 00    	je     29c <runcmd+0x11c>

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
     1c5:	85 c0                	test   %eax,%eax
     1c7:	0f 84 fe 00 00 00    	je     2cb <runcmd+0x14b>
int
fork1(void)
{
  int pid;

  pid = fork();
     1cd:	e8 48 0b 00 00       	call   d1a <fork>
  if(pid == -1)
     1d2:	83 f8 ff             	cmp    $0xffffffff,%eax
     1d5:	0f 84 c1 00 00 00    	je     29c <runcmd+0x11c>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     1db:	85 c0                	test   %eax,%eax
     1dd:	0f 84 16 01 00 00    	je     2f9 <runcmd+0x179>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     1e3:	83 ec 0c             	sub    $0xc,%esp
     1e6:	ff 75 f0             	pushl  -0x10(%ebp)
     1e9:	e8 5c 0b 00 00       	call   d4a <close>
    close(p[1]);
     1ee:	58                   	pop    %eax
     1ef:	ff 75 f4             	pushl  -0xc(%ebp)
     1f2:	e8 53 0b 00 00       	call   d4a <close>
    wait();
     1f7:	e8 2e 0b 00 00       	call   d2a <wait>
    wait();
     1fc:	e8 29 0b 00 00       	call   d2a <wait>
    break;
     201:	83 c4 10             	add    $0x10,%esp
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    exit();
     204:	e8 19 0b 00 00       	call   d22 <exit>
int
fork1(void)
{
  int pid;

  pid = fork();
     209:	e8 0c 0b 00 00       	call   d1a <fork>
  if(pid == -1)
     20e:	83 f8 ff             	cmp    $0xffffffff,%eax
     211:	0f 84 85 00 00 00    	je     29c <runcmd+0x11c>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     217:	85 c0                	test   %eax,%eax
     219:	75 e9                	jne    204 <runcmd+0x84>
     21b:	eb 49                	jmp    266 <runcmd+0xe6>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     21d:	8b 43 04             	mov    0x4(%ebx),%eax
     220:	85 c0                	test   %eax,%eax
     222:	74 e0                	je     204 <runcmd+0x84>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     224:	52                   	push   %edx
     225:	52                   	push   %edx
     226:	8d 53 04             	lea    0x4(%ebx),%edx
     229:	52                   	push   %edx
     22a:	50                   	push   %eax
     22b:	e8 2a 0b 00 00       	call   d5a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     230:	83 c4 0c             	add    $0xc,%esp
     233:	ff 73 04             	pushl  0x4(%ebx)
     236:	68 86 1c 00 00       	push   $0x1c86
     23b:	6a 02                	push   $0x2
     23d:	e8 4e 0c 00 00       	call   e90 <printf>
    break;
     242:	83 c4 10             	add    $0x10,%esp
     245:	eb bd                	jmp    204 <runcmd+0x84>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     247:	83 ec 0c             	sub    $0xc,%esp
     24a:	ff 73 14             	pushl  0x14(%ebx)
     24d:	e8 f8 0a 00 00       	call   d4a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     252:	59                   	pop    %ecx
     253:	58                   	pop    %eax
     254:	ff 73 10             	pushl  0x10(%ebx)
     257:	ff 73 08             	pushl  0x8(%ebx)
     25a:	e8 03 0b 00 00       	call   d62 <open>
     25f:	83 c4 10             	add    $0x10,%esp
     262:	85 c0                	test   %eax,%eax
     264:	78 43                	js     2a9 <runcmd+0x129>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     266:	83 ec 0c             	sub    $0xc,%esp
     269:	ff 73 04             	pushl  0x4(%ebx)
     26c:	e8 0f ff ff ff       	call   180 <runcmd>
int
fork1(void)
{
  int pid;

  pid = fork();
     271:	e8 a4 0a 00 00       	call   d1a <fork>
  if(pid == -1)
     276:	83 f8 ff             	cmp    $0xffffffff,%eax
     279:	74 21                	je     29c <runcmd+0x11c>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     27b:	85 c0                	test   %eax,%eax
     27d:	74 e7                	je     266 <runcmd+0xe6>
      runcmd(lcmd->left);
    wait();
     27f:	e8 a6 0a 00 00       	call   d2a <wait>
    runcmd(lcmd->right);
     284:	83 ec 0c             	sub    $0xc,%esp
     287:	ff 73 08             	pushl  0x8(%ebx)
     28a:	e8 f1 fe ff ff       	call   180 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     28f:	83 ec 0c             	sub    $0xc,%esp
     292:	68 7f 1c 00 00       	push   $0x1c7f
     297:	e8 c4 fe ff ff       	call   160 <panic>
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     29c:	83 ec 0c             	sub    $0xc,%esp
     29f:	68 a6 1c 00 00       	push   $0x1ca6
     2a4:	e8 b7 fe ff ff       	call   160 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     2a9:	52                   	push   %edx
     2aa:	ff 73 08             	pushl  0x8(%ebx)
     2ad:	68 96 1c 00 00       	push   $0x1c96
     2b2:	6a 02                	push   $0x2
     2b4:	e8 d7 0b 00 00       	call   e90 <printf>
      exit();
     2b9:	e8 64 0a 00 00       	call   d22 <exit>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     2be:	83 ec 0c             	sub    $0xc,%esp
     2c1:	68 ab 1c 00 00       	push   $0x1cab
     2c6:	e8 95 fe ff ff       	call   160 <panic>
    if(fork1() == 0){
      close(1);
     2cb:	83 ec 0c             	sub    $0xc,%esp
     2ce:	6a 01                	push   $0x1
     2d0:	e8 75 0a 00 00       	call   d4a <close>
      dup(p[1]);
     2d5:	58                   	pop    %eax
     2d6:	ff 75 f4             	pushl  -0xc(%ebp)
     2d9:	e8 bc 0a 00 00       	call   d9a <dup>
      close(p[0]);
     2de:	58                   	pop    %eax
     2df:	ff 75 f0             	pushl  -0x10(%ebp)
     2e2:	e8 63 0a 00 00       	call   d4a <close>
      close(p[1]);
     2e7:	58                   	pop    %eax
     2e8:	ff 75 f4             	pushl  -0xc(%ebp)
     2eb:	e8 5a 0a 00 00       	call   d4a <close>
      runcmd(pcmd->left);
     2f0:	58                   	pop    %eax
     2f1:	ff 73 04             	pushl  0x4(%ebx)
     2f4:	e8 87 fe ff ff       	call   180 <runcmd>
    }
    if(fork1() == 0){
      close(0);
     2f9:	83 ec 0c             	sub    $0xc,%esp
     2fc:	6a 00                	push   $0x0
     2fe:	e8 47 0a 00 00       	call   d4a <close>
      dup(p[0]);
     303:	5a                   	pop    %edx
     304:	ff 75 f0             	pushl  -0x10(%ebp)
     307:	e8 8e 0a 00 00       	call   d9a <dup>
      close(p[0]);
     30c:	59                   	pop    %ecx
     30d:	ff 75 f0             	pushl  -0x10(%ebp)
     310:	e8 35 0a 00 00       	call   d4a <close>
      close(p[1]);
     315:	58                   	pop    %eax
     316:	ff 75 f4             	pushl  -0xc(%ebp)
     319:	e8 2c 0a 00 00       	call   d4a <close>
      runcmd(pcmd->right);
     31e:	58                   	pop    %eax
     31f:	ff 73 08             	pushl  0x8(%ebx)
     322:	e8 59 fe ff ff       	call   180 <runcmd>
     327:	89 f6                	mov    %esi,%esi
     329:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000330 <fork1>:
  exit();
}

int
fork1(void)
{
     330:	55                   	push   %ebp
     331:	89 e5                	mov    %esp,%ebp
     333:	83 ec 08             	sub    $0x8,%esp
  int pid;

  pid = fork();
     336:	e8 df 09 00 00       	call   d1a <fork>
  if(pid == -1)
     33b:	83 f8 ff             	cmp    $0xffffffff,%eax
     33e:	74 02                	je     342 <fork1+0x12>
    panic("fork");
  return pid;
}
     340:	c9                   	leave  
     341:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     342:	83 ec 0c             	sub    $0xc,%esp
     345:	68 a6 1c 00 00       	push   $0x1ca6
     34a:	e8 11 fe ff ff       	call   160 <panic>
     34f:	90                   	nop

00000350 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     350:	55                   	push   %ebp
     351:	89 e5                	mov    %esp,%ebp
     353:	53                   	push   %ebx
     354:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     357:	6a 54                	push   $0x54
     359:	e8 62 0d 00 00       	call   10c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     35e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     361:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     363:	6a 54                	push   $0x54
     365:	6a 00                	push   $0x0
     367:	50                   	push   %eax
     368:	e8 23 08 00 00       	call   b90 <memset>
  cmd->type = EXEC;
     36d:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     373:	89 d8                	mov    %ebx,%eax
     375:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     378:	c9                   	leave  
     379:	c3                   	ret    
     37a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000380 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     380:	55                   	push   %ebp
     381:	89 e5                	mov    %esp,%ebp
     383:	53                   	push   %ebx
     384:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     387:	6a 18                	push   $0x18
     389:	e8 32 0d 00 00       	call   10c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     38e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     391:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     393:	6a 18                	push   $0x18
     395:	6a 00                	push   $0x0
     397:	50                   	push   %eax
     398:	e8 f3 07 00 00       	call   b90 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     39d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     3a0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     3a6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3ac:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     3af:	8b 45 10             	mov    0x10(%ebp),%eax
     3b2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     3b5:	8b 45 14             	mov    0x14(%ebp),%eax
     3b8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     3bb:	8b 45 18             	mov    0x18(%ebp),%eax
     3be:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     3c1:	89 d8                	mov    %ebx,%eax
     3c3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3c6:	c9                   	leave  
     3c7:	c3                   	ret    
     3c8:	90                   	nop
     3c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000003d0 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     3d0:	55                   	push   %ebp
     3d1:	89 e5                	mov    %esp,%ebp
     3d3:	53                   	push   %ebx
     3d4:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3d7:	6a 0c                	push   $0xc
     3d9:	e8 e2 0c 00 00       	call   10c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3de:	83 c4 0c             	add    $0xc,%esp
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e1:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3e3:	6a 0c                	push   $0xc
     3e5:	6a 00                	push   $0x0
     3e7:	50                   	push   %eax
     3e8:	e8 a3 07 00 00       	call   b90 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     3ed:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     3f0:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     3f6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3fc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3ff:	89 d8                	mov    %ebx,%eax
     401:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     404:	c9                   	leave  
     405:	c3                   	ret    
     406:	8d 76 00             	lea    0x0(%esi),%esi
     409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000410 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	53                   	push   %ebx
     414:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     417:	6a 0c                	push   $0xc
     419:	e8 a2 0c 00 00       	call   10c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     41e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     421:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     423:	6a 0c                	push   $0xc
     425:	6a 00                	push   $0x0
     427:	50                   	push   %eax
     428:	e8 63 07 00 00       	call   b90 <memset>
  cmd->type = LIST;
  cmd->left = left;
     42d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     430:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     436:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     439:	8b 45 0c             	mov    0xc(%ebp),%eax
     43c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     43f:	89 d8                	mov    %ebx,%eax
     441:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     444:	c9                   	leave  
     445:	c3                   	ret    
     446:	8d 76 00             	lea    0x0(%esi),%esi
     449:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000450 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     450:	55                   	push   %ebp
     451:	89 e5                	mov    %esp,%ebp
     453:	53                   	push   %ebx
     454:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     457:	6a 08                	push   $0x8
     459:	e8 62 0c 00 00       	call   10c0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     45e:	83 c4 0c             	add    $0xc,%esp
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     461:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     463:	6a 08                	push   $0x8
     465:	6a 00                	push   $0x0
     467:	50                   	push   %eax
     468:	e8 23 07 00 00       	call   b90 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     46d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     470:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     476:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     479:	89 d8                	mov    %ebx,%eax
     47b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     47e:	c9                   	leave  
     47f:	c3                   	ret    

00000480 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     480:	55                   	push   %ebp
     481:	89 e5                	mov    %esp,%ebp
     483:	57                   	push   %edi
     484:	56                   	push   %esi
     485:	53                   	push   %ebx
     486:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     489:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     48c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     48f:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     492:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     494:	39 df                	cmp    %ebx,%edi
     496:	72 13                	jb     4ab <gettoken+0x2b>
     498:	eb 29                	jmp    4c3 <gettoken+0x43>
     49a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     4a0:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     4a3:	39 fb                	cmp    %edi,%ebx
     4a5:	0f 84 ed 00 00 00    	je     598 <gettoken+0x118>
     4ab:	0f be 07             	movsbl (%edi),%eax
     4ae:	83 ec 08             	sub    $0x8,%esp
     4b1:	50                   	push   %eax
     4b2:	68 e4 27 00 00       	push   $0x27e4
     4b7:	e8 f4 06 00 00       	call   bb0 <strchr>
     4bc:	83 c4 10             	add    $0x10,%esp
     4bf:	85 c0                	test   %eax,%eax
     4c1:	75 dd                	jne    4a0 <gettoken+0x20>
    s++;
  if(q)
     4c3:	85 f6                	test   %esi,%esi
     4c5:	74 02                	je     4c9 <gettoken+0x49>
    *q = s;
     4c7:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     4c9:	0f be 37             	movsbl (%edi),%esi
     4cc:	89 f1                	mov    %esi,%ecx
     4ce:	89 f0                	mov    %esi,%eax
  switch(*s){
     4d0:	80 f9 29             	cmp    $0x29,%cl
     4d3:	7f 5b                	jg     530 <gettoken+0xb0>
     4d5:	80 f9 28             	cmp    $0x28,%cl
     4d8:	7d 61                	jge    53b <gettoken+0xbb>
     4da:	84 c9                	test   %cl,%cl
     4dc:	0f 85 de 00 00 00    	jne    5c0 <gettoken+0x140>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     4e2:	8b 55 14             	mov    0x14(%ebp),%edx
     4e5:	85 d2                	test   %edx,%edx
     4e7:	74 05                	je     4ee <gettoken+0x6e>
    *eq = s;
     4e9:	8b 45 14             	mov    0x14(%ebp),%eax
     4ec:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     4ee:	39 fb                	cmp    %edi,%ebx
     4f0:	77 0d                	ja     4ff <gettoken+0x7f>
     4f2:	eb 23                	jmp    517 <gettoken+0x97>
     4f4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    s++;
     4f8:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     4fb:	39 fb                	cmp    %edi,%ebx
     4fd:	74 18                	je     517 <gettoken+0x97>
     4ff:	0f be 07             	movsbl (%edi),%eax
     502:	83 ec 08             	sub    $0x8,%esp
     505:	50                   	push   %eax
     506:	68 e4 27 00 00       	push   $0x27e4
     50b:	e8 a0 06 00 00       	call   bb0 <strchr>
     510:	83 c4 10             	add    $0x10,%esp
     513:	85 c0                	test   %eax,%eax
     515:	75 e1                	jne    4f8 <gettoken+0x78>
    s++;
  *ps = s;
     517:	8b 45 08             	mov    0x8(%ebp),%eax
     51a:	89 38                	mov    %edi,(%eax)
  return ret;
}
     51c:	8d 65 f4             	lea    -0xc(%ebp),%esp
     51f:	89 f0                	mov    %esi,%eax
     521:	5b                   	pop    %ebx
     522:	5e                   	pop    %esi
     523:	5f                   	pop    %edi
     524:	5d                   	pop    %ebp
     525:	c3                   	ret    
     526:	8d 76 00             	lea    0x0(%esi),%esi
     529:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     530:	80 f9 3e             	cmp    $0x3e,%cl
     533:	75 0b                	jne    540 <gettoken+0xc0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     535:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     539:	74 75                	je     5b0 <gettoken+0x130>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     53b:	83 c7 01             	add    $0x1,%edi
     53e:	eb a2                	jmp    4e2 <gettoken+0x62>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     540:	7f 5e                	jg     5a0 <gettoken+0x120>
     542:	83 e9 3b             	sub    $0x3b,%ecx
     545:	80 f9 01             	cmp    $0x1,%cl
     548:	76 f1                	jbe    53b <gettoken+0xbb>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     54a:	39 fb                	cmp    %edi,%ebx
     54c:	77 24                	ja     572 <gettoken+0xf2>
     54e:	eb 7c                	jmp    5cc <gettoken+0x14c>
     550:	0f be 07             	movsbl (%edi),%eax
     553:	83 ec 08             	sub    $0x8,%esp
     556:	50                   	push   %eax
     557:	68 dc 27 00 00       	push   $0x27dc
     55c:	e8 4f 06 00 00       	call   bb0 <strchr>
     561:	83 c4 10             	add    $0x10,%esp
     564:	85 c0                	test   %eax,%eax
     566:	75 1f                	jne    587 <gettoken+0x107>
      s++;
     568:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     56b:	39 fb                	cmp    %edi,%ebx
     56d:	74 5b                	je     5ca <gettoken+0x14a>
     56f:	0f be 07             	movsbl (%edi),%eax
     572:	83 ec 08             	sub    $0x8,%esp
     575:	50                   	push   %eax
     576:	68 e4 27 00 00       	push   $0x27e4
     57b:	e8 30 06 00 00       	call   bb0 <strchr>
     580:	83 c4 10             	add    $0x10,%esp
     583:	85 c0                	test   %eax,%eax
     585:	74 c9                	je     550 <gettoken+0xd0>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     587:	be 61 00 00 00       	mov    $0x61,%esi
     58c:	e9 51 ff ff ff       	jmp    4e2 <gettoken+0x62>
     591:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     598:	89 df                	mov    %ebx,%edi
     59a:	e9 24 ff ff ff       	jmp    4c3 <gettoken+0x43>
     59f:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5a0:	80 f9 7c             	cmp    $0x7c,%cl
     5a3:	74 96                	je     53b <gettoken+0xbb>
     5a5:	eb a3                	jmp    54a <gettoken+0xca>
     5a7:	89 f6                	mov    %esi,%esi
     5a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     5b0:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     5b3:	be 2b 00 00 00       	mov    $0x2b,%esi
     5b8:	e9 25 ff ff ff       	jmp    4e2 <gettoken+0x62>
     5bd:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     5c0:	80 f9 26             	cmp    $0x26,%cl
     5c3:	75 85                	jne    54a <gettoken+0xca>
     5c5:	e9 71 ff ff ff       	jmp    53b <gettoken+0xbb>
     5ca:	89 df                	mov    %ebx,%edi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     5cc:	8b 45 14             	mov    0x14(%ebp),%eax
     5cf:	be 61 00 00 00       	mov    $0x61,%esi
     5d4:	85 c0                	test   %eax,%eax
     5d6:	0f 85 0d ff ff ff    	jne    4e9 <gettoken+0x69>
     5dc:	e9 36 ff ff ff       	jmp    517 <gettoken+0x97>
     5e1:	eb 0d                	jmp    5f0 <peek>
     5e3:	90                   	nop
     5e4:	90                   	nop
     5e5:	90                   	nop
     5e6:	90                   	nop
     5e7:	90                   	nop
     5e8:	90                   	nop
     5e9:	90                   	nop
     5ea:	90                   	nop
     5eb:	90                   	nop
     5ec:	90                   	nop
     5ed:	90                   	nop
     5ee:	90                   	nop
     5ef:	90                   	nop

000005f0 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     5f0:	55                   	push   %ebp
     5f1:	89 e5                	mov    %esp,%ebp
     5f3:	57                   	push   %edi
     5f4:	56                   	push   %esi
     5f5:	53                   	push   %ebx
     5f6:	83 ec 0c             	sub    $0xc,%esp
     5f9:	8b 7d 08             	mov    0x8(%ebp),%edi
     5fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     5ff:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     601:	39 f3                	cmp    %esi,%ebx
     603:	72 12                	jb     617 <peek+0x27>
     605:	eb 28                	jmp    62f <peek+0x3f>
     607:	89 f6                	mov    %esi,%esi
     609:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    s++;
     610:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     613:	39 de                	cmp    %ebx,%esi
     615:	74 18                	je     62f <peek+0x3f>
     617:	0f be 03             	movsbl (%ebx),%eax
     61a:	83 ec 08             	sub    $0x8,%esp
     61d:	50                   	push   %eax
     61e:	68 e4 27 00 00       	push   $0x27e4
     623:	e8 88 05 00 00       	call   bb0 <strchr>
     628:	83 c4 10             	add    $0x10,%esp
     62b:	85 c0                	test   %eax,%eax
     62d:	75 e1                	jne    610 <peek+0x20>
    s++;
  *ps = s;
     62f:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     631:	0f be 13             	movsbl (%ebx),%edx
     634:	31 c0                	xor    %eax,%eax
     636:	84 d2                	test   %dl,%dl
     638:	74 17                	je     651 <peek+0x61>
     63a:	83 ec 08             	sub    $0x8,%esp
     63d:	52                   	push   %edx
     63e:	ff 75 10             	pushl  0x10(%ebp)
     641:	e8 6a 05 00 00       	call   bb0 <strchr>
     646:	83 c4 10             	add    $0x10,%esp
     649:	85 c0                	test   %eax,%eax
     64b:	0f 95 c0             	setne  %al
     64e:	0f b6 c0             	movzbl %al,%eax
}
     651:	8d 65 f4             	lea    -0xc(%ebp),%esp
     654:	5b                   	pop    %ebx
     655:	5e                   	pop    %esi
     656:	5f                   	pop    %edi
     657:	5d                   	pop    %ebp
     658:	c3                   	ret    
     659:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000660 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     660:	55                   	push   %ebp
     661:	89 e5                	mov    %esp,%ebp
     663:	57                   	push   %edi
     664:	56                   	push   %esi
     665:	53                   	push   %ebx
     666:	83 ec 1c             	sub    $0x1c,%esp
     669:	8b 75 0c             	mov    0xc(%ebp),%esi
     66c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     66f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     670:	83 ec 04             	sub    $0x4,%esp
     673:	68 cd 1c 00 00       	push   $0x1ccd
     678:	53                   	push   %ebx
     679:	56                   	push   %esi
     67a:	e8 71 ff ff ff       	call   5f0 <peek>
     67f:	83 c4 10             	add    $0x10,%esp
     682:	85 c0                	test   %eax,%eax
     684:	74 6a                	je     6f0 <parseredirs+0x90>
    tok = gettoken(ps, es, 0, 0);
     686:	6a 00                	push   $0x0
     688:	6a 00                	push   $0x0
     68a:	53                   	push   %ebx
     68b:	56                   	push   %esi
     68c:	e8 ef fd ff ff       	call   480 <gettoken>
     691:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     693:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     696:	50                   	push   %eax
     697:	8d 45 e0             	lea    -0x20(%ebp),%eax
     69a:	50                   	push   %eax
     69b:	53                   	push   %ebx
     69c:	56                   	push   %esi
     69d:	e8 de fd ff ff       	call   480 <gettoken>
     6a2:	83 c4 20             	add    $0x20,%esp
     6a5:	83 f8 61             	cmp    $0x61,%eax
     6a8:	75 51                	jne    6fb <parseredirs+0x9b>
      panic("missing file for redirection");
    switch(tok){
     6aa:	83 ff 3c             	cmp    $0x3c,%edi
     6ad:	74 31                	je     6e0 <parseredirs+0x80>
     6af:	83 ff 3e             	cmp    $0x3e,%edi
     6b2:	74 05                	je     6b9 <parseredirs+0x59>
     6b4:	83 ff 2b             	cmp    $0x2b,%edi
     6b7:	75 b7                	jne    670 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6b9:	83 ec 0c             	sub    $0xc,%esp
     6bc:	6a 01                	push   $0x1
     6be:	68 01 02 00 00       	push   $0x201
     6c3:	ff 75 e4             	pushl  -0x1c(%ebp)
     6c6:	ff 75 e0             	pushl  -0x20(%ebp)
     6c9:	ff 75 08             	pushl  0x8(%ebp)
     6cc:	e8 af fc ff ff       	call   380 <redircmd>
      break;
     6d1:	83 c4 20             	add    $0x20,%esp
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     6d4:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     6d7:	eb 97                	jmp    670 <parseredirs+0x10>
     6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6e0:	83 ec 0c             	sub    $0xc,%esp
     6e3:	6a 00                	push   $0x0
     6e5:	6a 00                	push   $0x0
     6e7:	eb da                	jmp    6c3 <parseredirs+0x63>
     6e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     6f0:	8b 45 08             	mov    0x8(%ebp),%eax
     6f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
     6f6:	5b                   	pop    %ebx
     6f7:	5e                   	pop    %esi
     6f8:	5f                   	pop    %edi
     6f9:	5d                   	pop    %ebp
     6fa:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     6fb:	83 ec 0c             	sub    $0xc,%esp
     6fe:	68 b0 1c 00 00       	push   $0x1cb0
     703:	e8 58 fa ff ff       	call   160 <panic>
     708:	90                   	nop
     709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000710 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     710:	55                   	push   %ebp
     711:	89 e5                	mov    %esp,%ebp
     713:	57                   	push   %edi
     714:	56                   	push   %esi
     715:	53                   	push   %ebx
     716:	83 ec 30             	sub    $0x30,%esp
     719:	8b 75 08             	mov    0x8(%ebp),%esi
     71c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     71f:	68 d0 1c 00 00       	push   $0x1cd0
     724:	57                   	push   %edi
     725:	56                   	push   %esi
     726:	e8 c5 fe ff ff       	call   5f0 <peek>
     72b:	83 c4 10             	add    $0x10,%esp
     72e:	85 c0                	test   %eax,%eax
     730:	0f 85 9a 00 00 00    	jne    7d0 <parseexec+0xc0>
    return parseblock(ps, es);

  ret = execcmd();
     736:	e8 15 fc ff ff       	call   350 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     73b:	83 ec 04             	sub    $0x4,%esp
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     73e:	89 c3                	mov    %eax,%ebx
     740:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	8d 5b 04             	lea    0x4(%ebx),%ebx
     748:	50                   	push   %eax
     749:	e8 12 ff ff ff       	call   660 <parseredirs>
     74e:	83 c4 10             	add    $0x10,%esp
     751:	89 45 d0             	mov    %eax,-0x30(%ebp)
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     754:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
     75b:	eb 16                	jmp    773 <parseexec+0x63>
     75d:	8d 76 00             	lea    0x0(%esi),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     760:	83 ec 04             	sub    $0x4,%esp
     763:	57                   	push   %edi
     764:	56                   	push   %esi
     765:	ff 75 d0             	pushl  -0x30(%ebp)
     768:	e8 f3 fe ff ff       	call   660 <parseredirs>
     76d:	83 c4 10             	add    $0x10,%esp
     770:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     773:	83 ec 04             	sub    $0x4,%esp
     776:	68 e7 1c 00 00       	push   $0x1ce7
     77b:	57                   	push   %edi
     77c:	56                   	push   %esi
     77d:	e8 6e fe ff ff       	call   5f0 <peek>
     782:	83 c4 10             	add    $0x10,%esp
     785:	85 c0                	test   %eax,%eax
     787:	75 5f                	jne    7e8 <parseexec+0xd8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     789:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     78c:	50                   	push   %eax
     78d:	8d 45 e0             	lea    -0x20(%ebp),%eax
     790:	50                   	push   %eax
     791:	57                   	push   %edi
     792:	56                   	push   %esi
     793:	e8 e8 fc ff ff       	call   480 <gettoken>
     798:	83 c4 10             	add    $0x10,%esp
     79b:	85 c0                	test   %eax,%eax
     79d:	74 49                	je     7e8 <parseexec+0xd8>
      break;
    if(tok != 'a')
     79f:	83 f8 61             	cmp    $0x61,%eax
     7a2:	75 66                	jne    80a <parseexec+0xfa>
      panic("syntax");
    cmd->argv[argc] = q;
     7a4:	8b 45 e0             	mov    -0x20(%ebp),%eax
    cmd->eargv[argc] = eq;
    argc++;
     7a7:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
     7ab:	83 c3 04             	add    $0x4,%ebx
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     7ae:	89 43 fc             	mov    %eax,-0x4(%ebx)
    cmd->eargv[argc] = eq;
     7b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7b4:	89 43 24             	mov    %eax,0x24(%ebx)
    argc++;
     7b7:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    if(argc >= MAXARGS)
     7ba:	83 f8 0a             	cmp    $0xa,%eax
     7bd:	75 a1                	jne    760 <parseexec+0x50>
      panic("too many args");
     7bf:	83 ec 0c             	sub    $0xc,%esp
     7c2:	68 d9 1c 00 00       	push   $0x1cd9
     7c7:	e8 94 f9 ff ff       	call   160 <panic>
     7cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     7d0:	83 ec 08             	sub    $0x8,%esp
     7d3:	57                   	push   %edi
     7d4:	56                   	push   %esi
     7d5:	e8 56 01 00 00       	call   930 <parseblock>
     7da:	83 c4 10             	add    $0x10,%esp
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     7dd:	8d 65 f4             	lea    -0xc(%ebp),%esp
     7e0:	5b                   	pop    %ebx
     7e1:	5e                   	pop    %esi
     7e2:	5f                   	pop    %edi
     7e3:	5d                   	pop    %ebp
     7e4:	c3                   	ret    
     7e5:	8d 76 00             	lea    0x0(%esi),%esi
     7e8:	8b 45 cc             	mov    -0x34(%ebp),%eax
     7eb:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     7ee:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     7f1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     7f8:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
     7ff:	8b 45 d0             	mov    -0x30(%ebp),%eax
  return ret;
}
     802:	8d 65 f4             	lea    -0xc(%ebp),%esp
     805:	5b                   	pop    %ebx
     806:	5e                   	pop    %esi
     807:	5f                   	pop    %edi
     808:	5d                   	pop    %ebp
     809:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     80a:	83 ec 0c             	sub    $0xc,%esp
     80d:	68 d2 1c 00 00       	push   $0x1cd2
     812:	e8 49 f9 ff ff       	call   160 <panic>
     817:	89 f6                	mov    %esi,%esi
     819:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000820 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     820:	55                   	push   %ebp
     821:	89 e5                	mov    %esp,%ebp
     823:	57                   	push   %edi
     824:	56                   	push   %esi
     825:	53                   	push   %ebx
     826:	83 ec 14             	sub    $0x14,%esp
     829:	8b 5d 08             	mov    0x8(%ebp),%ebx
     82c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     82f:	56                   	push   %esi
     830:	53                   	push   %ebx
     831:	e8 da fe ff ff       	call   710 <parseexec>
  if(peek(ps, es, "|")){
     836:	83 c4 0c             	add    $0xc,%esp
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     839:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     83b:	68 ec 1c 00 00       	push   $0x1cec
     840:	56                   	push   %esi
     841:	53                   	push   %ebx
     842:	e8 a9 fd ff ff       	call   5f0 <peek>
     847:	83 c4 10             	add    $0x10,%esp
     84a:	85 c0                	test   %eax,%eax
     84c:	75 12                	jne    860 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     84e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     851:	89 f8                	mov    %edi,%eax
     853:	5b                   	pop    %ebx
     854:	5e                   	pop    %esi
     855:	5f                   	pop    %edi
     856:	5d                   	pop    %ebp
     857:	c3                   	ret    
     858:	90                   	nop
     859:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     860:	6a 00                	push   $0x0
     862:	6a 00                	push   $0x0
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	e8 15 fc ff ff       	call   480 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     86b:	58                   	pop    %eax
     86c:	5a                   	pop    %edx
     86d:	56                   	push   %esi
     86e:	53                   	push   %ebx
     86f:	e8 ac ff ff ff       	call   820 <parsepipe>
     874:	89 7d 08             	mov    %edi,0x8(%ebp)
     877:	89 45 0c             	mov    %eax,0xc(%ebp)
     87a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     87d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     880:	5b                   	pop    %ebx
     881:	5e                   	pop    %esi
     882:	5f                   	pop    %edi
     883:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     884:	e9 47 fb ff ff       	jmp    3d0 <pipecmd>
     889:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000890 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 14             	sub    $0x14,%esp
     899:	8b 5d 08             	mov    0x8(%ebp),%ebx
     89c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     89f:	56                   	push   %esi
     8a0:	53                   	push   %ebx
     8a1:	e8 7a ff ff ff       	call   820 <parsepipe>
  while(peek(ps, es, "&")){
     8a6:	83 c4 10             	add    $0x10,%esp
struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     8a9:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     8ab:	eb 1b                	jmp    8c8 <parseline+0x38>
     8ad:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     8b0:	6a 00                	push   $0x0
     8b2:	6a 00                	push   $0x0
     8b4:	56                   	push   %esi
     8b5:	53                   	push   %ebx
     8b6:	e8 c5 fb ff ff       	call   480 <gettoken>
    cmd = backcmd(cmd);
     8bb:	89 3c 24             	mov    %edi,(%esp)
     8be:	e8 8d fb ff ff       	call   450 <backcmd>
     8c3:	83 c4 10             	add    $0x10,%esp
     8c6:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     8c8:	83 ec 04             	sub    $0x4,%esp
     8cb:	68 ee 1c 00 00       	push   $0x1cee
     8d0:	56                   	push   %esi
     8d1:	53                   	push   %ebx
     8d2:	e8 19 fd ff ff       	call   5f0 <peek>
     8d7:	83 c4 10             	add    $0x10,%esp
     8da:	85 c0                	test   %eax,%eax
     8dc:	75 d2                	jne    8b0 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     8de:	83 ec 04             	sub    $0x4,%esp
     8e1:	68 ea 1c 00 00       	push   $0x1cea
     8e6:	56                   	push   %esi
     8e7:	53                   	push   %ebx
     8e8:	e8 03 fd ff ff       	call   5f0 <peek>
     8ed:	83 c4 10             	add    $0x10,%esp
     8f0:	85 c0                	test   %eax,%eax
     8f2:	75 0c                	jne    900 <parseline+0x70>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     8f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8f7:	89 f8                	mov    %edi,%eax
     8f9:	5b                   	pop    %ebx
     8fa:	5e                   	pop    %esi
     8fb:	5f                   	pop    %edi
     8fc:	5d                   	pop    %ebp
     8fd:	c3                   	ret    
     8fe:	66 90                	xchg   %ax,%ax
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     900:	6a 00                	push   $0x0
     902:	6a 00                	push   $0x0
     904:	56                   	push   %esi
     905:	53                   	push   %ebx
     906:	e8 75 fb ff ff       	call   480 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     90b:	58                   	pop    %eax
     90c:	5a                   	pop    %edx
     90d:	56                   	push   %esi
     90e:	53                   	push   %ebx
     90f:	e8 7c ff ff ff       	call   890 <parseline>
     914:	89 7d 08             	mov    %edi,0x8(%ebp)
     917:	89 45 0c             	mov    %eax,0xc(%ebp)
     91a:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     91d:	8d 65 f4             	lea    -0xc(%ebp),%esp
     920:	5b                   	pop    %ebx
     921:	5e                   	pop    %esi
     922:	5f                   	pop    %edi
     923:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     924:	e9 e7 fa ff ff       	jmp    410 <listcmd>
     929:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000930 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     930:	55                   	push   %ebp
     931:	89 e5                	mov    %esp,%ebp
     933:	57                   	push   %edi
     934:	56                   	push   %esi
     935:	53                   	push   %ebx
     936:	83 ec 10             	sub    $0x10,%esp
     939:	8b 5d 08             	mov    0x8(%ebp),%ebx
     93c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     93f:	68 d0 1c 00 00       	push   $0x1cd0
     944:	56                   	push   %esi
     945:	53                   	push   %ebx
     946:	e8 a5 fc ff ff       	call   5f0 <peek>
     94b:	83 c4 10             	add    $0x10,%esp
     94e:	85 c0                	test   %eax,%eax
     950:	74 4a                	je     99c <parseblock+0x6c>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     952:	6a 00                	push   $0x0
     954:	6a 00                	push   $0x0
     956:	56                   	push   %esi
     957:	53                   	push   %ebx
     958:	e8 23 fb ff ff       	call   480 <gettoken>
  cmd = parseline(ps, es);
     95d:	58                   	pop    %eax
     95e:	5a                   	pop    %edx
     95f:	56                   	push   %esi
     960:	53                   	push   %ebx
     961:	e8 2a ff ff ff       	call   890 <parseline>
  if(!peek(ps, es, ")"))
     966:	83 c4 0c             	add    $0xc,%esp
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     969:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     96b:	68 0c 1d 00 00       	push   $0x1d0c
     970:	56                   	push   %esi
     971:	53                   	push   %ebx
     972:	e8 79 fc ff ff       	call   5f0 <peek>
     977:	83 c4 10             	add    $0x10,%esp
     97a:	85 c0                	test   %eax,%eax
     97c:	74 2b                	je     9a9 <parseblock+0x79>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     97e:	6a 00                	push   $0x0
     980:	6a 00                	push   $0x0
     982:	56                   	push   %esi
     983:	53                   	push   %ebx
     984:	e8 f7 fa ff ff       	call   480 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     989:	83 c4 0c             	add    $0xc,%esp
     98c:	56                   	push   %esi
     98d:	53                   	push   %ebx
     98e:	57                   	push   %edi
     98f:	e8 cc fc ff ff       	call   660 <parseredirs>
  return cmd;
}
     994:	8d 65 f4             	lea    -0xc(%ebp),%esp
     997:	5b                   	pop    %ebx
     998:	5e                   	pop    %esi
     999:	5f                   	pop    %edi
     99a:	5d                   	pop    %ebp
     99b:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     99c:	83 ec 0c             	sub    $0xc,%esp
     99f:	68 f0 1c 00 00       	push   $0x1cf0
     9a4:	e8 b7 f7 ff ff       	call   160 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     9a9:	83 ec 0c             	sub    $0xc,%esp
     9ac:	68 fb 1c 00 00       	push   $0x1cfb
     9b1:	e8 aa f7 ff ff       	call   160 <panic>
     9b6:	8d 76 00             	lea    0x0(%esi),%esi
     9b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000009c0 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     9c0:	55                   	push   %ebp
     9c1:	89 e5                	mov    %esp,%ebp
     9c3:	53                   	push   %ebx
     9c4:	83 ec 04             	sub    $0x4,%esp
     9c7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     9ca:	85 db                	test   %ebx,%ebx
     9cc:	0f 84 96 00 00 00    	je     a68 <nulterminate+0xa8>
    return 0;

  switch(cmd->type){
     9d2:	83 3b 05             	cmpl   $0x5,(%ebx)
     9d5:	77 48                	ja     a1f <nulterminate+0x5f>
     9d7:	8b 03                	mov    (%ebx),%eax
     9d9:	ff 24 85 4c 1d 00 00 	jmp    *0x1d4c(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     9e0:	83 ec 0c             	sub    $0xc,%esp
     9e3:	ff 73 04             	pushl  0x4(%ebx)
     9e6:	e8 d5 ff ff ff       	call   9c0 <nulterminate>
    nulterminate(lcmd->right);
     9eb:	58                   	pop    %eax
     9ec:	ff 73 08             	pushl  0x8(%ebx)
     9ef:	e8 cc ff ff ff       	call   9c0 <nulterminate>
    break;
     9f4:	83 c4 10             	add    $0x10,%esp
     9f7:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     9f9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     9fc:	c9                   	leave  
     9fd:	c3                   	ret    
     9fe:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a00:	8b 4b 04             	mov    0x4(%ebx),%ecx
     a03:	8d 43 2c             	lea    0x2c(%ebx),%eax
     a06:	85 c9                	test   %ecx,%ecx
     a08:	74 15                	je     a1f <nulterminate+0x5f>
     a0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     a10:	8b 10                	mov    (%eax),%edx
     a12:	83 c0 04             	add    $0x4,%eax
     a15:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     a18:	8b 50 d8             	mov    -0x28(%eax),%edx
     a1b:	85 d2                	test   %edx,%edx
     a1d:	75 f1                	jne    a10 <nulterminate+0x50>
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     a1f:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a21:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a24:	c9                   	leave  
     a25:	c3                   	ret    
     a26:	8d 76 00             	lea    0x0(%esi),%esi
     a29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     a30:	83 ec 0c             	sub    $0xc,%esp
     a33:	ff 73 04             	pushl  0x4(%ebx)
     a36:	e8 85 ff ff ff       	call   9c0 <nulterminate>
    break;
     a3b:	89 d8                	mov    %ebx,%eax
     a3d:	83 c4 10             	add    $0x10,%esp
  }
  return cmd;
}
     a40:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a43:	c9                   	leave  
     a44:	c3                   	ret    
     a45:	8d 76 00             	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     a48:	83 ec 0c             	sub    $0xc,%esp
     a4b:	ff 73 04             	pushl  0x4(%ebx)
     a4e:	e8 6d ff ff ff       	call   9c0 <nulterminate>
    *rcmd->efile = 0;
     a53:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     a56:	83 c4 10             	add    $0x10,%esp
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
     a59:	c6 00 00             	movb   $0x0,(%eax)
    break;
     a5c:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a5e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a61:	c9                   	leave  
     a62:	c3                   	ret    
     a63:	90                   	nop
     a64:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     a68:	31 c0                	xor    %eax,%eax
     a6a:	eb 8d                	jmp    9f9 <nulterminate+0x39>
     a6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000a70 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	56                   	push   %esi
     a74:	53                   	push   %ebx
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a75:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a78:	83 ec 0c             	sub    $0xc,%esp
     a7b:	53                   	push   %ebx
     a7c:	e8 df 00 00 00       	call   b60 <strlen>
  cmd = parseline(&s, es);
     a81:	59                   	pop    %ecx
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     a82:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     a84:	8d 45 08             	lea    0x8(%ebp),%eax
     a87:	5e                   	pop    %esi
     a88:	53                   	push   %ebx
     a89:	50                   	push   %eax
     a8a:	e8 01 fe ff ff       	call   890 <parseline>
     a8f:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     a91:	8d 45 08             	lea    0x8(%ebp),%eax
     a94:	83 c4 0c             	add    $0xc,%esp
     a97:	68 fb 1e 00 00       	push   $0x1efb
     a9c:	53                   	push   %ebx
     a9d:	50                   	push   %eax
     a9e:	e8 4d fb ff ff       	call   5f0 <peek>
  if(s != es){
     aa3:	8b 45 08             	mov    0x8(%ebp),%eax
     aa6:	83 c4 10             	add    $0x10,%esp
     aa9:	39 c3                	cmp    %eax,%ebx
     aab:	75 12                	jne    abf <parsecmd+0x4f>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     aad:	83 ec 0c             	sub    $0xc,%esp
     ab0:	56                   	push   %esi
     ab1:	e8 0a ff ff ff       	call   9c0 <nulterminate>
  return cmd;
}
     ab6:	8d 65 f8             	lea    -0x8(%ebp),%esp
     ab9:	89 f0                	mov    %esi,%eax
     abb:	5b                   	pop    %ebx
     abc:	5e                   	pop    %esi
     abd:	5d                   	pop    %ebp
     abe:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     abf:	52                   	push   %edx
     ac0:	50                   	push   %eax
     ac1:	68 0e 1d 00 00       	push   $0x1d0e
     ac6:	6a 02                	push   $0x2
     ac8:	e8 c3 03 00 00       	call   e90 <printf>
    panic("syntax");
     acd:	c7 04 24 d2 1c 00 00 	movl   $0x1cd2,(%esp)
     ad4:	e8 87 f6 ff ff       	call   160 <panic>
     ad9:	66 90                	xchg   %ax,%ax
     adb:	66 90                	xchg   %ax,%ax
     add:	66 90                	xchg   %ax,%ax
     adf:	90                   	nop

00000ae0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     ae0:	55                   	push   %ebp
     ae1:	89 e5                	mov    %esp,%ebp
     ae3:	53                   	push   %ebx
     ae4:	8b 45 08             	mov    0x8(%ebp),%eax
     ae7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     aea:	89 c2                	mov    %eax,%edx
     aec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     af0:	83 c1 01             	add    $0x1,%ecx
     af3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     af7:	83 c2 01             	add    $0x1,%edx
     afa:	84 db                	test   %bl,%bl
     afc:	88 5a ff             	mov    %bl,-0x1(%edx)
     aff:	75 ef                	jne    af0 <strcpy+0x10>
    ;
  return os;
}
     b01:	5b                   	pop    %ebx
     b02:	5d                   	pop    %ebp
     b03:	c3                   	ret    
     b04:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     b0a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000b10 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	56                   	push   %esi
     b14:	53                   	push   %ebx
     b15:	8b 55 08             	mov    0x8(%ebp),%edx
     b18:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     b1b:	0f b6 02             	movzbl (%edx),%eax
     b1e:	0f b6 19             	movzbl (%ecx),%ebx
     b21:	84 c0                	test   %al,%al
     b23:	75 1e                	jne    b43 <strcmp+0x33>
     b25:	eb 29                	jmp    b50 <strcmp+0x40>
     b27:	89 f6                	mov    %esi,%esi
     b29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
     b30:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b33:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     b36:	8d 71 01             	lea    0x1(%ecx),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b39:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     b3d:	84 c0                	test   %al,%al
     b3f:	74 0f                	je     b50 <strcmp+0x40>
     b41:	89 f1                	mov    %esi,%ecx
     b43:	38 d8                	cmp    %bl,%al
     b45:	74 e9                	je     b30 <strcmp+0x20>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b47:	29 d8                	sub    %ebx,%eax
}
     b49:	5b                   	pop    %ebx
     b4a:	5e                   	pop    %esi
     b4b:	5d                   	pop    %ebp
     b4c:	c3                   	ret    
     b4d:	8d 76 00             	lea    0x0(%esi),%esi
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     b50:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     b52:	29 d8                	sub    %ebx,%eax
}
     b54:	5b                   	pop    %ebx
     b55:	5e                   	pop    %esi
     b56:	5d                   	pop    %ebp
     b57:	c3                   	ret    
     b58:	90                   	nop
     b59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000b60 <strlen>:

uint
strlen(char *s)
{
     b60:	55                   	push   %ebp
     b61:	89 e5                	mov    %esp,%ebp
     b63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     b66:	80 39 00             	cmpb   $0x0,(%ecx)
     b69:	74 12                	je     b7d <strlen+0x1d>
     b6b:	31 d2                	xor    %edx,%edx
     b6d:	8d 76 00             	lea    0x0(%esi),%esi
     b70:	83 c2 01             	add    $0x1,%edx
     b73:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     b77:	89 d0                	mov    %edx,%eax
     b79:	75 f5                	jne    b70 <strlen+0x10>
    ;
  return n;
}
     b7b:	5d                   	pop    %ebp
     b7c:	c3                   	ret    
uint
strlen(char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     b7d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     b7f:	5d                   	pop    %ebp
     b80:	c3                   	ret    
     b81:	eb 0d                	jmp    b90 <memset>
     b83:	90                   	nop
     b84:	90                   	nop
     b85:	90                   	nop
     b86:	90                   	nop
     b87:	90                   	nop
     b88:	90                   	nop
     b89:	90                   	nop
     b8a:	90                   	nop
     b8b:	90                   	nop
     b8c:	90                   	nop
     b8d:	90                   	nop
     b8e:	90                   	nop
     b8f:	90                   	nop

00000b90 <memset>:

void*
memset(void *dst, int c, uint n)
{
     b90:	55                   	push   %ebp
     b91:	89 e5                	mov    %esp,%ebp
     b93:	57                   	push   %edi
     b94:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     b97:	8b 4d 10             	mov    0x10(%ebp),%ecx
     b9a:	8b 45 0c             	mov    0xc(%ebp),%eax
     b9d:	89 d7                	mov    %edx,%edi
     b9f:	fc                   	cld    
     ba0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     ba2:	89 d0                	mov    %edx,%eax
     ba4:	5f                   	pop    %edi
     ba5:	5d                   	pop    %ebp
     ba6:	c3                   	ret    
     ba7:	89 f6                	mov    %esi,%esi
     ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bb0 <strchr>:

char*
strchr(const char *s, char c)
{
     bb0:	55                   	push   %ebp
     bb1:	89 e5                	mov    %esp,%ebp
     bb3:	53                   	push   %ebx
     bb4:	8b 45 08             	mov    0x8(%ebp),%eax
     bb7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
     bba:	0f b6 10             	movzbl (%eax),%edx
     bbd:	84 d2                	test   %dl,%dl
     bbf:	74 1d                	je     bde <strchr+0x2e>
    if(*s == c)
     bc1:	38 d3                	cmp    %dl,%bl
     bc3:	89 d9                	mov    %ebx,%ecx
     bc5:	75 0d                	jne    bd4 <strchr+0x24>
     bc7:	eb 17                	jmp    be0 <strchr+0x30>
     bc9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bd0:	38 ca                	cmp    %cl,%dl
     bd2:	74 0c                	je     be0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     bd4:	83 c0 01             	add    $0x1,%eax
     bd7:	0f b6 10             	movzbl (%eax),%edx
     bda:	84 d2                	test   %dl,%dl
     bdc:	75 f2                	jne    bd0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     bde:	31 c0                	xor    %eax,%eax
}
     be0:	5b                   	pop    %ebx
     be1:	5d                   	pop    %ebp
     be2:	c3                   	ret    
     be3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     be9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000bf0 <gets>:

char*
gets(char *buf, int max)
{
     bf0:	55                   	push   %ebp
     bf1:	89 e5                	mov    %esp,%ebp
     bf3:	57                   	push   %edi
     bf4:	56                   	push   %esi
     bf5:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bf6:	31 f6                	xor    %esi,%esi
    cc = read(0, &c, 1);
     bf8:	8d 7d e7             	lea    -0x19(%ebp),%edi
  return 0;
}

char*
gets(char *buf, int max)
{
     bfb:	83 ec 1c             	sub    $0x1c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     bfe:	eb 29                	jmp    c29 <gets+0x39>
    cc = read(0, &c, 1);
     c00:	83 ec 04             	sub    $0x4,%esp
     c03:	6a 01                	push   $0x1
     c05:	57                   	push   %edi
     c06:	6a 00                	push   $0x0
     c08:	e8 2d 01 00 00       	call   d3a <read>
    if(cc < 1)
     c0d:	83 c4 10             	add    $0x10,%esp
     c10:	85 c0                	test   %eax,%eax
     c12:	7e 1d                	jle    c31 <gets+0x41>
      break;
    buf[i++] = c;
     c14:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     c18:	8b 55 08             	mov    0x8(%ebp),%edx
     c1b:	89 de                	mov    %ebx,%esi
    if(c == '\n' || c == '\r')
     c1d:	3c 0a                	cmp    $0xa,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     c1f:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     c23:	74 1b                	je     c40 <gets+0x50>
     c25:	3c 0d                	cmp    $0xd,%al
     c27:	74 17                	je     c40 <gets+0x50>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c29:	8d 5e 01             	lea    0x1(%esi),%ebx
     c2c:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     c2f:	7c cf                	jl     c00 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c31:	8b 45 08             	mov    0x8(%ebp),%eax
     c34:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c38:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c3b:	5b                   	pop    %ebx
     c3c:	5e                   	pop    %esi
     c3d:	5f                   	pop    %edi
     c3e:	5d                   	pop    %ebp
     c3f:	c3                   	ret    
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c40:	8b 45 08             	mov    0x8(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     c43:	89 de                	mov    %ebx,%esi
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     c45:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     c49:	8d 65 f4             	lea    -0xc(%ebp),%esp
     c4c:	5b                   	pop    %ebx
     c4d:	5e                   	pop    %esi
     c4e:	5f                   	pop    %edi
     c4f:	5d                   	pop    %ebp
     c50:	c3                   	ret    
     c51:	eb 0d                	jmp    c60 <stat>
     c53:	90                   	nop
     c54:	90                   	nop
     c55:	90                   	nop
     c56:	90                   	nop
     c57:	90                   	nop
     c58:	90                   	nop
     c59:	90                   	nop
     c5a:	90                   	nop
     c5b:	90                   	nop
     c5c:	90                   	nop
     c5d:	90                   	nop
     c5e:	90                   	nop
     c5f:	90                   	nop

00000c60 <stat>:

int
stat(char *n, struct stat *st)
{
     c60:	55                   	push   %ebp
     c61:	89 e5                	mov    %esp,%ebp
     c63:	56                   	push   %esi
     c64:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     c65:	83 ec 08             	sub    $0x8,%esp
     c68:	6a 00                	push   $0x0
     c6a:	ff 75 08             	pushl  0x8(%ebp)
     c6d:	e8 f0 00 00 00       	call   d62 <open>
  if(fd < 0)
     c72:	83 c4 10             	add    $0x10,%esp
     c75:	85 c0                	test   %eax,%eax
     c77:	78 27                	js     ca0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     c79:	83 ec 08             	sub    $0x8,%esp
     c7c:	ff 75 0c             	pushl  0xc(%ebp)
     c7f:	89 c3                	mov    %eax,%ebx
     c81:	50                   	push   %eax
     c82:	e8 f3 00 00 00       	call   d7a <fstat>
     c87:	89 c6                	mov    %eax,%esi
  close(fd);
     c89:	89 1c 24             	mov    %ebx,(%esp)
     c8c:	e8 b9 00 00 00       	call   d4a <close>
  return r;
     c91:	83 c4 10             	add    $0x10,%esp
     c94:	89 f0                	mov    %esi,%eax
}
     c96:	8d 65 f8             	lea    -0x8(%ebp),%esp
     c99:	5b                   	pop    %ebx
     c9a:	5e                   	pop    %esi
     c9b:	5d                   	pop    %ebp
     c9c:	c3                   	ret    
     c9d:	8d 76 00             	lea    0x0(%esi),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     ca5:	eb ef                	jmp    c96 <stat+0x36>
     ca7:	89 f6                	mov    %esi,%esi
     ca9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000cb0 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     cb0:	55                   	push   %ebp
     cb1:	89 e5                	mov    %esp,%ebp
     cb3:	53                   	push   %ebx
     cb4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cb7:	0f be 11             	movsbl (%ecx),%edx
     cba:	8d 42 d0             	lea    -0x30(%edx),%eax
     cbd:	3c 09                	cmp    $0x9,%al
     cbf:	b8 00 00 00 00       	mov    $0x0,%eax
     cc4:	77 1f                	ja     ce5 <atoi+0x35>
     cc6:	8d 76 00             	lea    0x0(%esi),%esi
     cc9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
     cd0:	8d 04 80             	lea    (%eax,%eax,4),%eax
     cd3:	83 c1 01             	add    $0x1,%ecx
     cd6:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     cda:	0f be 11             	movsbl (%ecx),%edx
     cdd:	8d 5a d0             	lea    -0x30(%edx),%ebx
     ce0:	80 fb 09             	cmp    $0x9,%bl
     ce3:	76 eb                	jbe    cd0 <atoi+0x20>
    n = n*10 + *s++ - '0';
  return n;
}
     ce5:	5b                   	pop    %ebx
     ce6:	5d                   	pop    %ebp
     ce7:	c3                   	ret    
     ce8:	90                   	nop
     ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cf0 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	53                   	push   %ebx
     cf5:	8b 5d 10             	mov    0x10(%ebp),%ebx
     cf8:	8b 45 08             	mov    0x8(%ebp),%eax
     cfb:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     cfe:	85 db                	test   %ebx,%ebx
     d00:	7e 14                	jle    d16 <memmove+0x26>
     d02:	31 d2                	xor    %edx,%edx
     d04:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     d08:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     d0c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     d0f:	83 c2 01             	add    $0x1,%edx
{
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d12:	39 da                	cmp    %ebx,%edx
     d14:	75 f2                	jne    d08 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     d16:	5b                   	pop    %ebx
     d17:	5e                   	pop    %esi
     d18:	5d                   	pop    %ebp
     d19:	c3                   	ret    

00000d1a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     d1a:	b8 01 00 00 00       	mov    $0x1,%eax
     d1f:	cd 40                	int    $0x40
     d21:	c3                   	ret    

00000d22 <exit>:
SYSCALL(exit)
     d22:	b8 02 00 00 00       	mov    $0x2,%eax
     d27:	cd 40                	int    $0x40
     d29:	c3                   	ret    

00000d2a <wait>:
SYSCALL(wait)
     d2a:	b8 03 00 00 00       	mov    $0x3,%eax
     d2f:	cd 40                	int    $0x40
     d31:	c3                   	ret    

00000d32 <pipe>:
SYSCALL(pipe)
     d32:	b8 04 00 00 00       	mov    $0x4,%eax
     d37:	cd 40                	int    $0x40
     d39:	c3                   	ret    

00000d3a <read>:
SYSCALL(read)
     d3a:	b8 05 00 00 00       	mov    $0x5,%eax
     d3f:	cd 40                	int    $0x40
     d41:	c3                   	ret    

00000d42 <write>:
SYSCALL(write)
     d42:	b8 10 00 00 00       	mov    $0x10,%eax
     d47:	cd 40                	int    $0x40
     d49:	c3                   	ret    

00000d4a <close>:
SYSCALL(close)
     d4a:	b8 15 00 00 00       	mov    $0x15,%eax
     d4f:	cd 40                	int    $0x40
     d51:	c3                   	ret    

00000d52 <kill>:
SYSCALL(kill)
     d52:	b8 06 00 00 00       	mov    $0x6,%eax
     d57:	cd 40                	int    $0x40
     d59:	c3                   	ret    

00000d5a <exec>:
SYSCALL(exec)
     d5a:	b8 07 00 00 00       	mov    $0x7,%eax
     d5f:	cd 40                	int    $0x40
     d61:	c3                   	ret    

00000d62 <open>:
SYSCALL(open)
     d62:	b8 0f 00 00 00       	mov    $0xf,%eax
     d67:	cd 40                	int    $0x40
     d69:	c3                   	ret    

00000d6a <mknod>:
SYSCALL(mknod)
     d6a:	b8 11 00 00 00       	mov    $0x11,%eax
     d6f:	cd 40                	int    $0x40
     d71:	c3                   	ret    

00000d72 <unlink>:
SYSCALL(unlink)
     d72:	b8 12 00 00 00       	mov    $0x12,%eax
     d77:	cd 40                	int    $0x40
     d79:	c3                   	ret    

00000d7a <fstat>:
SYSCALL(fstat)
     d7a:	b8 08 00 00 00       	mov    $0x8,%eax
     d7f:	cd 40                	int    $0x40
     d81:	c3                   	ret    

00000d82 <link>:
SYSCALL(link)
     d82:	b8 13 00 00 00       	mov    $0x13,%eax
     d87:	cd 40                	int    $0x40
     d89:	c3                   	ret    

00000d8a <mkdir>:
SYSCALL(mkdir)
     d8a:	b8 14 00 00 00       	mov    $0x14,%eax
     d8f:	cd 40                	int    $0x40
     d91:	c3                   	ret    

00000d92 <chdir>:
SYSCALL(chdir)
     d92:	b8 09 00 00 00       	mov    $0x9,%eax
     d97:	cd 40                	int    $0x40
     d99:	c3                   	ret    

00000d9a <dup>:
SYSCALL(dup)
     d9a:	b8 0a 00 00 00       	mov    $0xa,%eax
     d9f:	cd 40                	int    $0x40
     da1:	c3                   	ret    

00000da2 <getpid>:
SYSCALL(getpid)
     da2:	b8 0b 00 00 00       	mov    $0xb,%eax
     da7:	cd 40                	int    $0x40
     da9:	c3                   	ret    

00000daa <sbrk>:
SYSCALL(sbrk)
     daa:	b8 0c 00 00 00       	mov    $0xc,%eax
     daf:	cd 40                	int    $0x40
     db1:	c3                   	ret    

00000db2 <sleep>:
SYSCALL(sleep)
     db2:	b8 0d 00 00 00       	mov    $0xd,%eax
     db7:	cd 40                	int    $0x40
     db9:	c3                   	ret    

00000dba <uptime>:
SYSCALL(uptime)
     dba:	b8 0e 00 00 00       	mov    $0xe,%eax
     dbf:	cd 40                	int    $0x40
     dc1:	c3                   	ret    

00000dc2 <signal>:
/* assignment 2 adding code */
SYSCALL(signal)
     dc2:	b8 16 00 00 00       	mov    $0x16,%eax
     dc7:	cd 40                	int    $0x40
     dc9:	c3                   	ret    

00000dca <sigsend>:
SYSCALL(sigsend)
     dca:	b8 17 00 00 00       	mov    $0x17,%eax
     dcf:	cd 40                	int    $0x40
     dd1:	c3                   	ret    

00000dd2 <sigreturn>:
SYSCALL(sigreturn)
     dd2:	b8 18 00 00 00       	mov    $0x18,%eax
     dd7:	cd 40                	int    $0x40
     dd9:	c3                   	ret    

00000dda <alarm>:
SYSCALL(alarm)
     dda:	b8 19 00 00 00       	mov    $0x19,%eax
     ddf:	cd 40                	int    $0x40
     de1:	c3                   	ret    
     de2:	66 90                	xchg   %ax,%ax
     de4:	66 90                	xchg   %ax,%ax
     de6:	66 90                	xchg   %ax,%ax
     de8:	66 90                	xchg   %ax,%ax
     dea:	66 90                	xchg   %ax,%ax
     dec:	66 90                	xchg   %ax,%ax
     dee:	66 90                	xchg   %ax,%ax

00000df0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	57                   	push   %edi
     df4:	56                   	push   %esi
     df5:	53                   	push   %ebx
     df6:	89 c6                	mov    %eax,%esi
     df8:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
     dfb:	8b 5d 08             	mov    0x8(%ebp),%ebx
     dfe:	85 db                	test   %ebx,%ebx
     e00:	74 7e                	je     e80 <printint+0x90>
     e02:	89 d0                	mov    %edx,%eax
     e04:	c1 e8 1f             	shr    $0x1f,%eax
     e07:	84 c0                	test   %al,%al
     e09:	74 75                	je     e80 <printint+0x90>
    neg = 1;
    x = -xx;
     e0b:	89 d0                	mov    %edx,%eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
     e0d:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    x = -xx;
     e14:	f7 d8                	neg    %eax
     e16:	89 75 c0             	mov    %esi,-0x40(%ebp)
  } else {
    x = xx;
  }

  i = 0;
     e19:	31 ff                	xor    %edi,%edi
     e1b:	8d 5d d7             	lea    -0x29(%ebp),%ebx
     e1e:	89 ce                	mov    %ecx,%esi
     e20:	eb 08                	jmp    e2a <printint+0x3a>
     e22:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     e28:	89 cf                	mov    %ecx,%edi
     e2a:	31 d2                	xor    %edx,%edx
     e2c:	8d 4f 01             	lea    0x1(%edi),%ecx
     e2f:	f7 f6                	div    %esi
     e31:	0f b6 92 6c 1d 00 00 	movzbl 0x1d6c(%edx),%edx
  }while((x /= base) != 0);
     e38:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
     e3a:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
     e3d:	75 e9                	jne    e28 <printint+0x38>
  if(neg)
     e3f:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     e42:	8b 75 c0             	mov    -0x40(%ebp),%esi
     e45:	85 c0                	test   %eax,%eax
     e47:	74 08                	je     e51 <printint+0x61>
    buf[i++] = '-';
     e49:	c6 44 0d d8 2d       	movb   $0x2d,-0x28(%ebp,%ecx,1)
     e4e:	8d 4f 02             	lea    0x2(%edi),%ecx
     e51:	8d 7c 0d d7          	lea    -0x29(%ebp,%ecx,1),%edi
     e55:	8d 76 00             	lea    0x0(%esi),%esi
     e58:	0f b6 07             	movzbl (%edi),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     e5b:	83 ec 04             	sub    $0x4,%esp
     e5e:	83 ef 01             	sub    $0x1,%edi
     e61:	6a 01                	push   $0x1
     e63:	53                   	push   %ebx
     e64:	56                   	push   %esi
     e65:	88 45 d7             	mov    %al,-0x29(%ebp)
     e68:	e8 d5 fe ff ff       	call   d42 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     e6d:	83 c4 10             	add    $0x10,%esp
     e70:	39 df                	cmp    %ebx,%edi
     e72:	75 e4                	jne    e58 <printint+0x68>
    putc(fd, buf[i]);
}
     e74:	8d 65 f4             	lea    -0xc(%ebp),%esp
     e77:	5b                   	pop    %ebx
     e78:	5e                   	pop    %esi
     e79:	5f                   	pop    %edi
     e7a:	5d                   	pop    %ebp
     e7b:	c3                   	ret    
     e7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
  } else {
    x = xx;
     e80:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     e82:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
     e89:	eb 8b                	jmp    e16 <printint+0x26>
     e8b:	90                   	nop
     e8c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000e90 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	57                   	push   %edi
     e94:	56                   	push   %esi
     e95:	53                   	push   %ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e96:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e99:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     e9c:	8b 75 0c             	mov    0xc(%ebp),%esi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     e9f:	8b 7d 08             	mov    0x8(%ebp),%edi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ea2:	89 45 d0             	mov    %eax,-0x30(%ebp)
     ea5:	0f b6 1e             	movzbl (%esi),%ebx
     ea8:	83 c6 01             	add    $0x1,%esi
     eab:	84 db                	test   %bl,%bl
     ead:	0f 84 b0 00 00 00    	je     f63 <printf+0xd3>
     eb3:	31 d2                	xor    %edx,%edx
     eb5:	eb 39                	jmp    ef0 <printf+0x60>
     eb7:	89 f6                	mov    %esi,%esi
     eb9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ec0:	83 f8 25             	cmp    $0x25,%eax
     ec3:	89 55 d4             	mov    %edx,-0x2c(%ebp)
        state = '%';
     ec6:	ba 25 00 00 00       	mov    $0x25,%edx
  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
     ecb:	74 18                	je     ee5 <printf+0x55>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ecd:	8d 45 e2             	lea    -0x1e(%ebp),%eax
     ed0:	83 ec 04             	sub    $0x4,%esp
     ed3:	88 5d e2             	mov    %bl,-0x1e(%ebp)
     ed6:	6a 01                	push   $0x1
     ed8:	50                   	push   %eax
     ed9:	57                   	push   %edi
     eda:	e8 63 fe ff ff       	call   d42 <write>
     edf:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     ee2:	83 c4 10             	add    $0x10,%esp
     ee5:	83 c6 01             	add    $0x1,%esi
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     ee8:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
     eec:	84 db                	test   %bl,%bl
     eee:	74 73                	je     f63 <printf+0xd3>
    c = fmt[i] & 0xff;
    if(state == 0){
     ef0:	85 d2                	test   %edx,%edx
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
     ef2:	0f be cb             	movsbl %bl,%ecx
     ef5:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     ef8:	74 c6                	je     ec0 <printf+0x30>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
     efa:	83 fa 25             	cmp    $0x25,%edx
     efd:	75 e6                	jne    ee5 <printf+0x55>
      if(c == 'd'){
     eff:	83 f8 64             	cmp    $0x64,%eax
     f02:	0f 84 f8 00 00 00    	je     1000 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
     f08:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
     f0e:	83 f9 70             	cmp    $0x70,%ecx
     f11:	74 5d                	je     f70 <printf+0xe0>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
     f13:	83 f8 73             	cmp    $0x73,%eax
     f16:	0f 84 84 00 00 00    	je     fa0 <printf+0x110>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     f1c:	83 f8 63             	cmp    $0x63,%eax
     f1f:	0f 84 ea 00 00 00    	je     100f <printf+0x17f>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
     f25:	83 f8 25             	cmp    $0x25,%eax
     f28:	0f 84 c2 00 00 00    	je     ff0 <printf+0x160>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f2e:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f31:	83 ec 04             	sub    $0x4,%esp
     f34:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     f38:	6a 01                	push   $0x1
     f3a:	50                   	push   %eax
     f3b:	57                   	push   %edi
     f3c:	e8 01 fe ff ff       	call   d42 <write>
     f41:	83 c4 0c             	add    $0xc,%esp
     f44:	8d 45 e6             	lea    -0x1a(%ebp),%eax
     f47:	88 5d e6             	mov    %bl,-0x1a(%ebp)
     f4a:	6a 01                	push   $0x1
     f4c:	50                   	push   %eax
     f4d:	57                   	push   %edi
     f4e:	83 c6 01             	add    $0x1,%esi
     f51:	e8 ec fd ff ff       	call   d42 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f56:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     f5a:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f5d:	31 d2                	xor    %edx,%edx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f5f:	84 db                	test   %bl,%bl
     f61:	75 8d                	jne    ef0 <printf+0x60>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f63:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f66:	5b                   	pop    %ebx
     f67:	5e                   	pop    %esi
     f68:	5f                   	pop    %edi
     f69:	5d                   	pop    %ebp
     f6a:	c3                   	ret    
     f6b:	90                   	nop
     f6c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
     f70:	83 ec 0c             	sub    $0xc,%esp
     f73:	b9 10 00 00 00       	mov    $0x10,%ecx
     f78:	6a 00                	push   $0x0
     f7a:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     f7d:	89 f8                	mov    %edi,%eax
     f7f:	8b 13                	mov    (%ebx),%edx
     f81:	e8 6a fe ff ff       	call   df0 <printint>
        ap++;
     f86:	89 d8                	mov    %ebx,%eax
     f88:	83 c4 10             	add    $0x10,%esp
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     f8b:	31 d2                	xor    %edx,%edx
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
     f8d:	83 c0 04             	add    $0x4,%eax
     f90:	89 45 d0             	mov    %eax,-0x30(%ebp)
     f93:	e9 4d ff ff ff       	jmp    ee5 <printf+0x55>
     f98:	90                   	nop
     f99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
     fa0:	8b 45 d0             	mov    -0x30(%ebp),%eax
     fa3:	8b 18                	mov    (%eax),%ebx
        ap++;
     fa5:	83 c0 04             	add    $0x4,%eax
     fa8:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
          s = "(null)";
     fab:	b8 64 1d 00 00       	mov    $0x1d64,%eax
     fb0:	85 db                	test   %ebx,%ebx
     fb2:	0f 44 d8             	cmove  %eax,%ebx
        while(*s != 0){
     fb5:	0f b6 03             	movzbl (%ebx),%eax
     fb8:	84 c0                	test   %al,%al
     fba:	74 23                	je     fdf <printf+0x14f>
     fbc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     fc0:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fc3:	8d 45 e3             	lea    -0x1d(%ebp),%eax
     fc6:	83 ec 04             	sub    $0x4,%esp
     fc9:	6a 01                	push   $0x1
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
     fcb:	83 c3 01             	add    $0x1,%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     fce:	50                   	push   %eax
     fcf:	57                   	push   %edi
     fd0:	e8 6d fd ff ff       	call   d42 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     fd5:	0f b6 03             	movzbl (%ebx),%eax
     fd8:	83 c4 10             	add    $0x10,%esp
     fdb:	84 c0                	test   %al,%al
     fdd:	75 e1                	jne    fc0 <printf+0x130>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
     fdf:	31 d2                	xor    %edx,%edx
     fe1:	e9 ff fe ff ff       	jmp    ee5 <printf+0x55>
     fe6:	8d 76 00             	lea    0x0(%esi),%esi
     fe9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
     ff0:	83 ec 04             	sub    $0x4,%esp
     ff3:	88 5d e5             	mov    %bl,-0x1b(%ebp)
     ff6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
     ff9:	6a 01                	push   $0x1
     ffb:	e9 4c ff ff ff       	jmp    f4c <printf+0xbc>
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1000:	83 ec 0c             	sub    $0xc,%esp
    1003:	b9 0a 00 00 00       	mov    $0xa,%ecx
    1008:	6a 01                	push   $0x1
    100a:	e9 6b ff ff ff       	jmp    f7a <printf+0xea>
    100f:	8b 5d d0             	mov    -0x30(%ebp),%ebx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1012:	83 ec 04             	sub    $0x4,%esp
    1015:	8b 03                	mov    (%ebx),%eax
    1017:	6a 01                	push   $0x1
    1019:	88 45 e4             	mov    %al,-0x1c(%ebp)
    101c:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    101f:	50                   	push   %eax
    1020:	57                   	push   %edi
    1021:	e8 1c fd ff ff       	call   d42 <write>
    1026:	e9 5b ff ff ff       	jmp    f86 <printf+0xf6>
    102b:	66 90                	xchg   %ax,%ax
    102d:	66 90                	xchg   %ax,%ax
    102f:	90                   	nop

00001030 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1030:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1031:	a1 64 28 00 00       	mov    0x2864,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1036:	89 e5                	mov    %esp,%ebp
    1038:	57                   	push   %edi
    1039:	56                   	push   %esi
    103a:	53                   	push   %ebx
    103b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    103e:	8b 10                	mov    (%eax),%edx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1040:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1043:	39 c8                	cmp    %ecx,%eax
    1045:	73 19                	jae    1060 <free+0x30>
    1047:	89 f6                	mov    %esi,%esi
    1049:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    1050:	39 d1                	cmp    %edx,%ecx
    1052:	72 1c                	jb     1070 <free+0x40>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1054:	39 d0                	cmp    %edx,%eax
    1056:	73 18                	jae    1070 <free+0x40>
static Header base;
static Header *freep;

void
free(void *ap)
{
    1058:	89 d0                	mov    %edx,%eax
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    105a:	39 c8                	cmp    %ecx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    105c:	8b 10                	mov    (%eax),%edx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    105e:	72 f0                	jb     1050 <free+0x20>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1060:	39 d0                	cmp    %edx,%eax
    1062:	72 f4                	jb     1058 <free+0x28>
    1064:	39 d1                	cmp    %edx,%ecx
    1066:	73 f0                	jae    1058 <free+0x28>
    1068:	90                   	nop
    1069:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
  if(bp + bp->s.size == p->s.ptr){
    1070:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1073:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    1076:	39 d7                	cmp    %edx,%edi
    1078:	74 19                	je     1093 <free+0x63>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    107a:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
    107d:	8b 50 04             	mov    0x4(%eax),%edx
    1080:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    1083:	39 f1                	cmp    %esi,%ecx
    1085:	74 23                	je     10aa <free+0x7a>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1087:	89 08                	mov    %ecx,(%eax)
  freep = p;
    1089:	a3 64 28 00 00       	mov    %eax,0x2864
}
    108e:	5b                   	pop    %ebx
    108f:	5e                   	pop    %esi
    1090:	5f                   	pop    %edi
    1091:	5d                   	pop    %ebp
    1092:	c3                   	ret    
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    1093:	03 72 04             	add    0x4(%edx),%esi
    1096:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1099:	8b 10                	mov    (%eax),%edx
    109b:	8b 12                	mov    (%edx),%edx
    109d:	89 53 f8             	mov    %edx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    10a0:	8b 50 04             	mov    0x4(%eax),%edx
    10a3:	8d 34 d0             	lea    (%eax,%edx,8),%esi
    10a6:	39 f1                	cmp    %esi,%ecx
    10a8:	75 dd                	jne    1087 <free+0x57>
    p->s.size += bp->s.size;
    10aa:	03 53 fc             	add    -0x4(%ebx),%edx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    10ad:	a3 64 28 00 00       	mov    %eax,0x2864
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    10b2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    10b5:	8b 53 f8             	mov    -0x8(%ebx),%edx
    10b8:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    10ba:	5b                   	pop    %ebx
    10bb:	5e                   	pop    %esi
    10bc:	5f                   	pop    %edi
    10bd:	5d                   	pop    %ebp
    10be:	c3                   	ret    
    10bf:	90                   	nop

000010c0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	53                   	push   %ebx
    10c6:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10c9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    10cc:	8b 15 64 28 00 00    	mov    0x2864,%edx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    10d2:	8d 78 07             	lea    0x7(%eax),%edi
    10d5:	c1 ef 03             	shr    $0x3,%edi
    10d8:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    10db:	85 d2                	test   %edx,%edx
    10dd:	0f 84 a3 00 00 00    	je     1186 <malloc+0xc6>
    10e3:	8b 02                	mov    (%edx),%eax
    10e5:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    10e8:	39 cf                	cmp    %ecx,%edi
    10ea:	76 74                	jbe    1160 <malloc+0xa0>
    10ec:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
    10f2:	be 00 10 00 00       	mov    $0x1000,%esi
    10f7:	8d 1c fd 00 00 00 00 	lea    0x0(,%edi,8),%ebx
    10fe:	0f 43 f7             	cmovae %edi,%esi
    1101:	ba 00 80 00 00       	mov    $0x8000,%edx
    1106:	81 ff ff 0f 00 00    	cmp    $0xfff,%edi
    110c:	0f 46 da             	cmovbe %edx,%ebx
    110f:	eb 10                	jmp    1121 <malloc+0x61>
    1111:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1118:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    111a:	8b 48 04             	mov    0x4(%eax),%ecx
    111d:	39 cf                	cmp    %ecx,%edi
    111f:	76 3f                	jbe    1160 <malloc+0xa0>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1121:	39 05 64 28 00 00    	cmp    %eax,0x2864
    1127:	89 c2                	mov    %eax,%edx
    1129:	75 ed                	jne    1118 <malloc+0x58>
  char *p;
  Header *hp;

  if(nu < 4096)
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    112b:	83 ec 0c             	sub    $0xc,%esp
    112e:	53                   	push   %ebx
    112f:	e8 76 fc ff ff       	call   daa <sbrk>
  if(p == (char*)-1)
    1134:	83 c4 10             	add    $0x10,%esp
    1137:	83 f8 ff             	cmp    $0xffffffff,%eax
    113a:	74 1c                	je     1158 <malloc+0x98>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    113c:	89 70 04             	mov    %esi,0x4(%eax)
  free((void*)(hp + 1));
    113f:	83 ec 0c             	sub    $0xc,%esp
    1142:	83 c0 08             	add    $0x8,%eax
    1145:	50                   	push   %eax
    1146:	e8 e5 fe ff ff       	call   1030 <free>
  return freep;
    114b:	8b 15 64 28 00 00    	mov    0x2864,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1151:	83 c4 10             	add    $0x10,%esp
    1154:	85 d2                	test   %edx,%edx
    1156:	75 c0                	jne    1118 <malloc+0x58>
        return 0;
    1158:	31 c0                	xor    %eax,%eax
    115a:	eb 1c                	jmp    1178 <malloc+0xb8>
    115c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
    1160:	39 cf                	cmp    %ecx,%edi
    1162:	74 1c                	je     1180 <malloc+0xc0>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    1164:	29 f9                	sub    %edi,%ecx
    1166:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    1169:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    116c:	89 78 04             	mov    %edi,0x4(%eax)
      }
      freep = prevp;
    116f:	89 15 64 28 00 00    	mov    %edx,0x2864
      return (void*)(p + 1);
    1175:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1178:	8d 65 f4             	lea    -0xc(%ebp),%esp
    117b:	5b                   	pop    %ebx
    117c:	5e                   	pop    %esi
    117d:	5f                   	pop    %edi
    117e:	5d                   	pop    %ebp
    117f:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1180:	8b 08                	mov    (%eax),%ecx
    1182:	89 0a                	mov    %ecx,(%edx)
    1184:	eb e9                	jmp    116f <malloc+0xaf>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    1186:	c7 05 64 28 00 00 68 	movl   $0x2868,0x2864
    118d:	28 00 00 
    1190:	c7 05 68 28 00 00 68 	movl   $0x2868,0x2868
    1197:	28 00 00 
    base.s.size = 0;
    119a:	b8 68 28 00 00       	mov    $0x2868,%eax
    119f:	c7 05 6c 28 00 00 00 	movl   $0x0,0x286c
    11a6:	00 00 00 
    11a9:	e9 3e ff ff ff       	jmp    10ec <malloc+0x2c>
    11ae:	66 90                	xchg   %ax,%ax

000011b0 <run_thread>:

}

void
run_thread(void (*start_func)(void *), void*arg)
{
    11b0:	55                   	push   %ebp
    11b1:	89 e5                	mov    %esp,%ebp
    11b3:	56                   	push   %esi
    11b4:	53                   	push   %ebx
    11b5:	8b 75 0c             	mov    0xc(%ebp),%esi
    11b8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  printf(1, "---- running the function ----\n");
    11bb:	83 ec 08             	sub    $0x8,%esp
    11be:	68 80 1d 00 00       	push   $0x1d80
    11c3:	6a 01                	push   $0x1
    11c5:	e8 c6 fc ff ff       	call   e90 <printf>
  alarm(UTHREAD_QUANTA);
    11ca:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    11d1:	e8 04 fc ff ff       	call   dda <alarm>
  start_func(arg);
    11d6:	89 75 08             	mov    %esi,0x8(%ebp)
    11d9:	83 c4 10             	add    $0x10,%esp
}
    11dc:	8d 65 f8             	lea    -0x8(%ebp),%esp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
    11df:	89 d8                	mov    %ebx,%eax
}
    11e1:	5b                   	pop    %ebx
    11e2:	5e                   	pop    %esi
    11e3:	5d                   	pop    %ebp
void
run_thread(void (*start_func)(void *), void*arg)
{
  printf(1, "---- running the function ----\n");
  alarm(UTHREAD_QUANTA);
  start_func(arg);
    11e4:	ff e0                	jmp    *%eax
    11e6:	8d 76 00             	lea    0x0(%esi),%esi
    11e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000011f0 <uthread_exit>:
  return;
}

void
uthread_exit()
{
    11f0:	55                   	push   %ebp
    11f1:	89 e5                	mov    %esp,%ebp
    11f3:	53                   	push   %ebx
    11f4:	83 ec 10             	sub    $0x10,%esp
  alarm(0); // stopping the alarm until we finish exiting
    11f7:	6a 00                	push   $0x0
    11f9:	e8 dc fb ff ff       	call   dda <alarm>
  printf(1,"exiting...\n");
    11fe:	5a                   	pop    %edx
    11ff:	59                   	pop    %ecx
    1200:	68 f0 1e 00 00       	push   $0x1ef0
    1205:	6a 01                	push   $0x1
    1207:	e8 84 fc ff ff       	call   e90 <printf>
  /* check if i am the main thread*/
  if(threads[index_currently_running].thread_id == 0)
    120c:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    1211:	83 c4 10             	add    $0x10,%esp
    1214:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    1217:	8b 1c 95 80 28 00 00 	mov    0x2880(,%edx,4),%ebx
    121e:	85 db                	test   %ebx,%ebx
    1220:	75 0a                	jne    122c <uthread_exit+0x3c>
  {
    threads[0].state = UNUSED_THREAD;
    1222:	c7 05 88 28 00 00 00 	movl   $0x0,0x2888
    1229:	00 00 00 
  }
  /* need to clean the thread field*/

  free(threads[index_currently_running].stack);
    122c:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    122f:	83 ec 0c             	sub    $0xc,%esp
    1232:	ff 34 85 84 28 00 00 	pushl  0x2884(,%eax,4)
    1239:	e8 f2 fd ff ff       	call   1030 <free>
  threads[index_currently_running].state = UNUSED_THREAD;
    123e:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    1243:	83 c4 10             	add    $0x10,%esp
    1246:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    1249:	b8 88 28 00 00       	mov    $0x2888,%eax
    124e:	c1 e2 02             	shl    $0x2,%edx
    1251:	c7 82 88 28 00 00 00 	movl   $0x0,0x2888(%edx)
    1258:	00 00 00 
  threads[index_currently_running].thread_id = -1;
    125b:	c7 82 80 28 00 00 ff 	movl   $0xffffffff,0x2880(%edx)
    1262:	ff ff ff 
  threads[index_currently_running].ebp = 0;
    1265:	c7 82 8c 28 00 00 00 	movl   $0x0,0x288c(%edx)
    126c:	00 00 00 
  threads[index_currently_running].esp = 0;
    126f:	c7 82 90 28 00 00 00 	movl   $0x0,0x2890(%edx)
    1276:	00 00 00 
  threads[index_currently_running].time_to_get_up = 0;
    1279:	c7 82 9c 28 00 00 00 	movl   $0x0,0x289c(%edx)
    1280:	00 00 00 
  threads[index_currently_running].join = -1;
    1283:	c7 82 a0 28 00 00 ff 	movl   $0xffffffff,0x28a0(%edx)
    128a:	ff ff ff 
    128d:	eb 0b                	jmp    129a <uthread_exit+0xaa>
    128f:	90                   	nop
    1290:	83 c0 24             	add    $0x24,%eax
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1293:	3d 88 31 00 00       	cmp    $0x3188,%eax
    1298:	74 15                	je     12af <uthread_exit+0xbf>
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
    129a:	83 38 04             	cmpl   $0x4,(%eax)
    129d:	75 f1                	jne    1290 <uthread_exit+0xa0>
        threads[i].state = RUNNABLE_THREAD;
    129f:	c7 00 02 00 00 00    	movl   $0x2,(%eax)
    12a5:	83 c0 24             	add    $0x24,%eax
  threads[index_currently_running].esp = 0;
  threads[index_currently_running].time_to_get_up = 0;
  threads[index_currently_running].join = -1;
  /* need to find another process to run */

  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    12a8:	3d 88 31 00 00       	cmp    $0x3188,%eax
    12ad:	75 eb                	jne    129a <uthread_exit+0xaa>
    12af:	bb ac 28 00 00       	mov    $0x28ac,%ebx
    12b4:	eb 15                	jmp    12cb <uthread_exit+0xdb>
    12b6:	8d 76 00             	lea    0x0(%esi),%esi
    12b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    12c0:	83 c3 24             	add    $0x24,%ebx
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
    12c3:	81 fb 88 31 00 00    	cmp    $0x3188,%ebx
    12c9:	74 24                	je     12ef <uthread_exit+0xff>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    12cb:	8b 03                	mov    (%ebx),%eax
    12cd:	85 c0                	test   %eax,%eax
    12cf:	74 ef                	je     12c0 <uthread_exit+0xd0>
    sigsend(getpid(),14);
    12d1:	e8 cc fa ff ff       	call   da2 <getpid>
    12d6:	83 ec 08             	sub    $0x8,%esp
    12d9:	83 c3 24             	add    $0x24,%ebx
    12dc:	6a 0e                	push   $0xe
    12de:	50                   	push   %eax
    12df:	e8 e6 fa ff ff       	call   dca <sigsend>
    12e4:	83 c4 10             	add    $0x10,%esp
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == BLOCKED_THREAD) //wake up all blocked threads
        threads[i].state = RUNNABLE_THREAD;
      }

  for(int i = 1 ; i < MAX_UTHREADS ; i++){
    12e7:	81 fb 88 31 00 00    	cmp    $0x3188,%ebx
    12ed:	75 dc                	jne    12cb <uthread_exit+0xdb>
    if(threads[i].state != UNUSED_THREAD) // there is more thread to run
    sigsend(getpid(),14);
  
  }
  exit();
    12ef:	e8 2e fa ff ff       	call   d22 <exit>
    12f4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12fa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001300 <init_bsem>:
struct binarySemaphore binSemaphore[MAX_BSEM];
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
    1300:	55                   	push   %ebp
    1301:	ba a8 32 00 00       	mov    $0x32a8,%edx
    1306:	89 e5                	mov    %esp,%ebp
    1308:	90                   	nop
    1309:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1310:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
    1316:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
    131c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
    1320:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    1326:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
    1329:	39 d0                	cmp    %edx,%eax
    132b:	75 f3                	jne    1320 <init_bsem+0x20>
    132d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    1333:	81 fa a8 b8 00 00    	cmp    $0xb8a8,%edx
    1339:	75 d5                	jne    1310 <init_bsem+0x10>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
    133b:	c7 05 70 28 00 00 01 	movl   $0x1,0x2870
    1342:	00 00 00 
}
    1345:	5d                   	pop    %ebp
    1346:	c3                   	ret    
    1347:	89 f6                	mov    %esi,%esi
    1349:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001350 <bsem_alloc>:

int bsem_alloc() {
    1350:	55                   	push   %ebp
    1351:	89 e5                	mov    %esp,%ebp
    1353:	53                   	push   %ebx
    1354:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1357:	6a 00                	push   $0x0
    1359:	e8 7c fa ff ff       	call   dda <alarm>
  int i;
  if(first_run_bsem == 0)
    135e:	a1 70 28 00 00       	mov    0x2870,%eax
    1363:	83 c4 10             	add    $0x10,%esp
    1366:	85 c0                	test   %eax,%eax
    1368:	75 3b                	jne    13a5 <bsem_alloc+0x55>
    136a:	ba a8 32 00 00       	mov    $0x32a8,%edx
    136f:	90                   	nop
    1370:	8d 82 00 ff ff ff    	lea    -0x100(%edx),%eax
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
    1376:	c7 02 01 00 00 00    	movl   $0x1,(%edx)
    137c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
    1380:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    1386:	83 c0 04             	add    $0x4,%eax
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    binSemaphore[i].state = UNUSED;
	for (int j=0;j<MAX_UTHREADS;j++){
    1389:	39 d0                	cmp    %edx,%eax
    138b:	75 f3                	jne    1380 <bsem_alloc+0x30>
    138d:	8d 90 0c 01 00 00    	lea    0x10c(%eax),%edx
int binSemCounter = 1 ; //to give id's to semaphores  like 'id_number_thread' ;
int first_run_bsem = 0; // if 0 then first run
void
init_bsem()
{
  for(int i = 0; i <MAX_BSEM; i++) {
    1393:	81 fa a8 b8 00 00    	cmp    $0xb8a8,%edx
    1399:	75 d5                	jne    1370 <bsem_alloc+0x20>
	for (int j=0;j<MAX_UTHREADS;j++){
    binSemaphore[i].sleep[j] = -1;
	 }
  }
  //printf(1,"done init binary semaphore!\n");
  first_run_bsem=1;
    139b:	c7 05 70 28 00 00 01 	movl   $0x1,0x2870
    13a2:	00 00 00 
    13a5:	ba a8 32 00 00       	mov    $0x32a8,%edx
  if(first_run_bsem == 0)
  {
    init_bsem();
  }
  //search for unused semaphore
  for(i = 0; i <MAX_BSEM; i++) {
    13aa:	31 c0                	xor    %eax,%eax
    13ac:	eb 10                	jmp    13be <bsem_alloc+0x6e>
    13ae:	83 c0 01             	add    $0x1,%eax
    13b1:	81 c2 0c 01 00 00    	add    $0x10c,%edx
    13b7:	3d 80 00 00 00       	cmp    $0x80,%eax
    13bc:	74 4f                	je     140d <bsem_alloc+0xbd>
    if(binSemaphore[i].state == UNUSED)
    13be:	83 3a 01             	cmpl   $0x1,(%edx)
    13c1:	75 eb                	jne    13ae <bsem_alloc+0x5e>
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
    13c3:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
    13c9:	8b 15 ec 27 00 00    	mov    0x27ec,%edx
    binSemCounter++;
    binSemaphore[i].lock = 1; // not locked
    binSemaphore[i].state = USED;
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    13cf:	83 ec 0c             	sub    $0xc,%esp
    13d2:	6a 05                	push   $0x5
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].state == UNUSED)
    break;
  }
  if (i<MAX_BSEM){
    binSemaphore[i].id = binSemCounter;
    13d4:	8d 98 a0 31 00 00    	lea    0x31a0(%eax),%ebx
    13da:	89 90 a4 31 00 00    	mov    %edx,0x31a4(%eax)
    binSemCounter++;
    13e0:	83 c2 01             	add    $0x1,%edx
    13e3:	89 15 ec 27 00 00    	mov    %edx,0x27ec
    binSemaphore[i].lock = 1; // not locked
    13e9:	c7 80 a0 31 00 00 01 	movl   $0x1,0x31a0(%eax)
    13f0:	00 00 00 
    binSemaphore[i].state = USED;
    13f3:	c7 80 a8 32 00 00 00 	movl   $0x0,0x32a8(%eax)
    13fa:	00 00 00 
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    13fd:	e8 d8 f9 ff ff       	call   dda <alarm>
    return binSemaphore[i].id;
    1402:	8b 43 04             	mov    0x4(%ebx),%eax
    1405:	83 c4 10             	add    $0x10,%esp
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
}
    1408:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    140b:	c9                   	leave  
    140c:	c3                   	ret    
    // printf(1,"initialize semaphore in index %d, with id %d\n",i,binSemCounter-1);
    alarm(UTHREAD_QUANTA);
    return binSemaphore[i].id;
  }
  else{	//all semaphores are used
    printf(1,"all semaphores are being used\n");
    140d:	83 ec 08             	sub    $0x8,%esp
    1410:	68 a0 1d 00 00       	push   $0x1da0
    1415:	6a 01                	push   $0x1
    1417:	e8 74 fa ff ff       	call   e90 <printf>
    alarm(UTHREAD_QUANTA);
    141c:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1423:	e8 b2 f9 ff ff       	call   dda <alarm>
    return -1;
    1428:	83 c4 10             	add    $0x10,%esp
    142b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  }
}
    1430:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1433:	c9                   	leave  
    1434:	c3                   	ret    
    1435:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1439:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001440 <bsem_free>:

void bsem_free(int id) {
    1440:	55                   	push   %ebp
    1441:	89 e5                	mov    %esp,%ebp
    1443:	53                   	push   %ebx
    1444:	83 ec 10             	sub    $0x10,%esp
    1447:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
    144a:	6a 00                	push   $0x0
    144c:	e8 89 f9 ff ff       	call   dda <alarm>
    1451:	ba a4 31 00 00       	mov    $0x31a4,%edx
    1456:	83 c4 10             	add    $0x10,%esp
  int i;
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    1459:	31 c0                	xor    %eax,%eax
    145b:	eb 13                	jmp    1470 <bsem_free+0x30>
    145d:	8d 76 00             	lea    0x0(%esi),%esi
    1460:	83 c0 01             	add    $0x1,%eax
    1463:	81 c2 0c 01 00 00    	add    $0x10c,%edx
    1469:	3d 80 00 00 00       	cmp    $0x80,%eax
    146e:	74 38                	je     14a8 <bsem_free+0x68>
    if(binSemaphore[i].id == id) {
    1470:	39 1a                	cmp    %ebx,(%edx)
    1472:	75 ec                	jne    1460 <bsem_free+0x20>
      if (binSemaphore[i].state == UNUSED) {
    1474:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
    147a:	05 a0 31 00 00       	add    $0x31a0,%eax
    147f:	83 b8 08 01 00 00 01 	cmpl   $0x1,0x108(%eax)
    1486:	74 0a                	je     1492 <bsem_free+0x52>
      break;
    }
  }
  /* Semaphore is found*/
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    1488:	c7 80 08 01 00 00 01 	movl   $0x1,0x108(%eax)
    148f:	00 00 00 
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
    1492:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
    1499:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    149c:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
    149d:	e9 38 f9 ff ff       	jmp    dda <alarm>
    14a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (i<MAX_BSEM){
    binSemaphore[i].state = UNUSED;
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
    14a8:	83 ec 04             	sub    $0x4,%esp
    14ab:	53                   	push   %ebx
    14ac:	68 fc 1e 00 00       	push   $0x1efc
    14b1:	6a 01                	push   $0x1
    14b3:	e8 d8 f9 ff ff       	call   e90 <printf>
    14b8:	83 c4 10             	add    $0x10,%esp
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
    14bb:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
    // printf(1,"binary semaphore with index %d with id %d is now unused \n",i, id);
  }
  else
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}
    14c2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    14c5:	c9                   	leave  
  /* search for the Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    if(binSemaphore[i].id == id) {
      if (binSemaphore[i].state == UNUSED) {
        // printf(1,"binary semaphore in index %d, with id %d is already unused!\n",i,id);
        alarm(UTHREAD_QUANTA);
    14c6:	e9 0f f9 ff ff       	jmp    dda <alarm>
    14cb:	90                   	nop
    14cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000014d0 <bsem_down>:
  printf(1,"can't find id %d\n",id);
  alarm(UTHREAD_QUANTA);
}


void bsem_down(int id) {
    14d0:	55                   	push   %ebp
    14d1:	89 e5                	mov    %esp,%ebp
    14d3:	53                   	push   %ebx
    14d4:	83 ec 10             	sub    $0x10,%esp
    14d7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
    14da:	6a 00                	push   $0x0
    14dc:	e8 f9 f8 ff ff       	call   dda <alarm>
    14e1:	b8 a4 31 00 00       	mov    $0x31a4,%eax
    14e6:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    14e9:	31 d2                	xor    %edx,%edx
    14eb:	eb 17                	jmp    1504 <bsem_down+0x34>
    14ed:	8d 76 00             	lea    0x0(%esi),%esi
    14f0:	83 c2 01             	add    $0x1,%edx
    14f3:	05 0c 01 00 00       	add    $0x10c,%eax
    14f8:	81 fa 80 00 00 00    	cmp    $0x80,%edx
    14fe:	0f 84 8c 00 00 00    	je     1590 <bsem_down+0xc0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
    1504:	39 18                	cmp    %ebx,(%eax)
    1506:	75 e8                	jne    14f0 <bsem_down+0x20>
    1508:	8b 88 04 01 00 00    	mov    0x104(%eax),%ecx
    150e:	85 c9                	test   %ecx,%ecx
    1510:	75 de                	jne    14f0 <bsem_down+0x20>
    break;
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
    1512:	69 ca 0c 01 00 00    	imul   $0x10c,%edx,%ecx
    1518:	31 c0                	xor    %eax,%eax
    151a:	83 b9 a0 31 00 00 01 	cmpl   $0x1,0x31a0(%ecx)
    1521:	75 15                	jne    1538 <bsem_down+0x68>
    1523:	e9 93 00 00 00       	jmp    15bb <bsem_down+0xeb>
    1528:	90                   	nop
    1529:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    }
    else{ // can't take lock,need to sleep on semaphore
  //  printf(1, "lock is already taken - thread %d going to sleep on binary semaphore with id %d\n",threads[index_currently_running].thread_id, id);
	for (int j=0;j<MAX_UTHREADS;j++){
    1530:	83 c0 01             	add    $0x1,%eax
    1533:	83 f8 40             	cmp    $0x40,%eax
    1536:	74 7b                	je     15b3 <bsem_down+0xe3>
      if (binSemaphore[i].sleep[j] == -1){
    1538:	83 bc 81 a8 31 00 00 	cmpl   $0xffffffff,0x31a8(%ecx,%eax,4)
    153f:	ff 
    1540:	75 ee                	jne    1530 <bsem_down+0x60>
      binSemaphore[i].sleep[j] = threads[index_currently_running].thread_id;
    1542:	8b 0d a8 b7 00 00    	mov    0xb7a8,%ecx
    1548:	6b d2 43             	imul   $0x43,%edx,%edx
    154b:	01 c2                	add    %eax,%edx
    154d:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
    1550:	8b 04 85 80 28 00 00 	mov    0x2880(,%eax,4),%eax
    1557:	89 04 95 a8 31 00 00 	mov    %eax,0x31a8(,%edx,4)
	  break;
	  }
    }
  //  printf(1,"zZzzZzzzZzzz.....\n");
	 threads[index_currently_running].state = BLOCKED_THREAD;
    155e:	8d 04 c9             	lea    (%ecx,%ecx,8),%eax
    1561:	c7 04 85 88 28 00 00 	movl   $0x4,0x2888(,%eax,4)
    1568:	04 00 00 00 

	 sigsend(getpid(),14);
    156c:	e8 31 f8 ff ff       	call   da2 <getpid>
    1571:	83 ec 08             	sub    $0x8,%esp
    1574:	6a 0e                	push   $0xe
    1576:	50                   	push   %eax
    1577:	e8 4e f8 ff ff       	call   dca <sigsend>
    157c:	83 c4 10             	add    $0x10,%esp

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
    157f:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
    1586:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1589:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
    158a:	e9 4b f8 ff ff       	jmp    dda <alarm>
    158f:	90                   	nop
	 sigsend(getpid(),14);

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
    1590:	83 ec 04             	sub    $0x4,%esp
    1593:	53                   	push   %ebx
    1594:	68 c0 1d 00 00       	push   $0x1dc0
    1599:	6a 01                	push   $0x1
    159b:	e8 f0 f8 ff ff       	call   e90 <printf>
    15a0:	83 c4 10             	add    $0x10,%esp
alarm(UTHREAD_QUANTA);
    15a3:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
    15aa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15ad:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
    15ae:	e9 27 f8 ff ff       	jmp    dda <alarm>
    15b3:	8b 0d a8 b7 00 00    	mov    0xb7a8,%ecx
    15b9:	eb a3                	jmp    155e <bsem_down+0x8e>
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 1) { //if lock not taken
      // printf(1, "thread %d got lock for binary semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      binSemaphore[i].lock=0;
    15bb:	c7 81 a0 31 00 00 00 	movl   $0x0,0x31a0(%ecx)
    15c2:	00 00 00 

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
    15c5:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)
}
    15cc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    15cf:	c9                   	leave  

  }
}
else
printf(1,"you tried to lock a binary semaphore that does not exist! (id: %d)\n", id);
alarm(UTHREAD_QUANTA);
    15d0:	e9 05 f8 ff ff       	jmp    dda <alarm>
    15d5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    15d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000015e0 <bsem_up>:
}

void bsem_up(int id) {
    15e0:	55                   	push   %ebp
    15e1:	89 e5                	mov    %esp,%ebp
    15e3:	57                   	push   %edi
    15e4:	56                   	push   %esi
    15e5:	53                   	push   %ebx
    15e6:	83 ec 28             	sub    $0x28,%esp
    15e9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  alarm(0);
    15ec:	6a 00                	push   $0x0
    15ee:	e8 e7 f7 ff ff       	call   dda <alarm>
    15f3:	ba a4 31 00 00       	mov    $0x31a4,%edx
    15f8:	83 c4 10             	add    $0x10,%esp
  int i;
  /* searching for Semaphore */
  for(i = 0; i <MAX_BSEM; i++) {
    15fb:	31 c0                	xor    %eax,%eax
    15fd:	eb 15                	jmp    1614 <bsem_up+0x34>
    15ff:	90                   	nop
    1600:	83 c0 01             	add    $0x1,%eax
    1603:	81 c2 0c 01 00 00    	add    $0x10c,%edx
    1609:	3d 80 00 00 00       	cmp    $0x80,%eax
    160e:	0f 84 ac 00 00 00    	je     16c0 <bsem_up+0xe0>
    if(binSemaphore[i].id == id && binSemaphore[i].state == USED)
    1614:	39 1a                	cmp    %ebx,(%edx)
    1616:	75 e8                	jne    1600 <bsem_up+0x20>
    1618:	8b 8a 04 01 00 00    	mov    0x104(%edx),%ecx
    161e:	85 c9                	test   %ecx,%ecx
    1620:	75 de                	jne    1600 <bsem_up+0x20>
      break;
	  }
  }
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
    1622:	69 f8 0c 01 00 00    	imul   $0x10c,%eax,%edi
    1628:	8b 97 a0 31 00 00    	mov    0x31a0(%edi),%edx
    162e:	89 7d e4             	mov    %edi,-0x1c(%ebp)
    1631:	85 d2                	test   %edx,%edx
    1633:	0f 85 9c 00 00 00    	jne    16d5 <bsem_up+0xf5>
    1639:	31 ff                	xor    %edi,%edi
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
        if (binSemaphore[i].sleep[j] != -1){
    163b:	8b 75 e4             	mov    -0x1c(%ebp),%esi
    163e:	8b b4 be a8 31 00 00 	mov    0x31a8(%esi,%edi,4),%esi
    1645:	83 fe ff             	cmp    $0xffffffff,%esi
    1648:	74 56                	je     16a0 <bsem_up+0xc0>
    164a:	b9 80 28 00 00       	mov    $0x2880,%ecx
    164f:	31 d2                	xor    %edx,%edx
    1651:	eb 10                	jmp    1663 <bsem_up+0x83>
    1653:	90                   	nop
    1654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
    1658:	83 c2 01             	add    $0x1,%edx
    165b:	83 c1 24             	add    $0x24,%ecx
    165e:	83 fa 40             	cmp    $0x40,%edx
    1661:	74 3d                	je     16a0 <bsem_up+0xc0>
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
    1663:	8b 19                	mov    (%ecx),%ebx
    1665:	39 de                	cmp    %ebx,%esi
    1667:	75 ef                	jne    1658 <bsem_up+0x78>
    1669:	83 fb ff             	cmp    $0xffffffff,%ebx
    166c:	74 ea                	je     1658 <bsem_up+0x78>
              threads[h].state=RUNNABLE_THREAD;
              binSemaphore[i].sleep[j] =- 1;
    166e:	6b c0 43             	imul   $0x43,%eax,%eax

          //found a blocked thread
          for (int h=0;h<MAX_UTHREADS;h++){
            //search for index of thread with id to give him the lock
            if (threads[h].thread_id != -1 && threads[h].thread_id ==   binSemaphore[i].sleep[j]){
              threads[h].state=RUNNABLE_THREAD;
    1671:	8d 14 d2             	lea    (%edx,%edx,8),%edx
    1674:	c7 04 95 88 28 00 00 	movl   $0x2,0x2888(,%edx,4)
    167b:	02 00 00 00 
              binSemaphore[i].sleep[j] =- 1;
    167f:	01 c7                	add    %eax,%edi
    1681:	c7 04 bd a8 31 00 00 	movl   $0xffffffff,0x31a8(,%edi,4)
    1688:	ff ff ff ff 
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
    168c:	c7 45 08 05 00 00 00 	movl   $0x5,0x8(%ebp)

}
    1693:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1696:	5b                   	pop    %ebx
    1697:	5e                   	pop    %esi
    1698:	5f                   	pop    %edi
    1699:	5d                   	pop    %ebp
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
  alarm(UTHREAD_QUANTA);
    169a:	e9 3b f7 ff ff       	jmp    dda <alarm>
    169f:	90                   	nop
  /* found */
  if (i<MAX_BSEM){
    if(binSemaphore[i].lock == 0) { //lock is taken
      // printf(1, "thread %d want to free semaphore with id %d \n",threads[index_currently_running].thread_id, id);
      int j;
      for (j=0;j<MAX_UTHREADS;j++){
    16a0:	83 c7 01             	add    $0x1,%edi
    16a3:	83 ff 40             	cmp    $0x40,%edi
    16a6:	75 93                	jne    163b <bsem_up+0x5b>
      }
	  cont:
      if(j  == MAX_UTHREADS){
      // there is no blocked thread
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
    16a8:	69 c0 0c 01 00 00    	imul   $0x10c,%eax,%eax
    16ae:	c7 80 a0 31 00 00 01 	movl   $0x1,0x31a0(%eax)
    16b5:	00 00 00 
    16b8:	eb d2                	jmp    168c <bsem_up+0xac>
    16ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      printf(1, "lock is free - wasted operation\n" );
    }
  }
  /* didnt found */
  else
    printf(1,"you tried to free a binary semaphore that does not exist! (id: %d)\n", id);
    16c0:	83 ec 04             	sub    $0x4,%esp
    16c3:	53                   	push   %ebx
    16c4:	68 28 1e 00 00       	push   $0x1e28
    16c9:	6a 01                	push   $0x1
    16cb:	e8 c0 f7 ff ff       	call   e90 <printf>
    16d0:	83 c4 10             	add    $0x10,%esp
    16d3:	eb b7                	jmp    168c <bsem_up+0xac>
	  // printf(1,"semaphore %d is now free!\n",id);
        binSemaphore[i].lock = 1;
      }
    }
    else{ // lock is free
      printf(1, "lock is free - wasted operation\n" );
    16d5:	83 ec 08             	sub    $0x8,%esp
    16d8:	68 04 1e 00 00       	push   $0x1e04
    16dd:	6a 01                	push   $0x1
    16df:	e8 ac f7 ff ff       	call   e90 <printf>
    16e4:	83 c4 10             	add    $0x10,%esp
    16e7:	eb a3                	jmp    168c <bsem_up+0xac>
    16e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

000016f0 <uthread_init>:
  start_func(arg);
}

int
uthread_init()
{
    16f0:	55                   	push   %ebp
    16f1:	89 e5                	mov    %esp,%ebp
    16f3:	83 ec 10             	sub    $0x10,%esp
  printf(1, "-------initializing the threads -------\n");
    16f6:	68 6c 1e 00 00       	push   $0x1e6c
    16fb:	6a 01                	push   $0x1
    16fd:	e8 8e f7 ff ff       	call   e90 <printf>
    1702:	b8 80 28 00 00       	mov    $0x2880,%eax
    1707:	83 c4 10             	add    $0x10,%esp
    170a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
  {
    threads[i].thread_id = -1; // if the thread is unused there is no id
    1710:	c7 00 ff ff ff ff    	movl   $0xffffffff,(%eax)
    threads[i].state = UNUSED_THREAD;
    1716:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    171d:	83 c0 24             	add    $0x24,%eax
    threads[i].ebp = 0;
    1720:	c7 40 e8 00 00 00 00 	movl   $0x0,-0x18(%eax)
    threads[i].esp = 0;
    1727:	c7 40 ec 00 00 00 00 	movl   $0x0,-0x14(%eax)
    threads[i].time_to_get_up = 0;
    172e:	c7 40 f8 00 00 00 00 	movl   $0x0,-0x8(%eax)
    threads[i].join=-1;
    1735:	c7 40 fc ff ff ff ff 	movl   $0xffffffff,-0x4(%eax)
uthread_init()
{
  printf(1, "-------initializing the threads -------\n");

  // Initializes the process’ threads table
  for(int i = 0 ; i < MAX_UTHREADS ; i++)
    173c:	3d 80 31 00 00       	cmp    $0x3180,%eax
    1741:	75 cd                	jne    1710 <uthread_init+0x20>

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
    1743:	83 ec 08             	sub    $0x8,%esp
    threads[i].esp = 0;
    threads[i].time_to_get_up = 0;
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
    1746:	c7 05 80 28 00 00 00 	movl   $0x0,0x2880
    174d:	00 00 00 
  threads[0].state = RUNNING_THREAD;
    1750:	c7 05 88 28 00 00 03 	movl   $0x3,0x2888
    1757:	00 00 00 

  id_number_thread = 1;
  index_currently_running = 0;
  currently_running = 0;
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
    175a:	68 f0 18 00 00       	push   $0x18f0
    175f:	6a 0e                	push   $0xe
    threads[i].join=-1;
  }
  //  Creates the main thread
  threads[0].thread_id = 0;
  threads[0].state = RUNNING_THREAD;
  threads[0].stack = 0;
    1761:	c7 05 84 28 00 00 00 	movl   $0x0,0x2884
    1768:	00 00 00 

  id_number_thread = 1;
    176b:	c7 05 a4 b7 00 00 01 	movl   $0x1,0xb7a4
    1772:	00 00 00 
  index_currently_running = 0;
    1775:	c7 05 a8 b7 00 00 00 	movl   $0x0,0xb7a8
    177c:	00 00 00 
  currently_running = 0;
    177f:	c7 05 80 31 00 00 00 	movl   $0x0,0x3180
    1786:	00 00 00 
  // Registers the SIGALRM handler to the uthread_schedule function
  signal(14,  (sighandler_t)(uthread_schedule));
    1789:	e8 34 f6 ff ff       	call   dc2 <signal>

  // Executes the alarm system call with parameter UTHREAD_QUANTA=5
  alarm(UTHREAD_QUANTA);
    178e:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1795:	e8 40 f6 ff ff       	call   dda <alarm>
  return 0;
}
    179a:	31 c0                	xor    %eax,%eax
    179c:	c9                   	leave  
    179d:	c3                   	ret    
    179e:	66 90                	xchg   %ax,%ax

000017a0 <uthread_create>:

int
uthread_create(void (*start_func)(void *), void*arg)
{
    17a0:	55                   	push   %ebp
    17a1:	89 e5                	mov    %esp,%ebp
    17a3:	56                   	push   %esi
    17a4:	53                   	push   %ebx
  alarm(0);
    17a5:	83 ec 0c             	sub    $0xc,%esp
    17a8:	6a 00                	push   $0x0
    17aa:	e8 2b f6 ff ff       	call   dda <alarm>
  printf(1, "------ creating a new thread ------\n");
    17af:	5b                   	pop    %ebx
    17b0:	5e                   	pop    %esi
    17b1:	68 98 1e 00 00       	push   $0x1e98
    17b6:	6a 01                	push   $0x1
    17b8:	e8 d3 f6 ff ff       	call   e90 <printf>
    17bd:	ba 88 28 00 00       	mov    $0x2888,%edx
    17c2:	83 c4 10             	add    $0x10,%esp
  /* serching for an empty process*/
  int free_thread = -1;
  for(int i = 0; i < MAX_UTHREADS ; i++)
    17c5:	31 c0                	xor    %eax,%eax
    17c7:	eb 12                	jmp    17db <uthread_create+0x3b>
    17c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    17d0:	83 c0 01             	add    $0x1,%eax
    17d3:	83 c2 24             	add    $0x24,%edx
    17d6:	83 f8 40             	cmp    $0x40,%eax
    17d9:	74 7d                	je     1858 <uthread_create+0xb8>
  {
    if(threads[i].state == UNUSED_THREAD)
    17db:	8b 0a                	mov    (%edx),%ecx
    17dd:	85 c9                	test   %ecx,%ecx
    17df:	75 ef                	jne    17d0 <uthread_create+0x30>
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    17e1:	8b 15 a4 b7 00 00    	mov    0xb7a4,%edx
    17e7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    17ea:	83 ec 0c             	sub    $0xc,%esp
    17ed:	68 00 10 00 00       	push   $0x1000
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
    17f2:	c1 e3 02             	shl    $0x2,%ebx
    17f5:	89 93 80 28 00 00    	mov    %edx,0x2880(%ebx)
  id_number_thread++;
    17fb:	83 c2 01             	add    $0x1,%edx
    17fe:	89 15 a4 b7 00 00    	mov    %edx,0xb7a4

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1804:	e8 b7 f8 ff ff       	call   10c0 <malloc>

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1809:	8b 55 08             	mov    0x8(%ebp),%edx

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
    180c:	c7 80 f4 0f 00 00 f0 	movl   $0x11f0,0xff4(%eax)
    1813:	11 00 00 
  /* naming the thread */
  threads[free_thread].thread_id = id_number_thread;
  id_number_thread++;

  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);
    1816:	89 83 84 28 00 00    	mov    %eax,0x2884(%ebx)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;
    181c:	c7 83 88 28 00 00 02 	movl   $0x2,0x2888(%ebx)
    1823:	00 00 00 
  /* creating the stack */
  threads[free_thread].stack = malloc(UTHREAD_STACK_SIZE);

  /* initializing the stack */
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 3*sizeof(int))) = (int)uthread_exit;
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - 2*sizeof(int))) = (int)start_func;
    1826:	89 90 f8 0f 00 00    	mov    %edx,0xff8(%eax)
  *((int*)(threads[free_thread].stack + UTHREAD_STACK_SIZE - sizeof(int))) = (int)arg;
    182c:	8b 55 0c             	mov    0xc(%ebp),%edx
    182f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%eax)

  /* changing the state*/
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
    1835:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    183c:	e8 99 f5 ff ff       	call   dda <alarm>
  return   threads[free_thread].thread_id;
    1841:	8b 83 80 28 00 00    	mov    0x2880(%ebx),%eax
    1847:	83 c4 10             	add    $0x10,%esp
}
    184a:	8d 65 f8             	lea    -0x8(%ebp),%esp
    184d:	5b                   	pop    %ebx
    184e:	5e                   	pop    %esi
    184f:	5d                   	pop    %ebp
    1850:	c3                   	ret    
    1851:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      break;
    }
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    1858:	83 ec 08             	sub    $0x8,%esp
    185b:	68 0e 1f 00 00       	push   $0x1f0e
    1860:	6a 01                	push   $0x1
    1862:	e8 29 f6 ff ff       	call   e90 <printf>
    alarm(UTHREAD_QUANTA);
    1867:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    186e:	e8 67 f5 ff ff       	call   dda <alarm>
    return -1;
    1873:	83 c4 10             	add    $0x10,%esp
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    1876:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no available threads! */
  if(free_thread == -1){
    printf(1, "there is no available thread\n");
    alarm(UTHREAD_QUANTA);
    return -1;
    1879:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  threads[free_thread].state = RUNNABLE_THREAD;


  alarm(UTHREAD_QUANTA);
  return   threads[free_thread].thread_id;
}
    187e:	5b                   	pop    %ebx
    187f:	5e                   	pop    %esi
    1880:	5d                   	pop    %ebp
    1881:	c3                   	ret    
    1882:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    1889:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001890 <contexSwitch>:
  contexSwitch(prev_index,index_currently_running);
  alarm(UTHREAD_QUANTA);
}


void contexSwitch(int prev_index,int next){
    1890:	55                   	push   %ebp
    1891:	89 e5                	mov    %esp,%ebp
    1893:	8b 45 08             	mov    0x8(%ebp),%eax
  // backup the current one and load the new one
  /* changing the current process state*/
  //printf(1, "prev is : %d next is : %d\n", prev_index, next);
 // printf(1, "prev state is : %d next state is : %d\n", (int)(threads[prev_index].state), (int)(threads[next].state));

  if (prev_index!=0 ){
    1896:	85 c0                	test   %eax,%eax
    1898:	74 14                	je     18ae <contexSwitch+0x1e>

    /* saving the previous thread ebp, esp*/
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    189a:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    189d:	89 e2                	mov    %esp,%edx
    189f:	8d 04 85 80 28 00 00 	lea    0x2880(,%eax,4),%eax
    18a6:	89 50 10             	mov    %edx,0x10(%eax)
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
    18a9:	89 ea                	mov    %ebp,%edx
    18ab:	89 50 0c             	mov    %edx,0xc(%eax)
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    18ae:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    18b3:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    18b6:	8d 04 85 80 28 00 00 	lea    0x2880(,%eax,4),%eax
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    18bd:	8b 50 10             	mov    0x10(%eax),%edx
    asm("movl %%esp, %0;" : "=r" (threads[prev_index].esp));
    asm("movl %%ebp, %0;" : "=r" (threads[prev_index].ebp));
  }

  /* loading the new thread*/
  threads[index_currently_running].state = RUNNING_THREAD;
    18c0:	c7 40 08 03 00 00 00 	movl   $0x3,0x8(%eax)
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
    18c7:	85 d2                	test   %edx,%edx
    18c9:	74 0d                	je     18d8 <contexSwitch+0x48>
    asm("jmp *%0 ;" : : "r" (run_thread));
  }
  else{ // this is not the first time we run
    /* we are loading the new esp and ebp*/
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    18cb:	89 d4                	mov    %edx,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
    18cd:	8b 40 0c             	mov    0xc(%eax),%eax
    18d0:	89 c5                	mov    %eax,%ebp
  }
  return;
}
    18d2:	5d                   	pop    %ebp
    18d3:	c3                   	ret    
    18d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  threads[index_currently_running].state = RUNNING_THREAD;
  if(threads[index_currently_running].esp == 0) // the process is new, need to load the function
  {

    /* we are moving form the addres %0(the variable) to the esp, ebp and finally we are loading the function to excute*/
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    18d8:	8b 40 04             	mov    0x4(%eax),%eax
    18db:	05 f4 0f 00 00       	add    $0xff4,%eax
    18e0:	89 c4                	mov    %eax,%esp
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].stack + UTHREAD_STACK_SIZE - 3*sizeof(int)));
    18e2:	89 c5                	mov    %eax,%ebp
    asm("jmp *%0 ;" : : "r" (run_thread));
    18e4:	b8 b0 11 00 00       	mov    $0x11b0,%eax
    18e9:	ff e0                	jmp    *%eax
    //printf(1,"proc is old\n");
    asm("movl %0, %%esp;" : : "r" (threads[index_currently_running].esp));
    asm("movl %0, %%ebp;" : : "r" (threads[index_currently_running].ebp));
  }
  return;
}
    18eb:	5d                   	pop    %ebp
    18ec:	c3                   	ret    
    18ed:	8d 76 00             	lea    0x0(%esi),%esi

000018f0 <uthread_schedule>:
  return   threads[free_thread].thread_id;
}

void
uthread_schedule()
{
    18f0:	55                   	push   %ebp
    18f1:	89 e5                	mov    %esp,%ebp
    18f3:	56                   	push   %esi
    18f4:	53                   	push   %ebx
    18f5:	8d 76 00             	lea    0x0(%esi),%esi
  start_schedule:
  alarm(0); // disabling alarm - don't want interrupts
    18f8:	83 ec 0c             	sub    $0xc,%esp
    18fb:	6a 00                	push   $0x0
    18fd:	e8 d8 f4 ff ff       	call   dda <alarm>
//  printf(1, "------ scheduleing ------\n");
  // int sleeping=0;
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    1902:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    1907:	83 c4 10             	add    $0x10,%esp
    190a:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    190d:	8d 14 95 80 28 00 00 	lea    0x2880(,%edx,4),%edx
    1914:	83 7a 08 03          	cmpl   $0x3,0x8(%edx)
    1918:	75 0b                	jne    1925 <uthread_schedule+0x35>
    191a:	85 c0                	test   %eax,%eax
    191c:	74 07                	je     1925 <uthread_schedule+0x35>
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
    191e:	c7 42 08 02 00 00 00 	movl   $0x2,0x8(%edx)
    1925:	bb 88 28 00 00       	mov    $0x2888,%ebx
    192a:	eb 0f                	jmp    193b <uthread_schedule+0x4b>
    192c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1930:	83 c3 24             	add    $0x24,%ebx
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1933:	81 fb 88 31 00 00    	cmp    $0x3188,%ebx
    1939:	74 55                	je     1990 <uthread_schedule+0xa0>
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    193b:	83 3b 01             	cmpl   $0x1,(%ebx)
    193e:	75 f0                	jne    1930 <uthread_schedule+0x40>
    1940:	8b 73 14             	mov    0x14(%ebx),%esi
    1943:	85 f6                	test   %esi,%esi
    1945:	0f 85 a5 00 00 00    	jne    19f0 <uthread_schedule+0x100>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
      threads[i].time_to_get_up = 0;
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    194b:	8b 43 18             	mov    0x18(%ebx),%eax
    194e:	83 f8 ff             	cmp    $0xffffffff,%eax
    1951:	74 dd                	je     1930 <uthread_schedule+0x40>
    1953:	8d 14 c0             	lea    (%eax,%eax,8),%edx
    1956:	8b 14 95 88 28 00 00 	mov    0x2888(,%edx,4),%edx
    195d:	85 d2                	test   %edx,%edx
    195f:	75 cf                	jne    1930 <uthread_schedule+0x40>
      printf(1,"thread %d waited for %d now i woke up! !@!@@!\n",threads[i].thread_id,threads[i].join);
    1961:	50                   	push   %eax
    1962:	ff 73 f8             	pushl  -0x8(%ebx)
    1965:	83 c3 24             	add    $0x24,%ebx
    1968:	68 c0 1e 00 00       	push   $0x1ec0
    196d:	6a 01                	push   $0x1
    196f:	e8 1c f5 ff ff       	call   e90 <printf>
      threads[i].join = -1;
    1974:	c7 43 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebx)
      threads[i].state = RUNNABLE_THREAD;
    197b:	c7 43 dc 02 00 00 00 	movl   $0x2,-0x24(%ebx)
    1982:	83 c4 10             	add    $0x10,%esp
  /* check if there any process to wake up*/
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    1985:	81 fb 88 31 00 00    	cmp    $0x3188,%ebx
    198b:	75 ae                	jne    193b <uthread_schedule+0x4b>
    198d:	8d 76 00             	lea    0x0(%esi),%esi
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1990:	8b 15 a8 b7 00 00    	mov    0xb7a8,%edx
  int check=1;
  for (int i=prev_index+1;check<=MAX_UTHREADS;i++) {
    1996:	b9 40 00 00 00       	mov    $0x40,%ecx
    199b:	8d 42 01             	lea    0x1(%edx),%eax
    199e:	eb 08                	jmp    19a8 <uthread_schedule+0xb8>
    19a0:	83 c0 01             	add    $0x1,%eax
    19a3:	83 e9 01             	sub    $0x1,%ecx
    19a6:	74 78                	je     1a20 <uthread_schedule+0x130>
    i=i%MAX_UTHREADS;
    19a8:	89 c3                	mov    %eax,%ebx
    19aa:	c1 fb 1f             	sar    $0x1f,%ebx
    19ad:	c1 eb 1a             	shr    $0x1a,%ebx
    19b0:	01 d8                	add    %ebx,%eax
    19b2:	83 e0 3f             	and    $0x3f,%eax
    19b5:	29 d8                	sub    %ebx,%eax
      if(threads[i].state != UNUSED_THREAD)
    19b7:	8d 1c c0             	lea    (%eax,%eax,8),%ebx
      //  printf(1,"thread id %d state %d\n",threads[i].thread_id,threads[i].state);
    if(threads[i].state == RUNNABLE_THREAD && i!=prev_index){
    19ba:	83 3c 9d 88 28 00 00 	cmpl   $0x2,0x2888(,%ebx,4)
    19c1:	02 
    19c2:	75 dc                	jne    19a0 <uthread_schedule+0xb0>
    19c4:	39 c2                	cmp    %eax,%edx
    19c6:	74 d8                	je     19a0 <uthread_schedule+0xb0>
      index_currently_running = i;
    19c8:	a3 a8 b7 00 00       	mov    %eax,0xb7a8
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
  {
      goto start_schedule;
  }

  contexSwitch(prev_index,index_currently_running);
    19cd:	83 ec 08             	sub    $0x8,%esp
    19d0:	50                   	push   %eax
    19d1:	52                   	push   %edx
    19d2:	e8 b9 fe ff ff       	call   1890 <contexSwitch>
  alarm(UTHREAD_QUANTA);
    19d7:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    19de:	e8 f7 f3 ff ff       	call   dda <alarm>
}
    19e3:	8d 65 f8             	lea    -0x8(%ebp),%esp
    19e6:	5b                   	pop    %ebx
    19e7:	5e                   	pop    %esi
    19e8:	5d                   	pop    %ebp
    19e9:	c3                   	ret    
    19ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  if (threads[index_currently_running].state == RUNNING_THREAD && index_currently_running!=0){
    //printf(1, "%d\n",(int)threads[prev_index].state );
    threads[index_currently_running].state = RUNNABLE_THREAD;
  }
  for(int i = 0 ; i < MAX_UTHREADS ; i++){
    if(threads[i].state == SLEEPING_THREAD && threads[i].time_to_get_up!=0 && threads[i].time_to_get_up <= uptime()){
    19f0:	e8 c5 f3 ff ff       	call   dba <uptime>
    19f5:	39 c6                	cmp    %eax,%esi
    19f7:	7f 17                	jg     1a10 <uthread_schedule+0x120>
    //  printf(1,"tread %d was sleeping now he woke up!!\n",threads[i].thread_id);
    //  printf(1,"current tick is %d\n",uptime());
      threads[i].state = RUNNABLE_THREAD;
    19f9:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
      threads[i].time_to_get_up = 0;
    19ff:	c7 43 14 00 00 00 00 	movl   $0x0,0x14(%ebx)
    1a06:	e9 25 ff ff ff       	jmp    1930 <uthread_schedule+0x40>
    1a0b:	90                   	nop
    1a0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    }
    if(threads[i].state == SLEEPING_THREAD && threads[i].join!= -1 && threads[threads[i].join].state == UNUSED_THREAD) {
    1a10:	83 3b 01             	cmpl   $0x1,(%ebx)
    1a13:	0f 84 32 ff ff ff    	je     194b <uthread_schedule+0x5b>
    1a19:	e9 12 ff ff ff       	jmp    1930 <uthread_schedule+0x40>
    1a1e:	66 90                	xchg   %ax,%ax
    1a20:	8d 04 d2             	lea    (%edx,%edx,8),%eax
      index_currently_running = i;
      break;
    }
    check++;
  }
  if (threads[index_currently_running].state != RUNNABLE_THREAD )
    1a23:	83 3c 85 88 28 00 00 	cmpl   $0x2,0x2888(,%eax,4)
    1a2a:	02 
    1a2b:	0f 85 c7 fe ff ff    	jne    18f8 <uthread_schedule+0x8>
      threads[i].state = RUNNABLE_THREAD;
    }
  }

  /* select a process to run using round robin method */
  int prev_index = index_currently_running;
    1a31:	89 d0                	mov    %edx,%eax
    1a33:	eb 98                	jmp    19cd <uthread_schedule+0xdd>
    1a35:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1a39:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001a40 <uthread_self>:
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1a40:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
  exit();
}

int
uthread_self()
{
    1a45:	55                   	push   %ebp
    1a46:	89 e5                	mov    %esp,%ebp
  return threads[index_currently_running].thread_id;
    1a48:	8d 04 c0             	lea    (%eax,%eax,8),%eax
}
    1a4b:	5d                   	pop    %ebp
}

int
uthread_self()
{
  return threads[index_currently_running].thread_id;
    1a4c:	8b 04 85 80 28 00 00 	mov    0x2880(,%eax,4),%eax
}
    1a53:	c3                   	ret    
    1a54:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    1a5a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00001a60 <uthread_join>:

int
uthread_join(int tid)
{
    1a60:	55                   	push   %ebp
    1a61:	89 e5                	mov    %esp,%ebp
    1a63:	56                   	push   %esi
    1a64:	53                   	push   %ebx
    1a65:	8b 75 08             	mov    0x8(%ebp),%esi
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    1a68:	39 35 a4 b7 00 00    	cmp    %esi,0xb7a4
    1a6e:	0f 8c ab 00 00 00    	jl     1b1f <uthread_join+0xbf>
    1a74:	89 f0                	mov    %esi,%eax
    1a76:	c1 e8 1f             	shr    $0x1f,%eax
    1a79:	84 c0                	test   %al,%al
    1a7b:	0f 85 9e 00 00 00    	jne    1b1f <uthread_join+0xbf>
    return -1;
  }
  alarm(0);
    1a81:	83 ec 0c             	sub    $0xc,%esp
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1a84:	31 db                	xor    %ebx,%ebx
uthread_join(int tid)
{
  if(tid > id_number_thread || tid < 0){ // checking if the tid is relevent
    return -1;
  }
  alarm(0);
    1a86:	6a 00                	push   $0x0
    1a88:	e8 4d f3 ff ff       	call   dda <alarm>
    1a8d:	b8 80 28 00 00       	mov    $0x2880,%eax
    1a92:	83 c4 10             	add    $0x10,%esp
    1a95:	eb 14                	jmp    1aab <uthread_join+0x4b>
    1a97:	89 f6                	mov    %esi,%esi
    1a99:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
  /* first we are looking for the process*/
  int found_tid = -1;
  for(int i = 0 ; i < MAX_UTHREADS ; i++) {
    1aa0:	83 c3 01             	add    $0x1,%ebx
    1aa3:	83 c0 24             	add    $0x24,%eax
    1aa6:	83 fb 40             	cmp    $0x40,%ebx
    1aa9:	74 55                	je     1b00 <uthread_join+0xa0>
    if(threads[i].thread_id == tid && threads[i].state!=UNUSED_THREAD){
    1aab:	3b 30                	cmp    (%eax),%esi
    1aad:	75 f1                	jne    1aa0 <uthread_join+0x40>
    1aaf:	8b 50 08             	mov    0x8(%eax),%edx
    1ab2:	85 d2                	test   %edx,%edx
    1ab4:	74 ea                	je     1aa0 <uthread_join+0x40>
    alarm(UTHREAD_QUANTA);
    return -1;
  }
  /* there is a process with this tid*/
  else{
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    1ab6:	53                   	push   %ebx
    1ab7:	ff 35 a8 b7 00 00    	pushl  0xb7a8
    1abd:	68 4a 1f 00 00       	push   $0x1f4a
    1ac2:	6a 01                	push   $0x1
    1ac4:	e8 c7 f3 ff ff       	call   e90 <printf>
    threads[index_currently_running].join=found_tid;
    1ac9:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    1ace:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1ad1:	8d 04 85 80 28 00 00 	lea    0x2880(,%eax,4),%eax
    1ad8:	89 58 20             	mov    %ebx,0x20(%eax)
    threads[index_currently_running].state=SLEEPING_THREAD;
    1adb:	c7 40 08 01 00 00 00 	movl   $0x1,0x8(%eax)
    sigsend(getpid(),14);
    1ae2:	e8 bb f2 ff ff       	call   da2 <getpid>
    1ae7:	5a                   	pop    %edx
    1ae8:	59                   	pop    %ecx
    1ae9:	6a 0e                	push   $0xe
    1aeb:	50                   	push   %eax
    1aec:	e8 d9 f2 ff ff       	call   dca <sigsend>
  }
  return 0;
    1af1:	83 c4 10             	add    $0x10,%esp

}
    1af4:	8d 65 f8             	lea    -0x8(%ebp),%esp
    printf(1,"thread %d waiting for %d\n",index_currently_running,found_tid);
    threads[index_currently_running].join=found_tid;
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;
    1af7:	31 c0                	xor    %eax,%eax

}
    1af9:	5b                   	pop    %ebx
    1afa:	5e                   	pop    %esi
    1afb:	5d                   	pop    %ebp
    1afc:	c3                   	ret    
    1afd:	8d 76 00             	lea    0x0(%esi),%esi
      break;
    }
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    1b00:	83 ec 04             	sub    $0x4,%esp
    1b03:	56                   	push   %esi
    1b04:	68 2c 1f 00 00       	push   $0x1f2c
    1b09:	6a 01                	push   $0x1
    1b0b:	e8 80 f3 ff ff       	call   e90 <printf>
    alarm(UTHREAD_QUANTA);
    1b10:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
    1b17:	e8 be f2 ff ff       	call   dda <alarm>
    return -1;
    1b1c:	83 c4 10             	add    $0x10,%esp
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1b1f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  }
  /* there is no process with this tid so we are returning*/
  if(found_tid == -1) {
    printf(1, "there is no id %d. returning\n", tid);
    alarm(UTHREAD_QUANTA);
    return -1;
    1b22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    threads[index_currently_running].state=SLEEPING_THREAD;
    sigsend(getpid(),14);
  }
  return 0;

}
    1b27:	5b                   	pop    %ebx
    1b28:	5e                   	pop    %esi
    1b29:	5d                   	pop    %ebp
    1b2a:	c3                   	ret    
    1b2b:	90                   	nop
    1b2c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00001b30 <uthread_sleep>:

int
uthread_sleep(int ticks)
{
    1b30:	55                   	push   %ebp
    1b31:	89 e5                	mov    %esp,%ebp
    1b33:	53                   	push   %ebx
    1b34:	83 ec 10             	sub    $0x10,%esp
  alarm(0);
    1b37:	6a 00                	push   $0x0
    1b39:	e8 9c f2 ff ff       	call   dda <alarm>
  threads[index_currently_running].time_to_get_up = uptime()+ticks;
    1b3e:	8b 1d a8 b7 00 00    	mov    0xb7a8,%ebx
    1b44:	e8 71 f2 ff ff       	call   dba <uptime>
    1b49:	03 45 08             	add    0x8(%ebp),%eax
    1b4c:	8d 14 db             	lea    (%ebx,%ebx,8),%edx
    1b4f:	89 04 95 9c 28 00 00 	mov    %eax,0x289c(,%edx,4)
  threads[index_currently_running].state = SLEEPING_THREAD;
    1b56:	a1 a8 b7 00 00       	mov    0xb7a8,%eax
    1b5b:	8d 04 c0             	lea    (%eax,%eax,8),%eax
    1b5e:	c7 04 85 88 28 00 00 	movl   $0x1,0x2888(,%eax,4)
    1b65:	01 00 00 00 
//  printf(1, "thread %d went to sleep for %d ticks, current time is %d  , i will sleep untill tick %d zZzzZzzzZzzz.... \n", index_currently_running,ticks,uptime(),threads[index_currently_running].time_to_get_up);
  sigsend(getpid(),14);
    1b69:	e8 34 f2 ff ff       	call   da2 <getpid>
    1b6e:	5a                   	pop    %edx
    1b6f:	59                   	pop    %ecx
    1b70:	6a 0e                	push   $0xe
    1b72:	50                   	push   %eax
    1b73:	e8 52 f2 ff ff       	call   dca <sigsend>
  return 0;
}
    1b78:	31 c0                	xor    %eax,%eax
    1b7a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1b7d:	c9                   	leave  
    1b7e:	c3                   	ret    
    1b7f:	90                   	nop

00001b80 <csem_alloc>:
#include "csem.h"
/* variables for counting semaphores*/


void csem_alloc(struct counting_semaphore *csem, int value)
{
    1b80:	55                   	push   %ebp
    1b81:	89 e5                	mov    %esp,%ebp
    1b83:	53                   	push   %ebx
    1b84:	83 ec 04             	sub    $0x4,%esp
    1b87:	8b 5d 08             	mov    0x8(%ebp),%ebx
  csem->value = value;
    1b8a:	8b 45 0c             	mov    0xc(%ebp),%eax
    1b8d:	89 43 08             	mov    %eax,0x8(%ebx)
  csem->bsem_1_id = bsem_alloc();
    1b90:	e8 bb f7 ff ff       	call   1350 <bsem_alloc>
    1b95:	89 03                	mov    %eax,(%ebx)
  csem->bsem_2_id = bsem_alloc();
    1b97:	e8 b4 f7 ff ff       	call   1350 <bsem_alloc>
    1b9c:	89 43 04             	mov    %eax,0x4(%ebx)
  // printf(1, "id 1 is : %d and id 2 is : %d\n", csem->bsem_1_id, csem->bsem_2_id);
}
    1b9f:	83 c4 04             	add    $0x4,%esp
    1ba2:	5b                   	pop    %ebx
    1ba3:	5d                   	pop    %ebp
    1ba4:	c3                   	ret    
    1ba5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    1ba9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001bb0 <csem_free>:
void csem_free(struct counting_semaphore *csem)
{
    1bb0:	55                   	push   %ebp
    1bb1:	89 e5                	mov    %esp,%ebp
    1bb3:	53                   	push   %ebx
    1bb4:	83 ec 10             	sub    $0x10,%esp
    1bb7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  /* cleaning */
  csem->value = 0;
    1bba:	c7 43 08 00 00 00 00 	movl   $0x0,0x8(%ebx)
  bsem_free(csem->bsem_1_id);
    1bc1:	ff 33                	pushl  (%ebx)
    1bc3:	e8 78 f8 ff ff       	call   1440 <bsem_free>
  bsem_free(csem->bsem_2_id);
    1bc8:	8b 43 04             	mov    0x4(%ebx),%eax
    1bcb:	83 c4 10             	add    $0x10,%esp
}
    1bce:	8b 5d fc             	mov    -0x4(%ebp),%ebx
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1bd1:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1bd4:	c9                   	leave  
void csem_free(struct counting_semaphore *csem)
{
  /* cleaning */
  csem->value = 0;
  bsem_free(csem->bsem_1_id);
  bsem_free(csem->bsem_2_id);
    1bd5:	e9 66 f8 ff ff       	jmp    1440 <bsem_free>
    1bda:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00001be0 <csem_down>:
}

void csem_down(struct counting_semaphore *csem)
{
    1be0:	55                   	push   %ebp
    1be1:	89 e5                	mov    %esp,%ebp
    1be3:	53                   	push   %ebx
    1be4:	83 ec 10             	sub    $0x10,%esp
    1be7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
    1bea:	ff 73 04             	pushl  0x4(%ebx)
    1bed:	e8 de f8 ff ff       	call   14d0 <bsem_down>
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
    1bf2:	58                   	pop    %eax
    1bf3:	ff 33                	pushl  (%ebx)
    1bf5:	e8 d6 f8 ff ff       	call   14d0 <bsem_down>
  csem->value--;
    1bfa:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value > 0) // can add more thread
    1bfd:	83 c4 10             	add    $0x10,%esp
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1c00:	83 e8 01             	sub    $0x1,%eax
  if(csem->value > 0) // can add more thread
    1c03:	85 c0                	test   %eax,%eax
{
  // printf(1, "in csem_down, value is : %d\n", csem->value);

  bsem_down(csem->bsem_2_id); // down for semaphore number 2
  bsem_down(csem->bsem_1_id); // down for semaphore number 1
  csem->value--;
    1c05:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value > 0) // can add more thread
    1c08:	7e 0e                	jle    1c18 <csem_down+0x38>
  {
    bsem_up(csem->bsem_2_id);
    1c0a:	83 ec 0c             	sub    $0xc,%esp
    1c0d:	ff 73 04             	pushl  0x4(%ebx)
    1c10:	e8 cb f9 ff ff       	call   15e0 <bsem_up>
    1c15:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
    1c18:	8b 03                	mov    (%ebx),%eax
}
    1c1a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c1d:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1c20:	c9                   	leave  
  csem->value--;
  if(csem->value > 0) // can add more thread
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c21:	e9 ba f9 ff ff       	jmp    15e0 <bsem_up>
    1c26:	8d 76 00             	lea    0x0(%esi),%esi
    1c29:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00001c30 <csem_up>:
}

void csem_up(struct counting_semaphore *csem)
{
    1c30:	55                   	push   %ebp
    1c31:	89 e5                	mov    %esp,%ebp
    1c33:	53                   	push   %ebx
    1c34:	83 ec 10             	sub    $0x10,%esp
    1c37:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bsem_down(csem->bsem_1_id);
    1c3a:	ff 33                	pushl  (%ebx)
    1c3c:	e8 8f f8 ff ff       	call   14d0 <bsem_down>
  csem->value++;
    1c41:	8b 43 08             	mov    0x8(%ebx),%eax
  if(csem->value == 1)
    1c44:	83 c4 10             	add    $0x10,%esp
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1c47:	83 c0 01             	add    $0x1,%eax
  if(csem->value == 1)
    1c4a:	83 f8 01             	cmp    $0x1,%eax
}

void csem_up(struct counting_semaphore *csem)
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
    1c4d:	89 43 08             	mov    %eax,0x8(%ebx)
  if(csem->value == 1)
    1c50:	74 0e                	je     1c60 <csem_up+0x30>
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c52:	8b 03                	mov    (%ebx),%eax
}
    1c54:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c57:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1c5a:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c5b:	e9 80 f9 ff ff       	jmp    15e0 <bsem_up>
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1c60:	83 ec 0c             	sub    $0xc,%esp
    1c63:	ff 73 04             	pushl  0x4(%ebx)
    1c66:	e8 75 f9 ff ff       	call   15e0 <bsem_up>
  }
  bsem_up(csem->bsem_1_id);
    1c6b:	8b 03                	mov    (%ebx),%eax
{
  bsem_down(csem->bsem_1_id);
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
    1c6d:	83 c4 10             	add    $0x10,%esp
  }
  bsem_up(csem->bsem_1_id);
}
    1c70:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c73:	89 45 08             	mov    %eax,0x8(%ebp)
}
    1c76:	c9                   	leave  
  csem->value++;
  if(csem->value == 1)
  {
    bsem_up(csem->bsem_2_id);
  }
  bsem_up(csem->bsem_1_id);
    1c77:	e9 64 f9 ff ff       	jmp    15e0 <bsem_up>
