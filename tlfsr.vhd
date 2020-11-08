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
  signal s_2    : bit;

begin

  ff2   : Dflipflop
    PORT MAP(
    d     => s_in(2),
    q     => s_2,
    clk   => clk,
    reset => reset
    );

  ff1   : Dflipflop
    PORT MAP(
    d     => s_in(1),
    q     => s_1,
    clk   => clk,
    reset => reset
    );

  ff0   : Dflipflop
    PORT MAP(
    d     => s_in(0),
    q     => s_0,
    clk   => clk,
    reset => reset
    );

  fb_path  : PROCESS(clk, reset)
  begin
    if clk'event and (clk='1') then
      s_in(0) <= s_in(1);
      s_in(1) <= s_in(2);
      s_in(2) <= s_0 xor s_1;
      lfsr_out<= s_0;
    elsif(reset='1') then
      s_in(0) <= seed(0);
      s_in(1) <= seed(1);
      s_in(2) <= seed(2);
    end if;
  end PROCESS fb_path;

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
