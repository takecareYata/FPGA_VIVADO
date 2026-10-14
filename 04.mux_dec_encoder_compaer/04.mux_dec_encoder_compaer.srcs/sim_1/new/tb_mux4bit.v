`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/14 13:29:11
// Design Name: 
// Module Name: tb_mux4bit
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
module tb_mux4bit();

    reg [3:0] a;
    reg [3:0] b;
    reg       sel;

    wire [3:0] out;

    // DUT 인스턴스 생성
    mux4bit u_mux4bit (
        .a(a),
        .b(b),
        .sel(sel),
        .out(out)
    );

    // 테스트 시나리오
    initial begin
        // 초기값 설정
        a   = 4'b0000;
        b   = 4'b0000;
        sel = 1'b0;

        $monitor("TIME = %0t | sel = %b | a = 4'b%b | b = 4'b%b | out = 4'b%b",$time, sel, a, b, out);

        // 테스트 케이스 1: sel = 0 일 때 b가 출력되는지 확인 (b 선택)
        #10; sel = 1'b0; a = 4'b1010; b = 4'b0101; 
        // 테스트 케이스 2: sel = 1 일 때 a가 출력되는지 확인 (a 선택)
        #10; sel = 1'b1; a = 4'b1100; b = 4'b0011;
        // 테스트 케이스 3: 다양한 4비트 데이터 값으로 추가 검증
        #10; sel = 1'b0; a = 4'b1111; b = 4'b1001; 
        #10; sel = 1'b1; a = 4'b0110; b = 4'b1110; 
        // 테스트 케이스 4: 모든 비트가 1일 때 테스트
        #10; sel = 1'b0; a = 4'b1111; b = 4'b1111; 
        #10; sel = 1'b1; a = 4'b1111; b = 4'b1111; 

        #10; 
        $finish;
    end

endmodule
