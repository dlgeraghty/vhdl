--this file hopes to be a guide for a generic fsm, that is, 
--a template for a fsm with a variable number of states
-- this is achieved by having only 3 states:
--	the first state is the initial state
--	the second state, where the main computation is done,
--		will repeat itself a variable number of times
--	the third state is the final state

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity GENERAL_FSM is
	generic(
		INPUT_WIDTH	:	integer	:=	8;
		OUTPUT_WIDTH	:	integer	:=	1
	       );
	port(
		I	:	in	std_logic_vector(INPUT_WIDTH-1 downto 0);
		Clock	:	in	std_logic;
		rst	:	in	std_logic;
		O	:	out	std_logic_vector(OUTPUT_WIDTH-1 downto 0)
	    );
end GENERAL_FSM;


