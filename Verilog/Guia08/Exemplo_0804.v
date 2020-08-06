// ------------------------- 
// Exemplo_0804 - DESIGUALDADE 
// Nome: Larissa Domingues Gomes 
// Matricula: 650525 
// -------------------------

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


module test_desigualdade; 
// ------------------------- definir dados       
    reg  [3:0] a;       
    reg  [3:0] b;              
    wire resp; 
    integer i, j;
 
   desigualdade D1(resp, a[0], a[1], a[2], a[3], b[0], b[1], b[2], b[3]); 
 
// ------------------------- parte principal  
    initial begin        
        
      
      $display("Exemplo0804 - Larissa Domingues Gomes - 650525");     
      $display("Test LU’s desigualdade"); 
      
      $display("a    = b    resp");
      
      $monitor("%b  %b  %b",a, b, resp);
      
    

    for ( i = 0; i < 16; i = i + 1) begin
    for ( j = 0; j < 16; j = j + 1) begin
        #1 a=i; b=j;
    end
    end
   
    end 
 
endmodule // test_desigualdade 
 