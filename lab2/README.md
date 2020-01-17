## Lab2

### Objective

Lab 2 is to learn how to design your layout, validate with DRC and LVS. You will learn three IC design tools (Custom Designer, IP Validator) and design inverter and NAND gates in this lab and the followings are expected to be delivered in your lab report.

## Lab Report Due

* One week.

* eecs168-021, 023: by 11:59pm on 1/28
* eecs168-022: by 11:59pm on 1/29

# Lab/Tutorial 2

In this tutorial, some contexts use Synopsys tutorials from Vazgen Melikyan (Synopsys) and Hamid Nahmoodi (SFSU). All the tools and PDK are given thru Synopsys University Program.

## Introduction

In this tutorial, you will learn how to draw custom IC layout and simulate your design using 90nm technology in Synopsys Custom Design Tools. This tutorial includes the detail steps of schematic, layout, and simulation of designs.

## Part 5: Creating Layout (continues from lab1)

To design a layout, you need to be familiar with the Lamba-based rules design. This helps you save your time for design cycle and debugging Design Rules Check (DRC) errors. For Synopsys PDK, you can access 90nm technology we are currently using in the following location at `/usr/local/synopsys/pdk/SAED_PDK90nm/documents/SAED_90_Design_Rule.pdf` at `bender.engr.ucr.edu`. You can download this file to your desktop using a file transfer application (WinSCP, Filezilla) or use the network drive and then use your computer's pdf viewer.

```
cp /usr/local/synopsys/pdk/SAED_PDK90nm/documents/SAED_90_Design_Rule.pdf SAED_90_Design_Rule.pdf
```

It is recommended that you keep running and check with DRC tool for your layout design while you design. In this tutorial you just sequentially design first and then check your DRC later. However, in practice, you need to keep checking your DRC with layout to find errors earlier and correct your errors and mistakes.

__Be careful not to submit your lab report with any DRC or LVS errors.__

Start with Custom Designer. Type `cdesigner&` and open your design from lab1 you finished. Go to file-> New -> CellView on your Custom Designer Console. You need to make sure the name of the cell is the same as the schematic cell. Now, it is inverter (refer Fig.1), so click OK and the new layout workspace will be popup (refer Fig. 2)

![fig1](images/fig1.png)

_**Fig. 1. Creating New Layout**_

![fig2](images/fig2.png)

_**Fig. 2. New Layout Workspace**_


__One tip__: There is realtime DRC tool, which so-called SmartDRD technology. You can check in the following icon ![fig41](images/fig41-2.png) in the toolbar of your layout window. Which provides realtime DRC checking tool. If your design very large, enabling this helper may degrade your performance. It has `assist` and `visual` options. The `visual` mode only annotates the object spacing and DRC violations. Whereas, the `assist` mode attend to create barriers between objects to help enforce DRC compliance.

More details can be founded at [here](https://www.synopsys.com/Tools/Implementation/CustomImplementation/CapsuleModule/smartDRD_tech_bgr.pdf)

First we need to know each layer naming. The meaning of each layer is the following:

__Note that this design tool is based on p-substrate__.

- NWELL : N-type Well (N-tub)
- DIFF : Diffusion Layer
- PIMP : P-type diffusion (p-diff)
- NIMP : N-type diffusion (n-diff)
- PO : Polysilicon layer
- M1 : Metal-1 Layer
- CO : Contact Layer
- M1PIN : Metal-pin-naming layer

### Ruler

Go to `Create ruler` by clicking on  ![fig42_1](images/fig42-1.png). Click once to start drawing the ruler and again to end it. Draw two rulers about the lengths shown in Fig.3 (about 3um by 2um can be a good start). 

### NWELL Layer

Select the `NWELL` layer in the layers panel on the right and select `Create-> Rectangle` (Fig.3).

Draw a rectangle that approximately fits the dimensions of the rulers you set. You can always adjust the dimensions of this rectangle by using the tools (stretch object, refer icon ![fig42_2](images/fig42-2.png), move object, refer icon ![fig42_3](images/fig42-3.png)) that existed on left side of layout window then clicking the side you want to stretch or move.

![fig3](images/fig3.png) 

_**Fig. 3. Drawing N-Well Layer**_

![fig4](images/fig4.png)

_**Fig. 4. Drawing N-Well Layer**_

After you have created an N-well (N-tub), move your mouse over it. Notice at the top left there are two fields that tell you what layer you are on and the coordinates. This is useful information if you are having trouble figuring out what a layer is and when you are fixing errors found in DRC.

### DIFF Layer

Now we are going to make diffusion areas for PMOS, NMOS and body connections. From our schematic, we know that the width of the PMOS should be 0.5um and the width of NMOS should be 0.25um (refer lab1). The location of the diffusion should be similar to the ones in Fig.5. There are two horizontal diffusion areas that are the NMOS and PMOS devices, and two vertical rectangles that will be the body connections. Place rulers down to help you make sure the width of the diffusion areas for the NMOS and PMOS match our schematic area exactly.

Select the `DIFF` layer again use the `Create Rectangle` tool to draw the diffusion area. Use rulers to check the width of the rectangles. If the widths are different than the widths of the devices in the schematic, you will not pass LVS. You can also use the property editor in `Edit -> Property` Editor to change the dimensions of the rectangle to exact values.

The size of the diffusion areas and body connections can be modified later. I recommend you look ahead and see what else you will need to add to your layout so you can make these locations large enough to accomodate future material. 

![fig5](images/fig5.png)

_**Fig. 5. Layout with NWell and Diffusion**_

### PIMP Layer and NIMP Layer

Now we will add the P-implant and N-implant areas. When manipulating layers on top of each other sometimes it is useful to “hide” a layer, like you would do in a program like Photoshop. You can do hide or reveal layers in Cosmos by clicking ![fig44-2](images/fig44-2.png).

Use the p-diff(PIMP layer) and n-diff (NIMP layer) layers with the `Create Rectangle` to cover and surround the diffusion and body connection areas. It is important to note that the `PIMP` is drawn to the edge of the `NWELL` where the `NWELL` meets the `NIMP`. This can be seen in Fig.6. The PMOS area should be covered with `PIMP` and the `NMOS` with `NIMP`, except for the body connections which have the opposite implantation.

TIPS: There cannot be any overlap between `NIMP` and `PIMP` so be sure to zoom in and make these meet exactly. You can seperate these two but you will then need to ensure you leave a large enough gap between to pass DRC. The implant areas just need to cover the diffusion and connection areas but extra room can help you later, so it is ok if you make them large.

For example:

Rule DIFF.E.1: Source/drain active to well edge (min enclosure by well) is 0.24um, we make it 0.3um.

Rule PIMP.E.1: Enclosure of P+Active is 0.14um, we make it 0.2um.

![fig6](images/fig6.png)

_**Fig. 6. Drawing PIMP and NIMP layers**_

### PO Layer

Now we select the `PO` layer (Polysilicon) and use the `Create -> Path` tool to draw a strip of poly through both PMOS and NMOS diffusion areas. Make sure the poly is sticking out past the diffusion areas by at least the amount specified in the design rule manual. When drawing the Poly path, make sure the width is 0.1um to match the transistor lengths in the schematic, see Fig.9 to set width/thickness for the draw path tool. Create a rectangle of poly in the center of the strip that would be used for the input signal, see Fig.7. This strip does not have to be inside the N-tub.

Rule PO.EX.1: Minimum gate extension of active (end cap) is 0.18um.

![fig7](images/fig7.png)

_**Fig. 7. Drawing Polysilicon**_

### CO Layer

Select the `CO` (contact) layer and use the `Create Rectangle` or `Create Polygon` tool in conjunction with rulers to make a contact 0.13 by 0.13. You can also use the property editor to get these exact values. After you have created one contact click on ![fig47-2](images/fig47-2.png)  and the contact and make a copy to place the other contacts. Contact placements are shown in Fig.8. Check to see that your contact placements meet the design rules.

Rule CO.W.1: Exact contact size is 0.13um.

Rule CO.S.1: Minimum contact spacing is 0.13um.

Rule CO.S.2: (Contact inside DIFF) Minimum space to gate is 0.12um, i.e., we make it 0.155um.

Rule CO.E.1: Minimum enclosure by poly is 0.04um.

Rule CO.E.2: Minimum enclosure by DIFF is 0.04um, i.e., we make it 0.055um.

Rule CO.E.3: Minimum enclosure by poly at least two apposite sides 0.05um.


![fig8](images/fig8.png)

_**Fig. 8. Drawing Contacts**_

### M1 Layer

Select the `M1` (Metal-1) layer and again select the `Create Path` tool. This time in the `Create Path` window that pops ups, click on the width box to then enter 0.14 in the Width field.

![fig9](images/fig9.png)

_**Fig. 9. Modifying Width**_

Draw the `M1` layer the way it is shown in Fig.10. Make sure the metal is covering the contacts by the amount specified in the design rule manual. You can also draw rectangles over the contacts to cover them more.

Rule M1.W.1: Minimum width is 0.14um.

Rule CO.E.6: Minimum enclosure of any contact (CO outside M1 is not allowed) is 0.005um.

Rule CO.E.7: Minimum enclosure of contact at end of line is 0.05um.

![fig10](images/fig10.png)

_**Fig. 10. Drawing Metal Connections**_

### MIPIN Layer

Select the `M1PIN` layer. Select the `Create -> Text -> Label` tool and place text labels labeled as VDD, VSS, VIN, and VOUT (refer Fig.11), where the center point of label should be put within the metal wire. Note that you need to match the label names in layout as the labeled pins in the schematic in order to pass LVS (Layout vs Schematic). You have now completed the initial layout and can move onto DRC. Save your layout by going to `Design -> Save`. As a general convention, use uppercase letters for labels instead of lowercase letters.

![fig11](images/fig11.png)

_**Fig. 11. Labeling Connections**_

Fig.12 shows another inverter layout. In real design, you should try to make the dimensions small in the case of meeting design rules.  

![fig12](images/fig12.png)

_**Fig. 12. Another Inverter Layout**_

## PART 6: Running DRC

After the inverter layout has been drawn to accurately represent the schematic, to verify that the layout meets all the basic design rules, we need to run `IC Validator` for a DRC (Design Rule Check). Save the layout cell by clicking on Save. In Custom Designer Editor, go to `Verification -> DRC -> Setup and Run`.
Locate the runset file rules.drc.9m_saed90ev_saed90_icv.rs from the following directory and click Ok (Fig.13).

```
/usr/local/synopsys/pdk/SAED_PDK90nm/icv/drc/rules.drc.9m_saed90_icv.rs
```

![fig13](images/fig13.png)

_**Fig. 13. Runset File**_

You should check your library, cell, and view are correctly set and Format should be `OpenAccess` to communicate with `IC Validator` Don't forget to enable `Launch Debugger` and `View Output` to see DRC result.

![fig14](images/fig14.png)

_**Fig. 14. DRC Setup**_

Click OK. After DRC is done, you will see a message on your Console indicating that DRC is
done, see Fig.15.

![fig15](images/fig15.png)

_**Fig. 15. DRC result in Console**_

When the layout is free from all the errors and meets all the design rules, you can see `Completed with no erros` message in the console. But if not, the debugger will launch, and you can see which bug you have it.


![fig16](images/fig16.png)

_**Fig. 16. DRC Debug -- Run Summary**_

![fig17](images/fig17.png)

_**Fig. 17. DRC Debug -- DRC Errors**_

In Fig 16 and 17, it shows 1 violation found, to see the error detail, you need to clock `DRC Erros` tab. Then see your design name and double click error, then it shows where the error comes from.

Also for debugging screen again, you can go to `Verification -> DRC -> Debug`, see Fig.18.

![fig18](images/fig18.png)

_**Fig. 18. DRC Debug**_


## Part 7: Running LVS

The LVS (Layout versus Schematic) performs LVS comparison to verify that the design layout accurately represents the electronic equivalent of the design schematic. `IC Validator` LVS verifies whether the physical design design matches the schematic by extracting the devices, verifying the connectivity between the devices and comparing the extracted information with the schematic netlist.

__Notice that in order to pass LVS, schematic names and layout names must match one to one__. Make sure the names for labels and pins are using uppercase letters instead of lowercase letters. Also transistor dimensions for gate width and length in layout and schematic must match. See Fig 19 and 20 for reference.

![fig19](images/fig19.png)

_**Fig. 19. Layout versus Schematic (LVS)**_

![fig20](images/fig20.png)

_**Fig. 20. Layout versus Schematic (LVS)**_

In the layout window go to `Verification -> LVS -> Setup and Run`. Please make sure your setup mirrors the Fig.21.

Under main option select the file “rules.lvs.9m_saed90.ev” as `Run Dir` in the following directory:
```
[under your project folder]/pvjob_mylibrary.inverter.icv.lvs
```
Here, we assume library name is `mylibrary` and cell name is `inverter` here.

You need to make sure of all `OpenAccess` for Layout and Schematic/Config. Check `Launch Debugger` and `View Output`.

![fig21](images/fig21.png)

_**Fig. 21. LVS Setup -- Main**_

Under Netlisting Option tab, for the netlister, select: CDL if not already selected. See Fig.22.

![fig22](images/fig22.png)

_**Fig. 22. LVS Setup -- Netlisting Options**_


Under the Custom Options tab, leave the defaults as shown in Fig.23. Click OK when done.

![fig23](images/fig23.png)

_**Fig. 23. LVS Setup -- Custom Options**_

Like DRC, you can use debugging window to fix your LVS problem in Fig.24.

![fig24](images/fig24.png)

_**Fig. 64. LVS Debug**_

After fix every thing, you can see `PASS` message in Fig.25.

![fig25](images/fig25.png)

_**Fig. 25. LVS Pass**_

## Part 8: Design NAND Gate

From your lecture class, we learned NAND gate schematic and its layout. Now, from Lab1 and Lab2 tutorials, we learned how to draw schematic, simulate, and layout your circuit. Now we draw NAND gate schematic and layout. f'=a*b, so you need to design your NAND gate schematic and design testbench with your NAND symbol to simulate with HSPICE, then you need to draw layout for NAND gate with successful DRC and LVS.

1. Design your `NAND` gate cell (see lecture notes)

1. Design your `NAND` symbol

1. Design your testbench for simulation `NAND_testbench` cell

1. Do transient simulation with two different inputs and one output, you need to show if `NAND` gate is correctly working. You need to setup your testing variables such as timing, Input signal frequencies (`AIN`, `BIN`) with appropriate `VDD` and `VSS`.

1. Draw `NAND` gate layout (see lecture notes)

1. DRC for `NAND` gate layout

1. LVS for `NAND` gate layout


## Lab2

### Objective

Lab 2 is to learn how to design your layout, validate with DRC and LVS. You will learn three IC design tools (Custom Designer, IP Validator) and design inverter and NAND gates in this lab and the followings are expected to be delivered in your lab report.


### Checkoff

* inverter layout, DRC, LVS

* NAND schematic, testbench, simulation waveform

* You do not need to demo your NAND layout, DRC, LVS during lab 2 session. But you need to demo your NAND layout, DRC, LVS together with your lab3-1 results at the lab3-1 session (week 4).


### Deliverables for your lab report.

* Name, SID, Session(021,022,023), ENGR ID, UCR NetID

* Summary of what you learned thru this lab (One paragraph)

* Your inverter layout in Fig.11 or Fig.12.

* A DRC Result with `CLEAN` for your inverter layout in Fig.18.

* A LVS Result with `PASS` for your inverter layout in Fig.24.

* Your NAND gate schematic (Only NAND cell)

* Your NAND gate test bench schematic for simulation

* Your Waveform View result with transient analysis result (SAE, HSPICE) to show `OUT'=AIN*BIN`, you need one capacitance load (0.05p F) at the output connecting your `OUT` to `GND` to remove noise of `OUT`. `AIN` pulse signal can be 5n pulse width `BIN` pulse signal can be 10n pulse width for simulation. Expected result can be seen in Fig.26.

![fig26](images/fig26.png)

_**Fig. 26. Expected NAND Simulation Result**_

* Your NAND gate layout

* An DRC Result with `CLEAN` for your NAND gate layout.

* An LVS Result with `PASS` for your NAND gate layout.

* Some of the issues if you have (One paragraph)

### What to submit

* Lab report (PDF format)

file name should be following

`lab2-[My UCR NET ID].pdf`

for example, my UCR Net ID is `tkim049`, so filename should be

`lab2-tkim049.pdf`

* Tar and Zip your design folder you made

`cd ~/eecs168` or you made

`tar -cvzf lab2-[My UCR NET ID].tgz ./`

for example, my ucr Net ID is `tkim049`, so do like following

`tar -cvzf lab2-tkim049.tgz ./`

* You need to submit two files (\*.pdf, \*.tgz) in iLearn

### Lab Report Due

* One week.

* eecs168-021, 023: by 11:59pm on 1/28
* eecs168-022: by 11:59pm on 1/29

### Next lab

In lab 3, you will learn Parasitic Extraction, post-simulation with parasitic extraction, and Hierarchical design with 4-bit Full Adder. In addition, we will start to design Standard Cell for our full chip later.
