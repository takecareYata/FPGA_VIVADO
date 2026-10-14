`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 11:36:42
// Design Name: 
// Module Name: tb_mux2_1
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


module tb_mux2_1();
    // 입력신호 reg 선언 , 출력신호 wire로 선언
    reg a, b, sel;
    wire out;

    // 검증모듈 DUT 설정
    mux2_1 u_mux2_1(
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    // 테스트 시나리오
    initial begin
        //초기값 설정
        a = 0; b = 0; sel = 0;

        $monitor("TIME = %0t | sel = %b | a = %b | b = %b | out = %b", $time,sel,a,b,out );

        //sel = 0 일때 b 가 출력이 되어야한다.
        #10; sel= 0; a = 1 ; b = 0; 
        #10; sel= 0; a = 0 ; b = 1; 
        //sel = 1 일때 a 가 출력이 되어야한다. 
        #10; sel= 1; a = 1 ; b = 0;
        #10; sel= 1; a = 0 ; b = 1;  

        // 추가적인 모든 조합을 입력
        #10; sel= 0; a = 1 ; b = 1;
        #10; sel= 1; a = 1 ; b = 1;
        #10; $finish;
    end

endmodule
