LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY comparation IS
	PORT ( address1_comp:   IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	       address3_comp:   IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	       clk_comp:	   	IN STD_LOGIC;
	       compare_comp:    OUT STD_LOGIC);
END ENTITY comparation;

ARCHITECTURE simple OF comparation IS
BEGIN
	PROCESS(clk_comp)
	BEGIN
		IF (rising_edge(clk_comp)) THEN
		compare_comp <= 	( address1_comp(0) XOR address3_comp (0) )
			OR	( address1_comp(1) XOR address3_comp (1) )
			OR 	( address1_comp(2) XOR address3_comp (2) )
			OR 	( address1_comp(3) XOR address3_comp (3) )
			OR 	( address1_comp(4) XOR address3_comp (4) );
		END IF;
	END PROCESS;
END ARCHITECTURE simple;	