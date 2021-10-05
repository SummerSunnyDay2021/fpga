library verilog;
use verilog.vl_types.all;
entity gcd is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        xin             : in     vl_logic_vector(3 downto 0);
        yin             : in     vl_logic_vector(3 downto 0);
        go              : in     vl_logic;
        gcdreg          : out    vl_logic_vector(3 downto 0)
    );
end gcd;
