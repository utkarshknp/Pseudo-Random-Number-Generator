`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2019 11:49:47 PM
// Design Name: 
// Module Name: pseudo_random
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


module pseudo_random( input clk,output mem);
    reg [7:0]mem;
    initial
        begin
            mem[7]=1'b1;
            mem[6]=1'b0;
            mem[5]=1'b0;
            mem[4]=1'b1;
            mem[3]=1'b1;
            mem[2]=1'b0;
            mem[1]=1'b0;
            mem[0]=1'b1;
        end
     
    always @(posedge clk)
        begin
            mem[7]<=mem[7]^mem[5]^mem[4]^mem[0];
            mem[6]<=mem[7];
            mem[5]<=mem[6];
            mem[4]<=mem[5];
            mem[3]<=mem[4];
            mem[2]<=mem[3];
            mem[1]<=mem[2];
            mem[0]<=mem[1];
        end    
            
endmodule
