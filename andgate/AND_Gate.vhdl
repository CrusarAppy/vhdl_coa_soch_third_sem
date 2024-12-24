library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Entity Declaration
entity AND_Gate is
    Port (
        A : in STD_LOGIC;  -- Input A
        B : in STD_LOGIC;  -- Input B
        Y : out STD_LOGIC  -- Output Y
    );
end AND_Gate;

-- Architecture Definition
architecture Behavioral of AND_Gate is
begin
    -- Logic for AND Gate
    Y <= A AND B;
end Behavioral;
