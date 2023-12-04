-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Tool Version Limit: 2022.04
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
--
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity dac_table_8x_comb2wide_V_RAM_2P_URAM_3R2W is 
    generic(
            MEM_TYPE    : string := "hls_ultra"; 
            DataWidth     : integer := 512; 
            AddressWidth     : integer := 15; 
            AddressRange    : integer := 32768
    ); 
    port (
          address0     : in std_logic_vector(AddressWidth-1 downto 0); 
          ce0       : in std_logic; 
          q0        : out std_logic_vector(DataWidth-1 downto 0);
          address1     : in std_logic_vector(AddressWidth-1 downto 0); 
          ce1       : in std_logic; 
          d1        : in std_logic_vector(DataWidth-1 downto 0); 
          we1       : in std_logic; 
          reset      : in std_logic; 
          clk        : in std_logic 
    ); 
end entity; 


architecture rtl of dac_table_8x_comb2wide_V_RAM_2P_URAM_3R2W is 

signal address0_t1_tmp : std_logic_vector(AddressWidth-1 downto 0); 
type mem_array is array (0 to AddressRange-1) of std_logic_vector (DataWidth-1 downto 0); 
signal ram : mem_array;

attribute syn_ramstyle : string; 
attribute syn_ramstyle of ram : signal is "auto";
attribute ram_style : string;
attribute ram_style of ram : signal is MEM_TYPE;
attribute cascade_height : integer;
attribute cascade_height of ram : signal is 1;
signal address0_t0 : std_logic_vector(AddressWidth-1 downto 0); 
signal address0_t1 : std_logic_vector(AddressWidth-1 downto 0); 
signal q0_t0 : std_logic_vector(DataWidth-1 downto 0);
signal q0_t1 : std_logic_vector(DataWidth-1 downto 0);
signal address1_t0 : std_logic_vector(AddressWidth-1 downto 0); 
signal address1_t1 : std_logic_vector(AddressWidth-1 downto 0); 
signal d1_t0 : std_logic_vector(DataWidth-1 downto 0); 
signal we1_t0 : std_logic; 
signal d1_t1 : std_logic_vector(DataWidth-1 downto 0); 
signal we1_t1 : std_logic; 

begin 

address0_t0 <= address0;
q0 <= q0_t1;
address1_t0 <= address1;
d1_t0 <= d1;
we1_t0 <= we1;

p_IO_pipeline_reg : process (clk)  
begin
    if (clk'event and clk = '1') then
      if (ce0 = '1') then
        address0_t1 <= address0_t0; 
        q0_t1 <= q0_t0;
      end if;
      if (ce1 = '1') then
        address1_t1 <= address1_t0; 
        d1_t1 <= d1_t0;
        we1_t1 <= we1_t0;
      end if;
    end if;
end process;

memory_access_guard_0: process (address0_t1) 
begin
      address0_t1_tmp <= address0_t1;
--synthesis translate_off
      if (CONV_INTEGER(address0_t1) > AddressRange-1) then
           address0_t1_tmp <= (others => '0');
      else 
           address0_t1_tmp <= address0_t1;
      end if;
--synthesis translate_on
end process;

p_memory_access_0: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0_t0 <= ram(CONV_INTEGER(address0_t1_tmp));
        end if;
    end if;
end process;


p_memory_access_1: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce1 = '1') then 
            if (we1_t1 = '1') then 
                ram(CONV_INTEGER(address1_t1)) <= d1_t1; 
            end if;
        end if;
    end if;
end process;


end rtl;

