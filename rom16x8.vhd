library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity rom16x8 is
    port (
        addr : in  std_logic_vector(3 downto 0);
        dout : out std_logic_vector(7 downto 0)
    );
end rom16x8;

architecture Behavioral of rom16x8 is

    -- 16 posiciones de 8 bits.
    type data_array is array (0 to 15)
        of std_logic_vector(7 downto 0);

    -- Contenido fijo de la ROM.
    constant rom_c : data_array := (
        x"00", x"01", x"11", x"AA",
        x"BB", x"DD", x"44", x"00",
        x"BB", x"DD", x"44", x"00",
        x"BB", x"DD", x"44", x"00"
    );

begin

    -- Lectura sin esperar un reloj.
    dout <= rom_c(to_integer(unsigned(addr)));

end Behavioral;
