library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_full_adder is
    -- No ports in a testbench
end tb_full_adder;

architecture Behavioral of tb_full_adder is
    -- Component declaration of the full adder
    component fulladder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Carry : out STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal A, B, Cin, Sum, Carry : STD_LOGIC;

begin
    -- Instantiate the full adder
    UUT: fulladder
        Port map (
            A => A,
            B => B,
            Cin => Cin,
            Sum => Sum,
            Carry => Carry
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Test case 1: A=0, B=0, Cin=0
        A <= '0'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Test case 2: A=0, B=0, Cin=1
        A <= '0'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- Test case 3: A=0, B=1, Cin=0
        A <= '0'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- Test case 4: A=0, B=1, Cin=1
        A <= '0'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- Test case 5: A=1, B=0, Cin=0
        A <= '1'; B <= '0'; Cin <= '0';
        wait for 10 ns;

        -- Test case 6: A=1, B=0, Cin=1
        A <= '1'; B <= '0'; Cin <= '1';
        wait for 10 ns;

        -- Test case 7: A=1, B=1, Cin=0
        A <= '1'; B <= '1'; Cin <= '0';
        wait for 10 ns;

        -- Test case 8: A=1, B=1, Cin=1
        A <= '1'; B <= '1'; Cin <= '1';
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
