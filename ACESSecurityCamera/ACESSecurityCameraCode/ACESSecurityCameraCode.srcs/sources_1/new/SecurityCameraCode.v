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
 /*     output wire fmc_la_p02,//M18, //H7,
      input       L18, //  H8,
      input       fmc_la17_cc_n,//B18,//  D21,
      input       M15,//  G12,
      input K21,//C14,
      input N22,//C10,
      input K18,//G6,
      input M22,//C11,
      input K22,//C15,
      input G17,//G18,
      input K19,//G7,
      input M13,//H13,
      input L14,//H16,
      input G18,//G19,
      input J20,//D8,
      input L13//H14 */
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
      
  //    reg [11:0] FPAData = 12'h000;
      
      user_input UI(
        .clk(dummy_clk5), //!!!!!!!!!!!!
        .uart_tx_in(uart_tx_in),
        .MTR(MTR),
        .MESSAGE(MESSAGE),
        .r_Rx_DV(NEWMESS),
        .IMMD(IMMD),
        .DEBUG(led)
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
        
 /*     imaging IMG(
        .clk(CLK),
        .IMMD(IMMD),
        .PIXCLK(L18),
        .FV(fmc_la17_cc_n),
        .LV(M15),
        .data(FPAData),
        .trigger(M18),
        .DEBUG(led)
        );*/
        
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
        
 /*       always @(K21) begin
            FPAData[0] <= K21;
        end
            
        always @(N22) begin
            FPAData[1] <= N22;
        end
                        
        always @(K18) begin
            FPAData[2] <= K18;
        end
        
        always @(M22) begin
            FPAData[3] <= M22;
        end
        
        always @(K22) begin
            FPAData[4] <= K22;
        end
        
        always @(G17) begin
            FPAData[5] <= G17;
        end
        
        always @(K19) begin
            FPAData[6] <= K19;
        end
        
        always @(M13) begin
            FPAData[7] <= M13;
        end
        
        always @(L14) begin
            FPAData[8] <= L14;
        end
        
        always @(G18) begin
            FPAData[9] <= G18;
        end
        
        always @(J20) begin
            FPAData[10] <= J20;
        end
        
        always @(L13) begin
            FPAData[11] <= L13;
        end
        
        */
       
        
endmodule

