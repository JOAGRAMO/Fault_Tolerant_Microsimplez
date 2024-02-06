--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//// 																                                       ////
--//// This file is part of the Fasult-Tolerant Microprocessor project	                                   ////
--//// https://opencores.org/websvn/listing/fault-tolerant_microprocessor/fault-tolerant_microprocessor	   ////
--//// 																                                       ////
--//// Description 													                                       ////
--//// Implementation of the encoder for the FUEC-QUAEC Error Correction code.                             ////
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
   port(datain  : in std_logic_vector(15 downto 0);
        dataout : out std_logic_vector(24 downto 0)
        );
end; --entity EncoderFUEC1


architecture comportamental of Encoder is
 
begin
  
dataout(0) <= datain(0) XOR datain(4) XOR datain(5) XOR datain(6) XOR datain(7);
dataout(1) <= datain(1) XOR datain(5) XOR datain(9) XOR datain(10) XOR datain(14);
dataout(2) <= datain(2) XOR datain(6) XOR datain(8) XOR datain(11) XOR datain(15);
dataout(3) <= datain(3) XOR datain(7) XOR datain(11) XOR datain(12);
dataout(4) <= datain(0) XOR datain(5) XOR datain(10) XOR datain(13) XOR datain(15);
dataout(5) <= datain(1) XOR datain(6) XOR datain(10) XOR datain(13);
dataout(6) <= datain(2) XOR datain(7) XOR datain(10) XOR datain(11) XOR datain(15);
dataout(7) <= datain(3) XOR datain(8) XOR datain(12) XOR datain(14);
dataout(8) <= datain(4) XOR datain(9) XOR datain(12) XOR datain(13);
dataout(9) <= datain(0);
dataout(10) <= datain(1);
dataout(11) <= datain(2);
dataout(12) <= datain(3);
dataout(13) <= datain(4);
dataout(14) <= datain(5);
dataout(15) <= datain(6);
dataout(16) <= datain(7);
dataout(17) <= datain(8);
dataout(18) <= datain(9);
dataout(19) <= datain(10);
dataout(20) <= datain(11);
dataout(21) <= datain(12);
dataout(22) <= datain(13);
dataout(23) <= datain(14);
dataout(24) <= datain(15);

end; --architecture comportamental
