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
//////////////////////////////////////////////////////////////////////////////////


module SecurityCameraCode(
    input btnc,
    input btnl,
    input btnr,
    input btnu,
    input btnd,
    output [7:0] led
    );
    
    reg[7:0] led;
    
    always @ * begin
        led[7] = btnl;
        led[0] = btnr;
        led[4] = btnu;
        led[5] = btnd;
    end
    
endmodule
