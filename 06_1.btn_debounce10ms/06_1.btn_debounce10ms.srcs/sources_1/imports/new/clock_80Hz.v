`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 14:22:49
// Design Name: 
// Module Name: clock_80Hz
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


module clock_80Hz #(
    parameter DIV = 1250000 // 80Hz 분주를 default로 // 시뮬레이션 Test bench 에서 값을 작은 값으로 지정 (override)
                            // 외부에서 값을 지정하지 않으면 현재 값으로 동작
    )   
    (
    input clk, // 100MHz
    input reset, //sw15
    output reg oclk //80Hz
    );

    //reg [23:0] r_counter = 0; // 1,250,000번 분주 -> 80Hz 주파수 : 10ns * 1,250,000 = 12.5ms
    reg [$clog2(DIV)-1:0] r_counter = 0;

    //10ms의 clk 이 상승엣지거나 reset 신호가 오면 항상 수행한다.
    always @(posedge clk, posedge reset) begin
        if(reset) begin // 비동기 reset 0 ---> 1
            oclk <= 0;
            r_counter <= 0;
        end
        else begin
            if (r_counter == ((DIV/2) - 1)) begin // 80Hz의 한주기 12.5ms
                r_counter <= 0;
                oclk <= ~oclk;
            end
            else begin
                r_counter <= r_counter + 1;
            end
        end
    end
    


endmodule
