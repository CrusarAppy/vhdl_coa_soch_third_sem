library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_NOT_Gate is
end tb_NOT_Gate;

architecture Behavioral of tb_NOT_Gate is
    -- Signal to connect to the DUT (Design Under Test)
    signal A, Y : STD_LOGIC;
begin
    -- Instantiate the NOT Gate
    UUT: entity work.NOT_Gate
        port map (
            A => A,
            Y => Y
        );

    -- Stimulus Process
    process
    begin
        -- Test case 1: A=0, Expected Y=1
        A <= '0';
        wait for 10 ns;

        -- Test case 2: A=1, Expected Y=0
        A <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process;
end Behavioral;
