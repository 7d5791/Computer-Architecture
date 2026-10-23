library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_rom16x8 is
end tb_rom16x8;

architecture Behavioral of tb_rom16x8 is

    -- Declaración del componente.
    component rom16x8 is
        port (
            addr : in  std_logic_vector(3 downto 0);
            dout : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Señales del testbench.
    signal addr_s : std_logic_vector(3 downto 0) := "0000";
    signal dout_s : std_logic_vector(7 downto 0);

begin

    -- Instancia y conexión de la memoria.
    uut : rom16x8
        port map (
            addr => addr_s,
            dout => dout_s
        );

    -- Estímulos.
    estimulos : process
    begin

        -- 0 ns: leer dirección 0.
        -- Salida esperada: 00.
        addr_s <= "0000";
        wait for 10 ns;

        -- 10 ns: leer dirección 1.
        -- Salida esperada: 01.
        addr_s <= "0001";
        wait for 10 ns;

        -- 20 ns: leer dirección 3.
        -- Salida esperada: AA.
        addr_s <= "0011";
        wait for 10 ns;

        -- 30 ns: leer dirección 4.
        -- Salida esperada: BB.
        addr_s <= "0100";
        wait for 10 ns;

        -- 40 ns: leer dirección 5.
        -- Salida esperada: DD.
        addr_s <= "0101";
        wait for 10 ns;

        -- 50 ns: leer dirección 6.
        -- Salida esperada: 44.
        addr_s <= "0110";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
