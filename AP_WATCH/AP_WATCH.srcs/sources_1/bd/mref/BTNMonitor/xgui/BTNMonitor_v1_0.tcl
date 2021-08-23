# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "LPTimeSamples" -parent ${Page_0}
  ipgui::add_param $IPINST -name "SAMPLE_DIV_RATE" -parent ${Page_0}
  ipgui::add_param $IPINST -name "StableTimeSamples" -parent ${Page_0}


}

proc update_PARAM_VALUE.LPTimeSamples { PARAM_VALUE.LPTimeSamples } {
	# Procedure called to update LPTimeSamples when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LPTimeSamples { PARAM_VALUE.LPTimeSamples } {
	# Procedure called to validate LPTimeSamples
	return true
}

proc update_PARAM_VALUE.SAMPLE_DIV_RATE { PARAM_VALUE.SAMPLE_DIV_RATE } {
	# Procedure called to update SAMPLE_DIV_RATE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SAMPLE_DIV_RATE { PARAM_VALUE.SAMPLE_DIV_RATE } {
	# Procedure called to validate SAMPLE_DIV_RATE
	return true
}

proc update_PARAM_VALUE.StableTimeSamples { PARAM_VALUE.StableTimeSamples } {
	# Procedure called to update StableTimeSamples when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.StableTimeSamples { PARAM_VALUE.StableTimeSamples } {
	# Procedure called to validate StableTimeSamples
	return true
}


proc update_MODELPARAM_VALUE.SAMPLE_DIV_RATE { MODELPARAM_VALUE.SAMPLE_DIV_RATE PARAM_VALUE.SAMPLE_DIV_RATE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SAMPLE_DIV_RATE}] ${MODELPARAM_VALUE.SAMPLE_DIV_RATE}
}

proc update_MODELPARAM_VALUE.StableTimeSamples { MODELPARAM_VALUE.StableTimeSamples PARAM_VALUE.StableTimeSamples } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.StableTimeSamples}] ${MODELPARAM_VALUE.StableTimeSamples}
}

proc update_MODELPARAM_VALUE.LPTimeSamples { MODELPARAM_VALUE.LPTimeSamples PARAM_VALUE.LPTimeSamples } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LPTimeSamples}] ${MODELPARAM_VALUE.LPTimeSamples}
}

