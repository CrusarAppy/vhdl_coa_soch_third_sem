library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
	Port(
		A : in STD_LOGIC;
		B : in STD_LOGIC;
		Cin : in STD_LOGIC;
		Sum : out STD_LOGIC;
		Carry : out STD_LOGIC
	);

end fulladder;

architecture logic_full_adder of fulladder is 
	begin
		Sum <= A xor B xor Cin;
		Carry <= (A and B) or (B and Cin) or (A and Cin);
end logic_full_adder;
