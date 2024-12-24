library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench Entity
entity TB_AND_Gate is
end TB_AND_Gate;

-- Testbench Architecture
architecture Behavioral of TB_AND_Gate is
    -- Component Declaration
    component AND_Gate
        Port (
            A : in STD_LOGIC;
            B : in STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    -- Signals to Connect to the DUT
    signal A : STD_LOGIC := '0';
    signal B : STD_LOGIC := '0';
    signal Y : STD_LOGIC;

begin
    -- Instantiate the AND Gate
    DUT: AND_Gate Port map (
        A => A,
        B => B,
        Y => Y
    );

    -- Stimulus Process
    stimulus: process
    begin
        -- Test Case 1: A=0, B=0
        A <= '0';
        B <= '0';
        wait for 10 ns;

        -- Test Case 2: A=0, B=1
        A <= '0';
        B <= '1';
        wait for 10 ns;

        -- Test Case 3: A=1, B=0
        A <= '1';
        B <= '0';
        wait for 10 ns;

        -- Test Case 4: A=1, B=1
        A <= '1';
        B <= '1';
        wait for 10 ns;

        -- End Simulation
        wait;
    end process;
end Behavioral;
