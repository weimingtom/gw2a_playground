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
	

entity rom_knight2k is
--	generic
--	(
--		<name>	: <type>  :=	<default_value>;
--		...
--		<name>	: <type>  :=	<default_value>
--	);


	port
	(
		-- Input ports
		addr     : in  std_logic_vector (3 downto 0);
--		<name>	: in  <type>;
--		<name>	: in  <type> := <default_value>;


		-- Inout ports
--		<name>	: inout <type>;

		-- Output ports
		dout     : out std_logic_vector (7 downto 0)
--		<name>	: out <type>;
--		<name>	: out <type> := <default_value>
	);
end rom_knight2k;



-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture rom_knight2k_arch of rom_knight2k is

	-- Declarations (optional)

begin

	-- Process Statement (optional)

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)
		-- https://vanya.jp.net/td4/
		dout <= 
			"10110011" when addr = "0000" else -- out 3
			"10110110" when addr = "0001" else -- out 6	
			"10111100" when addr = "0010" else -- out 12
			"10111000" when addr = "0011" else -- out 8
			"10111000" when addr = "0100" else -- out 8
			"10111100" when addr = "0101" else -- out 12
			"10110110" when addr = "0110" else -- out 6
			"10110011" when addr = "0111" else -- out 3
			"10110001" when addr = "1000" else -- out 1
			"11110000" when addr = "1001" else -- jmp 0
			"00000000" when addr = "1010" else --
			"00000000" when addr = "1011" else --
			"00000000" when addr = "1100" else --
			"00000000" when addr = "1101" else --
			"00000000" when addr = "1110" else --
			"00000000" when addr = "1111" else --
			"00000000";
end rom_knight2k_arch;
