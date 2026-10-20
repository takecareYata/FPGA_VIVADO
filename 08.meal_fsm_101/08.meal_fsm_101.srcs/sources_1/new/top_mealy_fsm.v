`timescale 1ns / 1ps

module top_mealy_fsm(
    input clk,          
    input reset,       
    input btnU,         
    input btnD,         
    output led         
);

    // 1단계: 버튼 노이즈 제거
    wire clean_u, clean_d;
    
    debouncer u_deb_u (
        .clk(clk), 
        .reset(reset),
        .noisy_btn(btnU), 
        .clean_btn(clean_u)
    );
    
    debouncer u_deb_d (
        .clk(clk), 
        .reset(reset),
        .noisy_btn(btnD), 
        .clean_btn(clean_d)
    );
    
    // 2단계: 버튼을 누르는 순간만 포착 
    reg prev_u = 0, prev_d = 0;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            prev_u <= 0;
            prev_d <= 0;
        end 
        else begin
            prev_u <= clean_u;
            prev_d <= clean_d;
        end
    end
    
    wire trig_u = clean_u && !prev_u; // btnU를 누른 순간
    wire trig_d = clean_d && !prev_d; // btnD를 누른 순간
    
    wire fsm_clk = trig_u || trig_d;  // 버튼 중 하나라도 누르면 FSM이 한 칸씩 움직임!

    // 3단계: 어떤 버튼을 눌렀느냐에 따라 FSM 입력(x) 결정
    reg x_val = 0;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            x_val <= 0;
        end 
        else if (trig_u) begin
            x_val <= 1'b1; // btnU를 누르면 x = 1
        end 
        else if (trig_d) begin
            x_val <= 1'b0; // btnD를 누르면 x = 0
        end
    end

    // 4단계: 기존 Mealy FSM 불러오기
    wire fsm_y;
    
    mealy_fsm_101 u_mealy_fsm (
        .clk(fsm_clk),
        .reset(reset),
        .x(x_val),
        .y(fsm_y)
    );

    // 5단계: LED 켜고 끄기 제어
    reg led_reg = 0;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            led_reg <= 0;
        end 
        else begin
            if (fsm_y)        led_reg <= 1'b1; 
            else if (fsm_clk) led_reg <= 1'b0;
        end
    end

    assign led = led_reg;

endmodule