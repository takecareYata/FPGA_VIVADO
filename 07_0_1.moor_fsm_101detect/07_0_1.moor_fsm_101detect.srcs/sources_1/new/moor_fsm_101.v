`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/19 10:39:43
// Design Name: 
// Module Name: moof_fsm_101
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

// moor fsm: 입력 x에서 101 시퀀스(중첩허용)
//           출력 y (S3 상태로 왔을때 y가 1로 된다)    
module moor_fsm_101(
    input wire clk,
    input wire reset,
    input wire x,
    output y
    );

    // 상태 인코딩 (S0 대기 -> S1 1검출 -> S2 10검출 -> S3 101전체검출 )
    localparam [1:0] S0 = 2'b00; // 대기 IDLE
    localparam [1:0] S1 = 2'b01; // 1검출 
    localparam [1:0] S2 = 2'b10; // 10검출
    localparam [1:0] S3 = 2'b11; // 101전체검출

    reg [1:0] curr_state, next_state;

    // 1. curr_state 상태 register (순차회로)
    always @(posedge clk, posedge reset) begin
        if (reset) begin
            curr_state <= S0;
        end
        else begin
            curr_state <= next_state;
        end
    end

    // 2. 다음상태 로직 (조합회로)
    always @(*) begin
        case (curr_state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S3 : S0;
            S3: next_state = x ? S1 : S2; // 중첩 허용

            default: next_state = S0; // Latch 방지
        endcase
    end

    // 3. 출력 로직 : 현재 상태로만 출력 (MOORE Machine)
    assign y = (curr_state == S3);


endmodule
