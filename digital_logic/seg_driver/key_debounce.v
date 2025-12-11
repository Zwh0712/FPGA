module key_debounce(
    input   wire  sys_clk,      //50MHz
    input   wire  sys_rst_n,
    input   wire  key_in,       //物理按键输入（可能带抖动）
    
    output  reg  key_flag,   //输出：一个时钟周期的脉冲，代表按键有效按下
    output  reg  key_value   //输出：消抖后的稳定电平
);

    //20ms 计数器目标值
    //50MHz *0.02s = 1000000
    parameter CNT_MAX = 20'd1_000_000;
    
    reg [19:0] cnt;
    reg key_reg;
    
    //状态机/计数器逻辑
    always@(posedge sys_clk or negedge sys_rst_n) begin
        if(!sys_rst_n)begin
            cnt       <= 20'd0;
            key_flag  <= 1'b0;
            key_value <= 1'b1;  //默认高电平（未按下）
        end
        else begin
        //默认将标志位拉低，只有在计数满的一瞬间拉高
        key_flag      <= 1'b0;
        //如果按键是低电平（假设按下为0）
        if(key_in == 1'b0)begin
            //如果计数器还没满，就一直加
            if(cnt < CNT_MAX)begin
                cnt <= cnt + 1'b1;
            end
            //刚好数满20ms 的那一刻
            else if (cnt == CNT_MAX)begin
                key_flag    <= 1'b1;
                key_value   <= 1'b0;
                cnt         <= cnt + 1'b1;
            end
            //  计数满后，保持现状，什么都不做，直接松开按键
        end
        else begin
            //  按键一旦变高（松开或抖动到最高），计数器立马清零！
            //  这就是“消抖”的核心；必须连续低电平，中间断一下就要重来。
            cnt          <= 20'd0;
            key_value    <= 1'b1;
        end
    end
end

endmodule

        
            