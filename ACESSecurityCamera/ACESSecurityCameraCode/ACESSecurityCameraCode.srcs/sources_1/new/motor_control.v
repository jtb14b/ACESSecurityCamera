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
    
 /*   reg rstb = 1;
    reg mlb = 0; //NEEDS UPDATE
    reg start; 
    reg [1:0] cdiv = 3;
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
        ); */
       
    reg rst = 0;
    reg send = 0;
    reg MISO = 0;
    wire done;
    
    reg dummy_clk = 0;
    reg dummy_clk2 = 0;
    reg dummy_clk3 = 0;
     
    spi_master SPIM(
        .clk(dummy_clk3),
        .rst(rst),
        .data_in(MESSAGE),
        .MISO(MISO),
        .send(send),
        .MOSI(MOSI),
        .SCLK(sclk),
        .SS(SS),
        .done(done)
        );
            
    always @ (posedge clk) begin
        dummy_clk = ~dummy_clk;
    end
    
    always @ (posedge dummy_clk) begin
        dummy_clk2 = ~dummy_clk2;
    end
    
    always @ (posedge dummy_clk2) begin
        dummy_clk3 = ~dummy_clk3;
    end
    
 /*   always @ (MTRL or MTRR or MTRU or MTRD or MTRZI or MTRZO) begin
        led[0] <= MTRL;
        led[1] <= MTRR;
        led[2] <= MTRU;
        led[3] <= MTRD;
        led[4] <= MTRZI;
        led[5] <= MTRZO;
    end */
    
  /*  always @ (posedge MTR or posedge done) begin
        //start <= ~done; //start <= 1;
        
        DEBUG <= MESSAGE;
        
        if (done) begin
            start <= 0;
        end else begin
            start <= 1;
        end
    end */
    
    always @ (MESSAGE or done) begin
        DEBUG = 8'h00;
        //if(MESSAGE == 8'h00 || MESSAGE == 8'h01 || MESSAGE == 8'h02 || MESSAGE == 8'h03 || MESSAGE == 8'h04 || MESSAGE == 8'h05) begin
        if(MESSAGE == 8'h41 || MESSAGE == 8'h42 || MESSAGE == 8'h43 || MESSAGE == 8'h44 || MESSAGE == 8'h45 || MESSAGE == 8'h46) begin 
           // start = 1'b0;
            DEBUG = MESSAGE;
          
            send = 0;
            send = 0;
            send = 0;
            send = 0;
            send = 0;
            send = 0;
            send = 1;
            send = 1;
            send = 1;
            send = 1;
            send = 1;
            send = 1;
            send = 1; 
        
            
        end
    end
    
    
    
    
endmodule
