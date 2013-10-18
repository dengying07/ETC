LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY instruction IS
	PORT ( 
	instruction_insruct: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	clk_insruct:	   IN STD_LOGIC;
	address1_insruct: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	address2_insruct: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	address3_insruct: OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
	opcode_insruct:   OUT STD_LOGIC_VECTOR(5 DOWNTO 0)); 
		   
END ENTITY instruction;

ARCHITECTURE simple OF instruction IS
BEGIN
	PROCESS(clk_insruct)
	BEGIN
		IF (rising_edge(clk_insruct)) THEN
			opcode_insruct	<= instruction_insruct(31 DOWNTO 26);	
			address1_insruct<= instruction_insruct(25 DOWNTO 21);
			address2_insruct<= instruction_insruct(20 DOWNTO 16);
			address3_insruct<= instruction_insruct(15 DOWNTO 11);
			
		END IF;						   
	END PROCESS;
END ARCHITECTURE simple;
