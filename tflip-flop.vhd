entity test_Dflipflop is
  PORT(
  d : in bit;
  q : out bit
  );
end;

architecture only of test_Dflipflop is

COMPONENT Dflipflop
  PORT(
  clk : in bit;
  reset : in bit;
  d   : in bit;
  q   : out bit
  );
end COMPONENT;

SIGNAL clk   : bit := '0';
SIGNAL reset : bit := '0';

begin

dut : Dflipflop
  PORT MAP(
  d => d,
  q => q,
  clk => clk,
  reset => reset
  );

clock : PROCESS
   begin
   wait for 10 ns; clk  <= not clk;
end PROCESS clock;

stimulus : PROCESS
   begin
   wait for 5 ns; reset  <= '1';
   wait for 4 ns; reset  <= '0';
   wait;
end PROCESS stimulus;

end only;
