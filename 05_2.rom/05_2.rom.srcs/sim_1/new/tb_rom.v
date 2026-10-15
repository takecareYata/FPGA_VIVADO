`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/15 10:28:57
// Design Name: 
// Module Name: tb_rom
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
module tb_rom;

    reg [3:0] addr;
    reg       oe;

    wire [7:0] data_out;

    rom u_rom (
        .addr(addr), 
        .oe(oe), 
        .data_out(data_out)
    );

    initial begin
        addr = 4'h0;
        oe   = 1'b0;
        #20;

        oe = 1'b1;
        #20;
        addr = 4'h0; 
        #20;
        addr = 4'h1; 
        #20;
        addr = 4'h2; 
        #20;
        addr = 4'h3; 
        #20;
        addr = 4'h4; 
        #20;
        addr = 4'h5; 
        #20;
        addr = 4'h6; 
        #20;
        addr = 4'h7; 
        #20;
        addr = 4'h8; 
        #20;
        addr = 4'h9; 
        #20;
        addr = 4'hA; 
        #20;
        addr = 4'hB; 
        #20;
        addr = 4'hC; 
        #20;
        addr = 4'hD; 
        #20;
        addr = 4'hE; 
        #20;
        addr = 4'hF; 
        #20;

        oe   = 1'b0;
        #20;
        addr = 4'h5;
        #20;
        $finish;
    end

endmodule
