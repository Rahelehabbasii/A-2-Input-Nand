****NAND 2 input*****

.include model.sp

VDD VDD 0 1.2
*VVDD VDD 0 1.2
*.GLOBAL VDD
*VVSS VSS 0 0
*.GLOBAL VSS
.param supply = 1.2
.param Deadline = 45n
*

**----------------VIN use for "Total Power" and VIN_low , VIN_HIGH use for static power

VIN1 A 0 0 PULSE (0 1.2 1n 30p 30p 1n 2n)
VIN2 B 0 0 PULSE (0 1.2 2n 30p 30p 2n 4n)

*VIN_LOW IN 0 0 
*VIN_HIGH IN 0 1.2 

Mp1 OUT  A VDD VDD pmos L=0.13u W=4.0u
Mp2 OUT  B VDD VDD pmos L=0.13u W=4.0u
Mn1 OUT  A NET1 0  nmos L=0.13u W=2.0u
Mn2 NET1 B  0   0  nmos L=0.13u W=2.0u

CLOAD OUT 0 20fF


.tran 1p 9n

.PRINT TRAN V(IN) V(OUT)
 
 **---------------------------measure power : Total power   &    Static Power
 
.MEASURE Ptotal AVG POWER from 0NS to 3NS
.measure PDP param='Ptotal*2ns'


 .END 
