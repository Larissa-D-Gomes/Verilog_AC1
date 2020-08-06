module ASoP (output a, input x,y);

	assign a = (~x & ~y) | (x & ~y) | (x & y) ; 

endmodule

module APoS (output a, input x,y);

    assign a = (x | ~y);
    
endmodule

module BSoP (output b, input x, y);

	assign b = (~x & ~y) | (~x & y) | (x & y) ; 

endmodule

module BPoS (output b, input x, y);

	assign b = (~x | y) ; 

endmodule

module CSoP (output c, input x, y, z);

	assign c = (~x&~y&~z) | (~x&~y&z) | (~x&y&z) | (x&~y&z) | (x&y&z);

endmodule

module CPoS (output c, input x,y, z);

    assign c = (x | ~y | z) & (~x | y |z) & (~x |~y | z);
    
endmodule
    

module DSoP(output d, input x,y, z);

    assign d = ( ~x & ~y & ~z ) | ( ~x & y & ~z ) | (x & ~y & ~z) | ( x & ~y & z);
    
endmodule
    
module DPoS(output d, input x,y, z);

    assign d = ( x | y | ~z) & (x | ~y | ~z) & (~x | ~y | z) & (~x | ~y | ~z);
    
endmodule

module ESoP(output e, input x,y,w, z);

assign e = (~x & ~y & ~w & ~z) | (~x & ~y & ~w & z) | (~x & ~y & w & ~z) | (~x & y & ~w & ~z) | (x & ~y & ~w & ~z) | (x & ~y & w & ~z) | (x & ~y & w & z) | (x & y & ~w & z) | (x & y & w & ~z) | (x & y & w & z);
    
endmodule

module EPoS(output e, input x,y,w, z);

assign e = (x | y | ~w | ~z) & (x | ~y | w | ~z) & (x | ~y | ~w | z) & (x | ~y | ~w | ~z) & (~x | y | w | ~z) & (~x | ~y | w | z) ;
    
endmodule
module ValoresIniciais;

reg x, y, w, z;
wire asop, apos, bsop, bpos, csop, cpos, dsop, esop, epos;

	ASoP ASoP  (asop, x, y);
	APoS APoS  (apos, x, y);
	BSoP BSoP  (bsop, x, y);
	BPoS BPoS  (bpos, x, y);
	CSoP CSoP  (csop, x, y, z);
	CPoS CPoS  (cpos, x, y, z);
	DSoP DSoP  (dsop, x, y, z);
	DPoS DPoS  (dpos, x, y , z);
	ESoP ESoP  (esop, x, y, w, z);
	EPoS EPoS  (epos, x, y, w, z);

initial
begin : start

	x = 1'bx;
	y = 1'bx;
	z = 1'bx;
	w = 1'bx;

end

initial
begin : main

	$display("Exemplo - Larissa Gomes - 650525");
	$display("Expressoes booleanas");
	
	#1 x = 0; y = 0;
	$display(" x  y  =  aSoP  aPoS  bSoP  bPoS");
    $monitor("%2b %2b  =  %2b    %2b    %2b    %2b", x, y, asop, apos, bsop, bpos);
		
	#1 x = 0; y = 1;
	#1 x = 1; y = 0; 
	#1 x = 1; y = 1; 
	
	#1 x = 0; y = 0; z = 0;
	$display("\n");
	$display(" x  y  z  =  cSoP  cPoS  dSoP  dPoS");
	$monitor("%2b %2b %2b =   %2b    %2b    %2b    %2b ", x, y, z, csop, cpos, dsop, dpos);
	#1 x = 0; y = 0; z = 1;
	#1 x = 0; y = 1; z = 0;
	#1 x = 0; y = 1; z = 1;
	#1 x = 1; y = 0; z = 0;
	#1 x = 1; y = 0; z = 1;
	#1 x = 1; y = 1; z = 0;
	#1 x = 1; y = 1; z = 1;
	
	#1 x = 0; y = 0; w = 0; z = 0;
	$display("\n");
	$display(" x  y  w  z  =  eSoP  ePoS  ");
	$monitor("%2b %2b %2b %2b =   %2b    %2b ", x, y, w, z, esop, epos);
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