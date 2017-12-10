onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {New Group} /tb/CLOCK_50
add wave -noupdate -expand -group {New Group} /tb/START
add wave -noupdate -expand -group {New Group} /tb/DONE
add wave -noupdate -expand -group {New Group} /tb/DATA_IN
add wave -noupdate -expand -group {New Group} /tb/test/MEM_A/byte
add wave -noupdate -expand -group {New Group} /tb/test/X
add wave -noupdate -expand -group {New Group} /tb/test/COUNT_DONE
add wave -noupdate -expand -group {New Group} /tb/test/CS_A
add wave -noupdate -expand -group {New Group} /tb/test/WR_A
add wave -noupdate -expand -group {New Group} /tb/test/RD_A
add wave -noupdate -expand -group {New Group} /tb/test/CS_B
add wave -noupdate -expand -group {New Group} /tb/test/WR_B
add wave -noupdate -expand -group {New Group} /tb/test/EN_COUNTER
add wave -noupdate -expand -group {New Group} /tb/test/CL
add wave -noupdate -expand -group {New Group} /tb/test/loadQ
add wave -noupdate -expand -group {New Group} /tb/test/ADD_SEL
add wave -noupdate -expand -group {New Group} /tb/test/SEL
add wave -noupdate -expand -group {New Group} /tb/test/Y
add wave -noupdate -expand -group {New Group} /tb/test/MEM_B/byte
add wave -noupdate -expand -group {New Group} /tb/test/CU/status
add wave -noupdate -expand -group {New Group} /tb/test/CU/nextstatus
add wave -noupdate -expand -group {New Group} /tb/test/ADDRESS
add wave -noupdate -expand -group REGS /tb/test/DP/Q0
add wave -noupdate -expand -group REGS /tb/test/DP/Q1
add wave -noupdate -expand -group REGS /tb/test/DP/Q2
add wave -noupdate -expand -group REGS /tb/test/DP/Q3
add wave -noupdate -expand -group REGS /tb/test/DP/QTOMUX
add wave -noupdate -expand -group REGS /tb/test/DP/QTOADD
add wave -noupdate -expand -group REGS /tb/test/DP/SUMREG
add wave -noupdate -expand -group REGS /tb/test/DP/SUMOUT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {51000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 192
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {55726 ps} {64089 ps}
