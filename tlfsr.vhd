entity test_lfsr is
  PORT(
  seed      : in bit_vector (2 downto 0);
  lfsr_out  : out bit
  );
end;

architecture only of test_lfsr is

COMPONENT Dflipflop
  PORT(
  clk   : in bit;
  reset : in bit;
  d     : in bit;
  q     : out bit
  );
end COMPONENT;

  signal clk    : bit := '0';
  signal reset  : bit := '0';
  signal s_in   : bit_vector (2 downto 0) := b"100";
  signal s_0    : bit;
  signal s_1    : bit;

begin

  ff2   : Dflipflop
    PORT MAP(
    d     => s_in(0),
    q     => s_1,
    clk   => clk,
    reset => reset
    );

  ff1   : Dflipflop
    PORT MAP(
    d     => s_1,
    q     => s_0,
    clk   => clk,
    reset => reset
    );

  ff0   : Dflipflop
    PORT MAP(
    d     => s_0,
    q     => lfsr_out,
    clk   => clk,
    reset => reset
    );

  calc  : PROCESS
  begin
    s_in(0) <= s_in(1);
    s_in(1) <= s_in(2);
    s_in(2) <= s_0 xor s_1;
    wait;
  end PROCESS calc;

  clock : PROCESS
  begin
    wait for 5 ns; clk <= not clk;
  end PROCESS clock;

  stimulus : PROCESS
     begin
     wait for 5 ns; reset  <= '1';
     wait for 4 ns; reset  <= '0';
     wait;
  end PROCESS stimulus;

end only;
