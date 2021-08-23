vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/util_vector_logic_v2_0_1

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap util_vector_logic_v2_0_1 modelsim_lib/msim/util_vector_logic_v2_0_1

vcom -work xil_defaultlib  -93 \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_CntNbits_L_0_0/sim/SixDigitCounter_CntNbits_L_0_0.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_CntNbits_L_0_1/sim/SixDigitCounter_CntNbits_L_0_1.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_DataExpand3out_0_1/sim/SixDigitCounter_DataExpand3out_0_1.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_Digit1_0/sim/SixDigitCounter_Digit1_0.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_Digit2_0/sim/SixDigitCounter_Digit2_0.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_Digit3_0/sim/SixDigitCounter_Digit3_0.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_Digit4_0/sim/SixDigitCounter_Digit4_0.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_DataConcat3in_0_1/sim/SixDigitCounter_DataConcat3in_0_1.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_BTNMonitor_0_2/sim/SixDigitCounter_BTNMonitor_0_2.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_BTNMonitor_0_3/sim/SixDigitCounter_BTNMonitor_0_3.vhd" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_BtnControl_0_2/sim/SixDigitCounter_BtnControl_0_2.vhd" \

vlog -work util_vector_logic_v2_0_1  -incr \
"../../../../AP_WATCH.srcs/sources_1/bd/SixDigitCounter/ipshared/2137/hdl/util_vector_logic_v2_0_vl_rfs.v" \

vlog -work xil_defaultlib  -incr \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_0_3/sim/SixDigitCounter_util_vector_logic_0_3.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_0_4/sim/SixDigitCounter_util_vector_logic_0_4.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_0_5/sim/SixDigitCounter_util_vector_logic_0_5.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_0_6/sim/SixDigitCounter_util_vector_logic_0_6.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_3_0/sim/SixDigitCounter_util_vector_logic_3_0.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_0_7/sim/SixDigitCounter_util_vector_logic_0_7.v" \
"../../../bd/SixDigitCounter/ip/SixDigitCounter_util_vector_logic_5_0/sim/SixDigitCounter_util_vector_logic_5_0.v" \

vcom -work xil_defaultlib  -93 \
"../../../bd/SixDigitCounter/sim/SixDigitCounter.vhd" \

vlog -work xil_defaultlib \
"glbl.v"

