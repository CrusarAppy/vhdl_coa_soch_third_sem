library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arithmetic_Unit_TB is
end Arithmetic_Unit_TB;

architecture Behavioral of Arithmetic_Unit_TB is
    component Arithmetic_Unit
        Port (
            clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            A, B : in STD_LOGIC_VECTOR(7 downto 0);
            op_sel : in STD_LOGIC_VECTOR(1 downto 0);
            signed_mode : in STD_LOGIC;
            result : out STD_LOGIC_VECTOR(15 downto 0);
            overflow : out STD_LOGIC;
            div_by_zero : out STD_LOGIC
        );
    end component;

    signal clk_tb, rst_tb, signed_mode_tb : STD_LOGIC := '0';
    signal A_tb, B_tb : STD_LOGIC_VECTOR(7 downto 0);
    signal op_sel_tb : STD_LOGIC_VECTOR(1 downto 0);
    signal result_tb : STD_LOGIC_VECTOR(15 downto 0);
    signal overflow_tb, div_by_zero_tb : STD_LOGIC;

    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: Arithmetic_Unit
        port map (
            clk => clk_tb,
            rst => rst_tb,
            A => A_tb,
            B => B_tb,
            op_sel => op_sel_tb,
            signed_mode => signed_mode_tb,
            result => result_tb,
            overflow => overflow_tb,
            div_by_zero => div_by_zero_tb
        );

    -- Clock Process
    clk_process: process
    begin
        while now < 200 ns loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
        wait;
    end process;

    -- Test Cases
    stimulus_process: process
    begin
        rst_tb <= '1';
        wait for 20 ns;
        rst_tb <= '0';

        -- Unsigned Addition Overflow (255 + 1)
        A_tb <= "11111111"; -- 255
        B_tb <= "00000001"; -- 1
        op_sel_tb <= "00";
        signed_mode_tb <= '0';
        wait for 20 ns;

        -- Signed Subtraction Overflow (-128 - 1)
        A_tb <= "10000000"; -- -128 (Two's complement)
        B_tb <= "00000001"; -- 1
        op_sel_tb <= "01";
        signed_mode_tb <= '1';
        wait for 20 ns;

        wait;
    end process;

end Behavioral;
