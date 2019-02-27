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
    

    
    
    
    localparam [1:0] Idle = 2'b00;
    localparam [1:0] Send = 2'b01;
    localparam [1:0] Cleanup = 2'b10;
        
    reg [1:0] cstate = Idle;
    reg [1:0] nstate;
    
    always @ (posedge dummy_clk3) begin
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
                    nstate = Cleanup;
                else
                    nstate = cstate;
            end
            
            Cleanup: begin
                send = 1'b0;
                
                nstate = Idle;
            end
            
            default: begin
                send = 1'b0;
                
                nstate = Idle;
            end
        endcase
    end
    
    always @ (*) begin
        DEBUG[0] <= cstate[0];
        DEBUG[1] <= cstate[1];
        DEBUG[2] <= send;
        DEBUG[3] <= done;
        DEBUG[4] <= dummy_clk3;
    end
    
endmodule
