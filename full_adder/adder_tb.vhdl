entity adder_tb is
end adder_tb;

architecture behav of adder_tb is

	-- Declaration of the component that will be instantiated:
	component adder
		port(i0, i1 : in bit; ci : in bit; s : out bit; co : out bit);
	end component;

	for adder_0: adder use entity work.adder;
	signal i0, i1, ci, s, co : bit;

begin
	
	adder_0 : adder port map (i0 => i0 , i1 => i1, ci => ci , s => s , co => co);

	-- now to the real stuff:

	process
		type pattern_type is record
		
		--inputs:
		i0, i1, ci : bit;
		
		--outputs:
		s, co : bit;

		end record;

		-- Patterns (examples) to apply:

		type pattern_array is array (natural range <>) of pattern_type;
		constant patterns: pattern_array :=
		   (('0', '0', '0', '0', '0'),
		   ('0', '0', '1', '1', '0'),
		   ('0', '1', '0', '1', '0'),
		   ('0', '1', '1', '0', '1'),
		   ('1', '0', '0', '1', '0'),
		   ('1', '0', '1', '0', '1'),
		   ('1', '1', '0', '0', '1'),
		   ('1', '1', '1', '1', '1'));

	begin 
		-- execute each example:

		for i in patterns'range loop
		
		--set the inputs:

		i0 <= patterns(i).i0;
		i1 <= patterns(i).i1;
		ci <= patterns(i).ci;

		--wait for the results:

		wait for 1 ns;

		-- check outputs:

		assert s = patterns(i).s
			report "bad sum value" severity error;
		assert co = patterns(i).co
			report "bad carry out value" severity error;
	end loop;
	assert false report "end of test" severity note;

	-- Wait forever to end the simulation:

	wait;
	end process;
end behav;
