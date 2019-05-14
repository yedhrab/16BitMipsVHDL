library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;  

entity Instruction_Memory_VHDL is
port (
 pc: in std_logic_vector(15 downto 0);
 instruction: out  std_logic_vector(15 downto 0)
);
end Instruction_Memory_VHDL;

architecture Behavioral of Instruction_Memory_VHDL is
signal rom_addr: std_logic_vector(3 downto 0);
type ROM_type is array (0 to 15 ) of std_logic_vector(15 downto 0);
constant rom_data: ROM_type:=(
   "1000100010000001", -- lw
   "0001011000110001", -- sub
   "0001111100100010", -- and
   "0001001011000100", -- or,
   "0001101111010000", --  add
   "0110010011101000", -- bne
   "1100010101111100", -- beq $1 $2 -4
   "0000110101100100", -- slt $6 $3 $2
   "1100010010000010", -- beq $1 $1 2
   "0000000000000000", -- NOP
   "0000000000000000", -- NOP
   "1010000010000010", -- sw $1 2
   "0000010111000000", -- add $4 $1 $3
   "0100000000000000", -- Jump 0
   "0000000000000000",
   "0000000000000000"
  );
begin

 rom_addr <= pc(4 downto 1);
  instruction <= rom_data(to_integer(unsigned(rom_addr))) when pc < x"0020" else x"0000";

end Behavioral;