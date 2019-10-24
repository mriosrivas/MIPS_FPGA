#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/opt/Xilinx/SDK/2019.1/bin:/opt/Xilinx/Vivado/2019.1/ids_lite/ISE/bin/lin64:/opt/Xilinx/Vivado/2019.1/bin
else
  PATH=/opt/Xilinx/SDK/2019.1/bin:/opt/Xilinx/Vivado/2019.1/ids_lite/ISE/bin/lin64:/opt/Xilinx/Vivado/2019.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/media/manuel/ExtraDrive1/URL/Hardware_Arquitecturas/Labs/MIPSfpga_Labs_v2.0/MIPSfpga_Labs/Labs/Xilinx/Part1_Intro/Lab01_Vivado/Project_1/Project_1.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log mfp_nexys4_ddr.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source mfp_nexys4_ddr.tcl
