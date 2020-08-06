
module C (output c, input x,y,w,z);

	assign c =  (x|y|w|z) & (x|y|w|~z) & (x|y|~w|z) & (x|y|~w|~z) & (x|~y|~w|z) & (~x|y|w|z) & (~x|y|~w|~z) & (~x|~y|w|z); 
  

endmodule



module D (output d, input x, y, w,z);

	assign d = (x|y|w|z) & (x|y|~w|z) & (x|~y|w|z) & (x|~y|~w|z) & (x|~y|~w|~z) & (~x|y|~w|z) & (~x|~y|w|~z);

endmodule

module E (output e, input x, y, w,z);

	assign e = (x|y|w|z) & (x|y|w|~z) & (x|y|~w|z) & (x|~y|w|z) & (x|~y|~w|~z) & (~x|y|~w|~z) & (~x|~y|~w|~z);

endmodule


module ValoresIniciais;

reg x, y, z, w;
wire c, d, e;

	C letraC (c, x, y, w, z);
	D letraD (d, x, y, w, z);
    E letraE (e, x, y, w, z);
    
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
	
	$display(" x  y  w  z =  c   d   e");
    $monitor("%2b %2b %2b %2b = %2b  %2b  %2b", x, y, w, z, c, d, e);
		
	#1 x = 0; y = 0; w = 0; z = 0;
	#1 x = 0; y = 0; w = 0; z = 1;
	#1 x = 0; y = 0; w = 1; z = 0;
	#1 x = 0; y = 0; w = 1; z = 1;
    #1 x = 0; y = 1; w = 0; z = 0;
	#1 x = 0; y = 1; w = 0; z = 1;
	#1 x = 0; y = 1; w = 1; z = 0;
	#1 x = 0; y = 1; w = 1; z = 1;
	#1 x = 1; y = 0; w = 0; z = 0;
	#1 x = 1; y = 0; w = 0; z = 1;
	#1 x = 1; y = 0; w = 1; z = 0;
	#1 x = 1; y = 0; w = 1; z = 1;
	#1 x = 1; y = 1; w = 0; z = 0;
	#1 x = 1; y = 1; w = 0; z = 1;
	#1 x = 1; y = 1; w = 1; z = 0; 
	#1 x = 1; y = 1; w = 1; z = 1;
	
		

end
endmodule