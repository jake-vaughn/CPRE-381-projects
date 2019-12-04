-------------------------------------------------------------------------
-- Jacob Vaughn
-------------------------------------------------------------------------

-- IDEX_reg.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity IDEX_reg is
  port(CLK             : in std_logic;     -- Clock input
       IDEX_WriteEn    : in std_logic;     -- ID 1 writing is enabled
       ID_flush        : in std_logic;

       ID_PC4          : in std_logic_vector(31 downto 0);
       ID_RegDst	     : in std_logic;
       ID_Jump         : in std_logic;
       ID_Beq	         : in std_logic;
       ID_MemtoReg   	 : in std_logic;
       ID_ALUOp	     	 : in std_logic_vector(5 downto 0);
       ID_MemWrite	   : in std_logic;
       ID_ALUSrc	     : in std_logic;
       ID_ReWrite	     : in std_logic;
       ID_Shift        : in std_logic;
       ID_SignExtend   : in std_logic;
       ID_UpperImm     : in std_logic;
       ID_Jal          : in std_logic;
       ID_Jr           : in std_logic;
       ID_Bne          : in std_logic;

       ID_Rs_data      : in std_logic_vector(31 downto 0);
       ID_Rt_data      : in std_logic_vector(31 downto 0);

       ID_32Imm        : in std_logic_vector(31 downto 0);
       ID_rs		       : in std_logic_vector(5 downto 0);
       ID_rt		       : in std_logic_vector(5 downto 0);
       ID_rd		       : in std_logic_vector(5 downto 0);

       EX_PC4          : out std_logic_vector(31 downto 0);
       EX_RegDst	     : out std_logic;
       EX_Jump         : out std_logic;
       EX_Beq	         : out std_logic;
       EX_MemtoReg	   : out std_logic;
       EX_ALUOp		     : out std_logic_vector(5 downto 0);
       EX_MemWrite	   : out std_logic;
       EX_ALUSrc	     : out std_logic;
       EX_ReWrite	     : out std_logic;
       EX_Shift        : out std_logic;
       EX_SignExtend   : out std_logic;
       EX_UpperImm     : out std_logic;
       EX_Jal          : out std_logic;
       EX_Jr           : out std_logic;
       EX_Bne          : out std_logic;

       EX_Rs_data      : out std_logic_vector(31 downto 0);
       EX_Rt_data      : out std_logic_vector(31 downto 0);

       EX_32Imm        : out std_logic_vector(31 downto 0);
       EX_rs		       : out std_logic_vector(5 downto 0);
       EX_rt		       : out std_logic_vector(5 downto 0);
       EX_rd		       : out std_logic_vector(5 downto 0);

       EX_flush        : out std_logic);
end IDEX_reg;

architecture arch of IDEX_reg is

component N_bit_reg
  generic(N : integer := 32);
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(N-1 downto 0));   -- Data value output
end component;

component one_bit_reg
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
     --  i_flush      : in std_logic;     -- Flu
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic;     -- Data value input
       o_Q          : out std_logic);   -- Data value output
end component;

component five_bit_reg
  generic(N : integer := 5);
  port(i_CLK        : in std_logic;     -- Clock input
       i_RST        : in std_logic;     -- Reset input
       i_WE         : in std_logic;     -- Write enable input
       i_D          : in std_logic_vector(N-1 downto 0);     -- Data value input
       o_Q          : out std_logic_vector(N-1 downto 0));   -- Data value output
end component;

begin

   IDEX_PC4_reg: N_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_PC4,
            o_Q => EX_PC4);

   IDEX_RegDst_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_RegDst,
            o_Q => EX_RegDst);

   IDEX_Jump_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Jump,
            o_Q => EX_Jump);

   IDEX_Beq_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Beq,
            o_Q => EX_Beq);

   IDEX_MemtoReg_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_MemtoReg,
            o_Q => EX_MemtoReg);

   IDEX_ALUOp_reg: five_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_ALUOp,
            o_Q => EX_ALUOp);

   IDEX_MemWrite_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_MemWrite,
            o_Q => EX_MemWrite);

   IDEX_ALUSrc_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_ALUSrc,
            o_Q => EX_ALUSrc);

   IDEX_ReWrite_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_ReWrite,
            o_Q => EX_ReWrite);

   IDEX_Shift_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Shift,
            o_Q => EX_Shift);

   IDEX_SignExtend_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_SignExtend,
            o_Q => EX_SignExtend);

   IDEX_UpperImm_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_UpperImm,
            o_Q => EX_UpperImm);

   IDEX_Jal_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Jal,
            o_Q => EX_Jal);

   IDEX_Jr_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Jr,
            o_Q => EX_Jr);

   IDEX_Bne_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => ID_flush,
            i_WE => IDEX_WriteEn,
            i_D => ID_Bne,
            o_Q => EX_Bne);

   IDEX_flush_reg: one_bit_reg
   port map(i_CLK => CLK,
            i_RST => '0',
            i_WE => IDEX_WriteEn,
            i_D => ID_flush,
            o_Q => EX_flush);

end arch;