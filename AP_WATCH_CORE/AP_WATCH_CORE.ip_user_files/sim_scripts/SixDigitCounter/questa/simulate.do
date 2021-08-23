onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib SixDigitCounter_opt

do {wave.do}

view wave
view structure
view signals

do {SixDigitCounter.udo}

run -all

quit -force
