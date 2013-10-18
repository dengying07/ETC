LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY alu IS
	PORT ( a_alu, b_alu:   IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		   opcode_alu: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
		   clk_alu:	   IN STD_LOGIC;
		   c_alu: 	   OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY alu;

ARCHITECTURE simple OF alu IS
BEGIN
	PROCESS(clk_alu)
	BEGIN
		IF (rising_edge(clk_alu)) THEN	
			IF		( opcode_alu="001011")	THEN  c_alu <= a_alu+b_alu;	 
			ELSIF	( opcode_alu="000110")	THEN  c_alu <= a_alu-b_alu;	
			ELSIF	( opcode_alu="001001")	THEN  c_alu <= ABS(a_alu);
			ELSIF	( opcode_alu="001111")	THEN  c_alu <= -a_alu;
			ELSIF	( opcode_alu="000101")	THEN  c_alu <= ABS(b_alu);
			ELSIF	( opcode_alu="000111")	THEN  c_alu <= -b_alu;
			ELSIF	( opcode_alu="001010")	THEN  c_alu <= a_alu OR b_alu;
			ELSIF	( opcode_alu="001011")	THEN  c_alu <= NOT a_alu;
			ELSIF	( opcode_alu="000001")	THEN  c_alu <= NOT b_alu;
			ELSIF	( opcode_alu="001000")	THEN  c_alu <= a_alu AND b_alu;
			ELSIF	( opcode_alu="001100")	THEN  c_alu <= a_alu XOR b_alu;
			ELSIF	( opcode_alu="111111")	THEN  				-- DO NOTHING,defined	
			END IF;		
		END IF;						   
	END PROCESS;
END ARCHITECTURE simple;
