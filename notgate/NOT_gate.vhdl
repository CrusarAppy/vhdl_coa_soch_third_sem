library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOT_Gate is
    Port (
        A : in STD_LOGIC;  -- Input A
        Y : out STD_LOGIC  -- Output Y (NOT A)
    );
end NOT_Gate;
architecture Behavioral of NOT_Gate is
begin
    Y <= NOT A;
end Behavioral;
