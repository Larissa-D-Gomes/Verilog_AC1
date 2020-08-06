// ------------------------- 
// Exemplo_0703  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output s0, s1, input x,y);

	and AND1 (s0, x, y);
	or  OR1 (s1, x, y);

endmodule

module B (output s0, s1, input x,y);
    
    nand NAND1 (s0, x, y);
	nor  NOR1 (s1, x, y);
	
endmodule

module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    

module E3(output s0, input x, y, seletor1, seletor2);

    wire ao0, ao1, nano0, nano1, m1, m2;
    
    A ANDOR(ao0, ao1, x, y);
    B NANDNOR(nano0, nano1, x, y);
    MUX MUX1(m1, ao1, ao0, seletor1);
    MUX MUX2(m2, nano1, nano0, seletor1);
    MUX MUXFinal(s0, m1, m2, seletor2);
    
endmodule
    
module ValoresIniciais;

reg a, b, seletor, seletor2;
wire s0, s1;

E3 ME3 (s0, a, b, seletor, seletor2);
initial
begin : start

	a = 1'bx;
	b = 1'bx;

end

initial
begin : main

	$display("Exemplo_0703 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 0; b = 0; seletor = 0; seletor2 = 0;
	$display("seletor seletor2 a  b  =  s0  ");
    $monitor("%2b     %2b       %2b %2b  = %2b ",seletor,seletor2, a, b, s0);
		
	#1 a = 0; b = 1; seletor = 0; seletor2 = 0;
	#1 a = 1; b = 0; seletor = 0; seletor2 = 0;
	#1 a = 1; b = 1; seletor = 0; seletor2 = 0;
	#1 a = 0; b = 0; seletor = 1; seletor2 = 0;
	#1 a = 0; b = 1; seletor = 1; seletor2 = 0;
	#1 a = 1; b = 0; seletor = 1; seletor2 = 0;
	#1 a = 1; b = 1; seletor = 1; seletor2 = 0;
	
	#1 a = 0; b = 0; seletor = 0; seletor2 = 1;
	#1 a = 0; b = 1; seletor = 0; seletor2 = 1;
	#1 a = 1; b = 0; seletor = 0; seletor2 = 1;
	#1 a = 1; b = 1; seletor = 0; seletor2 = 1;
	#1 a = 0; b = 0; seletor = 1; seletor2 = 1;
	#1 a = 0; b = 1; seletor = 1; seletor2 = 1;
	#1 a = 1; b = 0; seletor = 1; seletor2 = 1;
	#1 a = 1; b = 1; seletor = 1; seletor2 = 1;
end
endmodule