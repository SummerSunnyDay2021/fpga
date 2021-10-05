transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+G:/FPGA_Proj/sqrt/rtl {G:/FPGA_Proj/sqrt/rtl/sqrt.v}
vlog -vlog01compat -work work +incdir+G:/FPGA_Proj/sqrt/rtl {G:/FPGA_Proj/sqrt/rtl/datapath.v}
vlog -vlog01compat -work work +incdir+G:/FPGA_Proj/sqrt/rtl {G:/FPGA_Proj/sqrt/rtl/controlunit.v}

vlog -vlog01compat -work work +incdir+G:/FPGA_Proj/sqrt/simulation/modelsim {G:/FPGA_Proj/sqrt/simulation/modelsim/sqrt.vt}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  sqrt_test

add wave *
view structure
view signals
run -all
