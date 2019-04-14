`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2019 05:34:27 PM
// Design Name: 
// Module Name: camera_link
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


module camera_link(
    input clk,
    input [11:0] din [0:9][0:10],
    output reg DV,
    output reg LV,
    output reg FV,
    output reg [11:0] dout,
    input send
    );
    
    reg [0:9] row = 0;
    reg [0:10] col = 0;
    
    always @(posedge send) begin
        FV = 0;
        for(row = 0; row < 720; row = row +1) begin
            LV = 0;
            for(col = 0; col < 1280; col = col + 1) begin
                dout = din[row][col];
            end
            LV = 1;
        end
        FV = 1;
    end
    
endmodule
