----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/08/2023 09:53:30 PM
-- Design Name: 
-- Module Name: inc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_1164.ALL;
package mypack is
 type myarray is array (NATURAL range <>) of bit; 
 function "+"(x:myarray) return myarray;
end package mypack;
 
package body mypack is
 function "+"(x:myarray) return myarray is
  variable carry: bit:='1';
  variable z: myarray(x'length-1 downto 0);
  begin
   for k in 0 to x'length-1 loop
    z(k) := x(k) xor carry;    -- you can derive these by making a truth table
    carry :=  carry and x(k);  -- and then extrapolating to generic n-bits
   end loop;  
  return z;
 end "+"; 
end mypack;

use work.mypack.all;

entity inc is port(
  i: in  myarray(63 downto 0);
  j: out myarray(63 downto 0)  ); 

end inc;

architecture Behavioral of inc is

begin
 j <=  +i ;

end Behavioral;
