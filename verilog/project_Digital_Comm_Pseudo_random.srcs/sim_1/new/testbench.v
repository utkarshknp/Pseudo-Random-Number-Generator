`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2019 12:15:45 AM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk=1'b1;
    wire [7:0]datain;
    
    pseudo_random pr1(clk,datain);
    always
        begin
              
            #2 clk=~clk;       
        end    
    initial
        begin    
            $monitor($time," Current Value:  %d",datain);
        end
        
endmodule
