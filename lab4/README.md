# Lab/Tutorial 4

In this tutorial, some contexts use Synopsys tutorials from Hamid Nahmoodi (SFSU) and John Sanguinetti (verilog dot com). All the tools and EDK are given thru Synopsys University Program. Some lab examples are referred from [MIT 6.375](http://csg.csail.mit.edu/6.375/6_375_2016_www/index.html) and [UCSD CSE141L](https://cseweb.ucsd.edu/classes/wi08/cse141L/Slides/verilog_deux.pdf).

## Introduction

In this tutorial, you will learn how to do RTL (register transfer level) design to build your circuit with HDL (hardware description language) for EDA (electronic design automation)

This work design for three weeks lab, so for your lab report, you need to design three sets of HDLs, which are 4-bit binary full adder, finite state machine, greatest common devisor (gcd), and finally full-chip design.


In this lab4, we introduce Synopsys RTL design toolkit, which are VCS, Design Compiler, IC Compiler, VCS RTL Verification solution.


In this lab, you need to review at least 2 hours for the following website to review your Verilog programming skill, debugging method, and design examples. After 2 hours review, you need to follow RTL design step to make the final layout with design automation process.



## Lab4 Schedule

Lab4 is 3-week lab and here are the details for given lab

- Lab4-week1: Verilog Review, 4-bit full adder Chip, FSM chip design.

- Lab4-week2: RTL Practical Programming for your GCD design.

- Lab4-week3: Full-chip synthesis design and layout for Synopsys ChipTop processor with Timing, Area, and Power Analysis of PrimeTime


## Lab4-Week1: Part 1. HDL (Hardware Description Language)- Verilog Language

We will use Verilog, which is standardized as IEEE 1364, a hardware description language (HDL) used to model electronic systems. It is most commonly used in the design and verification of digital circuits at the register-transfer level (RTL) of abstraction. ([refer Wikipedia](https://en.wikipedia.org/wiki/Verilog))

Here is Verilog tutorials consist of 5 Chapters as follows:

| Chapter  | Title | Detail |
| -------- | ------ | ------- |
| 1 | Introduction, Hierarchy, and Modeling Structures. | This section provides background about the history of Verilog. It also introduces some of the basic structures of Verilog models. |
| 2 | Syntax, Lexical Conventions, Data Types, and Memories | This section addresses the syntax and semantics of the core features of the language. |
| 3 | Expressions and Simulation Mechanics | This section covers the components of Verilog expressions and the order of execution in Verilog models. |
| 4 | Gate Level Modeling | This section covers gate level modeling constructs. It covers the semantics of Verilog primitives, port expressions, delays, strengths, and user-defined primitives. |
| 5 | Behavioral and Register Transfer Level Modeling | This section covers the remainder of the language basics: assignments of all kinds, control constructs, time and event controls, tasks and functions, and examples. |

You need to review from chapter 1 thru Chapter 5, Chapter 5-9 can be references for your Verilog programming.

You need to provide all your answers for the each question to get checked off at the end of the lab. So please open text editor/ms office word and write down all the answers to show TA for the check-off.

Go to the following Verilog tutorial

__[Click here for Verilog Tutorial](http://vol.verilog.com/VOL/main.htm)__

You should finish this tutorial first for 2 hours at least.


There is better explanation for Verolog Operators [Click Here](https://embeddedmicro.com/tutorials/mojo/verilog-operators) - Thanks, Brandon

__This lab requires individual lab! You cannot do any partner work anymore.__


## Lab4-Week1: Part 2. Synopsys Verilog Compiler Simulator (Verilog Compiler ) Tutorial

For the Verilog editor, `vi` or `emacs` is recommended, but if you're beginner of Linux system, you can use `nano`, it's your choice.

Synopsys Verilog Compiler Simulator is a tool from Synopsys specifically designed to simulate and debug designs. This tutorial basically describes how to use VCS, simulate a verilog description of a design and learn to debug the design. VCS also uses VirSim, which is a graphical user interface to VCS used for debugging and viewing the waveforms.

There are three main steps in debugging the design, which are as follows
1. Compiling the Verilog/VHDL source code.
1. Running the Simulation.
1. Viewing and debugging the generated waveforms.

You can interactively do the above steps using the VCS tool. VCS first compiles the
verilog source code into object files, which are nothing but C source files. VCS can
compile the source code into the object files without generating assembly language files.
VCS then invokes a C compiler to create an executable file. We use this executable file to
simulate the design. You can use the command line to execute the binary file which
creates the waveform file

In this tutorial, we would be using a simple counter example . Find the verilog code and
testbench at the end of the tutorial.

- RTL Source code:

[counter.v](https://raw.githubusercontent.com/sheldonucr/ucr-eecs168-lab/master/lab4/counter.v)

- Testbench of RTL:

[counter_tb.v](https://raw.githubusercontent.com/sheldonucr/ucr-eecs168-lab/master/lab4/counter_tb.v)

From server, you can create your RTL folder and download

Under your eecs168 folder,

```
mkdir lab4-rtl
cd lab4-rtl
mkdir counter
cd counter
```

and download two files

```
wget https://raw.githubusercontent.com/sheldonucr/ucr-eecs168-lab/master/lab4/counter.v
wget https://raw.githubusercontent.com/sheldonucr/ucr-eecs168-lab/master/lab4/counter_tb.v
```

1. In the “lab4-rtl” directory, compile the verilog source code by typing the following at the
machine prompt.
```
vcs counter_tb.v counter.v +v2k
```

You can see the following successful compilation message

```
Warning-[LNX_OS_VERUN] Unsupported Linux version
  Linux version 'CentOS release 6.7 (Final)' is not supported on 'x86_64'
  officially, assuming linux compatibility by default. Set VCS_ARCH_OVERRIDE
  to linux or suse32 to override.
  Please refer to release notes for information on supported platforms.

                         Chronologic VCS (TM)
         Version K-2015.09-SP1-1 -- Mon Feb 22 13:43:12 2016
               Copyright (c) 1991-2015 by Synopsys Inc.
                         ALL RIGHTS RESERVED

This program is proprietary and confidential information of Synopsys Inc.
and may be used and disclosed only as authorized in a license agreement
controlling such use and disclosure.

Parsing design file 'counter_tb.v'
Parsing design file 'counter.v'
Top Level Modules:
       timeunit
       counter_testbench
TimeScale is 1 ns / 10 ps
Starting vcs inline pass...
2 modules and 0 UDP read.
recompiling module timeunit
recompiling module counter_testbench
Both modules done.
make: Warning: File `filelist.cu' has modification time 0.17 s in the future
make[1]: Warning: File `filelist.cu' has modification time 0.16 s in the future
rm -f _csrc*.so linux_scvhdl_*.so pre_vcsobj_*.so share_vcsobj_*.so
make[1]: warning:  Clock skew detected.  Your build may be incomplete.
make[1]: Warning: File `filelist.cu' has modification time 0.15 s in the future
make[1]: warning:  Clock skew detected.  Your build may be incomplete.
if [ -x ../simv ]; then chmod -x ../simv; fi
g++  -o ../simv   -Wl,-rpath-link=./ -Wl,-rpath='$ORIGIN'/simv.daidir/ -Wl,-rpath=./simv.daidir/ -Wl,-rpath='$ORIGIN'/simv.daidir//scsim.db.dir  -m32 -m32 -rdynamic   amcQwB.o objs/amcQw_d.o   _22827_archive_1.so  SIM_l.o       rmapats_mop.o rmapats.o rmar.o  rmar_llvm_0_1.o rmar_llvm_0_0.o          /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libzerosoft_rt_stubs.so /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libvirsim.so /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/liberrorinf.so /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libsnpsmalloc.so    /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libvcsnew.so /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libsimprofile.so /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libuclinative.so   -Wl,-whole-archive /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/libvcsucli.so -Wl,-no-whole-archive          /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/vcs_save_restore_new.o /usr/local/synopsys/K-2015.09-SP1-1/linux/lib/ctype-stubs_32.a -ldl  -lc -lm -lpthread -ldl
../simv up to date
make: warning:  Clock skew detected.  Your build may be incomplete.
CPU time: .132 seconds to compile + .249 seconds to elab + .230 seconds to link
```


Here, the `+v2k` option is used if you are using Verilog IEE 1364-2000 syntax; otherwise there
is no need for the option.

By default the output of compilation would be a executable binary file is named `simv`.
You can specify a different name with the -o compile-time option. VCS compiles the
source code on a module by module basis. You can incrementally compile your design
with VCS, since VCS compiles only the modules which have changed since the last
compilation.

Now, execute the simv command line with no arguments. You should see the output
from both vcs and simulation and should produce a waveform file called counter.dump in
your working directory.

```
./simv
```

Simulation result will be shown as below

```
Chronologic VCS simulator copyright 1991-2015
Contains Synopsys proprietary information.
Compiler version K-2015.09-SP1-1; Runtime version K-2015.09-SP1-1;  Feb 22 13:45 2016
time=    0 ns, clk=0, reset=0, out=xxxx
time=   10 ns, clk=1, reset=0, out=xxxx
time=   11 ns, clk=1, reset=1, out=xxxx
time=   20 ns, clk=0, reset=1, out=xxxx
time=   30 ns, clk=1, reset=1, out=xxxx
time=   31 ns, clk=1, reset=0, out=0000
time=   40 ns, clk=0, reset=0, out=0000
time=   50 ns, clk=1, reset=0, out=0000
time=   51 ns, clk=1, reset=0, out=0001
time=   60 ns, clk=0, reset=0, out=0001
time=   70 ns, clk=1, reset=0, out=0001
time=   71 ns, clk=1, reset=0, out=0010
time=   80 ns, clk=0, reset=0, out=0010
time=   90 ns, clk=1, reset=0, out=0010
time=   91 ns, clk=1, reset=0, out=0011
time=  100 ns, clk=0, reset=0, out=0011
time=  110 ns, clk=1, reset=0, out=0011
time=  111 ns, clk=1, reset=0, out=0100
time=  120 ns, clk=0, reset=0, out=0100
time=  130 ns, clk=1, reset=0, out=0100
time=  131 ns, clk=1, reset=0, out=0101
time=  140 ns, clk=0, reset=0, out=0101
time=  150 ns, clk=1, reset=0, out=0101
time=  151 ns, clk=1, reset=0, out=0110
time=  160 ns, clk=0, reset=0, out=0110
time=  170 ns, clk=1, reset=0, out=0110
All tests completed sucessfully


$finish called from file "counter_tb.v", line 55.
$finish at simulation time  171.0 ns
           V C S   S i m u l a t i o n   R e p o r t
Time: 171000 ps
CPU Time:      0.350 seconds;       Data structure size:   0.0Mb
Mon Feb 22 13:45:00 2016

```



## Lab4-Week1: Part 3. Design Compiler for Synthesis

In this tutorial you will gain experience using Synopsys Design Compiler (DC) to perform hardware synthesis. A synthesis tool takes an RTL hardware description and a standard cell library as input and produces a gatelevel netlist as output. The resulting gate-level netlist is a completely structural description with standard cells only at the leaves of the design.

Internally, a synthesis tool performs many steps including high-level RTL optimizations, RTL to unoptimized boolean logic, technology independent optimizations, and finally technology mapping to the available standard cells. Good RTL designers will familiarize themselves with the target standard cell library so that they can develop an intuition on how their RTL will be synthesized into gates.

In this tutorial you will use Synopsys Design Compiler to elaborate the RTL for our example 4-bit full adder circuit, set optimization constraints, synthesize the design to gates, and prepare various area and timing reports. You will also learn how to read the various DC text reports and how to use the graphical Synopsys Design Vision tool to visualize the synthesized design.

First, go to `lab4-rtl` folder and make workspace folder for `4-bit full adder`

open 'vi', 'emacs', or 'nano' to edit this file

```
nano fa_4bit.v
```

`fa_4bit.v` file should contain the following code

```
module fa_4bit( cin, cout, ain, bin, sum );

	input cin;
	input [3:0] ain, bin;
	output [3:0] sum;
	output cout;

	assign {cout,sum} = ain + bin + cin;

endmodule // fa_4bit

```

One Verilog file is ready. We need to do SYNTHESIS, which is a transformation process from RTL to gate-level design (another synthesized Verilog). Type the following command to launch Design Compiler.

```
dc_shell
```

- launch dc_shell for design compiler.
![fig1](images/fig1.png)

_**Fig. 1. Launch Design Compiler**_

- launch gui_start for design vision, which is GUI interface for design compiler
![fig2](images/fig2.png)

_**Fig. 2. Launch Design Vision for GUI Version of Design Compiler**_

First we need to choose Synopsys 90nm model for design process.

- File-> Setup and choose model for your library
![fig3](images/fig3.png)

_**Fig. 3. Choose Setup for library setup.**_

click Link library and put the following paths
- Link library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db
```
- Target Library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db
```
- Symbol Library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/icons/saed90nm.sdb
```

![fig4](images/fig4.png)

_**Fig. 4. Application setup window**_

Now, we need to set logic VDD and VSS net wire name.

in the dc_shell command shell at the bottom, the following inputs should be typed.

```
set mw_logic1_net "VDD"
```
![fig5](images/fig5.png)

_**Fig. 5. VDD Setup**_

```
set mw_logic0_net "VSS"
```
![fig6](images/fig6.png)

_**Fig. 6. VSS Setup**_


Use your 4-bit full adder you already typed.

You already made new Verilog file, (fa_4bit.v)


Syntax error checking for your Verilog file.

```
analyze -format verilog "fa_4bit.v"
```

Elaborate your design module, during elaboration DC will report all state inferences. This is a good way to verify that latches and flip-flops are not being accidentally inferred.

```
elaborate fa_4bit -architecture verilog -library DEFAULT
```

Link your design module

```
link
```

The check_design command checks that the design is consistent. You will not be able to synthesize your design until you eliminate all ERRORS. Many WARNINGS are not an issue, but it is still useful to skim through this output.

```
check_design
```

Compile your design module, The `compile` command begins the actual synthesis process that transforms your design into a gate-level netlist.

```
compile
```

After your compilation done, you need to create schematic of the synthesized RTL code.

Once you click the symbol (fa_4bit), you can see how it was compiled/synthesized.

We finished the synthesis and we need to generate output file for IC Compiler for layout.

```
write -format ddc -output "fa_4bit_synthesized.ddc"
```

We also need to create gate-level verilog synthesized file.

```
write -format verilog -output "fa_4bit_synthesized.v"
```

Now, we need to write a design constraint file.

```
write_sdc -nosplit "fa_4bit_const.sdc"
```

Now, it's time to use IC Compiler, so you need to exit Design Compiler

```
exit
```

Now, it's ready for placement and router for your IC.

## Lab4-Week1: Part 4. IC Compiler (ICC) for Placement and Routing Layout

In this tutorial you will gain experience transforming a gate-level netlist into a placed and routed layout using Synopsys IC Compiler (ICC). ICC takes a synthesized gate-level netlist and a standard cell library as input, then produces layout as an output.

To launch IC Compiler, you need to run the following command in the linux shell.

The first goal of a Place and Route (P&R) tool is to determine where each gate should be located on the physical chip (the placement portion of place and route). This process leverages heuristic algorithms to group related gates together in hopes of minimizing routing congestion and wire delay. Typically P&R tools will focus their effort on minimizing the delay through the critical path, and to this end will resize gates, insert new buffers, and even perform local re-synthesis. Additionally, P&R tools often have secondary algorithms to help reduce area for non-critical paths. After the placement, ICC will attempt to route the design while minimizing wire delay. Along with the routing, P&R tools often handle clock tree synthesis, power routing, and block level floorplanning.

For this tutorial we will generate layout for the gate-level netlist of the 4-bit full adder circuit synthesized in the previous section. Once the netlist has successfully been placed and routed, you should be able to see all the instantiated standard cells and routed metals of the physical implementation. We will then use the IC Compiler GUI to visualize the layout of your final placed and routed design.

```
icc_shell
```

To use GUI interface, you need to run the following command in the icc shell.

```
gui_start
```

![fig18](images/fig18.png)

_**Fig. 18. ICC launch**_

![fig19](images/fig19.png)

_**Fig. 19. ICC GUI launch**_

![fig20](images/fig20.png)

_**Fig. 20. Application Setup**_

click Link library and choose

- Link library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db
```
- Target Library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db
```

- Symbol Library
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/icons/saed90nm.sdb
```

![fig21](images/fig21.png)

_**Fig. 21. Setup the library in the application setup**_

![fig22](images/fig22.png)

_**Fig. 22. Create Library**_


Now, we need to create our own library

For the new library path, just click the folder button and choose the
current folder.

File-> Create library and type your new library name `fa_4bit_icc`

and then, you need to choose Technology file as follows:


```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/tech/saed90nm.tf
```

for input reference libraries, you need to add the following file.

```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr
```


make sure open library is checked

![fig23](images/fig23.png)

_**Fig. 23. Create Library**_


![fig24](images/fig24.png)

_**Fig. 24. TLU+**_

The parasitic RC (Resistance Capacitance) for interconnect is estimated through the use of TLU+ models, generated using STAR-RCXT an extraction tool from synopsys. TLU+ contains resistance and capacitance look up tables and model ultra deep submicron process effects. Now, we setup TLU+ for the parasitic RC model.

Next, you need to set TLU+

File-> Set TLU+

Max TLU+ file:
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/tlup/saed90nm_1p9m_1t_Cmax.tluplus
```

Min TLU+ file:
```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/tlup/saed90nm_1p9m_1t_Cmin.tluplus
```

Layer name mapping file

```
/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/tlup/tech2itf.map
```

![fig25](images/fig25.png)

_**Fig. 25. TLU+ setup**_


Now, we can start layout, so we need to import design

File-> Import -> Read Verilog, choose verilog and click [Add] button to add
synthesized verilog design what we made `fa_4bit_synthesized.v` and
click okay, then layout window will open below.

![fig26](images/fig26.png)

_**Fig. 26. Import Verilog**_

![fig27](images/fig27.png)

_**Fig. 27. Read Verilog**_

![fig28](images/fig28.png)

_**Fig. 28. Read synthesized gate-level Verilog**_

Now we can see the standard cells as layout


File->Import Design, choose SDC and import `fa_4bit_const.sdc` you
exported from Design Compiler.

![fig29](images/fig29.png)

_**Fig. 29. Standard Cell View**_

![fig30](images/fig30.png)

_**Fig. 30. Synopsys Design Constraints (SDC)**_

You need to save at least now for your design.

Go to File->Save

![fig32](images/fig32.png)

_**Fig. 32. Save your design**_

![fig33](images/fig33.png)

_**Fig. 33. Save your design**_


Now, we need to create power-ground network.

Go to Preroute -> Derive Power Ground Connection.

![fig34](images/fig34.png)

_**Fig. 34. Derive Power Ground Connection**_



Click Manual connection and put "VDD" in the power net and "VSS" in
the Ground net. Also put "VDD" in the Power pin and "VSS" in the
Ground pin. Create port should be "Top"

![fig35](images/fig35.png)

_**Fig. 35. Derive Power Ground Connection**_

Now, we need to create the floorplan. Floorplan -> Create Floorplan

For the spacing between core are and terminals, we can set 20um for left, right, bottom, and top.

![fig36](images/fig36.png)

_**Fig. 36. Floor plan**_

We can also write a floorplan.

```
create_floorplan -use_vertical_row -start_first_row -left_io2core 20 -bottom_io2core 20 -right_io2core 20 -top_io2core 20
```

![fig37](images/fig37.png)

_**Fig. 37. Floor plan**_

![fig38](images/fig38.png)

_**Fig. 38. Floor plan is ready**_


Let's do placement now

```
create_fp_placement
```
![fig39](images/fig39.png)

_**Fig. 39. Floor plan is ready**_

![fig40](images/fig40.png)

_**Fig. 40. Standard cell placed**_

Now, we make floorplan rail for VDD and VSS.

```
synthesize_fp_rail \
  -power_budget "1000" -voltage_supply "1.2" -target_voltage_drop "250" \
  -output_dir "./pna_output" -nets "VDD VSS" -create_virtual_rails "M1" \
  -synthesize_power_plan -synthesize_power_pads -use_strap_ends_as_pads
```
![fig42](images/fig42.png)

_**Fig. 42. Rail Placed**_

Once your rail is okay, you need to commit for the real rail in your design.

```
commit_fp_rail
```

![fig44](images/fig44.png)

_**Fig. 44. Rail Placed**_

After finishing placement, we need to have metal wire routing. So we need to have two following steps for the routing.

```
route_opt -initial_route_only
```

```
route_opt -skip_initial_route -effort low
```


![fig47](images/fig47.png)

_**Fig. 47. Routing Done**_

Finally, we need standard cell fillers, which are used to fill any spaces between regular library cells to avoid planarity problems. They are need when the density of the required metal or layer has not meet the foundry or fabrication requirement. Thus, you need to add it whether it is low or high frequency.

By the following command, we can put standard cell fillers.

```
insert_stdcell_filler \
 -cell_with_metal "SHFILL1 SHFILL2 SHFILL3" \
 -connect_to_power "VDD" -connect_to_ground "VSS"
```

![fig49](images/fig49.png)

_**Fig. 49. Final Layout after putting standard cell filler**_


## Lab4-Week2 : RTL Practical Programming for your GCD design.

### Design GCD Design

#### Part 1. Complete your RTL for GCD

**Caution! You have to train your Verilog skill youself to make this code. TA will not be easily helpful for your Verilog code debugging. Please refer __[Verilog Tutorial](http://vol.verilog.com/VOL/main.htm)__**.

Lab4-week2, we work on GCD algorithm, which is a popular algorithm for computing greatest common divisor (GCD) (TA provides some incomplete RTL designs for GCD algorithm, students complete RTL code and synthesize and generate Layout finally)

Here is GCD algorithm.

Following is the Euclid’s algorithm to compute GCD of two numbers, A and B. The algorithm was reported by J. Stein in 1967 and is available on the web at http://www.nist.gov/dads/HTML/binaryGCD.html (link is perhaps inactive) and also at http://en.wikipedia.org/wiki/Binary_GCD_algorithm.



- Euclid's Algorithm for GCD (in C):

```
#include <stdio.h>


int GCD( int inA, int inB) {
  int done = 0;
  int swap = 0;

  int A = inA;
  int B = inB;

  while ( !done )
    {
      if ( A < B ) // if A < B, swap values
        {
          swap = A; A = B;
          B = swap;
        }
      else if ( B != 0 ) // subtract as long as B isn’t 0
        A = A - B;
      else
        done = 1;
    }
  return A;
}

int main(void) {
// this can be testbench

  int inA = 20;
  int inB = 30;
  int out = 0;

  out = GCD( inA, inB );

  printf("Input inA = %d\n",inA);
  printf("Input inB = %d\n",inB);
  printf("GCD Output of inA and inB = %d\n",out);

  return 0;
}
```

Now, we need to implement this in hardware.

Here is behavioral Verilog code for GCD. What is wrong with this approach? Basically, it does not synthesize due to data dependent loop in hardware.

```
module gcdGCDUnit_behavior#( parameter W = 16 )
  (
  input  [W-1:0] inA, inB,
  output [W-1:0] out
  );
    reg [W-1:0] A, B, out, swap;
    integer     done;
    always @(*)
    begin
      done = 0;
      A = inA; B = inB;
      while ( !done )
        begin
          if ( A < B )
            swap = A;
            A = B;
            B = swap;
          else if ( B != 0 )
            A = A - B;
          else
            done = 1;
        end
      out = A;
    end
endmodule
```

The above behavioral description of the GCD unit describes the functionality of the module. While this is sufficient for VCS RTL simulation, the Design Compiler and IC Compiler cannot properly synthesize netlist from this description. Because of this, you must rewrite the behavioral description using “synthesizable” RTL code. For this, you will apply a structural design approach which involves describing the circuit design in terms of its registers, connections, and other modules. This process is referred to as Register Transfer Level Design.

The first step is to derive the module in terms of its Data Path and Control Unit. The Data Path contains the registers, logic and math modules. The Control Unit contains the logic that drives the control signals for the Data Path. This is typically accomplished using a Finite State Machine which was part of your tutorial example in Chapter 5.

Here is some methodology how we can make some RTL Design from behavioral RTL design.


- __1st step:__ Start with behavioral and find out what hardware constructs you’ll need the followings
  - Registers (for state)
  - Functional units
    1. Adders / Subtractors
    1. Comparators
    1. ALU’s

    Above behavioral code. Let's find functional unit samples.
    ```
    A = inA; B = inB; => State -> Registers

    A<B => Need comparator

    B != 0 => Need another comparator

    A= A - B: Need subtractor
    ```


- __2nd step:__ Define module ports

  Define module ports



- __3rd step:__ Implement the modules
  - Two step process
    1. Define datapath
    1. Define control/ control path



The detail methodology and GCD RTL can be found [this slides](https://cseweb.ucsd.edu/classes/wi08/cse141L/Slides/verilog_deux.pdf)

Total system block is look like below.


We provide three following incomplete RTL designs (Verilog) from above behavioral code for GCD algorithm. You should complete this file to go next part.
The code are needed at the following comment region
```
// code here for EECS168
```

- GCD Top Design: `gcd_rtl.v`
- GCD Control: `gcd_ctrl.v`
- GCD Data Path: `gcd_dpath.v`

![GCD RTL Design](images/GCD_RTL.png)

_**GCD RTL Design Block**_

you need to download incomplete GCD RTL design [here](https://raw.githubusercontent.com/sheldonucr/ucr-eecs168-lab/master/lab4/GCD_RTL.tgz)



To test your GCD Testbench with RTL Design successfully, you need to pass the following VCS testing toolkit (referred from MIT 6.375)
```
vcs -PP +lint=all,noVCDE +v2k -timescale=1ns/10ps +define+CLOCK_PERIOD=0.5 gcd_rtl_tb.v gcd_ctrl.v gcd_dpath.v gcd_rtl.v -v vcTest.v -v vcTestSource.v -v vcTestSink.v -v vcQueues.v -v vcStateElements.v
```


If your RTL still has error, then your `./simv +verbose=1` result will be the following
```
[tkim@kepler rtl_students]:./simv +verbose=1
Chronologic VCS simulator copyright 1991-2015
Contains Synopsys proprietary information.
Compiler version K-2015.09-SP1-1; Runtime version K-2015.09-SP1-1;  Feb 29 16:49 2016
 Entering Test Suite: gcdGCDUnit_rtl
VCD+ Writer K-2015.09-SP1-1 Copyright (c) 1991-2015 by Synopsys Inc.
  + Running Test Case: gcdGCDUnit_rtl
     [ FAILED ] Test ( Is sink finished? ) failed

$finish called from file "gcd_rtl_tb.v", line 124.
$finish at simulation time               154650
           V C S   S i m u l a t i o n   R e p o r t
Time: 1546500 ps
CPU Time:      0.640 seconds;       Data structure size:   0.0Mb
Mon Feb 29 16:49:37 2016
[tkim@kepler rtl_students]:
```

If you successfully finished your RTL, then your `simv` result will be the following
```
[tkim@kepler rtl_students]:./simv +verbose=1
Chronologic VCS simulator copyright 1991-2015
Contains Synopsys proprietary information.
Compiler version K-2015.09-SP1-1; Runtime version K-2015.09-SP1-1;  Feb 29 16:50 2016
 Entering Test Suite: gcdGCDUnit_rtl
VCD+ Writer K-2015.09-SP1-1 Copyright (c) 1991-2015 by Synopsys Inc.
  + Running Test Case: gcdGCDUnit_rtl
     [ passed ] Test ( vcTestSink ) succeeded, [ 0003 == 0003 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0007 == 0007 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0005 == 0005 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0001 == 0001 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0028 == 0028 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 000a == 000a ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0005 == 0005 ]
     [ passed ] Test ( vcTestSink ) succeeded, [ 0000 == 0000 ]
     [ passed ] Test ( Is sink finished? ) succeeded

$finish called from file "gcd_rtl_tb.v", line 124.
$finish at simulation time               154650
           V C S   S i m u l a t i o n   R e p o r t
Time: 1546500 ps
CPU Time:      0.640 seconds;       Data structure size:   0.0Mb
Mon Feb 29 16:50:13 2016
[tkim@kepler rtl_students]:
```

#### Part 2. Synthesis and layout for GCD
After you finished your RTL design, then you need to synthesize with Design Compiler and generate a layout with IC Compiler.

##### Design Compiler and IC Compiler for GCD

GCD requires clock and you also need to synthesize clock tree. For your GCD, every step is __the same as above 4-bit full adder steps__ from RTL to Layout except the following extra steps.

###### Design Compiler Changes for GCD (you need to follow above 4-bit fulladder example for this step except the following extra steps)

- For analyze, you need to use the command for multiple verilog file
```
analyze -format verilog "gcd_ctrl.v gcd_dpath.v gcd_rtl.v"
```

- For elaborate, you can use top-level design block name
```
elaborate "gcdGCDUnit_rtl"
```




- After `check_design` in Design Compiler, you need to build clock period constraint as extra step before compile
```
create_clock clk -name ideal_clock1 -period 1
```

- Instead of `compiler` in Design Compiler, you use faster compiler variants (`compiler_ultra`) with clock option.
```
compile_ultra -gate_clock -no_autoungroup
```

- When you write a synthesized file and ddc file, you need to have a `-hierarchy` option

```
write -format ddc -hierarchy -output "gcdGCDUnit_rtl_synthesized.ddc"
```

```
write -f verilog -hierarchy -output "gcdGCDUnit_rtl_synthesized.v"
```



###### IC Compiler Changes for GCD.

- For the floorplan, enough sizes are needeed. Use 30 instead of 20.

```
create_floorplan -use_vertical_row -start_first_row -left_io2core 30 -bottom_io2core 30 -right_io2core 30 -top_io2core 30
```

- For the clock synthesize, you need to generate clock tree after `commit_fp_rail`.
```
clock_opt -only_cts -no_clock_route
```

```
route_zrt_group -all_clock_nets -reuse_existing_global_route true
```
- For Routing one more after `insert_stdcell_filler`
```
route_opt -incremental -size_only
```
- Extra final step, Generate the post place and route netlist, the constraint file, and parasitics files to generate power estimates.
```
change_names -rules verilog -hierarchy
```

```
write_verilog "gcdGCDUnit_rtl.output.v"
```

```
write_sdf "gcdGCDUnit_rtl.output.sdf"
```

```
write_sdc "gcdGCDUnit_rtl.output.sdc"
```

```
extract_rc -coupling_cap
```

```
write_parasitics -format SBPF -output "gcdGCDUnit_rtl.output.sbpf"
```


- Final GCD layout ready.

![Fig. 51](images/GCD_layout.png)

_**Fig. 51. Final GCD Layout**_





## Lab4-Week3 : Timing, Area, and Power Analysis and Full-chip synthesis design (Optional)

### Whole RTL and Layout Design Process

![Fig. 50](images/synopsys_tool_flow.png)

_**Fig. 50. Full RTL and Physical Toolflow for IC design**_

Let's get some timing, area, power reports from Design Compiler.

You need to re-run all design compiler step first for your GCD design.

After `compile_ultra` step, you need to have more steps to generate report

Let's see timing report.

```
report_timing -transition_time -nets -attributes -nosplit
```

Then you can see timing report.

```
Information: Updating design information... (UID-85)

****************************************
Report : timing
        -path full
        -delay max
        -nets
        -max_paths 1
        -transition_time
Design : gcdGCDUnit_rtl
Version: K-2015.06-SP4
Date   : Sat Mar  5 08:19:55 2016
****************************************

Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top

  Startpoint: GCDdpath0/B_reg_reg[4]
              (rising edge-triggered flip-flop clocked by ideal_clock1)
  Endpoint: GCDdpath0/clk_gate_A_reg_reg/latch
            (positive level-sensitive latch clocked by ideal_clock1')
  Path Group: ideal_clock1
  Path Type: max

Attributes:
    d - dont_touch
    u - dont_use
   mo - map_only
   so - size_only
    i - ideal_net or ideal_network
  inf - infeasible path

  Point                                       Fanout     Trans      Incr       Path      Attributes
  ---------------------------------------------------------------------------------------------------------
  clock ideal_clock1 (rise edge)                                    0.00       0.00
  clock network delay (ideal)                                       0.00       0.00
  GCDdpath0/B_reg_reg[4]/CLK (DFFARX1)                    0.00      0.00       0.00 r
  GCDdpath0/B_reg_reg[4]/Q (DFFARX1)                      0.04      0.24       0.24 f
  GCDdpath0/B_reg[4] (net)                      4                   0.00       0.24 f
  GCDdpath0/U114/QN (NOR2X1)                              0.06      0.04       0.28 r
  GCDdpath0/n189 (net)                          3                   0.00       0.28 r
  GCDdpath0/U115/QN (AOINVX1)                             0.03      0.03       0.30 f
  GCDdpath0/n35 (net)                           1                   0.00       0.30 f
  GCDdpath0/U116/QN (NOR2X0)                              0.05      0.03       0.33 r
  GCDdpath0/n36 (net)                           1                   0.00       0.33 r
  GCDdpath0/U118/QN (NOR2X1)                              0.05      0.04       0.37 f
  GCDdpath0/n130 (net)                          3                   0.00       0.37 f
  GCDdpath0/U36/QN (NOR2X1)                               0.04      0.03       0.40 r
  GCDdpath0/n39 (net)                           1                   0.00       0.40 r
  GCDdpath0/U121/Q (OR3X1)                                0.05      0.08       0.48 r
  GCDdpath0/n40 (net)                           1                   0.00       0.48 r
  GCDdpath0/U35/QN (NOR2X2)                               0.05      0.05       0.52 f
  GCDdpath0/n84 (net)                           2                   0.00       0.52 f
  GCDdpath0/U159/QN (NOR2X2)                              0.06      0.04       0.56 r
  GCDdpath0/n85 (net)                           1                   0.00       0.56 r
  GCDdpath0/U160/QN (NOR2X4)                              0.04      0.04       0.60 f
  GCDdpath0/N5 (net)                            4                   0.00       0.60 f
  GCDdpath0/A_lt_B (gcdGCDUnitDpath_W16)                            0.00       0.60 f
  A_lt_B (net)                                                      0.00       0.60 f
  GCDctrl0/A_lt_B (gcdGCDUnitCtrl)                                  0.00       0.60 f
  GCDctrl0/A_lt_B (net)                                             0.00       0.60 f
  GCDctrl0/U8/QN (NAND2X2)                                0.04      0.02       0.62 r
  GCDctrl0/n6 (net)                             2                   0.00       0.62 r
  GCDctrl0/U9/QN (NAND2X0)                                0.05      0.04       0.67 f
  GCDctrl0/B_en (net)                           2                   0.00       0.67 f
  GCDctrl0/U10/QN (AOINVX1)                               0.03      0.03       0.69 r
  GCDctrl0/n4 (net)                             1                   0.00       0.69 r
  GCDctrl0/U13/QN (NAND2X1)                               0.03      0.03       0.72 f
  GCDctrl0/A_en (net)                           1                   0.00       0.72 f
  GCDctrl0/A_en (gcdGCDUnitCtrl)                                    0.00       0.72 f
  A_en (net)                                                        0.00       0.72 f
  GCDdpath0/A_en (gcdGCDUnitDpath_W16)                              0.00       0.72 f
  GCDdpath0/A_en (net)                                              0.00       0.72 f
  GCDdpath0/clk_gate_A_reg_reg/EN (SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1)     0.00     0.72 f
  GCDdpath0/clk_gate_A_reg_reg/net151 (net)                         0.00       0.72 f
  GCDdpath0/clk_gate_A_reg_reg/latch/D (LATCHX1)          0.03      0.00       0.72 f
  data arrival time                                                            0.72

  clock ideal_clock1' (rise edge)                                   0.50       0.50
  clock network delay (ideal)                                       0.00       0.50
  GCDdpath0/clk_gate_A_reg_reg/latch/CLK (LATCHX1)                  0.00       0.50 r
  time borrowed from endpoint                                       0.22       0.72
  data required time                                                           0.72
  ---------------------------------------------------------------------------------------------------------
  data required time                                                           0.72
  data arrival time                                                           -0.72
  ---------------------------------------------------------------------------------------------------------
  slack (MET)                                                                  0.00

  Time Borrowing Information
  ------------------------------------------------------------------------
  ideal_clock1' nominal pulse width                                 0.50
  library setup time                                               -0.10
  ------------------------------------------------------------------------
  max time borrow                                                   0.40
  actual time borrow                                                0.22
  ------------------------------------------------------------------------

```

You can go to terminal/output window and copy above report and paste into your lab report for timing analysis.

Next, we can see area report

```
report_area -nosplit -hierarchy
```

then, you can see the report
```
****************************************
Report : area
Design : gcdGCDUnit_rtl
Version: K-2015.06-SP4
Date   : Sat Mar  5 08:23:57 2016
****************************************

Library(s) Used:

    saed90nm_typ (File: /usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db)

Number of ports:                          130
Number of nets:                           461
Number of cells:                          326
Number of combinational cells:            285
Number of sequential cells:                37
Number of macros/black boxes:               0
Number of buf/inv:                         36
Number of references:                       2

Combinational area:               1992.904015
Buf/Inv area:                      205.527008
Noncombinational area:            1126.194016
Macro/Black Box area:                0.000000
Net Interconnect area:      undefined  (No wire load specified)

Total cell area:                  3119.098031
Total area:                 undefined

Hierarchical area distribution
------------------------------

                                  Global cell area          Local cell area
                                  ------------------  ----------------------------
Hierarchical cell                 Absolute   Percent  Combi-     Noncombi-  Black-
                                  Total      Total    national   national   boxes   Design
--------------------------------  ---------  -------  ---------  ---------  ------  ------------------------------------------
gcdGCDUnit_rtl                    3119.0980    100.0     0.0000     0.0000  0.0000  gcdGCDUnit_rtl
GCDctrl0                           193.3050      6.2   143.5390    49.7660  0.0000  gcdGCDUnitCtrl
GCDdpath0                         2925.7930     93.8  1823.4150  1032.1920  0.0000  gcdGCDUnitDpath_W16
GCDdpath0/clk_gate_A_reg_reg        35.0930      1.1    12.9750    22.1180  0.0000  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1
GCDdpath0/clk_gate_B_reg_reg        35.0930      1.1    12.9750    22.1180  0.0000  SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0
--------------------------------  ---------  -------  ---------  ---------  ------  ------------------------------------------
Total                                                 1992.9040  1126.1940  0.0000


```

You can go to terminal/output window and copy above report and paste into your lab report for area analysis.

Third, you can see power analysis,

```
report_power -nosplit -hierarchy
```

Then, you can see power report for each block for Switching/Dynamic/Leaking Powers

```
****************************************
Report : power
        -hier
        -analysis_effort low
Design : gcdGCDUnit_rtl
Version: K-2015.06-SP4
Date   : Sat Mar  5 08:26:58 2016
****************************************


Library(s) Used:

    saed90nm_typ (File: /usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db)


Operating Conditions: TYPICAL   Library: saed90nm_typ
Wire Load Model Mode: top


Global Operating Voltage = 1.2
Power-specific unit information :
    Voltage Units = 1V
    Capacitance Units = 1.000000pf
    Time Units = 1ns
    Dynamic Power Units = 1mW    (derived from V,C,T units)
    Leakage Power Units = 1pW


--------------------------------------------------------------------------------
                                       Switch   Int      Leak     Total
Hierarchy                              Power    Power    Power    Power    %
--------------------------------------------------------------------------------
gcdGCDUnit_rtl                            0.140    0.926 1.06e+07    1.077 100.0
  GCDctrl0 (gcdGCDUnitCtrl)            9.74e-03 5.17e-02 5.34e+05 6.20e-02   5.8
  GCDdpath0 (gcdGCDUnitDpath_W16)         0.130    0.875 1.01e+07    1.015  94.2
```
You can go to terminal/output window and copy above report and paste into your lab report for power analysis.

For more information of standard cell area report, you need to type the following command

```
report_reference -nosplit -hierarchy
```

```
****************************************
Report : reference
Design : gcdGCDUnit_rtl
Version: K-2015.06-SP4
Date   : Sat Mar  5 08:29:21 2016
****************************************

Attributes:
    b - black box (unknown)
   bo - allows boundary optimization
    d - dont_touch
   mo - map_only
    h - hierarchical
    n - noncombinational
    r - removable
    s - synthetic operator
    u - contains unmapped logic

Reference          Library       Unit Area   Count    Total Area   Attributes
-----------------------------------------------------------------------------
gcdGCDUnitCtrl                  193.305001       1    193.305001  h, n
gcdGCDUnitDpath_W16            2925.793030       1   2925.793030  h, n
-----------------------------------------------------------------------------
Total 2 references                                   3119.098031

****************************************
Design: gcdGCDUnitCtrl
****************************************
Reference          Library       Unit Area   Count    Total Area   Attributes
-----------------------------------------------------------------------------
AND2X1             saed90nm_typ     7.445000       1     7.445000
AOI22X1            saed90nm_typ    12.902000       1    12.902000
AOINVX1            saed90nm_typ     6.451000       2    12.902000
DFFX1              saed90nm_typ    24.882999       2    49.765999 n
INVX0              saed90nm_typ     5.530000       1     5.530000
INVX2              saed90nm_typ     6.451000       1     6.451000
ISOLANDX1          saed90nm_typ     7.373000       1     7.373000
ISOLORX1           saed90nm_typ     7.387000       1     7.387000
NAND2X0            saed90nm_typ     5.443000       4    21.771999
NAND2X1            saed90nm_typ     5.501000       1     5.501000
NAND2X2            saed90nm_typ     8.798000       1     8.798000
NOR2X0             saed90nm_typ     5.530000       4    22.120001
NOR2X1             saed90nm_typ     6.005000       1     6.005000
NOR3X0             saed90nm_typ     8.294000       1     8.294000
OAI21X1            saed90nm_typ    11.059000       1    11.059000
-----------------------------------------------------------------------------
Total 15 references                                   193.305001

****************************************
Design: gcdGCDUnitDpath_W16
****************************************
Reference          Library       Unit Area   Count    Total Area   Attributes
-----------------------------------------------------------------------------
AND2X1             saed90nm_typ     7.445000      17   126.565003
AND4X1             saed90nm_typ    10.123000       1    10.123000
AO21X1             saed90nm_typ    10.138000       2    20.275999
AOINVX1            saed90nm_typ     6.451000       1     6.451000
AOINVX2            saed90nm_typ     6.451000       1     6.451000
DFFARX1            saed90nm_typ    32.256001      32  1032.192017 n
INVX0              saed90nm_typ     5.530000      26   143.780005
INVX2              saed90nm_typ     6.451000       2    12.902000
ISOLANDX1          saed90nm_typ     7.373000       1     7.373000
ISOLORX1           saed90nm_typ     7.387000       1     7.387000
MUX21X1            saed90nm_typ    11.059000      16   176.944000
NAND2X0            saed90nm_typ     5.443000      49   266.706992
NAND2X1            saed90nm_typ     5.501000      31   170.530998
NAND2X2            saed90nm_typ     8.798000       3    26.394001
NAND3X0            saed90nm_typ     7.373000       1     7.373000
NOR2X0             saed90nm_typ     5.530000      62   342.860013
NOR2X1             saed90nm_typ     6.005000       8    48.040001
NOR2X2             saed90nm_typ     9.216000       9    82.943996
NOR2X4             saed90nm_typ    14.731000       2    29.462000
NOR3X0             saed90nm_typ     8.294000       1     8.294000
NOR4X0             saed90nm_typ     9.216000       3    27.647999
NOR4X1             saed90nm_typ    15.638000       1    15.638000
OA21X1             saed90nm_typ     9.216000       1     9.216000
OR3X1              saed90nm_typ     9.230000       3    27.689999
OR3X2              saed90nm_typ    11.030000       1    11.030000
OR4X1              saed90nm_typ    10.152000       1    10.152000
SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0    35.093000       1    35.093000 h, n
SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1    35.093000       1    35.093000 h, n
XNOR2X1            saed90nm_typ    13.824000       4    55.296001
XOR2X1             saed90nm_typ    13.824000      12   165.888004
-----------------------------------------------------------------------------
Total 30 references                                  2925.793030

****************************************
Design: SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_0
****************************************
Reference          Library       Unit Area   Count    Total Area   Attributes
-----------------------------------------------------------------------------
AND2X1             saed90nm_typ     7.445000       1     7.445000
INVX0              saed90nm_typ     5.530000       1     5.530000
LATCHX1            saed90nm_typ    22.118000       1    22.118000 n
-----------------------------------------------------------------------------
Total 3 references                                     35.093000

****************************************
Design: SNPS_CLOCK_GATE_HIGH_gcdGCDUnitDpath_W16_1
****************************************
Reference          Library       Unit Area   Count    Total Area   Attributes
-----------------------------------------------------------------------------
AND2X1             saed90nm_typ     7.445000       1     7.445000
INVX0              saed90nm_typ     5.530000       1     5.530000
LATCHX1            saed90nm_typ    22.118000       1    22.118000 n
-----------------------------------------------------------------------------
Total 3 references                                     35.093000
```

You can go to terminal/output window and copy above report and paste into your lab report for standard-cell area analysis.


Finally, you can get some detail rtl design resource report.

```
report_resources -nosplit -hierarchy
```

Then, the report is like below.

```
****************************************
Report : resources
Design : gcdGCDUnit_rtl
Version: K-2015.06-SP4
Date   : Sat Mar  5 08:32:06 2016
****************************************


No resource sharing information to report.

No implementations to report

****************************************
Design : gcdGCDUnitCtrl
****************************************

No implementations to report

****************************************
Design : gcdGCDUnitDpath_W16
****************************************

Resource Report for this hierarchy in file ./gcd_dpath.v
=============================================================================
| Cell           | Module         | Parameters | Contained Operations       |
=============================================================================
| sub_x_2        | DW01_sub       | width=16   | sub_45 (gcd_dpath.v:45)    |
| lt_x_3         | DW_cmp         | width=16   | lt_51 (gcd_dpath.v:51)     |
=============================================================================


Implementation Report
===============================================================================
|                    |                  | Current            | Set            |
| Cell               | Module           | Implementation     | Implementation |
===============================================================================
| sub_x_2            | DW01_sub         | pparch (area,speed)                 |
| lt_x_3             | DW_cmp           | pparch (area,speed)                 |
===============================================================================
```

### Post analysis with PrimeTime

So far, we used Verilog Compiler Simulator (VCS) for RTL simulation, Design Compiler for Logic Synthesis, and IC Compiler for Layout. Now, we will use PrimeTime which is signoff tool and enable accurate delay and power estimations.

Signoff users have a few key requirements for their signoff tool of choice, runtime and capacity to handle their largest chip size requirements, efficient multi-scenario analysis to verify timing across all corners and modes, margin control to reduce over-design and maximize chip performance, and accuracy to ensure correlation to silicon. The Synopsys PrimeTime Suite addresses these requirements by delivering fast, memory-efficient scalar and multicore computing, distributed multi-scenario analysis and ECO fixing, using variation-aware Composite Current Source (CCS) modeling that extends static timing analysis to include crosstalk timing, noise, power and constraint analysis.

It delivers HSPICE accurate signoff analysis that helps pinpoint problems prior to tapeout thereby reducing risk, ensuring design integrity, and lowering the cost of design. This industry gold-standard solution improves designers' productivity by delivering fast turnaround on development schedules for large and small designs while ensuring first-pass silicon success through greater predictability and the highest accuracy.

- See more at: http://www.synopsys.com/Tools/Implementation/SignOff/Pages/PrimeTime.aspx#sthash.qfYroAvS.dpuf

To run primetime, you can type the following Tools

```
pt_shell
```

To start GUI, you need to type the following command.

```
gui_start
```

Set the power analysis and read your saved verilog from last step of IC Compier.

```
set target_library "/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db"

set link_path "/usr/local/synopsys/pdk/SAED90_EDK/SAED_EDK90nm_REF/references/ChipTop/ref/saed90nm_fr/LM/saed90nm_typ.db"

set power_enable_analysis "true"

read_verilog "gcdGCDUnit_rtl.output.v "

current_design "gcdGCDUnit_rtl"

link

```

After importing your Post Verilog Design.
```
set power_analysis_mode "averaged"
```

```
report_switching_activity -list_not_annotated
```

```
read_parasitics -increment -format sbpf "gcdGCDUnit_rtl.output.sbpf.max"
```

```
report_power -verbose -hierarchy
```



### Full-chip synthesis (extra-credit)

To implement fullchip, we can use OpenSource core website to get IPs.

```
http://opencores.org/
```

#### Useful examples

- OpenRISC 1200 processor example

[Here](http://venividiwiki.ee.virginia.edu/mediawiki/index.php/Specialized_SHA-256_Accelerator)

- OpenMSP430 processor example

[Here](http://venividiwiki.ee.virginia.edu/mediawiki/index.php/MSP430PeriphsandPG)


If you see the projects, there is processor section. If you earn the extra-credit, you can download any processor RTL design and try to synthesize and transfer gate to layout.

Once you finish this work, turn in your layout to TA.
your total lab score will increase by 20%.
You can use any external resources for this extra work.

## Lab4 Logistics

### Objective

In this tutorial, you will learn how to do RTL (register transfer level) design to build your circuit with HDL (hardware description language) for EDA (electronic design automation)

This work design for three weeks lab, so for your lab report, you need to design three sets of HDLs, which are 4-bit binary full adder, finite state machine, greatest common devisor (gcd), and finally full-chip design.


In this lab4, we introduce Synopsys RTL design toolkit, which are VCS, Design Compiler, IC Compiler, VCS RTL Verification solution.

### Deliverables for your lab report.

* Name, SID, Session(021,022,023), ENGR ID, UCR NetID, your partner name

---- week1 checkoff from here

  * Answers of all the questions from Verilog tutorial in Chapter 1 to 5.

  * Simulation result of example counter.

  * The result of gate-level for 4-bit full adder, fa_4bit_synthesized.v

  * Final layout in Fig 49 for 4-bit full adder.

---- until here for week1 check off

---- week 2 checkoff

  * Complete three Verilog file (gcd_rtl.v gcd_dpath.v gcd_ctrl.v)

  * Final Layout in Figure 51

---- until here for week 2 check off

---- week 3 checkoff

  * 5 design compiler report (timing, power, area, reference, and resource)

  * Primetime power report (after run `report_power` at the last step)

---- until here for week 3 check off

  * (Optional) FullChip Synthesis (+extra credit)

* Some of the issues if you have (One paragraph)

### What to submit

* Lab report (PDF format)

file name should be following

`lab4-[My UCR NET ID].pdf`

for example, my UCR Net ID is `tkim049`, so filename should be

`lab4-tkim049.pdf`

* Tar and Zip your design folder you made

`cd ~/eecs168/lab4-rtl` or you made

`tar -cvzf lab4-[My UCR NET ID].tgz ./`

for example, my ucr Net ID is `tkim049`, so do like following

`tar -cvzf lab4-tkim049.tgz ./`

* You need to submit two files (\*.pdf, \*.tgz) in iLearn

### Lab Report Due

* All sessions: by 11am on 3/19

### Checkoff

* First week: Refer above deliverables

* Second week: Refer above deliverables

* Three week: Refer above deliverables
