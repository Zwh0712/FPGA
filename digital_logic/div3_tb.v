`timescale 1ns/1ps

module tb_div3;

    reg clk_in;
    reg rst_n;
    wire clk_out;

    // Instantiate DUT
    div_3 uut (
        .clk_in(clk_in),
        .rst_n(rst_n),
        .clk_out(clk_out)
    );

    // Clock: 100 MHz -> period 10 ns
    initial clk_in = 1'b0;
    always #5 clk_in = ~clk_in;

    // Reset
    initial begin
        rst_n = 1'b0;
        #30; // hold reset for two clock cycles
        rst_n = 1'b1;
    end

    // Waveform dump (for Icarus/GTKWave)
    initial begin
        $dumpfile("div3_tb.vcd");
        $dumpvars(0, tb_div3);
    end

    // Simple period measurement on clk_out
    time last_time;
    time period;

    initial begin
        last_time = 0;
        #2000; // run long enough to observe several periods
        $display("Simulation finished.");
        $finish;
    end

    always @(posedge clk_out) begin
        if (last_time != 0) begin
            period = $time - last_time;
            $display("@%0t ns: clk_out posedge, period = %0t ns", $time, period);
            // crude check: expected ~30 ns for 100 MHz input divided by 3
            if (period < 28 || period > 32) begin
                $display("WARNING: measured period %0t ns outside expected ~30 ns", period);
            end
        end
        last_time = $time;
    end

    // Optional textual monitor
    initial begin
        $display("Starting div_3 testbench");
        $display("Time\tclk_in\tclk_out");
        forever begin
            @(posedge clk_in);
            $display("%0t\t%b\t%b", $time, clk_in, clk_out);
        end
    end

endmodule
