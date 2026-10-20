`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/10/16 13:00:00
// Design Name: 
// Module Name: tb_top_btn_debounce
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

module tb_btn_debounce();

    parameter CLK_FREQ = 100000000; // 100MHz
    parameter CLK_PERIOD = 10;      // 10ns (100MHz 1주기)

    // 시뮬레이션 시간 단축을 위한 분주비 오버라이드 값
    // 실제 tick_generator 분주비 : 100,000
    // 시뮬레이션용 분주비 : 100 (100배 단축)
    parameter SIMULATION_DIV = 100;

    localparam SAMPLE_PERIOD = SIMULATION_DIV * CLK_PERIOD; // 1000ns = 1us

    // 디바운스 완료(10틱)를 확실히 넘기 위해 충분히 유지 (15us)
    parameter BTN_PRESS_LIMIT = SAMPLE_PERIOD * 15; 

    // tick_generator의 카운터 한계값을 시뮬레이션용 값으로 덮어 씀
    defparam u_top_btn_debounce.u_tick_generator.DIV = SIMULATION_DIV;

    // 테스트벤치용 신호 선언
    reg clk;
    reg reset;
    reg btnU;
    reg btnD;
    reg sel;
    
    wire clean_btn;
    wire [2:0] led;

    top_btn_debounce u_top_btn_debounce (
        .clk(clk),
        .reset(reset),
        .btnU(btnU),
        .btnD(btnD),
        .sel(sel),
        .clean_btn(clean_btn),
        .led(led)
    );

    // 100MHz 클럭 생성
    initial begin
        clk = 0;
        forever begin
            #(CLK_PERIOD / 2);
            clk = ~clk;
        end
    end

    initial begin

        reset = 1;
        btnU  = 0;
        btnD  = 0;
        sel   = 0;
        #200;
        reset = 0;
        #500;

        $display("[%0t] === START sel=0, btnU Test ===", $time);
        
        btnU = 1; #200;
        btnU = 0; #300;
        btnU = 1; #120;
        btnU = 0; #500;
        btnU = 1;
        #(BTN_PRESS_LIMIT); 
        #1000;
        btnU = 0;
        
        #(SAMPLE_PERIOD * 15); 
        #2000;

        $display("[%0t] ---- ALL SIM TESTS FINISHED ----", $time);
        $finish;
    end

endmodule