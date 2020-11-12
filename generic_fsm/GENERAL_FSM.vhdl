--this file hopes to be a guide for a generic fsm, that is, 
--a template for a fsm with a variable number of states
-- this is achieved by having only 3 states:
--	the first state is the initial state
--	the second state, where the main computation is done,
--		will repeat itself a variable number of times
--	the third state is the final state
--this is useful for writing 2D iterative nets

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;

entity general_fsm is
	generic(
		INPUT_WIDTH	:	integer	:=	8;
		OUTPUT_WIDTH	:	integer	:=	1
	       );
	port(
		I	:	in	std_logic_vector(INPUT_WIDTH-1 downto 0);
		clk	:	in	std_logic;
		rst	:	in	std_logic;
		cells	:	in	std_logic_vector(7 downto 0);
		O	:	out	std_logic_vector(OUTPUT_WIDTH-1 downto 0)
	    );
end general_fsm;

architecture rtl of general_fsm is
	--(state initial, state generic, state final)
	type STATES is (SI,SG,SF);
	signal STATE,NEXT_STATE	:	STATES;
	--this signal acts as a counter for the number of
	--times that the generic state will be generated
	signal x	:	unsigned(7 downto 0);	

begin
	SYNC:	process(clk,rst)
	begin
		if rst = '1' then
			STATE <= SI;
		elsif(rising_edge(clk)) then 
			STATE <= NEXT_STATE;
		end if;
	end process SYNC;

	COMB: process(STATE)
	begin
		case STATE is
			when SI =>
				--initial state, so
				--initialize values
				x <= unsigned(cells);
				NEXT_STATE <= SG;
			when SG =>
				if x = 0 then 
					NEXT_STATE <= SF;
				else
					--do some logic
					x <= x-1;
				end if;
			when SF =>
				--final state
				--write some output or whatever
		end case;
	end process COMB;
end rtl;
