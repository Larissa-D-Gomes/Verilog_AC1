// ------------------------- 
// Exemplo_0805 - COMPLEMENTO DE 2
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
//  complemento de 2
// ------------------------- 
module complemento2(output s0, s1, s2, s3, s4, input a0, a1, a2, a3);
    
    wire n0, n1, n2, n3, c0, c1, c2;
    
    not NOT0(n0, a0);
    not NOT1(n1, a1);
    not NOT2(n2, a2);
    not NOT3(n3, a3);
    halfAdder HA1(c0, s0, n0, 1'b1);
    halfAdder HA2(c1, s1, n1, c0);
    halfAdder HA3(c2, s2, n2, c1);
    halfAdder HA4(s4, s3, n3, c2);
    
endmodule


module test_complemento2; 
// ------------------------- definir dados       
    reg  [3:0] a;       
                  
    wire [4:0] resp; 
    integer i;
 
    complemento2 C2(resp[0], resp[1], resp[2], resp[3], resp[4], a[0], a[1], a[2], a[3]); 
 
// ------------------------- parte principal  
    initial begin        
        
      
      $display("Exemplo0805 - Larissa Domingues Gomes - 650525");     
      $display("Test ALU�s complemento de 2"); 
      
      $display("c2(a) =  s4  resp");
      
      $monitor("%b  =  %b   %b%b%b%b", a, resp[4], resp[3], resp[2], resp[1], resp[0]);
      
    

    for ( i = 0; i < 16; i = i + 1) begin
        #1 a=i; 
    end
   
    end 
 
endmodule // test_complemento2
 