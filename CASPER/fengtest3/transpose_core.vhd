library IEEE;
use IEEE.std_logic_1164.all;

entity transpose_core is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    din: in std_logic_vector(127 downto 0); 
    fid: in std_logic_vector(2 downto 0); 
    mode: in std_logic_vector(1 downto 0); 
    sync: in std_logic; 
    tid: in std_logic_vector(1 downto 0); 
    dest: out std_logic_vector(7 downto 0); 
    dout: out std_logic_vector(63 downto 0); 
    eof: out std_logic; 
    valid: out std_logic
  );
end transpose_core;

architecture structural of transpose_core is
begin
end structural;

