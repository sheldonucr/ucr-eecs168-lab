# Pre-Lab

## ENGR account


ENGR account is different than your UCR NetID. It is not combination with numbers (tkim049, this is UCR NetID). If you never activated your ENGR account, or you have an ENGR account but you forgot your password, then please visit [here](https://www.engr.ucr.edu/secured/systems/login.php) and create your one.

For GPP/UCR Extension students, please go to ECE systems (WCH107) and request your temporarily account in person.

## GitHUB

For this class, you need to register and keep watching this lab repository. Please register github first.

go to [github.com](http://github.com) and follow the screenshots below.

![github](images/lab0-07.png)

After you register, you need to login and go to our lab repository [github.com/sheldonucr/ucr-eecs168-lab](https://github.com/sheldonucr/ucr-eecs168-lab). You need to press watching and star as seen below.

![github](images/lab0-08.png)

## ENGR X-windows systems access

### Windows

The college provides three computational servers for student use both on and off campus. These computational servers provide our IC design toolchains.

To access these servers on Windows, you must first download and install an SSH client (putty) and an X Server (Xming).  Once you have finished downloading the links below.

#### Install `Xming` and `putty`

To install `putty` and `Xming` in your computer, you can find an instruction at [ here ](http://www.geo.mtu.edu/geoschem/docs/putty_install.html)


#### Configure `Xming` and `putty`

Find `Xming` in the start menu, and launch first. You should be able to find `Xming` in the system tray.

Then, you find `putty` and launch, the following screen is popped up.
and you can put hostname `bender.engr.ucr.edu` and put your user id. The most important thing is to enable X11 forwarding in the `putty`.

![putty1](images/lab0-03.png)
![putty1](images/lab0-06.png)


**Again, you need to run `Xming` first and then `putty` later**

If you cannot install `Xming` on your computer, you can use `VcXsrv`. You can download it at [ here ] (https://sourceforge.net/projects/vcxsrv/)

### OSX/Linux

For OSX/Linux, you do not need to install SSH/Xwindows tools as these are default software in these operating systems.

For OSX, make sure you have XQuartz on your mac.

We connect `bender.engr.ucr.edu` server thru SSH with X-forwarding service.


For OSX/Linux, you can type following command in your terminal,

`ssh -Y [ENGRID]@bender.engr.ucr.edu`

For example

`ssh -Y tkim@bender.engr.ucr.edu`

### VPN(if needed)
If you are using your own laptop to login the bender and blocked by your firewall, you can try the vpn which can be found at https://ucrsupport.service-now.com/ucr_portal/?id=kb_article&sys_id=e7499d251b6188d0750b11bebd4bcb75. The ucr vpn address is: 
vpn.ucr.edu/engineering

## Check Synopsys Galaxy Custom Designer Launch

We already preconfigured every IC design environment, so you do not need to set any environment. You can check toolchain is correctly working. Once you log in `bender.engr.ucr.edu`, you can check if Synopsys tool is working correctly by typing the following command.

`cdesigner&`

Once you see the following screen, then it is ready for next lab.

![Synopsys launch](images/lab0-01.png)

![Synopsys cdesigner](images/lab0-02.png)

If you have any question, then you can post your question at issue section in this github.
