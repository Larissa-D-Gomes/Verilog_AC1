// ------------------------- 
// Exemplo_0702  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output s0, s1, input x,y);

	and AND1 (s0, x, y);
	or  OR1 (s1, x, y);

endmodule

module MUX(output s0, input x,y, seletor);
    wire sa, so, notseletor, sa1, sa2;
    
    A ModA(sa, so, x, y);
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, sa, seletor);
    and AND2(sa2, so, notseletor);
    or OR1 (s0, sa1, sa2);
    
endmodule    
    
module ValoresIniciais;

reg a, b, seletor;
wire s0, s1;

MUX MUX1   (s0, a, b, seletor);
initial
begin : start

	a = 1'bx;
	b = 1'bx;

end

initial
begin : main

	$display("Exemplo_0702 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 0; b = 0; seletor = 0;
	$display("seletor a  b  =  s0  ");
   $monitor("%2b     %2b %2b  = %2b ",seletor, a, b, s0);
		
	#1 a = 0; b = 1; seletor = 0;
	#1 a = 1; b = 0; seletor = 0;
	#1 a = 1; b = 1; seletor = 0;
	#1 a = 0; b = 0; seletor = 1;
	#1 a = 0; b = 1; seletor = 1;
	#1 a = 1; b = 0; seletor = 1;
	#1 a = 1; b = 1; seletor = 1;
end
endmodule