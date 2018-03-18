-- updated version
-- elaborated rules: differenciate between 16 or 18 if ace present
-- Marcel Jacomet
-- December 31 Mar 2014
-- HuCE-microLab
--
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity ControlFSM is
      Port (cardReady : In     std_logic;
                clock : In     std_logic;
                cmp11 : In     std_logic;
                cmp16 : In     std_logic;
                cmp18 : In     std_logic;
                cmp21 : In     std_logic;
                  rst : In     std_logic;
                 lost : Out    std_logic;
               enaAdd : Out    std_logic;
              enaLoad : Out    std_logic;
             enaScore : Out    std_logic;
             finished : Out    std_logic;
              newCard : Out    std_logic;
                  sel : Out    std_logic );
end ControlFSM;


architecture behavioral of ControlFSM is
  type StateType is (StartState,CallCard,LoadCard,Handshake,AddCard,LostState,
                     FinishedState,LoadMinus10,CallCardWithAce,SubWithAce,LoadCardAce,IllegalState,
                     HandshakeAce,AddCardAce,LoadMinus10Ace,SubWithAce2,Wait1,Wait2);
  signal outvec       : std_logic_vector(6 downto 0);
  signal state        : StateType;
  signal cardReadySync: std_logic;


begin
  --  the signal 'cardReady' is an asynchronous input signal
  --  used by the finit state machine which NEEDS to be synchronized!
  --  The synchronized signal is named 'cardReadySync' (see theory slides for explanation).
      
  --  skeletton of state transition table of finit state machine
  --  add your VHDL code to complete
  Transition: process(clock, rst)
  begin
    if (rst = '0') then
      cardReadySync <= '0';
      state <= StartState;
    elsif (clock'event and clock = '1') then
      cardReadySync <= cardReady; 
      case state is
        when StartState =>
          state <= CallCard;
        when CallCard =>
          if (cardReadySync = '1') then
            state <= LoadCard;
          end if;
        -- add your own code
        -- ...
        -- ...

	when others => state <= IllegalState;
      end case;
    end if;
  end process;
                                 
  --  output logic of Moore finit state machine
  --  use of internal dummy signal called 'outvec'
  --  add your VHDL code to complete
  OutBlock: process(state)
  begin
    case state is
      when StartState =>
        outvec <= "000--00";              --  don't care is a slash
      when CallCard | CallCardWithAss =>  --  logic OR combination
        outvec <= "001--00";
      when LoadCard | LoadCardAss =>
        outvec <= "0011100";
      -- and so on
      -- ...
      -- ...
      when others=> outvec <= "-------";
    end case;
  end process;

  --  definition of internal dummy variable 'outvec' to real signals
  --  add your VHDL code to complete
  finished <= outvec(6);
  lost     <= outvec(5);
  -- and so on
  -- ...
  -- ...

end behavioral;

