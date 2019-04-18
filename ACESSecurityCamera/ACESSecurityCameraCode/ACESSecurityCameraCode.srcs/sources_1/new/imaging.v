`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2019 01:43:57 PM
// Design Name: 
// Module Name: imaging
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


module imaging(
    input clk,
    input [7:0] IMMD,
    input PIXCLK,
    input FV,
    input LV,
    input [11:0] data,
    output reg trigger,
    output reg [7:0] DEBUG,
    output wire [11:0] dout,
    output wire DVo,
    output wire LVo,
    output wire FVo,
    
    input debugLeft,
    input debugRight,
    input debugUp,
    input debugDown
    );
    
    reg [7:0] toFPA = 8'h00;
    wire [7:0] fromFPA;
    reg [15:0] register = 16'h0000;
    reg dir = 0;
    reg send = 0;
    wire done;
    
    reg cl_send = 0;
    
   //  reg trigger = 0;
   
    reg [11:0] rawData [0:9][0:10];
    reg [11:0] demoData [0:9][0:10];
    reg [9:0] rowIndex = 0;
    reg [10:0] colIndex = 0;
    reg [9:0] rowIndexRead = 0;
    reg [10:0] colIndexRead = 0;
    
    reg [9:0] debugRow = 0;
    reg [10:0] debugCol = 0;
    
    localparam
        RED = 12'h00f,
        GREEN = 12'h0f0,
        BLUE = 12'hf00;
    
    localparam
        WRITE = 1'b0,
        READ = 1'b1;
    
    fpa_communication FPACOMM(
        .clk(clk),
        .writeData(toFPA),
        .readData(fromFPA),
        .register(register),
        .dir(dir),
        .send(send),
        .done(done)
        );
        
    camera_link CL(
        .clk(clk),
   //     .din(demoData),
        .DV(DVo),
        .LV(LVo),
        .FV(FVo),
        .dout(dout),
        .send(cl_send)
        );
    
    localparam [3:0]
        Init            = 4'b0000,
        Trigger         = 4'b0001,
        Read            = 4'b0010,
        PixelCorrect    = 4'b0011,
        Gain            = 4'b0100,
        Exposure        = 4'b0101,
        Demosaicing     = 4'b0110,
        WhiteBalance    = 4'b0111,
        Filtering       = 4'b1000,
        ToYCbCr         = 4'b1001,
        Sharpening      = 4'b1010,
        ToRGB           = 4'b1011,
        GammaCorrection = 4'b1100,
        Output          = 4'b1101;
    
    reg [3:0] cstate = Init;
    reg [3:0] nstate;
    
    //reg rawData0[0:719][0:1279];
   // reg rawData1[0:719][0:1279];
   // reg rawData2[0:719][0:1279];
  //  reg rawData3[0:719][0:1279];
  //  reg rawData4[0:719][0:1279];
  //  reg rawData5[0:719][0:1279];
  //  reg rawData6[0:719][0:1279];
  //  reg rawData7[0:719][0:1279];
    
    
    
    reg frameDone = 0;
    
    
  /*  localparameter
        RGB = 1'b0,
        YCbCr = 1'b1;
    
    reg data = 0;
    reg RGBData = 0; //Not sure what format to be using
    reg YCbCrData = 0;
    reg cspace;
    
    always @ (cspace or tempdata) begin
        if(cspace == RGB)
            */
    
    
    
    always @(posedge clk) begin
        cstate = nstate;
    end
    
    always @ (cstate) begin
        case(cstate)
            Init : begin
                //Set FPA Settings
                dir = WRITE;
                register = 16'h3070;
                toFPA = 8'h03;
                
                send = 1;
                send = 1;
                send = 1;
                
                send = 0;
                send = 0;
                send = 0;
                
                nstate = Trigger;
            end
            
            Trigger : begin
                //Pulse handled in always block below
                
                nstate = Read;
            end
            
            Read : begin
                //Read from the FPA
                if(FV) begin
                    nstate = PixelCorrect;
                end else begin
                    nstate = cstate;
                end
                
            end
            
            PixelCorrect : begin
                //Look for dead pixels
                //Fill them in with nearby pixels
                
                nstate = Gain;
            end
            
            Gain : begin
                //Take Gain value from Register set by the UI module
                //Output value to FPA
                
                nstate = Exposure;
            end
            
            Exposure : begin
                //Sum up total pixel brightness
                //Output total for SA ratio requirement testing?
                //Normalize brightness
                
                nstate = Demosaicing;
            end
            
            Demosaicing : begin
                //For loop through each superpixel
                    //Group them
                //Output new array
                
                for(rowIndex = 1; rowIndex < 720; rowIndex = rowIndex + 1) begin
                    for(colIndex = 1; colIndex < 1280; colIndex = colIndex +1) begin
                        if(rowIndex % 2 == colIndex % 2) begin //GREEN
                            demoData[rowIndex][colIndex] =  (rawData[rowIndex][colIndex] & GREEN) | 
                                                            (rawData[rowIndex-1][colIndex] & RED) |
                                                            (rawData[rowIndex][colIndex-1] & BLUE);
                        end else if((rowIndex % 2 == 1) && (colIndex % 2 == 0)) begin //BLUE
                            demoData[rowIndex][colIndex] =  (rawData[rowIndex-1][colIndex] & GREEN) | 
                                                            (rawData[rowIndex-1][colIndex-1] & RED) |
                                                            (rawData[rowIndex][colIndex] & BLUE);
                        end else if((rowIndex % 2 == 0) && (colIndex % 2 == 1)) begin //RED
                            demoData[rowIndex][colIndex] =  (rawData[rowIndex-1][colIndex] & GREEN) | 
                                                            (rawData[rowIndex][colIndex] & RED) |
                                                            (rawData[rowIndex-1][colIndex-1] & BLUE);
                        end
                    end
                end
                            
                
                nstate = WhiteBalance;
            end
            
            WhiteBalance : begin
                //Take White Balane value from Register set by the UI module
                //Implement White Balance?
                
                nstate = Filtering;
            end
            
            Filtering : begin
                //Some IP module?
                
                //OR
                
                //FFT
                //Low Pass Filter
                //IFFT
                //Ouput
                
                //OR
                
                //Iterate through
                    //Median filtering
                //Output
                
                nstate = ToYCbCr;
            end
            
            ToYCbCr : begin
                //IP module
                
                nstate = Sharpening;
            end
            
            Sharpening : begin
                //IP module?
                
                //OR
                
                //FFT
                //High Pass filter
                //Add to other values
                //Output
                
                nstate = ToRGB;
            end
            
            ToRGB : begin
                //IP module
                nstate = GammaCorrection;
            end
            
            GammaCorrection : begin
                //IP module
                
                nstate = Output;
            end
            
            Output : begin
                //Output through FMC
                
                cl_send = 0;
                cl_send = 1;
                cl_send = 0;
                
                nstate = Trigger;
            end
            
            default : begin
                nstate = Init;
            end
        endcase
    end
    
    always @ (cstate) begin
        if(cstate == Trigger)
            trigger = 1;
        else
            trigger = 0;
    end
    
    always @ (posedge PIXCLK) begin
        if (cstate == Read) begin
            rawData[rowIndexRead][colIndexRead] = data;
            if(colIndexRead == 1280) begin
                colIndexRead = 0;
            end else begin
                colIndexRead = colIndexRead + 1;
            end
        end
    end
    
    always @ (posedge LV) begin
        if (cstate == Read) begin
            if(rowIndexRead == 720) begin
                rowIndexRead = 0;
            end else begin
                rowIndexRead = rowIndexRead + 1;
            end
        end
    end
    
    always @ (FV) begin
        if (cstate == Read) begin
            frameDone = ~FV;
        end
    end
    
    //always @ (IMMD) begin
   //     DEBUG <= IMMD;
 //   end
    
    always @ (debugLeft) begin
        debugCol = debugCol + 1;
        if(debugCol < 0) begin
            debugCol = 0;
        end
        if(debugCol >= 1280) begin
            debugCol = 1279;
        end
    end
    
    always @ (debugRight) begin
        debugCol = debugCol - 1;
        if(debugCol < 0) begin
            debugCol = 0;
        end
        if(debugCol >= 1280) begin
            debugCol = 1279;
        end
    end
    
    always @ (debugUp) begin
        debugRow = debugRow - 1;
        if(debugRow < 0) begin
            debugRow = 0;
        end
        if(debugRow >= 720) begin
            debugRow = 719;
        end
    end
    
    always @ (debugDown) begin
        debugRow <= debugRow + 1;
        if(debugRow < 0) begin
            debugRow = 0;
        end
        if(debugRow >= 720) begin
            debugRow = 719;
        end
    end
    
    always @ (debugRow or debugCol) begin
        DEBUG <= rawData[debugRow][debugCol];
    end
    
endmodule
