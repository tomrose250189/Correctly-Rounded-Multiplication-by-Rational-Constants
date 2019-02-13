library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_16_div_7_9_rtni_csd_trunc is
   port (
      x : in std_logic_vector(15 downto 0);
      
      y : out std_logic_vector(15 downto 0)
   );
end entity n_16_div_7_9_rtni_csd_trunc;

architecture rtl of n_16_div_7_9_rtni_csd_trunc is
   
   signal not_x : unsigned(15 downto 0);
   signal y_ext : unsigned(20 downto 0);

begin
   
   not_x <= unsigned(not(x));
   
   y_ext <=   unsigned(x&"00000") 
            + unsigned(not_x&"000") 
            + unsigned(x) 
            + unsigned(not_x(15 downto 3)) 
            + unsigned(x(15 downto 6)) 
            + unsigned(not_x(15 downto 9)) 
            + unsigned(x(15 downto 12))
            + unsigned' ('0'&not_x(15)) 
            - unsigned' ("10000010000001110110");
   
   y <= std_logic_vector(y_ext(20 downto 5));
   
end architecture rtl;
