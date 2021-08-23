
################################################################
# This is a generated script based on design: SixDigitCounter
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source SixDigitCounter_script.tcl


# The design that will be created by this Tcl script contains the following 
# module references:
# BTNMonitor, BTNMonitor, BtnControl, DataConcat3in, DataExpand3out, CntNbits_L, CntNbits_L, CntNbits_L, CntNbits_L, CntNbits_L, CntNbits_L

# Please add the sources of those modules before sourcing this Tcl script.

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7a100tcsg324-1
   set_property BOARD_PART digilentinc.com:nexys4_ddr:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name SixDigitCounter

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set ADJ [ create_bd_port -dir O ADJ ]
  set CE [ create_bd_port -dir I CE ]
  set CE_Dbg [ create_bd_port -dir O CE_Dbg ]
  set CLK [ create_bd_port -dir I -type clk -freq_hz 100000000 CLK ]
  set DIN [ create_bd_port -dir I -from 23 -to 0 DIN ]
  set HS [ create_bd_port -dir O HS ]
  set INC [ create_bd_port -dir O INC ]
  set Load [ create_bd_port -dir I Load ]
  set MODE [ create_bd_port -dir I MODE ]
  set Q [ create_bd_port -dir O -from 23 -to 0 Q ]
  set RESETn [ create_bd_port -dir I -type rst RESETn ]
  set SET [ create_bd_port -dir I SET ]
  set TC [ create_bd_port -dir O -from 0 -to 0 TC ]
  set UnD [ create_bd_port -dir I UnD ]

  # Create instance: BTNMonitor_0, and set properties
  set block_name BTNMonitor
  set block_cell_name BTNMonitor_0
  if { [catch {set BTNMonitor_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $BTNMonitor_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: BTNMonitor_1, and set properties
  set block_name BTNMonitor
  set block_cell_name BTNMonitor_1
  if { [catch {set BTNMonitor_1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $BTNMonitor_1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: BtnControl_0, and set properties
  set block_name BtnControl
  set block_cell_name BtnControl_0
  if { [catch {set BtnControl_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $BtnControl_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DataConcat3in_0, and set properties
  set block_name DataConcat3in
  set block_cell_name DataConcat3in_0
  if { [catch {set DataConcat3in_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DataConcat3in_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: DataExpand3out_0, and set properties
  set block_name DataExpand3out
  set block_cell_name DataExpand3out_0
  if { [catch {set DataExpand3out_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $DataExpand3out_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Digit0, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit0
  if { [catch {set Digit0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Digit1, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit1
  if { [catch {set Digit1 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit1 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LIMIT {5} \
 ] $Digit1

  # Create instance: Digit2, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit2
  if { [catch {set Digit2 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit2 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Digit3, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit3
  if { [catch {set Digit3 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit3 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LIMIT {5} \
 ] $Digit3

  # Create instance: Digit4, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit4
  if { [catch {set Digit4 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit4 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: Digit5, and set properties
  set block_name CntNbits_L
  set block_cell_name Digit5
  if { [catch {set Digit5 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $Digit5 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
    set_property -dict [ list \
   CONFIG.LIMIT {2} \
 ] $Digit5

  # Create instance: util_vector_logic_1, and set properties
  set util_vector_logic_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_1 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_1

  # Create instance: util_vector_logic_2, and set properties
  set util_vector_logic_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_2 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_2

  # Create instance: util_vector_logic_3, and set properties
  set util_vector_logic_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_3 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_3

  # Create instance: util_vector_logic_4, and set properties
  set util_vector_logic_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_4 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_4

  # Create instance: util_vector_logic_5, and set properties
  set util_vector_logic_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 util_vector_logic_5 ]
  set_property -dict [ list \
   CONFIG.C_SIZE {1} \
 ] $util_vector_logic_5

  # Create port connections
  connect_bd_net -net BTNMonitor_0_BTN_Click [get_bd_pins BTNMonitor_0/BTN_Click] [get_bd_pins BtnControl_0/MODE_Click]
  connect_bd_net -net BTNMonitor_0_BTN_LongPress [get_bd_pins BTNMonitor_0/BTN_LongPress] [get_bd_pins BtnControl_0/MODE_LP]
  connect_bd_net -net BTNMonitor_0_CE_Dbg [get_bd_ports CE_Dbg] [get_bd_pins BTNMonitor_0/CE_Dbg]
  connect_bd_net -net BTNMonitor_1_BTN_Click [get_bd_pins BTNMonitor_1/BTN_Click] [get_bd_pins BtnControl_0/SET_Click]
  connect_bd_net -net BtnControl_0_ADJ [get_bd_ports ADJ] [get_bd_pins BtnControl_0/ADJ]
  connect_bd_net -net BtnControl_0_HS [get_bd_ports HS] [get_bd_pins BtnControl_0/HS]
  connect_bd_net -net BtnControl_0_INC [get_bd_ports INC] [get_bd_pins BtnControl_0/INC]
  connect_bd_net -net CE_1 [get_bd_ports CE] [get_bd_pins Digit0/CE]
  connect_bd_net -net CLK_1 [get_bd_ports CLK] [get_bd_pins BTNMonitor_0/CLK] [get_bd_pins BTNMonitor_1/CLK] [get_bd_pins BtnControl_0/CLK] [get_bd_pins Digit0/CLK] [get_bd_pins Digit1/CLK] [get_bd_pins Digit2/CLK] [get_bd_pins Digit3/CLK] [get_bd_pins Digit4/CLK] [get_bd_pins Digit5/CLK]
  connect_bd_net -net DIN_1 [get_bd_ports DIN] [get_bd_pins DataExpand3out_0/DIN]
  connect_bd_net -net DataConcat3in_0_Dout [get_bd_ports Q] [get_bd_pins DataConcat3in_0/Dout]
  connect_bd_net -net DataExpand3out_0_Dout0 [get_bd_pins DataExpand3out_0/Dout0] [get_bd_pins Digit0/Din]
  connect_bd_net -net DataExpand3out_0_Dout1 [get_bd_pins DataExpand3out_0/Dout1] [get_bd_pins Digit1/Din]
  connect_bd_net -net DataExpand3out_0_Dout2 [get_bd_pins DataExpand3out_0/Dout2] [get_bd_pins Digit2/Din]
  connect_bd_net -net DataExpand3out_0_Dout3 [get_bd_pins DataExpand3out_0/Dout3] [get_bd_pins Digit3/Din]
  connect_bd_net -net DataExpand3out_0_Dout4 [get_bd_pins DataExpand3out_0/Dout4] [get_bd_pins Digit4/Din]
  connect_bd_net -net DataExpand3out_0_Dout5 [get_bd_pins DataExpand3out_0/Dout5] [get_bd_pins Digit5/Din]
  connect_bd_net -net Digit0_Q [get_bd_pins DataConcat3in_0/Din0] [get_bd_pins Digit0/Q]
  connect_bd_net -net Digit1_Q [get_bd_pins DataConcat3in_0/Din1] [get_bd_pins Digit1/Q]
  connect_bd_net -net Digit1_TC [get_bd_pins Digit1/TC] [get_bd_pins util_vector_logic_1/Op1]
  connect_bd_net -net Digit2_Q [get_bd_pins DataConcat3in_0/Din2] [get_bd_pins Digit2/Q]
  connect_bd_net -net Digit2_TC [get_bd_pins Digit2/TC] [get_bd_pins util_vector_logic_2/Op1]
  connect_bd_net -net Digit3_Q [get_bd_pins DataConcat3in_0/Din3] [get_bd_pins Digit3/Q]
  connect_bd_net -net Digit3_TC [get_bd_pins Digit3/TC] [get_bd_pins util_vector_logic_3/Op1]
  connect_bd_net -net Digit4_Q [get_bd_pins DataConcat3in_0/Din4] [get_bd_pins Digit4/Q]
  connect_bd_net -net Digit4_TC [get_bd_pins Digit4/TC] [get_bd_pins util_vector_logic_4/Op1]
  connect_bd_net -net Digit5_Q [get_bd_pins DataConcat3in_0/Din5] [get_bd_pins Digit5/Q]
  connect_bd_net -net Digit5_TC [get_bd_pins Digit5/TC] [get_bd_pins util_vector_logic_5/Op1]
  connect_bd_net -net Load_1 [get_bd_ports Load] [get_bd_pins Digit0/Load] [get_bd_pins Digit1/Load] [get_bd_pins Digit2/Load] [get_bd_pins Digit3/Load] [get_bd_pins Digit4/Load] [get_bd_pins Digit5/Load]
  connect_bd_net -net MODE_1 [get_bd_ports MODE] [get_bd_pins BTNMonitor_0/BTN]
  connect_bd_net -net RESETn_1 [get_bd_ports RESETn] [get_bd_pins BTNMonitor_0/RESETn] [get_bd_pins BTNMonitor_1/RESETn] [get_bd_pins Digit0/RESETn] [get_bd_pins Digit1/RESETn] [get_bd_pins Digit2/RESETn] [get_bd_pins Digit3/RESETn] [get_bd_pins Digit4/RESETn] [get_bd_pins Digit5/RESETn]
  connect_bd_net -net SET_1 [get_bd_ports SET] [get_bd_pins BTNMonitor_1/BTN]
  connect_bd_net -net UnD_1 [get_bd_ports UnD] [get_bd_pins Digit0/UnD] [get_bd_pins Digit1/UnD] [get_bd_pins Digit2/UnD] [get_bd_pins Digit3/UnD] [get_bd_pins Digit4/UnD] [get_bd_pins Digit5/UnD]
  connect_bd_net -net util_vector_logic_0_Res [get_bd_pins Digit0/TC] [get_bd_pins Digit1/CE] [get_bd_pins util_vector_logic_1/Op2]
  connect_bd_net -net util_vector_logic_1_Res [get_bd_pins Digit2/CE] [get_bd_pins util_vector_logic_1/Res] [get_bd_pins util_vector_logic_2/Op2]
  connect_bd_net -net util_vector_logic_2_Res [get_bd_pins Digit3/CE] [get_bd_pins util_vector_logic_2/Res] [get_bd_pins util_vector_logic_3/Op2]
  connect_bd_net -net util_vector_logic_3_Res [get_bd_pins Digit4/CE] [get_bd_pins util_vector_logic_3/Res] [get_bd_pins util_vector_logic_4/Op2]
  connect_bd_net -net util_vector_logic_4_Res [get_bd_pins Digit5/CE] [get_bd_pins util_vector_logic_4/Res] [get_bd_pins util_vector_logic_5/Op2]
  connect_bd_net -net util_vector_logic_5_Res [get_bd_ports TC] [get_bd_pins util_vector_logic_5/Res]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


