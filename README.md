# vhdl
learning and practice of vhsic hardware description language

## VHDL using ghdl

### Steps to execute (hello_world programm):

1. compile the file -> analysis of a design file in vhdl terms. Run:
   ```
   ghdl -a helloworld.vhdl
   ```
2. Run:  
   ```
   ghdl -e hello_world
   ```
   Option -e means elaborate which is used to build a design, with the hello_world entity at the top of the hierarchy

3. Lastly, launch simulation running:
   ```
   ghdl -r hello_world
   ```
   The result shpuld be outputed to the screen and should look something like:
   ```
   Hello world!
   ```
