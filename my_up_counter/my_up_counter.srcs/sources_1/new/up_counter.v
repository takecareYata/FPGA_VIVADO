`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/16 14:38:00
// Design Name: 
// Module Name: up_counter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module up_counter #(
    parameter DIV = 1000000
)(
    input wire clk,          
    input wire reset,
    input wire btnU,          // 상태 토글용 RUN <-> STOP
    input wire btnD,          // STOP 상태에서 리셋용
    output reg [15:0] led
);

    parameter RUN  = 1'b0;
    parameter STOP = 1'b1;

    reg state = RUN;
    
    reg r_btnU = 1'b0;
    wire w_btnU;

    reg [$clog2(DIV)-1:0] r_div_count = 0;
    wire w_tick_10ms = (r_div_count == DIV - 1);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_div_count <= 0;
        end 
        else if (w_tick_10ms) begin
            r_div_count <= 0;
        end 
        else begin
            r_div_count <= r_div_count + 1;
        end
    end

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            r_btnU <= 1'b0;
        end else begin
            r_btnU <= btnU;
        end
    end
    assign w_btnU = (btnU && !r_btnU); // 0에서 1로 변하는 순간 펄스 발생???

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= RUN;
            led   <= 16'b0;
        end 
        else begin
            if (w_btnU) begin
                state <= ~state; 
            end

            case (state)
                RUN: begin
                    if (w_tick_10ms) begin
                        led <= led + 1;
                    end
                end
                STOP: begin
                    if (btnD) begin
                        led <= 16'b0; 
                    end
                end
            endcase
        end
    end

endmodule