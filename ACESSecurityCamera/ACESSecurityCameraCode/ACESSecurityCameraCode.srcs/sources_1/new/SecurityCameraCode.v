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
      
      wire sclk;
      wire SS;
      wire MOSI;
      
      wire [7:0] dummy;
      
      user_input UI(
        .clk(clk),
        .uart_tx_in(uart_tx_in),
        .MTR(MTR),
        .MESSAGE(MESSAGE),
        .DEBUG(dummy)
        );
        
      motor_control MC(
        .MTR(MTR),
        .MESSAGE(MESSAGE),
        
        .clk(clk),
        .DEBUG(led),
        
        .sclk(ja[0]),
        .SS(ja[1]),
        .MOSI(ja[2])
        );
        
        
        
        
        
endmodule

