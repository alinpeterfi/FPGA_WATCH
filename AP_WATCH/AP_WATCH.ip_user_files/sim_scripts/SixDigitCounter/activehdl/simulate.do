onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+SixDigitCounter -L xil_defaultlib -L util_vector_logic_v2_0_1 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.SixDigitCounter xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {SixDigitCounter.udo}

run -all

endsim

quit -force
