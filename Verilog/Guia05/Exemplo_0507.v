// ------------------------- 
// Exemplo_0507 - GATES 
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module f5a(output s, input  a, input  b); // definir dado Local
    wire x,y,z,w;

    nor(x,a,a);
    nor(y,x,b);
    nor(z,b,b);
    nor(w,z,a);
    nor(s,y,w);
endmodule // f5 

module f5b(output s, input  a, input  b ); // descrever por expressao
   assign s = ~(a^b);
endmodule // f5b

module test_f5; 

// ------------------------- definir dados  
   reg  x; 
   reg  y;  
   wire a, b; 
   
   f5a moduloA ( a, x, y );
   f5b moduloB ( b, x, y ); 
 
// ------------------------- parte principal 
 
initial    begin : main  
   $display("Exemplo_0507 - Larissa Domingues Gomes - 650525");
   $display("Test module");
   $display("   x    y    a    b"); 
 
    // projetar testes do modulo
   $monitor("%4b %4b %4b %4b", x, y, a, b);    
   x = 1'b0;  y = 1'b0;
   #1  x = 1'b0;  y = 1'b1;    
   #1  x = 1'b1;  y = 1'b0;    
   #1  x = 1'b1;  y = 1'b1; 
 
   end 
 
endmodule // test_f5 