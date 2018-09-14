EXTEND_BOTTOM %tutu_var%KELDDA 1
  IF ~PartyHasItem("cdrnlet")
      Global("CDPlayerHasCalling","GLOBAL",0)
      OR(2)
        Class(Player1,RANGER_ALL)
        Global("CDMultistronghold","GLOBAL",1)~ THEN DO ~GiveGoldForce(5000)
                                                         SetGlobal("BassilusDead","GLOBAL",2)
                                                         AddexperienceParty(1000)
                                                         TakePartyItem("%tutu_var%MISC04")
                                                         EraseJournalEntry(@2024)
                                                         EraseJournalEntry(@2025)
                                                         EraseJournalEntry(@2026)
                                                         EraseJournalEntry(@2027)
                                                         EraseJournalEntry(@2028)
                                                         EraseJournalEntry(@2029)~GOTO QuestIntro
END

APPEND %tutu_var%KELDDA

  IF ~~ THEN BEGIN QuestIntro SAY @2000
    IF ~GlobalLT("Chapter","GLOBAL",3)~ THEN GOTO GoFinishMines
    IF ~!GlobalLT("Chapter","GLOBAL",3)~ THEN GOTO LetsGetQuesting
  END
  
  IF ~~ THEN BEGIN GoFinishMines SAY @2001
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN LetsGetQuesting SAY @2002
    IF ~CheckStatGT(Player1,14,INT)~ THEN REPLY @2003 GOTO Cyric
    IF ~!CheckStatGT(Player1,14,INT)~ THEN REPLY @2004 GOTO Cyric
    IF ~~ THEN REPLY @2005 GOTO CyricBetterRecognize
  END

  IF ~~ THEN BEGIN CyricBetterRecognize SAY @2006
    IF ~~ THEN GOTO Cyric
  END
  
  IF ~~ THEN BEGIN Cyric SAY @2007 = @2008
    IF ~~ THEN GOTO GenericRanger
    IF ~Class(Player1,CLERIC_ALL)~ THEN GOTO StillGood
    IF ~Kit(Player1,GODLATHANDER)~ THEN GOTO Brother
  END

  IF ~~ THEN BEGIN Brother SAY @2009
    IF ~~ THEN REPLY @2013 GOTO WillHelpGood
    IF ~~ THEN REPLY @2014 GOTO WillHelpGood
    IF ~~ THEN REPLY @2015 GOTO NoHelpGood
  END
  
  IF ~~ THEN BEGIN StillGood SAY @2010
    IF ~~ THEN REPLY @2013 GOTO WillHelpGood
    IF ~~ THEN REPLY @2014 GOTO WillHelpGood
    IF ~~ THEN REPLY @2015 GOTO NoHelpGood
  END
  
  IF ~~ THEN BEGIN GenericRanger SAY @2011
    IF ~~ THEN REPLY @2013 GOTO WillHelpGood
    IF ~~ THEN REPLY @2014 GOTO WillHelpGood
    IF ~~ THEN REPLY @2015 GOTO NoHelpGood
  END
  
  IF ~~ THEN BEGIN NoHelpGood SAY @2019 = @2020
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN WillHelpGood SAY @2022
    IF ~~ THEN GOTO ExplainQuest
  END
  
  IF ~~ THEN BEGIN ExplainQuest SAY @2012
   IF ~~ THEN EXIT
 END
 
END   