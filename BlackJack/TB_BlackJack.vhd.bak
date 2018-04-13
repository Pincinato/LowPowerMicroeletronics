-- updated version
-- elaborated rules: differeciate between 16 or 18 if ass present
-- Marcel Jacomet
-- December 28 Mar 2014
-- HuCE-microLab
--
library IEEE;
use IEEE.std_logic_1164.all;

entity E is
end E;

Architecture A of E is

   signal cardReady : std_logic;
   signal cardValue : std_logic_vector(3 downto 0);
   signal     clock : std_logic;
   signal     start : std_logic;
   signal      lost : std_logic;
   signal  finished : std_logic;
   signal   newCard : std_logic;
   signal     score : std_logic_vector(4 downto 0);

   component BlackJack
      Port ( cardReady : In  std_logic;
             cardValue : In  std_logic_vector(3 downto 0);
                 clock : In  std_logic;
                 start : In  std_logic;
                  lost : Out std_logic;
              finished : Out std_logic;
               newCard : Out std_logic;
                 score : Out std_logic_vector(4 downto 0) );
   end component;

begin
   UUT : BlackJack
      Port Map (cardReady,cardValue,clock,start,lost,finished,newCard,score);

-- *** Test Bench - User Defined Section ***
   TB : block
       signal sync: bit := '1';  -- used for test cycle synchronization       
   begin

       ClockGeneration : process	   
       begin  -- process ClockGeneration
	   clock <= '0', '1' after 20 ns, '0' after 50 ns;
	   -- The following 'sync' signal is optional and only needed if
	   -- you intend to use an advanced test cycle synchronization described
	   -- in the 'StimuliGeneration' process below. 
	   sync  <= '1', '0' after 10 ns;  
	   wait for 100 ns;
       end process ClockGeneration;

       
       StimuliGeneration : process	   
       begin  -- process StimuliGeneration for cards: 11, 2, 11, 3, 5, 7,4
	   start <= '0';
	   cardReady <= '0';
	   wait for 100 ns;  		-- test cycle 1
	   start <= '1';
	   wait for 100 ns;  		-- test cycle 2
	   -- just wait another test cycle
	   wait for 100 ns;  		-- test cycle 3
	   -- a new cardValue is expected: 11
	   cardValue <= "1011";
	   wait for 100 ns;  		-- test cycle 4
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  -- test cycle 6
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  -- test cycle 5
	    -- a new cardValue is expected: 2
	   cardValue <= "0010";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  
	    -- a new cardValue is expected: 11
	   cardValue <= "1011";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  
	    -- a new cardValue is expected: 3
	   cardValue <= "0011";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  
	    -- a new cardValue is expected: 5
	   cardValue <= "0101";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  
	    -- a new cardValue is expected: 7
	   cardValue <= "0111";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait until (newCard = '1' and sync'event and sync = '1');  
	    -- a new cardValue is expected: 4
	   cardValue <= "0100";
	   wait for 100 ns;  		
	   cardReady <= '1';
	   wait until (newCard = '0' and sync'event and sync = '1');  
	   cardReady <= '0';
	   wait for 500 ns;	   
       end process StimuliGeneration;


   end block;
-- *** End Test Bench - User Defined Section ***


end A;

configuration CFG_behavioral_TB_BlackJack of E is
   for A
   end for;
end CFG_behavioral_TB_BlackJack;
