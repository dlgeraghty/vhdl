library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.Numeric_std.all;


entity FSM is
	port(reset, E: in bit; Clock: in Std_logic; O: out bit; CURRENT_STATE: out Std_logic_vector(3 downto 0));
end FSM;

architecture ARCH of FSM is
	type ESTADOS is (S1, S2, S3, S4);
	signal ESTADO, SIG_ESTADO: ESTADOS;
	signal c_count: unsigned (3 downto 0);
	
	begin
		
		SYNC: process(Clock, reset)
		begin
			if rising_edge(Clock) then
				if reset = '1' then
					ESTADO <= S1;
				else
					ESTADO <= SIG_ESTADO;
				end if;
			end if;
		end process SYNC;
		
		COMB: process(ESTADO, E)
		begin
			case ESTADO is
			when S1 =>
				O <= '0';
				c_count <= "0000";
				if(E='0') then SIG_ESTADO <= S2;
				else SIG_ESTADO <= S1;
				end if;
			when S2 =>
				O <= '0';
				c_count <= "0001";
				if(E= '0') then SIG_ESTADO <= S3;
				else SIG_ESTADO <= S1;
				end if;
			when S3 =>
				O <= '0';
				c_count <= "0010";
				if( E = '0' ) then SIG_ESTADO <= S3;
				else SIG_ESTADO <= S4;
				end if;
			when S4 =>
				O <= '1';
				c_count <= "0011";
				if( E = '0' ) then SIG_ESTADO <= S2;
				else SIG_ESTADO <= S1;
				end if;
			end case;
		end process COMB;
		CURRENT_STATE <= std_logic_vector(c_count);
	end ARCH;
