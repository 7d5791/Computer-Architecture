library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram16x8 is
    port (
        clk  : in  std_logic;
        addr : in  std_logic_vector(3 downto 0);
        din  : in  std_logic_vector(7 downto 0);
        we   : in  std_logic;
        dout : out std_logic_vector(7 downto 0)
    );
end ram16x8;

architecture Behavioral of ram16x8 is

    -- 16 posiciones de 8 bits.
    type data_array is array (0 to 15)
        of std_logic_vector(7 downto 0);

    -- Contenido inicial.
    signal ram_s : data_array := (
        x"00", x"01", x"11", x"AA",
        x"BB", x"DD", x"44", x"00",
        x"BB", x"DD", x"44", x"00",
        x"BB", x"DD", x"44", x"00"
    );

begin

    -- Escritura en el flanco ascendente del reloj.
    process(clk)
    begin
        if rising_edge(clk) then
            if we = '1' then
                ram_s(to_integer(unsigned(addr))) <= din;
            end if;
        end if;
    end process;

    -- Lectura sin esperar al reloj.
    dout <= ram_s(to_integer(unsigned(addr)));

end Behavioral;
