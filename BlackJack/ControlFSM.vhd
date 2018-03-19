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
                  sel : Out    std_logic);
end ControlFSM;


architecture behavioral of ControlFSM is
  type StateType is (StartState,AskCard,LoadCard,AddCard,Compare,LostState,FinishedState,CompareWithAce,AskCardWithAce,LoadCardWithAce,AddCardWithAce,Substract,SubstractSecondAce,IllegalState);
  
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
          state <= AskCard;
        when AskCard =>
          if (cardReadySync = '1') then
            state <= LoadCard;
          elsif (cardReadySync = '0') then
            state <= AskCard;
          else
            state <= AskCard;
          end if;
        when LoadCard =>
          state <= AddCard;
        when AddCard =>
          if (cmp11 = '1') then
            state <= CompareWithAce;
          else
            state <= Compare;
          end if;
        when Compare =>
          if (cardReadySync = '0') then
            if (cmp21 = '0' and cmp16 ='0') then
              state <= AskCard;
            elsif(cmp21 = '0' and cmp16 ='1') then
              state <= FinishedState;
            elsif(cmp21 = '1') then
              state <= LostState;
            else
              state <= Compare;
            end if;
          else
              state <= Compare;
          end if;
        when FinishedState =>
          state <= FinishedState;
        when LostState =>
          state <= LostState;
        when CompareWithAce =>
          if (cardReadySync = '0') then
            if (cmp21 = '0' and cmp18 ='0') then
              state <= AskCardWithAce;
            elsif(cmp21 = '0' and cmp18 ='1') then
              state <= FinishedState;
            elsif(cmp21 = '1') then
              state <= Substract;
            else
              state <= CompareWithAce;
            end if;
          else
              state <= CompareWithAce;
          end if;
        when Substract =>
          state <= AddCard;
        when AskCardWithAce =>
          if (cardReadySync = '1') then
            state <= LoadCardWithAce;
          elsif (cardReadySync = '0') then
            state <= AskCardWithAce;
          else
            state <= AskCardWithAce;
          end if;
        when LoadCardWithAce =>
          state <= AddCardWithAce;
        when AddCardWithAce =>
          if (cmp11 = '1') then
            state <= SubstractSecondAce;
          else
            state <= CompareWithAce;
          end if;
        when SubstractSecondAce =>
          state <= AddCardWithAce;
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
      when StartState | Compare | CompareWithAce =>
        outvec <= "0000000";              --  don't care is a slash
      when AskCard | AskCardWithAce =>  --  logic OR combination
        outvec <= "0010000";
      when LoadCard | LoadCardWithAce =>
        outvec <= "0010100";
      when AddCard | AddCardWithAce =>
        outvec <= "0000010";
      when Substract | SubstractSecondAce =>
        outvec <= "0001100";
      when FinishedState =>
        outvec <= "1000001";
      when LostState =>
        outvec <= "1100000";
      when others=> outvec <= "-------";
    end case;
  end process;

  --  definition of internal dummy variable 'outvec' to real signals
  --  add your VHDL code to complete
  finished <= outvec(6);
  lost     <= outvec(5);
  newCard  <= outvec(4);
  sel  <= outvec(3);
  enaLoad  <= outvec(2);
  enaAdd  <= outvec(1);
  enaScore  <= outvec(0);
   
end behavioral;

