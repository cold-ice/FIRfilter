onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/test/CLOCK_50
add wave -noupdate /tb/test/START
add wave -noupdate /tb/test/DATA_IN
add wave -noupdate /tb/test/WR_A
add wave -noupdate /tb/test/RD_A
add wave -noupdate /tb/test/WR_B
add wave -noupdate /tb/test/ADDRESS
add wave -noupdate /tb/test/X
add wave -noupdate /tb/test/Y
add wave -noupdate /tb/test/COUNT_DONE
add wave -noupdate /tb/test/DATA_OUT
add wave -noupdate /tb/test/CS_A
add wave -noupdate /tb/test/EN_COUNTER
add wave -noupdate /tb/test/DONE
add wave -noupdate /tb/test/CS_B
add wave -noupdate /tb/test/RD_B
add wave -noupdate /tb/test/CL
add wave -noupdate /tb/test/ADD_SUB
add wave -noupdate /tb/test/loadQ
add wave -noupdate /tb/test/ADD_SEL
add wave -noupdate /tb/test/SEL
add wave -noupdate /tb/test/MEM_A/CLOCK_50
add wave -noupdate /tb/test/MEM_A/CS
add wave -noupdate /tb/test/MEM_A/WR
add wave -noupdate /tb/test/MEM_A/RD
add wave -noupdate /tb/test/MEM_A/D_IN
add wave -noupdate /tb/test/MEM_A/ADDRESS
add wave -noupdate /tb/test/MEM_A/D_OUT
add wave -noupdate /tb/test/MEM_A/byte
add wave -noupdate /tb/test/MEM_B/CLOCK_50
add wave -noupdate /tb/test/MEM_B/CS
add wave -noupdate /tb/test/MEM_B/WR
add wave -noupdate /tb/test/MEM_B/RD
add wave -noupdate /tb/test/MEM_B/D_IN
add wave -noupdate /tb/test/MEM_B/ADDRESS
add wave -noupdate /tb/test/MEM_B/D_OUT
add wave -noupdate /tb/test/MEM_B/byte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 144
configure wave -valuecolwidth 56
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {913 ns}
