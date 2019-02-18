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
/*    input MTRL,     //Flag for panning left
    input MTRR,     //Flag for panning right
    input MTRU,     //Flag for tilting up
    input MTRD,     //Flag for tilting down
    input MTRZI,    //Flag for zooming in
    input MTRZO,    //Flag for zooming out */
    
    input MTR,
    input [7:0] MESSAGE,
    
    input clk,
    output reg [7:0] DEBUG,
    
    //Used to communicate with motor controller
    output sclk,
    output SS,
    output MOSI
    );
    
    reg rstb = 1;
    reg mlb = 0; //NEEDS UPDATE
    reg start; 
    reg [1:0] cdiv = 0;
    reg MISO = 0; //Probably
    
    wire done;
    wire [7:0] rdata;
    
    spi_master SPIM(
        .rstb(rstb),
        .clk(clk),
        .mlb(mlb),
        .start(start),
        .tdat(MESSAGE),
        .cdiv(cdiv),
        .din(MISO),
        .ss(SS),
        .sck(sclk),
        .dout(MOSI),
        .done(done),
        .rdata(rdata)
        );
        
        
    
 /*   always @ (MTRL or MTRR or MTRU or MTRD or MTRZI or MTRZO) begin
        led[0] <= MTRL;
        led[1] <= MTRR;
        led[2] <= MTRU;
        led[3] <= MTRD;
        led[4] <= MTRZI;
        led[5] <= MTRZO;
    end */
    
    always @ (posedge MTR or posedge done) begin
        //start <= ~done; //start <= 1;
        
        DEBUG <= MESSAGE;
        
        if (done) begin
            start <= 0;
        end else begin
            start <= 1;
        end
    end
    
    
    
endmodule
