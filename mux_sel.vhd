--biblioteca
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--entidade
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux_sel is
    
    port(
        mux_in_a : in unsigned (3 downto 0);
        mux_in_b : in unsigned (3 downto 0);
        mux_out : out unsigned (3 downto 0);
        
        mux_sel : in std_logic
    );
end entity mux_sel;

--arquitetura
--architecture RTL of entityName is
architecture RTL of mux_sel is 
begin
    with mux_sel select
    mux_out <=  mux_in_a when '0',
                mux_in_b when others;
    
end architecture RTL;
