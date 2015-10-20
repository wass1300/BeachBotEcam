transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {F:/de0/clk_div.vhd}
vcom -93 -work work {F:/de0/roue_codeuse.vhd}
vcom -93 -work work {F:/de0/FiltreHall.vhd}
vcom -93 -work work {F:/de0/roues_codeuses.vhd}

