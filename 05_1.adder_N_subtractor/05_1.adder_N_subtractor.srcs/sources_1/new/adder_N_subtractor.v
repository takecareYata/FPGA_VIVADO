`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 16:40:23
// Design Name: 
// Module Name: adder_N_subtractor
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


module add_sub_4bit (
    input  [3:0] a,
    input  [3:0] b,
    input        add_nsub,
    output reg [3:0] sum,
    output reg       carry_out
);

    reg [4:0] r_result;

    always @(*) begin
        if (add_nsub == 1'b1) begin
            r_result = a + b;
        end 
        else begin
            r_result = a - b;
        end
    end

    always @(*) begin
        carry_out = r_result[4]; 
        sum       = r_result[3:0];
    end

endmodule
