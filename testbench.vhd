library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is

end entity testbench;

architecture RTL of testbench is
    signal muxt_in_a : unsigned (3 downto 0);
    signal muxt_in_b : unsigned (3 downto 0);
    signal muxt_out :  unsigned (3 downto 0);
    --um fio pra cada saída
    signal muxt_sel_0 :  std_logic;
    signal muxt_sel_1 :  std_logic;
    
begin
    dut_when: entity work.mux_when
        port map(
        --esqerda mux >> direita testbench
        mux_in_a => muxt_in_a,
        mux_in_b => muxt_in_b,
        mux_out => muxt_out,
        --um fio diferente pra cada processo (pra nao causar curto no outro processo nesse caso)
        mux_sel => muxt_sel_0  
        );
        
    process
    begin
        muxt_sel_0 <= '0';
        wait for 10 ns;
        muxt_sel_0 <= '1';

   
        wait;
        
    end process;
    
   
    process
    begin
        --seleção de fio/envio de informação
        
        muxt_in_a <= "0001";
        muxt_in_b <= "0101";
        wait for 15 ns;
        
        muxt_in_a <= "0101";
        muxt_in_b <= "0001";
        wait;
        
    end process;
    
    --dut é um objeto - instância do tipo sel
    dut_sel:entity work.mux_sel
        port map(
            mux_in_a => muxt_in_a,
            mux_in_b => muxt_in_b,
            mux_out  => muxt_out,
            mux_sel  => muxt_sel_1
        );
        

    process
    begin
        muxt_sel_1 <= '0';
        wait for 10 ns;
        muxt_sel_1 <= '1';
        wait;
        
    end process;
        
end architecture RTL;