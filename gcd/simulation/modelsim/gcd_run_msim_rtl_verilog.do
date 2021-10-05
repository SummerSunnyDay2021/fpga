transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+L:/FPGA_Proj/My_GCD/rtl {L:/FPGA_Proj/My_GCD/rtl/gcd_datapath.v}
vlog -vlog01compat -work work +incdir+L:/FPGA_Proj/My_GCD/rtl {L:/FPGA_Proj/My_GCD/rtl/gcd_control.v}
vlog -vlog01compat -work work +incdir+L:/FPGA_Proj/My_GCD/rtl {L:/FPGA_Proj/My_GCD/rtl/gcd.v}

vlog -vlog01compat -work work +incdir+L:/FPGA_Proj/My_GCD/simulation/modelsim {L:/FPGA_Proj/My_GCD/simulation/modelsim/gcd.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  gcd_test

add wave *
view structure
view signals
run -all
