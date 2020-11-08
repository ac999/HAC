entity Dflipflop is
  port(
  clk : in bit;
  reset : in bit;
  d   : in bit;
  q   : out bit
  );
end Dflipflop;

architecture only of Dflipflop is
  constant tpd_reset_to_state : time := 0 ns;
  constant tpd_clk_to_state   : time := 0 ns;

  begin
    process(clk, reset)
    begin
      if (reset = '1') then
        if reset'event then
          q <= '0' after tpd_reset_to_state;
        end if;
      elsif clk'event and (clk = '1') then
        q <= d after tpd_clk_to_state;
      end if;
    end process;
  end only;
