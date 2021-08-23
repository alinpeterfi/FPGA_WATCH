# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "IN_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH0" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH1" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH2" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH3" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH4" -parent ${Page_0}
  ipgui::add_param $IPINST -name "WIDTH5" -parent ${Page_0}


}

proc update_PARAM_VALUE.IN_WIDTH { PARAM_VALUE.IN_WIDTH } {
	# Procedure called to update IN_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.IN_WIDTH { PARAM_VALUE.IN_WIDTH } {
	# Procedure called to validate IN_WIDTH
	return true
}

proc update_PARAM_VALUE.WIDTH0 { PARAM_VALUE.WIDTH0 } {
	# Procedure called to update WIDTH0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH0 { PARAM_VALUE.WIDTH0 } {
	# Procedure called to validate WIDTH0
	return true
}

proc update_PARAM_VALUE.WIDTH1 { PARAM_VALUE.WIDTH1 } {
	# Procedure called to update WIDTH1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH1 { PARAM_VALUE.WIDTH1 } {
	# Procedure called to validate WIDTH1
	return true
}

proc update_PARAM_VALUE.WIDTH2 { PARAM_VALUE.WIDTH2 } {
	# Procedure called to update WIDTH2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH2 { PARAM_VALUE.WIDTH2 } {
	# Procedure called to validate WIDTH2
	return true
}

proc update_PARAM_VALUE.WIDTH3 { PARAM_VALUE.WIDTH3 } {
	# Procedure called to update WIDTH3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH3 { PARAM_VALUE.WIDTH3 } {
	# Procedure called to validate WIDTH3
	return true
}

proc update_PARAM_VALUE.WIDTH4 { PARAM_VALUE.WIDTH4 } {
	# Procedure called to update WIDTH4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH4 { PARAM_VALUE.WIDTH4 } {
	# Procedure called to validate WIDTH4
	return true
}

proc update_PARAM_VALUE.WIDTH5 { PARAM_VALUE.WIDTH5 } {
	# Procedure called to update WIDTH5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.WIDTH5 { PARAM_VALUE.WIDTH5 } {
	# Procedure called to validate WIDTH5
	return true
}


proc update_MODELPARAM_VALUE.IN_WIDTH { MODELPARAM_VALUE.IN_WIDTH PARAM_VALUE.IN_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.IN_WIDTH}] ${MODELPARAM_VALUE.IN_WIDTH}
}

proc update_MODELPARAM_VALUE.WIDTH5 { MODELPARAM_VALUE.WIDTH5 PARAM_VALUE.WIDTH5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH5}] ${MODELPARAM_VALUE.WIDTH5}
}

proc update_MODELPARAM_VALUE.WIDTH4 { MODELPARAM_VALUE.WIDTH4 PARAM_VALUE.WIDTH4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH4}] ${MODELPARAM_VALUE.WIDTH4}
}

proc update_MODELPARAM_VALUE.WIDTH3 { MODELPARAM_VALUE.WIDTH3 PARAM_VALUE.WIDTH3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH3}] ${MODELPARAM_VALUE.WIDTH3}
}

proc update_MODELPARAM_VALUE.WIDTH2 { MODELPARAM_VALUE.WIDTH2 PARAM_VALUE.WIDTH2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH2}] ${MODELPARAM_VALUE.WIDTH2}
}

proc update_MODELPARAM_VALUE.WIDTH1 { MODELPARAM_VALUE.WIDTH1 PARAM_VALUE.WIDTH1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH1}] ${MODELPARAM_VALUE.WIDTH1}
}

proc update_MODELPARAM_VALUE.WIDTH0 { MODELPARAM_VALUE.WIDTH0 PARAM_VALUE.WIDTH0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.WIDTH0}] ${MODELPARAM_VALUE.WIDTH0}
}

