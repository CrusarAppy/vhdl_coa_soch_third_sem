library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Arithmetic_Unit is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        A, B : in STD_LOGIC_VECTOR(7 downto 0); -- 8-bit operands
        op_sel : in STD_LOGIC_VECTOR(1 downto 0); -- Select operation (00: Add, 01: Sub, 10: Mul, 11: Div)
        signed_mode : in STD_LOGIC; -- 0 = Unsigned, 1 = Signed
        result : out STD_LOGIC_VECTOR(15 downto 0); -- 16-bit output (for multiplication)
        overflow : out STD_LOGIC; -- Overflow flag
        div_by_zero : out STD_LOGIC -- Division by zero flag
    );
end Arithmetic_Unit;

architecture Behavioral of Arithmetic_Unit is
    signal temp_result : STD_LOGIC_VECTOR(15 downto 0);
    signal signed_A, signed_B : SIGNED(7 downto 0);
    signal unsigned_A, unsigned_B : UNSIGNED(7 downto 0);
    signal sum, diff : STD_LOGIC_VECTOR(8 downto 0); -- 9-bit for overflow check
    signal mul_result : STD_LOGIC_VECTOR(15 downto 0);
    signal quotient, remainder : STD_LOGIC_VECTOR(7 downto 0);
    signal ovf : STD_LOGIC := '0';
    signal div_zero_flag : STD_LOGIC := '0';

begin
    process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                temp_result <= (others => '0');
                overflow <= '0';
                div_by_zero <= '0';
            else
                -- Select Data Representation Mode
                if signed_mode = '1' then
                    signed_A <= SIGNED(A);
                    signed_B <= SIGNED(B);
                else
                    unsigned_A <= UNSIGNED(A);
                    unsigned_B <= UNSIGNED(B);
                end if;

                -- Perform Arithmetic Operation
                case op_sel is
                    when "00" => -- ADD
                        if signed_mode = '1' then
                            sum <= STD_LOGIC_VECTOR(SIGNED('0' & A) + SIGNED('0' & B)); -- 9-bit sum
                            temp_result(7 downto 0) <= sum(7 downto 0);
                            ovf <= (A(7) and B(7) and not sum(7)) or (not A(7) and not B(7) and sum(7)); -- Overflow check for signed addition
                        else
                            sum <= ('0' & A) + ('0' & B); -- 9-bit for carry-out
                            temp_result(7 downto 0) <= sum(7 downto 0);
                            ovf <= sum(8); -- Overflow check for unsigned addition
                        end if;

                    when "01" => -- SUBTRACT
                        if signed_mode = '1' then
                            diff <= STD_LOGIC_VECTOR(SIGNED('0' & A) - SIGNED('0' & B));
                            temp_result(7 downto 0) <= diff(7 downto 0);
                            ovf <= (A(7) and not B(7) and not diff(7)) or (not A(7) and B(7) and diff(7)); -- Overflow check for signed subtraction
                        else
                            diff <= ('0' & A) - ('0' & B);
                            temp_result(7 downto 0) <= diff(7 downto 0);
                            ovf <= diff(8); -- Overflow check for unsigned subtraction
                        end if;

                    when "10" => -- MULTIPLY
                        mul_result <= A * B;
                        temp_result <= mul_result;
                        ovf <= '0'; -- No overflow handling in multiplication (handled in output width)

                    when "11" => -- DIVIDE
                        if B = "00000000" then
                            div_zero_flag <= '1'; -- Division by zero detected
                            temp_result(15 downto 0) <= (others => '0');
                        else
                            div_zero_flag <= '0';
                            quotient <= A / B;
                            remainder <= A mod B;
                            temp_result(7 downto 0) <= quotient;
                            temp_result(15 downto 8) <= remainder; -- Store remainder in upper 8 bits
                        end if;

                    when others => -- Default case
                        temp_result <= (others => '0');
                        ovf <= '0';
                        div_zero_flag <= '0';
                end case;
            end if;
        end if;
    end process;

    result <= temp_result;
    overflow <= ovf;
    div_by_zero <= div_zero_flag;

end Behavioral;
