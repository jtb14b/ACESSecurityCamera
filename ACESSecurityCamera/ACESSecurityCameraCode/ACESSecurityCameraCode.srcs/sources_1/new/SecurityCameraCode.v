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
      output wire [7:0] ja
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
        .trigger(ja[7]), //Should be rerouted
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
        
        
endmodule

