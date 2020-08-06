// ------------------------- 
// Exemplo_0806 - FULL ADDER 
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
 
endmodule // fullAdder 

module Adder (output s0, s1, s2, s3, s4, input a0, a1, a2, a3, b0, b1, b2, b3, carryIn);
    
    wire c0, c1, c2, cb0, cb1, cb2, cb3;
    
    xor XOR0(cb0, carryIn, b0);
    xor XOR1(cb1, carryIn, b1);
    xor XOR2(cb2, carryIn, b2);
    xor XOR3(cb3, carryIn, b3);
    
    fullAdder FA0(c0, s0, a0, cb0, carryIn); 
    fullAdder FA1(c1, s1, a1, cb1, c0 ); 
    fullAdder FA2(c2, s2, a2, cb2, c1 ); 
    fullAdder FA3(s4, s3, a3, cb3, c2 ); 
 
endmodule


module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    


module comparador(output s0, s1, s2, s3, input a0, a1, a2, a3, b0, b1, b2, b3, seletor);
    
    wire i0, d0, i1, d1, i2, d2, i3, d3;
    
    xnor XNOR0(i0, a0, b0);
    xnor XNOR1(i1, a1, b1);
    xnor XNOR2(i2, a2, b2);
    xnor XNOR3(i3, a3, b3);
    
    xor XOR0(d0, a0, b0);
    xor XOR1(d1, a1, b1);
    xor XOR2(d2, a2, b2);
    xor XOR3(d3, a3, b3);
    
    MUX MUX0(s0, i0, d0, seletor);
    MUX MUX1(s1, i1, d1, seletor);
    MUX MUX2(s2, i2, d2, seletor);
    MUX MUX3(s3, i3, d3, seletor);
endmodule



module test_fullAdder; 
// ------------------------- definir dados   
    reg carryIn;//Carry In tambem sera o valor da chave 2
    reg  [3:0] a;       
    reg  [3:0] b;              
    wire [4:0] s; 
    wire [3:0] di; 
    integer i, j;
 
   Adder A1(s[0], s[1], s[2], s[3], s[4], a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], carryIn); 
   comparador COMP1(di[0], di[1], di[2], di[3], a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], carryIn);
// ------------------------- parte principal  
    initial begin        
        
      
      $display("Exemplo0806 - Larissa Domingues Gomes - 650525");     
      $display("Test ALU’s full adder"); 
      
      $display("CI  a    + b    = s5   soma  (Des)igualdade");
      
      $monitor("%b   %b + %b = %b    %b%b%b%b   %b",carryIn, a, b, s[4], s[3], s[2], s[1], s[0], di);
      
    
    
    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j; carryIn = 1'b0;
    end
    end
    
    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j; carryIn = 1'b1;
    end
    end
   
   
 // projetar testes do somador completo 
    end 
 
endmodule // test_fullAdder 