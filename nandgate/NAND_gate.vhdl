library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NAND_Gate is
    Port (
        A : in STD_LOGIC;  -- Input A
        B : in STD_LOGIC;  -- Input B
        Y : out STD_LOGIC  -- Output Y (A NAND B)
    );
end NAND_Gate;

architecture Behavioral of NAND_Gate is
begin
    Y <= NOT (A AND B);
end Behavioral;
