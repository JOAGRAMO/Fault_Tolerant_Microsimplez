--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//// 																                                       ////
--//// This file is part of the Fasult-Tolerant Microprocessor project	                                   ////
--//// https://opencores.org/websvn/listing/fault-tolerant_microprocessor/fault-tolerant_microprocessor	   ////
--//// 																                                       ////
--//// Description 													                                       ////
--//// Implementation of the encoder for the SEC-2bBED Error Correction code.                              ////
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
-- TITLE: ENCODER 
-- AUTHOR: J. Gracia-Morán
-- FILENAME: Encoder.vhd
---------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Encoder is
   port(dec  : in std_logic_vector(15 downto 0);
        enc : out std_logic_vector(23 downto 0)
        );
end; --entity Encoder


architecture comportamental of Encoder is
 
begin
  
enc(0) <= dec(0) XOR dec(3) XOR dec(4) XOR dec(7) XOR dec(8) XOR dec(11) XOR dec(15);
enc(1) <= dec(1) XOR dec(4) XOR dec(5) XOR dec(8) XOR dec(9) XOR dec(12) XOR dec(13);
enc(2) <= dec(2) XOR dec(5) XOR dec(9) XOR dec(10) XOR dec(12);
enc(3) <= dec(6) XOR dec(10) XOR dec(14) XOR dec(15);
enc(4) <= dec(0) XOR dec(4) XOR dec(8) XOR dec(9) XOR dec(13) XOR dec(14) XOR dec(15);
enc(5) <= dec(1) XOR dec(5) XOR dec(9) XOR dec(11) XOR dec(12) XOR dec(13) XOR dec(14);
enc(6) <= dec(2) XOR dec(7) XOR dec(9) XOR dec(10) XOR dec(11) XOR dec(14);
enc(7) <= dec(3) XOR dec(6) XOR dec(8) XOR dec(12) XOR dec(14);
enc(8) <= dec(0);
enc(9) <= dec(1);
enc(10) <= dec(2);
enc(11) <= dec(3);
enc(12) <= dec(4);
enc(13) <= dec(5);
enc(14) <= dec(6);
enc(15) <= dec(7);
enc(16) <= dec(8);
enc(17) <= dec(9);
enc(18) <= dec(10);
enc(19) <= dec(11);
enc(20) <= dec(12);
enc(21) <= dec(13);
enc(22) <= dec(14);
enc(23) <= dec(15);
				   
end; --architecture comportamental
