`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/24/2019 02:15:25 PM
// Design Name: 
// Module Name: SecurityCameraCode
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

//////////////////////////////////////////////////////////////////////
// File Downloaded from http://www.nandland.com
//////////////////////////////////////////////////////////////////////
// This file contains the UART Receiver.  This receiver is able to
// receive 8 bits of serial data, one start bit, one stop bit,
// and no parity bit.  When receive is complete o_rx_dv will be
// driven high for one clock cycle.
// 
// Set Parameter CLKS_PER_BIT as follows:
// CLKS_PER_BIT = (Frequency of i_Clock)/(Frequency of UART)
// Example: 10 MHz Clock, 115200 baud UART <We have a 100 MHz clock --Jared>
// (10000000)/(115200) = 87
  
module SecurityCameraCode
     (
      input        clk,
      input        uart_tx_in,
      output wire [7:0] led,
      output wire [7:0] ja,
      output wire H7,
      input         H8,
      input         D21,
      input         G12,
      input C14,
      input C10,
      input G6,
      input C11,
      input C15,
      input G18,
      input G7,
      input H13,
      input H16,
      input G19,
      input D8,
      input H14
      );
      
      wire MTR;
      wire [7:0] MESSAGE;
      wire NEWMESS;
      
      wire sclk;
      wire SS;
      wire MOSI;
      
      wire [7:0] IMMD;
      
      wire [7:0] dummy;
      wire [7:0] dummy2;
      
      wire temp_alarm;
      
      reg dummy_clk = 0;
      reg dummy_clk2 = 0;
      reg dummy_clk3 = 0;
      reg dummy_clk4 = 0;
      reg dummy_clk5 = 0;
      
      wire CLK;
      
      reg [11:0] FPAData = 12'h000;
      
      user_input UI(
        .clk(dummy_clk5), //!!!!!!!!!!!!
        .uart_tx_in(uart_tx_in),
        .MTR(MTR),
        .MESSAGE(MESSAGE),
        .r_Rx_DV(NEWMESS),
        .IMMD(IMMD),
        .DEBUG(dummy)
        );
        
      motor_control MC(
        .MTR(MTR),
        .MESSAGE(MESSAGE),
        .NEWMESS(NEWMESS),
        
        .clk(dummy_clk5), //!!!!!!!!!!!!!!!!
        .DEBUG(dummy2),
        
        .sclk(ja[0]),
        .SS(ja[1]),
        .MOSI(ja[2])
        );
        
      imaging IMG(
        .clk(CLK),
        .IMMD(IMMD),
        .PIXCLK(H8),
        .FV(D21),
        .LV(G12),
        .data(FPAData),
        .trigger(H7),
        .DEBUG(led)
        );
        
      xadc_wiz_0 TEMPMON(
        .dclk_in(clk),
        .user_temp_alarm_out(temp_alarm)
        );
        
        assign ja[3] = led[0];
        assign ja[4] = led[1];
        assign ja[5] = led[2];
        assign ja[6] = led[3];
      //  assign ja[7] = NEWMESS;
        
        assign CLK = clk & ~temp_alarm;
        
        
        
        
        always @ (posedge CLK) begin
            dummy_clk = ~dummy_clk;
        end
            
        always @ (posedge dummy_clk) begin
            dummy_clk2 = ~dummy_clk2;
        end
            
        always @ (posedge dummy_clk2) begin
            dummy_clk3 = ~dummy_clk3;
        end
        
        always @ (posedge dummy_clk3) begin
            dummy_clk4 = ~dummy_clk4;
        end
        
        always @ (posedge dummy_clk4) begin
            dummy_clk5 = ~dummy_clk5;
        end
        
        always @(C14) begin
            FPAData[0] <= C14;
        end
            
        always @(C10) begin
            FPAData[1] <= C10;
        end
                        
        always @(G6) begin
            FPAData[2] <= G6;
        end
        
        always @(C11) begin
            FPAData[3] <= C11;
        end
        
        always @(C15) begin
            FPAData[4] <= C15;
        end
        
        always @(G18) begin
            FPAData[5] <= G18;
        end
        
        always @(G7) begin
            FPAData[6] <= G7;
        end
        
        always @(H13) begin
            FPAData[7] <= H13;
        end
        
        always @(H16) begin
            FPAData[8] <= H16;
        end
        
        always @(G19) begin
            FPAData[9] <= G19;
        end
        
        always @(D8) begin
            FPAData[10] <= D8;
        end
        
        always @(H14) begin
            FPAData[11] <= H14;
        end
        
        
       
        
endmodule

