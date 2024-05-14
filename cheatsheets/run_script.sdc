export PATH="/home/andrei_belov/intelFPGA_lite/18.1/quartus/bin:${PATH}"

#https://stackoverflow.com/questions/3041530/how-to-get-command-history-by-cursor-key-in-linux-tclsh

rlwrap quartus_sh -s

# Quartus Prime Fitter
# Usage:
# 	quartus_fit [-h | --help[=<option|topic>] | -v]
# 	quartus_fit <project name> [<options>]
# 	quartus_fit -t <script file> [<script args>]
# 	quartus_fit -s
# 	quartus_fit --tcl_eval <tcl command>
#	project_open my_top
#	--------------
#	Example Usage:
#	--------------
#
#	# Report worst case period for -9 speed grade
#	create_timing_netlist -speed 9
#
#	# Read SDC and update timing
#	read_sdc
#	update_timing_netlist
#
#	report_timing -clock_setup -clock_filter clk
#	delete_timing_netlist
#
#	# Report hold violation for fastest corner
#	# Use set_operating_conditions instead
#	create_timing_netlist -model fast
#
#	# Read SDC and update timing
#	read_sdc
#	update_timing_netlist
#
#	report_timing -clock_hold -clock_filter clk
#	delete_timing_netlist
#
#	# If Delay Annotation has been run for the fast corner
#	# Force Delay Annotation
#	create_timing_netlist -model fast -force_dat
#
#	# Read SDC and update timing
#	read_sdc
#	update_timing_netlist
#
#	report_timing -clock_hold -clock_filter clk
#	delete_timing_netlist
#
#	# Report worst case period for post-technology mapping netlist
#	create_timing_netlist -post_map
#
#	# Read SDC and update timing
#	read_sdc
#	update_timing_netlist
#
#	report_timing -clock_setup -clock_filter clk
#	delete_timing_netlist
#
#	project_close
#https://community.intel.com/t5/Intel-Quartus-Prime-Software/quartus-sta-not-working-inside-quartus-fit/td-p/1234683
rlwrap quartus_fit -s
load_package sdc
project_open Embed


# Quartus Prime Timing Analyzer
# Usage:
# 	quartus_sta [-h | --help[=<option|topic>] | -v]
# 	quartus_sta <project name> [<options>]
# 	quartus_sta -t <script file> [<script args>]
# 	quartus_sta -s
# 	quartus_sta --tcl_eval <tcl command>
#	--------------
#	Example Usage:
#	--------------
#
#	project_open my_top
#	# Create timing netlist before calling any report functions
#	create_timing_netlist
#
#	# Read SDC and update timing
#	read_sdc
#	update_timing_netlist
#
#	# Ready to call report functions
#	report_timing -npaths 1 -clock_setup
#
#	# The following command is optional
#	delete_timing_netlist
#
#	project_close
#

quartus_sh --tcl_eval load_package flow \; project_open Embed \; execute_flow -compile

#or

quartus_map --read_settings_files=on --write_settings_files=off Embed -c Embed
quartus_fit --read_settings_files=off --write_settings_files=off Embed -c Embed
quartus_asm --read_settings_files=off --write_settings_files=off Embed -c Embed
quartus_sta --do_report_timing Embed -c Embed

rlwrap quartus_sta -s
load_package sdc
load_package flow
load_package report

project_open Embed
create_timing_netlist
read_sdc



