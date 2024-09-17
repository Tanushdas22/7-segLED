
entity SevenSegments is
    Port ( sw: in STD_LOGIC_VECTOR(3 downto 0); -- Input switches
           CC : out STD_LOGIC;                 -- Common cathode input to select respective 7-segment. 0 => first, 1 => second
           out_7seg : out STD_LOGIC_VECTOR(6 downto 0)); -- Output for 7-Segment display
end SevenSegments;

architecture Behavioral of SevenSegments is
begin
    out_7seg(0) <= (not sw(2) and sw(1)) or (sw(3) and not sw(2)) or (not sw(3) and sw(2) and not sw(1) and not sw(0)) or (sw(2) and not sw(1)) or (sw(3) and sw(1));
    out_7seg(1) <= (not sw(2) and sw(0)) or (sw(2) and not sw(1)) or (sw(3) and sw(2));
    out_7seg(2) <= (not sw(3) and not sw(1)) or (sw(3) and not sw(0)) or (sw(2) and not sw(0));
    out_7seg(3) <= (not sw(3) and not sw(2) and not sw(0)) or (sw(3) and sw(1)) or (sw(2) and not sw(1)) or (sw(3) and not sw(2) and sw(1) and not sw(0));
    out_7seg(4) <= (not sw(3) and sw(1)) or (not sw(1) and not sw(0)) or (not sw(3) and not sw(2)) or (sw(3) and sw(0));
    out_7seg(5) <= (sw(3) and not sw(2)) or (not sw(2) and sw(0)) or (not sw(3) and sw(1) and not sw(0)) or (not sw(1) and not sw(0)) or (sw(2) and not sw(1));
    out_7seg(6) <= (not sw(1) and not sw(0)) or (sw(3) and not sw(2) and not sw(0)) or (sw(2) and sw(1));
    CC <= '0'; -- Output to select first 7-segment display
end Behavioral;
