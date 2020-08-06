module A (output a, input x,y);

	assign a =  x & ~( x | ~y ) ; 

endmodule



module A2 (output b, input x, y);

	assign b = 0;

endmodule



module B (output c, input x, y);

	assign c =  ( ~x | y ) | ( x & y ) ;

endmodule



module B2 (output d, input x, y);

	assign d = ~x | y;

endmodule



module C (output c, input x, y);

	assign c = ~( x & ~y )  & ( ~x | y )   ;

endmodule

module C2 (output c2, input x, y);

	assign c2 = ~x | y   ;

endmodule

module D (output d, input x,y);

    assign d = ~( x & y ) | ~(~x | ~y );
    
endmodule
    
module D2 (output d2, input x,y);

    assign d2 = 1;    
    
endmodule

module E (output e, input x,y);

    assign e = ~( y | ~x ) & ( ~y | x );
    
endmodule
    
module E2 (output e2, input x,y);

    assign e2 = ~y & x;    
    
endmodule

module ValoresIniciais;

reg x, y;
wire a, a2, b, b2, c, c2, d, d2, e, e2;

	A letraA   (a, x, y);
	A2 letraA2 (a2, x, y);
	B letraB   (b, x, y);
	B2 letraB2 (b2, x, y);
	C letraC   (c, x, y);
	C2 letraC2 (c2, x, y);
	D letraD   (d, x, y);
	D2 letraD2 (d2, x, y);
    E letraE   (e, x, y);
	E2 letraE2 (e2, x, y);

initial
begin : start

	x = 1'bx;
	y = 1'bx;

end

initial
begin : main

	$display("Exemplo - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	$display(" x  y  =  a  a2  b  b2  c  c2  d  d2  e  e2");
    $monitor("%2b %2b  = %2b  %2b %2b %2b  %2b %2b  %2b %2b  %2b %2b", x, y, a, a2, b, b2, c, c2, d, d2, e, e2);
		
	#1 x = 0; y = 0; 
	#1 x = 0; y = 1;
	#1 x = 1; y = 0; 
	#1 x = 1; y = 1; 

end
endmodule