-- A library clause declares a name as a library.  It 
-- does not create the library; it simply forward declares 
-- it. 
library ieee;

---- Use clauses import declarations into the current scope.	
---- If more than one use clause imports the same name into the
---- the same scope, none of the names are imported.
--
---- Import all the declarations in a package
--use <library_name>.<package_name>.all;
--
---- Import a specific declaration from a package
--use <library_name>.<package_name>.<object_name>;
--
---- Import a specific entity from a library
--use <library_name>.<entity_name>;
--
---- Import from the work library.  The work library is an alias
---- for the library containing the current design unit.
--use work.<package_name>.all;


-- Commonly imported packages:

	-- STD_LOGIC and STD_LOGIC_VECTOR types, and relevant functions
	use ieee.std_logic_1164.all;

	-- SIGNED and UNSIGNED types, and relevant functions
	use ieee.numeric_std.all;

	-- Basic sequential functions and concurrent procedures
	use ieee.VITAL_Primitives.all;

--	-- Library of Parameterized Modules: 
--	-- customizable, device-independent logic functions
--	use lpm.lpm_components.all;
--
--	-- Altera Megafunctions
--	use altera_mf.altera_mf_components.all;
	
	library work;
	use work.all;
	use ieee.std_logic_unsigned.all; -- for std_logic_vector +

entity td4vhdl is
--	generic
--	(
--		<name>	: <type>  :=	<default_value>;
--		...
--		<name>	: <type>  :=	<default_value>
--	);


	port
	(
		-- Input ports
		clk      : in  std_logic;
		rst_n    : in  std_logic;
		btn      : in  std_logic_vector (3 downto 0);
--		<name>	: in  <type>;
--		<name>	: in  <type> := <default_value>;

		-- Inout ports
--		<name>	: inout <type>;

		-- Output ports
		led      : out std_logic_vector (3 downto 0)
--		<name>	: out <type>;
--		<name>	: out <type> := <default_value>
	);
end td4vhdl;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture td4vhdl_arch of td4vhdl is

	-- Declarations (optional)
   constant mov_ai: std_logic_vector (3 downto 0) := "0011";
   constant mov_bi: std_logic_vector (3 downto 0) := "0111";
   constant mov_ab: std_logic_vector (3 downto 0) := "0001";
   constant mov_ba: std_logic_vector (3 downto 0) := "0100";
   
	constant add_ai: std_logic_vector (3 downto 0) := "0000";
   constant add_bi: std_logic_vector (3 downto 0) := "0101";
   
	constant in_a  : std_logic_vector (3 downto 0) := "0010";
   constant in_b  : std_logic_vector (3 downto 0) := "0110";
	
   constant out_i : std_logic_vector (3 downto 0) := "1011";
   constant out_b : std_logic_vector (3 downto 0) := "1001";
	
   constant jmp_i : std_logic_vector (3 downto 0) := "1111";
   constant jmc_i : std_logic_vector (3 downto 0) := "1110";
	
	signal nbtn: std_logic_vector (3 downto 0);
	
	signal dout: std_logic_vector (7 downto 0);
 
	--decoder
	signal im: std_logic_vector (3 downto 0);
	signal op: std_logic_vector (3 downto 0);

	--shared variable, 49
	--signal, 55
	signal addr: std_logic_vector (3 downto 0) := "0000";	
	
	signal clk2 : std_logic;	
begin
	-- button input
	nbtn <= not btn;	
	
	--rom
	--rom1: rom port map(addr, dout);
	--rom1: rom_knight2k port map(addr, dout);
    rom1: entity rom port map(addr, dout);

	--decoder
	im <= dout(3 downto 0);
	op <= dout(7 downto 4);		

	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)
	process(rst_n, clk) is 
		variable count : integer range 0 to 9999999;	
	begin
		if (rst_n = '0') then
			clk2 <= '0';
			count := 0;
			--led <= "0000";
		elsif(rising_edge(clk)) then
			-- Synchronous Sequential Statement(s)		
			if (count > 5000000) then
				clk2 <= '0';
				count := 0;
				--led <= "0000";
			elsif (count > 2500000 and count <= 5000000) then
				clk2 <= '1';
				count := count + 1;
				--led <= "1111";
			elsif (count >= 0) then
				clk2 <= '0';
				count := count + 1;
				--led <= "0000";
			else
				clk2 <= '0';
				count := 0;
				--led <= "1111";			
			end if;
		end if;
	end process;
	
	
	
--	process(rst_n, clk2) is 
--		-- Declaration(s) 
--		variable count1: integer range 0 to 16;
--	begin 
--		if(rst_n = '0') then
--			-- Asynchronous Sequential Statement(s) 
--			count1 := 0;
--			led <= "0000";
--		elsif(rising_edge(clk2)) then
--			-- Synchronous Sequential Statement(s)
--			if count1 <= 4 then
--				if count1 = 4 then
--					count1 := 0;
--				end if;
--				case count1 is
--					when 0 => led <= "0001";
--					when 1 => led <= "0010";
--					when 2 => led <= "0100";
--					when 3 => led <= "1000";
--					when others => led <= "1111";
--				end case;
--				count1 := count1 + 1;
--			end if;
--		end if;
--	end process; 

	
	
	process(rst_n, clk2) is 
		-- Declaration(s) 
		variable a: std_logic_vector (4 downto 0) := "00000";
		variable b: std_logic_vector (3 downto 0) := "0000";
		variable c_flag: std_logic := '0';
		
		variable out_data: std_logic_vector (3 downto 0) := "0000";
		
		--variable addr: std_logic_vector (3 downto 0) := "0000";	
	begin 
	   if(rst_n = '0') then
			-- Asynchronous Sequential Statement(s) 
			addr <= "0000";
			out_data := "0000";
		elsif(rising_edge(clk2)) then
			-- Synchronous Sequential Statement(s)
			case op is
			when mov_ai => a := '0' & im;
			when mov_bi => b := im;		

			when mov_ab => a := '0' & b;
			when mov_ba => b := a(3 downto 0);		
			
			when add_ai =>
				a := a + im;
				if (a >= "01111") then
					c_flag := '1';					
				else
					c_flag := '0';
				end if;
			
			when add_bi => 
				b := b + im;
				if (b >= "01111") then
					c_flag := '1';					
				else
					c_flag := '0';
				end if;
			
			when out_i => out_data := im;
			when out_b => out_data := b;
			
			when jmp_i => addr <= im;
			when jmc_i =>		
				if (c_flag = '1') then
					a := "00000";
					addr <= addr + 1;
				else
					addr <= im;
				end if;
					
			when others =>
			end case;
	
			-- out_data := "0001";
			-- counter
			if (op /= jmp_i and op /= jmc_i) then
				addr <= addr + 1;
			end if;

			-- led output
			--led <= not out_data;
			--if (out_data = "0000") then
			--	out_data := "1111";
			--else
			--	out_data := "0000";
			--end if;
			--led <= "0001";
		end if;
		led <= out_data;
	end process; 
	
end td4vhdl_arch;

