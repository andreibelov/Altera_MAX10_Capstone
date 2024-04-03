# do C4M1P2_run_msim_rtl_vhdl.do
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
# vlog -vlog01compat -work work +incdir+/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2 {/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2/DE10_LITE_Default.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 20:55:59 on Apr 03,2024
# vlog -reportprogress 300 -vlog01compat -work work "+incdir+/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2" /home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2/DE10_LITE_Default.v 
# -- Compiling module DE10_LITE_Default
# 
# Top level modules:
# 	DE10_LITE_Default
# End time: 20:55:59 on Apr 03,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# vcom -93 -work work {/home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2/C4M1P2.vhd}
# Model Technology ModelSim - Intel FPGA Edition vcom 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 20:55:59 on Apr 03,2024
# vcom -reportprogress 300 -93 -work work /home/andrei_belov/git/fpga/Altera_MAX10_Capstone/C4M1P2/C4M1P2.vhd 
# -- Loading package STANDARD
# -- Loading package TEXTIO
# -- Loading package std_logic_1164
# -- Loading package NUMERIC_STD
# -- Compiling entity C4M1P2
# -- Compiling architecture arch of C4M1P2
# End time: 20:55:59 on Apr 03,2024, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
# 
# 
# stdin: <EOF>
vsim -i -l msim_transcript work.DE10_LITE_Default -t ns
# vsim -i -l msim_transcript work.DE10_LITE_Default -t ns 
# Start time: 20:56:13 on Apr 03,2024
# Loading work.DE10_LITE_Default
# Loading std.standard
# Loading std.textio(body)
# Loading ieee.std_logic_1164(body)
# Loading ieee.numeric_std(body)
# Loading work.c4m1p2(arch)
add wave -position insertpoint  \
sim:/DE10_LITE_Default/u1/SW \
sim:/DE10_LITE_Default/u1/HEX0 \
sim:/DE10_LITE_Default/u1/HEX1 \
sim:/DE10_LITE_Default/u1/z \
sim:/DE10_LITE_Default/u1/A \
sim:/DE10_LITE_Default/u1/V \
sim:/DE10_LITE_Default/u1/D0
force -freeze sim:/DE10_LITE_Default/u1/V 0000 0
run
# ** Warning: (vsim-3116) Problem reading symbols from linux-gate.so.1 : can not open ELF file.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libpthread.so.0 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/librt.so.1 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libdl.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libm.so.6 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libc.so.6 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/ld-linux.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libnss_compat.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libnss_nis.so.2 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libnsl.so.1 : module was loaded at an absolute address.
# ** Warning: (vsim-3116) Problem reading symbols from /lib/i386-linux-gnu/libnss_files.so.2 : module was loaded at an absolute address.
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 0  Instance: /DE10_LITE_Default/u1
# ** Warning: NUMERIC_STD.TO_INTEGER: metavalue detected, returning 0
#    Time: 0 ns  Iteration: 1  Instance: /DE10_LITE_Default/u1
force -freeze sim:/DE10_LITE_Default/u1/V 1111 0
run
quit -sim
# End time: 20:57:25 on Apr 03,2024, Elapsed time: 0:01:12
# Errors: 0, Warnings: 13
