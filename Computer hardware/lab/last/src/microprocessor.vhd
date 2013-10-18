LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
ENTITY microprocessor IS
PORT ( 
	instructions: IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	clk:IN STD_LOGIC;
	enable:OUT STD_LOGIC;
	
	result: OUT STD_LOGIC_VECTOR(31 DOWNTO 0));
END ENTITY microprocessor;

ARCHITECTURE behavior OF microprocessor IS

	SIGNAL add1,add2,add3,add3_compare,add3_temp: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL input,out1,out2,a,b,c: STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL clock : STD_LOGIC;
	SIGNAL opcode,opcode_next: STD_LOGIC_VECTOR(5 DOWNTO 0);  
	SIGNAL compare: STD_LOGIC;
	

BEGIN
g0: entity work.instruction(simple)	
	PORT MAP (
		clk_insruct=>clk,address1_insruct=>add1,address2_insruct=>add2,address3_insruct=>add3,opcode_insruct=>opcode,instruction_insruct=>instructions);

g3: entity work.enable(simple)
	PORT MAP (opcode_enable=>opcode_next,clk_enable=>clk,enable_enable=>enable);
	a      <= out2;
	input  <= c;
	PROCESS (a)
			BEGIN
				IF (compare = '0') THEN 
					b <= c;
					
				ELSE
					b <= out1;
					
			    END IF;
END PROCESS;
			
					
												
	PROCESS (CLK)
		BEGIN		 
			IF ( rising_edge(CLK) ) THEN

					opcode_next<= opcode;
					add3_compare  <= add3;	
					add3_temp <= add3_compare;
				  
			END IF;
	END PROCESS;		
		
g1: entity work.reg(simple)
	PORT MAP (
	address1_reg=>add1,address2_reg=>add2,address3_reg=>add3_temp,
	input_reg=>input,output1_reg=>out1,output2_reg=>out2,output3_reg=>result,
	clk_reg=>clk,
	enable_reg=>enable);
g2: entity work.alu(simple)
	PORT MAP (a_alu=>a,b_alu=>b,opcode_alu=>opcode_next,c_alu=>c,clk_alu=>clk);
	
			



	
g4: entity work.comparation(simple)
	PORT MAP (address1_comp=>add1,address3_comp=>add3_compare,clk_comp=>clk,compare_comp=>compare);	   
	
END ARCHITECTURE behavior;