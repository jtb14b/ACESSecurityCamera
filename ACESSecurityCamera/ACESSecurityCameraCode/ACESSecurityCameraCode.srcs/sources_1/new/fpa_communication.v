`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2019 03:48:54 PM
// Design Name: 
// Module Name: fpa_communication
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


module fpa_communication(
    input clk,
    input [7:0] writeData,
    output reg [7:0] readData,
    input [15:0] register,
    input dir, //0 for write, 1 for read
    input send,
    output reg done,
    
    output reg sclk,
    inout sdata
    );
    
    reg dout = 0;
    reg [7:0] din;
    reg outEn = 0;
    reg mode = 0; //0 for write, 1 for read
    
    assign sdata = outEn ? dout : 1'bz;
    
    localparam
        WRITE = 1'b0,
        READ = 1'b1;
    
    localparam [3:0]
        Idle        = 4'b0000,
        Start       = 4'b0001,
        AddDir      = 4'b0010,
        ADDR0       = 4'b0011,
        Wait        = 4'b0100,
        ADDR1       = 4'b0101,
        Message     = 4'b0110,
        Stop        = 4'b0111,
        Reading     = 4'b1000,
        NOA         = 4'b1001;
        
    reg [3:0] cstate = Idle;
    reg [3:0] afterWaitState = Idle;
    reg [3:0] nstate;
    
    reg ready = 0;
    
    reg [7:0] addressdir = 8'h00;
    
    reg [2:0] sendingIndex = 0;
    
    reg [4:0] i;
    
    always @ (posedge clk) begin
        cstate = nstate;
    end
    
    always @ (cstate) begin
        case(cstate)
            Idle : begin
                mode = WRITE;
                done = 0;
                //Regulated in always block below
                if(ready) 
                    nstate = Start;
                else
                    nstate = cstate;
            end
            
            Start : begin
                outEn = 1;
                
                dout = 1;
                dout = 1;
                dout = 1;
                
                sclk = 1;
                
                dout = 0;
                dout = 0;
                dout = 0;
                
                sclk = 0;
                
                nstate = AddDir;
            end
            
            AddDir : begin
                outEn = 1;
                sendingIndex = 0;
                
                sclk = 0;
                sclk = 0;
                
                //Send 0x20 for write and 0x21 for read
                //0b0010|0000 or 0b0010|0001
                
                addressdir = (8'h20) | mode;
                for(i=8; i>=1; i = i - 1) begin //Shifted to account for unsigned bits
                    dout = addressdir[i-1];
                    
                    sclk = 1;
                    sclk = 1;
                    sclk = 1;
                    
                    sclk = 0;
                    sclk = 0;
                    sclk = 0;
                end
                
                if(mode == WRITE) begin
                    afterWaitState = ADDR0;
                    nstate = Wait;
                end else
                    nstate = Reading;
            end
            
            Wait : begin
                outEn = 0;
                
                sclk = 0;
                
                if(sdata == 0)
                    nstate = afterWaitState;
                else
                    nstate = cstate;
            end
            
            ADDR0 : begin
                outEn = 1;
                
                sclk = 0;
                
                for(i=15; i>=8; i = i - 1) begin
                    dout = register[i];
                                
                    sclk = 1;
                    sclk = 1;
                    sclk = 1;
                                
                    sclk = 0;
                    sclk = 0;
                    sclk = 0;
                end
                
                afterWaitState = ADDR1;
                nstate = Wait;
            end
            
            ADDR1 : begin
                outEn = 1;
                
                sclk = 0;
                
                for(i=8; i>=1; i = i - 1) begin //Shifted
                    dout = register[i-1];
                                
                    sclk = 1;
                    sclk = 1;
                    sclk = 1;
                                
                    sclk = 0;
                    sclk = 0;
                    sclk = 0;
                end
                
                if(dir == WRITE) begin
                    afterWaitState = Message;
                end else begin
                    afterWaitState = Start;
                    mode = READ;
                end
                nstate = Wait;
            end
            
            Message :  begin
                outEn = 1;
                
                sclk = 0;
                
                for(i=8; i>=1; i = i - 1) begin //Shifted
                    dout = register[i-1];
                            
                    sclk = 1;
                    sclk = 1;
                    sclk = 1;
                            
                    sclk = 0;
                    sclk = 0;
                    sclk = 0;
                end
                
                afterWaitState = Stop;
                nstate = Wait;
            end
            
            Stop : begin
                outEn = 1;
            
                dout = 0;
                dout = 0;
                dout = 0;
            
                sclk = 1;
            
                dout = 1;
                dout = 1;
                dout = 1;
                
                sclk = 0;
                
                done = 1;
                
                nstate = Idle;
            end
            
            Reading : begin
                outEn = 0;
                
                sclk = 0;
                
                for(i=8; i>=1; i = i - 1) begin //Shifted
                    sclk = 1;
                    sclk = 1;
                    sclk = 1;
                    
                    din[i-1] = sdata;
                    
                    sclk = 0;
                    sclk = 0;
                    sclk = 0;
                end
                
                readData = din;
                
                nstate = NOA;
            end
            
            NOA : begin
                outEn = 0;
                
                sclk = 1;
                sclk = 1;
                sclk = 1;
                
                sclk = 0;
                sclk = 0;
                sclk = 0;
                
                nstate = Stop;
            end
            
            default : begin
                nstate = Idle;
            end
        endcase
    end
    
    always @ (posedge send) begin
        ready = 1;
        ready = 1;
        ready = 1;
        ready = 1;
        ready = 1;
        ready = 1;
        ready = 0;
        ready = 0;
        ready = 0;
        ready = 0;
        ready = 0;
        ready = 0;
    end
    
endmodule
