library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

entity Data_Memory_VHDL is
port (
 clk: in std_logic;
 mem_access_addr: in std_logic_Vector(15 downto 0);
 mem_write_data: in std_logic_Vector(15 downto 0);
 mem_write_en,mem_read:in std_logic;
 mem_read_data: out std_logic_Vector(15 downto 0)
);
end Data_Memory_VHDL;

architecture Behavioral of Data_Memory_VHDL is
signal i: integer;
signal ram_addr: std_logic_vector(7 downto 0);
type data_mem is array(0 to 31) of STD_LOGIC_VECTOR (15 downto 0);
signal RAM: data_mem :=(
  X"0000", -- initialize data memory
  X"0000", -- mem 1
  X"0000",
  X"0033", -- mem 3 = 0x33
  X"0004",
  X"0005",
  X"0006",
  X"0007",
  X"0000",
  X"0000", 
  X"0000", -- mem 10 
  X"0000", 
  X"0000",
  X"0000",
  X"0000",
  X"0000",
  X"0000",
  X"0000",
  X"0000",
  X"0000",  
  X"0000", -- mem 20
  X"0000",
  X"0000",
  X"0000",
  X"0000", 
  X"0000",
  X"0000",
  X"0000",
  X"0000",
  X"0000", 
  X"0000", -- mem 30
  X"0000");
begin

 ram_addr <= mem_access_addr(8 downto 1);
 process(clk)
 begin
  if(rising_edge(clk)) then
  if (mem_write_en='1') then
  ram(to_integer(unsigned(ram_addr))) <= mem_write_data;
  end if;
  end if;
 end process;
   mem_read_data <= ram(to_integer(unsigned(ram_addr))) when (mem_read='1') else x"0000";

end Behavioral;