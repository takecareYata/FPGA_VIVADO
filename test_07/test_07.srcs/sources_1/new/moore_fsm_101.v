`timescale 1ns / 1ps

// Moore FSM: 입력 x에서 "101" 시퀀스 검출 (중첩 허용)
// 출력 y는 S3 상태에서만 HIGH
module moore_fsm_101 (
    input  wire clk,
    input  wire reset,
    input  wire x,
    output wire y
);

  // 상태 인코딩
  localparam integer S0 = 2'b00;  // IDLE
  localparam integer S1 = 2'b01;  // "1" 검출
  localparam integer S2 = 2'b10;  // "10" 검출
  localparam integer S3 = 2'b11;  // "101" 검출

  reg [1:0] curr_state;
  reg [1:0] next_state;

  // State Register: Clock Edge에서 현재 상태 갱신
  always @(posedge clk or posedge reset) begin
    if (reset) begin
      curr_state <= S0;
    end else begin
      curr_state <= next_state;
    end
  end

  // Next State Logic
  always @(*) begin
    case (curr_state)
      S0: next_state = x ? S1 : S0;
      S1: next_state = x ? S1 : S2;
      S2: next_state = x ? S3 : S0;
      S3: next_state = x ? S1 : S2;  // 중첩 허용

      default: next_state = S0;
    endcase
  end

  // Output Logic: Moore FSM은 현재 상태만으로 출력 결정
  assign y = (curr_state == S3);

endmodule
