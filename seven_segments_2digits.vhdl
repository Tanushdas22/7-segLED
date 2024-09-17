
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity SevenSegments2digits is
    Port (
        clk : in STD_LOGIC;
        CC : out STD_LOGIC;
        out_7seg : out STD_LOGIC_VECTOR (6 downto 0)
    );
end SevenSegments2digits;

architecture Behavioral of SevenSegments2digits is
    -- constants
    constant clk_divider_forOneHz : positive := 3;
    constant clk_divider_for7seg : positive := 1;
    constant countwidth : positive := 8;
    constant max_SevenSeg_Count : positive := 20;

    -- signals
    signal count : std_logic_vector(countwidth-1 downto 0);
    signal count_7seg : std_logic_vector(countwidth-1 downto 0);
    signal clk_out_7seg : std_logic := '0';
    signal SevenSeg_Count : integer range 0 to max_SevenSeg_Count;
    signal SevenSeg_show : std_logic_vector(7 downto 0);

begin

    CLK_Gen: process(clk)
    begin
        if rising_edge(clk) then
            if (count < clk_divider_forOneHz) then
                count <= count + 1;
            else
                count <= others => '0';  -- 1 second has passed
                if (SevenSeg_Count < max_SevenSeg_Count) then
                    SevenSeg_Count <= SevenSeg_Count + 1;
                else
                    SevenSeg_Count <= 0;
                end if;
            end if;
        end if;
    end process;

end Behavioral;

begin
    if rising_edge(clk) then
        -- dividing internal clock for 1Hz
        if(count < clk_divider_forOneHz) then
            count <= count + 1;
        else
            count <= (others => '0');  -- 1 second has passed
            if (SevenSeg_Count < max_SevenSeg_Count) then
                SevenSeg_Count <= SevenSeg_Count + 1;
            else
                SevenSeg_Count <= 0;
            end if;
        end if;
    end if;
end process;

-- Process for converting the decimal count to binary for the 7-segment display
decimal_to_binary: process (SevenSeg_Count)
begin
    SevenSeg_show(7 downto 4) <= std_logic_vector(to_unsigned(SevenSeg_Count / 10, 4));
    SevenSeg_show(3 downto 0) <= std_logic_vector(to_unsigned(SevenSeg_Count rem 10, 4));
end process;

Decoder_8bitsto2SevenSegments: process (clk_out_7seg, SevenSeg_show)
begin
    if (clk_out_7seg = '0') then
        case SevenSeg_show(7 downto 4) is
            when "0000" => out_7seg <= "1111110";
            when "0001" => out_7seg <= "0000110";
            when "0010" => out_7seg <= "1101101";
            when "0011" => out_7seg <= "1001111";
            when "0100" => out_7seg <= "0010111";
            when "0101" => out_7seg <= "1011011";
            when "0110" => out_7seg <= "1111011";
            when "0111" => out_7seg <= "0001110";
            when "1000" => out_7seg <= "1111111";
            when "1009" => out_7seg <= "1011111";
            when "1010" => out_7seg <= "0111111";
            when "1011" => out_7seg <= "1110011";
            when "1100" => out_7seg <= "1111000";
            when "1101" => out_7seg <= "1100111";
            when "1110" => out_7seg <= "1111001";
            when "1111" => out_7seg <= "0111001";
            when others => out_7seg <= "0000000";
        end case;
    else
        case SevenSeg_show(3 downto 0) is
            when "0000" => out_7seg <= "1111110";
            when "0001" => out_7seg <= "0000110";
            when "0010" => out_7seg <= "1101101";
            when "0011" => out_7seg <= "1001111";
            when "0100" => out_7seg <= "0010111";
            when "0101" => out_7seg <= "1011011";
            when "0110" => out_7seg <= "1111011";
            when "0111" => out_7seg <= "0001110";
            when "1000" => out_7seg <= "1111111";
            when "1009" => out_7seg <= "1011111";
            when "1010" => out_7seg <= "0111111";
            when "1011" => out_7seg <= "1110011";
            when "1100" => out_7seg <= "1111000";
            when "1101" => out_7seg <= "1100111";
            when "1110" => out_7seg <= "1111001";
            when "1111" => out_7seg <= "0111001";
            when others => out_7seg <= "0000000";
        end case;
    end if;
end process;

-- Assigning CC signal
CC <= clk_out_7seg;

end Behavioral;
