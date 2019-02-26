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
    input NEWMESS,
    
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
    
 /*   always @ (MESSAGE, posedge done) begin
        DEBUG = 8'h00;
        //if(MESSAGE == 8'h00 || MESSAGE == 8'h01 || MESSAGE == 8'h02 || MESSAGE == 8'h03 || MESSAGE == 8'h04 || MESSAGE == 8'h05) begin
        if(MESSAGE == 8'h41 || MESSAGE == 8'h42 || MESSAGE == 8'h43 || MESSAGE == 8'h44 || MESSAGE == 8'h45 || MESSAGE == 8'h46) begin 
           // start = 1'b0;
            DEBUG = MESSAGE;
            
        end
        
        if(done)
            send=0;
        else if
            
        
    end
    
    always @ (posedge done) begin
        send = 0;
    end */
    
    
    
    localparam Idle = 1'b0;
    localparam Send = 1'b1;
        
    reg cstate = Idle;
    reg nstate;
    
    always @ (posedge clk) begin
        cstate = nstate;
    end
    
    always @ (NEWMESS or done) begin
        //DEBUG <= MESSAGE;
        case(cstate)
        
            Idle: begin
                send = 1'b0;
                
                if(NEWMESS) 
                    nstate = Send;
                else
                    nstate = cstate;
            end
            
            Send: begin
                send = 1'b1;
                
                if(done)
                    nstate = Idle;
                else
                    nstate = cstate;
            end
            
            default: begin
                send = 1'b0;
                
                nstate = Idle;
            end
        endcase
    end
    
    always @ (*) begin
        DEBUG[0] <= cstate;
        DEBUG[1] <= send;
        DEBUG[2] <= done;
    end
    
endmodule
