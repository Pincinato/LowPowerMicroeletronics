-- BlackJack_top Entity for core and pad connecting
-- Jonas GROSSENBACHER
-- 12. Dec 2017
-- HuCE microLab
--

library IEEE;
use IEEE.std_logic_1164.all;

entity BlackJack_top is
      Port ( cardReady	: In  std_logic;
             cardValue 	: In  std_logic_vector(3 downto 0);
             clk   	: In  std_logic;
             start 	: In  std_logic;
             lost 	: Out std_logic;
             finished 	: Out std_logic;
             newCard 	: Out std_logic;
             score 	: Out std_logic_vector(4 downto 0) );
end BlackJack_top;

architecture schematic of BlackJack_top is

  signal s_cardReady,s_clk,s_start,s_lost,s_finished,s_newCard: std_logic;
  signal s_cardValue: std_logic_vector(3 downto 0);
  signal s_score: std_logic_vector(4 downto 0);

  component BlackJack
      Port ( cardReady : In  std_logic;
             cardValue : In  std_logic_vector(3 downto 0);
                   clk : In  std_logic;
                 start : In  std_logic;
                  lost : Out std_logic;
              finished : Out std_logic;
               newCard : Out std_logic;
                 score : Out std_logic_vector(4 downto 0) );
   end component;

  --Define IO Pads used in the Design
  --PADDI: Digital Input Pad
  component PADDI
  	Port (  Y	: out 	std_logic;
      		PAD	: in    std_logic );
    end component;

  --PADDB: Digital In/Output Pad, 10mA drive strength
  component PADDB
  Port (  Y : out std_logic;
        PAD : inout std_logic;
          A : in std_logic;
         OEN : in std_logic );
  end component;

  --PADDO: Digital Output Pad, 10mA drive strength
  component PADDO
  Port (  A : in std_logic;
        PAD : out std_logic );
  end component;

begin

   core : BlackJack
      Port Map (s_cardReady,s_cardValue,s_clk,s_start,s_lost,s_finished,s_newCard,s_score);

    IO_LOST : PADDO
      Port Map (PAD => lost,
                  A => s_lost );

   IO_FINISHED : PADDO
      Port Map (PAD => finished,
                  A => s_finished );

   IO_NEWCARD : PADDO
      Port Map (PAD => newCard,
                  A => s_newCard );

   GEN_SCORE: for I in 0 to 4 generate
      IO_SCORE : PADDO
      Port Map (PAD => score(I),
                  A => s_score(I) );
   end generate GEN_SCORE;

   IO_CARDREADY : PADDI
      Port Map (Y => s_cardReady,
              PAD => cardReady);

   IO_START : PADDI
      Port Map (Y => s_start,
              PAD => start);

   GEN_CARDVALUE: for I in 0 to 3 generate
      IO_CARDVALUE : PADDI
      Port Map (Y => s_cardValue(I),
              PAD => cardValue(I));
   end generate GEN_CARDVALUE;

   IO_CLK : PADDI
      Port Map (Y => s_clk,
              PAD => clk);

end schematic;
