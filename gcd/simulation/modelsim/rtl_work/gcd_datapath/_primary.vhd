library verilog;
use verilog.vl_types.all;
entity gcd_datapath is
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        xin             : in     vl_logic_vector(3 downto 0);
        yin             : in     vl_logic_vector(3 downto 0);
        xsel            : in     vl_logic;
        ysel            : in     vl_logic;
        xld             : in     vl_logic;
        yld             : in     vl_logic;
        gld             : in     vl_logic;
        ltflag          : out    vl_logic;
        eqflag          : out    vl_logic;
        gcdreg          : out    vl_logic_vector(3 downto 0)
    );
end gcd_datapath;
