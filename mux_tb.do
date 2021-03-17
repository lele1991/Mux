# ============================================================================
# Name        : tb_divisor.do
# Author      : Letícia de Oliveira Nunes
# Version     : 0.1
# Copyright   : Renan, Departamento de Eletrônica, Florianópolis, IFSC
# Description : Mux_sel
# ============================================================================


#Cria biblioteca do projeto
vlib work

#compila projeto: todos os aquivos. Ordem é importante
vcom mux_sel.vhd 
vcom mux_when.vhd 
vcom testbench.vhd

#Simula (work é o diretorio, testbench é o nome da entity)
#toplevel
vsim -t ns work.testbench 

#Mostra forma de onda
view wave

#Adiciona ondas específicas
# -radix: binary, hex, dec
# -label: nome da forma de onda
add wave -radix dec  /muxt_in_a
add wave -radix dec  /muxt_in_b
add wave -radix dec  /muxt_out
add wave -radix dec  /muxt_sel_0
add wave -radix dec  /muxt_sel_1
#Como mostrar sinais internos do processo


#Simula até um 100ns
run 100ns

wave zoomfull
#write wave wave.ps