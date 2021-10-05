library verilog;
use verilog.vl_types.all;
entity gcd_control is
    generic(
        START           : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        LOAD            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi1, Hi0);
        JUDGE_1         : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi1, Hi0, Hi0);
        DONE            : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi1, Hi0, Hi0, Hi0);
        JUDGE_2         : vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi1, Hi0, Hi0, Hi0, Hi0);
        UPDATE_1        : vl_logic_vector(0 to 6) := (Hi0, Hi1, Hi0, Hi0, Hi0, Hi0, Hi0);
        UPDATE_2        : vl_logic_vector(0 to 6) := (Hi1, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0)
    );
    port(
        clk             : in     vl_logic;
        rst_n           : in     vl_logic;
        go              : in     vl_logic;
        ltflag          : in     vl_logic;
        eqflag          : in     vl_logic;
        xsel            : out    vl_logic;
        ysel            : out    vl_logic;
        xld             : out    vl_logic;
        yld             : out    vl_logic;
        gld             : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of START : constant is 1;
    attribute mti_svvh_generic_type of LOAD : constant is 1;
    attribute mti_svvh_generic_type of JUDGE_1 : constant is 1;
    attribute mti_svvh_generic_type of DONE : constant is 1;
    attribute mti_svvh_generic_type of JUDGE_2 : constant is 1;
    attribute mti_svvh_generic_type of UPDATE_1 : constant is 1;
    attribute mti_svvh_generic_type of UPDATE_2 : constant is 1;
end gcd_control;
