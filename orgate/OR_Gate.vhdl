library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_Gate is
    Port (
        A : in STD_LOGIC;  -- Input A
        B : in STD_LOGIC;  -- Input B
        Y : out STD_LOGIC  -- Output Y (A OR B)
    );
end OR_Gate;

architecture Behavioral of OR_Gate is
begin
    Y <= A OR B;
end Behavioral;
