# do C4M1P3_run_msim_rtl_vhdl.do
# if {[file exists rtl_work]} {
# 	vdel -lib rtl_work -all
# }
# vlib rtl_work
# vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 10.5b Lib Mapping Utility 2016.10 Oct  5 2016
# vmap work rtl_work 
# Copying /home/andrei_belov/intelFPGA_lite/18.1/modelsim_ase/linuxaloem/../modelsim.ini to modelsim.ini
# Modifying modelsim.ini
# 
# vlog -vlog01compat -work work +incdir+/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3 {/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/DE10_LITE_Default.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 01:02:21 on Apr 05,2024
# vlog -reportprogress 300 -vlog01compat -work work "+incdir+/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3" /home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/DE10_LITE_Default.v 
# -- Compiling module DE10_LITE_Default
# 
# Top level modules:
# 	DE10_LITE_Default
# End time: 01:02:21 on Apr 05,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vcom -93 -work work {/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/Full_adder.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 01:02:21 on Apr 05,2024
# vcom -reportprogress 300 -93 -work work /home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/Full_adder.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package std_logic_arith
# -- Loading package STD_LOGIC_UNSIGNED
# -- Compiling entity Full_adder
# -- Compiling architecture Selected of Full_adder
# -- Compiling architecture Behavioural of Full_Adder
# -- Loading entity Full_adder
# -- Compiling architecture Behavioural1 of Full_adder
# -- Loading entity Full_adder
# -- Compiling architecture Behavioural2 of Full_adder
# -- Loading entity Full_adder
# -- Compiling architecture Mux of Full_adder
# -- Loading entity Full_adder
# End time: 01:02:21 on Apr 05,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vcom -93 -work work {/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/C4M1P3.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 01:02:21 on Apr 05,2024
# vcom -reportprogress 300 -93 -work work /home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P3/C4M1P3.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package std_logic_arith
# -- Loading package STD_LOGIC_UNSIGNED
# -- Compiling entity C4M1P3_internal
# -- Compiling architecture Behavioural of C4M1P3_internal
# -- Compiling architecture Structural of C4M1P3_internal
# -- Loading entity C4M1P3_internal
# -- Loading entity Full_adder
# -- Compiling architecture Structural2 of C4M1P3_internal
# -- Loading entity C4M1P3_internal
# -- Compiling configuration C4M1P3_internal_Config
# -- Loading entity C4M1P3_internal
# -- Loading architecture Structural2 of C4M1P3_internal
# -- Compiling entity C4M1P3
# -- Compiling architecture Structural of C4M1P3
# -- Loading entity C4M1P3_internal
# End time: 01:02:21 on Apr 05,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# 
# stdin: <EOF>
vsim work.DE10_LITE_Default
# vsim work.DE10_LITE_Default 
# Start time: 01:02:34 on Apr 05,2024
# Loading work.DE10_LITE_Default
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.std_logic_arith(body)
# Loading ieee.std_logic_unsigned(body)
# Loading work.c4m1p3(structural)
# Loading work.c4m1p3_internal(structural)
# Loading work.full_adder(mux)
# ** Warning: (vsim-8683) Uninitialized out port /DE10_LITE_Default/u1/LEDR(9) has no driver.
# This port will contribute value (U) to the signal network.
# ** Warning: (vsim-8683) Uninitialized out port /DE10_LITE_Default/u1/LEDR(8) has no driver.
# This port will contribute value (U) to the signal network.
# ** Warning: (vsim-8683) Uninitialized out port /DE10_LITE_Default/u1/LEDR(7) has no driver.
# This port will contribute value (U) to the signal network.
# ** Warning: (vsim-8683) Uninitialized out port /DE10_LITE_Default/u1/LEDR(6) has no driver.
# This port will contribute value (U) to the signal network.
# ** Warning: (vsim-8683) Uninitialized out port /DE10_LITE_Default/u1/LEDR(5) has no driver.
# This port will contribute value (U) to the signal network.
add wave -position insertpoint  \
sim:/DE10_LITE_Default/u1/SW \
sim:/DE10_LITE_Default/u1/LEDR
add wave -position insertpoint  \
sim:/DE10_LITE_Default/u1/u0/Cin \
sim:/DE10_LITE_Default/u1/u0/A \
sim:/DE10_LITE_Default/u1/u0/B \
sim:/DE10_LITE_Default/u1/u0/Cout \
sim:/DE10_LITE_Default/u1/u0/S
force -freeze sim:/DE10_LITE_Default/u1/u0/Cin 1 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/u1/SW as root of /DE10_LITE_Default/u1/u0/Cin specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
force -freeze sim:/DE10_LITE_Default/u1/u0/A 0000 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
force -freeze sim:/DE10_LITE_Default/u1/u0/B 1111 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
run
force -freeze sim:/DE10_LITE_Default/u1/u0/A 1010 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
force -freeze sim:/DE10_LITE_Default/u1/u0/B 0101 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
run
force -freeze sim:/DE10_LITE_Default/u1/u0/Cin 0 0
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/u1/SW as root of /DE10_LITE_Default/u1/u0/Cin specified in the force.
# ** Warning: (vsim-8780) Forcing /DE10_LITE_Default/SW as root of /DE10_LITE_Default/u1/SW specified in the force.
run
quit -sim
# End time: 01:04:19 on Apr 05,2024, Elapsed time: 0:01:45
# Errors: 0, Warnings: 36
