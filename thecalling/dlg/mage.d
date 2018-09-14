/////                                                  \\\\\
///// transition shifting                              \\\\\
/////                                                  \\\\\

// all the miners in nashkel mines 1 leave after speaking
// we need 'em to stick around, so...
REPLACE_ACTION_TEXT ~%tutu_var%BOB~    ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%CORY~   ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%DILOK~  ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%DINK~   ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%GORD~   ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%LESLEY~ ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%MARVIN~ ~EscapeArea()~ ~~
REPLACE_ACTION_TEXT ~%tutu_var%RUFFIE~ ~EscapeArea()~ ~~

// change branching on cory so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%BOB~ 4 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%BOB~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO BobQuestion
END

EXTEND_BOTTOM ~%tutu_var%BOB~ 4
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO BobQuestion
END

// change branching on cory so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%CORY~ 6 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%CORY~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO CoryQuestion
END

EXTEND_BOTTOM ~%tutu_var%CORY~ 6
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO CoryQuestion
END

// change branching on Dilok so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%DILOK~ 3 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%DILOK~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO DilakQuestion
END

EXTEND_BOTTOM ~%tutu_var%DILOK~ 3
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO DilakQuestion
END

// change branching on dink so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%DINK~ 3 ~!Global("CDMinerQuest","MYAREA",1)~
ADD_TRANS_TRIGGER ~%tutu_var%DINK~ 4 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%DINK~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO DinkQuestion
END

EXTEND_BOTTOM ~%tutu_var%DINK~ 3
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO DinkQuestion
END

EXTEND_BOTTOM ~%tutu_var%DINK~ 4
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO DinkQuestion
END

// change branching on Gord so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%GORD~ 3 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%GORD~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO GordQuestion
END

EXTEND_BOTTOM ~%tutu_var%GORD~ 3
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO GordQuestion
END

// opportunity to get black pearl from kelddath
EXTEND_BOTTOM ~%tutu_var%KELDDA~ 0
  IF ~Global("CDBlackPearls","GLOBAL",1)
      Global("CDSpokePearls","LOCALS",0)~ THEN REPLY @1061 DO ~SetGlobal("CDSpokePearls","LOCALS",1)~ GOTO KeldathPearls
  IF ~Global("CDBlackPearls","GLOBAL",1)
      Global("CDSpokePearls","LOCALS",1)~ THEN REPLY @1085 GOTO KeldathPearlsReturnTrip
  IF ~Global("CDBlackPearls","GLOBAL",2)~ THEN REPLY @1078 DO ~ReputationInc(1)
                                                               SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO KeldathReturnPearl
END

// change branching on cory so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%LESLEY~ 2 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%LESLEY~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO LesleyQuestion
END

EXTEND_BOTTOM ~%tutu_var%LESLEY~ 2
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO LesleyQuestion
END

// change branching on marvin so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%MARVIN~ 4 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%MARVIN~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO MarvinQuestion
END

EXTEND_BOTTOM ~%tutu_var%MARVIN~ 4
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO MarvinQuestion
END

// start quest by breaking into melicamp
EXTEND_BOTTOM ~%tutu_var%MELICA~ 24
  IF ~Global("CDPlayerHasCalling","GLOBAL",0)
      OR(2)
        Class(Player1,MAGE_ALL)
        Global("CDMultistronghold","GLOBAL",1)~ THEN EXTERN ~%tutu_var%THALAN~ CDBeginBracerQuest
END

// change branching on Ruffie so questions can be asked
ADD_TRANS_TRIGGER ~%tutu_var%RUFFIE~ 3 ~!Global("CDMinerQuest","MYAREA",1)~
EXTEND_BOTTOM ~%tutu_var%RUFFIE~ 0
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO RuffieQuestion
END

EXTEND_BOTTOM ~%tutu_var%RUFFIE~ 3
  IF ~Global("CDMinerQuest","MYAREA",1)~ THEN REPLY @1142 GOTO RuffieQuestion
END

// ask taerom about melicamp, make device
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 0
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 4
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 6
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 8
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 12
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END
EXTEND_BOTTOM ~%tutu_var%TAEROM~ 14
  IF ~Global("CDBracerQuest","GLOBAL",6)~ THEN REPLY @1101 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN REPLY @1104 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",10)
      PartyHasItem("cdore")~ THEN REPLY @1180 GOTO MakeDevice
  IF ~Global("CDBracerQuest","GLOBAL",11)
      !GlobalTimerExpired("CDTaeromMakingDevice","MYAREA")~ THEN REPLY @1188 GOTO DeviceInProgress
  IF ~Global("CDBracerQuest","GLOBAL",23)
      PartyHasItem("cdbracer")
      PartyHasItem("cdpowder")~ THEN REPLY @1289 GOTO DestroyBracers
END

/////                                                  \\\\\
///// chains                                           \\\\\
/////                                                  \\\\\

// largo and iris at priest
CHAIN IF ~Global("CDBracerQuest","GLOBAL",80)~ THEN CDLARGO PriestNoHelp @1314 DO ~SetGlobal("CDBracerQuest","GLOBAL",19)~
== ~%tutu_var%ALVAHE~ @1315
== CDLARGO @1316
== ~%tutu_var%ALVAHE~ @1317
END
  IF ~~ THEN REPLY @1318 EXTERN CDLARGO HighHedge
  IF ~~ THEN REPLY @1319 EXTERN CDLARGO HighHedge

// send melicamp off to taerom
CHAIN IF ~~ THEN ~%tutu_var%THALAN~ Accepted @1008
== ~%tutu_var%MELICA~ @1009
== ~%tutu_var%THALAN~ @1010 = @1011
== ~%tutu_var%MELICA~ @1012
== ~%tutu_var%THALAN~ @1013
== ~%tutu_var%MELICA~ @1014
== ~%tutu_var%THALAN~ @1015 DO ~SetGlobal("CDBracerQuest","GLOBAL",1)~
EXIT

// begin incantation
CHAIN IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",19)~ THEN ~%tutu_var%THALAN~ IncantationChain @1245 = @1246 DO ~SetGlobal("CDBracerQuest","GLOBAL",20)~
== ~%tutu_var%MELICA~ @1247
== ~%tutu_var%THALAN~ @1248
== CDLARGO @1249
== ~%tutu_var%THALAN~ @1250
END
  IF ~~ THEN REPLY @1251 GOTO IncantationQuestion
  IF ~~ THEN REPLY @1252 GOTO BeginIncantation
  IF ~~ THEN REPLY @1253 GOTO IncantationQuestion
  IF ~~ THEN REPLY @1254 GOTO IncantationQuestion

// melicamp brings device to thalantyr
CHAIN IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",13)~ THEN ~%tutu_var%MELICA~ MeliBringsDevice @1192
== ~%tutu_var%THALAN~ @1193
== ~%tutu_var%MELICA~ @1194
END ~%tutu_var%THALAN~ StartDiviningAlready

// melicamp leaves with miners
CHAIN IF ~~ THEN CDMELI MeliLeaves @1125
== CDMINER1 @1126
== CDMINER2 @1127
== CDMELI @1128 DO ~SetGlobalTimer("CDMelicampReturns","GLOBAL",FOUR_DAYS)
                    SetGlobal("CDBracerQuest","GLOBAL",13)
                    ActionOverride("cdminer1",EscapeArea())
                    ActionOverride("cdminer2",EscapeArea())
                    EscapeArea()~
EXIT

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ BeginIncantation @1258 = @1259
== ~%tutu_var%MELICA~ @1260
END
  IF ~~ THEN REPLY @1265 GOTO Incantation2
  IF ~~ THEN REPLY @1266 GOTO Incantation2
  IF ~~ THEN REPLY @1267 DO ~IncrementGlobal("CDIncantationRight","MYAREA",1)~ GOTO Incantation2
  IF ~~ THEN REPLY @1268 GOTO Incantation2
  IF ~~ THEN REPLY @1269 GOTO Incantation2

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ Incantation2 @1261
== ~%tutu_var%MELICA~ @1262
END
  IF ~~ THEN REPLY @1265 GOTO Incantation3
  IF ~~ THEN REPLY @1266 GOTO Incantation3
  IF ~~ THEN REPLY @1267 GOTO Incantation3
  IF ~~ THEN REPLY @1268 DO ~IncrementGlobal("CDIncantationRight","MYAREA",1)~ GOTO Incantation3
  IF ~~ THEN REPLY @1269 GOTO Incantation3

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ Incantation3 @1263
== ~%tutu_var%MELICA~ @1264
END
  IF ~~ THEN REPLY @1265 DO ~IncrementGlobal("CDIncantationRight","MYAREA",1)~ GOTO Behold
  IF ~~ THEN REPLY @1266 GOTO Behold
  IF ~~ THEN REPLY @1267 GOTO Behold
  IF ~~ THEN REPLY @1268 GOTO Behold
  IF ~~ THEN REPLY @1269 GOTO Behold

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ IncantationSucked @1274
== CDIRIS @1275
== ~%tutu_var%THALAN~ @1276 = @1277
== ~%tutu_var%MELICA~ @1278
== ~%tutu_var%THALAN~ @1279 DO ~SetGlobal("CDBracerQuest","GLOBAL",22)~
EXIT

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ IncantationPoor @1280
== CDIRIS @1275
== ~%tutu_var%THALAN~ @1281 = @1282
== ~%tutu_var%MELICA~ @1278
== ~%tutu_var%THALAN~ @1279 DO ~SetGlobal("CDBracerQuest","GLOBAL",22)~
EXIT

CHAIN IF ~~ THEN ~%tutu_var%THALAN~ IncantationGood @1283
== CDIRIS @1284
== ~%tutu_var%MELICA~ @1285
== ~%tutu_var%THALAN~ @1286 = @1287 = @1288 DO ~SetGlobal("CDBracerQuest","GLOBAL",23)
                                     GiveItemCreate("cdbracer",LastTalkedToBy(Myself),1,0,0)
                                     GiveItemCreate("cdpowder",LastTalkedToBy(Myself),1,0,0)~
EXIT

/////                                                  \\\\\
///// appends (old skool!)                             \\\\\
/////                                                  \\\\\

APPEND CDIRIS

  IF WEIGHT #-1 ~GlobalGT("CDBracerQuest","GLOBAL",16)~ THEN BEGIN Squeak SAY @1243
    IF ~~ THEN EXIT
  END

END

APPEND CDLARGO

  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",19)~ THEN BEGIN AtThalantyrs SAY @1244
    IF ~~ THEN EXTERN ~%tutu_var%THALAN~ IncantationChain
  END

  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",18)~ THEN BEGIN Help SAY @1212 = @1213 = @1214
    IF ~~ THEN REPLY @1215 GOTO Explain
    IF ~~ THEN REPLY @1216 GOTO PayForIt
    IF ~~ THEN REPLY @1217 GOTO Explain
  END
  
  IF ~~ THEN BEGIN PayForIt SAY @1218
    IF ~~ THEN REPLY @1219 GOTO OuttaHere
    IF ~~ THEN REPLY @1220 GOTO ExtortionThreat
    IF ~~ THEN REPLY @1221 GOTO ExtortionSuccess
  END
  
  IF ~~ THEN BEGIN OuttaHere SAY @1222
    IF ~~ THEN DO ~ActionOverride("cdiris",EscapeAreaMove("%Gullykin_Winery_L1%",311,230,12))
                   SetGlobal("CDBracerQuest","GLOBAL",80)
                   EscapeAreaMove("%Gullykin_Winery_L1%",388,262,6)~ EXIT
  END
  
  IF ~~ THEN BEGIN ExtortionThreat SAY @1223
    IF ~~ THEN GOTO Explain
  END
  
  IF ~~ THEN BEGIN ExtortionSuccess SAY @1224
    IF ~~ THEN DO ~GiveGoldForce(40)~ GOTO Explain
  END
  
  IF ~~ THEN BEGIN Explain SAY @1225
    IF ~~ THEN REPLY @1226 GOTO Mage
    IF ~~ THEN REPLY @1227 GOTO Mage
  END
  
  IF ~~ THEN BEGIN Mage SAY @1228
    IF ~~ THEN REPLY @1229 GOTO Disappear
    IF ~~ THEN REPLY @1230 GOTO Mage2
    IF ~~ THEN REPLY @1231 GOTO Mage2
  END
  
  IF ~~ THEN BEGIN Disappear SAY @1232
    IF ~~ THEN REPLY @1233 GOTO SaveOthers
    IF ~~ THEN REPLY @1234 GOTO OuttaHere
    IF ~~ THEN REPLY @1235 GOTO SaveOthers
  END

  IF ~~ THEN BEGIN SaveOthers SAY @1236
    IF ~~ THEN GOTO HighHedge
  END
  
  IF ~~ THEN BEGIN HighHedge SAY @1237
    IF ~~ THEN DO ~ActionOverride("cdiris",EscapeAreaMove("%HighHedge_ThalanthyrsAbode%",320,234,4))
                   SetGlobal("CDBracerQuest","GLOBAL",19)
                   EscapeAreaMove("%HighHedge_ThalanthyrsAbode%",384,225,4)~ EXIT
  END
  
  IF ~~ THEN BEGIN Mage2 SAY @1238
    IF ~~ THEN REPLY @1239 GOTO Convinced
    IF ~~ THEN REPLY @1240 GOTO Convinced
    IF ~~ THEN REPLY @1241 GOTO Convinced
  END
  
  IF ~~ THEN BEGIN Convinced SAY @1242
    IF ~~ THEN GOTO HighHedge
  END
  
END

APPEND ~%tutu_var%BOB~

  IF ~~ THEN BEGIN BobQuestion SAY @1151 = @1152
    IF ~!Global("CDSal","MYAREA",0)~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
    IF ~Global("CDSal","MYAREA",0)~  THEN DO ~SetNumTimesTalkedTo(0)
                                              SetGlobal("CDSal","MYAREA",1)~ EXIT
  END

END

APPEND ~%tutu_var%CORY~

  IF ~~ THEN BEGIN CoryQuestion SAY @1148
    IF ~!Global("CDJames","MYAREA",0)~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
    IF ~Global("CDJames","MYAREA",0)~  THEN DO ~SetNumTimesTalkedTo(0)
                                                SetGlobal("CDJames","MYAREA",1)~ EXIT
  END

END

APPEND ~%tutu_var%DILOK~

  IF ~~ THEN BEGIN DilakQuestion SAY @1145
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%DINK~

  IF ~~ THEN BEGIN DinkQuestion SAY @1150
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%GORD~

  IF ~~ THEN BEGIN GordQuestion SAY @1143
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%KELDDA~

  IF ~~ THEN BEGIN KeldathPearls SAY @1062
    IF ~~ THEN REPLY @1063 GOTO KeldathPearls2
    IF ~~ THEN REPLY @1064 GOTO KeldathPearls2
    IF ~~ THEN REPLY @1065 GOTO KeldathPearls2
    IF ~~ THEN REPLY @1066 GOTO Nothing
  END

  IF ~~ THEN BEGIN Nothing SAY @1072
    COPY_TRANS ~%tutu_var%KELDDA~ 0
  END

  IF ~~ THEN BEGIN KeldathPearls2 SAY @1062
    IF ~~ THEN REPLY @1068 GOTO Thalantyr
    IF ~~ THEN REPLY @1069 GOTO Hostile
    IF ~~ THEN REPLY @1070 GOTO Bribe
  END
  
  IF ~~ THEN BEGIN Hostile SAY @1071
    IF ~~ THEN DO ~CreateItem("cdbpearl",1,0,0)
                   Shout(99)
                   Enemy()~ EXIT
  END
  
  IF ~~ THEN BEGIN Bribe SAY @1073
    IF ~~ THEN REPLY @1063 GOTO Thalantyr
    IF ~~ THEN REPLY @1064 GOTO Hostile
    IF ~CheckStatGT(LastTalkedToBy(Myself),13,WIS)~ THEN REPLY @1074 GOTO Bribe2
    IF ~OR (2)
          Global("wyvernp","GLOBAL",1)
          Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1075 GOTO HelpedTemple
    IF ~ReputationGT(Player1,16)
        !Global("wyvernp","GLOBAL",1)
        !Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1075 GOTO GoodieTwoShoes
    IF ~CheckStatGT(LastTalkedToBy(Myself),16,CHR)~ THEN REPLY @1076 GOTO Bribe2
    IF ~!CheckStatGT(LastTalkedToBy(Myself),16,CHR)~ THEN REPLY @1076 GOTO BribeNoDice
  END
  
  IF ~~ THEN BEGIN KeldathReturnPearl SAY @1077
    COPY_TRANS ~%tutu_var%KELDDA~ 0
  END
  
  IF ~~ THEN BEGIN BribeNoDice SAY @1079
    IF ~~ THEN REPLY @1063 GOTO Thalantyr
    IF ~~ THEN REPLY @1064 GOTO Hostile
    IF ~CheckStatGT(LastTalkedToBy(Myself),13,WIS)~ THEN REPLY @1074 GOTO Bribe2
    IF ~OR(3)
          ReputationGT(Player1,16)
          Global("wyvernp","GLOBAL",1)
          Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1075 GOTO GoodieTwoShoes
  END
  
  IF ~~ THEN BEGIN Bribe2 SAY @1080
    IF ~PartyGoldGT(499)~ THEN REPLY @1083 DO ~TakePartyGold(500)
                                               DestroyGold(500)
                                               SetGlobal("CDBlackPearls","GLOBAL",3)
                                               GiveItemCreate("cdbpearl",LastTalkedToBy(Myself),1,0,0)~ GOTO Bribed
    IF ~~ THEN REPLY @1081 DO ~~ GOTO BribeNoDeal
    IF ~~ THEN REPLY @1082 DO ~~ GOTO BribeNoDeal
  END
  
  IF ~~ THEN BEGIN BribeNoDeal SAY @1084
    IF ~~ THEN DO ~SetGlobal("CDBribeAttempt","LOCALS",1)~ EXIT
  END
  
  IF ~~ THEN BEGIN Bribed SAY @1100
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN KeldathPearlsReturnTrip SAY @1086
    IF ~~ THEN REPLY @1068 GOTO Thalantyr
    IF ~~ THEN REPLY @1069 GOTO Hostile
    IF ~Global("CDBribeAttempt","LOCALS",1)~ THEN REPLY @1087 GOTO Bribe2
  END

  IF ~~ THEN BEGIN HelpedTemple SAY @1088
    IF ~~ THEN GOTO HaveIt
  END
  
  IF ~~ THEN BEGIN GoodieTwoShoes SAY @1089
    IF ~~ THEN GOTO HaveIt
  END
  
  IF ~~ THEN BEGIN HaveIt SAY @1090
    IF ~~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",2) 
                   GiveItemCreate("cdbpearl",LastTalkedToBy(Myself),1,0,0)~ EXIT
  END
  
  IF ~~ THEN BEGIN Thalantyr SAY @1091
    IF ~OR (3)
          ReputationGT(Player1,12)
          Global("wyvernp","GLOBAL",1)
          Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1092 GOTO ThalantyrGolden
    IF ~!ReputationGT(Player1,12)
        !Global("wyvernp","GLOBAL",1)
        !Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1092 GOTO ThalantyrNotEnough
    IF ~~ THEN REPLY @1093 GOTO ThalantyrMoreInfo
    IF ~OR (3)
          ReputationGT(Player1,12)
          Global("wyvernp","GLOBAL",1)
          Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1094 GOTO ThalantyrGolden
    IF ~!ReputationGT(Player1,12)
        !Global("wyvernp","GLOBAL",1)
        !Global("BassilusDead","GLOBAL",2)~ THEN REPLY @1094 GOTO ThalantyrNotEnough
  END

  IF ~~ THEN BEGIN ThalantyrGolden SAY @1095
    IF ~~ THEN GOTO HaveIt
  END

  IF ~~ THEN BEGIN ThalantyrMoreInfo SAY @1096
    IF ~~ THEN GOTO ThalantyrNoDice
  END

  IF ~~ THEN BEGIN ThalantyrNotEnough SAY @1097
    IF ~~ THEN GOTO ThalantyrNoDice
  END

  IF ~~ THEN BEGIN ThalantyrNoDice SAY @1098
    IF ~~ THEN EXIT
  END

END

APPEND ~%tutu_var%LESLEY~

  IF ~~ THEN BEGIN LesleyQuestion SAY @1149
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%MARVIN~

  IF ~~ THEN BEGIN MarvinQuestion SAY @1146 = @1147
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%MELICA~

  IF ~~ THEN BEGIN Cluckers SAY @1007
    IF ~~ THEN EXTERN ~%tutu_var%THALAN~ MoreInfo
  END

END

APPEND ~%tutu_var%RUFFIE~

  IF ~~ THEN BEGIN RuffieQuestion SAY @1144
    IF ~~ THEN DO ~SetNumTimesTalkedTo(0)~ EXIT
  END

END

APPEND ~%tutu_var%TAEROM~

  IF ~Global("CDBracerQuest","GLOBAL",25)~ THEN BEGIN BracersGone SAY @1303
    IF ~~ THEN GOTO FinallyDone
    IF ~Global("CDMakeBracers","MYAREA",1)~ THEN GOTO HeresItem
  END

  IF ~Global("CDBracerQuest","GLOBAL",11)
      GlobalTimerExpired("CDTaeromMakingDevice","GLOBAL")~ THEN BEGIN DeviceDone SAY @1185
    IF ~~ THEN REPLY @1186 DO ~GiveItemCreate("cddevice",LastTalkedToBy(Myself),1,0,0)
                               SetGlobal("CDBracerQuest","GLOBAL",12)~ GOTO SeeYa
    IF ~~ THEN REPLY @1187 DO ~GiveItemCreate("cddevice",LastTalkedToBy(Myself),1,0,0)
                               SetGlobal("CDBracerQuest","GLOBAL",12)
                               StartStore("%tutu_var%TAERUM",LastTalkedToBy(Myself))~ EXIT
  END
  
  IF ~~ THEN BEGIN FinallyDone SAY @1304 = @1305
    IF ~~ THEN DO ~AddexperienceParty(1000)~ EXIT
  END
  
  IF ~~ THEN BEGIN HeresItem SAY @1306
    IF ~RandomNum(1,5)~ THEN DO ~GiveItemCreate("amul16",LastTalkedToBy(Myself),1,0,0)~ EXIT
    IF ~RandomNum(2,5)~ THEN DO ~GiveItemCreate("amul24",LastTalkedToBy(Myself),1,0,0)~ EXIT
    IF ~RandomNum(3,5)~ THEN DO ~GiveItemCreate("cdamacid",LastTalkedToBy(Myself),1,0,0)~ EXIT
    IF ~RandomNum(4,5)~ THEN DO ~GiveItemCreate("cdamduh",LastTalkedToBy(Myself),1,0,0)~ EXIT
    IF ~RandomNum(5,5)~ THEN DO ~GiveItemCreate("cdamcons",LastTalkedToBy(Myself),1,0,0)~ EXIT
  END
  
  IF ~~ THEN BEGIN WheresMeli SAY @1102 = @1103
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",7)~ EXIT
  END
  
  IF ~~ THEN BEGIN MakeDevice SAY @1181 = @1183 = @1183
    IF ~~ THEN DO ~TakePartyItem("cdore")
                   DestroyItem("cdore")
                   SetGlobal("CDBracerQuest","GLOBAL",11)
                   SetGlobalTimer("CDTaeromMakingDevice","MYAREA",TWO_DAYS)~ EXIT
  END
  
  IF ~~ THEN BEGIN DeviceInProgress SAY @1184
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN SeeYa SAY @1107
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN DestroyBracers SAY @1290
    IF ~~ THEN REPLY @1291 GOTO GotMilk
    IF ~~ THEN REPLY @1292 GOTO GotMilk
  END
  
  IF ~~ THEN BEGIN GotMilk SAY @1293 = @1294 = @1295 = @1296
    IF ~~ THEN REPLY @1297 GOTO GoneBabyGone
    IF ~~ THEN REPLY @1298 GOTO WhatShiny
    IF ~~ THEN REPLY @1299 GOTO GoneBabyGone
  END
  
  IF ~~ THEN BEGIN WhatShiny SAY @1300
    IF ~~ THEN REPLY @1301 DO ~SetGlobal("CDMakeBracers","MYAREA",1)~ GOTO GoneBabyGone
    IF ~~ THEN REPLY @1297 GOTO GoneBabyGone
    IF ~~ THEN REPLY @1299 GOTO GoneBabyGone
  END
  
  IF ~~ THEN BEGIN GoneBabyGone SAY @1302
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",24)~ EXIT
  END

END

APPEND ~%tutu_var%THALAN~

  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",21)~ THEN BEGIN IncantationFinished SAY @1272 = @1273
    IF ~~ THEN DO ~AddexperienceParty(1000)~ GOTO IncantationSucked
    IF ~Global("CDIncantationRight","MYAREA",1)~ THEN DO ~AddexperienceParty(2000)~ GOTO IncantationPoor
    IF ~Global("CDIncantationRight","MYAREA",2)~ THEN DO ~AddexperienceParty(3000)~ GOTO IncantationGood
    IF ~Global("CDIncantationRight","MYAREA",3)~ THEN DO ~AddexperienceParty(4000)~ GOTO IncantationGood
  END

  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",12)
                 PartyHasItem("cddevice")~ THEN BEGIN HeresDevice SAY @1189
    IF ~~ THEN DO ~TakePartyItem("cddevice")
                  DestroyItem("cddevice")~ GOTO StartDiviningAlready
  END
  
  IF ~~ THEN BEGIN StartDiviningAlready SAY @1190 = @1191
    IF ~~ THEN REPLY @1195 GOTO Divining
    IF ~Kit(Player1,MAGESCHOOL_DIVINER)~ THEN REPLY @1196 GOTO DiviningQuestion1
    IF ~!Kit(Player1,MAGESCHOOL_DIVINER)~ THEN REPLY @1196 GOTO DiviningQuestion2
  END
  
  IF ~~ THEN BEGIN DiviningQuestion1 SAY @1197
    IF ~~ THEN GOTO DiviningQuestion3
  END
  
  IF ~~ THEN BEGIN DiviningQuestion2 SAY @1198
    IF ~~ THEN GOTO DiviningQuestion3
  END
  
  IF ~~ THEN BEGIN DiviningQuestion3 SAY @1199
    IF ~~ THEN GOTO Divining
  END
  
  IF ~~ THEN BEGIN Divining SAY @1200
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",15)~ EXIT
  END

  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",16)~ THEN BEGIN DivinationComplete SAY @1201 = @1202
    IF ~~ THEN GOTO DiviningSucks
    IF ~GlobalGT("CDGemQuality","GLOBAL",4)~ THEN GOTO DiviningPoor
    IF ~GlobalGT("CDGemQuality","GLOBAL",8)~ THEN GOTO DiviningFair
    IF ~GlobalGT("CDGemQuality","GLOBAL",12)~ THEN GOTO DiviningGood
    IF ~Global("CDGemQuality","GLOBAL",15)~ THEN GOTO DiviningPerfect
  END
  
  IF ~~ THEN BEGIN DiviningSucks SAY @1203
    IF ~~ THEN GOTO GoGetBracersAlready
  END
  
  IF ~~ THEN BEGIN DiviningPoor SAY @1204
    IF ~~ THEN GOTO GoGetBracersAlready
  END

  IF ~~ THEN BEGIN DiviningFair SAY @1205
    IF ~~ THEN GOTO GoGetBracersAlready
  END

  IF ~~ THEN BEGIN DiviningGood SAY @1206
    IF ~~ THEN GOTO GoGetBracersAlready
  END

  IF ~~ THEN BEGIN DiviningPerfect SAY @1207
    IF ~~ THEN GOTO GoGetBracersAlready
  END

  IF ~~ THEN BEGIN GoGetBracersAlready SAY @1208 = @1209 = @1210 = @1211
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",17)~ EXIT
  END

  IF ~~ THEN BEGIN CDBeginBracerQuest SAY @1000
    IF ~~ THEN GOTO CDBeginBracerQuest_notmage
    IF ~Class(Player1,MAGE_ALL)~ THEN GOTO CDBeginBracerQuest_mage
  END

  IF ~~ THEN BEGIN CDBeginBracerQuest_mage SAY @1001
    IF ~~ THEN REPLY @1002 DO ~SetGlobal("CDPlayerHasCalling","GLOBAL",1)~ GOTO Accepted
    IF ~~ THEN REPLY @1003 GOTO MoreInfo
    IF ~~ THEN REPLY @1004 DO ~SetGlobal("CDBracerQuest","GLOBAL",98)~ GOTO Declined
    IF ~~ THEN REPLY @1005 DO ~~ EXTERN ~%tutu_var%MELICA~ Cluckers
    IF ~~ THEN REPLY @1006 GOTO MoreInfo
  END

  IF ~~ THEN BEGIN CDBeginBracerQuest_notmage SAY @1320
    IF ~~ THEN REPLY @1002 DO ~SetGlobal("CDPlayerHasCalling","GLOBAL",1)~ GOTO Accepted
    IF ~~ THEN REPLY @1003 GOTO MoreInfo
    IF ~~ THEN REPLY @1004 DO ~SetGlobal("CDBracerQuest","GLOBAL",98)~ GOTO Declined
    IF ~~ THEN REPLY @1005 DO ~~ EXTERN ~%tutu_var%MELICA~ Cluckers
    IF ~~ THEN REPLY @1006 GOTO MoreInfo
  END

  IF ~~ THEN BEGIN Declined SAY @1022
    IF ~~ THEN EXIT
  END

  IF ~~ THEN BEGIN MoreInfo SAY @1023 = @1024 = @1025
    IF ~~ THEN REPLY @1027 DO ~SetGlobal("CDBracerQuest","GLOBAL",1)~ GOTO Accepted
    IF ~~ THEN REPLY @1002 DO ~SetGlobal("CDPlayerHasCalling","GLOBAL",1)~ GOTO Accepted
    IF ~~ THEN REPLY @1028 DO ~SetGlobal("CDBracerQuest","GLOBAL",98)~ GOTO Declined
  END
  
  IF WEIGHT #-1 ~Global("CDBracerQuest","GLOBAL",2)~ THEN BEGIN QuestGivingPartI SAY @1016 = @1017
    IF ~~ THEN REPLY @1018 DO ~SetGlobal("CDBracerQuest","GLOBAL",3)~ GOTO HowWork
    IF ~~ THEN REPLY @1019 DO ~SetGlobal("CDBracerQuest","GLOBAL",3)~ GOTO WhereToStart
    IF ~~ THEN REPLY @1020 DO ~SetGlobal("CDBracerQuest","GLOBAL",3)~ GOTO Preferences
    IF ~~ THEN REPLY @1021 DO ~SetGlobal("CDBracerQuest","GLOBAL",3)~ GOTO OffIGo
  END
  
  IF ~~ THEN BEGIN HowWork SAY @1029
    IF ~~ THEN REPLY @1019 GOTO WhereToStart
    IF ~~ THEN REPLY @1020 GOTO Preferences
    IF ~~ THEN REPLY @1021 GOTO OffIGo
  END
  
  IF ~~ THEN BEGIN WhereToStart SAY @1030
    IF ~~ THEN REPLY @1018 GOTO HowWork
    IF ~~ THEN REPLY @1020 GOTO Preferences
    IF ~~ THEN REPLY @1021 GOTO OffIGo
  END
  
  IF ~~ THEN BEGIN Preferences SAY @1031
    IF ~Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1018 DO ~SetGlobal("CDBlackPearls","GLOBAL",1)~ GOTO HowWork
    IF ~Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1019 DO ~SetGlobal("CDBlackPearls","GLOBAL",1)~ GOTO WhereToStart
    IF ~Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1021 DO ~SetGlobal("CDBlackPearls","GLOBAL",1)~ GOTO OffIGo
    IF ~!Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1018 GOTO HowWork
    IF ~!Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1019 GOTO WhereToStart
    IF ~!Global("CDBlackPearls","GLOBAL",0)~ THEN REPLY @1021 GOTO OffIGo
  END
  
  IF ~~ THEN BEGIN OffIGo SAY @1032
    IF ~~ THEN EXIT
  END
  
  IF WEIGHT #-1 ~GlobalGT("CDBracerQuest","GLOBAL",2)
                 GlobalLT("CDBracerQuest","GLOBAL",6)~ THEN BEGIN GemsGemsGems SAY @1033
    IF ~~ THEN REPLY @1034 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1035 GOTO ForkEmOver
    IF ~~ THEN REPLY @1036 GOTO OffIGo
  END
  
  IF ~~ THEN BEGIN ForkEmOver SAY @1037
    IF ~Global("misc22","LOCALS",0)
        PartyHasItem("%tutu_var%misc22")~ THEN REPLY #7114 DO ~SetGlobal("misc22","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc22")
                                                      DestroyItem("%tutu_var%misc22")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // andar
    IF ~Global("misc33","LOCALS",0)
        PartyHasItem("%tutu_var%misc33")~ THEN REPLY #7130 DO ~SetGlobal("misc33","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc33")
                                                      DestroyItem("%tutu_var%misc33")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // aquamarine
    IF ~Global("cdbpearl","LOCALS",0)
        PartyHasItem("cdbpearl")~ THEN REPLY @125 DO ~SetGlobal("cdbpearl","LOCALS",1)
                                                      TakePartyItem("cdbpearl")
                                                      DestroyItem("cdbpearl")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",5)~ GOTO GemQ5 // black pearl
    IF ~Global("misc38","LOCALS",0)
        PartyHasItem("%tutu_var%misc38")~ THEN REPLY #7135 DO ~SetGlobal("misc38","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc38")
                                                      DestroyItem("%tutu_var%misc38")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // black opal
    IF ~Global("misc20","LOCALS",0)
        PartyHasItem("%tutu_var%misc20")~ THEN REPLY #7112 DO ~SetGlobal("misc20","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc20")
                                                      DestroyItem("%tutu_var%misc20")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // bloodstone
    IF ~Global("misc30","LOCALS",0)
        PartyHasItem("%tutu_var%misc30")~ THEN REPLY #7126 DO ~SetGlobal("misc30","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc30")
                                                      DestroyItem("%tutu_var%misc30")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // chrysoberyl
    IF ~Global("misc42","LOCALS",0)
        PartyHasItem("%tutu_var%misc42")~ THEN REPLY #7139 DO ~SetGlobal("misc42","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc42")
                                                      DestroyItem("%tutu_var%misc42")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO GemQ3 // diamond
    IF ~Global("misc43","LOCALS",0)
        PartyHasItem("%tutu_var%misc43")~ THEN REPLY #7140 DO ~SetGlobal("misc43","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc43")
                                                      DestroyItem("%tutu_var%misc43")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO GemQ3 // emerald
    IF ~Global("misc16","LOCALS",0)
        PartyHasItem("%tutu_var%misc16")~ THEN REPLY #7107 DO ~SetGlobal("misc16","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc16")
                                                      DestroyItem("%tutu_var%misc16")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // fire agate
    IF ~Global("misc34","LOCALS",0)
        PartyHasItem("%tutu_var%misc34")~ THEN REPLY #7131 DO ~SetGlobal("misc34","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc34")
                                                      DestroyItem("%tutu_var%misc34")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // garnet
    IF ~Global("misc35","LOCALS",0)
        PartyHasItem("%tutu_var%misc35")~ THEN REPLY #7132 DO ~SetGlobal("misc35","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc35")
                                                      DestroyItem("%tutu_var%misc35")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // horn coral
    IF ~Global("misc26","LOCALS",0)
        PartyHasItem("%tutu_var%misc26")~ THEN REPLY #7118 DO ~SetGlobal("misc26","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc26")
                                                      DestroyItem("%tutu_var%misc26")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // iol
    IF ~Global("misc23","LOCALS",0)
        PartyHasItem("%tutu_var%misc23")~ THEN REPLY #7115 DO ~SetGlobal("misc23","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc23")
                                                      DestroyItem("%tutu_var%misc23")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // jasper
    IF ~Global("misc44","LOCALS",0)
        PartyHasItem("%tutu_var%misc44")~ THEN REPLY #7141 DO ~SetGlobal("misc44","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc44")
                                                      DestroyItem("%tutu_var%misc44")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO GemQ3 // king's tear
    IF ~Global("misc17","LOCALS",0)
        PartyHasItem("%tutu_var%misc17")~ THEN REPLY #16521 DO ~SetGlobal("misc17","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc17")
                                                      DestroyItem("%tutu_var%misc17")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // lynx eye
    IF ~Global("misc40","LOCALS",0)
        PartyHasItem("%tutu_var%misc40")~ THEN REPLY #7137 DO ~SetGlobal("misc40","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc40")
                                                      DestroyItem("%tutu_var%misc40")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // moonbar
    IF ~Global("misc27","LOCALS",0)
        PartyHasItem("%tutu_var%misc27")~ THEN REPLY #7119 DO ~SetGlobal("misc27","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc27")
                                                      DestroyItem("%tutu_var%misc27")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // moonstone
    IF ~Global("misc45","LOCALS",0)
        PartyHasItem("%tutu_var%misc45")~ THEN REPLY #7142 DO ~SetGlobal("misc45","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc45")
                                                      DestroyItem("%tutu_var%misc45")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",5)~ GOTO GemQ5 // rogue stone
    IF ~Global("misc32","LOCALS",0)
        PartyHasItem("%tutu_var%misc32")~ THEN REPLY #7129 DO ~SetGlobal("misc32","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc32")
                                                      DestroyItem("%tutu_var%misc32")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // shandon
    IF ~Global("misc21","LOCALS",0)
        PartyHasItem("%tutu_var%misc21")~ THEN REPLY #7113 DO ~SetGlobal("misc21","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc21")
                                                      DestroyItem("%tutu_var%misc21")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // skydrop
    IF ~Global("misc37","LOCALS",0)
        PartyHasItem("%tutu_var%misc37")~ THEN REPLY #7134 DO ~SetGlobal("misc37","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc37")
                                                      DestroyItem("%tutu_var%misc37")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // sphene
    IF ~Global("misc31","LOCALS",0)
        PartyHasItem("%tutu_var%misc31")~ THEN REPLY #7128 DO ~SetGlobal("misc31","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc31")
                                                      DestroyItem("%tutu_var%misc31")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // star diopside
    IF ~Global("misc41","LOCALS",0)
        PartyHasItem("%tutu_var%misc41")~ THEN REPLY #7138 DO ~SetGlobal("misc41","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc41")
                                                      DestroyItem("%tutu_var%misc41")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",3)~ GOTO GemQ3 // star sapphire
    IF ~Global("misc18","LOCALS",0)
        PartyHasItem("%tutu_var%misc18")~ THEN REPLY #7109 DO ~SetGlobal("misc18","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc18")
                                                      DestroyItem("%tutu_var%misc18")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // sunstone
    IF ~Global("misc24","LOCALS",0)
        PartyHasItem("%tutu_var%misc24")~ THEN REPLY #7116 DO ~SetGlobal("misc24","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc24")
                                                      DestroyItem("%tutu_var%misc24")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // tchazar
    IF ~Global("misc19","LOCALS",0)
        PartyHasItem("%tutu_var%misc19")~ THEN REPLY #7110 DO ~SetGlobal("misc19","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc19")
                                                      DestroyItem("%tutu_var%misc19")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // turquoise
    IF ~Global("misc39","LOCALS",0)
        PartyHasItem("%tutu_var%misc39")~ THEN REPLY #7136 DO ~SetGlobal("misc39","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc39")
                                                      DestroyItem("%tutu_var%misc39")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",5)~ GOTO GemQ5 // water opal
    IF ~Global("misc28","LOCALS",0)
        PartyHasItem("%tutu_var%misc28")~ THEN REPLY #7124 DO ~SetGlobal("misc28","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc28")
                                                      DestroyItem("%tutu_var%misc28")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // waterstar
    IF ~Global("misc36","LOCALS",0)
        PartyHasItem("%tutu_var%misc36")~ THEN REPLY #7133 DO ~SetGlobal("misc36","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc36")
                                                      DestroyItem("%tutu_var%misc36")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",2)~ GOTO GemQ2 // white pearl
    IF ~Global("misc29","LOCALS",0)
        PartyHasItem("%tutu_var%misc29")~ THEN REPLY #7125 DO ~SetGlobal("misc29","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc29")
                                                      DestroyItem("%tutu_var%misc29")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",1)~ GOTO GemQ1 // ziose
    IF ~Global("misc25","LOCALS",0)
        PartyHasItem("%tutu_var%misc25")~ THEN REPLY #7117 DO ~SetGlobal("misc25","LOCALS",1)
                                                      TakePartyItem("%tutu_var%misc25")
                                                      DestroyItem("%tutu_var%misc25")
                                                      IncrementGlobal("CDGemQuality","GLOBAL",5)~ GOTO GemQ5 // zircon
    IF ~~ THEN REPLY @1038 GOTO OffIGo
    IF ~~ THEN REPLY @1039 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
  END

  IF ~~ THEN BEGIN GemQ1 SAY @1040
    IF ~~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO MoreGems
    IF ~Global("CDBracerQuest","GLOBAL",5)~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO AllGems
  END

  IF ~~ THEN BEGIN GemQ2 SAY @1041
    IF ~~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO MoreGems
    IF ~Global("CDBracerQuest","GLOBAL",5)~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO AllGems
  END

  IF ~~ THEN BEGIN GemQ3 SAY @1042
    IF ~~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO MoreGems
    IF ~Global("CDBracerQuest","GLOBAL",5)~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO AllGems
  END

  IF ~~ THEN BEGIN GemQ5 SAY @1043
    IF ~~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO MoreGems
    IF ~Global("CDBracerQuest","GLOBAL",5)~ THEN DO ~IncrementGlobal("CDBracerQuest","GLOBAL",1)~ GOTO AllGems
  END

  IF ~~ THEN BEGIN MoreGems SAY @1044
    IF ~~ THEN REPLY @1045 GOTO ForkEmOver
    IF ~~ THEN REPLY @1046 GOTO OffIGo
    IF ~~ THEN REPLY @1047 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
  END
  
  IF ~~ THEN BEGIN AllGems SAY @1048
    IF ~Global("CDBlackPearls","GLOBAL",1)~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO GemsSuck
    IF ~Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",4)~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO GemsPoor
    IF ~Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",8)~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO GemsFair
    IF ~Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",12)~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO GemsGood
    IF ~Global("CDBlackPearls","GLOBAL",1)
        Global("CDGemQuality","GLOBAL",15)~ THEN DO ~SetGlobal("CDBlackPearls","GLOBAL",3)~ GOTO GemsPerfect
    IF ~!Global("CDBlackPearls","GLOBAL",1)~ THEN GOTO GemsSuck
    IF ~!Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",4)~ THEN GOTO GemsPoor
    IF ~!Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",8)~ THEN GOTO GemsFair
    IF ~!Global("CDBlackPearls","GLOBAL",1)
        GlobalGT("CDGemQuality","GLOBAL",12)~ THEN GOTO GemsGood
    IF ~!Global("CDBlackPearls","GLOBAL",1)
        Global("CDGemQuality","GLOBAL",15)~ THEN GOTO GemsPerfect
  END

  IF ~~ THEN BEGIN GemsSuck SAY @1049
    IF ~~ THEN GOTO WheresMeli
  END

  IF ~~ THEN BEGIN GemsPoor SAY @1050
    IF ~~ THEN GOTO WheresMeli
  END

  IF ~~ THEN BEGIN GemsFair SAY @1051
    IF ~~ THEN GOTO WheresMeli
  END

  IF ~~ THEN BEGIN GemsGood SAY @1052
    IF ~~ THEN GOTO WheresMeli
  END

  IF ~~ THEN BEGIN GemsPerfect SAY @1053
    IF ~~ THEN GOTO WheresMeli
  END
  
  IF ~~ THEN BEGIN WheresMeli SAY @1054 = @1055
    IF ~~ THEN REPLY @1056 GOTO OffIGoToSeeTaerom
    IF ~Gender(LastTalkedToBy(),FEMALE)~ THEN REPLY @1057 DO ~SetGlobalTimer("CDMelicampReturns","GLOBAL",FOUR_DAYS)
                                                    SetGlobal("CDBracerQuest","GLOBAL",13)~ GOTO SkipMelicamp
    IF ~Gender(LastTalkedToBy(),MALE)~ THEN REPLY @1058 DO ~SetGlobalTimer("CDMelicampReturns","GLOBAL",FOUR_DAYS)
                                                  SetGlobal("CDBracerQuest","GLOBAL",13)~ GOTO SkipMelicamp
    IF ~~ THEN REPLY @1059 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
  END
  
  IF ~~ THEN BEGIN OffIGoToSeeTaerom SAY @1060
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",7)~ EXIT
  END

  IF ~~ THEN BEGIN SkipMelicamp SAY @1099
    IF ~~ THEN EXIT
  END
  
  IF ~~ THEN BEGIN IncantationQuestion SAY @1255 = @1256 = @1257
    IF ~~ THEN GOTO BeginIncantation
  END
  
  IF ~~ THEN BEGIN Behold SAY @1270 = @1271
    IF ~~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",20)~ EXIT
  END

  // round out in-progress dialogues
  IF ~~ THEN BEGIN BuzzOff SAY @1060
    IF ~~ THEN EXIT
  END
  
  IF WEIGHT #-1 ~!Global("D0TaintedOreQuest","GLOBAL",1)
                 !Global("D0TaintedOreQuest","GLOBAL",2)
                 GlobalGT("CDBracerQuest","GLOBAL",6)
                 GlobalLT("CDBracerQuest","GLOBAL",10)~ THEN BEGIN filler7 SAY @1307
    IF ~~ THEN REPLY @1308 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1309 GOTO BuzzOff
  END
  
  IF WEIGHT #-1 ~!Global("D0TaintedOreQuest","GLOBAL",1)
                 !Global("D0TaintedOreQuest","GLOBAL",2)
                 GlobalGT("CDBracerQuest","GLOBAL",9)
                 GlobalGT("CDBracerQuest","GLOBAL",12)~ THEN BEGIN filler10 SAY @1310
    IF ~~ THEN REPLY @1308 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1309 GOTO BuzzOff
  END
  
  IF WEIGHT #-1 ~!Global("D0TaintedOreQuest","GLOBAL",1)
                 !Global("D0TaintedOreQuest","GLOBAL",2)
                 Global("CDBracerQuest","GLOBAL",13)~ THEN BEGIN filler13 SAY @1311
    IF ~~ THEN REPLY @1308 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1309 GOTO BuzzOff
  END
  
  IF WEIGHT #-1 ~!Global("D0TaintedOreQuest","GLOBAL",1)
                 !Global("D0TaintedOreQuest","GLOBAL",2)
                 GlobalGT("CDBracerQuest","GLOBAL",16)
                 GlobalGT("CDBracerQuest","GLOBAL",19)~ THEN BEGIN filler17 SAY @1312
    IF ~~ THEN REPLY @1308 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1309 GOTO BuzzOff
  END
  
  IF WEIGHT #-1 ~!Global("D0TaintedOreQuest","GLOBAL",1)
                 !Global("D0TaintedOreQuest","GLOBAL",2)
                 GlobalGT("CDBracerQuest","GLOBAL",22)
                 GlobalLT("CDBracerQuest","GLOBAL",26)~ THEN BEGIN filler22 SAY @1313
    IF ~~ THEN REPLY @1308 DO ~StartStore("%tutu_scripth%IGHHEDG",LastTalkedToBy(Myself))~ EXIT
    IF ~~ THEN REPLY @1309 GOTO BuzzOff
  END

END

/////                                                  \\\\\
///// new dialogue files                               \\\\\
/////                                                  \\\\\

BEGIN CDGRACE

IF ~!GlobalGT("Chapter","GLOBAL",%tutu_chapter_2%)~ THEN BEGIN MinesNotDone SAY @1105
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",8)~ REPLY @1106 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",8)~ THEN REPLY @1109 GOTO WheresMeli
  IF ~~ THEN REPLY @1107 GOTO Goodbye
END

IF ~GlobalGT("Chapter","GLOBAL",%tutu_chapter_2%)~ THEN BEGIN MinesDone SAY @1111
  IF ~Global("CDBracerQuest","GLOBAL",7)~ THEN DO ~SetGlobal("CDBracerQuest","GLOBAL",8)~ REPLY @1106 GOTO WheresMeli
  IF ~Global("CDBracerQuest","GLOBAL",8)~ THEN REPLY @1109 GOTO WheresMeli
  IF ~~ THEN REPLY @1107 GOTO Goodbye
END

IF ~~ THEN BEGIN Goodbye SAY @1108
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN WheresMeli SAY @1110
  IF ~~ THEN EXIT
END

BEGIN CDMELI

IF ~Global("CDSal","MYAREA",2)
    Global("CDJames","MYAREA",2)~ THEN BEGIN QuestFinished SAY @1178 = @1179
  IF ~~ THEN DO ~GiveItemCreate("cdore",LastTalkedToBy(Myself),1,0,0)
                 SetGlobal("CDBracerQuest","GLOBAL",10)
                 SetGlobal("CDMinerQuest","MYAREA",2)
                 EscapeArea()~ EXIT
END

IF ~Global("CDMinerQuest","MYAREA",1)~ THEN BEGIN InProgress SAY @1168
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1170 GOTO SpeakSal
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1171 GOTO SpeakJames
  IF ~Global("CDSal","MYAREA",2)~ THEN REPLY @1172 GOTO KeepAtIt
  IF ~Global("CDJames","MYAREA",2)~ THEN REPLY @1173 GOTO KeepAtIt
  IF ~~ THEN REPLY @1169 GOTO GetToWork
END

IF ~Global("CDMinerQuest","MYAREA",0)~ THEN BEGIN NeedHelp SAY @1112 = @1113
  IF ~~ THEN REPLY @1114 GOTO MinerQuest
  IF ~~ THEN REPLY @1115 GOTO MinerQuest
END

IF ~~ THEN BEGIN MinerQuest SAY @1116 = @1117 = @1118 = @1119 = @1120 = @1121
  IF ~~ THEN REPLY @1122 DO ~SetGlobal("CDMinerQuest","MYAREA",99)~ GOTO MeliLeaves
  IF ~~ THEN REPLY @1123 GOTO MeliControl
  IF ~~ THEN REPLY @1124 DO ~SetGlobal("CDMinerQuest","MYAREA",1)~ GOTO QuestAccepted
END

IF ~~ THEN BEGIN MeliControl SAY @1129
  IF ~~ THEN REPLY @1122 DO ~SetGlobal("CDMinerQuest","MYAREA",99)~ GOTO MeliLeaves
  IF ~~ THEN REPLY @1124 DO ~SetGlobal("CDMinerQuest","MYAREA",1)~ GOTO QuestAccepted
END

IF ~~ THEN BEGIN QuestAccepted SAY @1130 = @1131 = @1132
  IF ~~ THEN REPLY @1133 GOTO OffYouGo
  IF ~~ THEN REPLY @1134 GOTO OffYouGo
END

IF ~~ THEN BEGIN OffYouGo SAY @1135
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SpeakSal SAY @1174
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN SpeakJames SAY @1175
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN KeepAtIt SAY @1176
  IF ~~ THEN EXIT
END

IF ~~ THEN BEGIN GetToWork SAY @1177
  IF ~~ THEN EXIT
END

BEGIN CDMINER1

IF ~RandomNum(1,6)~ THEN BEGIN TalkingHeads1 SAY @1136
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~RandomNum(2,6)~ THEN BEGIN TalkingHeads2 SAY @1137
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~RandomNum(3,6)~ THEN BEGIN TalkingHeads3 SAY @1138
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~RandomNum(4,6)~ THEN BEGIN TalkingHeads4 SAY @1139
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~RandomNum(5,6)~ THEN BEGIN TalkingHeads5 SAY @1140
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~RandomNum(6,6)~ THEN BEGIN TalkingHeads6 SAY @1141
  IF ~Global("CDSal","MYAREA",0)~ THEN EXIT
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1153 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1154 GOTO WrongAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1155 GOTO RightAnswer
  IF ~Global("CDSal","MYAREA",1)~ THEN REPLY @1156 GOTO WrongAnswer
END

IF ~~ THEN BEGIN WrongAnswer SAY @1157 = @1158
  IF ~~ THEN DO ~AddexperienceParty(50)
                 SetGlobal("CDSal","MYAREA",2)
                 EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN RightAnswer SAY @1159 = @1160
  IF ~~ THEN DO ~AddexperienceParty(100)
                 SetGlobal("CDSal","MYAREA",2)
                 EscapeArea()~ EXIT
END

BEGIN CDMINER2

IF ~RandomNum(1,6)~ THEN BEGIN TalkingHeads1 SAY @1136
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~RandomNum(2,6)~ THEN BEGIN TalkingHeads2 SAY @1137
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~RandomNum(3,6)~ THEN BEGIN TalkingHeads3 SAY @1138
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~RandomNum(4,6)~ THEN BEGIN TalkingHeads4 SAY @1139
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~RandomNum(5,6)~ THEN BEGIN TalkingHeads5 SAY @1140
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~RandomNum(6,6)~ THEN BEGIN TalkingHeads6 SAY @1141
  IF ~Global("CDJames","MYAREA",0)~ THEN EXIT
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1161 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1162 GOTO RightAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1163 GOTO WrongAnswer
  IF ~Global("CDJames","MYAREA",1)~ THEN REPLY @1164 GOTO WrongAnswer
END

IF ~~ THEN BEGIN WrongAnswer SAY @1165 = @1166
  IF ~~ THEN DO ~AddexperienceParty(50)
                 SetGlobal("CDJames","MYAREA",2)
                 EscapeArea()~ EXIT
END

IF ~~ THEN BEGIN RightAnswer SAY @1165 = @1167
  IF ~~ THEN DO ~AddexperienceParty(100)
                 SetGlobal("CDJames","MYAREA",2)
                 EscapeArea()~ EXIT
END

