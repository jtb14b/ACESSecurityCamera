`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 03:07:59 PM
// Design Name: 
// Module Name: motor_control
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


module motor_control(
    input MTRL,     //Flag for panning left
    input MTRR,     //Flag for panning right
    input MTRU,     //Flag for tilting up
    input MTRD,     //Flag for tilting down
    input MTRZI,    //Flag for zooming in
    input MTRZO,    //Flag for zooming out
    
    input clk,
    output reg [7:0] led,
    
    //Used to communicate with motor controller
    output sclk,
    output SS,
    output MOSI
    );
    
    always @ (MTRL or MTRR or MTRU or MTRD or MTRZI or MTRZO) begin
        led[0] <= MTRL;
        led[1] <= MTRR;
        led[2] <= MTRU;
        led[3] <= MTRD;
        led[4] <= MTRZI;
        led[5] <= MTRZO;
    end
    
endmodule
