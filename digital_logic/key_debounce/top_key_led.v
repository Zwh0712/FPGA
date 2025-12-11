module top_key_led(
    input      wire sys_clk,
    input      wire sys_rst_n,
    input      wire key_in_raw,     // 对应物理按键KEY1
    output     reg  led_out         //对应led
);

    wire key_pressed_pulse;//消抖后的脉冲信号
    
    //实例化消抖模块
    
    key_debounce u_debounce(
        .sys_clk    (sys_clk),
        .sys_rst_n  (sys_rst_n),
        .key_in     (key_in_raw),
        .key_flag   (key_pressed_pulse),//连接脉冲信号
        .key_value  ()
    );
    
    always @(posedge sys_clk or negedge sys_rst_n)begin
        if(!sys_rst_n)begin
            led_out <= 1'b1;
        end 
        else if(key_pressed_pulse)begin
            led_out <= ~led_out; 
        end
    end
    
endmodule

        