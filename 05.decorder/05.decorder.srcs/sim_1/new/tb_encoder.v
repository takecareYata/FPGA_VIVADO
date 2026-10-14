`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 15:46:43
// Design Name: 
// Module Name: tb_encoder
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


module tb_encoder();
    reg [3:0] r_a;
    wire [1:0] w_led;

    encoder u_encoder(
        .a(r_a),
        .led(w_led)
    );

    initial begin
        r_a = 4'b0000;
        #10;
        r_a = 4'b1000;
        #10;
        r_a = 4'b0010;
        #10;
        r_a = 4'b0001;
        #10;
        $finish;
    end

endmodule
