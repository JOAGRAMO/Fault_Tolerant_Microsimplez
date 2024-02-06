--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//// 																                                       ////
--//// This file is part of the Fasult-Tolerant Microprocessor project	                                   ////
--//// https://opencores.org/websvn/listing/fault-tolerant_microprocessor/fault-tolerant_microprocessor	   ////
--//// 																                                       ////
--//// Description 													                                       ////
--//// Implementation of the decoder for the FUEC-QUAEC Error Correction code.                             ////
--//// 																                                       ////
--//// Author(s): 													                                       ////
--//// - J. Gracia-Morán,  designer			                                                               ////
--//// - L.J. Saiz-Adalid, designer		                                                                   ////
--//// 																                                       ////
--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//// 																////
--//// Copyright (C) 2024 Authors and OPENCORES.ORG 				////
--//// 																////
--//// This source file may be used and distributed without 		////
--//// restriction provided that this copyright statement is not 	////
--//// removed from the file and that any derivative work contains	////
--//// the original copyright notice and the associated disclaimer.	////
--//// 																////
--//// This source file is free software; you can redistribute it 	////
--//// and/or modify it under the terms of the GNU Lesser General 	////
--//// Public License as published by the Free Software Foundation;	////
--//// either version 2.1 of the License, or (at your option) any 	////
--//// later version. 												////
--//// 																////
--//// This source is distributed in the hope that it will be 		////
--//// useful, but WITHOUT ANY WARRANTY; without even the implied 	////
--//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR 		////
--//// PURPOSE. See the GNU Lesser General Public License for more	////
--//// details. 													////
--//// 																////
--//// You should have received a copy of the GNU Lesser General 	////
--//// Public License along with this source; if not, download it 	////
--//// from http://www.opencores.org/lgpl.shtml 					////
--//// 																////
--//////////////////////////////////////////////////////////////////////

---------------------------------------------------------------------
-- TITLE: DECODER 
-- AUTHOR: J. Gracia-Morán
-- FILENAME: Decoder.vhd
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Decoder is
	  port(enc      : in std_logic_vector(24 downto 0);
           dato_sal : out std_logic_vector(15 downto 0)
        );
end;


architecture comportamental of Decoder is
  signal o : std_logic_vector(24 downto 0);
  signal sindrome : std_logic_vector(0 to 8);
begin

sindrome(0) <= enc(0) XOR enc(9) XOR enc(13) XOR enc(14) XOR enc(15) XOR enc(16);
sindrome(1) <= enc(1) XOR enc(10) XOR enc(14) XOR enc(18) XOR enc(19) XOR enc(23);
sindrome(2) <= enc(2) XOR enc(11) XOR enc(15) XOR enc(17) XOR enc(20) XOR enc(24);
sindrome(3) <= enc(3) XOR enc(12) XOR enc(16) XOR enc(20) XOR enc(21);
sindrome(4) <= enc(4) XOR enc(9) XOR enc(14) XOR enc(19) XOR enc(22) XOR enc(24);
sindrome(5) <= enc(5) XOR enc(10) XOR enc(15) XOR enc(19) XOR enc(22);
sindrome(6) <= enc(6) XOR enc(11) XOR enc(16) XOR enc(19) XOR enc(20) XOR enc(24);
sindrome(7) <= enc(7) XOR enc(12) XOR enc(17) XOR enc(21) XOR enc(23);
sindrome(8) <= enc(8) XOR enc(13) XOR enc(18) XOR enc(21) XOR enc(22);

o(24) <= (sindrome(8) and not sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(0)) or 
        (sindrome(6) and not sindrome(5) and sindrome(4) and sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(6) and not sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and not sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(5) and sindrome(3) and sindrome(2) and not sindrome(1) and not sindrome(0));
o(23) <= (sindrome(7) and not sindrome(5) and not sindrome(3) and not sindrome(2) and sindrome(1)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(2) and sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and not sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(7) and sindrome(6) and sindrome(5) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(5) and sindrome(4) and not sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0));
o(22) <= (not sindrome(8) and sindrome(7) and sindrome(6) and sindrome(5) and sindrome(2) and not sindrome(1)) or 
        (sindrome(8) and not sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(4) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and sindrome(7) and sindrome(6) and sindrome(5) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and not sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(5) and sindrome(2) and not sindrome(1) and not sindrome(0));
o(21) <= (not sindrome(8) and sindrome(7) and not sindrome(4) and not sindrome(3) and sindrome(2) and sindrome(1)) or 
        (sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(2) and sindrome(1)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(0)) or 
        (sindrome(7) and not sindrome(6) and sindrome(4) and not sindrome(3) and sindrome(2) and not sindrome(0)) or 
        (sindrome(7) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(2) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(4) and sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(5) and sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(7) and not sindrome(5) and sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(5) and sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0));
o(20) <= (sindrome(7) and sindrome(6) and not sindrome(5) and sindrome(3) and not sindrome(2) and not sindrome(1)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2)) or 
        (sindrome(7) and sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(2)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(2) and sindrome(1)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(2) and sindrome(1)) or 
        (sindrome(8) and sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(4) and sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and sindrome(4) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0));
o(19) <= (sindrome(6) and not sindrome(3) and not sindrome(2) and sindrome(1)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(6) and sindrome(3) and sindrome(2)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and sindrome(4) and not sindrome(1)) or 
        (sindrome(7) and not sindrome(6) and sindrome(4) and sindrome(2) and not sindrome(1)) or 
        (not sindrome(7) and sindrome(5) and sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(7) and sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(2) and sindrome(1)) or 
        (sindrome(7) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and sindrome(4) and not sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and not sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and sindrome(5) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0));
o(18) <= (sindrome(8) and not sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(1)) or 
        (sindrome(8) and not sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(1)) or 
        (sindrome(7) and not sindrome(6) and sindrome(4) and sindrome(2) and not sindrome(1)) or 
        (sindrome(7) and not sindrome(4) and not sindrome(3) and sindrome(1) and sindrome(0)) or 
        (sindrome(8) and sindrome(6) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(1)) or 
        (sindrome(7) and sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(1)) or 
        (sindrome(8) and not sindrome(6) and not sindrome(4) and not sindrome(3) and sindrome(2) and sindrome(1)) or 
        (sindrome(8) and sindrome(6) and not sindrome(4) and sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and sindrome(4) and not sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and not sindrome(5) and sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(1) and not sindrome(0));
o(17) <= (sindrome(7) and not sindrome(4) and not sindrome(3) and sindrome(0)) or 
        (sindrome(8) and sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(1)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and sindrome(4) and not sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and not sindrome(4) and sindrome(2) and sindrome(0)) or 
        (sindrome(7) and sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(2) and not sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(4) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and sindrome(4) and sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and not sindrome(4) and sindrome(2) and not sindrome(1) and not sindrome(0));
o(16) <= (not sindrome(8) and sindrome(6) and not sindrome(4) and sindrome(0)) or 
        (not sindrome(7) and sindrome(4) and sindrome(3) and sindrome(0)) or 
        (sindrome(8) and not sindrome(5) and sindrome(1) and sindrome(0)) or 
        (sindrome(8) and sindrome(5) and not sindrome(1) and sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and sindrome(5) and sindrome(3) and sindrome(1)) or 
        (sindrome(8) and not sindrome(7) and sindrome(3) and not sindrome(2) and not sindrome(1)) or 
        (sindrome(7) and sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(3) and not sindrome(2)) or 
        (not sindrome(8) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and sindrome(4) and sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(1)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and sindrome(3) and sindrome(2) and sindrome(1) and sindrome(0));
o(15) <= (sindrome(7) and not sindrome(4) and not sindrome(3) and sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(6) and not sindrome(3) and sindrome(2)) or 
        (sindrome(8) and not sindrome(7) and sindrome(5) and sindrome(3) and sindrome(1)) or 
        (not sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(2) and sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (sindrome(7) and not sindrome(6) and sindrome(3) and sindrome(2) and not sindrome(0)) or 
        (sindrome(7) and sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(3) and not sindrome(2)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(1)) or 
        (not sindrome(8) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0));
o(14) <= (not sindrome(5) and sindrome(4) and sindrome(1) and sindrome(0)) or 
        (sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(3) and sindrome(1)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(1)) or 
        (not sindrome(8) and sindrome(6) and sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(1)) or 
        (sindrome(8) and not sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0));
o(13) <= (sindrome(8) and sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(1)) or 
        (sindrome(8) and sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(1)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(4) and sindrome(2) and sindrome(0)) or 
        (sindrome(7) and not sindrome(4) and sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(8) and sindrome(5) and sindrome(3) and sindrome(1) and sindrome(0)) or 
        (sindrome(8) and sindrome(4) and sindrome(3) and sindrome(1) and sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(4) and not sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and sindrome(4) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (sindrome(8) and not sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(1) and not sindrome(0));
o(12) <= (sindrome(7) and not sindrome(6) and sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(8) and sindrome(7) and not sindrome(5) and sindrome(4) and sindrome(1)) or 
        (sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(1)) or 
        (not sindrome(8) and sindrome(7) and not sindrome(6) and not sindrome(4) and sindrome(3) and not sindrome(1)) or 
        (sindrome(8) and sindrome(7) and not sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(1)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and sindrome(2) and sindrome(1) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(5) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(1) and not sindrome(0));
o(11) <= (sindrome(6) and not sindrome(3) and sindrome(2) and sindrome(0)) or 
        (sindrome(7) and sindrome(6) and sindrome(4) and sindrome(2) and sindrome(0)) or 
        (sindrome(8) and not sindrome(5) and sindrome(2) and not sindrome(1) and sindrome(0)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(1)) or 
        (not sindrome(7) and sindrome(6) and sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(1)) or 
        (sindrome(7) and sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and sindrome(1)) or 
        (not sindrome(7) and sindrome(6) and not sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(2) and not sindrome(1)) or 
        (sindrome(8) and sindrome(7) and not sindrome(5) and sindrome(3) and sindrome(2) and sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(2) and not sindrome(1) and not sindrome(0));
o(10) <= (sindrome(6) and sindrome(5) and not sindrome(3) and sindrome(0)) or 
        (not sindrome(6) and sindrome(5) and not sindrome(4) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(7) and not sindrome(6) and sindrome(5) and not sindrome(3) and not sindrome(2) and sindrome(1)) or 
        (sindrome(8) and sindrome(7) and sindrome(5) and not sindrome(4) and sindrome(3) and sindrome(0)) or 
        (sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(2) and sindrome(0)) or 
        (not sindrome(7) and sindrome(5) and not sindrome(4) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and sindrome(5) and sindrome(3) and sindrome(2) and sindrome(1));
o( 9) <= (not sindrome(5) and sindrome(4) and not sindrome(1) and sindrome(0)) or 
        (sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(3) and sindrome(0)) or 
        (sindrome(5) and sindrome(4) and not sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(7) and not sindrome(6) and sindrome(5) and sindrome(4) and not sindrome(2) and sindrome(0)) or 
        (not sindrome(8) and sindrome(7) and sindrome(6) and sindrome(5) and sindrome(4) and sindrome(3) and sindrome(2));
o( 8) <= (sindrome(8) and not sindrome(7) and sindrome(5) and not sindrome(3) and sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and sindrome(6) and sindrome(4) and not sindrome(3) and sindrome(0)) or 
        (sindrome(8) and sindrome(4) and not sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(8) and sindrome(5) and not sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(7) and not sindrome(5) and not sindrome(3) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(8) and not sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(1) and not sindrome(0));
o( 7) <= (sindrome(7) and sindrome(4) and not sindrome(3) and not sindrome(2) and sindrome(0)) or 
        (sindrome(7) and not sindrome(3) and not sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and sindrome(5) and not sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(0));
o( 6) <= (sindrome(7) and sindrome(6) and not sindrome(3) and not sindrome(2)) or 
        (sindrome(6) and not sindrome(5) and not sindrome(3) and not sindrome(2) and not sindrome(1)) or 
        (sindrome(6) and not sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(1)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(6) and not sindrome(2) and not sindrome(1) and not sindrome(0));
o( 5) <= (not sindrome(8) and not sindrome(7) and sindrome(5) and not sindrome(2) and not sindrome(1)) or 
        (not sindrome(7) and sindrome(5) and not sindrome(4) and not sindrome(2) and not sindrome(1)) or 
        (not sindrome(8) and not sindrome(7) and not sindrome(6) and sindrome(5) and not sindrome(1) and not sindrome(0)) or 
        (sindrome(7) and sindrome(5) and not sindrome(3) and not sindrome(2) and not sindrome(1) and not sindrome(0));
o( 4) <= (not sindrome(8) and not sindrome(7) and sindrome(5) and sindrome(4) and not sindrome(1)) or 
        (not sindrome(8) and not sindrome(6) and not sindrome(5) and sindrome(4) and not sindrome(0)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(4) and not sindrome(2) and not sindrome(1) and not sindrome(0)) or 
        (not sindrome(8) and sindrome(4) and not sindrome(3) and not sindrome(2) and not sindrome(1) and not sindrome(0));
o( 3) <= (not sindrome(8) and not sindrome(7) and not sindrome(6) and not sindrome(5) and sindrome(3)) or 
        (not sindrome(8) and not sindrome(7) and not sindrome(6) and sindrome(3) and not sindrome(1)) or 
        (not sindrome(8) and not sindrome(7) and sindrome(3) and not sindrome(2) and not sindrome(1) and not sindrome(0));
o( 2) <= (not sindrome(8) and not sindrome(7) and not sindrome(6) and not sindrome(5) and sindrome(2)) or 
        (not sindrome(8) and not sindrome(7) and not sindrome(6) and sindrome(2) and not sindrome(1) and not sindrome(0));
o( 1) <= (not sindrome(8) and not sindrome(7) and not sindrome(5) and not sindrome(4) and sindrome(1)) or 
        (not sindrome(8) and not sindrome(7) and not sindrome(6) and not sindrome(5) and sindrome(1) and not sindrome(0));
o( 0) <= (not sindrome(8) and not sindrome(6) and not sindrome(5) and not sindrome(4) and sindrome(0));

dato_sal( 0) <= enc( 9) XOR o( 9);
dato_sal( 1) <= enc(10) XOR o(10);
dato_sal( 2) <= enc(11) XOR o(11);
dato_sal( 3) <= enc(12) XOR o(12);
dato_sal( 4) <= enc(13) XOR o(13);
dato_sal( 5) <= enc(14) XOR o(14);
dato_sal( 6) <= enc(15) XOR o(15);
dato_sal( 7) <= enc(16) XOR o(16);
dato_sal( 8) <= enc(17) XOR o(17);
dato_sal( 9) <= enc(18) XOR o(18);
dato_sal(10) <= enc(19) XOR o(19);
dato_sal(11) <= enc(20) XOR o(20);
dato_sal(12) <= enc(21) XOR o(21);
dato_sal(13) <= enc(22) XOR o(22);
dato_sal(14) <= enc(23) XOR o(23);
dato_sal(15) <= enc(24) XOR o(24);

end; --architecture comportamental
