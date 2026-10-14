`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 16:09:56
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder (
    input  [3:0] a,     
    output [1:0] led,   
    output       v      
);

    reg [1:0] r_led;
    reg       r_v;

    always @(*) begin
        if      (a[3] == 1'b1) begin 
            r_led = 2'b11; 
            r_v = 1'b1; 
        end // D3이 1일 때
        else if (a[2] == 1'b1) begin 
            r_led = 2'b10; 
            r_v = 1'b1; 
        end // D3이 0이고 D2가 1일 때
        else if (a[1] == 1'b1) begin 
            r_led = 2'b01; 
            r_v = 1'b1; 
        end // D3, D2가 0이고 D1이 1일 때
        else if (a[0] == 1'b1) begin 
            r_led = 2'b00; 
            r_v = 1'b1; 
        end // D3, D2, D1이 0이고 D0이 1일 때
        else begin 
            r_led = 2'b00; 
            r_v = 1'b0; 
            end // 모두 0일 때 (V = 0)
    end
    
    assign led = r_led;
    assign v   = r_v;

endmodule
