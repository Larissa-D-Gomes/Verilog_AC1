// --------------------------- 
//-- test clock generator (3) 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
 `include "clock.v" 
module pulse1 ( signal, clock );  
   input   clock;  
   output signal;  
   reg    signal; 
   
    always @ ( posedge clock )   
    begin         
          signal = 1'b1;   
      #4  signal = 1'b0;   
      #4  signal = 1'b1;   
      #4  signal = 1'b0;   
      #4  signal = 1'b1;   
      #4  signal = 1'b0;   
      
      end 
endmodule // pulse 

module pulse2 ( signal, clock );  
   input  clock;  
   output signal;  
   reg    signal; 
 
    always @ ( posedge clock )   
    begin         
    
          signal = 1'b1;   
      #5  signal = 1'b0;   
    
    end 
endmodule // pulse

module pulse3 ( signal, clock );  
   
   input  clock;  
   output signal;  
   reg    signal; 
 
   always @ ( negedge clock )   
   begin          
          signal = 1'b1;   
      #15 signal = 1'b0;   
      #15 signal = 1'b1;   
   end 
endmodule // pulse 

module pulse4 ( signal, clock );  
   input  clock;  
   output signal;  
   reg    signal; 
 
   always @ ( negedge clock )   
   begin          
          signal = 1'b1;   
      #20 signal = 1'b0;   
      #20 signal = 1'b1;   
      #20 signal = 1'b0;   
   end 
   
endmodule // pulse   


module Exemplo_0903; 
 
   wire  clock;  
   clock clk ( clock ); 
 
   wire  p1,p2,p3,p4; 
 
   pulse1   pls1   ( p1, clock );  
   pulse2   pls2   ( p2, clock );  
   pulse3   pls3   ( p3, clock );  
   pulse4   pls4   ( p4, clock ); 
 
   initial 
   begin   
       $display("Exemplo0903 - Larissa Domingues Gomes - 650525");
      $dumpfile ( "Exemplo0903.vcd" );   
      $dumpvars ( 1, clock, p1, p2, p3, p4 ); 
 
      #480 $finish;  
   end 
   
 endmodule // Exemplo_0903 
 
 //p1 e p2 comecam a ser ativados asim que clock recebe valor 1,
 //o ciclo de p1 dura mais que o tempo do clock e p2 termina antes
 //p3 e p4 so sao ativados durante o posedge do clock e ambos duram 
 //mais que o tempo do clock incluindo estados 0 e 1.