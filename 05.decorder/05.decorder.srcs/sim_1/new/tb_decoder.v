`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 15:15:18
// Design Name: 
// Module Name: tb_decoder
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


module tb_decoder();
    // 입력 : reg 출력 : wire
    reg [1:0] r_a;
    wire [3:0] w_led;

    //검증모듈 인스턴스
    decoder u_decoder(
        .a(r_a),
        .led(w_led)
    );

    // tb 시나리오
    initial begin
         r_a = 2'b00;
        #10;
        r_a = 2'b01;
        #10;
        r_a = 2'b10;
        #10;
        r_a = 2'b11;
        #10;
        $finish;
    end
   

endmodule
