// --------------------------- 
//-- test clock generator (5) 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
 `include "clock.v" 

module pulse1 ( signal, clock );
   input   clock;
   output signal;
   reg    signal;
  
    always @ ( clock )  
    begin        
     
         signal = 1'b1;  
      #3 signal = 1'b0;   
      #3 signal = 1'b1;  
      #3 signal = 1'b0;   
      #3 signal = 1'b1;  
      #3 signal = 1'b0; 
      #3 signal = 1'b1;  
      #3 signal = 1'b0;        
      
    end
endmodule // pulse


module Exemplo_0905; 
 
   wire  clock;  
   clock clk ( clock ); 
 
   wire  p1; 
 
   pulse1   pls1   ( p1, clock );  

   initial 
   begin   
       $display("Exemplo0905 - Larissa Domingues Gomes - 650525");
      $dumpfile ( "Exemplo0905.vcd" );   
      $dumpvars ( 1, clock, p1 ); 
 
      #480 $finish;  
   end 
   
 endmodule // Exemplo_0905