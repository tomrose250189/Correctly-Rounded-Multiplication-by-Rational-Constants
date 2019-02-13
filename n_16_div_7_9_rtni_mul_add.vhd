library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity n_16_div_7_9_rtni_mul_add is
   port (
      x : in std_logic_vector(15 downto 0);
      
      y : out std_logic_vector(15 downto 0)
   );
end entity n_16_div_7_9_rtni_mul_add;

architecture rtl of n_16_div_7_9_rtni_mul_add is

   signal y_ext : unsigned(32 downto 0);

begin
   
   y_ext <= unsigned(x)*unsigned' ("11000111000111001");
   y <= std_logic_vector(y_ext(32 downto 17));
   
end architecture rtl;
