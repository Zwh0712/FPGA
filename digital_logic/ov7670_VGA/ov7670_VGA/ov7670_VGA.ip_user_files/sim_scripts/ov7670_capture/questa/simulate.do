onbreak {quit -f}
onerror {quit -f}

vsim -lib xil_defaultlib ov7670_capture_opt

do {wave.do}

view wave
view structure
view signals

do {ov7670_capture.udo}

run -all

quit -force
