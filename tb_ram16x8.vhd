library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_ram16x8 is
end tb_ram16x8;

architecture Behavioral of tb_ram16x8 is

    -- Declaración del componente.
    component ram16x8 is
        port (
            clk  : in  std_logic;
            addr : in  std_logic_vector(3 downto 0);
            din  : in  std_logic_vector(7 downto 0);
            we   : in  std_logic;
            dout : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Señales del testbench.
    signal clk_s  : std_logic := '0';
    signal addr_s : std_logic_vector(3 downto 0) := "0000";
    signal din_s  : std_logic_vector(7 downto 0) := x"00";
    signal we_s   : std_logic := '0';
    signal dout_s : std_logic_vector(7 downto 0);

begin

    -- Instancia y conexión de la memoria.
    uut : ram16x8
        port map (
            clk  => clk_s,
            addr => addr_s,
            din  => din_s,
            we   => we_s,
            dout => dout_s
        );

    -- Generador de reloj: período de 10 ns.
    reloj : process
    begin
        clk_s <= '0';
        wait for 5 ns;

        clk_s <= '1';
        wait for 5 ns;
    end process;

    -- Estímulos.
    estimulos : process
    begin

        -- 0 ns: leer dirección 0.
        -- Salida esperada: 00.
        addr_s <= "0000";
        we_s   <= '0';
        wait for 10 ns;

        -- 10 ns: leer dirección 3.
        -- Salida esperada: AA.
        addr_s <= "0011";
        wait for 10 ns;

        -- 20 ns: preparar escritura de 5A en dirección 3.
        -- Se escribe en el flanco ascendente de 25 ns.
        din_s <= x"5A";
        we_s  <= '1';
        wait for 10 ns;

        -- 30 ns: deshabilitar escritura.
        -- Salida esperada: 5A.
        we_s <= '0';
        wait for 10 ns;

        -- 40 ns: leer dirección 0.
        -- Salida esperada: 00.
        addr_s <= "0000";
        wait for 10 ns;

        -- 50 ns: leer nuevamente dirección 3.
        -- Salida esperada: 5A.
        addr_s <= "0011";
        wait for 10 ns;

        wait;
    end process;

end Behavioral;
