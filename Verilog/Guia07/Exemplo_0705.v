// ------------------------- 
// Exemplo_0705  
// Nome: Larissa Domingues Gomes 
// Matricula: 650525
// ------------------------- 

module A (output s0, s1, input x,y);
    not not1(s0, x);
	nor not2 (s1, y);


endmodule

module B (output s0, s1, input x,y);
    
	and AND1(s0, x, y);
	nand NAND1 (s1, x, y);
	
endmodule

module C (output s0, s1, input x,y);
    
	or OR1(s0, x, y);
	nor NOR1 (s1, x, y);
	
endmodule

module D (output s0, s1, input x,y);
    
	xor  XOR1(s0, x, y);
	xnor XNOR1 (s1, x, y);
	
endmodule

module MUX(output s0, input x,y, seletor);
    wire  notseletor, sa1, sa2;
    
    
    not NOT1 (notseletor, seletor);
    and AND1(sa1, x, seletor);
    and AND2(sa2, y, notseletor);
    or OR1  (s0, sa1, sa2);
    
endmodule    

module E3(output s0, input x, y, seletor1, seletor2, seletor3);

    wire n1, n2, nand1, and1, ono1, ono2, xo1, xo2, m1, m2, m3, m4, m5, m6;
    
    A A1(n1, n2, x, y);
    B B1(and1, nand2, x, y);
    C C1(ono1, ono2, x, y);
    D D1(xo1, xo2, x, y);
    MUX MUX1(m1, n1, n2, seletor1);
    MUX MUX2(m2, ono2, ono1, seletor1);
    MUX MUX3(m3, m1, m2, seletor2);
    MUX MUX4(m4, and1, nand2, seletor1);
    MUX MUX5(m5, xo2, xo1, seletor1);
    MUX MUX6(m6, m4, m5, seletor2);
    MUX FINAL(s0, m3, m6, seletor3);
    
endmodule
    
module ValoresIniciais;

reg a, b;
reg [2:0] seletor;
wire s0;

E3 ME3 (s0, a, b, seletor[0], seletor[1], seletor[2]);
initial
begin : start

	a = 1'bx;
	b = 1'bx;
	seletor = 2'bxx;

end

initial
begin : main

	$display("Exemplo_0705 - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 a = 0; b = 0; seletor = 000;
	$display("seletor   a  b  =  s0  ");
    $monitor("%2B      %2b %2b  = %2b ",seletor, a, b, s0);
		
	#1 a = 0; b = 1; seletor = 000;
	#1 a = 1; b = 0; seletor = 000;
	#1 a = 1; b = 1; seletor = 000;
	
	#1 a = 0; b = 0; seletor = 001;
	#1 a = 0; b = 1; seletor = 001;
	#1 a = 1; b = 0; seletor = 001;
	#1 a = 1; b = 1; seletor = 001;
	
	#1 a = 0; b = 0; seletor = 010;
	#1 a = 0; b = 1; seletor = 010;
	#1 a = 1; b = 0; seletor = 010;
	#1 a = 1; b = 1; seletor = 010;
	
	#1 a = 0; b = 0; seletor = 011;
	#1 a = 0; b = 1; seletor = 011;
	#1 a = 1; b = 0; seletor = 011;
	#1 a = 1; b = 1; seletor = 011;
	
	#1 a = 0; b = 0; seletor = 100;
	#1 a = 0; b = 1; seletor = 100;
	#1 a = 1; b = 0; seletor = 100;
	#1 a = 1; b = 1; seletor = 100;
	
	#1 a = 0; b = 0; seletor = 101;
	#1 a = 0; b = 1; seletor = 101;
	#1 a = 1; b = 0; seletor = 101;
	#1 a = 1; b = 1; seletor = 101;

	#1 a = 0; b = 0; seletor = 110;
	#1 a = 0; b = 1; seletor = 110;
	#1 a = 1; b = 0; seletor = 110;
	#1 a = 1; b = 1; seletor = 110;
	
	#1 a = 0; b = 0; seletor = 111;
	#1 a = 0; b = 1; seletor = 111;
	#1 a = 1; b = 0; seletor = 111;
	#1 a = 1; b = 1; seletor = 111;
end
endmodule