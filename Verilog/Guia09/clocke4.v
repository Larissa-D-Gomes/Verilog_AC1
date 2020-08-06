// --------------------------- 
//-- test clock generator (2) 
// Matricula: 650525 
// Nome: Larissa Domingues Gomes
// -------------------------
 
module clock ( output clk ); 
    reg clk; 
 
 initial   
    begin    
        clk = 1'b0;   
    end 
 
 always   
    begin    
        #24 clk = ~clk;//Altercacao pulso clock 12 unidades de tempo
    end 
 
endmodule // clock ( ) 