// ------------------------- 
// Exemplo_0801 - FULL ADDER 
// Nome: Larissa Domingues Gomes 
// Matricula: 650525 
// -------------------------

// ------------------------- 
//  half adder 
// ------------------------- 
module halfAdder (output s1, s0, input a, b); 
 
    // descrever por portas 
    xor  XOR1 ( s0, a, b ); 
    and AND1  ( s1, a, b ); 
 
endmodule // halfAdder

// ------------------------- 
//  full adder 
// ------------------------- 
module fullAdder ( output s1, s0, input a, b, carryIn ); 
    
    wire s, c0, c1;
    
    halfAdder HA1(c0, s, a, b);
    halfAdder HA2(c1, s0, s, carryIn);
    or OR1 (s1, c0, c1);
    //assign s0 = (c0 | c1);
 
endmodule // fullAdder 

module Adder (output s0, s1, s2, s3, s4, input a0, a1, a2, a3, b0, b1, b2, b3);
    
    wire c0, c1, c2;
    
    halfAdder HA1(c0, s0, a0, b0);
    fullAdder FA1(c1, s1, a1, b1, c0 ); 
    fullAdder FA2(c2, s2, a2, b2, c1 ); 
    fullAdder FA3(s4, s3, a3, b3, c2 ); 
 
endmodule


module test_fullAdder; 
// ------------------------- definir dados       
    reg  [3:0] a;       
    reg  [3:0] b;              
    wire [4:0] s; 
    integer i, j;
 
   Adder A1(s[0], s[1], s[2], s[3], s[4], a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]); 
 
// ------------------------- parte principal  
    initial begin        
        
      #1 a = 4'b0000; b = 10;
      
      $display("Exemplo0801 - Larissa Domingues Gomes - 650525");     
      $display("Test ALU’s full adder"); 
      
      $display("a    + b    = s5   soma");
      
      $monitor("%b + %b = %b    %b%b%b%b",a, b, s[4], s[3], s[2], s[1], s[0]);
      
    

    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j;
    end
    end
   
 // projetar testes do somador completo 
    end 
 
endmodule // test_fullAdder 
 