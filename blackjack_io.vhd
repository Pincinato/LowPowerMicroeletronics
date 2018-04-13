-- Michael Nydegger
-- February 2th, 2017
-- HuCE microLab
--

library IEEE;
use IEEE.std_logic_1164.all;

entity BlackJack_IO is
      Port ( cardReady : In  std_logic;
             cardValue : In  std_logic_vector(3 downto 0);
                   clk : In  std_logic;
                 start : In  std_logic;
                  lost : Out std_logic;
              finished : Out std_logic;
               newCard : Out std_logic;
                 score : Out std_logic_vector(4 downto 0) );
end BlackJack_IO;

architecture schematic of BlackJack_IO is

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

   component BU1P
      Port (         A : In  std_logic;
                   PAD : Out std_logic );
   end component;

   component ICP
      Port (       PAD : In  std_logic;
                     Y : Out std_logic );
   end component;

   component ICCK2P
      Port (       PAD : In  std_logic;
                     Y : Out std_logic );
   end component;

begin

   I_1 : BlackJack
      Port Map (s_cardReady,s_cardValue,s_clk,s_start,s_lost,s_finished,s_newCard,s_score);

   IO_LOST : BU1P
      Port Map (s_lost,lost);

   IO_FINISHED : BU1P
      Port Map (s_finished,finished);

   IO_NEWCARD : BU1P
      Port Map (s_newCard,newCard);

   GEN_SCORE: for I in 0 to 4 generate
      IO_SCORE : BU1P
         Port Map (s_score(I),score(I));
   end generate GEN_SCORE;

   IO_CARDREADY : ICP
      Port Map (cardReady,s_cardReady);

   IO_START : ICP
      Port Map (start,s_start);

   GEN_CARDVALUE: for I in 0 to 3 generate
      IO_CARDVALUE : ICP
         Port Map (cardValue(I),s_cardValue(I));
   end generate GEN_CARDVALUE;

   IO_CLK : ICCK2P
      Port Map (clk,s_clk);

end schematic;

