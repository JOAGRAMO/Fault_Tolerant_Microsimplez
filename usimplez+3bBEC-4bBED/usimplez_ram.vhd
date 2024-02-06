--//////////////////////////////////////////////////////////////////////
--//// 																////
--//// 																////
--//// 																////
--//// This file is part of the MicroSimplez project				////
--//// http://opencores.org/project,usimplez						////
--//// 																////
--//// Description 													////
--//// Implementation of MicroSimplez IP core according to			////
--//// MicroSimplez IP core specification document. 				////
--//// 																////
--//// To Do: 														////
--//// - 															////
--//// 																////
--//// Author(s): 													////
--//// - Daniel Peralta, peraltahd@opencores.org, designer			////
--//// - Martin Montero, monteromrtn@opencores.org, designer		////
--//// - Julian Castro, julyan@opencores.org, reviewer				////
--//// - Pablo A. Salvadeo,	pas.@opencores, manager					////
--//// 																////
--//////////////////////////////////////////////////////////////////////
--//// 																////
--//// Copyright (C) 2011 Authors and OPENCORES.ORG 				////
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity usimplez_ram is

generic( WIDTH_WORD: natural:= 16;
		 WIDTH_ADDRESS: natural:= 9
	   ); 
	port 
	(
		clk_i	: in std_logic;
		addr_i	: in std_logic_vector((WIDTH_ADDRESS-1) downto 0);
		data_i	: in std_logic_vector((WIDTH_WORD-1) downto 0);
		we_i	: in std_logic ;
		data_o	: out std_logic_vector((WIDTH_WORD-1) downto 0);
		ErrD    : out std_logic
	);

end usimplez_ram;

architecture rtl of usimplez_ram is

	subtype word_t is std_logic_vector(23 downto 0);
	type memory_t is array(0 to 2**WIDTH_ADDRESS-1) of word_t;

--	attribute ram_init_file : string;
--	attribute ram_init_file of ram : signal is "adder.mif"; --code adder.txt
--	attribute ram_init_file of ram : signal is "fibonacci.mif"; --code fibonacci.txt
	
	signal addr_reg_s : std_logic_vector((WIDTH_ADDRESS-1) downto 0);

	signal ram : memory_t := (X"06056F", X"000000", X"000111", X"000000", X"0065FB", X"020432", X"0C002D", X"000444",
	                          X"020167", X"04026E", X"000333", X"020254", X"000111", X"020345", X"000222", X"06047E", 
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000",
							  X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000", X"000000");

    component Encoder
      port(dec  : in std_logic_vector(15 downto 0);
           enc : out std_logic_vector(23 downto 0)
      );
	end component;
	
	component Decoder
	 port(enc : in std_logic_vector(23 downto 0);
          dec : out std_logic_vector(15 downto 0);
		  ErrD : out std_logic
    );
	end component;
	
	signal dato_codificado1 : std_logic_vector(23 downto 0);
	signal dato_codificado2 : std_logic_vector(23 downto 0);

begin

    encod: Encoder port map (
	   dec => data_i,
       enc => dato_codificado1
	);
	
	decod: Decoder port map (
	   enc => dato_codificado2,
       dec => data_o,
	   ErrD => ErrD
    );

	process(clk_i)
	begin
  	  if(falling_edge(clk_i)) then
		if(we_i = '1') then
			ram(to_integer(unsigned(addr_i))) <= dato_codificado1;
		end if;

	  addr_reg_s <= addr_i;
	  end if;
	end process;

	dato_codificado2 <= ram(to_integer(unsigned(addr_reg_s)));

end rtl;
