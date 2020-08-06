
module A (output a, input x,y,z);

	assign a =  (~x&~y&z) | (~x&~y&z) | (~x&y&~z) | (~x&y&z) | (x&~y&z); 
  

endmodule



module B (output b, input x, y, z);

	assign b = (~x&~y&z) | (~x&y&~z) | (x&~y&~z) | (x&~y&z);

endmodule



module ValoresIniciais;

reg x, y, z, w;
wire a, b;

	A letraA (a, x, y, z);
	B letraB (b, x, y, z);

initial
begin : start

	x = 1'bx;
	y = 1'bx;
	z = 1'bx;
	w = 1'bx;

end

initial
begin : main

	$display("Exemplo - Larissa Gomes - 65052");
	$display("Expressoes booleanas");
	
	$display(" x  y  z =  a  b ");
$monitor("%2b %2b %2b = %2b %2b ", x, y, z, a, b);
		
	#1 x = 0; y = 0; z = 0;
	#1 x = 0; y = 0; z = 1;
	#1 x = 0; y = 1; z = 0;
	#1 x = 0; y = 1; z = 1;
	#1 x = 1; y = 0; z = 0;
	#1 x = 1; y = 0; z = 1;
	#1 x = 1; y = 1; z = 0;
	#1 x = 1; y = 1; z = 1;

end
endmodule