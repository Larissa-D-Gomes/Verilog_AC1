// ------------------------- 
// Exemplo_0706  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module igualdade(output s0, input a0, a1, b0, b1);
    wire s1, s2;
    
    xnor(s1, a0, b0);
    xnor(s2, a1, b1);
    and(s0, s1, s2);

endmodule

module desigualdade(output s0, input a0, a1, b0, b1);
    wire s1, s2;
    
    xor(s1, a0, b0);
    xor(s2, a1, b1);
    or(s0, s1, s2);

endmodule

module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    

module COMPARADOR(output s0, input a0, a1, b0, b1, seletor);
    wire s1, s2;
    
    igualdade IG(s1, a0, a1, b0, b1);
    desigualdade DESIG(s2, a0, a1, b0, b1);
    MUX M1(s0, s2, s1, seletor);
    
endmodule
    
module ValoresIniciais;

reg [1:0] a, b;
reg seletor;
wire s0;

COMPARADOR COMP (s0, a[0], a[1], b[0], b[1], seletor);
initial
begin : start

	a = 2'bxx;
	b = 2'bxx;
	seletor = 1'bx;

end

initial
begin : main

	$display("Exemplo_0706 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 00; b = 00; seletor = 0;
	$display("seletor   a   b   =  s0  ");
    $monitor("%2B        %2b  %2b  = %2b ",seletor, a, b, s0);
		
    #1 a = 00; b = 01; seletor = 0;
    #1 a = 00; b = 10; seletor = 0;
    #1 a = 00; b = 11; seletor = 0;
    
    #1 a = 01; b = 00; seletor = 0;
    #1 a = 01; b = 01; seletor = 0;
    #1 a = 01; b = 10; seletor = 0;
    #1 a = 01; b = 11; seletor = 0;
    
    #1 a = 10; b = 00; seletor = 0;
    #1 a = 10; b = 01; seletor = 0;
    #1 a = 10; b = 10; seletor = 0;
    #1 a = 10; b = 11; seletor = 0;
    
    #1 a = 11; b = 00; seletor = 0;
    #1 a = 11; b = 01; seletor = 0;
    #1 a = 11; b = 10; seletor = 0;
    #1 a = 11; b = 11; seletor = 0;
    
	#1 a = 00; b = 00; seletor = 1;
    #1 a = 00; b = 01; seletor = 1;
    #1 a = 00; b = 10; seletor = 1;
    #1 a = 00; b = 11; seletor = 1;
        
    #1 a = 01; b = 00; seletor = 1;
    #1 a = 01; b = 01; seletor = 1;
    #1 a = 01; b = 10; seletor = 1;
    #1 a = 01; b = 11; seletor = 1;
    
    #1 a = 10; b = 00; seletor = 1;
    #1 a = 10; b = 01; seletor = 1;
    #1 a = 10; b = 10; seletor = 1;
    #1 a = 10; b = 11; seletor = 1;
    
    #1 a = 11; b = 00; seletor = 1;
    #1 a = 11; b = 01; seletor = 1;
    #1 a = 11; b = 10; seletor = 1;
    #1 a = 11; b = 11; seletor = 1;
    
end
endmodule