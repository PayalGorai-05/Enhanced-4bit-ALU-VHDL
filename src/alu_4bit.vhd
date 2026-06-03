library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu_4bit is
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        SEL   : in  STD_LOGIC_VECTOR(2 downto 0);

        Y     : out STD_LOGIC_VECTOR(3 downto 0);
        COUT  : out STD_LOGIC;
        ZERO  : out STD_LOGIC
    );
end alu_4bit;

architecture Behavioral of alu_4bit is

signal temp : UNSIGNED(4 downto 0);

begin

process(A, B, SEL)

variable a_var : UNSIGNED(4 downto 0);
variable b_var : UNSIGNED(4 downto 0);

begin

    a_var := '0' & UNSIGNED(A);
    b_var := '0' & UNSIGNED(B);

    case SEL is

        -- ADD
        when "000" =>
            temp <= a_var + b_var;

        -- SUB
        when "001" =>
            temp <= a_var - b_var;

        -- AND
        when "010" =>
            temp <= UNSIGNED('0' & (A and B));

        -- OR
        when "011" =>
            temp <= UNSIGNED('0' & (A or B));

        -- XOR
        when "100" =>
            temp <= UNSIGNED('0' & (A xor B));

        -- SHIFT LEFT
        when "101" =>
            temp <= shift_left(a_var, 1);

        -- SHIFT RIGHT
        when "110" =>
            temp <= shift_right(a_var, 1);

        -- DEFAULT
        when others =>
            temp <= (others => '0');

    end case;

end process;

Y <= STD_LOGIC_VECTOR(temp(3 downto 0));

COUT <= temp(4);

ZERO <= '1' when temp(3 downto 0) = "0000"
        else '0';

end Behavioral;