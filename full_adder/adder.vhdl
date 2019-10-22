entity adder is

	-- inputs: `i0` , `i1` , `ci`
	-- outputs: `s` , `co`

	port (i0, i1: in bit; ci : in bit; s : out bit; co : out bit);
end adder;

architecture rtl of adder is
begin
	-- This full-adder architecture contains two current assignments.
	-- Compute the sum
	s <= i0 xor i1 xor ci;
	-- Carry:
	co <= (i0 and i1) or (i0 and ci) or (i1 and ci);
end rtl; 
