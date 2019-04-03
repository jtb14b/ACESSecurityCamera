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
    input clk
    );
    
    
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
    
    always @ (posedge clk) begin
        cstate = nstate;
    end
    
    always @ (cstate) begin
        case(cstate)
            Idle : begin
                //
            end
            
            Start : begin
                //
            end
            
            AddDir : begin
                //
            end
            
            default : begin
                nstate = Idle;
            end
        endcase
endmodule
