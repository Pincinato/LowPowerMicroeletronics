-- updated version
-- elaborated rules: differenciate between 16 or 18 if ace present
-- Marcel Jacomet
-- December 31 Mar 2014
-- HuCE-microLab
--
library IEEE;
use IEEE.std_logic_1164.all;

entity BlackJack is
      Port ( cardReady : In  std_logic;
             cardValue : In  std_logic_vector(3 downto 0);
                 clock : In  std_logic;
                 start : In  std_logic;
                  lost : Out std_logic;
              finished : Out std_logic;
               newCard : Out std_logic;
                 score : Out std_logic_vector(4 downto 0) );
end BlackJack;

architecture schematic of BlackJack is

  signal enaLoad,enaAdd,enaScore,sel,cmp11,cmp16,cmp18,cmp21: std_logic;

   component DataPath
      Port ( cardValue : In  std_logic_vector(3 downto 0);
                 clock : In  std_logic;
                enaAdd : In  std_logic;
               enaLoad : In  std_logic;
              enaScore : In  std_logic;
                   rst : In  std_logic;
                   sel : In  std_logic;
                 cmp11 : Out std_logic;
                 cmp16 : Out std_logic;
                 cmp18 : Out std_logic;
                 cmp21 : Out std_logic;
                 score : Out std_logic_vector(4 downto 0) );
   end component;

  component ControlFSM
    Port (cardReady,clock,cmp11,cmp16,cmp18,cmp21,rst : in std_logic;
          lost,enaAdd,enaLoad,enaScore,finished, newCard,sel : Out std_logic);
  end component;

begin

   I_1 : DataPath
      Port Map (cardValue,clock,enaAdd,enaLoad,enaScore,start,sel,cmp11,cmp16,cmp18,cmp21,score);
   I_2 : ControlFSM
      Port Map (cardReady,clock,cmp11,cmp16,cmp18,start,lost,enaAdd,enaLoad,enaScore,finished,newCard,sel);
   -- here you add your FSM component
   -- the methode used above is a position-based wiring, example the position 6 means
   -- that the signal "start" on the "BlackJack" hierarchical level is connected to signal "rst"
   -- on the "DataPath" level. Components referenced (like "DataPath" need first to be declared).
  
end schematic;
