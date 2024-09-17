
entity SevenSegments is
    Port ( sw: in STD_LOGIC_VECTOR(3 downto 0);   -- Input switches
           CC : out STD_LOGIC;                    -- Common cathode input to select respective 7-segment
           out_7seg : out STD_LOGIC_VECTOR(6 downto 0));  -- Output for 7-Segment display
end SevenSegments;

architecture Behavioral of SevenSegments is
begin

    process(sw)  -- if you prefer if-else statements
    begin
        if (sw = "0000") then out_7seg <= "1111110";  -- 0
        elsif (sw = "0001") then out_7seg <= "0000110";  -- 1
        elsif (sw = "0010") then out_7seg <= "1101101";  -- 2
        elsif (sw = "0011") then out_7seg <= "1001111";  -- 3
        elsif (sw = "0100") then out_7seg <= "0010111";  -- 4
        elsif (sw = "0101") then out_7seg <= "1011011";  -- 5
        elsif (sw = "0110") then out_7seg <= "1111011";  -- 6
        elsif (sw = "0111") then out_7seg <= "0000111";  -- 7
        elsif (sw = "1000") then out_7seg <= "1111111";  -- 8
        elsif (sw = "1001") then out_7seg <= "1011111";  -- 9
        elsif (sw = "1010") then out_7seg <= "0111111";  -- A
        elsif (sw = "1011") then out_7seg <= "0110011";  -- B
        elsif (sw = "1100") then out_7seg <= "1110000";  -- C
        elsif (sw = "1101") then out_7seg <= "1111001";  -- D
        elsif (sw = "1110") then out_7seg <= "1110001";  -- E
        elsif (sw = "1111") then out_7seg <= "0111001";  -- F
        else out_7seg <= "0000000";  -- Default/Blank
        end if;
    end process;

    CC <= '0';  -- Set common cathode to 0

end Behavioral;
