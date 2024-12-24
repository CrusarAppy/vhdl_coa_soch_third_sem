library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_NAND_Gate is
end tb_NAND_Gate;

architecture Behavioral of tb_NAND_Gate is
    -- Signals to connect to the DUT (Design Under Test)
    signal A, B, Y : STD_LOGIC;
begin
    -- Instantiate the NAND Gate
    UUT: entity work.NAND_Gate
        port map (
            A => A,
            B => B,
            Y => Y
        );

    -- Stimulus Process
    process
    begin
        -- Test case 1: A=0, B=0, Expected Y=1
        A <= '0'; B <= '0';
        wait for 10 ns;

        -- Test case 2: A=0, B=1, Expected Y=1
        A <= '0'; B <= '1';
        wait for 10 ns;

        -- Test case 3: A=1, B=0, Expected Y=1
        A <= '1'; B <= '0';
        wait for 10 ns;

        -- Test case 4: A=1, B=1, Expected Y=0
        A <= '1'; B <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;

