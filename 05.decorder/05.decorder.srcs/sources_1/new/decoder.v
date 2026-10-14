`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 15:09:03
// Design Name: 
// Module Name: decoder
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

module decoder(
    input [1:0] a,
    output [3:0] led
);

    // assign led = ( a == 2'b00) ? 4'b0001 :
    // ( a == 2'b01) ? 4'b0010 :
    // ( a == 2'b10) ? 4'b0100 :
    // 4'b1000;

    reg	[3:0] r_led;

    always @(*) begin 
        case ( a )
            2'b00 : r_led = 4'b0001;
            2'b01 : r_led = 4'b0010;
            2'b10 : r_led = 4'b0100;
            2'b11 : r_led = 4'b1000;
        endcase 
    end
    assign led = r_led;

endmodule
