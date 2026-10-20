`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/19 13:56:03
// Design Name: 
// Module Name: mealy_fsm_101
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

module mealy_fsm_101(
    input clk,
    input reset,
    input x,
    output reg y
    );

    // 인코딩 (S3 상태는 불필요함.)
    localparam [1:0] S0 = 2'b00; // 대기상태
    localparam [1:0] S1 = 2'b01; // 1 검출
    localparam [1:0] S2 = 2'b10; // 10 검출
    
    reg [1:0] r_curr_state, r_next_state;

    // 1. curr_state register (moore 와 동일하다.)
    always @(posedge clk or posedge reset) begin
        if (reset) r_curr_state <= S0;
        else r_curr_state = r_next_state;
    end

    // 2. 다음상태 + 출력 (입력을 참조해서 출력을 결정한다.)
    always @(*)begin
        r_next_state = r_curr_state;
        y = 1'b0;

        case (r_curr_state)
            S0: if(x) r_next_state = S1;
            S1: if(!x) r_next_state = S2;
            S2: begin
                    if(x) begin
                        y = 1'b1;
                        r_next_state = S1;
                    end
                    else r_next_state = S0;
                end
            default: r_next_state = S0;
        endcase
    end

endmodule