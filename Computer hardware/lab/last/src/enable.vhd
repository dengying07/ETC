LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_signed.ALL;

ENTITY enable IS
	PORT ( 
	opcode_enable: IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	clk_enable:	IN STD_LOGIC;
	enable_enable: OUT STD_LOGIC);
END ENTITY enable; 

ARCHITECTURE simple OF enable IS 
BEGIN
	PROCESS(opcode_enable)
	BEGIN 													--give the enable values
		IF		( opcode_enable="001011")	THEN  enable_enable <= '1';	 
		ELSIF	( opcode_enable="000110")	THEN  enable_enable <= '1';	
		ELSIF	( opcode_enable="001001")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="001111")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="000101")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="000111")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="001010")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="001011")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="000001")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="001000")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="001100")	THEN  enable_enable <= '1';
		ELSIF	( opcode_enable="111111")	THEN  enable_enable <= '1';
		ELSE							  		  enable_enable <= '0';	--other opcode value is invalid, enable=0, register file ignore its inputs.
		END IF;
	END PROCESS; 
END ARCHITECTURE simple;