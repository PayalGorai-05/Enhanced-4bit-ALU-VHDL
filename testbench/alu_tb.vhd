library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_tb is
end alu_tb;

architecture Behavioral of alu_tb is

component alu_4bit
    Port (
        A     : in  STD_LOGIC_VECTOR(3 downto 0);
        B     : in  STD_LOGIC_VECTOR(3 downto 0);
        SEL   : in  STD_LOGIC_VECTOR(2 downto 0);

        Y     : out STD_LOGIC_VECTOR(3 downto 0);
        COUT  : out STD_LOGIC;
        ZERO  : out STD_LOGIC
    );
end component;

signal A     : STD_LOGIC_VECTOR(3 downto 0);
signal B     : STD_LOGIC_VECTOR(3 downto 0);
signal SEL   : STD_LOGIC_VECTOR(2 downto 0);

signal Y     : STD_LOGIC_VECTOR(3 downto 0);
signal COUT  : STD_LOGIC;
signal ZERO  : STD_LOGIC;

begin

uut: alu_4bit
port map (
    A => A,
    B => B,
    SEL => SEL,
    Y => Y,
    COUT => COUT,
    ZERO => ZERO
);

process
begin

    A <= "0111";   -- 7
    B <= "0100";   -- 4

    -- ADD
    SEL <= "000";
    wait for 20 ns;

    -- SUB
    SEL <= "001";
    wait for 20 ns;

    -- AND
    SEL <= "010";
    wait for 20 ns;

    -- OR
    SEL <= "011";
    wait for 20 ns;

    -- XOR
    SEL <= "100";
    wait for 20 ns;

    -- SHIFT LEFT
    SEL <= "101";
    wait for 20 ns;

    -- SHIFT RIGHT
    SEL <= "110";
    wait for 20 ns;

    wait;

end process;

end Behavioral;