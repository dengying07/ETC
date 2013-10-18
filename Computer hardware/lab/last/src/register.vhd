LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY reg IS
PORT ( 
	address1_reg: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	address2_reg: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	address3_reg: IN STD_LOGIC_VECTOR(4 DOWNTO 0);	
	clk_reg : 	  IN STD_LOGIC;
	enable_reg:   IN STD_LOGIC;
	input_reg: 	  IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	output1_reg:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	output2_reg:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0);	
	output3_reg:  OUT STD_LOGIC_VECTOR(31 DOWNTO 0)	); 
	
END ENTITY reg;

ARCHITECTURE simple OF reg IS
	TYPE rom_array IS ARRAY ( 0 TO 31 ) OF STD_LOGIC_VECTOR ( 31 DOWNTO 0 );
	SIGNAL rom_data: rom_array := (						 --the third-from-last digit of my ID is 7
	x"00000000", 										 --r0
	x"0000E0C9", x"00004393", x"0000B690", x"00008658",  --r1+r2-r3-r4
	x"0000077F", x"000075DF", x"000017D7", x"000008CF",  --r5+r6-r7-r8
	x"0000D367", x"00003F04", x"0001135B", x"00010246",  --r9+r10-r11-r12
	x"0000AB32", x"0000C7B4", x"000183DA", x"0000E767",  --r13+r14-r15-r16
	x"00008938", x"00017209", x"000148CE", x"00009FE0",  --r17+r18-r19-r20
	x"0001755F", x"0000F5B6", x"00012FFA", x"0000B473",  --r21+r22-r23-r24
	x"0000EDFA", x"00002723", x"0000FEA9", x"00002F46",	 --r25+r26-r27-r28
	x"00005F78", x"000160CB", 							 --r29+r30
	x"00000000");										 --r31
BEGIN 
	PROCESS(clk_reg)
	BEGIN 
		IF (enable_reg='1') THEN
			IF (rising_edge(clk_reg)) THEN	   		
				rom_data ( CONV_INTEGER (address3_reg))<= input_reg ;
				output1_reg <= rom_data ( CONV_INTEGER (address1_reg) );
				output2_reg <= rom_data ( CONV_INTEGER (address2_reg) ); 
				output3_reg <= rom_data ( CONV_INTEGER (address3_reg) ); 
			END IF;  
		END IF;
	END PROCESS;
END ARCHITECTURE simple;