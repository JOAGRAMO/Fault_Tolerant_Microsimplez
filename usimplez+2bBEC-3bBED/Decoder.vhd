--/////////////////////////////////////////////////////////////////////////////////////////////////////////////
--//// 																                                       ////
--//// This file is part of the Fasult-Tolerant Microprocessor project	                                   ////
--//// https://opencores.org/websvn/listing/fault-tolerant_microprocessor/fault-tolerant_microprocessor	   ////
--//// 																                                       ////
--//// Description 													                                       ////
--//// Implementation of the decoder for the 2bBEC-3bBED  Error Correction code.                           ////
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
--use work.mlite_pack.all;

entity Decoder is
	 port(enc : in std_logic_vector(23 downto 0);
          dec : out std_logic_vector(15 downto 0);
		  ErrD : out std_logic
    );
end; --entity decoder


architecture comportamental of Decoder is
 signal sindrome : std_logic_vector(7 downto 0);
 signal o : std_logic_vector(23 downto 8);


begin

sindrome(0) <= enc(0) XOR enc(8) XOR enc(11) XOR enc(12) XOR enc(15) XOR enc(16) XOR enc(19) XOR enc(23);
sindrome(1) <= enc(1) XOR enc(9) XOR enc(12) XOR enc(13) XOR enc(16) XOR enc(17) XOR enc(20) XOR enc(21);
sindrome(2) <= enc(2) XOR enc(10) XOR enc(13) XOR enc(17) XOR enc(18) XOR enc(20);
sindrome(3) <= enc(3) XOR enc(14) XOR enc(18) XOR enc(22) XOR enc(23);
sindrome(4) <= enc(4) XOR enc(8) XOR enc(12) XOR enc(16) XOR enc(17) XOR enc(21) XOR enc(22) XOR enc(23);
sindrome(5) <= enc(5) XOR enc(9) XOR enc(13) XOR enc(17) XOR enc(19) XOR enc(20) XOR enc(21) XOR enc(22);
sindrome(6) <= enc(6) XOR enc(10) XOR enc(15) XOR enc(17) XOR enc(18) XOR enc(19) XOR enc(22);
sindrome(7) <= enc(7) XOR enc(11) XOR enc(14) XOR enc(16) XOR enc(20) XOR enc(22);

o(23) <= (NOT sindrome(6) AND sindrome(3) AND NOT sindrome(2) AND sindrome(0)) OR (sindrome(7) AND sindrome(6) AND NOT sindrome(3) AND NOT sindrome(2) AND sindrome(0));
o(22) <= (sindrome(7) AND sindrome(5) AND NOT sindrome(2)) OR (sindrome(6) AND sindrome(3) AND NOT sindrome(2) AND NOT sindrome(0));
o(21) <= (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(4) AND sindrome(1) AND NOT sindrome(0)) OR (sindrome(7) AND sindrome(4) AND NOT sindrome(3) AND NOT sindrome(1) AND NOT sindrome(0)) OR (sindrome(5) AND sindrome(4) AND NOT sindrome(3) AND NOT sindrome(2) AND sindrome(1) AND NOT sindrome(0));
o(20) <= (sindrome(7) AND NOT sindrome(3) AND sindrome(2) AND sindrome(1)) OR (sindrome(7) AND NOT sindrome(3) AND sindrome(2) AND NOT sindrome(0));
o(19) <= (NOT sindrome(7) AND sindrome(5) AND NOT sindrome(4) AND sindrome(0)) OR (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(4) AND NOT sindrome(3) AND sindrome(1));
o(18) <= (NOT sindrome(7) AND sindrome(5) AND sindrome(3)) OR (sindrome(6) AND NOT sindrome(4) AND sindrome(3) AND NOT sindrome(1) AND NOT sindrome(0));
o(17) <= (NOT sindrome(7) AND sindrome(5) AND sindrome(3) AND NOT sindrome(0)) OR (sindrome(5) AND sindrome(4) AND sindrome(2) AND NOT sindrome(0)) OR (sindrome(5) AND NOT sindrome(4) AND NOT sindrome(3) AND sindrome(2) AND sindrome(0));
o(16) <= (sindrome(7) AND NOT sindrome(2) AND sindrome(1) AND sindrome(0)) OR (sindrome(5) AND NOT sindrome(4) AND NOT sindrome(3) AND sindrome(2) AND sindrome(0)) OR (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(3) AND sindrome(1) AND NOT sindrome(0));
o(15) <= (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(2) AND sindrome(0)) OR (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(3) AND sindrome(1) AND NOT sindrome(0));
o(14) <= (sindrome(7) AND NOT sindrome(6) AND sindrome(3)) OR (sindrome(7) AND NOT sindrome(4) AND sindrome(3) AND NOT sindrome(1));
o(13) <= (sindrome(5) AND sindrome(3) AND sindrome(2) AND NOT sindrome(0)) OR (NOT sindrome(7) AND NOT sindrome(6) AND sindrome(5) AND NOT sindrome(3) AND sindrome(2));
o(12) <= (NOT sindrome(7) AND NOT sindrome(5) AND sindrome(4) AND sindrome(1)) OR (NOT sindrome(6) AND sindrome(5) AND NOT sindrome(3) AND NOT sindrome(1) AND sindrome(0)) OR (sindrome(7) AND NOT sindrome(6) AND NOT sindrome(2) AND sindrome(1) AND NOT sindrome(0));
o(11) <= (sindrome(7) AND NOT sindrome(6) AND NOT sindrome(2) AND sindrome(1) AND NOT sindrome(0)) OR (sindrome(7) AND NOT sindrome(5) AND NOT sindrome(4) AND NOT sindrome(3) AND NOT sindrome(1) AND sindrome(0));
o(10) <= (sindrome(6) AND NOT sindrome(5) AND NOT sindrome(3) AND sindrome(2) AND NOT sindrome(1)) OR (sindrome(6) AND NOT sindrome(4) AND NOT sindrome(3) AND sindrome(2) AND NOT sindrome(0));
o(9) <= (sindrome(5) AND NOT sindrome(4) AND NOT sindrome(2) AND sindrome(1)) OR (sindrome(5) AND sindrome(4) AND NOT sindrome(2) AND sindrome(0)) OR (sindrome(6) AND NOT sindrome(4) AND sindrome(2) AND sindrome(1) AND NOT sindrome(0));
o(8) <= (sindrome(5) AND sindrome(4) AND NOT sindrome(2) AND sindrome(0)) OR (sindrome(4) AND NOT sindrome(3) AND NOT sindrome(2) AND NOT sindrome(1) AND sindrome(0));

dec( 0) <= enc( 8) XOR o( 8);
dec( 1) <= enc( 9) XOR o( 9);
dec( 2) <= enc(10) XOR o(10);
dec( 3) <= enc(11) XOR o(11);
dec( 4) <= enc(12) XOR o(12);
dec( 5) <= enc(13) XOR o(13);
dec( 6) <= enc(14) XOR o(14);
dec( 7) <= enc(15) XOR o(15);
dec( 8) <= enc(16) XOR o(16);
dec( 9) <= enc(17) XOR o(17);
dec(10) <= enc(18) XOR o(18);
dec(11) <= enc(19) XOR o(19);
dec(12) <= enc(20) XOR o(20);
dec(13) <= enc(21) XOR o(21);
dec(14) <= enc(22) XOR o(22);
dec(15) <= enc(23) XOR o(23);

ErrD <= (sindrome(6) AND sindrome(4) AND sindrome(0)) OR (NOT sindrome(7) AND NOT sindrome(5) AND sindrome(4) AND sindrome(2)) OR (NOT sindrome(7) AND sindrome(6) AND sindrome(4) AND NOT sindrome(2)) OR (sindrome(5) AND NOT sindrome(4) AND sindrome(3) AND NOT sindrome(2)) OR (NOT sindrome(6) AND NOT sindrome(5) AND sindrome(3) AND sindrome(1)) OR (NOT sindrome(5) AND sindrome(4) AND sindrome(2) AND sindrome(1)) OR (sindrome(7) AND NOT sindrome(6) AND sindrome(5) AND sindrome(0)) OR (sindrome(5) AND sindrome(2) AND sindrome(1) AND sindrome(0)) OR (NOT sindrome(6) AND NOT sindrome(4) AND NOT sindrome(3) AND sindrome(2) AND sindrome(0)) OR (sindrome(7) AND sindrome(5) AND NOT sindrome(4) AND NOT sindrome(2) AND NOT sindrome(0)) OR (NOT sindrome(7) AND sindrome(5) AND sindrome(3) AND NOT sindrome(1) AND NOT sindrome(0)) OR (sindrome(7) AND sindrome(5) AND NOT sindrome(3) AND NOT sindrome(1) AND NOT sindrome(0));
end; --architecture comportamental
