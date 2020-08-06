// ------------------------- 
// Exemplo_0807 -   Comparador 
// Nome: Larissa Domingues Gomes 
// Matricula: 650525 
// -------------------------

// -------------------------
//  comparador para igualdade
// ------------------------- 

module igualdade (output s, input a0, a1, a2, a3, b0, b1, b2, b3);
    
    wire s0, s1, s2, s3;
    
    xnor XNOR0(s0, a0, b0);
    xnor XNOR1(s1, a1, b1);
    xnor XNOR2(s2, a2, b2);
    xnor XNOR3(s3, a3, b3);
    
    assign s = s0 & s1 & s2 & s3;
 
endmodule

// -------------------------
//  comparador para desigualdade
// ------------------------- 
module desigualdade (output s, input a0, a1, a2, a3, b0, b1, b2, b3);
    
    wire s0, s1, s2, s3;
    
    xor XOR0(s0, a0, b0);
    xor XOR1(s1, a1, b1);
    xor XOR2(s2, a2, b2);
    xor XOR3(s3, a3, b3);
    
    assign s = s0 | s1 | s2 | s3;
 
endmodule


module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    



// -------------------------
//  comparador
// ------------------------- 
module comparador (output s, input a0, a1, a2, a3, b0, b1, b2, b3, seletor);
    
    wire d, i;
    
    desigualdade D1(d , a0, a1, a2, a3, b0, b1, b2, b3);
    igualdade I1(i , a0, a1, a2, a3, b0, b1, b2, b3);
    MUX M1(s, d,i, seletor);
    
 
endmodule

module test_igualdade; 
// ------------------------- definir dados       
    reg  [3:0] a;       
    reg  [3:0] b;              
    reg chave;
    wire resp; 
    integer i, j;
 
   comparador Comp(resp, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3], chave);
// ------------------------- parte principal  
    initial begin        
        
      
      $display("Exemplo0803 - Larissa Domingues Gomes - 650525");     
      $display("Test LU’s igualdade"); 
      
      $display("chave  a    =  b       resp");
      
      $monitor("%b      %b    %b    %b",chave, a, b, resp);
      
    

    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j; chave = 1'b0;
    end
    end
   
    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j; chave = 1'b1;
    end
    end
   
    end 
 
endmodule // test_igualdade 