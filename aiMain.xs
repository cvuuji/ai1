//==============================================================================
// Constants
//==============================================================================

// Temporary constants, to be deleted if implemented in C++

extern const int		cNumResourceTypes = 3;  // Gold, food, wood.
extern const float   baselineHandicap = 1.0;    // This is the handicap given to cDifficultyHard.  Our intent is to ship with this at 1.0,
                                                // meaning that hard has no handicap advantage or penalty.
                                                // All other difficulty levels will be adjusted relative to this constant.  This means that
                                                // we can gradually reduce this number as the AI's competence increases, and all the difficulty levels will respond.
extern int           gMaxPop = 200;             // Absolute hard limit pop cap for game...will be set lower on some difficulty levels 
extern const int     cMaxSettlersPerPlantation = 10;

// Start mode constants.
extern const int     cStartModeScenarioNoTC = 0;   // Scenario, wait for aiStart unit, then play without a TC
extern const int     cStartModeScenarioTC = 1;     // Scenario, wait for aiStart unit, then play with starting TC
extern const int     cStartModeScenarioWagon = 2;  // Scenario, wait for aiStart unit, then start TC build plan.
extern const int     cStartModeBoat = 3;           // RM or GC game, with a caravel start.  Wait to unload, then start TC build plan.
extern const int     cStartModeLandTC = 4;         // RM or GC game, starting with a TC...just go.
extern const int     cStartModeLandWagon = 5;      // RM or GC game, starting with a wagon.  Explore, start TC build plan.



//==============================================================================
// Econ variables
//==============================================================================
extern int  gGatherGoal = -1;       // Stores all top-level gatherer data
extern int  gFarmBaseID = -1;       // Current operating bases for each resource
extern int  gFoodBaseID = -1;
extern int  gGoldBaseID = -1;
extern int  gWoodBaseID = -1;
extern int  gNextFarmBaseID = -1;   // Overflow operating bases for each resource
extern int  gNextFoodBaseID = -1;
extern int  gNextGoldBaseID = -1;
extern int  gNextWoodBaseID = -1;
extern int  gPrevFarmBaseID = -1;   // Phasing-out bases for each resource
extern int  gPrevFoodBaseID = -1;
extern int  gPrevGoldBaseID = -1;
extern int  gPrevWoodBaseID = -1;

extern int  gDefaultDeck = -1;   // Home city deck used by each AI
extern bool gEarlyEconPhase = true; // Used to indicate that we're in a special startup econ phase, i.e. almost all food for most civs.
                                    // This is turned off when we decide it's time to go military, i.e when we build a barracks or get attacked
                                    // or reach age 2.
                                    
extern bool gTimeToFarm = false;    // Set true when we start to run out of cheap early food.
extern bool gTimeForPlantations = false;  // Set true when we start to run out of mine-able gold.

extern float gTSFactorDistance = -200.0;  // negative is good
extern float gTSFactorPoint = 10.0;			// positive is good
extern float gTSFactorTimeToDone = 0.0;	// positive is good
extern float gTSFactorBase = 100.0;			// positive is good
extern float gTSFactorDanger = -10.0;		// negative is good

extern int  gEconUnit = cUnitTypeSettler; // Set to coureur for French.
extern int  gHouseUnit = cUnitTypeHouse;  // Housing unit, different per civ.
extern int  gTowerUnit = cUnitTypeOutpost;   // Tower unit, blockhouse for Russians
extern int  gFarmUnit = cUnitTypeMill;    // Will be unitTypeFarm for natives and unitTypeypRicePaddy for Asians.
extern int  gPlantationUnit = cUnitTypePlantation;    // Will be unitTypeFarm for natives and unitTypeypRicePaddy for Asians.
extern int  gLivestockPenUnit = cUnitTypeLivestockPen;    // The Asians all have different ones.
extern int  gCoveredWagonUnit = cUnitTypeCoveredWagon;    // The Asians have a different type.
extern int  gMarketUnit = cUnitTypeMarket;    // The Asians have a different type.
extern int  gDockUnit = cUnitTypeDock;    // The Asians have a different type.

extern bool gFlagChosen = false;  // need to make sure they only build one

extern int  gLastTribSentTime = 0;

extern int  gEconUpgradePlan = -1;

extern bool gGoldEmergency = false;  // Set this true if we need a gold mine, and don't have enough wood.  Overrides econ to 100% wood.

extern int  gVPEscrowID = -1;       // Used to reserve resources for accelerator building.
extern int  gUpgradeEscrowID = -1;  // Used to reserve ships for age upgrades
// extern int  gHouseEscrowID = -1;    // Used to buy houses/manors only, off econ account.
extern int  gTowerEscrowID = -1;

extern int gTCBuildPlanID = -1;

extern int gStartMode = -1;    // See start mode constants, above.  This variable is set 
                        // in main() and is used to decide which cascades of rules
                        // should be used to start the AI.
                        
extern bool gGoodFishingMap = false;    // Set in init(), can be overridden in postInit() if desired.  True indicates that fishing is a good idea on this map.
extern int  gFishingPlan = -1;      // Plan ID for main fishing plan.
extern int gFishingBoatMaintainPlan = -1; // Fishing boats to maintain
extern int gFishingUnit = cUnitTypeFishingBoat; // Fishing Boat
extern int gNumFishBoats = 0;    // Set in the rule startFishing, higher for boomers.

extern int  gHerdPlanID = -1;
                        
extern int gSettlerMaintainPlan = -1;   // Main plan to control settler population

extern int gTransportUnit = cUnitTypeAbstractWarShip;  // hard coded ship type for now
extern int  gWaterTransportUnitMaintainPlan = -1;  // The plan that maintains all the ships
extern int  gWaterExplorePlan = -1;    // Plan ID for ocean exploration plan
extern bool gWaterMap = false;               // True when we are on a water map
extern int  gNavyDefendPlan = -1;
extern int  gNavyDefendPlan2 = -1;
extern int  gNavyAttackPlan = -1;

extern vector gTCSearchVector = cInvalidVector;  // Used to define the center of the TC building placement search.
extern int   gTCStartTime = 10000;                   // Used to define when the TC build plan can go active.  In ms.

extern int  gAgeUpResearchPlan = -1;      // Plan used to send politician from HC, used to detect if an age upgrade is in progress.

extern int  gAgeUpTime = 0;            // Time we entered this age

extern int gNuggetMessagePercentage = 100;
extern int gFeedGoldTo = -1;     // If set, this indicates which player we need to be supplying with regular gold shipments.
extern int gFeedWoodTo = -1;     // See commsHandler and monitorFeeding rule.
extern int gFeedFoodTo = -1;

extern const int  cForwardBaseStateNone = -1;      // None exists, none in progress
extern const int  cForwardBaseStateBuilding = 0;   // Fort wagon exists, but no fort yet.
extern const int  cForwardBaseStateActive = 1;     // Base is active, defend and train plans there.
extern int gForwardBaseState = cForwardBaseStateNone;
extern int gForwardBaseID = -1;                    // Set when state goes to Active
extern vector gForwardBaseLocation = cInvalidVector;  // Set when state goes to 'building' or earlier.
extern int gForwardBaseBuildPlan = -1;

extern int  gNativeDancePlan = -1;
extern int  gGoldPlanID = -1;

extern int  gIndiaCowMaintain = -1;
extern int  gAgeNeedFood = 800;
extern int  gAgeNeedGold = 0;
extern bool gDockReady = false;


//==============================================================================
// Military variables
//==============================================================================
extern int  gLandDefendPlan0 = -1;   // Primary land defend plan
extern int  gLandReservePlan = -1;     // Reserve defend plan, gathers units for use in the next military mission
//extern int  gWaterDefendPlan0 = -1;    // Primary water defend plan
extern int  gProtectPlan = -1;
extern int  gtestPlan1 = -1;
extern int  gtestPlan2 = -1;
extern int  grushPlan = -1;

extern bool gDefenseReflex = false;    // Set true when a defense reflex is overriding normal ops.
extern bool gDefenseReflexPaused = false; // Set true when we're in a defense reflex, but overwhelmed, so we're hiding to rebuild an army.
extern int  gDefenseReflexBaseID = -1; // Set to the base ID that we're defending in this emergency
extern vector  gDefenseReflexLocation = cInvalidVector;  // Location we're defending in this emergency
extern int  gDefenseReflexStartTime = 0;

extern int  gLandUnitPicker = -1;      // Picks the best land military units to train.
extern int  gMainAttackGoal = -1;      // Attack goal monitors opportunities, launches missions.
extern int  gLandMilUnitUpgradePlan = -1;    // The plan ID of the most recent unit upgrade plan
extern int  gArtilleryMaintainPlan = -1;     // Manual plan to force building of some siege.

extern int  gCaravelMaintain = -1;     // Maintain plans for naval units.
extern int  gGalleonMaintain = -1;
extern int  gFrigateMaintain = -1;
extern int  gMonitorMaintain = -1;
extern int  gWaterExploreMaintain = -1;

extern int  gCaravelUnit = cUnitTypeCaravel; // Will be Galley for Ottomans
extern int  gGalleonUnit = cUnitTypeGalleon; // Will be Fluyt for Dutch
extern int  gFrigateUnit = cUnitTypeFrigate; // Will be ypTekkousen for jp
extern int  gSiegeUnit = cUnitTypeMortar;

extern bool gNavyMap = false;    // Setting this false prevents navies
extern const int cNavyModeOff = 0;
//extern const int cNavyModeExplore = 1;
extern const int cNavyModeActive = 2;
extern int  gNavyMode = cNavyModeOff; // Tells us whether we're making no navy, just an exploring ship, or a full navy.
extern vector gNavyVec = cInvalidVector;  // The center of the navy's operations.


extern int  gPrimaryArmyUnit = -1;     // Main land unit type
extern int  gSecndaryArmyUnit = -1;    // Secondary land unit type
extern int  gTertiaryArmyUnit = -1;    // Tertiary land unit type
extern int  gNumArmyUnitTypes = 3;    // How many land unit types do we want to train?

extern int  gPrimaryNavyUnit = -1;     // Main water unit type
extern int  gSecndaryNavyUnit = -1;    // Secondary water unit type
extern int  gTertiaryNavyUnit = -1;    // Tertiary water unit type
extern int  gNumNavyUnitTypes = -1;    // How many water unit types do we want to train?

extern int  gGoodArmyPop = -1;         // This number is updated by the pop manager, to give a ballpark feel for the pop count needed to create a credible
                                       // attack army.  It is based on military pop allowed and game time, and is very sensitive to difficulty level.  
                                       // This is used by the strategyMaster rule to help decide when certain mission types make sense.  For example, if 
                                       // your available military pop is only 1/2 of gGoodArmyPop, a base attack would be foolish, but villager raiding or
                                       // claiming a VP site might be good choices.  


extern int  gUnitPickSource = cOpportunitySourceAutoGenerated;  // Indicates who decides which units are being trained...self, trigger, or ally player.
extern int  gUnitPickPlayerID = -1;                // If the source is cOpportunitySourceAllyRequest, this will hold the player ID.


extern int  gMostRecentAllyOpportunityID = -1;  // Which opportunity (if any) was created by an ally?  (Only one at a time allowed.)
extern int  gMostRecentTriggerOpportunityID = -1;  // Which opportunity (if any) was created by a trigger?  (Only one at a time allowed.)

extern int  gLastClaimMissionTime = -1;
extern int  gLastAttackMissionTime = -1;
extern int  gLastDefendMissionTime = -1;
extern int  gClaimMissionInterval = 600000;  // 10 minutes.  This variable indicates how long it takes for claim opportunities to score their maximum.  Typically, a new one will launch before this time.
extern int  gAttackMissionInterval = 180000; // 3 minutes.  Suppresses attack scores (linearly) for 3 minutes after one launches.  Attacks will usually happen before this period is over.
extern int  gDefendMissionInterval = 300000;  // 5 minutes.   Makes the AI less likely to do another defend right after doing one.
extern bool gDelayAttacks = false;     // Can be used on low difficulty levels to prevent attacks before the AI is attacked.  (AI is defend-only until this variable is
                                       // set false.


//==============================================================================
// Other global variables
//==============================================================================
extern bool gCardsReady = false;
extern bool gSPC = false;           // Set true in main if this is an spc or campaign game
extern int  gExplorerControlPlan = -1; // Defend plan set up to control the explorer's location
extern int  gLandExplorePlan = -1;  // Primary land exploration

extern int  gIndConsulateProc = 1;
extern int  gRushBuilding1 = -1;
extern int  gRushBuilding2 = -1;
extern int  gMainBase = -1;
extern vector gFbVec = cInvalidVector;

extern int  gcVPTypeAny = 0;
extern int  gcVPTypeNative = cVPNative;
extern int  gcVPTypeSecret = cVPSecret;
extern int  gcVPTypeTrade = cVPTrade;


extern float gInitRushBoom = 0.0;
extern float gInitOffenseDefense = 0.0;
extern float gInitBiasCav = 0.0;
extern float gInitBiasInf = 0.0;
extern float gInitBiasArt = 0.0;
extern float gInitBiasNative = 0.0;
extern float gInitBiasTrade = 0.0;


extern bool gIAmCaptain = false;
extern int  gCaptainPlayerNumber = -1;

extern int  gResignType = -1;       // Reason for AI requesting permission to resign

extern bool gBuildWalls = false;    // Global indicating if we're walling up or not.
extern int  gNumTowers = -1;        // How many towers do we want to build?
extern int  gPrevNumTowers = -1;     // Set when a command is received, to allow resetting when a cancel is received.

extern bool gIsMonopolyRunning = false; // Set true while a monopoly countdown is in effect.
extern int  gMonopolyTeam = -1;         // TeamID of team that will win if the monopoly timer completes.
extern int  gMonopolyEndTime = -1;      // Gametime when current monopoly should end

extern bool gIsKOTHRunning = false; // Set true while a KOTH countdown is in effect.
extern int  gKOTHTeam = -1;         // TeamID of team that will win if the KOTH timer completes.


//==============================================================================
// Function forward declarations.
//
// Used in loader file to override default values, called at start of main()
mutable void preInit(void) {}

// Used in loader file to override initialization decisions, called at end of main()
mutable void postInit(void) {}

mutable void econMaster(int mode=-1, int value=-1) {}
mutable void shipGrantedHandler(int parm=-1) {}
mutable int initUnitPicker(string name="BUG", int numberTypes=1, int minUnits=10,int maxUnits=20, int minPop=-1, int maxPop=-1, int numberBuildings=1, bool guessEnemyUnitType=false) {return(-1);}
mutable void updateForecasts(void) {}
mutable void setUnitPickerPreference(int upID=-1) {}
mutable void endDefenseReflex(void) {}

   
//==============================================================================
// Global Arrays
//==============================================================================
// Forecast float array initialized below.
extern int  gForecasts = -1;

// Percentage of gatherers assigned.  Array.
extern int  gTargetGathererPercents = -1;

extern int  gMapNames = -1;   // An array of random map names, so we can store ID numbers in player histories

extern int  gTargetSettlerCounts = -1; // How many settlers do we want per age?

extern int  gConsulateTechs = -1; //List of all the consulate techs
extern int  gConsulateTechsSize = -1; //Size of the list of all the consulate techs

extern int  gAsianWonders = -1; //List of wonders for the asian civs

extern int  gCardValues = -1;

//==============================================================================
/* initArrays()
   Initialize all global arrays here, to make it easy to find var type and size.
*/
//==============================================================================
void initArrays(void)
{
   gForecasts = xsArrayCreateFloat(cNumResourceTypes, 0.0, "Forecasts");
   gTargetGathererPercents = xsArrayCreateFloat(cNumResourceTypes, 0.0, "Gatherer Percents");
   gMapNames = xsArrayCreateString(50, "", "Map names");
      xsArraySetString(gMapNames, 0, "amazonia");
      xsArraySetString(gMapNames, 1, "bayou");
      xsArraySetString(gMapNames, 2, "caribbean");
      xsArraySetString(gMapNames, 3, "carolina");
      xsArraySetString(gMapNames, 4, "great lakes");
      xsArraySetString(gMapNames, 5, "great plains");
      xsArraySetString(gMapNames, 6, "new england");
      xsArraySetString(gMapNames, 7, "pampas");
      xsArraySetString(gMapNames, 8, "patagonia");
      xsArraySetString(gMapNames, 9, "rockies");
      xsArraySetString(gMapNames, 10, "saguenay");
      xsArraySetString(gMapNames, 11, "sonora");
      xsArraySetString(gMapNames, 12, "texas");
      xsArraySetString(gMapNames, 13, "yucatan");
      xsArraySetString(gMapNames, 14, "yukon");
      xsArraySetString(gMapNames, 15, "great plainsLarge");
      xsArraySetString(gMapNames, 16, "carolinalarge");
      xsArraySetString(gMapNames, 17, "saguenayLarge");
      xsArraySetString(gMapNames, 18, "sonoraLarge");
      xsArraySetString(gMapNames, 19, "texasLarge");
      xsArraySetString(gMapNames, 20, "hispaniola");
      xsArraySetString(gMapNames, 21, "andes");
      xsArraySetString(gMapNames, 22, "ozarks");
      xsArraySetString(gMapNames, 23, "araucania");
      xsArraySetString(gMapNames, 24, "california");
      xsArraySetString(gMapNames, 25, "grand canyon");
      xsArraySetString(gMapNames, 26, "northwest territory");
      xsArraySetString(gMapNames, 27, "painted desert");
      xsArraySetString(gMapNames, 28, "unknown");
      xsArraySetString(gMapNames, 29, "Borneo");
      xsArraySetString(gMapNames, 30, "Ceylon");
      xsArraySetString(gMapNames, 31, "Deccan");
      xsArraySetString(gMapNames, 32, "Himalayas");
      xsArraySetString(gMapNames, 33, "Honshu");
      xsArraySetString(gMapNames, 34, "Mongolia");
      xsArraySetString(gMapNames, 35, "silkRoad");
      xsArraySetString(gMapNames, 36, "Yellow riverDry");
      xsArraySetString(gMapNames, 37, "Yellow riverLarge");
      xsArraySetString(gMapNames, 38, "deccanLarge");
      xsArraySetString(gMapNames, 39, "himalayasUpper");
      xsArraySetString(gMapNames, 40, "honshuRegicide");
      xsArraySetString(gMapNames, 41, "indochina");
      xsArraySetString(gMapNames, 42, "plymouth");
      xsArraySetString(gMapNames, 43, "siberia");
      xsArraySetString(gMapNames, 44, "siberiaLarge");
      xsArraySetString(gMapNames, 45, "silkRoadLarge");
      
     int n = 70;
	 if(cMyCiv == cCivGermans)
	    n = 50;
	 gTargetSettlerCounts = xsArrayCreateInt(cAge5+1, 0, "Target Settler Counts");
        xsArraySetInt(gTargetSettlerCounts, cAge1, n);
        xsArraySetInt(gTargetSettlerCounts, cAge2, n);
        xsArraySetInt(gTargetSettlerCounts, cAge3, n);
        xsArraySetInt(gTargetSettlerCounts, cAge4, n);
        xsArraySetInt(gTargetSettlerCounts, cAge5, n);
     
     gCardValues = xsArrayCreateInt(25, 0, "My Deck Values");
        for (i=0; <25)
           xsArraySetInt(gCardValues, i, 0);
	 //BHG: JFR: if we are in deatmatch we dont want to research the consulate tech that takes us to age 5
     if (aiGetGameMode() == cGameModeDeathmatch) {
      gConsulateTechsSize = 22;
     }else{
      gConsulateTechsSize = 22;
     }
     //...BHG: JFR:
     
     gConsulateTechs = xsArrayCreateInt(22, 0, "Consulate Tech IDs");
        xsArraySetInt(gConsulateTechs, 0, cTechypConsulateBritishBrigade);
        xsArraySetInt(gConsulateTechs, 1, cTechypConsulateBritishLifeGuards);
        xsArraySetInt(gConsulateTechs, 2, cTechypConsulateBritishRogersRangers);
		xsArraySetInt(gConsulateTechs, 3, cTechypConsulateDutchBrigade);
		xsArraySetInt(gConsulateTechs, 4, cTechypConsulateDutchArsenalWagon);
		xsArraySetInt(gConsulateTechs, 5, cTechypConsulateDutchSaloonWagon);
        xsArraySetInt(gConsulateTechs, 6, cTechypConsulateFrenchBrigade);
        xsArraySetInt(gConsulateTechs, 7, cTechypConsulateFrenchCoinCrates);
        xsArraySetInt(gConsulateTechs, 8, cTechypConsulateFrenchFoodCrates);
		xsArraySetInt(gConsulateTechs, 9, cTechypConsulateFrenchWoodCrates);
        xsArraySetInt(gConsulateTechs, 10, cTechypConsulateFrenchHotAirBalloonsPreq);
        xsArraySetInt(gConsulateTechs, 11, cTechypConsulateGermansBrigade);
        xsArraySetInt(gConsulateTechs, 12, cTechypConsulateGermansCoinTrickle);
        xsArraySetInt(gConsulateTechs, 13, cTechypConsulateGermansFoodTrickle);
        xsArraySetInt(gConsulateTechs, 14, cTechypConsulateGermansWoodTrickle);
        xsArraySetInt(gConsulateTechs, 15, cTechypConsulateOttomansBrigade);
        xsArraySetInt(gConsulateTechs, 16, cTechypConsulateOttomansGunpowderSiege);
        xsArraySetInt(gConsulateTechs, 17, cTechypConsulateOttomansInfantrySpeed);  
        xsArraySetInt(gConsulateTechs, 18, cTechypConsulateJapaneseMasterTraining);
		xsArraySetInt(gConsulateTechs, 19, cTechypConsulateDutchChurchWagon);
		xsArraySetInt(gConsulateTechs, 20, cTechypConsulateRussianFortWagon);
		xsArraySetInt(gConsulateTechs, 21, cTechypConsulateRussianFactoryWagon);
        //...BHG: JFR:
        
     gAsianWonders = xsArrayCreateInt(5, 0, "Wonder Age IDs");
    
     if ((cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy)) {
     //Giant Buddha, Golden Pavillion, Shogunate, Torii Gates, Toshogu Shrine 
		  xsArraySetInt(gAsianWonders, 0, cUnitTypeypWJToriiGates2);
          xsArraySetInt(gAsianWonders, 1, cUnitTypeypWJGoldenPavillion3);
          xsArraySetInt(gAsianWonders, 2, cUnitTypeypWJShogunate4);
          xsArraySetInt(gAsianWonders, 3, cUnitTypeypWJToshoguShrine5);
     }
      if ((cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese)) {
      //Confucian Academy, Porcelain Tower, Summer Palace, Temple of Heaven, White Pagoda
		  xsArraySetInt(gAsianWonders, 0, cUnitTypeypWCSummerPalace2);
          xsArraySetInt(gAsianWonders, 1, cUnitTypeypWCPorcelainTower3);
          xsArraySetInt(gAsianWonders, 2, cUnitTypeypWCTempleOfHeaven4);
          xsArraySetInt(gAsianWonders, 3, cUnitTypeypWCWhitePagoda5);
     }
     if ((cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians)) {
     //Agra Fort, Charminar Gate, Karni Mata, Taj Mahal, Tower of Victory TajMahal
		  xsArraySetInt(gAsianWonders, 0, cUnitTypeypWIAgraFort2);
          xsArraySetInt(gAsianWonders, 1, cUnitTypeypWIKarniMata3);
          xsArraySetInt(gAsianWonders, 2, cUnitTypeypWITajMahal4);
          xsArraySetInt(gAsianWonders, 3, cUnitTypeypWICharminarGate5);
     }
     
}

//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// Utility functions
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
void sendChatToAllies(string text="")
{
   int player = -1;
   
   for (player = 0; <cNumberPlayers)
   {
      if ( (player != cMyID) && (kbIsPlayerAlly(player) == true))
         aiChat(player, text);
   }
}

bool civIsNative(void)
{
   if ((cMyCiv == cCivXPAztec) || (cMyCiv == cCivXPIroquois) || (cMyCiv == cCivXPSioux))
      return(true);
   
   return(false);
}

bool civIsAsian(void)
{
   if ((cMyCiv == cCivJapanese) || (cMyCiv == cCivChinese) || (cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians) || (cMyCiv == cCivSPCChinese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy))
      return(true);
   
   return(false);
}


int getSettlerShortfall()
{  // How many more Settlers do we currently want?
   int retVal = 0;
   float villTarget = xsArrayGetInt(gTargetSettlerCounts, kbGetAge());  // How many we want to have this age
   float villCount = kbUnitCount(cMyID, gEconUnit, cUnitStateABQ);   // How many we have

   retVal = villTarget - villCount;

   return(retVal);
}


bool agingUp()
{
   bool retVal = false;
   if (aiPlanGetState(gAgeUpResearchPlan) == cPlanStateResearch)
      retVal = true;

   return(retVal);
}

int getWonderToBuild(int the_age=-1)
{
  if ((cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapanese)) {
    //Giant Buddha, Golden Pavillion, Shogunate, Torii Gates, Toshogu Shrine
    //age2
    if (the_age == cAge2) {
      return (cUnitTypeypWJGiantBuddha2);
    }
    //age3
    else if (the_age == cAge3) {
      return (cUnitTypeypWJToriiGates3);
    }
    //age4
    else if (the_age == cAge4) {
      return (cUnitTypeypWJShogunate4);
    }
    //age5
    else if (the_age == cAge5) {
      return (cUnitTypeypWJToshoguShrine5);
    }
  }
  if ((cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese)) {
    //age2
    if (the_age == cAge2) {
      return (cUnitTypeypWCPorcelainTower2);
    }
    //age3
    else if (the_age == cAge3) {
      return (cUnitTypeypWCSummerPalace3);
    }
    //age4
    else if (the_age == cAge4) {
      return (cUnitTypeypWCTempleOfHeaven4);
    }
    //age5
    else if (the_age == cAge5) {
      return (cUnitTypeypWCWhitePagoda5);
    }
  }
  if ((cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians)) {
    //age2
    if (the_age == cAge2) {
      return (cUnitTypeypWICharminarGate2);
    }
    //age3
    else if (the_age == cAge3) {
      return (cUnitTypeypWIKarniMata3);
    }
    //age4
    else if (the_age == cAge4) {
      return (cUnitTypeypWITajMahal4);
    }
    //age5
    else if (the_age == cAge5) {
      return (cUnitTypeypWIAgraFort5);
    }
  }
  
  return (-1);
}

int getPreferredWonderToBuild(int the_age=-1)
{
  if (the_age == cAge2) {
    return(xsArrayGetInt(gAsianWonders, 0));
  }
  //age3
  else if (the_age == cAge3) {
    return(xsArrayGetInt(gAsianWonders, 1));
  }
  //age4
  else if (the_age == cAge4) {
    return(xsArrayGetInt(gAsianWonders, 2));
  }
  //age5
  else if (the_age == cAge5) {
    if (aiGetGameMode() == cGameModeDeathmatch) {
      return(-1); //BHG:CGN: don't try to get to age 5 in a deathmatch game
    }
    return(xsArrayGetInt(gAsianWonders, 3));
  }
  return (-1);
}

//==============================================================================
/* createOpportunity(type, targetType, targetID, targetPlayerID, source)

   A wrapper function for aiCreateOpportunity(), to permit centralized tracking
   of the most recently created ally-generated and trigger-generated 
   opportunities.  This info is needed so that a cancel command can
   efficiently deactivate the previous (and possibly current) opportunity before
   creating the new one.
*/
//==============================================================================
int createOpportunity(int type = -1, int targetType = -1, int targetID = -1, int targetPlayerID = -1, int source = -1)
{
   int oppID = aiCreateOpportunity(type, targetType, targetID, targetPlayerID, source);
   if (source == cOpportunitySourceAllyRequest)
      gMostRecentAllyOpportunityID = oppID; // Remember which ally opp we're doing
   else if (source == cOpportunitySourceTrigger)
      gMostRecentTriggerOpportunityID = oppID;
   
   return(oppID);
}



//==============================================================================
/* sendStatement(player, commPromptID, vector)

  Sends a chat statement, but first checks the control variables and updates the
  "ok to chat" state.   This is a gateway for routine "ambience" personality chats.
  Another function will be written as a gateway for strategic communications, i.e.
  requests for defence, tribute, joint operations, etc.  That one will be controlled by 
  the cvOkToChat variable.
  
  If vector is not cInvalidVector, it will be added as a flare
*/
//==============================================================================
bool sendStatement(int playerIDorRelation = -1, int commPromptID = -1, vector vec = cInvalidVector)
{
   aiEcho("<<<<<SEND STATEMENT to player "+playerIDorRelation+", commPromptID = "+commPromptID+", vector "+vec+">>>>>");
   // Routine "ambience" chats are not allowed
	if (cvOkToTaunt == false)
   {
      // Failed, no chat sent
		// Make sure the C++ side knows about it
		aiCommsAllowChat(false);
      return(false);
   }
   
   // If we got this far, it's OK.
	aiCommsAllowChat(true);

   //commPromptID = cAICommPromptToEnemyHeIsStillAgeBehind;
   // It's a player ID, not a relation.
	if (playerIDorRelation < 100)
   {
      int playerID = playerIDorRelation;
      if (vec == cInvalidVector)
         aiCommsSendStatement(playerID, commPromptID);
      else
         aiCommsSendStatementWithVector(playerID, commPromptID, vec);
   }
   else  // Then it's a player relation
   {
      int player = -1;
      for (player = 1; < cNumberPlayers)
      {
         bool send = false;
         switch(playerIDorRelation)
         {
            case cPlayerRelationAny:
            {
               send = true;
               break;
            }
            case cPlayerRelationSelf:
            {
               if (player == cMyID)
                  send = true;
               break;
            }
            case cPlayerRelationAlly:
            {
               send = kbIsPlayerAlly(player);

					// Don't talk to myself, even though I am my ally.
               if (player == cMyID)
                  send = false;     
               break;
            }
            case cPlayerRelationEnemy:
            {
               send = kbIsPlayerEnemy(player);
               break;
            }
            case cPlayerRelationEnemyNotGaia:
            {
               send = kbIsPlayerEnemy(player);
               break;
            }
         }
         if (send == true)
         {
            aiEcho("<<<<<Sending chat prompt "+commPromptID+" to player "+player+" with vector "+vec+">>>>>");
            if (vec == cInvalidVector)
               aiCommsSendStatement(player, commPromptID);
            else
               aiCommsSendStatementWithVector(player, commPromptID, vec);
         }
      }
   }
   return(true);
}







//==============================================================================
// Plan Chat functions
//
//==============================================================================


// Set the attack plan to trigger a message and optional flare when the plan reaches the specified state.
// See the event handler below.
bool setPlanChat(int plan=-1, int state=-1, int prompt=-1, int player=-1, vector flare=cInvalidVector)
{
 
   // State -1 could be valid for action on plan termination
	if ( (plan < 0) || (prompt < 0) || (player < 0) )
      return(false);    

	aiPlanSetEventHandler(plan, cPlanEventStateChange, "planStateEventHandler");

   aiPlanAddUserVariableInt(plan, 0, "Key State", 1);
   aiPlanAddUserVariableInt(plan, 1, "Prompt ID", 1);
   aiPlanAddUserVariableInt(plan, 2, "Send To", 1);
   aiPlanAddUserVariableVector(plan, 3, "Flare Vector", 1);
   
   aiPlanSetUserVariableInt(plan, 0, 0, state);
   aiPlanSetUserVariableInt(plan, 1, 0, prompt);
   aiPlanSetUserVariableInt(plan, 2, 0, player);
   aiPlanSetUserVariableVector(plan, 3, 0, flare);
   
   return(true);
}

void  planStateEventHandler(int planID=-1)
{
   aiEcho("    Plan "+aiPlanGetName(planID)+" is now in state "+aiPlanGetState(planID));

   // Plan planID has changed states.  Get its state, compare to target, issue chat if it matches
   int state = aiPlanGetUserVariableInt(planID, 0, 0);
   int prompt = aiPlanGetUserVariableInt(planID, 1, 0);
   int player = aiPlanGetUserVariableInt(planID, 2, 0);
   vector flare = aiPlanGetUserVariableVector(planID, 3, 0);
   
   if ( aiPlanGetState(planID) == state )
   {
      // We have a winner, send the chat statement
      sendStatement(player, prompt, flare);
      //clearPlanChat(index);
   }
}


void tcPlacedEventHandler(int planID=-1)
{
   // Check the state of the TC build plan.
   // Fire an ally chat if the state is "build"
   if (aiPlanGetState(planID) == cPlanStateBuild)
   {
      vector loc = kbBuildingPlacementGetResultPosition( aiPlanGetVariableInt(planID,cBuildPlanBuildingPlacementID, 0) ); 
      sendStatement(cPlayerRelationAlly, cAICommPromptToAllyIWillBuildTC, loc);
      aiEcho("Sending TC placement chat at location "+loc);
   }
}

//==============================================================================
// distance
//
// Will return a float with the 3D distance between two vectors                     
//==============================================================================
float distance(vector v1=cInvalidVector, vector v2=cInvalidVector)
{
   vector delta = v1 - v2;
   return (xsVectorLength(delta));
}

//==============================================================================
// getUnit
//
// Will return a random unit matching the parameters
//==============================================================================
int getUnit(int unitTypeID=-1, int playerRelationOrID=cMyID, int state=cUnitStateAlive)
{
   int count=-1;
   static int unitQueryID=-1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("miscGetUnitQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
   }

	//Define a query to get all matching units
	if (unitQueryID != -1)
	{
      if (playerRelationOrID > 1000)      // Too big for player ID number
      {
      	kbUnitQuerySetPlayerID(unitQueryID, -1);  // Clear the player ID, so playerRelation takes precedence.
         kbUnitQuerySetPlayerRelation(unitQueryID, playerRelationOrID);
      }
      else
      {
         kbUnitQuerySetPlayerRelation(unitQueryID, -1);
      	kbUnitQuerySetPlayerID(unitQueryID, playerRelationOrID);
      }
      kbUnitQuerySetUnitType(unitQueryID, unitTypeID);
      kbUnitQuerySetState(unitQueryID, state);
	}
	else
   	return(-1);

   kbUnitQueryResetResults(unitQueryID);
	int numberFound=kbUnitQueryExecute(unitQueryID);
   if (numberFound > 0)
      return(kbUnitQueryGetResult(unitQueryID, aiRandInt(numberFound)));   // Return a random dude(tte)
   return(-1);
}

//==============================================================================
// createSimpleAttackGoal
//==============================================================================
int createSimpleAttackGoal(string name="BUG", int attackPlayerID=-1,
									int unitPickerID=-1, int repeat=-1, int minAge=-1, int maxAge=-1,
									int baseID=-1, bool allowRetreat=false)
{
	aiEcho("CreateSimpleAttackGoal:  Name="+name+", AttackPlayerID="+attackPlayerID+".");
	aiEcho("  UnitPickerID="+unitPickerID+", Repeat="+repeat+", baseID="+baseID+".");
	aiEcho("  MinAge="+minAge+", maxAge="+maxAge+", allowRetreat="+allowRetreat+".");

	//Create the goal.
	int goalID=aiPlanCreate(name, cPlanGoal);
	if (goalID < 0)
		return(-1);

	//Priority.
	aiPlanSetDesiredPriority(goalID, 94);
	//Attack player ID.
	if (attackPlayerID >= 0)
		aiPlanSetVariableInt(goalID, cGoalPlanAttackPlayerID, 0, attackPlayerID);
	else
		aiPlanSetVariableBool(goalID, cGoalPlanAutoUpdateAttackPlayerID, 0, true);
	//Base.
	if (baseID >= 0)
		aiPlanSetBaseID(goalID, baseID);
	else
		aiPlanSetVariableBool(goalID, cGoalPlanAutoUpdateBase, 0, true);
	//Attack.
	aiPlanSetAttack(goalID, true);
	aiPlanSetVariableInt(goalID, cGoalPlanGoalType, 0, cGoalPlanGoalTypeAttack);
	aiPlanSetVariableInt(goalID, cGoalPlanAttackStartFrequency, 0, 4);
	
	//Military.
	aiPlanSetMilitary(goalID, true);
	aiPlanSetEscrowID(goalID, cMilitaryEscrowID);
	//Ages.
	aiPlanSetVariableInt(goalID, cGoalPlanMinAge, 0, minAge);
	aiPlanSetVariableInt(goalID, cGoalPlanMaxAge, 0, maxAge);
	//Repeat.
	aiPlanSetVariableInt(goalID, cGoalPlanRepeat, 0, repeat);
	//Unit Picker.
	aiPlanSetVariableInt(goalID, cGoalPlanUnitPickerID, 0, unitPickerID);
	//Retreat.
	aiPlanSetVariableBool(goalID, cGoalPlanAllowRetreat, 0, allowRetreat);
	aiPlanSetVariableBool(goalID, cGoalPlanSetAreaGroups, 0, true);
	//Handle maps where the enemy player is usually on a diff island.
	if ( (cRandomMapName == "caribbean") || (cRandomMapName == "ceylon") )
	{
		aiPlanSetVariableInt(goalID, cGoalPlanAttackRoutePatternType, 0, cAttackPlanAttackRoutePatternRandom);
	}

	//Done.
	return(goalID);
}


//==============================================================================
// getUnitByLocation
//
// Will return a random unit matching the parameters
//==============================================================================
int getUnitByLocation(int unitTypeID=-1, int playerRelationOrID=cMyID, int state=cUnitStateAlive, vector location = cInvalidVector, float radius = 20.0)
{
   int count=-1;
   static int unitQueryID=-1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("miscGetUnitLocationQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
   }

	//Define a query to get all matching units
	if (unitQueryID != -1)
	{
      if (playerRelationOrID > 1000)      // Too big for player ID number
      {
      	kbUnitQuerySetPlayerID(unitQueryID, -1);
         kbUnitQuerySetPlayerRelation(unitQueryID, playerRelationOrID);
      }
      else
      {
         kbUnitQuerySetPlayerRelation(unitQueryID, -1);
      	kbUnitQuerySetPlayerID(unitQueryID, playerRelationOrID);
      }
      kbUnitQuerySetUnitType(unitQueryID, unitTypeID);
      kbUnitQuerySetState(unitQueryID, state);
      kbUnitQuerySetPosition(unitQueryID, location);
      kbUnitQuerySetMaximumDistance(unitQueryID, radius);
	}
	else
   	return(-1);

   kbUnitQueryResetResults(unitQueryID);
	int numberFound=kbUnitQueryExecute(unitQueryID);
   if (numberFound > 0)
      return(kbUnitQueryGetResult(unitQueryID, aiRandInt(numberFound)));   // Return a random dude(tte)
   return(-1);
}




//==============================================================================
// getUnitCountByLocation
//
// Returns the number of matching units in the point/radius specified
//==============================================================================
int getUnitCountByLocation(int unitTypeID=-1, int playerRelationOrID=cMyID, int state=cUnitStateAlive, vector location = cInvalidVector, float radius = 20.0)
{
   int count=-1;
   static int unitQueryID=-1;
   
   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("miscGetUnitLocationQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
   }

	//Define a query to get all matching units
	if (unitQueryID != -1)
	{
      if (playerRelationOrID > 1000)      // Too big for player ID number
      {
      	kbUnitQuerySetPlayerID(unitQueryID, -1);
         kbUnitQuerySetPlayerRelation(unitQueryID, playerRelationOrID);
      }
      else
      {
         kbUnitQuerySetPlayerRelation(unitQueryID, -1);
      	kbUnitQuerySetPlayerID(unitQueryID, playerRelationOrID);
      }
      kbUnitQuerySetUnitType(unitQueryID, unitTypeID);
      kbUnitQuerySetState(unitQueryID, state);
      kbUnitQuerySetPosition(unitQueryID, location);
      kbUnitQuerySetMaximumDistance(unitQueryID, radius);
	}
	else
   	return(-1);

   kbUnitQueryResetResults(unitQueryID);
	return(kbUnitQueryExecute(unitQueryID));
}




//==============================================================================
// getPlayerArmyHPs
//
// Queries all land military units.  
// Totals hitpoints (ideal if considerHealth false, otherwise actual.)
// Returns total
//==============================================================================
float getPlayerArmyHPs(int playerID = -1, bool considerHealth = false)
{
   int queryID = -1;    // Will recreate each time, as changing player trashes existing query settings.
   
   if (playerID <= 0) 
      return(-1.0);
   
   queryID = kbUnitQueryCreate("getStrongestEnemyArmyHPs");
   kbUnitQuerySetIgnoreKnockedOutUnits(queryID, true);
   kbUnitQuerySetPlayerID(queryID, playerID, true);
   kbUnitQuerySetUnitType(queryID, cUnitTypeLogicalTypeLandMilitary);
   kbUnitQuerySetState(queryID, cUnitStateAlive);
   kbUnitQueryResetResults(queryID);
   kbUnitQueryExecute(queryID);
   
   return(kbUnitQueryGetUnitHitpoints(queryID, considerHealth));
}


//==============================================================================
/* sigmoid(float base, float adjustment, float floor, float ceiling)

   Used to adjust a number up or down in a sigmoid fashion, so that it
   grows very slowly at values near the bottom of the range, quickly near
   the center, and slowly near the upper limit.  

   Used with the many 0..1 range variables, this lets us adjust them up
   or down by arbitrary "percentages" while retaining the 0..1 boundaries.  
   That is, a 50% "boost" (1.5 adjustment) to a .9 score gives .933, while a


   Base is the number to be adjusted.
   Adjustment of 1.0 means 100%, i.e. stay where you are.
   Adjustment of 2.0 means to move it up by the LESSER movement of:
      Doubling the (base-floor) amount, or
      Cutting the (ceiling-base) in half (mul by 1/2.0).

   With a default floor of 0 and ceiling of 1, it gives these results:
      sigmoid(.1, 2.0) = .2
      sigmoid(.333, 2.0) = .667, upper and lower adjustments equal
      sigmoid(.8, 2.0) = .9, adjusted up 50% (1/2.0) of the headroom.
      sigmoid(.1, 5.0) = .50 (5x base, rather than moving up to .82)
      sigmoid(.333, 5.0) = .866, (leaving 1/5 of the .667 headroom)
      sigmoid(.8, 5.0) = .96 (leaving 1/5 of the .20 headroom)
      
   Adjustments of less than 1.0 (neutral) do the opposite...they move the 
   value DOWN by the lesser movement of:
      Increasing headroom by a factor of 1/adjustment, or
      Decreasing footroom by multiplying by adjustment.
      sigmoid(.1, .5) = .05   (footroom*adjustment)
      sigmoid(.667, .5) = .333  (footroom*adjustment) = (headroom doubled)
      sigmoid(.8, .2) = .16 (footroom*0.2)
      
   Not intended for base < 0.  Ceiling must be > floor.  Must have floor <= base <= ceiling.
*/
//==============================================================================
float sigmoid(float base=-1.0 /*required*/, float adjust=1.0, float floor=0.0, float ceiling=1.0)
{
   float retVal = -1.0;
   if (base < 0.0)
      return(retVal);
   if (ceiling <= floor)
      return(retVal);
   if (base < floor)
      return(retVal);
   if (base > ceiling)
      return(retVal);
   
   float footroom = base - floor;
   float headroom = ceiling - base;
   
   float footBasedNewValue = 0.0;   // This will be the value created by adjusting the footroom, i.e.
                                    // increasing a small value.
   float headBasedNewValue = 0.0;   // This will be the value created by adjusting the headroom, i.e.
                                    // increasing a value that's closer to ceiling than floor.
   
   if (adjust > 1.0) 
   {  // Increasing
      footBasedNewValue = floor + (footroom * adjust);
      headBasedNewValue = ceiling - (headroom / adjust);
      
      // Pick the value that resulted in the smaller net movement
      if ( (footBasedNewValue - base) < (headBasedNewValue - base) )
         retVal = footBasedNewValue;   // The foot adjustment gave the smaller move.
      else
         retVal = headBasedNewValue;   // The head adjustment gave the smaller move
   }
   else
   {  // Decreasing
      footBasedNewValue = floor + (footroom * adjust);
      headBasedNewValue = ceiling - (headroom / adjust);
      
      // Pick the value that resulted in the smaller net movement
      if ( (base - footBasedNewValue) < (base - headBasedNewValue) )
         retVal = footBasedNewValue;   // The foot adjustment gave the smaller move.
      else
         retVal = headBasedNewValue;   // The head adjustment gave the smaller move
   }
   
   aiEcho("sigmoid("+base+", "+adjust+", "+floor+", "+ceiling+") is "+retVal);
   return(retVal);
   
}




//==============================================================================
//createSimpleResearchPlan
//==============================================================================
int createSimpleResearchPlan(int techID=-1, int buildingID=-1, int escrowID=cRootEscrowID, int pri = 50)
{
	int planID=aiPlanCreate("Research "+kbGetTechName(techID), cPlanResearch);
	if (planID < 0)
		aiEcho("Failed to create simple research plan for "+techID);
   else
   {
	   aiPlanSetVariableInt(planID, cResearchPlanTechID, 0, techID);
      aiPlanSetVariableInt(planID, cResearchPlanBuildingID, 0, buildingID);
	   aiPlanSetDesiredPriority(planID, pri);
	   aiPlanSetEscrowID(planID, escrowID);
	   aiPlanSetActive(planID);
   }
   
   return(planID);
}


//==============================================================================
//createNativeResearchPlan
//==============================================================================
int createNativeResearchPlan(int tacticID=cTacticNormal, int pri=50, int need=1, int want=5, int max=10)
{
   int buildingID = getUnit(cUnitTypeFirePit);
   int planID = -1;

   if (buildingID == -1)
   {
      aiEcho("createNativeResearchPlan aborting: no fire pit.");
      return(-1);
   }

   aiEcho("Creating native research plan for tactic ID "+tacticID);
   planID=aiPlanCreate("NativeResearch "+tacticID, cPlanNativeResearch);

   if (planID < 0)
   {
      aiEcho("Failed to create simple research plan for "+tacticID);
      return(-1);
   }
   else
   {
      // TODO: Change tactic ID based on power you want and remove use of tech ID
      aiPlanSetVariableInt(planID, cNativeResearchPlanTacticID, 0, tacticID);
      aiPlanSetVariableInt(planID, cNativeResearchPlanBuildingID, 0, buildingID);
      aiPlanSetDesiredPriority(planID, pri);
      //aiPlanSetEscrowID(planID, escrowID);
      aiPlanAddUnitType(planID, gEconUnit, need, want, max);
      aiPlanSetActive(planID);
   }
   return(planID);
}


//==============================================================================
//chooseConsulateFlag
//==============================================================================
void chooseConsulateFlag()
{
  int consulatePlanID = -1;
  int bignumber = aiRandInt(1001);
  int sponsor = 1+(bignumber%4);
  int flag_button_id = -1;
  
  //Chinese get - British, French, Russians
  //Indians get - British, Ottomans, Portuguese
  //Japanese get - Dutch, Portuguese, Spanish
  
  if( (kbGetCiv() == cCivJapanese) || (kbGetCiv() == cCivSPCJapanese) || (kbGetCiv() == cCivSPCJapanese) ) {
	if(xsGetTime() < 1200000)
	   flag_button_id = cTechypBigConsulateDutch;
	else
	   flag_button_id = cTechypBigConsulateJapanese;
  
    if(kbGetHCLevel(cMyID) < 40)
	   flag_button_id = cTechypBigConsulateJapanese;
  }
  else if( (kbGetCiv() == cCivChinese) || (kbGetCiv() == cCivSPCChinese) ) {
	if(xsGetTime() < 1200000)
	   //flag_button_id = cTechypBigConsulateGermans;
	   flag_button_id = cTechypBigConsulateRussians;
	else
	   flag_button_id = cTechypBigConsulateBritish;
  
     if(kbGetHCLevel(cMyID) < 40)
	   flag_button_id = cTechypBigConsulateBritish;
  }
  else if( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) ) {
	if(gIndConsulateProc == 0){
	   flag_button_id = cTechypBigConsulateOttomans;
	}
	else if(gIndConsulateProc == 1){
	   flag_button_id = cTechypBigConsulateFrench;
	}
	else if(gIndConsulateProc == 2){
	   flag_button_id = cTechypBigConsulateBritish;
	}
  
    if(kbGetHCLevel(cMyID) < 40)
	   flag_button_id = cTechypBigConsulateBritish;
  }
  if (kbTechGetStatus(flag_button_id) == cTechStatusObtainable)
  {
    consulatePlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, flag_button_id);
    if (consulatePlanID < 0) {
      aiEcho("************Consulate Flag************");
      aiEcho("************Consulate Flag************");
      aiEcho("************Consulate Flag************");
      aiEcho("Our Consulate flag is: "+kbGetTechName(flag_button_id));
      aiEcho("Our random was: "+sponsor);
      createSimpleResearchPlan(flag_button_id, getUnit(cUnitTypeypConsulate),cEconomyEscrowID, 40);
      gFlagChosen = true;
    }
  }
}

//==============================================================================
//createConsulateResearchPlan
//==============================================================================
void createConsulateResearchPlan()
{
  int consulatePlanID = -1;
  
  int consulateTechID = -1;
  int i = -1;
  
  for (i = 0; < gConsulateTechsSize) {
    consulateTechID = xsArrayGetInt(gConsulateTechs, i);
    if (kbTechGetStatus(consulateTechID) == cTechStatusObtainable)
    {
      consulatePlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, consulateTechID);
      if (consulatePlanID < 0)
        createSimpleResearchPlan(consulateTechID, getUnit(cUnitTypeypConsulate),cEconomyEscrowID, 40);
    }
  }
}

void setConsulateArmyPreference() {
  if (kbUnitCount(cMyID, cUnitTypeypConsulate, cUnitStateAlive) < 1) {
    return;
  }
  if (kbTechGetStatus(cTechypBigConsulatePortuguese) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyPortuguese1, 0.6);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyPortuguese2, 0.6);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyPortuguese3, 0.6);
  }
  
  if (kbTechGetStatus(cTechypBigConsulateDutch) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyDutch1, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyDutch2, 0.15);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyDutch3, 0.2);
  }
  
  if (kbTechGetStatus(cTechypBigConsulateRussians) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyRussian1, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyRussian2, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyRussian3, 0.0);
  }
  
  if (kbTechGetStatus(cTechypBigConsulateSpanish) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmySpanish1, 0.6);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmySpanish2, 0.6);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmySpanish3, 0.6);
  }
  
  if (kbTechGetStatus(cTechypBigConsulateBritish) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyBritish1, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyBritish2, 0.15);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyBritish3, 0.2);      
  }
  
  if (kbTechGetStatus(cTechypBigConsulateFrench) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyFrench1, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyFrench2, 0.15);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyFrench3, 0.2); 
  }
  
  if (kbTechGetStatus(cTechypBigConsulateGermans) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyGerman1, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyGerman2, 0.15);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyGerman3, 0.2); 
  }
  
  if (kbTechGetStatus(cTechypBigConsulateOttomans) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyOttoman1, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyOttoman2, 0.15);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateArmyOttoman3, 0.2);
  }
  if (kbTechGetStatus(cTechypBigConsulateJapanese) == cTechStatusActive) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateYamabushi, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateShinobi, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateNinja, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypConsulateRonin, 0.2);
  }
  
}

//==============================================================================
//createSimpleTrainPlan
//==============================================================================
int createSimpleTrainPlan(int puid=-1, int number=1, int escrowID=-1, int baseID=-1, int batchSize=1)
{
	//Create a the plan name.
	string planName="Simple";
	planName=planName+kbGetProtoUnitName(puid)+"Train";
	int planID=aiPlanCreate(planName, cPlanTrain);
	if (planID < 0)
		return(-1);

	// Escrow.
	aiPlanSetEscrowID(planID, escrowID);
	//Unit type.
	aiPlanSetVariableInt(planID, cTrainPlanUnitType, 0, puid);
	//Number.
	aiPlanSetVariableInt(planID, cTrainPlanNumberToTrain, 0, number);
	// Batch size
	aiPlanSetVariableInt(planID, cTrainPlanBatchSize, 0, batchSize);
	
	//If we have a base ID, use it.
	if (baseID >= 0)
	{
		aiPlanSetBaseID(planID, baseID);
		aiPlanSetVariableVector(planID, cTrainPlanGatherPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, baseID));
	}

	aiPlanSetActive(planID);

	//Done.
	return(planID);
} 
   
   
//==============================================================================
//createSimpleMaintainPlan
//==============================================================================
int createSimpleMaintainPlan(int puid=-1, int number=1, bool economy=true, int baseID=-1, int batchSize=1)
{
   //Create a the plan name.
   string planName="Military";
   if (economy == true)
      planName="Economy";
   planName=planName+kbGetProtoUnitName(puid)+"Maintain";
   int planID=aiPlanCreate(planName, cPlanTrain);
   if (planID < 0)
      return(-1);

   //Economy or Military.
   if (economy == true)
      aiPlanSetEconomy(planID, true);
   else
      aiPlanSetMilitary(planID, true);
   //Unit type.
   aiPlanSetVariableInt(planID, cTrainPlanUnitType, 0, puid);
   //Number.
   aiPlanSetVariableInt(planID, cTrainPlanNumberToMaintain, 0, number);
   // Batch size
   aiPlanSetVariableInt(planID, cTrainPlanBatchSize, 0, batchSize);

   //If we have a base ID, use it.
   if (baseID >= 0)
   {
      aiPlanSetBaseID(planID, baseID);
      if  (economy == false)
         aiPlanSetVariableVector(planID, cTrainPlanGatherPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, baseID));
   }
   
//   aiPlanSetVariableBool(planID, cTrainPlanUseHomeCityShipments, 0, true);

   aiPlanSetActive(planID);

   //Done.
   return(planID);
} 

//==============================================================================
//createSimpleBuildPlan
//==============================================================================
int createSimpleBuildPlan(int puid=-1, int number=1, int pri=100, bool economy=true, int escrowID=-1, int baseID=-1, int numberBuilders=1)
{
   if (cvOkToBuild == false)
      return(-1);
      
    int builderType = gEconUnit;
   //Create the right number of plans.
   for (i=0; < number)
   {
	   int planID=aiPlanCreate("Simple Build Plan, "+number+" "+kbGetUnitTypeName(puid), cPlanBuild);
      if (planID < 0)
         return(-1);
      // What to build
      aiPlanSetVariableInt(planID, cBuildPlanBuildingTypeID, 0, puid);

      // 3 meter separation
      aiPlanSetVariableFloat(planID, cBuildPlanBuildingBufferSpace, 0, 3.0);
      if (puid == gFarmUnit)
         aiPlanSetVariableFloat(planID, cBuildPlanBuildingBufferSpace, 0, 8.0);
      
      //Priority.
      aiPlanSetDesiredPriority(planID, pri);
      //Mil vs. Econ.
      if (economy == true)
         aiPlanSetMilitary(planID, false);
      else
         aiPlanSetMilitary(planID, true);
      aiPlanSetEconomy(planID, economy);
      //Escrow.
      aiPlanSetEscrowID(planID, escrowID);
      //Builders.
      if (civIsAsian() == true) {
        if (puid  == gFarmUnit) {
             if (kbUnitCount(cMyID, cUnitTypeYPRicePaddyWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPRicePaddyWagon;
        }
		if (puid  == cUnitTypeFortFrontier) {
             if (kbUnitCount(cMyID, cUnitTypeFortWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeFortWagon;
        }
        if (puid  == gMarketUnit) {
             if (kbUnitCount(cMyID, cUnitTypeypMarketWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeypMarketWagon;
        }
        if (puid  == cUnitTypeypShrineJapanese) {
             if (kbUnitCount(cMyID, cUnitTypeypShrineWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeypShrineWagon;
        }
        if (puid  == cUnitTypeypMonastery) {
             if (kbUnitCount(cMyID, cUnitTypeYPMonasteryWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPMonasteryWagon;
        }
        if (puid  == cUnitTypeypBerryBuilding) {
          builderType = cUnitTypeYPBerryWagon1;
        }
		//add
		if (puid  == cUnitTypeypArsenalAsian) {
          builderType = cUnitTypeypArsenalWagon;
        }
		if (puid  == cUnitTypeypChurch) {
          builderType = cUnitTypeypChurchWagon;
        }
		if (puid  == cUnitTypeypBankAsian) {
          builderType = cUnitTypeypBankWagon;
        }
        if (puid  == cUnitTypeTradingPost) {
             if (kbUnitCount(cMyID, cUnitTypeypTradingPostWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeypTradingPostWagon;
        }
        if (puid  == cUnitTypeypBarracksJapanese) {
             if (kbUnitCount(cMyID, cUnitTypeYPMilitaryRickshaw, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPMilitaryRickshaw;
        }
        if ((puid  == cUnitTypeypStableJapanese) && (xsGetTime() > 300000)) {
             if (kbUnitCount(cMyID, cUnitTypeYPMilitaryRickshaw, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPMilitaryRickshaw;
        }
        if (puid  == cUnitTypeypDojo) {
             if (kbUnitCount(cMyID, cUnitTypeYPDojoWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPDojoWagon;
        }
        if (puid  == cUnitTypeypTradeMarketAsian) {
             if (kbUnitCount(cMyID, cUnitTypeypMarketWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeypMarketWagon;
        }
        if (puid  == cUnitTypeypSacredField) {
             if (kbUnitCount(cMyID, cUnitTypeYPSacredFieldWagon, cUnitStateAlive) > 0)
                builderType = cUnitTypeYPSacredFieldWagon;
        }
      }
	  else if(civIsNative() == false)
	  {
	     if (puid  == cUnitTypeTownCenter) {
            if (kbUnitCount(cMyID, cUnitTypeExplorer, cUnitStateAlive) > 0)
               builderType = cUnitTypeExplorer;
		 }
	  }
	  else if(civIsNative() == true || civIsAsian() == true)
	  {
	     if (puid  == cUnitTypeTownCenter) {
            if (kbUnitCount(cMyID, cUnitTypeExplorer, cUnitStateAlive) > 0)
               builderType = gEconUnit;
		 }
	  }
      if (puid  == gDockUnit) {
        if (kbUnitCount(cMyID, cUnitTypeYPDockWagon, cUnitStateAlive) > 0)
          builderType = cUnitTypeYPDockWagon;
      }
	  
	   aiPlanAddUnitType(planID, builderType,  /* TODO:  Replace with function look-up call to avoid explicit unit type */
         numberBuilders, numberBuilders, numberBuilders);
      //Base ID.
      aiPlanSetBaseID(planID, baseID);

      //Go.
      aiPlanSetActive(planID);
   }
   return(planID);   // Only really useful if number == 1, otherwise returns last value.
}




//==============================================================================
//createLocationBuildPlan
//==============================================================================
int createLocationBuildPlan(int puid=-1, int number=1, int pri=100, bool economy=true, int escrowID=-1, vector position=cInvalidVector, int numberBuilders=1)
{
   if (cvOkToBuild == false)
      return(-1);
   //Create the right number of plans.
   
   int builderType = gEconUnit;
   for (i=0; < number)
   {
	   int planID=aiPlanCreate("Location Build Plan, "+number+" "+kbGetUnitTypeName(puid), cPlanBuild);
      if (planID < 0)
         return(-1);
      // What to build
      aiPlanSetVariableInt(planID, cBuildPlanBuildingTypeID, 0, puid);

      aiPlanSetVariableVector(planID, cBuildPlanCenterPosition, 0, position);
      aiPlanSetVariableFloat(planID, cBuildPlanCenterPositionDistance, 0, 30.0);
      
      // 3 meter separation
      aiPlanSetVariableFloat(planID, cBuildPlanBuildingBufferSpace, 0, 3.0);
      if (puid == gFarmUnit)
         aiPlanSetVariableFloat(planID, cBuildPlanBuildingBufferSpace, 0, 8.0);  

      //Priority.
      aiPlanSetDesiredPriority(planID, pri);
      //Mil vs. Econ.
      if (economy == true)
         aiPlanSetMilitary(planID, false);
      else
         aiPlanSetMilitary(planID, true);
      aiPlanSetEconomy(planID, economy);
      //Escrow.
      aiPlanSetEscrowID(planID, escrowID);
      //Builders.
	  
	  if (puid  == cUnitTypeypShrineJapanese) {
             if (kbUnitCount(cMyID, cUnitTypeypMonkJapanese2, cUnitStateAlive) > 0)
                builderType = cUnitTypeypMonkJapanese2;
		     if (xsGetTime() > 360000)
                aiPlanAddUnitType(planID, gEconUnit,1, 1, 1);
      }
	   aiPlanAddUnitType(planID, builderType,  /* TODO:  Replace with function look-up call to avoid explicit unit type */
         numberBuilders, numberBuilders, numberBuilders);
      
      aiPlanSetVariableVector(planID, cBuildPlanInfluencePosition, 0, position);    // Influence toward position
      aiPlanSetVariableFloat(planID, cBuildPlanInfluencePositionDistance, 0, 100.0);     // 100m range.
      aiPlanSetVariableFloat(planID, cBuildPlanInfluencePositionValue, 0, 200.0);        // 200 points max
      aiPlanSetVariableInt(planID, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff

      //Go.
      aiPlanSetActive(planID);
   }
   return(planID);   // Only really useful if number == 1, otherwise returns last value.
}




//==============================================================================
// createMainBase
//==============================================================================
int createMainBase(vector mainVec=cInvalidVector)
{
   aiEcho("Creating main base at "+mainVec);
   if (mainVec == cInvalidVector)  
      return(-1);
   
   int oldMainID = kbBaseGetMainID(cMyID);
   int i = 0;

   int count=-1;
   static int unitQueryID=-1;
   int buildingID = -1;
   string buildingName = "";
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("NewMainBaseBuildingQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
   }

	//Define a query to get all matching units
	if (unitQueryID != -1)
	{
      kbUnitQuerySetPlayerRelation(unitQueryID, -1);
   	kbUnitQuerySetPlayerID(unitQueryID, cMyID);

      kbUnitQuerySetUnitType(unitQueryID, cUnitTypeBuilding);
      kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
      kbUnitQuerySetPosition(unitQueryID, mainVec);      // Checking new base vector
      kbUnitQuerySetMaximumDistance(unitQueryID, 50.0);
	}
   
   kbUnitQueryResetResults(unitQueryID);
   count = kbUnitQueryExecute(unitQueryID);
   

   while (oldMainID >= 0)
   {
      aiEcho("Old main base was "+oldMainID+" at "+kbBaseGetLocation(cMyID, oldMainID));
      kbUnitQuerySetPosition(unitQueryID,kbBaseGetLocation(cMyID, oldMainID));      // Checking old base location
      kbUnitQueryResetResults(unitQueryID);
      count = kbUnitQueryExecute(unitQueryID);
      int unitID = -1;
      
     
      // Remove old base's resource breakdowns
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeEasy, oldMainID);
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, oldMainID);
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHerdable, oldMainID);
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHuntAggressive, oldMainID);
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeFish, oldMainID);
      aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeFarm, oldMainID);
      aiRemoveResourceBreakdown(cResourceWood, cAIResourceSubTypeEasy, oldMainID);
      aiRemoveResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, oldMainID);

      kbBaseDestroy(cMyID, oldMainID);
      oldMainID = kbBaseGetMainID(cMyID);
   }


   int newBaseID=kbBaseCreate(cMyID, "Base"+kbBaseGetNextID(), mainVec, 50.0);
   aiEcho("New main base ID is "+newBaseID);
   if (newBaseID > -1)
   {
      //Figure out the front vector.
      vector baseFront=xsVectorNormalize(kbGetMapCenter()-mainVec);
      kbBaseSetFrontVector(cMyID, newBaseID, baseFront);
      aiEcho("Setting front vector to "+baseFront);
      //Military gather point.
      float milDist = 40.0;
      while (  kbAreaGroupGetIDByPosition(mainVec+(baseFront*milDist)) != kbAreaGroupGetIDByPosition(mainVec) )
      {
         milDist = milDist - 5.0;
         if (milDist < 6.0)
            break;
      }
      vector militaryGatherPoint = mainVec + (baseFront * milDist);
      
      kbBaseSetMilitaryGatherPoint(cMyID, newBaseID, militaryGatherPoint);
      //Set the other flags.
      kbBaseSetMilitary(cMyID, newBaseID, true);
      kbBaseSetEconomy(cMyID, newBaseID, true);
      //Set the resource distance limit.
      

      // 200m x 200m map, assume I'm 25 meters in, I'm 150m from enemy base.  This sets the range at 80m.
      //(cMyID, newBaseID, (kbGetMapXSize() + kbGetMapZSize())/5);   // 40% of average of map x and z dimensions.
      kbBaseSetMaximumResourceDistance(cMyID, newBaseID, 150.0); // 100 led to age-2 gold starvation
      kbBaseSetSettlement(cMyID, newBaseID, true);
      //Set the main-ness of the base.
      kbBaseSetMain(cMyID, newBaseID, true);
      
      // Add the TC, if any.
      if (getUnit(cUnitTypeTownCenter, cMyID, cUnitStateABQ) >= 0)
         kbBaseAddUnit(cMyID, newBaseID, getUnit(cUnitTypeTownCenter, cMyID, cUnitStateABQ));
   }
   
   
   // Move the defend plan and reserve plan
   xsEnableRule("endDefenseReflexDelay"); // Delay so that new base ID will exist
   
//   xsEnableRule("populateMainBase");   // Can't add units yet, they still appear to be owned by deleted base.  This rule adds a slight delay.

   return(newBaseID);
}
 

//==============================================================================
// getAllyCount() // Returns number of allies EXCLUDING self
//==============================================================================
int getAllyCount()
{
   int retVal = 0;
   
   int player = 0;
   for (player=1; < cNumberPlayers)
   {
      if (player == cMyID)
         continue;
      
      if (kbIsPlayerAlly(player) == true)
         retVal = retVal + 1;
   }
   
   return(retVal);
}
 

//==============================================================================
// getEnemyCount() // Returns number of enemies excluding gaia
//==============================================================================
int getEnemyCount()
{
   int retVal = 0;
   
   int player = 0;
   for (player=1; < cNumberPlayers)
   {
      if (player == cMyID)
         continue;
      
      if (kbIsPlayerEnemy(player) == true)
         retVal = retVal + 1;
   }
   
   return(retVal);
}

//==============================================================================
// arraySortFloat
/*
   Takes two arrays, the source and the target.
   Source has the original values, and is a float array.
   Target (int array) will receive the indexes into source in descending order.  For example,
   if the highest value in source is source[17] with a value of 91, then
   arraySort(source, target) will assign target[0] the value of 17, and 
   source[target[0]] will be 91.

*/
//==============================================================================
bool arraySortFloat(int sourceArray=-1, int targetArray=-1)
{
   int pass = 0;
   int i = 0; 
   int size = xsArrayGetSize(sourceArray);
   if (size != xsArrayGetSize(targetArray))
   {
      aiEcho("ArraySort error, source and target are not of same size.");
      return(false);
   }
   
   float highestScore = 1000000.0;  // Highest score found on previous pass
   float highScore = -1000000.0;    // Highest score found on this pass
   int highestScoreIndex = -1;      // Which element had the high score last pass?
   int highScoreIndex = -1;         // Which element has the highest score so far this pass?
   for (pass=0; < size)             // Sort the array
   {
      highScore = -1000000.0;
      highScoreIndex = -1;
      for (i=0; < size)   // Look for highest remaining value
      {
         if ( xsArrayGetFloat(sourceArray, i) > highestScore ) // We're over the highest score, already been selected.  Skip.
            continue;

         if ( (xsArrayGetFloat(sourceArray, i) == highestScore) && (highestScoreIndex >= i) ) // Tie with a later one, we've been selected.  Skip.
            continue;

         if ( xsArrayGetFloat(sourceArray, i) <= highScore ) // We're not the highest so far on this pass, skip.
            continue;
         
         highScore = xsArrayGetFloat(sourceArray, i);    // This is the highest score this pass
         highScoreIndex = i;                                // So remember this index
      }
//      if(xsArrayGetString(gMissionStrings, highScoreIndex) != " ")
//         aiEcho("        "+highScoreIndex+" "+highScore+" "+xsArrayGetString(gMissionStrings,highScoreIndex));
      xsArraySetInt(targetArray, pass, highScoreIndex);
      highestScore = highScore;           // Save this for next pass
      highestScoreIndex = highScoreIndex;
   }
   return(true);
}









//==============================================================================
// getRandomPlayerByRelation
/*
   Returns a randomly selected ally or enemy.

*/
//==============================================================================
int getRandomPlayerByRelation(int playerRelation = -1)
{
   int retVal = -1;
   int matchCount = -1;    // I.e. there are 3 matching players
   int matchIndex = -1;    // Used for traversal
   int playerToGet = -1;   // i.e. get the 2nd matching player
   
   
   // Get a count of matching players
   matchCount = 0;
   for (matchIndex = 1; < cNumberPlayers)
   {
      if ( (playerRelation == cPlayerRelationAlly) && (kbIsPlayerAlly(matchIndex) == true) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
      if ( ( (playerRelation == cPlayerRelationEnemy) || (playerRelation == cPlayerRelationEnemyNotGaia) ) && (kbIsPlayerEnemy(matchIndex) == true) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
      if ( (playerRelation == cPlayerRelationSelf) && (cMyID == matchIndex) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
   }
   
   if (matchCount < 1)
      return(-1);
   
   playerToGet = aiRandInt(matchCount) + 1;  // If there are 3 matches, return 1, 2 or 3
   
   // Traverse the list again, and get the matching player.
   matchCount = 0;
   for (matchIndex = 1; < cNumberPlayers)
   {
      if ( (playerRelation == cPlayerRelationAlly) && (kbIsPlayerAlly(matchIndex) == true) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
      if ( ( (playerRelation == cPlayerRelationEnemy) || (playerRelation == cPlayerRelationEnemyNotGaia) )&& (kbIsPlayerEnemy(matchIndex) == true) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
      if ( (playerRelation == cPlayerRelationSelf) && (cMyID == matchIndex) && (kbHasPlayerLost(matchIndex) == false))
         matchCount = matchCount + 1;
      
      if (matchCount == playerToGet)
      {
         retVal = matchIndex;    // Save this player's number
         break;
      }
   }
   
   return(retVal);
}


//==============================================================================
// getTeamPosition
/*
   Returns the player's position in his/her team, i.e. in a 123 vs 456 game, 
   player 5's team position is 2, player 3 is 3, player 4 is 1.

   Excludes resigned players.

*/
//==============================================================================
int getTeamPosition(int playerID = -1)
{
   int index = -1;    // Used for traversal
   int playerToGet = -1;   // i.e. get the 2nd matching playe
   
   // Traverse list of players, increment when we find a teammate, return when we find my number.
   int retVal = 0;      // Zero if I don't exist...
   for (index = 1; < cNumberPlayers)
   {
      if ( (kbHasPlayerLost(index) == false) && (kbGetPlayerTeam(playerID) == kbGetPlayerTeam(index)) )
         retVal = retVal + 1; // That's another match
      
      if ( index == playerID )
         return(retVal);
   }
   return(-1);
}


//==============================================================================
// getEnemyPlayerByTeamPosition
/*
   Returns the ID of the Nth player on the enemy team, returns -1 if 
   there aren't that many players.

   Excludes resigned players.
*/

int getEnemyPlayerByTeamPosition(int position = -1)
{

   int matchCount = 0;
   int index = -1;    // Used for traversal
   int playerToGet = -1;   // i.e. get the 2nd matching playe
   
   // Traverse list of players, return when we find the matching player
   for (index = 1; < cNumberPlayers)
   {
      if ( (kbHasPlayerLost(index) == false) && (kbGetPlayerTeam(cMyID) != kbGetPlayerTeam(index)) )
         matchCount = matchCount + 1; // Enemy player, add to the count
      
      if ( matchCount == position )
         return(index);
   }
   return(-1);
}



//==============================================================================
// getClosestVPSite
/*
   Returns the VPSiteID of the closest VP Site that matches the parms.
   -1 means don't care, everything matches.
   To get the closest site that has been claimed (building or complete) by an enemy,
   use cVPStateAny with playerRelationOrID set to cPlayerRelationEnemy.  (Unbuilt ones have gaia ownership)
*/
//==============================================================================
int getClosestVPSite(vector location=cInvalidVector, int type=cVPAll, int state=cVPStateAny, int playerRelationOrID=-1)
{
   int retVal = -1;
   int vpList = kbVPSiteQuery(type, playerRelationOrID, state);
   vector siteLocation = cInvalidVector;
   int count = xsArrayGetSize(vpList);
   int index = 0;
   int siteID = 0;
   float dist = 0.0;
   float minDist = 100000.0;
   
   for (index = 0; < count)
   {
      siteID = xsArrayGetInt(vpList, index);
      siteLocation = kbVPSiteGetLocation(siteID);
      dist = distance(location, siteLocation);
      if (dist < minDist)
      {
         retVal = siteID;  // Remember this one.
         minDist = dist;
      }
   }
  
   return(retVal);
}

//==============================================================================
// chooseAttackPlayerID
/*
   Given a point/radius, look for enemy units, and choose the owner of one
   as an appropriate player to attack.

   If none found, return mostHatedEnemy.
*/
//==============================================================================
int   chooseAttackPlayerID(vector point=cInvalidVector, float radius = 50.0)
{
   int retVal = aiGetMostHatedPlayerID();
   static int queryID = -1;
   
   if (point == cInvalidVector)
      return(retVal);
   
   if (queryID < 0)
   {
      queryID = kbUnitQueryCreate("Choose attack player");
      kbUnitQuerySetPlayerRelation(queryID, cPlayerRelationEnemyNotGaia);   // Any enemy units in point/radius
      kbUnitQuerySetIgnoreKnockedOutUnits(queryID, true);
      kbUnitQuerySetUnitType(queryID, cUnitTypeUnit);
      kbUnitQuerySetState(queryID, cUnitStateAlive);
   }
   kbUnitQuerySetPosition(queryID, point);
   kbUnitQuerySetMaximumDistance(queryID, radius);
   kbUnitQueryResetResults(queryID);
   int count = kbUnitQueryExecute(queryID);
   int index = 0;
   int unitID = 0;
   for (index = 0; < count)
   {
      unitID = kbUnitQueryGetResult(queryID, index);
      if (kbUnitGetPlayerID(unitID) > 0)  // Not Gaia
      {
         retVal = kbUnitGetPlayerID(unitID);  // Owner of first (random) non-gaia unit
         break;
      }
   }
   
   return(retVal);
}



//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// Economy
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================

void startTCBuildPlan(vector location=cInvalidVector)
{
   if (cvOkToBuild == false)
      return;
   aiEcho("Creating a TC build plan.");
   // Make a town center, pri 100, econ, main base, 1 builder.
   int buildPlan=aiPlanCreate("TC Build plan ", cPlanBuild);
   // What to build
   aiPlanSetVariableInt(buildPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeTownCenter);
   // Priority.
   aiPlanSetDesiredPriority(buildPlan, 100);
   // Mil vs. Econ.
   aiPlanSetMilitary(buildPlan, false);
   aiPlanSetEconomy(buildPlan, true);
   // Escrow.
   aiPlanSetEscrowID(buildPlan, cEconomyEscrowID);
   // Builders.
   aiPlanAddUnitType(buildPlan, gCoveredWagonUnit, 1, 1, 1);

   // Instead of base ID or areas, use a center position and falloff.
   aiPlanSetVariableVector(buildPlan, cBuildPlanCenterPosition, 0, location);
   aiPlanSetVariableFloat(buildPlan, cBuildPlanCenterPositionDistance, 0, 50.00);

   // Add position influences for trees, gold, TCs.
   aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitTypeID, 4, true);
   aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitDistance, 4, true);
   aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitValue, 4, true);
   aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitFalloff, 4, true);
   
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 0, cUnitTypeWood);
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 0, 30.0);     // 30m range.
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 0, 10.0);        // 10 points per tree
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff
   
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 1, cUnitTypeMine);
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 1,
   40.0);              // 40 meter range for gold
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 1, 300.0);                // 300 points each
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 1, cBPIFalloffLinear);  // Linear slope falloff
   
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 2, cUnitTypeMine);
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 2, 10.0);              // 10 meter inhibition to keep some space
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 2, -300.0);                // -300 points each
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 2, cBPIFalloffNone);      // Cliff falloff
   
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 3, cUnitTypeTownCenter);
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 3, 40.0);              // 40 meter inhibition around TCs.
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 3, -500.0);                // -500 points each
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 3, cBPIFalloffNone);      // Cliff falloff
      

   // Weight it to prefer the general starting neighborhood
   aiPlanSetVariableVector(buildPlan, cBuildPlanInfluencePosition, 0, location);    // Position influence for landing position
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionDistance, 0, 100.0);     // 100m range.
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionValue, 0, 300.0);        // 300 points max
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff
   

   
   aiPlanSetActive(buildPlan);
   aiPlanSetEventHandler(buildPlan, cPlanEventStateChange, "tcPlacedEventHandler");
   gTCBuildPlanID = buildPlan;   // Save in a global var so the rule can access it.


}

//==============================================================================
/* rule econUpgrades
   
   Make sure we always have an econ upgrade plan running.  Go cheapest first.
*/
//==============================================================================
rule econUpgrades
inactive
group tcComplete
minInterval 240//60
{
   if (xsGetTime() < 900000)
      return; 
	  
   int planState = -1;
   int techToGet = -1;
   float lowestCost = 1000000.0;
   static int gatherTargets = -1;   // Array to hold the list of things we gather from, i.e. mill, tree, etc.
   static int gatherTargetTypes = -1;  // Array.  If gatherTargets(x) == mill, then gatherTargetTypes(x) = cResourceFood.
   int target = -1;  // Index used to step through arrays
   static int startTime = -1;       // Time last plan was started, to make sure we're not waiting on an obsolete tech.
   
   if (gatherTargets < 0)  // Array not initialized
   {  // Set up our list of target units (what we gather from) and their resource categories.
      gatherTargets = xsArrayCreateInt(10, -1, "Gather Targets");
      gatherTargetTypes = xsArrayCreateInt(10, -1, "Gather Target Types");
      
      xsArraySetInt(gatherTargets, 0, gFarmUnit); // Mills generate food
      xsArraySetInt(gatherTargetTypes, 0, cResourceFood);
     
      xsArraySetInt(gatherTargets, 2, gPlantationUnit);       // Plantations generate gold
      xsArraySetInt(gatherTargetTypes, 2, cResourceGold);
   }
 
   planState = aiPlanGetState(gEconUpgradePlan);

   if ( planState < 0 )
   {  // Plan is done or doesn't exist
      aiPlanDestroy(gEconUpgradePlan); // Nuke the old one, if it exists
      startTime = -1;

      int techID = -1;        // The cheapest tech for the current target unit type      
      float rawCost = -1.0;   // The cost of the upgrade
      float relCost = -1.0;   // The cost, relative to some estimate of the number of gatherers
      float numGatherers = -1.0;  // Number of gatherers assigned to the resource type (i.e food)
      
      /*
         Step through the array of gather targets.  For each, calculate the cost of the upgrade
         relative to the number of gatherers that would benefit.  Choose the one with the best 
         payoff.
      */
      for (target=0; < 10) 
      {
         if (xsArrayGetInt(gatherTargets, target) < 0)   // No target specified
            continue;
         techID =  kbTechTreeGetCheapestEconUpgrade(xsArrayGetInt(gatherTargets, target));
         if (techID < 0)   // No tech available for this target type
            continue;
         rawCost = kbGetTechAICost(techID);
         if (rawCost == 0.0)
            rawCost = -1.0;
         
         // Percent of gatherers assigned to this resource, times the number of econ units.
         numGatherers = aiGetResourceGathererPercentage( xsArrayGetInt(gatherTargetTypes, target), cRGPActual ) *  kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
         
         // Calculate the relative cost
         switch( xsArrayGetInt(gatherTargets, target) )
         {
            case cUnitTypeHuntable:
            {
               // Assume all food gatherers are hunting unless we have a mill.
               relCost = rawCost / numGatherers;
                if (kbUnitCount(cMyID, gFarmUnit, cUnitStateAlive) > 0)
                  relCost = -1.0;   // Do NOT get hunting dogs once we're farming
               break;
            }
            case cUnitTypeFish:
            {
               numGatherers = kbUnitCount(cMyID, gFishingUnit, cUnitStateAlive);
               if ( numGatherers > 0.0)
                  relCost = rawCost / numGatherers;
               else
                  relCost = -1.0;
               break;
            }
            default: // All other resources
            {
               if (numGatherers > 0.0)
                  relCost = rawCost / numGatherers;
               else
                  relCost = -1.0;                  
               break;
            }
         }
         
         // We now have the relative cost for the cheapest tech that gathers from this target type.
         // See if it's > 0, and the cheapest so far.  If so, save the stats, as long as it's obtainable.
         
         if ( (techID >= 0) && (relCost < lowestCost) && (relCost > 0.0) && (kbTechGetStatus(techID) == cTechStatusObtainable) )
         {
            lowestCost = relCost;
            techToGet = techID;
         }
      }
      
      
      if ( (techToGet >= 0) && (lowestCost < 40.0) )  // We have a tech, and it doesn't cost more than 40 per gatherer
      {
    
         // If a plan has been running for 3 minutes...
         if ( (startTime > 0) && (xsGetTime() > (startTime + 180000)) )
         {
            // If it's still the tech we want, reset the start time counter and quit out.  Otherwise, kill it.
            if (aiPlanGetVariableInt(gEconUpgradePlan, cProgressionPlanGoalTechID, 0) == techToGet)
            {
               startTime = xsGetTime();
               return;
            }
            else
            {
               aiEcho("***** Destroying econ upgrade plan # "+gEconUpgradePlan+" because it has been running more than 3 minutes.");
               aiPlanDestroy(gEconUpgradePlan);
            }
         }
         // Plan doesn't exist, or we just killed it due to timeout....
         gEconUpgradePlan = aiPlanCreate("Econ upgrade tech "+techToGet, cPlanProgression);
         aiPlanSetVariableInt(gEconUpgradePlan, cProgressionPlanGoalTechID, 0, techToGet);
         aiPlanSetDesiredPriority(gEconUpgradePlan, 92);
         aiPlanSetEscrowID(gEconUpgradePlan, cEconomyEscrowID);
         aiPlanSetBaseID(gEconUpgradePlan, kbBaseGetMainID(cMyID));
         aiPlanSetActive(gEconUpgradePlan);
         startTime = xsGetTime();

         aiEcho("                **** Creating upgrade plan for "+kbGetTechName(techToGet)+" is "+gEconUpgradePlan);
         //aiEcho("                **** Status for tech "+kbGetTechName(techToGet)+" is "+kbTechGetStatus(techToGet));
         //aiEcho("                **** Relative cost (score) was lowest at "+lowestCost);
      }
   }
   // Otherwise, if a plan already existed, let it run...
}

rule crateMonitor
inactive
group tcComplete
minInterval 5
{

   static int cratePlanID = -1;
   static int cratePlanID2 = -1;
   static int cratePlanID3 = -1;
   static int cratePlanID4 = -1;
   static int cratePlanID5 = -1;
   static int cratePlanID6 = -1;
   int numCrates1 = -1;
   int numCrates2 = -1;
   int numCrates3 = -1;
   int numCrates4 = -1;
   int numCrates5 = -1;
   int numCrates6 = -1;
   int gatherersWanted = -1;
   int unitt = gEconUnit;
   if(cMyCiv == cCivGermans)
      unitt = cUnitTypeSettlerWagon;
   
   // If we have a main base, count the number of crates in it
   if (kbBaseGetMainID(cMyID) < 0 || xsGetTime() < 50000)
      return;
   
   // We have a main base, count the crates
   //numCrates = kbUnitCount(cMyID, cUnitTypeAbstractResourceCrate,cUnitStateAlive) + kbUnitCount(0, cUnitTypeAbstractResourceCrate,cUnitStateAlive);
   numCrates1 = kbUnitCount(cMyID, cUnitTypeCrateofFood,cUnitStateAlive);
   numCrates2 = kbUnitCount(cMyID, cUnitTypeCrateofWood,cUnitStateAlive);
   numCrates3 = kbUnitCount(cMyID, cUnitTypeCrateofCoin,cUnitStateAlive);
   numCrates4 = kbUnitCount(cMyID, cUnitTypeCrateofFoodLarge,cUnitStateAlive);
   numCrates5 = kbUnitCount(cMyID, cUnitTypeCrateofWoodLarge,cUnitStateAlive);
   numCrates6 = kbUnitCount(cMyID, cUnitTypeCrateofCoinLarge,cUnitStateAlive);
   //gatherersWanted = 3;  // At least one, plus one for each 3 crates over 1.
   
   if (numCrates1 == 0)
      gatherersWanted = 0;
   else
      gatherersWanted = 1;
   
   if (aiPlanGetState(cratePlanID) == -1)
   {
      aiEcho("Crate gather plan "+cratePlanID+" is invalid.");
      aiPlanDestroy(cratePlanID);
      cratePlanID = -1;
   }
   if (cratePlanID < 0)
   {  // Initialize the plan
      cratePlanID = aiPlanCreate("Main Base Crate", cPlanGather);
      aiPlanSetBaseID(cratePlanID, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofFood);
      aiPlanSetVariableInt(cratePlanID, cGatherPlanResourceType, 0, cAllResources);
		//aiPlanSetVariableInt(cratePlanID, cGatherPlanFindNewResourceTimeOut, 0, 20000);
      
	  aiPlanAddUnitType(cratePlanID, gEconUnit, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID, 95);
      aiPlanSetActive(cratePlanID);
      aiEcho("Activated crate gather plan "+cratePlanID);
   }
   aiPlanAddUnitType(cratePlanID, gEconUnit, gatherersWanted, gatherersWanted, gatherersWanted);
   
   if (numCrates2 == 0)
      gatherersWanted = 0;
   else if(cMyCiv == cCivOttomans)
      gatherersWanted = 2;
   else
      gatherersWanted = 1;
   if (aiPlanGetState(cratePlanID2) == -1)
   {
      aiPlanDestroy(cratePlanID2);
      cratePlanID2 = -1;
   }
   if (cratePlanID2 < 0)
   {  // Initialize the plan
      cratePlanID2 = aiPlanCreate("Main Base Crate2", cPlanGather);
      aiPlanSetBaseID(cratePlanID2, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID2, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofWood);
      aiPlanSetVariableInt(cratePlanID2, cGatherPlanResourceType, 0, cAllResources);
		//aiPlanSetVariableInt(cratePlanID2, cGatherPlanFindNewResourceTimeOut, 0, 20000);
      
	  aiPlanAddUnitType(cratePlanID2, unitt, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID2, 95);
      aiPlanSetActive(cratePlanID2);
   }
   aiPlanAddUnitType(cratePlanID2, unitt, gatherersWanted, gatherersWanted, gatherersWanted);
   
   if (numCrates3 == 0)
      gatherersWanted = 0;
   else
      gatherersWanted = 1;
   if (aiPlanGetState(cratePlanID3) == -1)
   {
      aiPlanDestroy(cratePlanID3);
      cratePlanID3 = -1;
   }
   if (cratePlanID3 < 0)
   {  // Initialize the plan
      cratePlanID3 = aiPlanCreate("Main Base Crate3", cPlanGather);
      aiPlanSetBaseID(cratePlanID3, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID3, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofCoin);
      aiPlanSetVariableInt(cratePlanID3, cGatherPlanResourceType, 0, cAllResources);
		//aiPlanSetVariableInt(cratePlanID3, cGatherPlanFindNewResourceTimeOut, 0, 20000);
      
	  aiPlanAddUnitType(cratePlanID3, gEconUnit, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID3, 95);
      aiPlanSetActive(cratePlanID3);
   }
   aiPlanAddUnitType(cratePlanID3, gEconUnit, gatherersWanted, gatherersWanted, gatherersWanted);
   
   if (numCrates4 == 0)
      gatherersWanted = 0;
   else if(cMyCiv == cCivGermans)
      gatherersWanted = 1;
   else
      gatherersWanted = 2;
   if (aiPlanGetState(cratePlanID4) == -1)
   {
      aiPlanDestroy(cratePlanID4);
      cratePlanID4 = -1;
   }
   if (cratePlanID4 < 0)
   {  // Initialize the plan
      cratePlanID4 = aiPlanCreate("Main Base Crate4", cPlanGather);
      aiPlanSetBaseID(cratePlanID4, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID4, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofFoodLarge);
      aiPlanSetVariableInt(cratePlanID4, cGatherPlanResourceType, 0, cAllResources);
      
	  aiPlanAddUnitType(cratePlanID4, unitt, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID4, 95);
      aiPlanSetActive(cratePlanID4);
   }
   aiPlanAddUnitType(cratePlanID4, unitt, gatherersWanted, gatherersWanted, gatherersWanted);
   
   if (numCrates5 == 0)
      gatherersWanted = 0;
   else if(cMyCiv == cCivGermans)
      gatherersWanted = 1;
   else
      gatherersWanted = 2;
   if (aiPlanGetState(cratePlanID5) == -1)
   {
      aiPlanDestroy(cratePlanID5);
      cratePlanID5 = -1;
   }
   if (cratePlanID5 < 0)
   {  // Initialize the plan
      cratePlanID5 = aiPlanCreate("Main Base Crate5", cPlanGather);
      aiPlanSetBaseID(cratePlanID5, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID5, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofWoodLarge);
      aiPlanSetVariableInt(cratePlanID5, cGatherPlanResourceType, 0, cAllResources);
      
	  aiPlanAddUnitType(cratePlanID5, unitt, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID5, 95);
      aiPlanSetActive(cratePlanID5);
   }
   aiPlanAddUnitType(cratePlanID5, unitt, gatherersWanted, gatherersWanted, gatherersWanted);
   
   if (numCrates6 == 0)
      gatherersWanted = 0;
   else if(cMyCiv == cCivGermans)
      gatherersWanted = 1;
   else
      gatherersWanted = 2;
   if (aiPlanGetState(cratePlanID6) == -1)
   {
      aiPlanDestroy(cratePlanID6);
      cratePlanID6 = -1;
   }
   if (cratePlanID6 < 0)
   {  // Initialize the plan
      cratePlanID6 = aiPlanCreate("Main Base Crate6", cPlanGather);
      aiPlanSetBaseID(cratePlanID6, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(cratePlanID6, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeCrateofCoinLarge);
      aiPlanSetVariableInt(cratePlanID6, cGatherPlanResourceType, 0, cAllResources);
      
	  aiPlanAddUnitType(cratePlanID6, unitt, 0, 0, 0);
	  aiPlanSetDesiredPriority(cratePlanID6, 95);
      aiPlanSetActive(cratePlanID6);
   }
   aiPlanAddUnitType(cratePlanID6, unitt, gatherersWanted, gatherersWanted, gatherersWanted);

}

void initCrates(void)
{
   if (cMyCiv == cCivGermans)
   {
      if(getUnit(cUnitTypeSettlerWagon) < 0 || getUnit(cUnitTypeCrateofWood) < 0)
	     return;
	  aiTaskUnitWork(getUnit(cUnitTypeSettlerWagon),getUnit(cUnitTypeCrateofWood));
	  return;
   }
   else if (cMyCiv == cCivRussians)
   {
      if(getUnit(gEconUnit) < 0 || getUnit(cUnitTypeCrateofWood) < 0)
	     return;
	  aiTaskUnitWork(getUnit(gEconUnit),getUnit(cUnitTypeCrateofWood));
	  return;
   }
   
   if (kbUnitCount(cMyID, cUnitTypeAbstractResourceCrate, cUnitStateAlive) > 0) {
     static int crateQueryID=-1;
     //If we don't have the query yet, create one.
     if (crateQueryID < 0)
     {
        crateQueryID=kbUnitQueryCreate("castleGetUnitQuery");
        kbUnitQuerySetIgnoreKnockedOutUnits(crateQueryID, true);
     }
    //Define a query to get all matching units
    if (crateQueryID != -1) {
      kbUnitQuerySetPlayerRelation(crateQueryID, -1);
	  if (kbUnitCount(0, cUnitTypeAbstractResourceCrate, cUnitStateAlive) > 0)
	     kbUnitQuerySetPlayerID(crateQueryID, 0);
      else
	     kbUnitQuerySetPlayerID(crateQueryID, cMyID);
      kbUnitQuerySetUnitType(crateQueryID, cUnitTypeAbstractResourceCrate);
      kbUnitQuerySetState(crateQueryID, cUnitStateAlive);
	  kbUnitQuerySetPosition(crateQueryID, kbUnitGetPosition(getUnit(cUnitTypeTownCenter)));
	  kbUnitQuerySetMaximumDistance(crateQueryID, 20.0);
    }
    else {
      return;
    }
    
     static int unitQueryID=-1;
     //If we don't have the query yet, create one.
     if (unitQueryID < 0)
     {
        unitQueryID=kbUnitQueryCreate("regentGetUnitQuery");
        kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
     }
    //Define a query to get all matching units
    if (unitQueryID != -1) {
      kbUnitQuerySetPlayerRelation(unitQueryID, -1);
      kbUnitQuerySetPlayerID(unitQueryID, cMyID);
      kbUnitQuerySetUnitType(unitQueryID, gEconUnit);
      kbUnitQuerySetState(unitQueryID, cUnitStateAlive);
    }
    else {
      return;
    }
  
    
    kbUnitQueryResetResults(crateQueryID);
    kbUnitQueryResetResults(unitQueryID);
    
    int index = 0;
	int index2 = 0;
	index = kbUnitQueryExecute(crateQueryID);
	index2 = kbUnitQueryExecute(unitQueryID);
	if(index2 < index)
	   index = index2;
    
    for(i=0; < index)
	   aiTaskUnitWork(kbUnitQueryGetResult(unitQueryID, i), kbUnitQueryGetResult(crateQueryID, i));
  }
}



//==============================================================================
// getLowestResourceAmount
/*
   Returns the amount of the resource that's in shortest supply.
   Note:  It does not identify WHICH resource, it just returns the lowest amount.
   Food, wood and gold/coin are considered, others are not.
*/
//==============================================================================

float getLowestResourceAmount()
{
   float retVal = 1000000.0;
   if (kbResourceGet(cResourceWood) < retVal)
      retVal = kbResourceGet(cResourceWood);
   if (kbResourceGet(cResourceFood) < retVal)
      retVal = kbResourceGet(cResourceFood);
   if (kbResourceGet(cResourceGold) < retVal)
      retVal = kbResourceGet(cResourceGold);
   return(retVal);   
}



//==============================================================================
// updateSettlerCounts
/*
   Set the settler maintain plan according to age and our behavior traits  
*/
//==============================================================================
void updateSettlerCounts(void)
{
   if(kbGetCiv() == cCivDutch && kbGetAge() == cAge1)
      aiPlanSetVariableInt(gSettlerMaintainPlan, cTrainPlanNumberToMaintain, 0, 15);
   else if (kbGetCiv() == cCivOttomans)
      aiPlanSetVariableInt(gSettlerMaintainPlan, cTrainPlanNumberToMaintain, 0, 0); 
   else
      aiPlanSetVariableInt(gSettlerMaintainPlan, cTrainPlanNumberToMaintain, 0, 70);
}

//==============================================================================
// updateEscrows
/*
   Set the econ/mil escrow balances based on age, personality and our current
   settler pop compared to what we want to have.

   When we lose a lot of settlers, the economy escrow is expanded and the 
   military escrow is reduced until the econ recovers.  
*/
//==============================================================================
void updateEscrows(void)
{
   float econPercent = 0.0; 
   float milPercent = 0.0;
   //float villTarget = xsArrayGetInt(gTargetSettlerCounts, kbGetAge());  // How many we want to have this age
   float villTarget = aiPlanGetVariableInt(gSettlerMaintainPlan, cTrainPlanNumberToMaintain, 0);   // How many do we want?
   float villCount = kbUnitCount(cMyID, gEconUnit, cUnitStateABQ);   // How many do we have?
   float villRatio = 1.00;   
   if (villTarget > 0.0)
      villRatio = villCount / villTarget;  // Actual over desired.
   float villShortfall = 1.0 - villRatio;  // 0.0 means at target, 0.3 means 30% short of target
   
   switch(kbGetAge())
   {
      case cAge1:
      {
         econPercent = 0.8;  // 80% rushers, 100% boomers
         break;
      }
      case cAge2:
      {
		 econPercent = 0.6 - (0.25 * btRushBoom);  // 10% rushers, 80% boomers
		 break;
      }
      case cAge3:
      {
         econPercent = 0.45 + (0.1 * btRushBoom);  // 0.3,  +/- up to 0.15, + up to 0.3 if we have no vills.
         // At 1/2 our target vill pop, this works out to 0.45 +/- rushBoom effect.  At vill pop, it's 0.3 +/- rushBoom factor.
         break;
      }
      case cAge4:
      {
		 econPercent = 0.15;
         break;
      }
      case cAge5:
      {
         econPercent = 0.1; //+ (0.3 * villShortfall
         break;
      }
   }
   
   if(cMyCiv == cCivPortuguese && kbGetAge() < cAge4)
	  econPercent = econPercent + 0.1;
   if(cMyCiv == cCivXPAztec && kbGetAge() > cAge3)
	  econPercent = econPercent + 0.2;
   if(cMyCiv == cCivXPSioux && kbGetAge() == cAge2 && (xsGetTime() - gAgeUpTime) < 240000)
	  econPercent = 0.4;
   //if(cMyCiv == cCivXPSioux && kbGetAge() == cAge3)
	  //econPercent = econPercent - 0.1;
   //if(cMyCiv == cCivOttomans && kbGetAge() == cAge2 && (xsGetTime() - gAgeUpTime) > 240000)
	  //econPercent = 0.6;
   if(cMyCiv == cCivOttomans && kbGetAge() < cAge4)
	  econPercent = econPercent - 0.1;
   
   if (econPercent < 0.0)
      econPercent = 0.0;
   if (econPercent > 0.8)
      econPercent = 0.8;
   milPercent = 0.8 - econPercent;
   if (kbGetAge() == cAge1)
      milPercent = 0.0;
   
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceFood, econPercent);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceWood, econPercent/2.0);   // Leave most wood at the root  
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceGold, econPercent);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceFame, 0.0);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceSkillPoints, 0.0);
   kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 1000);    // Save for age upgrades
   kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 100);
   if (kbGetAge() >= cAge3)
   {
      kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 1000);
	  kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 700); // Needed for mills, plantations
   }
   kbEscrowSetCap(cEconomyEscrowID, cResourceGold, 1000);   // Save for age upgrades
   if (kbGetCiv() == cCivDutch)
   {
      kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 350); // Needed for banks
      kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 350);
   }
   else if ( (cvMaxAge > -1) && (kbGetAge() >= cvMaxAge) )
   {  // Not dutch, and not facing age upgrade, so reduce food/gold withholding
      kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 250); 
      kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 250);      
   }
  
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceFood, milPercent);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceWood, milPercent/2.0);  
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceGold, milPercent);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceFame, 0.0);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceSkillPoints, 0.0);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceFood, 300);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceWood, 200);
   if (gNavyMap == true)
      kbEscrowSetCap(cMilitaryEscrowID, cResourceWood, 300);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceGold, 300);
   if (gNavyMap == true)
      kbEscrowSetCap(cMilitaryEscrowID, cResourceGold, 200);
  
   kbEscrowSetPercentage(gVPEscrowID, cResourceFood, 0.0);        
//      kbEscrowSetPercentage(gVPEscrowID, cResourceWood, 0.2);        
//      kbEscrowSetPercentage(gVPEscrowID, cResourceGold, 0.15);
   kbEscrowSetPercentage(gVPEscrowID, cResourceFame, 0.0);
   kbEscrowSetPercentage(gVPEscrowID, cResourceSkillPoints, 0.0);
   kbEscrowSetCap(gVPEscrowID, cResourceFood, 0);
   kbEscrowSetCap(gVPEscrowID, cResourceWood, 300);
   kbEscrowSetCap(gVPEscrowID, cResourceGold, 200);
   
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceFood, 0.0);
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceWood, 0.0);
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceGold, 0.0);
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceShips, 0.0);
}



//==============================================================================
// updateGatherers
/*
   Given the desired allocation of gatherers, set the desired number
   of gatherers for each active econ base, and the breakdown between
   resources for each base.
*/
//==============================================================================
void updateGatherers(void)
{
   int i = 0;
  
   static int resourcePriorities = -1;    // An array that holds our priorities for cResourceFood, etc.
   if (resourcePriorities < 0)            // Initialize if needed
      resourcePriorities = xsArrayCreateFloat(cNumResourceTypes, 0.0, "resourcePriorities");

	aiSetResourceGathererPercentageWeight(cRGPScript, 1.0);
	aiSetResourceGathererPercentageWeight(cRGPCost, 0.0);

   /*
      Allocate gatherers based on a weighted average of two systems.  The first system is based
      on the forecasts, ignoring current inventory, i.e. it wants to keep gatherers aligned with
      out medium-term demand, and not swing based on inventory.  The second system is based
      on forecast minus inventory, or shortfall.  This is short-term, highly reactive, and volatile.
      The former factor will be weighted more heavily when inventories are large, the latter when 
      inventories are tight.  (When inventories are zero, they are the same...the second method
      reacts strongly when one resource is at or over forecast, and others are low.)
   */
   float forecastWeight = 1.0;
   float reactiveWeight = 0.0;   // reactive + forecast = 1.0
   static int forecastValues = -1;  // Array holding the relative forecast-oriented values.
   static int reactiveValues = -1;
   static int gathererPercentages = -1;
   
   if (forecastValues < 0)
   {
      forecastValues = xsArrayCreateFloat(cNumResourceTypes, 0.0, "forecast oriented values");
      reactiveValues = xsArrayCreateFloat(cNumResourceTypes, 0.0, "reactive values");
      gathererPercentages = xsArrayCreateFloat(cNumResourceTypes, 0.0, "gatherer percentages");
   }
   
   float totalForecast = 0.0;
   float totalShortfall = 0.0;
   float fcst = 0.0;
   float shortfall = 0.0;
   for (i=0; <cNumResourceTypes)
   {
      fcst = xsArrayGetFloat(gForecasts, i);
      shortfall = fcst - kbResourceGet(i);
      totalForecast = totalForecast + fcst;
      if (shortfall > 0.0)
         totalShortfall = totalShortfall + shortfall;
   }
   
   if (totalForecast > 0)
      reactiveWeight = totalShortfall / totalForecast;
   else
      reactiveWeight = 1.0;
   forecastWeight = 1.0 - reactiveWeight;
   // Make reactive far more important
   if (totalShortfall > (0.3 * totalForecast))  // we have a significant shortfall
   {  // If it was 40/60 reactive:forecast, this makes it 82/18.
      // 10/90 becomes 73/27;  80/20 becomes 94/6
      reactiveWeight = reactiveWeight + (0.7 * forecastWeight);
      forecastWeight = 1.0 - reactiveWeight;
   }
   
   // Update the arrays
   float scratch = 0.0;
   for (i=0; <cNumResourceTypes)
   {
      fcst = xsArrayGetFloat(gForecasts, i);
      shortfall = fcst - kbResourceGet(i);
      xsArraySetFloat(forecastValues, i, fcst / totalForecast);   // This resource's share of the total forecast
      if ( shortfall > 0 )
         xsArraySetFloat(reactiveValues, i, shortfall / totalShortfall);
      else
         xsArraySetFloat(reactiveValues, i, 0.0);
      
      scratch = xsArrayGetFloat(forecastValues, i) * forecastWeight;
      scratch = scratch + (xsArrayGetFloat(reactiveValues, i) * reactiveWeight);
      xsArraySetFloat(gathererPercentages, i, scratch);
   }   
   //aiEcho("Forecast values:");
   //for (i=0; < cNumResourceTypes)
      //aiEcho("    "+i+" "+xsArrayGetFloat(forecastValues, i));
      
   //aiEcho("Shortfall values:");
   //for (i=0; < cNumResourceTypes)
      //aiEcho("    "+i+" "+xsArrayGetFloat(reactiveValues, i));
   
   //aiEcho("Shortfall weight is "+reactiveWeight);
      
   //aiEcho("Raw gatherer percentages:");
   //for (i=0; < cNumResourceTypes)
      //aiEcho("    "+i+" "+xsArrayGetFloat(gathererPercentages, i));
   
   float totalPercentages = 0.0;
   
   
   
   // Normalize if not 1.0
   totalPercentages = 0.0;
   for(i=0; <cNumResourceTypes)
      totalPercentages = totalPercentages + xsArrayGetFloat(gathererPercentages, i);
   for(i=0; <cNumResourceTypes)
      xsArraySetFloat(gathererPercentages, i, xsArrayGetFloat(gathererPercentages, i) / totalPercentages);

   //aiEcho("Wood-adjusted gatherer percentages:");
   //for (i=0; < cNumResourceTypes)
      //aiEcho("    "+i+" "+xsArrayGetFloat(gathererPercentages, i)); 
   
   // Now, consider the effects of dedicated gatherers, like fishing boats and banks, since we need to end up with settler/coureur assignments to pick up the balance.
   float coreGatherers = kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
   coreGatherers = coreGatherers +  kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive);
   float goldGatherers = kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) * 4;
   float foodGatherers = kbUnitCount(cMyID, gFishingUnit, cUnitStateAlive);
   float totalGatherers = coreGatherers + goldGatherers + foodGatherers;
   //aiEcho("We have "+goldGatherers+" dedicated gold gatherers.");
   //aiEcho("We have "+foodGatherers+" dedicated food gatherers.");   
   
   float goldWanted = totalGatherers * xsArrayGetFloat(gathererPercentages, cResourceGold);
   if (goldWanted < goldGatherers)
      goldWanted = goldGatherers;
   float foodWanted = totalGatherers * xsArrayGetFloat(gathererPercentages, cResourceFood);
   if (foodWanted < foodGatherers)
      foodWanted = foodGatherers;
   float woodWanted = totalGatherers * xsArrayGetFloat(gathererPercentages, cResourceWood);

   
   // What percent of our core gatherers should be on each resource?
   xsArraySetFloat(gathererPercentages, cResourceGold, (goldWanted - goldGatherers) / coreGatherers);
   xsArraySetFloat(gathererPercentages, cResourceFood, (foodWanted - foodGatherers) / coreGatherers);
   xsArraySetFloat(gathererPercentages, cResourceWood, (woodWanted) / coreGatherers);
   // Normalize
   totalPercentages = 0.0;
   for(i=0; <cNumResourceTypes)
      totalPercentages = totalPercentages + xsArrayGetFloat(gathererPercentages, i);
   for(i=0; <cNumResourceTypes)
      xsArraySetFloat(gathererPercentages, i, xsArrayGetFloat(gathererPercentages, i) / totalPercentages);
   
   //aiEcho("Gatherer percentages, adjusted for dedicated gatherers:");
   //for (i=0; < cNumResourceTypes)
      //aiEcho("    "+i+" "+xsArrayGetFloat(gathererPercentages, i)); 

	// Set the new values.
	for (i=0; <cNumResourceTypes)
		aiSetResourceGathererPercentage(i, xsArrayGetFloat(gathererPercentages, i), false, cRGPScript);
	
   aiNormalizeResourceGathererPercentages(cRGPScript);   // Set them to 1.0 total, just in case these don't add up.
}




// _from 1500 to 2500

//==============================================================================
// rule resourceManager
/*
   Watch the resource balance, buy/sell imbalanced resources as needed
   
   In initial build phase (first 5 houses?) sell all food, buy wood with 
   any gold.  Later, look for imbalances.
*/
//==============================================================================
rule resourceManager
inactive
minInterval 10
group startup
{
   bool goAgain = false;         // Set this flag if we do a buy or sell and want to quickly evaluate
   static bool fastMode = false; // Set this flag if we enter high-speed mode, clear it on leaving
   static int lastTributeRequestTime = 0;
   
   if (aiResourceIsLocked(cResourceGold) == true)
   {
      aiEcho("Gold is locked.");
      if (fastMode == true)
      {
         // We need to slow down.
         xsSetRuleMinIntervalSelf(10);
         aiEcho("Resource manager going to slow mode.");
         fastMode = false;
      }
      return;
   }

   if ( ((xsGetTime() - lastTributeRequestTime) > 300000) && ((xsGetTime() - gLastTribSentTime) > 120000) )    // Don't request too often, and don't request right after sending.
   {  // See if we have a critical shortage of anything
      float totalResources = kbResourceGet(cResourceFood) + kbResourceGet(cResourceWood) + kbResourceGet(cResourceGold);
      if ( (totalResources > 1000.0) && (kbGetAge() > cAge1) )
      {  // Don't request tribute if we're short on everything, just for imbalances.  And skip age 1, since we'll have zero gold and mucho food.
         if (kbResourceGet(cResourceFood) < (totalResources / 10.0) )
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyRequestFood);
            lastTributeRequestTime = xsGetTime();
         }
         if (kbResourceGet(cResourceGold) < (totalResources / 10.0) )
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyRequestCoin);
            lastTributeRequestTime = xsGetTime();
         }
         if (kbResourceGet(cResourceWood) < (totalResources / 10.0) )
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyRequestWood);
            lastTributeRequestTime = xsGetTime();
         }
      }
   }
   
   // Normal imbalance rules apply
   if ( (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) > 0) && (aiResourceIsLocked(cResourceGold) == false))
   {
      if ( (kbResourceGet(cResourceFood) > (5*getLowestResourceAmount())) && (kbResourceGet(cResourceFood) > 2500) && (aiResourceIsLocked(cResourceFood) == false) )
      {  // Sell food!  We have much, and it's 5x min
         aiSellResourceOnMarket(cResourceFood);
         aiEcho("Selling 100 food.");
         goAgain = true;
      }         
      if ( (kbResourceGet(cResourceWood) > (5*getLowestResourceAmount())) && (kbResourceGet(cResourceWood) > 2500) && (aiResourceIsLocked(cResourceWood) == false)  )
      {  // Sell wood!  We have much, and it's 5x min
         aiSellResourceOnMarket(cResourceWood);
         aiEcho("Selling 100 wood.");
         goAgain = true;
      }         
      if ( (kbResourceGet(cResourceGold) > (5*getLowestResourceAmount())) && (kbResourceGet(cResourceGold) > 2500) )
      {  // Buy something!  We have much gold, and it's 5x min
         if (kbResourceGet(cResourceFood) < kbResourceGet(cResourceWood))
         {
            if ( aiResourceIsLocked(cResourceFood) == false )
            {
               aiBuyResourceOnMarket(cResourceFood);
               aiEcho("Buying 100 food.");
               goAgain = true;
            }
         }
         else
         {
            if ( aiResourceIsLocked(cResourceWood) == false )
            {
               aiBuyResourceOnMarket(cResourceWood);
               aiEcho("Buying 100 wood.");
               goAgain = true;
            }
         }
      }
   }


   if ( (goAgain == true) && (fastMode == false) )
   {
      // We need to set fast mode
      xsSetRuleMinIntervalSelf(1);
      aiEcho("Going to fast mode.");
      fastMode = true;
   }
   if ( (goAgain == false) && (fastMode == true) )
   {
      // We need to slow down.
      xsSetRuleMinIntervalSelf(10);
      aiEcho("Resource manager going to slow mode.");
      fastMode = false;
   }
}

void findEnemyBase(void)
{
   if ( (cRandomMapName == "caribbean") || (cRandomMapName == "ceylon") )
      return();   // TODO...make a water version, look for enemy home island?
   
   if (cvOkToExplore == false)
      return();  
 
   
   //Create an explore plan to go there.
   vector myBaseLocation=kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)); // Main base location...need to find reflection.
   vector centerOffset = kbGetMapCenter() - myBaseLocation;
   vector targetLocation = kbGetMapCenter();
   // TargetLocation is now a mirror image of my base.
   aiEcho("My base is at "+myBaseLocation+", enemy base should be near "+targetLocation);
   int exploreID=aiPlanCreate("Probe Enemy Base", cPlanExplore);
	if (exploreID >= 0)
	{
      aiPlanAddUnitType(exploreID, gEconUnit, 1, 1, 1);
      aiPlanAddWaypoint(exploreID, targetLocation);
      aiPlanSetVariableBool(exploreID, cExplorePlanDoLoops, 0, false);
      aiPlanSetVariableBool(exploreID, cExplorePlanQuitWhenPointIsVisible, 0, true);
      aiPlanSetVariableBool(exploreID, cExplorePlanAvoidingAttackedAreas, 0, false);
      aiPlanSetVariableInt(exploreID, cExplorePlanNumberOfLoops, 0, -1);
      aiPlanSetRequiresAllNeedUnits(exploreID, true);
      aiPlanSetVariableVector(exploreID, cExplorePlanQuitWhenPointIsVisiblePt, 0, targetLocation);
		aiPlanSetDesiredPriority(exploreID, 100);
      aiPlanSetActive(exploreID);
	}
}



//==============================================================================
/*
   Tower manager
   
   Tries to maintain gNumTowers for the number of towers near the main base.

   If there are idle outpost wagons, use them.  If not, use villagers to build outposts.
   Russians use blockhouses via gTowerUnit.  

   Placement algorithm is brain-dead simple.  Check a point that is mid-edge or a 
   corner of a square around the base center.  Look for a nearby tower.  If none, 
   do a tight build plan.  If there is one, try again.    If no luck, try a build
   plan that just avoids other towers.

*/
//==============================================================================
rule towerManager
inactive
minInterval 10
{
   // _use towerManager2 instead
      xsDisableSelf();
	  return;  // Oops.  I shouldn't be running.
   
}

vector selectForwardBaseLocation(void)
{
   vector retVal = cInvalidVector;
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   vector v = cInvalidVector; // Scratch variable for intermediate calcs.
   
   aiEcho("Selecting forward base location.");
   float distanceMultiplier = 0.5;  // Will be used to determine how far out we should put the fort on the line from our base to enemy TC.
   float dist = 0.0;
   
   int enemyTC = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateABQ, mainBaseVec, 500.0);
   if (enemyTC < 0)
   {  
      retVal = kbGetMapCenter();   // Start with map center
      aiEcho("    No enemy TC found, using map center at "+retVal);
   }
   else  // enemy TC found
   {
      v = kbUnitGetPosition(enemyTC) - mainBaseVec;   // Vector from main base to enemy TC
      dist = distance(mainBaseVec, kbUnitGetPosition(enemyTC));
      if (dist > 200.0)
         distanceMultiplier = (dist-100.0) / dist; // I.e. take halfway point, or 100m from enemy TC, whichever is farther from my base.
      v = v * distanceMultiplier;   // Halfway there, or 100 meters away from enemy, whichever is closer to enemy.
      retVal = mainBaseVec + v;  // retval is midpoint between main base and nearest enemy TC.
      aiEcho("    Enemy TC ("+enemyTC+") found at "+kbUnitGetPosition(enemyTC));
      aiEcho("    Using midpoint of "+retVal);
   }
   // Now, make sure it's on the same areagroup, back up if it isn't.
   dist = distance(mainBaseVec, retVal);
   int mainAreaGroup = kbAreaGroupGetIDByPosition(mainBaseVec);
   vector delta = (mainBaseVec - retVal) * 0.1;
   int step = 0;
   bool siteFound = false;
   if (dist > 0.0)
   {
      for (step = 0; < 9)
      {
         aiEcho("    "+retVal+" is in area group "+kbAreaGroupGetIDByPosition(retVal));
         if ( getUnitByLocation(cUnitTypeFortFrontier, cPlayerRelationEnemy, cUnitStateABQ, retVal, 60.0) >= 0 )
            continue;   // DO NOT build anywhere near an enemy fort!
         if ( getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateABQ, retVal, 60.0) >= 0 )
            continue;   // Ditto enemy TCs.
         if (mainAreaGroup == kbAreaGroupGetIDByPosition(retVal)) 
         {  // DONE!
            aiEcho("        Good location found.");
            siteFound = true;
            break;
         }
         retVal = retVal + delta;   // Move 1/10 of way back to main base, try again.
      }
   }
   if (siteFound == false)
      retVal = mainBaseVec;
   if (aiGetWorldDifficulty() < cDifficultyModerate)
      retVal = mainBaseVec;   // Easy and Sandbox will never forward build.
   aiEcho("    New forward base location will be "+retVal);
   return(retVal);
}


//==============================================================================
/*
   Forward base manager
   
Handles the planning, construction, defense and maintenance of a forward military base.

The steps involved:
1)  Choose a location
2)  Defend it and send a fort wagon to build a fort.
3)  Define it as the military base, move defend plans there, move military production there.
4)  Undo those settings if it needs to be abandoned.

*/
//==============================================================================
rule forwardBaseManager
inactive
group tcComplete
minInterval 30
{
   if ( (cvOkToBuild == false) || (cvOkToBuildForts == false) || (aiTreatyActive() == true) )
      return;
   switch(gForwardBaseState)
   {
      case cForwardBaseStateNone:
      {
         // Check if we should go to state Building
         if (kbUnitCount(cMyID, cUnitTypeFortWagon, cUnitStateAlive) > 0)
         {  // Yes.
            // get the fort wagon, start a build plan, keep it defended
            gForwardBaseLocation = selectForwardBaseLocation();
            gForwardBaseBuildPlan = aiPlanCreate("Fort build plan ", cPlanBuild);
            aiPlanSetVariableInt(gForwardBaseBuildPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeFortFrontier);
            aiPlanSetDesiredPriority(gForwardBaseBuildPlan, 87);
            // Military
            aiPlanSetMilitary(gForwardBaseBuildPlan, true);
            aiPlanSetEconomy(gForwardBaseBuildPlan, false);
            aiPlanSetEscrowID(gForwardBaseBuildPlan, cMilitaryEscrowID);
            aiPlanAddUnitType(gForwardBaseBuildPlan, cUnitTypeFortWagon, 1, 1, 1);
         
            // Instead of base ID or areas, use a center position
            aiPlanSetVariableVector(gForwardBaseBuildPlan, cBuildPlanCenterPosition, 0, gForwardBaseLocation);
            aiPlanSetVariableFloat(gForwardBaseBuildPlan, cBuildPlanCenterPositionDistance, 0, 50.0);
     
            // Weight it to stay very close to center point.
            aiPlanSetVariableVector(gForwardBaseBuildPlan, cBuildPlanInfluencePosition, 0, gForwardBaseLocation);    // Position influence for center
            aiPlanSetVariableFloat(gForwardBaseBuildPlan, cBuildPlanInfluencePositionDistance, 0,  50.0);     // 100m range.
            aiPlanSetVariableFloat(gForwardBaseBuildPlan, cBuildPlanInfluencePositionValue, 0, 100.0);        // 100 points for center
            aiPlanSetVariableInt(gForwardBaseBuildPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff
            
            // Add position influence for nearby towers
            aiPlanSetVariableInt(gForwardBaseBuildPlan, cBuildPlanInfluenceUnitTypeID, 0, cUnitTypeFortFrontier);   // Don't build anywhere near another fort.
            aiPlanSetVariableFloat(gForwardBaseBuildPlan, cBuildPlanInfluenceUnitDistance, 0, 50.0);    
            aiPlanSetVariableFloat(gForwardBaseBuildPlan, cBuildPlanInfluenceUnitValue, 0, -200.0);        // -20 points per fort
            aiPlanSetVariableInt(gForwardBaseBuildPlan, cBuildPlanInfluenceUnitFalloff, 0, cBPIFalloffNone);  // Cliff falloff

            
            aiPlanSetActive(gForwardBaseBuildPlan);
            
            // Chat to my allies
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyIWillBuildMilitaryBase, gForwardBaseLocation);
            
            gForwardBaseState = cForwardBaseStateBuilding;
               aiEcho(" ");
               aiEcho("    BUILDING FORWARD BASE, MOVING DEFEND PLANS TO COVER.");
               aiEcho("    PLANNED LOCATION IS "+gForwardBaseLocation); 
               aiEcho(" ");
            
            if (gDefenseReflex == false)
               endDefenseReflex();  // Causes it to move to the new location
         }
         break;
      }
      case cForwardBaseStateBuilding:
      {
         int fortUnitID = getUnitByLocation(cUnitTypeFortFrontier, cMyID, cUnitStateAlive, gForwardBaseLocation, 100.0);
         if ( fortUnitID >= 0 )
         {  // Building exists and is complete, go to state Active
            if ( kbUnitGetBaseID(fortUnitID) >= 0) 
            {  // Base has been created for it.
               gForwardBaseState = cForwardBaseStateActive;
               gForwardBaseID = kbUnitGetBaseID(fortUnitID);
               gForwardBaseLocation = kbUnitGetPosition(fortUnitID);  
               aiEcho("Forward base location is "+gForwardBaseLocation+", Base ID is "+gForwardBaseID+", Unit ID is "+fortUnitID);
               // Tell the attack goal where to go.
               aiPlanSetBaseID(gMainAttackGoal, gForwardBaseID);
                  aiEcho(" ");
                  aiEcho("    FORWARD BASE COMPLETED, GOING TO STATE ACTIVE, MOVING ATTACK GOAL.");
                  aiEcho(" ");
            }
            else
            {
               aiEcho(" ");
               aiEcho("    FORT COMPLETE, WAITING FOR FORWARD BASE ID.");
               aiEcho(" ");
            }
         }
         else  // Check if plan still exists. If not, go back to state 'none'.
         {
            if (aiPlanGetState(gForwardBaseBuildPlan) < 0)
            {  // It failed?
               gForwardBaseState = cForwardBaseStateNone;
               gForwardBaseLocation = cInvalidVector;
               gForwardBaseID = -1;
               gForwardBaseBuildPlan = -1;
               aiEcho(" ");
               aiEcho("    FORWARD BASE PLAN FAILED, RETURNING TO STATE NONE.");
               aiEcho(" ");
            }
         }
         
         break;
      }
      case cForwardBaseStateActive:
      {  // Normal state.  If fort is destroyed and base overrun, bail.
         if ( getUnitByLocation(cUnitTypeFortFrontier, cMyID, cUnitStateAlive, gForwardBaseLocation, 50.0) < 0 )
         {
            // Fort is missing, is base still OK?  
            if ( ((gDefenseReflexBaseID == gForwardBaseID) && (gDefenseReflexPaused == true)) 
               || ( kbBaseGetNumberUnits( cMyID, gForwardBaseID, cPlayerRelationSelf, cUnitTypeBuilding ) < 1))   // Forward base under attack and overwhelmed, or gone.
            {  // No, not OK.  Get outa Dodge.
               gForwardBaseState = cForwardBaseStateNone;
               gForwardBaseID = -1;
               gForwardBaseLocation = cInvalidVector;
               // Tell the attack goal to go back to the main base.
               aiPlanSetBaseID(gMainAttackGoal, kbBaseGetMainID(cMyID));
               endDefenseReflex();
               aiEcho(" ");
               aiEcho("    ABANDONING FORWARD BASE, RETREATING TO MAIN BASE.");
               aiEcho(" ");
            }
         }
         break;
      }
   }
}



void deathMatchSetup(void)
{  // Make a bunch of changes to get a deathmatch start
   aiEcho("RUNNING DEATHMATCH SETUP");
   // 10 houses, pronto.
   if (cMyCiv != cCivXPSioux)
      createSimpleBuildPlan(gHouseUnit, 10, 99, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   // 1 each of the main military buildings, ASAP.
   if ( (civIsNative() == false) && (civIsAsian() == false) )
   {
      createSimpleBuildPlan(cUnitTypeBarracks, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      createSimpleBuildPlan(cUnitTypeStable, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   else if (civIsAsian() == true) {
      if ( (cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy) ) {
        createSimpleBuildPlan(cUnitTypeypBarracksJapanese, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypStableJapanese, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else if ( (cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese) ) {
        createSimpleBuildPlan(cUnitTypeypWarAcademy, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else {
        createSimpleBuildPlan(cUnitTypeYPBarracksIndian, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypCaravanserai, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   else
   {      
      createSimpleBuildPlan(cUnitTypeWarHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      if (cMyCiv == cCivXPAztec)
         createSimpleBuildPlan(cUnitTypeNoblesHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      else
         createSimpleBuildPlan(cUnitTypeCorral, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   if ( (civIsNative() == false) || (cMyCiv == cCivXPIroquois) ) {
    if (civIsAsian() == false)
      createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
    else
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   gNumTowers = 7;   // Load up on towers.
   xsEnableRule("turtleUp");
   xsEnableRule("moreDMHouses");
}

rule moreDMHouses
inactive
minInterval 90
{  // After 90 seconds, make 10 more houses
   if (cMyCiv != cCivXPSioux)
      createSimpleBuildPlan(gHouseUnit, 10, 99, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   // 1 each of the main military buildings, ASAP.
   if ( (civIsNative() == false) && (civIsAsian() == false) )
   {
      createSimpleBuildPlan(cUnitTypeBarracks, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      createSimpleBuildPlan(cUnitTypeStable, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);   
   }
   else if (civIsAsian() == true) {
      if ( (cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy) ) {
        createSimpleBuildPlan(cUnitTypeypBarracksJapanese, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypStableJapanese, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else if ( (cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese) ) {
        createSimpleBuildPlan(cUnitTypeypWarAcademy, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else {
        createSimpleBuildPlan(cUnitTypeYPBarracksIndian, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypCaravanserai, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   else
   {      
      createSimpleBuildPlan(cUnitTypeWarHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      if (cMyCiv == cCivXPAztec)
         createSimpleBuildPlan(cUnitTypeNoblesHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      else
         createSimpleBuildPlan(cUnitTypeCorral, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   if ( (civIsNative() == false) || (cMyCiv == cCivXPIroquois) ) {
    if (civIsAsian() == false)
      createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
    else
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
  }

   xsEnableRule("finalDMHouses");
}

rule finalDMHouses
inactive
minInterval 120
{
   int count = kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive);
   int max = kbGetBuildLimit(cMyID, gHouseUnit);
   
   count = max - count; // Count is number needed.
   if ( aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gHouseUnit) >= 0 )
      count = count - 1;
   if (cMyCiv == cCivXPSioux)
      count = 0;
   
   if (count > 0)
      createSimpleBuildPlan(gHouseUnit, count, 99, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   // 1 each of the main military buildings, ASAP.
   if ( (civIsNative() == false) && (civIsAsian() == false) )
   {
      createSimpleBuildPlan(cUnitTypeBarracks, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      createSimpleBuildPlan(cUnitTypeStable, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);   
   }
   else if (civIsAsian() == true) {
      if ( (cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy)) {
        createSimpleBuildPlan(cUnitTypeypBarracksJapanese, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypStableJapanese, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else if ( (cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese) ) {
        createSimpleBuildPlan(cUnitTypeypWarAcademy, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      else {
        createSimpleBuildPlan(cUnitTypeYPBarracksIndian, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        createSimpleBuildPlan(cUnitTypeypCaravanserai, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 97, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   else
   {      
      createSimpleBuildPlan(cUnitTypeWarHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      if (cMyCiv == cCivXPAztec)
         createSimpleBuildPlan(cUnitTypeNoblesHut, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      else
         createSimpleBuildPlan(cUnitTypeCorral, 1, 98, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   if ( (civIsNative() == false) || (cMyCiv == cCivXPIroquois) ) {
    if (civIsAsian() == false)
      createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
    else
      createSimpleBuildPlan(cUnitTypeypCastle, 1, 96, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }

   xsDisableSelf();
}

int getDogTargetPlayer()
{
   int count = 0;
   int retVal = -1;
   static int unitQueryID = -1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("dog target count");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
      kbUnitQuerySetPlayerRelation(unitQueryID, cPlayerRelationEnemyNotGaia);
   }
   
   kbUnitQuerySetUnitType(unitQueryID, cUnitTypeTownCenter);
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
   kbUnitQueryResetResults(unitQueryID);
	count = kbUnitQueryExecute(unitQueryID);  
   
   if (count > 0)
      retVal = kbUnitGetPlayerID(kbUnitQueryGetResult(unitQueryID,aiRandInt(count)));
   else
      retVal = aiGetMostHatedPlayerID();
   
   return(retVal);
}

//==============================================================================
/*
   Military Manager
   
   Create maintain plans for military unit lines.  Control 'maintain' levels,
   buy upgrades.  
*/
//==============================================================================
rule militaryManager
inactive
minInterval 60
{
   
   static bool init = false;   // Flag to indicate vars, plans are initialized
   int i = 0;
   int proto = 0;
   int planID = -1;

   
   //if(cMyCiv == cCivGermans && kbUnitCount(cMyID, cUnitTypeBarracks, cUnitStateABQ) < 1)
      //return;
   if (init == false)
   {     
		// Need to initialize, if we're allowed to.
      if (cvOkToTrainArmy == true)
      {
         init = true;
         if (cvNumArmyUnitTypes >= 0)
            gNumArmyUnitTypes = cvNumArmyUnitTypes;
         else
            gNumArmyUnitTypes = 3;
         gLandUnitPicker = initUnitPicker("Land military units", gNumArmyUnitTypes, 1, 60, -1, -1, 1, true);
         
         // now the goal
         // wmj -- hard coded for now, but this should most likely ramp up as the ages progress
         aiSetMinArmySize(5);
		 
		 if(kbGetCiv() == cCivChinese || kbGetCiv() == cCivIndians)
		    gMainAttackGoal = createSimpleAttackGoal("AttackGoal", -1, gLandUnitPicker, -1, cAge3, -1, gMainBase, false); //aiGetMostHatedPlayerID() getDogTargetPlayer()
		 else
		    gMainAttackGoal = createSimpleAttackGoal("AttackGoal", -1, gLandUnitPicker, -1, cAge2, -1, gMainBase, false);
		 
         aiPlanSetVariableInt(gMainAttackGoal, cGoalPlanReservePlanID, 0, gLandReservePlan);
      }
   }

	if(gLandUnitPicker != -1)
	{

      setUnitPickerPreference(gLandUnitPicker); // Update preferences in case btBiasEtc vars have changed, or cvPrimaryArmyUnit has changed.

		if(kbGetAge() == cAge3)
		{
			kbUnitPickSetMinimumNumberUnits(gLandUnitPicker, 1);     //Min is really managed by scoring system.
                                                                  // An ally or trigger-spawned mission should 'go' even if it's very small.
			kbUnitPickSetMaximumNumberUnits(gLandUnitPicker, 70);
		}
		if(kbGetAge() == cAge4)
		{
			kbUnitPickSetMinimumNumberUnits(gLandUnitPicker, 1);
			kbUnitPickSetMaximumNumberUnits(gLandUnitPicker, 75);
		}
		if(kbGetAge() == cAge5)
		{
			kbUnitPickSetMinimumNumberUnits(gLandUnitPicker, 1);
			kbUnitPickSetMaximumNumberUnits(gLandUnitPicker, 80);
		}
	}
   
   int n=0;
   switch(kbGetAge())
   {
      case cAge1:
      {
         break;
      }
      case cAge2:
      {
         aiSetMinArmySize(10); // Now irrelevant?  (Was used to determine when to launch attack, but attack goal and opp scoring now do this.)
         break;
      }
      case cAge3:
      {
		 aiSetMinArmySize(15);
         break;
      }
      case cAge4:
      {
         n=20;
		 if(kbUnitCount(cMyID, cUnitTypeGrenadier, cUnitStateAlive) > 0 ||
		 kbUnitCount(cMyID, cUnitTypeypUrumi, cUnitStateAlive) > 0 ||
		 kbUnitCount(cMyID, cUnitTypexpSkullKnight, cUnitStateAlive) > 0 ||
		 kbUnitCount(cMyID, cUnitTypeRocket, cUnitStateAlive) > 0)
		    n = 15;
		 aiSetMinArmySize(n);//20
         break;
      }
      case cAge5:
      {
         n=21;
		 if(kbUnitCount(cMyID, cUnitTypeGrenadier, cUnitStateAlive) > 0 ||
		 kbUnitCount(cMyID, cUnitTypeypUrumi, cUnitStateAlive) > 0 ||
		 kbUnitCount(cMyID, cUnitTypeRocket, cUnitStateAlive) > 0)
		    n = 16;
		 aiSetMinArmySize(n);//21
         break;
      }
   }
}

int getTpTargetPlayer()
{
   int count = 0;
   int retVal = -1;
   static int unitQueryID = -1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("tp target count");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
      kbUnitQuerySetPlayerRelation(unitQueryID, cPlayerRelationEnemyNotGaia);
   }
   
   kbUnitQuerySetUnitType(unitQueryID, cUnitTypeTradingPost);
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
   kbUnitQuerySetPosition(unitQueryID, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
   kbUnitQuerySetMaximumDistance(unitQueryID, 120.0);
   
   kbUnitQueryResetResults(unitQueryID);
	count = kbUnitQueryExecute(unitQueryID);  
   
   if (count > 0)
      retVal = kbUnitGetPlayerID(kbUnitQueryGetResult(unitQueryID,0));
   
   return(retVal);
}

int getJaTargetPlayer()    // shrinejp
{
   int count = 0;
   int retVal = -1;
   static int unitQueryID = -1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("jhouse target count");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
      kbUnitQuerySetPlayerRelation(unitQueryID, cPlayerRelationEnemyNotGaia);
   }
   
   kbUnitQuerySetUnitType(unitQueryID, cUnitTypeypShrineJapanese); // cUnitTypeypShrineJapanese
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
   kbUnitQuerySetPosition(unitQueryID, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
   kbUnitQuerySetMaximumDistance(unitQueryID, 120.0);
   
   kbUnitQueryResetResults(unitQueryID);
	count = kbUnitQueryExecute(unitQueryID);  
   
   if (count > 0)
      retVal = kbUnitGetPlayerID(kbUnitQueryGetResult(unitQueryID,0));
   
   return(retVal);
}

int getNavalTargetPlayer()    // Find an enemy player ID to attack on the water.
{
   int count = 0;
   int retVal = -1;
   static int unitQueryID = -1;

   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("navy target count");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
      kbUnitQuerySetPlayerRelation(unitQueryID, cPlayerRelationEnemyNotGaia);
   }
   
   kbUnitQuerySetUnitType(unitQueryID, gDockUnit);   // Docks
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
   kbUnitQueryResetResults(unitQueryID);
	count = kbUnitQueryExecute(unitQueryID);  
   //aiEcho("Enemy fishing boats: "+ count);
   
   kbUnitQuerySetUnitType(unitQueryID, cUnitTypeAbstractWarShip);   // Warships
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
	count = kbUnitQueryExecute(unitQueryID);  // Cumulative, don't clear it.
   //aiEcho("Enemy fishing boats and warships: "+ count);
   
   kbUnitQuerySetUnitType(unitQueryID, gFishingUnit);   // Fishing boats
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
	count = kbUnitQueryExecute(unitQueryID);  // Cumulative, don't clear it.
   //aiEcho("Enemy fishing boats, warships and docks: "+ count);
   
   if (count > 0)
      retVal = kbUnitGetPlayerID(kbUnitQueryGetResult(unitQueryID,0));
   
   aiEcho("Enemy boat owner is player "+retVal);
   
   return(retVal);
}

int getNavalTargetPlayer2()    // Find an enemy player ID to attack on the water.
{
   int count = 0;
   int retVal = -1;
   static int unitQueryID = -1;
   
   //If we don't have the query yet, create one.
   if (unitQueryID < 0)
   {
      unitQueryID=kbUnitQueryCreate("navy army count");
      kbUnitQuerySetIgnoreKnockedOutUnits(unitQueryID, true);
      kbUnitQuerySetPlayerRelation(unitQueryID, cPlayerRelationEnemyNotGaia);
   }
   
   kbUnitQuerySetUnitType(unitQueryID, cUnitTypeAbstractWarShip);
   kbUnitQuerySetSeeableOnly(unitQueryID, true);
   kbUnitQuerySetState(unitQueryID, cUnitStateABQ);
   kbUnitQuerySetPosition(unitQueryID, kbUnitGetPosition(getUnit(cUnitTypeLogicalTypeLandMilitary)));
   kbUnitQuerySetMaximumDistance(unitQueryID, 50.0);
   
   kbUnitQueryResetResults(unitQueryID);
	count = kbUnitQueryExecute(unitQueryID);  
   //aiEcho("Enemy fishing boats: "+ count);
   
   if (count > 0)
      retVal = kbUnitGetPlayerID(kbUnitQueryGetResult(unitQueryID,0));
   
   aiEcho("Enemy boat owner is player "+retVal);
   
   return(retVal);
}

rule earlyJaAttack
active
minInterval 30
{  // Broke this out separately (from navyManager) so that scenarios that start with a pre-made navy will work.
   if (cvInactiveAI == true)
   {
      xsDisableSelf();
      return;
   }
   int numTroop = kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive);
   if (kbGetAge() < cAge3 || numTroop < 10)
      return;
   
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   static int attackPlan = -1;
	   
	if (getJaTargetPlayer() > 0)  // There's something to attack
    {
	  attackPlan = aiPlanCreate("ja attack plan", cPlanAttack);
         aiPlanSetVariableInt(attackPlan, cAttackPlanPlayerID, 0, getJaTargetPlayer());
         aiPlanSetNumberVariableValues(attackPlan, cAttackPlanTargetTypeID, 2, true);
         aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 0, cUnitTypeypShrineJapanese);
		 aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 1, cUnitTypeUnit);
         aiPlanSetVariableVector(attackPlan, cAttackPlanGatherPoint, 0, mainBaseVec);
         aiPlanSetVariableFloat(attackPlan, cAttackPlanGatherDistance, 0, 30.0);
         aiPlanSetVariableInt(attackPlan, cAttackPlanRefreshFrequency, 0, 5);
         aiPlanSetDesiredPriority(attackPlan, 80);
         aiPlanAddUnitType(attackPlan, cUnitTypeLogicalTypeLandMilitary, 6, 8, 10);
         aiPlanSetInitialPosition(attackPlan, mainBaseVec);
         aiPlanSetActive(attackPlan, true);
		 xsDisableSelf();
	}

}

rule earlyTpAttack
active
minInterval 30
{  // Broke this out separately (from navyManager) so that scenarios that start with a pre-made navy will work.
   if (cvInactiveAI == true)
   {
      xsDisableSelf();
      return;
   }
   int numTroop = kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive);
   if (kbGetAge() < cAge3 || numTroop < 10)
      return;
   
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   static int attackPlan = -1;
	   
	if (getTpTargetPlayer() > 0)  // There's something to attack
    {
	  attackPlan = aiPlanCreate("tp attack plan", cPlanAttack);
         aiPlanSetVariableInt(attackPlan, cAttackPlanPlayerID, 0, getTpTargetPlayer());
         aiPlanSetNumberVariableValues(attackPlan, cAttackPlanTargetTypeID, 2, true);
         aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 0, cUnitTypeTradingPost);
		 aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 1, cUnitTypeUnit);
         aiPlanSetVariableVector(attackPlan, cAttackPlanGatherPoint, 0, mainBaseVec);
         aiPlanSetVariableFloat(attackPlan, cAttackPlanGatherDistance, 0, 30.0);
         aiPlanSetVariableInt(attackPlan, cAttackPlanRefreshFrequency, 0, 5);
         aiPlanSetDesiredPriority(attackPlan, 86);
         aiPlanAddUnitType(attackPlan, cUnitTypeLogicalTypeLandMilitary, 6, 8, 10); 
         aiPlanSetInitialPosition(attackPlan, mainBaseVec);
         aiPlanSetActive(attackPlan, true);
		 xsDisableSelf();
	}
}

rule waterAttackDefend
active
minInterval 15
{  // Broke this out separately (from navyManager) so that scenarios that start with a pre-made navy will work.
   if (cvInactiveAI == true)
   {
      xsDisableSelf();
      return;
   }
   int navyUnit = getUnit(cUnitTypeAbstractWarShip, cMyID, cUnitStateAlive);
   int flagUnit = getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID);
   int dQuery = getUnit(gDockUnit, cPlayerRelationSelf, cUnitStateAlive);
   
   if (navyUnit < 0 || flagUnit < 0)
      return;
   
   vector tl = kbUnitGetPosition(flagUnit);
   
   if (gNavyDefendPlan < 0)  
   {
      gNavyDefendPlan = aiPlanCreate("Primary Water Defend", cPlanDefend);
      aiPlanAddUnitType(gNavyDefendPlan, cUnitTypeAbstractWarShip , 1, 1, 200);    // Grab first caravel and any others
      aiPlanAddUnitType(gNavyDefendPlan, cUnitTypexpWarCanoe, 1, 1, 200);
      
      aiPlanSetVariableVector(gNavyDefendPlan, cDefendPlanDefendPoint, 0, tl);
      aiPlanSetVariableFloat(gNavyDefendPlan, cDefendPlanEngageRange, 0, 100.0);    // Loose
      aiPlanSetVariableBool(gNavyDefendPlan, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(gNavyDefendPlan, cDefendPlanGatherDistance, 0, 40.0);
      aiPlanSetInitialPosition(gNavyDefendPlan, tl);
      aiPlanSetUnitStance(gNavyDefendPlan, cUnitStanceDefensive);
      aiPlanSetVariableInt(gNavyDefendPlan, cDefendPlanRefreshFrequency, 0, 20);
      aiPlanSetVariableInt(gNavyDefendPlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
      aiPlanSetDesiredPriority(gNavyDefendPlan, 20);    // Very low priority, gather unused units.
      aiPlanSetActive(gNavyDefendPlan); 
      aiEcho("Creating primary navy defend plan at "+tl);
   }
   /*else{
	  if(dQuery < 0)
	     return;
	  int x = getUnitByLocation(cUnitTypeAbstractFish, 0, cUnitStateAny, kbUnitGetPosition(dQuery), 30.0);
	  if(x >= 0){
		 aiPlanSetVariableVector(gNavyDefendPlan, cDefendPlanDefendPoint, 0, kbUnitGetPosition(x));
	  }
	  //aiPlanSetVariableVector(gNavyDefendPlan, cDefendPlanDefendPoint, 0, kbUnitGetPosition(dQuery));
   }*/
   
   int milCount = kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive);
   //int dQuery = getUnit(gDockUnit, cPlayerRelationSelf, cUnitStateAlive);
   
   if (milCount < 30 || dQuery < 0)
      return;
   
   vector targetLocation = kbUnitGetPosition(dQuery);
   int x = getUnitByLocation(gTowerUnit, cPlayerRelationSelf, cUnitStateAlive, kbUnitGetPosition(dQuery), 30.0);
   if(x >= 0)
      targetLocation = kbUnitGetPosition(x);
   
   if (gNavyDefendPlan2 < 0)  
   {
      gNavyDefendPlan2 = aiPlanCreate("Primary Water Defend2", cPlanDefend);
      aiPlanAddUnitType(gNavyDefendPlan2, cUnitTypeLogicalTypeLandMilitary , 1, 1, 1);
      
      aiPlanSetVariableVector(gNavyDefendPlan2, cDefendPlanDefendPoint, 0, targetLocation);
      aiPlanSetVariableFloat(gNavyDefendPlan2, cDefendPlanEngageRange, 0, 50.0);    // Loose
      aiPlanSetVariableBool(gNavyDefendPlan2, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(gNavyDefendPlan2, cDefendPlanGatherDistance, 0, 40.0);
      aiPlanSetInitialPosition(gNavyDefendPlan2, targetLocation);
      aiPlanSetUnitStance(gNavyDefendPlan2, cUnitStanceDefensive);
      aiPlanSetVariableInt(gNavyDefendPlan2, cDefendPlanRefreshFrequency, 0, 20);
      aiPlanSetVariableInt(gNavyDefendPlan2, cDefendPlanAttackTypeID, 0, cUnitTypeUnit);
      aiPlanSetDesiredPriority(gNavyDefendPlan2, 99);    // Very low priority, gather unused units.
      aiPlanSetActive(gNavyDefendPlan2); 
   }
   else{
	  int bQuery = getUnitByLocation(cUnitTypeLogicalTypeBuildingsNotWalls, cPlayerRelationEnemy, cUnitStateABQ, targetLocation, 50.0);
	  if(bQuery < 0)
	  {
	     aiPlanSetVariableVector(gNavyDefendPlan2, cDefendPlanDefendPoint, 0, targetLocation);
		 aiPlanAddUnitType(gNavyDefendPlan2, cUnitTypeLogicalTypeLandMilitary , 0, 0, 0);
		 return;
	  }
	  aiPlanSetVariableVector(gNavyDefendPlan2, cDefendPlanDefendPoint, 0, kbUnitGetPosition(bQuery));
	  aiPlanAddUnitType(gNavyDefendPlan2, cUnitTypeLogicalTypeLandMilitary , milCount/5, milCount/5, milCount/5);
   }
   
   
}



//==============================================================================
/*
   Navy Manager
   
   Create maintain plans for navy unit lines.  Control 'maintain' levels.
*/
//==============================================================================
rule navyManager
inactive
minInterval 15
{

   if (gNavyMap == false)
   {
      gNavyMode = cNavyModeOff;
      aiEcho("gNavyMap was false, turning off navy manager.");
      xsDisableSelf();
      return;
   }
   
   if (getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID) < 0)
   {
      aiEcho("**** NO WATER FLAG, TURNING NAVY OFF ****");
      xsDisableSelf();
      return;
   }
   

   
   // If it was not full on...
   if ( (gNavyMode == cNavyModeOff) ) 
   {  // We're not currently training a navy...see if we should be
      // Turning it on by default, now that we have variable maintain levels
      gNavyMode = cNavyModeActive;
//      if (getNavalTargetPlayer() > 0)
//      {
//         gNavyMode = cNavyModeActive;  // They have a navy.
//         aiEcho("Saw enemy naval units.");
//      }
      
      if (cvOkToTrainNavy == false)
         gNavyMode = cNavyModeOff; // Overrides others. 
      
      if (gNavyMode == cNavyModeActive)   // We're turning it on
      {
         if (gCaravelMaintain >= 0)
            aiPlanSetActive(gCaravelMaintain, true);
         if (gGalleonMaintain >= 0)
            aiPlanSetActive(gGalleonMaintain, true);
         if (gFrigateMaintain >= 0)
            aiPlanSetActive(gFrigateMaintain, true);
         if (gMonitorMaintain >= 0)
            aiPlanSetActive(gMonitorMaintain, true);
         aiEcho("**** TURNING NAVY ON ****");
      }
      else
         aiEcho("No navy targets detected.");
   }
    
      
   if (gNavyMode == cNavyModeOff)
      return;  // We didn't turn it on, so we're done
   
   // If we're here, navyMode is active.  See if we need to turn it off
   if (cvOkToTrainNavy == false)
      gNavyMode = cNavyModeOff;

   // If we don't see any naval targets or threats, turn it off.
   // Disabling this now that we added variable maintain plans.  If no enemy navy is visible, maintain a small force.
   //if ( getNavalTargetPlayer() < 0 )
   //   gNavyMode = cNavyModeOff;      // No need for a navy, we don't see targets any more



   if ( gNavyMode != cNavyModeActive ) 
   {  // It's been turned off or set to explore, stop the plans
      aiEcho("**** TURNING NAVY OFF BECAUSE WE SEE NO DOCKS OR SHIPS ****");
      if (gCaravelMaintain >= 0)
         aiPlanSetActive(gCaravelMaintain, false);
      if (gGalleonMaintain >= 0)
         aiPlanSetActive(gGalleonMaintain, false);
      if (gFrigateMaintain >= 0)
         aiPlanSetActive(gFrigateMaintain, false);
      if (gMonitorMaintain >= 0)
         aiPlanSetActive(gMonitorMaintain, false);
   } 
   if (gNavyMode == cNavyModeOff)
      return;
   
   // If we're here, gNavyMode is active, and it should be.  Make sure we have a dock, then make sure maintain plans exist.
   
   vector flagVec =  cInvalidVector;
   int closestDock = -1;
   int flagUnit = getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID);
   if (flagUnit >= 0)
   {      
      flagVec = kbUnitGetPosition(flagUnit);
   }
   else
   {
      closestDock = getUnitByLocation(gDockUnit, cMyID, cUnitStateAlive, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 500.0);
      if (closestDock >= 0)
         flagVec = kbUnitGetPosition(closestDock);
   }
   //if ( (gNavyVec == cInvalidVector) && (flagVec != cInvalidVector) )
      //gNavyVec = flagVec;
   
   if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < 1)   
      return;  // Nothing else to do until dock is complete
   
   if(gWaterExplorePlan < 0)
   {
      vector location = cInvalidVector;
      if (getUnit(gFishingUnit, cMyID, cUnitStateAlive) >= 0)
         location = kbUnitGetPosition(getUnit(gFishingUnit, cMyID, cUnitStateAlive));
      else
         location = flagVec;
      gWaterExplorePlan=aiPlanCreate("Water Explore", cPlanExplore);
      aiPlanSetVariableBool(gWaterExplorePlan, cExplorePlanReExploreAreas, 0, false);
      aiPlanSetInitialPosition(gWaterExplorePlan, location);
      aiPlanSetDesiredPriority(gWaterExplorePlan, 45);   // Low, so that transport plans can steal it as needed, but just above fishing plans.
      aiPlanAddUnitType(gWaterExplorePlan, gFishingUnit, 1, 1, 1);
      aiPlanSetEscrowID(gWaterExplorePlan, cEconomyEscrowID);
      aiPlanSetVariableBool(gWaterExplorePlan, cExplorePlanDoLoops, 0, false);
      aiPlanSetActive(gWaterExplorePlan);
   }

   closestDock = getUnit(gDockUnit, cMyID, cUnitStateAlive);
   if (closestDock < 0)
      return;  // Don't fire up maintain plans until we have a base ID
   
   int baseID = kbUnitGetBaseID(closestDock);
   if (baseID < 0) 
      return;  // Don't fire up maintain plans until we have a base ID
   

   /*if(gWaterExploreMaintain < 0)
   {
      gWaterExploreMaintain = createSimpleMaintainPlan(gFishingUnit, 1, true, baseID, 1);
   }*/
   
   int navyEnemyPlayer = getNavalTargetPlayer();
   int enemyNavySize = kbUnitCount(navyEnemyPlayer, cUnitTypeAbstractWarShip, cUnitStateAlive) + kbUnitCount(navyEnemyPlayer, cUnitTypeDock, cUnitStateAlive);
   if ( (gCaravelMaintain < 0) && (gNavyMode == cNavyModeActive) ) // Need to init plans
   {  
      if(kbGetCiv() == cCivXPAztec)
		 gFrigateMaintain = createSimpleMaintainPlan(gFrigateUnit, 1, false, baseID, 5);
	  if (civIsNative() == true)
         gCaravelMaintain = createSimpleMaintainPlan(gCaravelUnit, 1, false, baseID, 20);
      else
      {
         gCaravelMaintain = createSimpleMaintainPlan(gCaravelUnit, 1, false, baseID, 5);
         gGalleonMaintain = createSimpleMaintainPlan(gGalleonUnit, 1, false, baseID, 3);
         gFrigateMaintain = createSimpleMaintainPlan(gFrigateUnit, 1, false, baseID, 3);
         gMonitorMaintain = createSimpleMaintainPlan(cUnitTypeMonitor, 1, false, baseID, 2);
      }
      aiEcho("**** ACTIVATING NAVAL TRAIN PLANS ****");
   }
   aiEcho("Navy enemy player is "+navyEnemyPlayer+", enemy navy size is "+enemyNavySize);
   if (enemyNavySize < 0)
      enemyNavySize = 0;
   if (enemyNavySize > 6)
      enemyNavySize = 7;
   switch(enemyNavySize)   // Set our maintain plans to a size just larger than the enemy's known force.
   {
      case 0:
      {  // Two ship minimum
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 1);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 0);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 1:
      {  // One more than enemy
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 4);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 1);
         if (civIsNative() == false)
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 2);
			aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 2:
      {
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 7);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 2);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 4);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 3:
      {
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 10);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 3);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 5);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 4:
      {
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 13);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 4);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 5);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 1);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 5:
      {
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 16);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 5);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 5);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 2);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 6:
      {
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 18);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 5);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 5);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 3);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
      case 7:
      {  // Go big
         if (civIsNative() == true)
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 20);
			if(kbGetCiv() == cCivXPAztec)
		       aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 5);
         else
         {
            aiPlanSetVariableInt(gCaravelMaintain, cTrainPlanNumberToMaintain, 0, 5);
            aiPlanSetVariableInt(gGalleonMaintain, cTrainPlanNumberToMaintain, 0, 0);
            aiPlanSetVariableInt(gFrigateMaintain, cTrainPlanNumberToMaintain, 0, 3);
            aiPlanSetVariableInt(gMonitorMaintain, cTrainPlanNumberToMaintain, 0, 0);
         }
         break;
      }
   }   
}


//==============================================================================
// rule age2Monitor
/*
   Watch for us reaching age 2.
*/
//==============================================================================
rule age2Monitor
inactive
group tcComplete
minInterval 5
{
   if (kbGetAge() >= cAge2)   // We're in age 2
   {
      xsDisableSelf();
      xsEnableRule("age3Monitor");
      
	  if (xsIsRuleEnabled("navyManager") == false)
	  {
	     xsEnableRule("navyManager");
		 aiEcho("Enabling the navy manager.");
	  }
      
      //findEnemyBase();  // Create a one-off explore plan to probe the likely enemy base location.
	  gAgeUpTime = xsGetTime();
      updateForecasts();
      updateGatherers();
      updateSettlerCounts();
      /*if (kbGetCiv() == cCivChinese) {
        int planid2 = createSimpleResearchPlan(cTechypVillagePopCapIncrease, getUnit(cUnitTypeypVillage), cEconomyEscrowID, 85);
        aiEcho("Creating plan #"+planid2+" to get more popcap with tech "+kbGetTechName(cTechypVillagePopCapIncrease)+" at the "+kbGetProtoUnitName(cUnitTypeypVillage));
      }*/
      kbBaseSetMaximumResourceDistance(cMyID, kbBaseGetMainID(cMyID), 120.0);

	  xsEnableRule("seaPrepare");
	  xsEnableRule("consulateMonitor");
	  xsEnableRule("iroTechManager");
	  xsEnableRule("iroManager");
	  xsEnableRule("frenchTechManager");
	  xsEnableRule("spanishManager");
	  
      updateEscrows();
      
      kbEscrowAllocateCurrentResources();

		//-- Set the resource TargetSelector factors.
		gTSFactorDistance = -40.0;
		gTSFactorPoint = 10.0;
		gTSFactorTimeToDone = 0.0;
		gTSFactorBase = 100.0;
		gTSFactorDanger = -40.0;
		kbSetTargetSelectorFactor(cTSFactorDistance, gTSFactorDistance);
		kbSetTargetSelectorFactor(cTSFactorPoint, gTSFactorPoint);
		kbSetTargetSelectorFactor(cTSFactorTimeToDone, gTSFactorTimeToDone);
		kbSetTargetSelectorFactor(cTSFactorBase, gTSFactorBase);
		kbSetTargetSelectorFactor(cTSFactorDanger, gTSFactorDanger);
      
      setUnitPickerPreference(gLandUnitPicker);
     
      gLastAttackMissionTime = xsGetTime() - 180000;     // Pretend they all fired 3 minutes ago, even if that's a negative number.
      gLastDefendMissionTime = xsGetTime() - 300000;     // Actually, start defense ratings at 100% charge, i.e. 5 minutes since last one.
      gLastClaimMissionTime = xsGetTime() - 180000;
	  
	  gAgeNeedFood = 1200;
	  gAgeNeedGold = 1000;

      aiEcho("*** We're in age 2.");
   }
}


//==============================================================================
// rule age3Monitor
/*
   Watch for us reaching age 3.
*/
//==============================================================================
rule age3Monitor
inactive
minInterval 10
{
   if (kbGetAge() >= cAge3)
   {
      aiEcho("*** We're in age 3.");
	  if ((kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) > 0) && (xsIsRuleEnabled("navyManager") == false))
	  {
	     xsEnableRule("navyManager");
		 aiEcho("Enabling the navy manager.");
	  }

      // Bump up settler train plan
      updateSettlerCounts();
      /*if (kbGetCiv() == cCivChinese) {
        int planid = createSimpleResearchPlan(cTechypVillagePopCapIncrease2, getUnit(cUnitTypeypVillage), cEconomyEscrowID, 85);
        aiEcho("Creating plan #"+planid+" to get more popcap with tech "+kbGetTechName(cTechypVillagePopCapIncrease2)+" at the "+kbGetProtoUnitName(cUnitTypeypVillage));
      }*/
      
      xsDisableSelf();
      xsEnableRule("age4Monitor");
      gAgeUpTime = xsGetTime();
	  //if ((civIsAsian() == false) && (civIsNative() == false))
	     //xsEnableRule("ransom1");
      
      kbBaseSetMaximumResourceDistance(cMyID, kbBaseGetMainID(cMyID), 150.0);
	  
	  //setUnitPickerPreference(gLandUnitPicker);  
	 
	  xsEnableRule("dutchTechManager");
	  xsEnableRule("chineseTechManager");
	  xsEnableRule("azManager");
	  xsEnableRule("indiaTechManager");
	  if(kbGetCiv() == cCivFrench)
	     xsEnableRule("dogMonitor2");
	  
      updateEscrows();
	  gAgeNeedFood = 2000;
	  gAgeNeedGold = 1200;
   
	  if(cMyCiv == cCivIndians)
	  {
         for (i=0; < aiHCDeckGetNumberCards(gDefaultDeck))
   	     {
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipWoodCrates2Indians")
   			   xsArraySetInt(gCardValues, i, 599);
		 }
	  }

	}
}




//==============================================================================
// rule age4Monitor
/*
   Watch for us reaching age 4.
*/
//==============================================================================
rule age4Monitor
inactive
minInterval 10
{
   if (kbGetAge() >= cAge4)
   {
      aiEcho("*** We're in age 4.");
	  if (xsIsRuleEnabled("navyManager") == false)
	  {
	     xsEnableRule("navyManager");
		 aiEcho("Enabling the navy manager.");
	  }
		
      // Bump up settler train plan
      updateSettlerCounts();
      
      xsDisableSelf();
      xsEnableRule("age5Monitor");
      gAgeUpTime = xsGetTime();
      
      kbBaseSetMaximumResourceDistance(cMyID, kbBaseGetMainID(cMyID), 150.0);
      
      //add
	  //aiPlanDestroy(gMainAttackGoal);
	  //gMainAttackGoal = createSimpleAttackGoal("AttackGoal", aiGetMostHatedPlayerID(), gLandUnitPicker, -1, cAge2, -1, gMainBase, false);
	  
	  if (aiGetWorldDifficulty() < cDifficultyHard)
         xsEnableRule("townWatch"); 
      
	  //if (cMyCiv == cCivBritish)
		//kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.0);
	  
	  xsEnableRule("siouxTechManager");
	  xsEnableRule("jpTechManager");
	  xsEnableRule("seaTechManager");
	  xsEnableRule("siegeMonitor");
	  xsEnableRule("gasLighting");
	  xsEnableRule("churchStandingArmy");
	  xsEnableRule("churchMassCavalry");
	  xsEnableRule("euwTechManager");
	  xsEnableRule("caracole");
	  xsEnableRule("noobUpgrade1");
	  
	  xsEnableRule("germanManager");
	  xsEnableRule("spainTechManager");
	  xsEnableRule("spainX");
	  if(cMyCiv == cCivBritish)
	     xsEnableRule("factoryTacticMonitor2");
	  else if(cMyCiv == cCivChinese || cMyCiv == cCivGermans)
	     xsEnableRule("factoryTacticMonitor3");
	  else
	     xsEnableRule("factoryTacticMonitor");
      updateEscrows();

	  gAgeNeedFood = 4000;
	  gAgeNeedGold = 4000;
	  
	  /*if(cMyCiv == cCivXPAztec && gNavyMap == true)
	  {
         for (i=0; < aiHCDeckGetNumberCards(gDefaultDeck))
   	     {
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPWaterDance")
   			   xsArraySetInt(gCardValues, i, 1199);
		 }
	  }*/
	  if(cMyCiv == cCivSpanish)
	  {
         for (i=0; < aiHCDeckGetNumberCards(gDefaultDeck))
   	     {
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPUnction")
   			   xsArraySetInt(gCardValues, i, 1000);
		 }
	  }
  }
}





//==============================================================================
// rule age5Monitor
/*
   Watch for us reaching age 5.
*/
//==============================================================================
rule age5Monitor
inactive
minInterval 10
{
   if (kbGetAge() >= cAge5)
   {
      aiEcho("*** We're in age 5.");
      // Bump up settler train plan
      updateSettlerCounts();
      
      xsDisableSelf();
      gAgeUpTime = xsGetTime();
 
	  xsEnableRule("indiaVMonitor");
	  if(cMyCiv == cCivBritish)
	     xsEnableRule("getMassUpgrade");
	  xsEnableRule("seaImpTechManager");
	  xsEnableRule("noobUpgrade2");
		
      updateEscrows();
	  aiPlanSetVariableInt(gMainAttackGoal, cGoalPlanAttackStartFrequency, 0, 3);
	  
	  if(cMyCiv == cCivXPAztec)
	  {
         for (i=0; < aiHCDeckGetNumberCards(gDefaultDeck))
   	     {
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCoinCratesAztec5")
   			   xsArraySetInt(gCardValues, i, 599);
		 }
	  }

  }
}

rule spainX
inactive
minInterval 10
{
   if (cMyCiv != cCivSpanish)
   {
      xsDisableSelf();
      return;
   }
   if (kbUnitCount(cMyID, cUnitTypeMissionary, cUnitStateAlive) < 3)
   {
	  return;
   }
	
	int sf = -1;
	int count = 0;
	int max = 0;
	vector v = cInvalidVector;
	for(i=0; <3){
		sf = getUnit(cUnitTypeLogicalTypeLandMilitary);
		count = getUnitCountByLocation(cUnitTypeLogicalTypeLandMilitary, cMyID, cUnitStateAlive, kbUnitGetPosition(sf), 30.0);
		if(max < count)
		{
		   v = kbUnitGetPosition(sf);
		   max = count;
		}
	}
	
	if (v != cInvalidVector) {
     static int missionaryQueryID=-1;
     //If we don't have the query yet, create one.
     if (missionaryQueryID < 0)
     {
        missionaryQueryID=kbUnitQueryCreate("castleGetUnitQuery");
        kbUnitQuerySetIgnoreKnockedOutUnits(missionaryQueryID, true);
     }
    //Define a query to get all matching units
    if (missionaryQueryID != -1) {
      kbUnitQuerySetPlayerRelation(missionaryQueryID, -1);
      kbUnitQuerySetPlayerID(missionaryQueryID, cMyID);
      kbUnitQuerySetUnitType(missionaryQueryID, cUnitTypeMissionary);
      kbUnitQuerySetState(missionaryQueryID, cUnitStateAlive);
    }
    else {
      return;
    }
  
    kbUnitQueryResetResults(missionaryQueryID);
    
    int index = 0;
	index = kbUnitQueryExecute(missionaryQueryID);
    
    for(i=0; < index)
	   aiTaskUnitMove(kbUnitQueryGetResult(missionaryQueryID, i), v);
  }
}

rule townWatch
inactive
minInterval 120
{
   if (kbTechGetStatus(cTechChurchTownWatch) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1200000)
      return;
   
   if (kbTechGetStatus(cTechChurchTownWatch) == cTechStatusObtainable)
   {
      createSimpleResearchPlan(cTechChurchTownWatch, getUnit(cUnitTypeChurch), cEconomyEscrowID, 50);
      xsDisableSelf();
   }
}

rule gasLighting
inactive
minInterval 120
{
   if (kbTechGetStatus(cTechChurchGasLighting) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1200000)
      return;
   
   if (kbTechGetStatus(cTechChurchGasLighting) == cTechStatusObtainable)
   {
      createSimpleResearchPlan(cTechChurchGasLighting, getUnit(cUnitTypeChurch), cEconomyEscrowID, 50);
      xsDisableSelf();
   }
}

rule churchStandingArmy
inactive
minInterval 120
{
   if (kbTechGetStatus(cTechChurchStandingArmy) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1500000)
      return;
   
   if (kbTechGetStatus(cTechChurchStandingArmy) == cTechStatusObtainable)
   {
      createSimpleResearchPlan(cTechChurchStandingArmy, getUnit(cUnitTypeChurch), cMilitaryEscrowID, 50);
      xsDisableSelf();
   }
}

rule churchMassCavalry
inactive
minInterval 120
{
   if (kbTechGetStatus(cTechChurchMassCavalry) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1500000)
      return;
   
   if (kbTechGetStatus(cTechChurchMassCavalry) == cTechStatusObtainable)
   {
      createSimpleResearchPlan(cTechChurchMassCavalry, getUnit(cUnitTypeChurch), cMilitaryEscrowID, 50);
      xsDisableSelf();
   }
}

rule seaPrepare
inactive
minInterval 40
{
   static int q=0;
   
   if (gNavyMap == false)
   {
      xsDisableSelf();
      return;
   }

   if(kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) < 10)
      return;

   int numDock = 1;
   if(kbGetAge() > cAge2 && kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > 30)
      numDock = 2;
   vector flagVec = cInvalidVector;
   int flagUnit = getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID);
   if (flagUnit >= 0)
   {      
      flagVec = kbUnitGetPosition(flagUnit);
   }
   if ( (gNavyVec == cInvalidVector) && (flagVec != cInvalidVector) )
      gNavyVec = flagVec;
   
   int x = getUnitByLocation(cUnitTypeAbstractFish, 0, cUnitStateAny, flagVec, 75.0);
   if(x > 0)
      gNavyVec = kbUnitGetPosition(x);
   
   int bpID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gDockUnit);
   if(kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) > numDock && bpID >= 0)
      aiPlanDestroy(bpID);
   
   
   if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < numDock)
   {
      int dockPlan = aiPlanCreate("military dock plan", cPlanBuild);
      aiPlanSetVariableInt(dockPlan, cBuildPlanBuildingTypeID, 0, gDockUnit);
      aiPlanSetDesiredPriority(dockPlan, 97);
      aiPlanSetMilitary(dockPlan, true);
      aiPlanSetEconomy(dockPlan, false);
      aiPlanSetEscrowID(dockPlan, cMilitaryEscrowID);
      if (kbUnitCount(cMyID, cUnitTypeYPDockWagon, cUnitStateAlive) > 0) {
        aiPlanAddUnitType(dockPlan, cUnitTypeYPDockWagon, 1, 1, 1);
      }
      else {
        aiPlanAddUnitType(dockPlan, gEconUnit, 1, 1, 1);
      }
      aiPlanSetNumberVariableValues(dockPlan, cBuildPlanDockPlacementPoint, 2, true);
      aiPlanSetVariableVector(dockPlan, cBuildPlanDockPlacementPoint, 0, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));   // One point at main base
	  aiPlanSetVariableVector(dockPlan, cBuildPlanDockPlacementPoint, 1, gNavyVec);
	  aiPlanSetActive(dockPlan);
     
   }
   
   int dQuery = getUnit(gDockUnit, cPlayerRelationSelf, cUnitStateABQ);
   if(dQuery < 0 || q == 1)
       return;
   
   xsSetRuleMinIntervalSelf(60);
   xsEnableRule("towerManager2");
   q = 1;
}

rule seaTechManager
inactive
minInterval 30
{
   if (gNavyMap == false)
   {
      xsDisableSelf();
      return;
   }
   if(getUnit(cUnitTypeAbstractWarShip, cMyID, cUnitStateABQ) < 4)
	  return;
   
   int shipPlanID = -1;
   int carPlanID = -1;
   
   if (kbTechGetStatus(cTechArmorPlating) == cTechStatusObtainable)
   {
      shipPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechArmorPlating);
      if (shipPlanID < 0)
         createSimpleResearchPlan(cTechArmorPlating, getUnit(cUnitTypeDock),cMilitaryEscrowID, 80);
   }
   if(getUnit(cUnitTypeAbstractWarShip, cMyID, cUnitStateABQ) < 6)
	  return;
   if (kbTechGetStatus(cTechCarronade) == cTechStatusObtainable)
   {
      carPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechCarronade);
      if (carPlanID < 0)
         createSimpleResearchPlan(cTechCarronade, getUnit(cUnitTypeDock),cMilitaryEscrowID, 80);
   }
}

rule seaImpTechManager
inactive
minInterval 60
{
   if (gNavyMap == false)
   {
      xsDisableSelf();
      return;
   }
   if(getUnit(cUnitTypeAbstractWarShip, cMyID, cUnitStateABQ) < 3)
	  return;
   
   int yptPlanID = -1;
   int friPlanID = -1;

   if ((kbTechGetStatus(cTechYPExaltedTekkousen) == cTechStatusObtainable) && (cMyCiv == cCivJapanese))
   {
      yptPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechYPExaltedTekkousen);
      if (yptPlanID < 0)
         createSimpleResearchPlan(cTechYPExaltedTekkousen, getUnit(gDockUnit),cMilitaryEscrowID, 80);
   }
   if (kbTechGetStatus(cTechImperialManOWar) == cTechStatusObtainable)
   {
      friPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechImperialManOWar);
      if (friPlanID < 0)
         createSimpleResearchPlan(cTechImperialManOWar, getUnit(cUnitTypeDock),cMilitaryEscrowID, 80);
   }
}

rule siouxTechManager
inactive
minInterval 10
{
   if ((cMyCiv != cCivXPSioux) || (xsGetTime() > 3000000))
   {
      xsDisableSelf();
      return;
   }
   
   int s1PlanID = -1;
   int s2PlanID = -1;
   int s3PlanID = -1;
   int s4PlanID = -1;
   
   if (kbTechGetStatus(cTechBigFarmHorsemanship) == cTechStatusObtainable)
   {
      s1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechBigFarmHorsemanship);
      if (s1PlanID < 0)
         createSimpleResearchPlan(cTechBigFarmHorsemanship, getUnit(gFarmUnit), cMilitaryEscrowID, 90);
   }
   if (kbTechGetStatus(cTechBigPlantationGunTrade) == cTechStatusObtainable)
   {
      s2PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechBigPlantationGunTrade);
      if (s2PlanID < 0)
         createSimpleResearchPlan(cTechBigPlantationGunTrade, getUnit(cUnitTypePlantation), cMilitaryEscrowID, 90);
   }
   if (kbTechGetStatus(cTechBigDockFlamingArrows) == cTechStatusObtainable)
   {
      s3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechBigDockFlamingArrows);
      if (s3PlanID < 0)
         createSimpleResearchPlan(cTechBigDockFlamingArrows, getUnit(gDockUnit), cMilitaryEscrowID, 90);
   }
   if (kbTechGetStatus(cTechCaracole) == cTechStatusObtainable)
   {
      s4PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechCaracole);
      if (s4PlanID < 0)
         createSimpleResearchPlan(cTechCaracole, getUnit(cUnitTypeTeepee), cMilitaryEscrowID, 90);
   }
}

rule dutchTechManager
inactive
minInterval 15
{
   if ((cMyCiv != cCivDutch) || (xsGetTime() > 3000000))
   {
      xsDisableSelf();
      return;
   }
   
   int s1PlanID = -1;
   int s2PlanID = -1;
   int s3PlanID = -1;
   
   if (kbTechGetStatus(cTechChurchStadholders) == cTechStatusObtainable)
   {
      s1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchStadholders);
      if (s1PlanID < 0)
         createSimpleResearchPlan(cTechChurchStadholders, getUnit(cUnitTypeChurch), cMilitaryEscrowID, 90);
   }
   if (kbTechGetStatus(cTechChurchWaardgelders) == cTechStatusObtainable)
   {
      s2PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchWaardgelders);
      if (s2PlanID < 0)
         createSimpleResearchPlan(cTechChurchWaardgelders, getUnit(cUnitTypeChurch), cMilitaryEscrowID, 90);
   }
   if (kbTechGetStatus(cTechChurchCoffeeTrade) == cTechStatusObtainable)
   {
      s3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchCoffeeTrade);
      if (s3PlanID < 0)
         createSimpleResearchPlan(cTechChurchCoffeeTrade, getUnit(cUnitTypeChurch), cEconomyEscrowID, 90);
   }
}

rule frenchTechManager
inactive
minInterval 5
{
   if ((cMyCiv != cCivFrench) || (xsGetTime() > 3000000))
   {
      xsDisableSelf();
      return;
   }
   static int q = 0;
   if((kbTechGetStatus(cTechChurchGardeImperial2) == cTechStatusActive || xsGetTime() > 600000) && (q == 0))
   {
      q = 1;
	  xsSetRuleMinIntervalSelf(30);
	  if (xsIsRuleEnabled("militaryManager") == false)
	  {
		 xsEnableRule("militaryManager");
		 militaryManager();   // runImmediately doesn't work.
	  }
   }

   if(agingUp() != true && kbGetAge() == cAge2)
      return;
   
   int s1PlanID = -1;
   int s2PlanID = -1;
   int s3PlanID = -1;
   
   if (kbTechGetStatus(cTechChurchGardeImperial1) == cTechStatusObtainable)
   {
      s1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchGardeImperial1);
      if (s1PlanID < 0)
         createSimpleResearchPlan(cTechChurchGardeImperial1, getUnit(cUnitTypeChurch), cEconomyEscrowID, 100);
   }
   if (kbTechGetStatus(cTechChurchGardeImperial2) == cTechStatusObtainable)
   {
      s2PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchGardeImperial2);
      if (s2PlanID < 0)
         createSimpleResearchPlan(cTechChurchGardeImperial2, getUnit(cUnitTypeChurch), cEconomyEscrowID, 100);
   }
   
   if (kbTechGetStatus(cTechChurchGardeImperial3) == cTechStatusObtainable)
   {
      s3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchGardeImperial3);
      if (s3PlanID < 0)
         createSimpleResearchPlan(cTechChurchGardeImperial3, getUnit(cUnitTypeChurch), cMilitaryEscrowID, 90);
   }
}

rule jpTechManager
inactive
minInterval 30
{
   if ((cMyCiv != cCivJapanese) || (xsGetTime() > 3000000))
   {
      xsDisableSelf();
      return;
   }
   
   int shPlanID = -1;
   
   if (kbTechGetStatus(cTechypShrineFortressUpgrade) == cTechStatusObtainable)
   {
      shPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypShrineFortressUpgrade);
      if (shPlanID < 0)
         createSimpleResearchPlan(cTechypShrineFortressUpgrade, -1, cEconomyEscrowID, 100);
   }
   if (kbUnitCount(cMyID, cUnitTypeypBankWagon, cUnitStateAlive) > 0)
      createSimpleBuildPlan(cUnitTypeypBankAsian, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   if (kbUnitCount(cMyID, cUnitTypeypArsenalWagon, cUnitStateAlive) > 0)
      createSimpleBuildPlan(cUnitTypeypArsenalAsian, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   if (kbUnitCount(cMyID, cUnitTypeypChurchWagon, cUnitStateAlive) > 0)
      createSimpleBuildPlan(cUnitTypeypChurch, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
}

rule indiaTechManager
inactive
minInterval 120
{
	if (cMyCiv != cCivIndians)
   {
      xsDisableSelf();
      return;
   }
	
	int froPlanID = -1;
	int holPlanID = -1;
   
   if(xsGetTime() < 1200000)
      return;
   if (kbTechGetStatus(cTechypFrontierAgra) == cTechStatusObtainable)
   {
      froPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypFrontierAgra);
      if (froPlanID < 0)
         createSimpleResearchPlan(cTechypFrontierAgra, -1,cEconomyEscrowID, 80);
   }
   if (kbTechGetStatus(cTechypLivestockHoliness) == cTechStatusObtainable)
   {
      holPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypLivestockHoliness);
      if (holPlanID < 0)
         createSimpleResearchPlan(cTechypLivestockHoliness, -1,cEconomyEscrowID, 80);
   }

}

rule spainTechManager
inactive
minInterval 60
{
	if (cMyCiv != cCivSpanish)
   {
      xsDisableSelf();
      return;
   }
   if (kbTechGetStatus(cTechChurchMissionFervor) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if (xsGetTime() < 1200000)
   {
      return;
   }
	
	int cmPlanID = -1;
   
   if (kbTechGetStatus(cTechChurchMissionFervor) == cTechStatusObtainable)
   {
      cmPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchMissionFervor);
      if (cmPlanID < 0)
         createSimpleResearchPlan(cTechChurchMissionFervor, -1,cEconomyEscrowID, 80);
   }

}

rule chineseTechManager
inactive
minInterval 60
{
	if (cMyCiv != cCivChinese)
   {
      xsDisableSelf();
      return;
   }
   if (xsGetTime() > 1800000)
   {
      xsDisableSelf();
      return;
   }
	
   //if (kbUnitCount(cMyID, cUnitTypeFactoryWagon, cUnitStateAlive) > 0)
      //createSimpleBuildPlan(cUnitTypeFactory, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   if (kbUnitCount(cMyID, cUnitTypeFortWagon, cUnitStateAlive) > 0)
      createSimpleBuildPlan(cUnitTypeFortFrontier, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
	
	int c1PlanID = -1;
	int c2PlanID = -1;
	int c3PlanID = -1;
   
   if(kbGetPop() < 70)
      return;
   if (kbTechGetStatus(cTechypVillagePopCapIncrease) == cTechStatusObtainable)
   {
      c1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypVillagePopCapIncrease);
      if (c1PlanID < 0)
         createSimpleResearchPlan(cTechypVillagePopCapIncrease, getUnit(cUnitTypeypVillage), cEconomyEscrowID, 85);
   }
   if(kbGetPop() < 130)
      return;
   if (kbTechGetStatus(cTechypVillagePopCapIncrease2) == cTechStatusObtainable)
   {
      c2PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypVillagePopCapIncrease2);
      if (c2PlanID < 0)
         createSimpleResearchPlan(cTechypVillagePopCapIncrease2, getUnit(cUnitTypeypVillage), cEconomyEscrowID, 85);
   }
   if(kbGetPop() < 170)
      return;
   if (kbTechGetStatus(cTechypVillagePopCapIncrease3) == cTechStatusObtainable)
   {
      c3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypVillagePopCapIncrease3);
      if (c3PlanID < 0)
         createSimpleResearchPlan(cTechypVillagePopCapIncrease3, getUnit(cUnitTypeypVillage), cEconomyEscrowID, 85);
   }
   

}

rule indiaVMonitor
inactive
minInterval 60
{
	if (cMyCiv != cCivIndians)
   {
      xsDisableSelf();
      return;
   }
		
	  static int mansabdarHowdahPlan = -1;
	  int numHowdahs = -1;
	  numHowdahs = kbUnitCount(cMyID, cUnitTypeypHowdah, cUnitStateAlive);
		if (numHowdahs >= 3)
		{
			if (mansabdarHowdahPlan < 0)
			{
			   mansabdarHowdahPlan = createSimpleMaintainPlan(cUnitTypeypHowdahMansabdar, 1, false, kbBaseGetMainID(cMyID), 1);
			}
			else
			{
			   aiPlanSetVariableInt(mansabdarHowdahPlan , cTrainPlanNumberToMaintain, 0, 1);
			}
		}
	    else
		{
			if (mansabdarHowdahPlan >= 0)
			{
			   aiPlanSetVariableInt(mansabdarHowdahPlan , cTrainPlanNumberToMaintain, 0, 0);
			}
		}
}

rule iroTechManager
inactive
minInterval 20
{
   if (cMyCiv != cCivXPIroquois)
   {
      xsDisableSelf();
      return;
   }
   
   int infPlanID = -1;
   int artPlanID = -1;
   
   if(kbGetAge() < cAge4)
      return;
   if (kbTechGetStatus(cTechBigWarHutLacrosse) == cTechStatusObtainable)
   {
      infPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechBigWarHutLacrosse);
      if (infPlanID < 0)
         createSimpleResearchPlan(cTechBigWarHutLacrosse, -1,cMilitaryEscrowID, 80);
   }
   if (kbTechGetStatus(cTechBigSiegeshopSiegeDrill) == cTechStatusObtainable)
   {
      artPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechBigSiegeshopSiegeDrill);
      if (artPlanID < 0)
         createSimpleResearchPlan(cTechBigSiegeshopSiegeDrill, -1,cMilitaryEscrowID, 80);
   }
}

rule iroManager
inactive
minInterval 15
{
   if (cMyCiv != cCivXPIroquois || kbGetAge() > cAge2)
   {
      xsDisableSelf();
      return;
   }
   for (i=1; <=cNumberPlayers)
   {
      if ( (kbIsPlayerEnemy(i) == true) && (kbHasPlayerLost(i) == false) && (kbIsPlayerHuman(i) == false) )
      {
         xsDisableSelf();
		 return;
      }
   }
   
   static int campPlan = -1;
   int targetQuery = getUnit(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateABQ);
   if((xsGetTime() - gAgeUpTime) > 150000)
   {
      if(campPlan != -1)
	     aiPlanDestroy(campPlan);
	  xsDisableSelf();
      return;
   }
   if(targetQuery < 0)
      return;
   
   if (campPlan < 0)  
   {
      campPlan = aiPlanCreate("Primary dog r", cPlanDefend);
      aiPlanAddUnitType(campPlan, cUnitTypexpHorseman, 4, 4, 4);
      
      aiPlanSetVariableVector(campPlan, cDefendPlanDefendPoint, 0, kbUnitGetPosition(targetQuery));
      aiPlanSetVariableFloat(campPlan, cDefendPlanEngageRange, 0, 30.0);
      aiPlanSetVariableBool(campPlan, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(campPlan, cDefendPlanGatherDistance, 0, 20.0);
      aiPlanSetInitialPosition(campPlan, kbUnitGetPosition(targetQuery));
      aiPlanSetUnitStance(campPlan, cUnitStanceDefensive);
      aiPlanSetVariableInt(campPlan, cDefendPlanRefreshFrequency, 0, 10);
      aiPlanSetVariableInt(campPlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
      aiPlanSetDesiredPriority(campPlan, 98);
      aiPlanSetActive(campPlan); 
   }
   else if((xsGetTime() - gAgeUpTime) > 90000)
      aiPlanSetNoMoreUnits(campPlan, true);

}

rule germanManager
inactive
minInterval 60
{
   if (cMyCiv != cCivGermans)
   {
      xsDisableSelf();
      return;
   }
   if (kbTechGetStatus(cTechChurchTillysDiscipline) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   
   if (kbTechGetStatus(cTechChurchTillysDiscipline) == cTechStatusObtainable)
   {
      createSimpleResearchPlan(cTechChurchTillysDiscipline, getUnit(cUnitTypeChurch), cEconomyEscrowID, 50);
   }
}

rule spanishManager
inactive
minInterval 60
{
   if (cMyCiv != cCivSpanish)
   {
      xsDisableSelf();
      return;
   }
   
   if(kbUnitCount(cMyID, cUnitTypeWarDog, cUnitStateAlive) < 5)
   {
	  aiTaskUnitTrain(getUnit(cUnitTypeExplorer),cUnitTypeWarDog);
	  aiTaskUnitTrain(getUnit(cUnitTypeExplorer),cUnitTypeWarDog);
   }
   
   if (kbUnitCount(cMyID, cUnitTypeFactory, cUnitStateAlive) < 1 || kbUnitCount(cMyID, cUnitTypeChurch, cUnitStateAlive) < 1)
   {
      return;
   }
   
   if(kbUnitCount(cMyID, cUnitTypeMissionary, cUnitStateAlive) < 9)
   {
	  aiTaskUnitTrain(getUnit(cUnitTypeChurch),cUnitTypeMissionary);
	  if(xsGetTime() > 1200000 || kbUnitCount(cMyID, cUnitTypeFactory, cUnitStateAlive) > 1)
	     aiTaskUnitTrain(getUnit(cUnitTypeChurch),cUnitTypeMissionary);
   }
   //static int missionaryPlan = -1;
   //if (missionaryPlan < 0)
      //missionaryPlan = createSimpleMaintainPlan(cUnitTypeMissionary, 10, true, kbBaseGetMainID(cMyID), 2);
}

rule azManager
inactive
minInterval 20
{
   if (cMyCiv != cCivXPAztec)
   {
      xsDisableSelf();
      return;
   }
   
   if((kbResourceGet(cResourceGold) < 1200) && (kbResourceGet(cResourceWood) > 500))
   {
      aiSellResourceOnMarket(cResourceWood);
   }
   if((kbResourceGet(cResourceGold) < 1100) && (kbResourceGet(cResourceFood) > 2300))
   {
      aiSellResourceOnMarket(cResourceFood);
	  aiSellResourceOnMarket(cResourceFood);
   }
   else if((kbResourceGet(cResourceGold) < 1200) && (kbResourceGet(cResourceFood) > 2200))
   {
      aiSellResourceOnMarket(cResourceFood);
   }
   
   if (aiPlanGetState(gAgeUpResearchPlan) < 0 && kbGetAge() < cAge4)
   {
      return;
   }
   
   if (xsIsRuleEnabled("militaryManager") == false)
   {
	     xsDisableSelf();
		 xsEnableRule("militaryManager");
         militaryManager();   // runImmediately doesn't work.
		 createSimpleResearchPlan(cTechBigFirepitFounder, -1, cMilitaryEscrowID, 80);
   }
   
}

rule caracole
inactive
minInterval 60
{
   if (xsGetTime() > 3000000)
   {
      xsDisableSelf();
      return;
   }
   int carPlanID = -1;
   if (kbTechGetStatus(cTechCaracole) == cTechStatusObtainable)
   {
      carPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechCaracole);
      if (carPlanID < 0)
         createSimpleResearchPlan(cTechCaracole, getUnit(cUnitTypeArsenal),cMilitaryEscrowID, 91);
   }
}

rule noobUpgrade1
inactive
minInterval 60
{
   if (xsGetTime() > 3000000)
   {
      xsDisableSelf();
      return;
   }
   /*int noobPlanID = -1;
   if (kbTechGetStatus(cTechTradeRouteUpgrade1) == cTechStatusObtainable)
   {
      noobPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechTradeRouteUpgrade1);
      if (noobPlanID < 0)
         createSimpleResearchPlan(cTechTradeRouteUpgrade1, getUnit(cUnitTypeTradingPost),cMilitaryEscrowID, 91);
   }
   int tpp = getUnit(cUnitTypeTradingPost);
   if(tpp > 0){
      aiTaskUnitResearch(tpp,cTechTradeRouteUpgrade1);
   }*/
   int tp = getUnit(cUnitTypeTradingPost);
   if(tp >= 0)
   {
      createSimpleResearchPlan(cTechTradeRouteUpgrade1, tp,cMilitaryEscrowID, 91);
	  xsDisableSelf();
   }
}

rule noobUpgrade2
inactive
minInterval 60
{
   if (xsGetTime() > 3000000)
   {
      xsDisableSelf();
      return;
   }
   int tp = getUnit(cUnitTypeTradingPost);
   if(tp >= 0)
   {
      createSimpleResearchPlan(cTechTradeRouteUpgrade2, tp,cMilitaryEscrowID, 91);
	  xsDisableSelf();
   }
}

rule factoryTacticMonitor
inactive
minInterval 60
{
   if(cMyCiv == cCivBritish){
      xsDisableSelf();
	  return;
   }
   
   // Define a query to get all matching units
   int factoryQueryID=-1;
   factoryQueryID=kbUnitQueryCreate("factoryGetUnitQuery");
   kbUnitQuerySetIgnoreKnockedOutUnits(factoryQueryID, true);
   if (factoryQueryID != -1)
   {
      kbUnitQuerySetPlayerRelation(factoryQueryID, -1);
      kbUnitQuerySetPlayerID(factoryQueryID, cMyID);
      kbUnitQuerySetUnitType(factoryQueryID, cUnitTypeFactory);
      kbUnitQuerySetState(factoryQueryID, cUnitStateAlive);
      kbUnitQueryResetResults(factoryQueryID);
      int numberFound=kbUnitQueryExecute(factoryQueryID);
      if (numberFound > 0)
      {
		 aiUnitSetTactic(kbUnitQueryGetResult(factoryQueryID, 0), cTacticWood);
		 xsDisableSelf();
      }
   }
}
rule factoryTacticMonitor2
inactive
minInterval 60
{
   if (xsGetTime() > 1800000)
   {
      xsDisableSelf();
      return;
   }
   
   // Define a query to get all matching units
   int factoryQueryID=-1;
   factoryQueryID=kbUnitQueryCreate("factoryGetUnitQuery");
   kbUnitQuerySetIgnoreKnockedOutUnits(factoryQueryID, true);
   if (factoryQueryID != -1)
   {
      kbUnitQuerySetPlayerRelation(factoryQueryID, -1);
      kbUnitQuerySetPlayerID(factoryQueryID, cMyID);
      kbUnitQuerySetUnitType(factoryQueryID, cUnitTypeFactory);
      kbUnitQuerySetState(factoryQueryID, cUnitStateAlive);
      kbUnitQueryResetResults(factoryQueryID);
      int numberFound=kbUnitQueryExecute(factoryQueryID);
      if (numberFound > 0)
      {
		 aiUnitSetTactic(kbUnitQueryGetResult(factoryQueryID, 0), cTacticCannon);
		 //aiUnitSetTactic(kbUnitQueryGetResult(factoryQueryID, 1), cTacticCannon);
		 xsDisableSelf();
      }
   }
}

rule factoryTacticMonitor3
inactive
minInterval 60
{
   if (xsGetTime() > 1800000)
   {
      xsDisableSelf();
      return;
   }
   
   // Define a query to get all matching units
   int factoryQueryID=-1;
   factoryQueryID=kbUnitQueryCreate("factoryGetUnitQuery");
   kbUnitQuerySetIgnoreKnockedOutUnits(factoryQueryID, true);
   if (factoryQueryID != -1)
   {
      kbUnitQuerySetPlayerRelation(factoryQueryID, -1);
      kbUnitQuerySetPlayerID(factoryQueryID, cMyID);
      kbUnitQuerySetUnitType(factoryQueryID, cUnitTypeFactory);
      kbUnitQuerySetState(factoryQueryID, cUnitStateAlive);
      kbUnitQueryResetResults(factoryQueryID);
      int numberFound=kbUnitQueryExecute(factoryQueryID);
      if (numberFound > 0)
      {
		 aiUnitSetTactic(kbUnitQueryGetResult(factoryQueryID, 0), cTacticCannon);
		 xsDisableSelf();
      }
   }
}

rule euwTechManager
inactive
minInterval 120
{
   if ((civIsAsian() == true) || (civIsNative() == true))
   {
      xsDisableSelf();
      return;
   }

   int drummersPlanID = -1;
   int truPlanID = -1;
   int fliPlanID = -1;
   int papPlanID = -1;
   
   if (kbTechGetStatus(cTechMilitaryDrummers) == cTechStatusObtainable)
   {
      drummersPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechMilitaryDrummers);
      if (drummersPlanID < 0)
         createSimpleResearchPlan(cTechMilitaryDrummers, getUnit(cUnitTypeArsenal),cMilitaryEscrowID, 91);
   }
   if (kbTechGetStatus(cTechTrunion) == cTechStatusObtainable)
   {
      truPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechTrunion);
      if (truPlanID < 0)
         createSimpleResearchPlan(cTechTrunion, getUnit(cUnitTypeArsenal),cMilitaryEscrowID, 91);
   }
   if (kbTechGetStatus(cTechFlintlock) == cTechStatusObtainable)
   {
      fliPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechFlintlock);
      if (fliPlanID < 0)
         createSimpleResearchPlan(cTechFlintlock, getUnit(cUnitTypeArsenal),cMilitaryEscrowID, 91);
   }
   if (kbTechGetStatus(cTechPaperCartridge) == cTechStatusObtainable)
   {
      papPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechPaperCartridge);
      if (papPlanID < 0)
         createSimpleResearchPlan(cTechPaperCartridge, getUnit(cUnitTypeArsenal),cMilitaryEscrowID, 91);
   }
}

rule siegeMonitor
inactive
minInterval 60
{
	if ((civIsAsian() == true) || (civIsNative() == true))
   {
      xsDisableSelf();
      return;
   }
   if (xsGetTime() < 1200000)
   {
      return;
   }
   
	  static int sPlan = -1;
		if (kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > 60)
		{
			if (sPlan < 0)
			{
			   sPlan = createSimpleMaintainPlan(gSiegeUnit, 1, false, kbBaseGetMainID(cMyID), 2);
			}
			else
			{
			   aiPlanSetVariableInt(sPlan , cTrainPlanNumberToMaintain, 0, 2);
			}
		}
	    else
		{
			if (sPlan >= 0)
			{
			   aiPlanSetVariableInt(sPlan , cTrainPlanNumberToMaintain, 0, 0);
			}
		}
		
	
}

//==============================================================================
// rule startFishing
//==============================================================================
rule startFishing
inactive
group tcComplete
mininterval 15
{
   bool givenFishingBoats = false;
   if ( (kbUnitCount(cMyID, gFishingUnit, cUnitStateAlive) > 0) && (gWaterExploreMaintain < 0) && (gFishingPlan < 0) )
      givenFishingBoats = true;  // I have fishing boats, but no fishing or water scout plans, so they must have been given to me.

   if (givenFishingBoats == false)  // Skip these early-outs if we were granted free boats.
   {
      if ( (kbGetCiv() == cCivDutch) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateABQ) < 1) )
         return;  // Don't burn wood before we have a bank
      if ( (kbGetCiv() == cCivOttomans) && (kbUnitCount(cMyID, cUnitTypeChurch, cUnitStateABQ) < 1) )
         return;  // Don't burn wood before we have a mosque.
   }
   
   //gNumFishBoats = ((btRushBoom * -1.0) + 0.7) * 5.0; // At max boom, that's 8.  At balance, it's 3. 
	 gNumFishBoats = 1;
   if (xsGetTime() < 900000)
   {
      gNumFishBoats = 0;   // Rushers generally shouldn't fish.
   }
   if ( (cRandomMapName == "amazonia") || (cRandomMapName == "caribbean") || (cRandomMapName == "Ceylon") || (cRandomMapName == "Borneo") || (cRandomMapName == "Honshu") )
   {
      if (gNumFishBoats < 3)
         gNumFishBoats = 3;   // Always fish on those maps.
   }
   if ( (givenFishingBoats == false) && (gNumFishBoats <= 0) )
      return;  //We weren't given any, and don't plan on making any, so quit.
   
   aiEcho("StartFishing rule running.  gGoodFishingMap is "+gGoodFishingMap+", cvOkToFish is "+cvOkToFish);
   if ((cvOkToFish == true) && (gGoodFishingMap == true))
   {
      //  Check to see if we have spotted a fish reasonably close to our water spawn flag.  
      int flag = getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID);
      if (flag >= 0)
      {
         static int fishQuery = -1;
         int fish = -1;
         int fishAreaGroup = -1;
         int flagAreaGroup = -1;

         flagAreaGroup = kbAreaGroupGetIDByPosition(kbUnitGetPosition(flag));

         if (fishQuery < 0)
         {
            fishQuery=kbUnitQueryCreate("fish query");
            kbUnitQuerySetIgnoreKnockedOutUnits(fishQuery, true);
            kbUnitQuerySetPlayerID(fishQuery, 0);
            kbUnitQuerySetUnitType(fishQuery, cUnitTypeAbstractFish);
            kbUnitQuerySetState(fishQuery, cUnitStateAny);
            kbUnitQuerySetPosition(fishQuery, kbUnitGetPosition(flag));
            kbUnitQuerySetMaximumDistance(fishQuery, 100.0);
            kbUnitQuerySetAscendingSort(fishQuery, true);
         }
         kbUnitQueryResetResults(fishQuery);
         if (kbUnitQueryExecute(fishQuery) > 0)
            fish = kbUnitQueryGetResult(fishQuery, 0);   // Get the nearest fish.
         if (fish >= 0)
            fishAreaGroup = kbAreaGroupGetIDByPosition(kbUnitGetPosition(fish));
         if ( (fish >= 0) && (fishAreaGroup == flagAreaGroup) )
            aiEcho("Found fish # "+fish+" at "+kbUnitGetPosition(fish));
         else
         {
            aiEcho("No fish found near "+kbUnitGetPosition(flag));
            return;  // No fish near enough, keep looking
         }
      }  // else, no flag, so just go ahead.
      
      if (fish < 0)
         getUnit(cUnitTypeAbstractFish, 0, cUnitStateAny);  // need to have one fish visible
      
      if (fish < 0)
         return;
      
      aiEcho("*** Starting fishing plan. ***");
      
      gFishingPlan = aiPlanCreate("Fishing plan", cPlanFish); 
      aiPlanSetDesiredPriority(gFishingPlan, 20);     // Very low
      aiPlanAddUnitType(gFishingPlan, gFishingUnit, 1, 10, 200); 
      aiPlanSetEscrowID(gFishingPlan, cEconomyEscrowID); 
      aiPlanSetBaseID(gFishingPlan, kbBaseGetMainID(cMyID)); 
      aiPlanSetVariableVector(gFishingPlan, cFishPlanLandPoint, 0, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))); 
      if ( flag >= 0 )
      {
         aiEcho("Setting fishing plan water point to "+kbUnitGetPosition(getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID)) );
         aiPlanSetVariableVector(gFishingPlan, cFishPlanWaterPoint, 0, kbUnitGetPosition(getUnit(cUnitTypeHomeCityWaterSpawnFlag, cMyID)) );
      }
      else
         aiEcho("Couldn't find a water spawn flag.");

    aiPlanSetVariableBool(gFishingPlan, cFishPlanBuildDock, 0, false);    //BHG - the ai doesn't like to fish if this is set to true

aiPlanSetActive(gFishingPlan); 

      aiEcho("*** Creating maintain plan for fishing boats.");
      gFishingBoatMaintainPlan = createSimpleMaintainPlan(gFishingUnit, gNumFishBoats, true, kbBaseGetMainID(cMyID), 1);
      
      if(gWaterExplorePlan < 0)
      {
         vector location = kbUnitGetPosition(fish);
         gWaterExplorePlan=aiPlanCreate("Water Explore", cPlanExplore);
         aiPlanSetVariableBool(gWaterExplorePlan, cExplorePlanReExploreAreas, 0, false);
         aiPlanSetInitialPosition(gWaterExplorePlan, location);
         aiPlanSetDesiredPriority(gWaterExplorePlan, 45);   // Low, so that transport plans can steal it as needed, but just above fishing plans.
         aiPlanAddUnitType(gWaterExplorePlan, gFishingUnit, 1, 1, 1);
         aiPlanSetEscrowID(gWaterExplorePlan, cEconomyEscrowID);
         aiPlanSetVariableBool(gWaterExplorePlan, cExplorePlanDoLoops, 0, false);
         aiPlanSetActive(gWaterExplorePlan);
      }
   }

   if (cvOkToFish == true)
      xsDisableSelf();  // Normally, disable if we get here because we're done.  
                        // But if okToFish is false, keep rule active in case it gets turned true later.
}

//==============================================================================
// addMillBuildPlan
//==============================================================================
void addMillBuildPlan(void)
{
   if ((kbGetCiv() == cCivOttomans) && (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) < 2) && (kbResourceGet(cResourceWood) < 1000))
      return;
   createSimpleBuildPlan(gFarmUnit, 1, 70, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
}



//==============================================================================
// rule updateFoodBreakdown
//==============================================================================
rule updateFoodBreakdown
inactive
group tcComplete
minInterval 29
{
   int numberMills = kbUnitCount(cMyID, gFarmUnit, cUnitStateAlive);
   const int cMaxSettlersPerHuntPlan = 12;
   const int cMinSettlersPerHuntPlan = 3;    // Must be much less than Max/2 to avoid thrashing
   static int totalFoodPlans = 0;            // How many are currently requested?  Try to avoid thrashing this number
   int huntPlans = 0;
   int huntables = 0;                        // Used to monitor hunting count
	int herdables = 0;
   int animalsAvailable = 0;
   int n = 0;
   if(kbGetAge() == cAge1 && kbGetCiv() != cCivDutch)
      n = 3;
   
   // Get an estimate for the number of food gatherers.
   // Figure out how many mill plans that should be, and how many villagers will be farming.
   // Look at how many hunt plans we'd have, and see if that's a reasonable number.
   float percentOnFood = aiGetResourceGathererPercentage( cResourceFood, cRGPActual );
   int numFoodGatherers =  percentOnFood * (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) + kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive));
   int foodGatherersRemaining = numFoodGatherers;
   int farmPlans = 0;
   if (numFoodGatherers > (numberMills * cMaxSettlersPerMill)) // Can we max out the farms?
   {
      farmPlans = numberMills;
      foodGatherersRemaining = numFoodGatherers - (farmPlans * cMaxSettlersPerMill);
      if ( (gTimeToFarm == true) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gFarmUnit) < 0) && (kbResourceGet(cResourceWood) > 500) )
         addMillBuildPlan();  // If we don't have enough mills, and we need to farm, and we're not building one, build one.
   }
   else
   {  // We can't fill the farms
      farmPlans = 1 + (foodGatherersRemaining / cMaxSettlersPerMill);
      foodGatherersRemaining = 0;
   }
   
   if (foodGatherersRemaining > 0)
   {  // Assign some hunt plans
      huntPlans = totalFoodPlans - farmPlans;   // Let's try to preserve the total number of plans
      if (huntPlans < 1)
         huntPlans = 1;
      
      while ( (foodGatherersRemaining / huntPlans) < (cMinSettlersPerHuntPlan) )   // Too many plans, not enough gatherers
         huntPlans = huntPlans - 1;
      
      while ( (foodGatherersRemaining / huntPlans) > (cMaxSettlersPerHuntPlan+n) )   // Too many gatherers, not enough plans
            huntPlans = huntPlans + 1;
   }
   else
   {
      huntPlans = 0;
   }
   
   totalFoodPlans = huntPlans + farmPlans;
/*
   if (getUnitCountByLocation(cUnitTypeCrateofFood, 0, cUnitStateAlive, kbBaseGetLocation(cMyID,kbBaseGetMainID(cMyID)), 20.0) > 0)
      if (totalFoodPlans < 2)
         totalFoodPlans = 2;    // Make sure we have at least 2 food plans if we have crates.
*/

   if ( (numFoodGatherers == 0) || (cvOkToGatherFood == false) )
      totalFoodPlans = 0;    // Checked here to avoid div 0 above.
   
   //aiEcho("Food breakdown found "+numFoodGatherers+" food gatherers and "+numberMills+" mills.");
   //aiEcho("    Decided to go with "+totalFoodPlans+" food plans.");

   int foodAmount = kbGetAmountValidResources( kbBaseGetMainID(cMyID), cResourceFood , cAIResourceSubTypeEasy, 40.0 );
   int huntAmount = kbGetAmountValidResources( kbBaseGetMainID(cMyID), cResourceFood , cAIResourceSubTypeHunt, 40.0  );
   if(totalFoodPlans == 1 && foodAmount > 5000 && kbGetCiv() == cCivJapanese)
      totalFoodPlans = 2;
   
   if(xsGetTime() < 300000 && huntAmount > 100 && kbGetCiv() != cCivJapanese)
      aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeEasy, 0, 79, 0.0, kbBaseGetMainID(cMyID));
   else
      aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeEasy, totalFoodPlans, 79, 1.0, kbBaseGetMainID(cMyID));
    
   if ( (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy)) {
      /*if(xsGetTime() < 300000)
        aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, 1, 79, 1.0, kbBaseGetMainID(cMyID));
	  else */if(xsGetTime() < 1200000)
	    aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, totalFoodPlans, 79, 1.0, kbBaseGetMainID(cMyID));
	  else
	    aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, 0, 79, 0.0, kbBaseGetMainID(cMyID));
   }
   if ( (kbGetCiv() != cCivIndians) && (kbGetCiv() != cCivSPCIndians) && (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
	  if(xsGetTime() < 420000)
        aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHerdable, 0, 50, 0.0, kbBaseGetMainID(cMyID));
	  else
	    aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHerdable, totalFoodPlans, 50, 1.0, kbBaseGetMainID(cMyID));  
    }
   
   aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHuntAggressive, 0, 79, 0.0, kbBaseGetMainID(cMyID)); 
   aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeFish, 0, 79, 0.0, kbBaseGetMainID(cMyID));
   aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeFarm, 0, 81, 0.0, kbBaseGetMainID(cMyID));
}


//==============================================================================
// rule updateWoodBreakdown
//==============================================================================
rule updateWoodBreakdown
inactive
group tcComplete
minInterval 30
{
   float percentOnWood = aiGetResourceGathererPercentage( cResourceWood, cRGPActual );
   int numWoodGatherers =  percentOnWood * (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) + kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive));
   static int numWoodPlans = 0;  // How many are currently requested?  Try to avoid thrashing this number
   const int cMaxSettlersPerWoodPlan = 20;
   const int cMinSettlersPerWoodPlan = 2;    // Must be much less than Max/2 to avoid thrashing
   
  if (numWoodPlans < 1)
      numWoodPlans = 1;
   
   while ( (numWoodGatherers / numWoodPlans) < cMinSettlersPerWoodPlan )   // Too many plans, not enough gatherers
      numWoodPlans = numWoodPlans - 1;
   
   while ( (numWoodGatherers / numWoodPlans) > cMaxSettlersPerWoodPlan )   // Too many gatherers, not enough plans
         numWoodPlans = numWoodPlans + 1;
   
   /*
   if (getUnitCountByLocation(cUnitTypeCrateofWood, 0, cUnitStateAlive, kbBaseGetLocation(cMyID,kbBaseGetMainID(cMyID)), 20.0) > 0)
      if (numWoodPlans < 2)
         numWoodPlans = 2;    // Make sure we have at least 2 wood plans if we have crates.
    */

   if ( (numWoodGatherers == 0) || (cvOkToGatherWood == false) )
      numWoodPlans = 0;    // Checked here to avoid div 0 above.
   
   aiSetResourceBreakdown(cResourceWood, cAIResourceSubTypeEasy, numWoodPlans, 82, 1.0, kbBaseGetMainID(cMyID));
}


//==============================================================================
// rule updateGoldBreakdown
//==============================================================================
rule updateGoldBreakdown
inactive
group tcComplete
minInterval 31
{
   static int numberGoldPlans = 0;
   
   //int numberMines = kbUnitCount(cMyID, cUnitTypeMine, cUnitStateAlive);
   //int numberGoldSources = getUnitCountByLocation(0, cUnitTypeBeaverLodge, cUnitStateAlive, kbBaseGetLocation(cMyID,kbBaseGetMainID(cMyID)), 100.0);
   //numberGoldSources = numberGoldSources + numberMines;     // This is the upper limit for how many gold plans we can have
   float percentOnGold = aiGetResourceGathererPercentage( cResourceGold, cRGPActual );
   int numGoldGatherers =  percentOnGold * (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) + kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive));

   
   int minPlans = (numGoldGatherers / 15) + 1;     // Assume up to 15 per site
   if (gTimeForPlantations == true)
      minPlans = (numGoldGatherers / cMaxSettlersPerPlantation) + 1;

   int maxPlans = (numGoldGatherers / 2) + 1;
   
   if (numberGoldPlans > maxPlans)
   {
      numberGoldPlans = maxPlans;
      aiEcho("Decreasing to "+numberGoldPlans+" gold plans.");
   }
   if ((numberGoldPlans < minPlans) && (numGoldGatherers > 0))
   {
      numberGoldPlans = minPlans;
      aiEcho("Increasing to "+numberGoldPlans+" gold plans.");
   }

   if ( (numGoldGatherers == 0) || (cvOkToGatherGold == false) )
      numberGoldPlans = 0;    // Checked here to avoid div 0 above.
   
   if ( (kbGetAge()>=cAge3) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gPlantationUnit) < 0) )
   {  // It's third age, and we're not building a plantation...see if we need one.
      if ( (numberGoldPlans > kbUnitCount(cMyID, gPlantationUnit, cUnitStateAlive)) && (cvOkToBuild == true) && (gTimeForPlantations == true) && (kbResourceGet(cResourceWood) > 1000))
      {  // Yep, we need one
         if(civIsAsian() == true)
		    addMillBuildPlan();
		 else
		    createSimpleBuildPlan(gPlantationUnit, 1, 60, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new plantation build plan.");
      }
   }

   int goldAmount = kbGetAmountValidResources( kbBaseGetMainID(cMyID), cResourceGold , cAIResourceSubTypeEasy, 40.0  );
   if(kbGetAge() == cAge1)
      aiSetResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, 0, 78, 0.0, kbBaseGetMainID(cMyID));
   else if(goldAmount > 100 && getUnit(gPlantationUnit) < 0)
      aiSetResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, 1, 78, 1.0, kbBaseGetMainID(cMyID));
   else
      aiSetResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, numberGoldPlans, 78, 1.0, kbBaseGetMainID(cMyID));
}



//==============================================================================
// initGatherGoal()
//==============================================================================
int initGatherGoal()
{
   /* Create the gather goal, return its handle.  The gather goal stores the key data for controlling
      gatherer distribution.  
   */
   int planID = aiPlanCreate("GatherGoals", cPlanGatherGoal);

   if (planID >= 0)
   {
      //Overall percentages.
      aiPlanSetDesiredPriority(planID, 90);
      //Set the RGP weights.  Script in charge.  
		aiSetResourceGathererPercentageWeight(cRGPScript, 0.5);              // Portion driven by forecast
		aiSetResourceGathererPercentageWeight(cRGPCost, 0.5);                // Portion driven by exchange rates
		
      // Set the gather goal to reflect those settings (Gather goal values are informational only to simplify debugging.)
      // Set the gather goal to reflect those settings (Gather goal values are informational only to simplify debugging.)
      aiPlanSetVariableFloat(planID, cGatherGoalPlanScriptRPGPct, 0, 1.0); 
      aiPlanSetVariableFloat(planID, cGatherGoalPlanCostRPGPct, 0, 1.0);   

      aiPlanSetNumberVariableValues(planID, cGatherGoalPlanGathererPct, cNumResourceTypes, true);
      // Set initial gatherer assignments.
      aiPlanSetVariableFloat(planID, cGatherGoalPlanGathererPct, cResourceGold, 0.0);
      aiPlanSetVariableFloat(planID, cGatherGoalPlanGathererPct, cResourceWood, 0.2);
      aiPlanSetVariableFloat(planID, cGatherGoalPlanGathererPct, cResourceFood, 0.8);
/*
      if (kbGetCiv() == cCivFrench)
      {
         aiPlanSetVariableFloat(planID, cGatherGoalPlanGathererPct, cResourceWood, 0.6);
         aiPlanSetVariableFloat(planID, cGatherGoalPlanGathererPct, cResourceFood, 0.4);
      }
*/
      //Standard resource breakdown setup, all easy at the start.
      aiPlanSetNumberVariableValues(planID, cGatherGoalPlanNumFoodPlans, 5, true);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeEasy, 1);
      if ( (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
        aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHunt, 1);
      }
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHerdable, 0);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHunt, 0);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHuntAggressive, 0);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeFarm, 0);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeFish, 0);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumWoodPlans, 0, 1);
      aiPlanSetVariableInt(planID, cGatherGoalPlanNumGoldPlans, 0, 1);  

      //Cost weights...set the convenience copies in the gather goal first, then the real ones next.
      aiPlanSetNumberVariableValues(planID, cGatherGoalPlanResourceCostWeight, cNumResourceTypes, true);
      aiPlanSetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceGold, 1.0); // Gold is the standard
      aiPlanSetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceWood, 1.2); // Start at 1.2, since wood is harder to collect
      aiPlanSetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceFood, 1.0); // Premium for food, or 1.0?

      //Setup AI Cost weights.  This makes it actually work, the calls above just set the convenience copy in the gather goal.
      kbSetAICostWeight(cResourceFood, aiPlanGetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceFood));
      kbSetAICostWeight(cResourceWood, aiPlanGetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceWood));
      kbSetAICostWeight(cResourceGold, aiPlanGetVariableFloat(planID, cGatherGoalPlanResourceCostWeight, cResourceGold));
      
      //Set initial gatherer percentages.
      aiSetResourceGathererPercentage(cResourceFood, 0.9, false, cRGPScript);    
      aiSetResourceGathererPercentage(cResourceWood, 0.1, false, cRGPScript);    
      aiSetResourceGathererPercentage(cResourceGold, 0.0, false, cRGPScript);  
      
/*
if (kbGetCiv() == cCivFrench)
      {  // Need coureurs (wood) early.
         aiSetResourceGathererPercentage(cResourceWood, 0.6, false, cRGPScript);    
         aiSetResourceGathererPercentage(cResourceFood, 0.4, false, cRGPScript);
      }
*/
      /*if (kbGetCiv() == cCivDutch)
      {  // Need bank (wood/food) early.
         aiSetResourceGathererPercentage(cResourceWood, 0.6, false, cRGPScript);    
         aiSetResourceGathererPercentage(cResourceFood, 0.4, false, cRGPScript);
      }*/
      if ( (kbGetCiv() == cCivPirate) || (kbGetCiv() == cCivTheCircle)  || (kbGetCiv() == cCivSPCAct3))
      {  // Need extra wood
         aiSetResourceGathererPercentage(cResourceWood, 0.4, false, cRGPScript);    
         aiSetResourceGathererPercentage(cResourceFood, 0.6, false, cRGPScript);
      }  
      aiNormalizeResourceGathererPercentages(cRGPScript);

      //Set up the initial resource breakdowns.
      int numFoodEasyPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeEasy);
      int numFoodHuntPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHunt);
      int numFoodHerdablePlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHerdable);
      int numFoodHuntAggressivePlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeHuntAggressive);
      int numFishPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeFish);
      int numFarmPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumFoodPlans, cAIResourceSubTypeFarm);
      int numWoodPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumWoodPlans, 0);
      int numGoldPlans=aiPlanGetVariableInt(planID, cGatherGoalPlanNumGoldPlans, 0);

      if ((kbBaseGetMainID(cMyID) >= 0) )     // Don't bother if we don't have a main base
      {         
         if (cvOkToGatherFood == true)
         {
            aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeEasy, numFoodEasyPlans, 49, 1.0, kbBaseGetMainID(cMyID));      // All on easy food at start
            if ( (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
              aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, numFoodHuntPlans, 49, 1.0, kbBaseGetMainID(cMyID));      // All on easy hunting food at start
            }
            if ( (kbGetCiv() != cCivIndians) && (kbGetCiv() != cCivSPCIndians) && (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
              aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHerdable, numFoodHerdablePlans, 24, 1.0, kbBaseGetMainID(cMyID));
            }
            aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeHuntAggressive, numFoodHuntAggressivePlans, 49, 0.0, kbBaseGetMainID(cMyID)); 
            aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeFish, numFishPlans, 49, 0.0, kbBaseGetMainID(cMyID));
            aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeFarm, numFarmPlans, 51, 0.0, kbBaseGetMainID(cMyID));
            if ( (kbGetCiv() == cCivJapanese) || (kbGetCiv() == cCivSPCJapanese) || (kbGetCiv() == cCivSPCJapaneseEnemy) ) {
              aiSetResourceBreakdown(cResourceFood, cAIResourceSubTypeFarm, numFarmPlans, 51, 1.0, kbBaseGetMainID(cMyID));
            }
         }
         if (cvOkToGatherWood == true)
            aiSetResourceBreakdown(cResourceWood, cAIResourceSubTypeEasy, numWoodPlans, 50, 1.0, kbBaseGetMainID(cMyID));
         if (cvOkToGatherGold == true)
            aiSetResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, numGoldPlans, 55, 1.0, kbBaseGetMainID(cMyID));
      }

   }
   return(planID);
}






//==============================================================================
// updateEconSiteList
/*
   Scan all potential econ bases that aren't being used.   Sort them into a 
   rational order of planned use, considering size, proximity to each other,
   security, etc.
*/
//==============================================================================
void updateEconSiteList(void)
{
}





//==============================================================================
// initEcon
/*
   Called when the initial units have disembarked.  Sets up initial economy.
*/
//==============================================================================
void initEcon(void)
{
   if (kbGetCiv() == cCivFrench)  
      gEconUnit = cUnitTypeCoureur;
   
   if ( (kbGetCiv() == cCivXPIroquois) || (kbGetCiv() == cCivXPSioux) || (kbGetCiv() == cCivXPAztec) )
      gEconUnit = cUnitTypeSettlerNative;  
   
   if (kbGetCiv() == cCivRussians)
      gTowerUnit = cUnitTypeBlockhouse;
   
   
   if(cMyCiv == cCivOttomans || cMyCiv == cCivBritish || cMyCiv == cCivPortuguese)
   {
      gRushBuilding1 = cUnitTypeBarracks;
	  gRushBuilding2 = cUnitTypeBarracks;
   }
   else if(cMyCiv == cCivRussians)
   {
      gRushBuilding1 = cUnitTypeBlockhouse;
	  gRushBuilding2 = cUnitTypeStable;
   }
   else if(cMyCiv == cCivXPIroquois || cMyCiv == cCivXPSioux)
   {
      gRushBuilding1 = cUnitTypeWarHut;
	  gRushBuilding2 = cUnitTypeCorral;
   }
   else if(cMyCiv == cCivJapanese)
   {
	  gRushBuilding1 = cUnitTypeypBarracksJapanese;
	  gRushBuilding2 = cUnitTypeypStableJapanese;
   }
   else if(cMyCiv == cCivDutch)
   {
	  gRushBuilding1 = cUnitTypeStable;
	  gRushBuilding2 = cUnitTypeBarracks;
   }
   else
   {
      gRushBuilding1 = cUnitTypeBarracks;
	  gRushBuilding2 = cUnitTypeStable;
   }
   
   //BHG...
   if ( civIsAsian() == true )
   {
      gEconUnit = cUnitTypeypSettlerAsian;
      
      gTowerUnit = cUnitTypeypCastle;
      gFarmUnit = cUnitTypeypRicePaddy;
      gPlantationUnit = cUnitTypeypRicePaddy;
      
      gMarketUnit = cUnitTypeypTradeMarketAsian;
      gDockUnit = cUnitTypeYPDockAsian;
      
      cvOkToBuildForts = false;
      
      gFishingUnit = cUnitTypeypFishingBoatAsian;
    }
    //...BHG
   
   if ( (kbGetCiv() == cCivXPAztec) || (kbGetCiv() == cCivXPIroquois) || (kbGetCiv() == cCivXPSioux) )
   {
      gTowerUnit = cUnitTypeWarHut;
      gFarmUnit = cUnitTypeFarm;
   }
   
   if (kbGetCiv() == cCivOttomans)
      gCaravelUnit = cUnitTypeGalley;
   
   if ( civIsNative() == true )
      gCaravelUnit = cUnitTypeCanoe;
   
   if (kbGetCiv() == cCivDutch)
      gGalleonUnit = cUnitTypeFluyt;
	  
   if (kbGetCiv() == cCivXPAztec)
      gFrigateUnit = cUnitTypexpTlalocCanoe;
      
   //BHG...
   if ( (kbGetCiv() == cCivChinese) || (kbGetCiv() == cCivSPCChinese) )
   {
      gHouseUnit = cUnitTypeypVillage;
      
      gCaravelUnit = cUnitTypeypWarJunk;
      gGalleonUnit = cUnitTypeypFireship;
	  gFrigateUnit = cUnitTypeypFuchuan;
      
      gLivestockPenUnit = cUnitTypeypVillage;
   }
   
   if ( (kbGetCiv() == cCivJapanese) || (kbGetCiv() == cCivSPCJapanese) || (kbGetCiv() == cCivSPCJapaneseEnemy) )
   {
      gEconUnit = cUnitTypeypSettlerJapanese;
   
      gHouseUnit = cUnitTypeypShrineJapanese;
      
      gTowerUnit = cUnitTypeypCastle;
      
      gCaravelUnit = cUnitTypeypFune;
      gGalleonUnit = cUnitTypeypAtakabune;
	  gFrigateUnit = cUnitTypeypTekkousen;
      
      gLivestockPenUnit = cUnitTypeypShrineJapanese;
      
      //gTimeToFarm = true;
   }
   
   if ( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) )
   {
      gHouseUnit = cUnitTypeypHouseIndian;
            
      gLivestockPenUnit = cUnitTypeypSacredField;
      
      gEconUnit = cUnitTypeypSettlerIndian;
   }
   //...BHG

   if ( (kbGetCiv() == cCivBritish) || (kbGetCiv() == cCivTheCircle) || (kbGetCiv() == cCivPirate) || (kbGetCiv() == cCivSPCAct3))
      gHouseUnit = cUnitTypeManor;
   
   if ( (kbGetCiv() == cCivFrench) || (kbGetCiv() == cCivDutch) )
      gHouseUnit = cUnitTypeHouse;
   
   if ( (kbGetCiv() == cCivGermans) || (kbGetCiv() == cCivRussians) )
      gHouseUnit = cUnitTypeHouseEast;
   
   if ( (kbGetCiv() == cCivSpanish) || (kbGetCiv() == cCivPortuguese) || (kbGetCiv() == cCivOttomans) )
      gHouseUnit = cUnitTypeHouseMed;
   
   if ( kbGetCiv() == cCivXPIroquois )
      gHouseUnit = cUnitTypeLonghouse;
   
   if ( kbGetCiv() == cCivXPSioux )
      gHouseUnit = cUnitTypeTeepee;
   
   if ( kbGetCiv() == cCivXPAztec )
      gHouseUnit = cUnitTypeHouseAztec;
   
   // Escrow initialization is now delayed until the TC is built, as
   // any escrow allocation prevents the AI from affording a TC.
   // For now, though, override the default and set econ/mil to 0
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceFood, 0.0);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceWood, 0.0);   
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceGold, 0.0);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceFame, 0.0);
      
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceFood, 0.0);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceWood, 0.0);  
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceGold, 0.0);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceFame, 0.0);
   
   kbEscrowAllocateCurrentResources();


   aiSetEconomyPercentage(1.0);
   aiSetMilitaryPercentage(1.0);    // Priority balance neutral

   // TODO:  Define current bases, areagroup, etc.
   gFarmBaseID=kbBaseGetMainID(cMyID);
   gFoodBaseID=kbBaseGetMainID(cMyID);       // Where we hunt or gather non-farm food.
   gGoldBaseID=kbBaseGetMainID(cMyID);
   gWoodBaseID=kbBaseGetMainID(cMyID);
 
   // Set up gatherer goal
   //gGatherGoal = initGatherGoal();

	//Create a herd plan to gather all herdables that we ecounter.
	int matchCount = -1;
   gHerdPlanID=aiPlanCreate("GatherHerdable Plan", cPlanHerd);
   if (gHerdPlanID >= 0)
   {
   
      aiPlanAddUnitType(gHerdPlanID, cUnitTypeHerdable, 0, 100, 100);
      // aiPlanSetBaseID(gHerdPlanID, kbBaseGetMainID(cMyID));
	  aiPlanSetVariableInt(gHerdPlanID, cHerdPlanBuildingTypeID, 0, cUnitTypeTownCenter);
    aiPlanSetVariableFloat(gHerdPlanID, cHerdPlanDistance, 0, 5.0);
      aiPlanSetActive(gHerdPlanID);
   }

   
   xsEnableRuleGroup("startup");

   //Lastly, force an update on the economy...call the function directly.
   //econMaster();
}







//==============================================================================
// evaluateBases
/*
   Review the list of currently active economic bases for viability.  
   Determine if bases need to be added to or removed from the list.  
*/
//==============================================================================
void evaluateBases()
{
}





//==============================================================================
//
// updatePrices
// 
// This function compares actual supply vs. forecast, updates AICost 
// values (internal resource prices), and buys/sells at the market as appropriate
//==============================================================================
void updatePrices()
{
	// check for valid forecasts, exit if not ready
	if ( (xsArrayGetFloat(gForecasts,0) + xsArrayGetFloat(gForecasts,1) + xsArrayGetFloat(gForecasts,2) ) < 100 )
		return; 
   
	float scaleFactor = 3.0;      // Higher values make prices more volatile
   // Commentary on scale factor.  A factor of 1.0 compares inventory of resources against the full 3-minute forecast.  A scale of 10.0
   // compares inventory to 1/10th of the forecast.  A large scale makes prices more volatile, encourages faster and more frequent trading at lower threshholds, etc.
	float goldStatus = 0.0;
	float woodStatus = 0.0;
	float foodStatus = 0.0;
	float minForecast = 200.0 * (1+kbGetAge());	// 200, 400, 600, 800 in ages 1-4, prevents small amount from looking large if forecast is very low
	if (xsArrayGetFloat(gForecasts,cResourceGold) > minForecast)
		goldStatus = scaleFactor * kbResourceGet(cResourceGold)/xsArrayGetFloat(gForecasts,cResourceGold);
	else
		goldStatus = scaleFactor * kbResourceGet(cResourceGold)/minForecast;
	if (xsArrayGetFloat(gForecasts,cResourceFood) > minForecast)
		foodStatus = scaleFactor * kbResourceGet(cResourceFood)/xsArrayGetFloat(gForecasts,cResourceFood);
	else
		foodStatus = scaleFactor * kbResourceGet(cResourceFood)/minForecast;
	if (xsArrayGetFloat(gForecasts,cResourceWood) > minForecast)
		woodStatus = scaleFactor * kbResourceGet(cResourceWood)/xsArrayGetFloat(gForecasts,cResourceWood);
	else
		woodStatus = scaleFactor * kbResourceGet(cResourceWood)/minForecast;
		
	// Status now equals inventory/forecast
	// Calculate value rate of wood:gold and food:gold.  1.0 means they're of the same status, 2.0 means 
	// that the resource is one forecast more scarce, 0.5 means one forecast more plentiful, i.e. lower value.
	float woodRate = (1.0 + goldStatus)/(1.0 + woodStatus);
   woodRate = woodRate * 1.2; // Because wood is more expensive to gather
	float foodRate = (1.0 + goldStatus)/(1.0 + foodStatus);
	
	// The rates are now the instantaneous price for each resource.  Set the long-term prices by averaging this in
	// at a 5% weight.
	float cost = 0.0;
   
	// wood
	cost = kbGetAICostWeight(cResourceWood);
	cost = (cost * 0.95) + (woodRate * .05);
	kbSetAICostWeight(cResourceWood, cost);

	// food
	cost = kbGetAICostWeight(cResourceFood);
	cost = (cost * 0.95) + (foodRate * .05);
	kbSetAICostWeight(cResourceFood, cost);

	// Gold
	kbSetAICostWeight(cResourceGold, 1.00);	// gold always 1.0, others relative to gold
	
	// Update the gather plan goal
	int i=0;
	for (i=0; < 3)
	{
		aiPlanSetVariableFloat(gGatherGoal, cGatherGoalPlanResourceCostWeight, i, kbGetAICostWeight(i));
	}
}




//==============================================================================
// spewForecasts
//==============================================================================
void spewForecasts()
{  // Debug aid, dump forecast contents
   int gold = xsArrayGetFloat(gForecasts, cResourceGold);
   int wood = xsArrayGetFloat(gForecasts, cResourceWood);
   int food = xsArrayGetFloat(gForecasts, cResourceFood);
   
   aiEcho("Forecast Gold: "+gold+", Wood: "+wood+", Food: "+food);
   aiEcho("Prices   Gold: "+kbGetAICostWeight(cResourceGold)+", Wood: "+kbGetAICostWeight(cResourceWood)+", Food: "+kbGetAICostWeight(cResourceFood));
}

//==============================================================================
// addItemToForecasts
//==============================================================================
void addItemToForecasts(int protoUnit = -1, int qty = -1)
{
   // Add qty of item protoUnit to the global forecast arrays
   if (protoUnit < 0)
      return;
   if (qty < 1)
      return;
   int i=0;
   for (i=0; <3)  // Step through first three resources
   {
      xsArraySetFloat(gForecasts, i, xsArrayGetFloat(gForecasts, i) + (kbUnitCostPerResource(protoUnit, i) * qty));
   }
   aiEcho("    "+qty+" "+kbGetProtoUnitName(protoUnit));
   //spewForecasts();
}


//==============================================================================
// addTechToForecasts
//==============================================================================
void addTechToForecasts(int techID = -1)
{
   // Add cost of this tech to the global forecast arrays
   if (techID < 0)
      return;
   int i=0;
   for (i=0; <3)  // Step through first three resources
   {
      xsArraySetFloat(gForecasts, i, xsArrayGetFloat(gForecasts, i) + kbTechCostPerResource(techID, i));
   }  
   aiEcho("    "+kbGetTechName(techID));
   //spewForecasts();
}

//==============================================================================
// clearForecasts
//==============================================================================
void clearForecasts()
{
   // Clear the global forecast arrays
   int i=0;
   for(i=0; <3)
   {
      xsArraySetFloat(gForecasts, i, 0.0);
   }
   //aiEcho("******** Clearing forecasts");
}

//==============================================================================
// updateForecasts
/*
   Create 3-minute forecast of resource needs for food, wood and gold
*/
//==============================================================================
void updateForecasts()
{
   int i=0; 
   int militaryUnit = -1;
   int milQty = -1;
   int popSlots = -1;
   
   //int effectiveAge = kbGetAge();
   //if ( agingUp() == true )
      //effectiveAge = effectiveAge + 1;
//   if ( (kbGetAge() == cAge1) && (gEarlyEconPhase == false) )
//      effectiveAge = cAge2;
   
   int numUnits = 0; // Temp var used to track how many of each item will be needed

   clearForecasts(); // Reset all to zero
   aiEcho("Starting forecast.  Items included:");
   
   //(kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) + kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive))
   //int millsNeeded = 1 + ( (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive)*0.5) / cMaxSettlersPerMill);  // Enough for 50% of population
   int millsNeeded = 1 + ( (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive)+kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive))*0.5 / cMaxSettlersPerMill);
   millsNeeded = millsNeeded - kbUnitCount(cMyID, gFarmUnit, cUnitStateABQ);

   //if ( (gTimeToFarm == true) && (millsNeeded > 0) )
      //sendChatToAllies("0.0");
   if ( (gTimeToFarm == true) && (millsNeeded > 0) )
      addItemToForecasts(gFarmUnit, 1); 
   
   int plantsNeeded = 1 + ( (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive)+kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive))*0.4 / cMaxSettlersPerPlantation);  //Enough for 40% of population
   plantsNeeded = plantsNeeded - kbUnitCount(cMyID, gPlantationUnit, cUnitStateABQ);
   if ( (plantsNeeded > 0) && (kbGetAge() > cAge2) && (gTimeForPlantations == true) )
      addItemToForecasts(gPlantationUnit, 1);  

   switch(kbGetAge())
   {
      case cAge1:
      {
         xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 1000.0);
		 //if (aiPlanGetState(gAgeUpResearchPlan) < 0)    
         //{
            if (civIsAsian() == false) {
              addTechToForecasts(aiGetPoliticianListByIndex(cAge2, 0));
            }
            else {
              addItemToForecasts(getPreferredWonderToBuild(cAge2), 1);
            }
         //}
		 // Settlers
         if ((cMyCiv != cCivOttomans) && (cMyCiv != cCivDutch) && (cMyCiv != cCivIndians))   // Ottomans get them free
         {
			addItemToForecasts(gEconUnit, 5);
         }   
		 
         // And a bit extra wood, since running out is so painful...
         //xsArraySetInt(gForecasts, cResourceWood, 200 + xsArrayGetInt(gForecasts, cResourceWood));
         
		 
		 break;
      }
      case cAge2:
      {
		 // Add a baseline just to make sure we don't get any near-zero resource amounts
         xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 300.0);
         xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 300.0);
         xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 300.0);
         
         // Settlers
         if (cMyCiv == cCivRussians)
         {
            addItemToForecasts(gEconUnit, 8);
         }
		 else if (cMyCiv != cCivOttomans)   // Ottomans get them free
         {
            addItemToForecasts(gEconUnit, 5);
         }
         
         // Age upgrade
		 //if (aiPlanGetState(gAgeUpResearchPlan) < 0)    
         //{
            if (civIsAsian() == false) {
              addTechToForecasts(aiGetPoliticianListByIndex(cAge3, 0));
            }
            else {
              addItemToForecasts(getPreferredWonderToBuild(cAge3), 1);
            }
         //}
		 
		 //for ff
		 if(cMyCiv == cCivChinese && xsGetTime() < 480000) //+manchu
		 {
			xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 1500.0);
			break;
		 }
		 if(cMyCiv == cCivFrench && xsGetTime() < 480000) //+swiss pike
		 {
			xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 1500.0);
			break;
		 }
		 if (cMyCiv != cCivXPSioux)
            addItemToForecasts(gHouseUnit, 3);
		 
		 
		 if(cMyCiv == cCivIndians && xsGetTime() < 480000)
		 {
			xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 600.0);
			addItemToForecasts(gEconUnit, 5);
			break;
		 }
		 if(cMyCiv == cCivXPAztec && xsGetTime() < 480000)
		 {
			xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 600.0);
			xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 750.0);
			break;
		 }
		 
		 if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < 0 && gNavyMap == true)
         {
            addItemToForecasts(gDockUnit, 1);
         }
		 else if (getNavalTargetPlayer() > 0)
         {
            xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 300.0);
         }
		 
		 if (gLandUnitPicker >= 0)
         {
            militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 0);
            if (militaryUnit >= 0)
            {
               popSlots = kbGetPopSlots(cMyID, militaryUnit);
               if (popSlots < 1)
                  popSlots = 1;
               milQty = 12 / popSlots; 
               addItemToForecasts(militaryUnit, milQty);
            }          
			/*else
            {
               xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 600.0);
               xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 600.0);
            }*/
            
            // Add 8 pop slots of secondary military unit
            if (kbUnitPickGetNumberResults(gLandUnitPicker) > 1)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 1);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 8 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            }
         }
		 
		 if(cMyCiv == cCivXPIroquois)
		 {
		    if((xsGetTime() - gAgeUpTime) < 240000)
			   xsArraySetFloat(gForecasts, cResourceGold, 0.0);
			else if((xsGetTime() - gAgeUpTime) < 360000)
			   xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold)/2);
		 }
			
		 
		 break;
      }
      case cAge3:
      {
         // Add a baseline just to make sure we don't get any near-zero resource amounts
         xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 300.0);
         xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 300.0);
         xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 300.0);
         
		 // Settlers cMyCiv == cCivGermans || cMyCiv == cCivFrench || 
         if (cMyCiv != cCivOttomans && cMyCiv != cCivXPAztec)   // Ottomans get them free
         {
            addItemToForecasts(gEconUnit, 5);
         }
                  
         // Age upgrade
		 //if (aiPlanGetState(gAgeUpResearchPlan) < 0 && kbUnitCount(cMyID, gEconUnit, cUnitStateABQ) > 25)    
         //{
            if (civIsAsian() == false) {
              addTechToForecasts(aiGetPoliticianListByIndex(cAge4, 0));
            }
            else {
              addItemToForecasts(getPreferredWonderToBuild(cAge4), 1);
            }
         //}
		 
		 //for FI
		 if(cMyCiv == cCivXPAztec)
		 {
			xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 1000.0);
			xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 900.0);
			break;
		 }
		 
		 if (cMyCiv != cCivXPSioux)
            addItemToForecasts(gHouseUnit, 3);
		 
		 if (cMyCiv == cCivXPSioux || cMyCiv == cCivIndians || cMyCiv == cCivGermans)
		    xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 500.0);
		 
		 if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < 0 && gNavyMap == true)
         {
            addItemToForecasts(gDockUnit, 1);
         }
		 else if (getNavalTargetPlayer() > 0)
         {
            xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 500.0);
         }
         
		 // Add 15 pop slots of primary military unit
         if (gLandUnitPicker >= 0)
         {
            militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 0);
            if (militaryUnit >= 0)
            {
               popSlots = kbGetPopSlots(cMyID, militaryUnit);
               if (popSlots < 1)
                  popSlots = 1;
               milQty = 14 / popSlots; 
               addItemToForecasts(militaryUnit, milQty);
            }          
            else
            {
               xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 800.0);
               xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 800.0);
            }
            
            // Add 8 pop slots of secondary military unit
            if (kbUnitPickGetNumberResults(gLandUnitPicker) > 1)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 1);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 10 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            }
         }
		 else
		 {
		    xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 700.0);
            xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 700.0);
            xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 700.0);
		 }
         
		 break;
      }
      case cAge4:
      {
         // Add a baseline just to make sure we don't get any near-zero resource amounts
         xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 1000.0);
         if(xsArrayGetFloat(gForecasts, cResourceWood) < 1000.0)
		    xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 1000.0);
         xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 1000.0);
         
         // Settlers
         if (cMyCiv != cCivOttomans && cMyCiv == cCivIndians)   // Ottomans get them free
         {
            numUnits = 5;
			//if(cMyCiv == cCivXPAztec && kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) < 50)
			   //numUnits = 10;
            addItemToForecasts(gEconUnit, numUnits);
         }

         // Age upgrade

         
         if(cMyCiv == cCivXPSioux)
		 {
			xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 500.0);
		 }  
         
         if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < 0 && gNavyMap == true)
         {
            addItemToForecasts(gDockUnit, 1);
         }
		 else if (getNavalTargetPlayer() > 0)
         {
            xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 500.0);
         }
         
         if (gLandUnitPicker >= 0)
         {
            // Add 20 pop slots of primary military unit
            militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 0);
            if (militaryUnit >= 0)
            {
               popSlots = kbGetPopSlots(cMyID, militaryUnit);
               if (popSlots < 1)
                  popSlots = 1;
               milQty = 14 / popSlots; 
               addItemToForecasts(militaryUnit, milQty);
            }         
            else
            {
               xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 1000.0);
               xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 1000.0);
            } 
            
            // Add 10 pop slots of secondary military unit
            if (kbUnitPickGetNumberResults(gLandUnitPicker) > 1)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 1);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 10 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            }
			
			if (kbUnitPickGetNumberResults(gLandUnitPicker) > 2)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 2);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 6 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            } 
         }
		 
		 //if (cMyCiv != cCivXPSioux)
            //addItemToForecasts(gHouseUnit, 3);
		 
		 break;
      }
      case cAge5:
      {
         // Add a baseline just to make sure we don't get any near-zero resource amounts
         xsArraySetFloat(gForecasts, cResourceFood, xsArrayGetFloat(gForecasts, cResourceFood) + 1000.0);
         xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 1000.0);
         xsArraySetFloat(gForecasts, cResourceGold, xsArrayGetFloat(gForecasts, cResourceGold) + 1000.0);
         
         // Settlers
         if (cMyCiv != cCivOttomans && cMyCiv == cCivIndians)   // Ottomans get them free
         {
            numUnits = 5;
            addItemToForecasts(gEconUnit, numUnits);
         }
                  
         if (kbUnitCount(cMyID, gDockUnit, cUnitStateABQ) < 0 && gNavyMap == true)
         {
            addItemToForecasts(gDockUnit, 1);
         }
		 else if (getNavalTargetPlayer() > 0)
         {
            xsArraySetFloat(gForecasts, cResourceWood, xsArrayGetFloat(gForecasts, cResourceWood) + 500.0);
         }
         
         if (gLandUnitPicker >= 0)
         {
            // Add 30 pop slots of primary military unit
            militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 0);
            if (militaryUnit >= 0)
            {
               popSlots = kbGetPopSlots(cMyID, militaryUnit);
               if (popSlots < 1)
                  popSlots = 1;
               milQty = 16 / popSlots; 
               addItemToForecasts(militaryUnit, milQty);
            } 
            
            // Add 15 pop slots of secondary military unit
            if (kbUnitPickGetNumberResults(gLandUnitPicker) > 1)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 1);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 12 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            }  

			if (kbUnitPickGetNumberResults(gLandUnitPicker) > 2)
            {
               militaryUnit = kbUnitPickGetResult( gLandUnitPicker, 2);
               if (militaryUnit >= 0)
               {
                  popSlots = kbGetPopSlots(cMyID, militaryUnit);
                  if (popSlots < 1)
                     popSlots = 1;
                  milQty = 8 / popSlots; 
                  addItemToForecasts(militaryUnit, milQty);
               } 
            } 
         }
         
		 break;
      }
   }
   
   spewForecasts();
   updatePrices();   // Set the aicost weights, buy/sell resources as needed.
}


void updateResources()
{
   const int cMinResourcePerGatherer = 100;   // When our supply gets below this level, start farming/plantations.
   int mainBaseID = kbBaseGetMainID(cMyID);
   if (mainBaseID < 0)
      return;
   vector loc = kbBaseGetLocation(cMyID, mainBaseID);
   if (xsGetTime() > 5000)
   {
      int foodAmount = kbGetAmountValidResources( mainBaseID, cResourceFood , cAIResourceSubTypeEasy, 90.0  );
      if ( (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
        foodAmount = foodAmount + kbGetAmountValidResources( mainBaseID, cResourceFood , cAIResourceSubTypeHunt, 90.0  );
      }
	  else {
	     foodAmount = foodAmount/2;
	  }
      if ( (kbGetCiv() != cCivIndians) && (kbGetCiv() != cCivSPCIndians) && (kbGetCiv() != cCivJapanese) && (kbGetCiv() != cCivSPCJapanese) && (kbGetCiv() != cCivSPCJapaneseEnemy) ) {
        if(xsGetTime() < 1200000)
		   foodAmount = foodAmount + kbGetAmountValidResources( mainBaseID, cResourceFood , cAIResourceSubTypeHerdable, 60.0  );
      }
      // Subtract mills at 999 each.
      foodAmount = foodAmount - (getUnitCountByLocation(gFarmUnit, cMyID, cUnitStateAlive, loc, 60.0) * 999);
      float percentOnFood = aiGetResourceGathererPercentage( cResourceFood, cRGPActual );
      int numFoodGatherers =  percentOnFood * kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
      if (numFoodGatherers < 1)
         numFoodGatherers = 1;
      int foodPerGatherer = foodAmount / numFoodGatherers;
      
      int woodAmount = kbGetAmountValidResources( mainBaseID, cResourceWood , cAIResourceSubTypeEasy, 60.0  );
      float percentOnWood = aiGetResourceGathererPercentage( cResourceWood, cRGPActual );
      int numWoodGatherers =  percentOnWood * kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
      if (numWoodGatherers < 1)
         numWoodGatherers = 1;
      int woodPerGatherer = woodAmount / numWoodGatherers;
      
      int goldAmount = kbGetAmountValidResources( mainBaseID, cResourceGold , cAIResourceSubTypeEasy, 90.0  );
      // Subtract mills at 999 each.
      goldAmount = goldAmount - (getUnitCountByLocation(gPlantationUnit, cMyID, cUnitStateAlive, loc, 60.0) * 999);
      float percentOnGold = aiGetResourceGathererPercentage( cResourceGold, cRGPActual );
      int numGoldGatherers =  percentOnGold * kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
      if (numGoldGatherers < 1)
         numGoldGatherers = 1;
      int goldPerGatherer = goldAmount / numGoldGatherers;
      
      aiEcho("       Resources:   Food "+foodAmount+", Wood "+woodAmount+", Gold "+goldAmount);
      aiEcho("    Per gatherer:   Food "+foodPerGatherer+", Wood "+woodPerGatherer+", Gold "+goldPerGatherer);
      
      if ( (xsGetTime() > 300000) && (gTimeToFarm == false) && (foodPerGatherer < cMinResourcePerGatherer) ) //120000
      {
         aiEcho("        **** It's time to start farming!");
         gTimeToFarm = true;
      }
	  else if ( (xsGetTime() > 1000000) && (gTimeToFarm == false) )
      {
         aiEcho("        **** It's time to start farming!");
         gTimeToFarm = true;
      }
      
      if ( (gTimeForPlantations == false) && (goldPerGatherer < cMinResourcePerGatherer) )
      {
         aiEcho("        **** It's time to start using plantations!");
         gTimeForPlantations = true;
      }
   }
}



//==============================================================================
/*
   econMaster(int mode, int value)

   Performs top-level economic analysis and direction.   Generally called
   by the econMasterRule, it can be called directly for special-event processing.
   EconMasterRule calls it with default parameters, directing it to do a full
   reanalysis.  
*/
//==============================================================================
void econMaster(int mode=-1, int value=-1)
{
   // Monitor main base supply of food and gold, activate farming and plantations when resources run low
   updateResources();
 
   // Maintain list of possible future econ bases, prioritize them
   updateEconSiteList();   // TODO


   // Evaluate active base status...are all bases still usable?  Adjust if not.
   evaluateBases();        // TODO


   // Update forecasts for economic and military expenses.  Set resource
   // exchange rates.
   updateForecasts();      


   // Set desired gatherer ratios.  Spread them out per base, set per-base 
   // resource breakdowns.
   updateGatherers();
   
   // Update our settler maintain targets, based on age, personality.
   updateSettlerCounts();
   
   // Maintain escrow balance based on age, personality, actual vs. desired settler pop.
   updateEscrows();

}


rule econMasterRulePortal
inactive
group startup
minInterval 2
{
   //if(kbUnitCount(cMyID, cUnitTypeAbstractResourceCrate,cUnitStateAlive) > 0)
   if(xsGetTime() < 50000 && kbUnitCount(cMyID, cUnitTypeAbstractResourceCrate,cUnitStateAlive) > 0 && getUnitCountByLocation(cUnitTypeAbstractResourceCrate, cPlayerRelationAny, cUnitStateABQ, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 20.0) > 0)
      return;
   kbBaseSetMaximumResourceDistance(cMyID, kbBaseGetMainID(cMyID), 90.0);
   econMaster();
   xsDisableSelf();
   xsEnableRule("econMasterRule");
}

//==============================================================================
// rule econMasterRule
/*
   This rule calls the econMaster() function on a regular basis.  The 
   function is separate so that it may be called with a parameter for 
   unscheduled processing based on unexpected events.  
*/
//==============================================================================
rule econMasterRule
inactive
minInterval 60 //30
{
   econMaster();
}









//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// Military
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================


rule delayWalls
inactive
minInterval 11
{

   int tcQuery = getUnitCountByLocation(cUnitTypeTownCenter, cPlayerRelationAlly, cUnitStateABQ, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 50.0);
   if(tcQuery > 1 && kbGetAge() < cAge2){
       xsDisableSelf();
       return;
   }
   if(civIsAsian() == true || cMyCiv == cCivXPAztec){
       xsDisableSelf();
       return;
   }
      
   
   if(xsGetTime() < 150000)
		return;
   //if ( (kbGetPopCap()-kbGetPop()) < 20 )
      //return;
	// Don't start walls until we have pop room
   static int wallPlanID = -1;
   if (wallPlanID < 0 && kbGetCiv() != cCivXPSioux)
   {
      wallPlanID=aiPlanCreate("WallInBase", cPlanBuildWall);
	  aiPlanSetVariableInt(wallPlanID, cBuildWallPlanWallType, 0, cBuildWallPlanWallTypeRing);
      aiPlanAddUnitType(wallPlanID, gEconUnit, 1, 1, 1);
      aiPlanSetVariableVector(wallPlanID, cBuildWallPlanWallRingCenterPoint, 0, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      aiPlanSetVariableFloat(wallPlanID, cBuildWallPlanWallRingRadius, 0, 31.0);
      aiPlanSetVariableInt(wallPlanID, cBuildWallPlanNumberOfGates, 0, 4);
      aiPlanSetBaseID(wallPlanID, kbBaseGetMainID(cMyID));
      aiPlanSetEscrowID(wallPlanID, cEconomyEscrowID);
      aiPlanSetDesiredPriority(wallPlanID, 80);
      aiPlanSetActive(wallPlanID, true);
      sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIWallIn);
      //Enable our wall gap rule, too.
      //xsEnableRule("fillInWallGaps");
      aiEcho("Enabling Wall Plan for Base ID: "+kbBaseGetMainID(cMyID));
   }   
   if(xsGetTime() > 450000){
       xsDisableSelf();
	   aiPlanDestroy(wallPlanID);
	   return;
   }
}


rule turtleUp
inactive
group tcComplete
minInterval 10
{
   // Over 0.5 offense means no walls or towers
   // Under -0.5 means always walls 
   // Intermediate values give linear odds of walling.
   // Number of towers ranges from 1 at 0.5 up to 6 at -1.0
   // Numbers below 0 also encourage shipping towers from the home city
   if ((kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) + kbUnitCount(cMyID, cUnitTypeSettlerWagon, cUnitStateAlive)) < 10)
      return;
   
   if ( (kbGetCiv() == cCivDutch) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateABQ) < 1) )
      return;
   
   float odds = btOffenseDefense * -1.0;  
   odds = odds + 0.5;   // Range -0.5 to +1.5
   int needToRoll = 100.0 * odds;  // Range -50 to +150
   if ( (aiRandInt(100) < needToRoll) && (cvOkToBuildWalls == true) )
   {
      //aiEcho("Decided to do walls.");
      //gBuildWalls = true;
      //xsEnableRule("delayWalls");   // Start walls once we have housing room
   }
   
   if (gNumTowers < 0)
   {  // If it hasn't been defined elsewhere, set defaults
      gNumTowers = ( (btOffenseDefense * -1.0) + 0.5 ) * 5.25; // 7 for extreme rusher, 2 for balanced.
      if (kbGetCivForPlayer(cMyID) == cCivXPAztec)
         gNumTowers = gNumTowers / 2;
   }
   if (cvOkToFortify == false)
      gNumTowers = 0.0;

   aiEcho(" ");
   aiEcho("Planning on making "+gNumTowers+" towers.");
   aiEcho(" ");

   xsEnableRule("towerManager");
   
   xsDisableSelf();
}


/* setUnitPickerPreference()

   Updates the unit picker biases, arbitrates between the potentially conflicting sources.  

   Priority order is:

      1)  If control is from a trigger, that wins.  The unit line specified in gCommandUnitLine gets a +.8, all others +.2
      2)  If control is ally command, ditto.  (Can only be one unit due to UI limits.
      3)  If we're not under command, but cvPrimaryArmyUnit (and optionally cvSecondaryArmyUnit) are set, they rule.
               If just primary, it gets .8 to .2 for other classes.  
               If primary and secondary, they get 1.0 and 0.5, others get 0.0.
      4)  If not under command and no cv's are set, we go with the btBiasCav, btBiasInf and btBiasArt line settings.  

*/

void setUnitPickerPreference(int upID = -1)
{ 
   // Add the main unit lines
   if (upID < 0)
      return;
   
  // Check for commanded unit preferences.
  if ( (gUnitPickSource == cOpportunitySourceTrigger) || (gUnitPickSource == cOpportunitySourceAllyRequest) )
  {  // We have an ally or trigger command, so bias everything for that one unit
    if (cvPrimaryArmyUnit < 0)
       return;     // This should never happen, it should be set when the unitPickSource is set.
    
    kbUnitPickResetAll(gLandUnitPicker);
  
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.2);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractArtillery, 0.2 );
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.2);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractNativeWarrior, 0.2);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCoureur, 0.0);    // Avoid coureurs, they mess up econ/mil calcs.
    if (cMyCiv == cCivXPAztec)
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractLightInfantry, 0.2);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarrior, 0.0);    // Never pick xpWarrior or xpDogSoldier, available via dance only
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpDogSoldier, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMedicineManAztec, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpSkullKnight, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphant, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercIronTroop, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercYojimbo, 0.0);
    
    if ( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) ) {
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSowarMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRajputMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSepoyMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypUrumiMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypZamburakMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphantMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdahMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMahoutMansabdar, 0.0);
      kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSiegeElephantMansabdar, 0.0);
    }
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cvPrimaryArmyUnit, 0.8);
     
    return;
  }
  
  // Check for cv settings
  if ( cvPrimaryArmyUnit >= 0 )
  {
    kbUnitPickResetAll(gLandUnitPicker);
    
    // See if 1 or 2 lines set.  If 1, score 0.8 vs. 0.2.  If 2, score 1.0, 0.5 and 0.0.
    if (cvSecondaryArmyUnit < 0)
    {
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.2);   // Range 0.0 to 1.0
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractArtillery, 0.2 );
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.2);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractNativeWarrior, 0.2);
       if (cMyCiv == cCivXPAztec)
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractLightInfantry, 0.2);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCoureur, 0.0);    // Avoid coureurs, they mess up econ/mil calcs.
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarrior, 0.0);    // Never pick xpWarrior or xpDogSoldier, available via dance only
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpDogSoldier, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMedicineManAztec, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpSkullKnight, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphant, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercIronTroop, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercYojimbo, 0.0);
       
      if ( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) ) {
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSowarMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRajputMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSepoyMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypUrumiMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypZamburakMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphantMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdahMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMahoutMansabdar, 0.0);
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSiegeElephantMansabdar, 0.0);
      }
  
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cvPrimaryArmyUnit, 0.8);
    }
    else
    {
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.0);   // Range 0.0 to 1.0
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractArtillery, 0.0 );
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractNativeWarrior, 0.0);
       if (cMyCiv == cCivXPAztec)
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractLightInfantry, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCoureur, 0.0);    // Avoid coureurs, they mess up econ/mil calcs.  
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarrior, 0.0);    // Never pick xpWarrior or xpDogSoldier, available via dance only
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpDogSoldier, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMedicineManAztec, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpSkullKnight, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphant, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercIronTroop, 0.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercYojimbo, 0.0);
       
        if ( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) ) {
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSowarMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRajputMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSepoyMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypUrumiMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypZamburakMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphantMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdahMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMahoutMansabdar, 0.0);
          kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSiegeElephantMansabdar, 0.0);
        }
  
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cvPrimaryArmyUnit, 1.0);
       kbUnitPickSetPreferenceFactor(gLandUnitPicker, cvSecondaryArmyUnit, 0.5); 
       if ( cvTertiaryArmyUnit >= 0 ) {
        kbUnitPickSetPreferenceFactor(gLandUnitPicker, cvTertiaryArmyUnit, 0.5); 
       }
    }
    return;
  }
  
  // No commands active.  No primary unit set.  Go with our default biases.
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.5 + (btBiasInf / 2.0));   // Range 0.0 to 1.0
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractArtillery, 0.5 + (btBiasArt / 2.0));
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.5 + (btBiasCav / 2.0));
  if (cMyCiv == cCivXPAztec){
     kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractLightInfantry, 0.5 + (btBiasCav / 2.0));
  }
  if (cMyCiv == cCivIndians) { //Elephants are soooo expensive
    //kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMahout, 0.75);
    //kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdah, 0.75);
	if(kbGetAge() > cAge3)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdah, 0.9);
	if(xsGetTime() > 1500000)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.5);
  }
  
  
  float pp=0.0;
  if(cMyCiv == cCivGermans && kbGetAge() == cAge4)
		pp=0.5;
  if (civIsAsian() == false || civIsNative() == false){
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercSwissPikeman, pp);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercLandsknecht, pp);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercJaeger, pp);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercHighlander, pp);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercFusilier, pp);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercBarbaryCorsair, pp);
	
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercRonin, 0.2);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercHackapell, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercGreatCannon, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSaloonOutlawRider, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypWokouWanderingHorseman, 0.0);
  }
  if (cMyCiv == cCivJapanese) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypKensei, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypNaginataRider, 0.75);
  }
  if (cMyCiv == cCivGermans) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeUhlan, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSkirmisher, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeDopplesoldner, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCrossbowman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeWarWagon, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.5);
	
	if(kbUnitCount(cMyID, cUnitTypeBarracks, cUnitStateAlive) < 1)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.0);
	if(kbUnitCount(cMyID, cUnitTypeStable, cUnitStateAlive) < 1)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.0);
  }
  if (cMyCiv == cCivDutch) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHalberdier, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSkirmisher, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeRuyter, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.75);
  }
  if (cMyCiv == cCivBritish) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMusketeer, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeDragoon, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.25);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeLongbowman, 0.25);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.5);
  }
  if (cMyCiv == cCivFrench) {
	if (kbGetAge() > cAge3)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCuirassier, 0.9);
	else
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCuirassier, 0.75);
	//kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCuirassier, 0.9);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSkirmisher, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMusketeer, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCrossbowman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHalberdier, 0.1);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeDragoon, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.75);
  }
  if (cMyCiv == cCivSpanish) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeRodelero, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSkirmisher, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMusketeer, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCrossbowman, 0.5);
	if (kbGetAge() > cAge3)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.5);
	else
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.25);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeDragoon, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeLancer, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.75);
  }
  if (cMyCiv == cCivPortuguese) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCrossbowman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeDragoon, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMusketeer, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCacadore, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeOrganGun, 0.5);
  }
  if (cMyCiv == cCivRussians) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeStrelet, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMusketeer, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHalberdier, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCossack, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCavalryArcher, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeOprichnik, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.5);
  }
  if (cMyCiv == cCivOttomans) {
	if (kbGetAge() > cAge2)
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbusGun, 0.5);
	else
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbusGun, 0.0);
	//kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbusGun, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeJanissary, 0.9);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeHussar, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCavalryArcher, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseArtillery, 0.5);
  }
  if (cMyCiv == cCivXPSioux) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpCoupRider, 0.25);
	if(xsGetTime() > 1500000)
	{
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarClub, 0.75);
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarBow, 0.75);
	}
	else if(kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 2)
	{
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarClub, 0.0);
	   kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarBow, 0.0);
	}
  }
  if (cMyCiv == cCivXPIroquois) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpHorseman, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpTomahawk, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMantlet, 0.75);
  }
  if (cMyCiv == cCivXPAztec) {
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpCoyoteMan, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMacehualtin, 0.75);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpEagleKnight, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpJaguarKnight, 0.0);
  }
  
  if ((cMyCiv == cCivPortuguese || cMyCiv == cCivDutch || cMyCiv == cCivGermans) && kbGetAge() > cAge2)
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypePikeman, 0.25);
  
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractNativeWarrior, 0.5 + (btBiasNative / 2.0));
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeCoureur, 0.0);    // Avoid coureurs, they mess up econ/mil calcs.   
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpWarrior, 0.0);    // Never pick xpWarrior or xpDogSoldier, available via dance only
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpDogSoldier, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpMedicineManAztec, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpSkullKnight, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphant, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercIronTroop, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercYojimbo, 0.0);
  kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypexpSpy, 0.0);

  if ( (kbGetCiv() == cCivChinese) || (kbGetCiv() == cCivSPCChinese) ) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractInfantry, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractCavalry, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractArtillery, 0.0);
    
    //kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractBannerArmy, 1.0);   // Banner Armies
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypStandardArmy, 0.25);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMingArmy, 0.25);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypImperialArmy, 0.25);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypTerritorialArmy, 0.25);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypOldHanArmy, 0.75);   // Range 0.0 to 1.0
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypForbiddenArmy, 0.75);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypBlackFlagArmy, 0.1);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMongolianArmy, 0.1);
        
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypFlameThrower, 0.5);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHandMortar, 0.5);
  }
  
  if ( (kbGetCiv() == cCivIndians) || (kbGetCiv() == cCivSPCIndians) ) {
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSowarMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRajputMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSepoyMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypUrumiMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypZamburakMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMercFlailiphantMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypHowdahMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypMahoutMansabdar, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypSiegeElephantMansabdar, 0.0);
	kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypNatMercGurkhaJemadar, 0.0);
  }
  
  if (civIsAsian() == true) { // Asians need to stop trying to build saloon units
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSaloonOutlawPistol, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSaloonOutlawRider, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSaloonOutlawRifleman, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeSaloonPirate, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercBarbaryCorsair, 0.0);
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercBlackRider, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercElmeti, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercFusilier, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercGreatCannon, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercHackapell, 0.0);
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercHighlander, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercJaeger, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercLandsknecht, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercMameluke, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercManchu, 0.0);
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercRonin, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercStradiot, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeMercSwissPikeman, 0.0);
    
    //and consulate units
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractConsulateSiegeFortress, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractConsulateSiegeIndustrial, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractConsulateUnit, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractConsulateUnitColonial, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeAbstractWokou, 0.0);
    
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantArsonist, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantBarbaryCorsair, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantBlackRider, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantBlindMonk, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantDacoit, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantElmeti, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantFusilier, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantGreatCannon, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantHackapell, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantHighlander, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantIronTroop, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantJaeger, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantJatLancer, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantLandsknecht, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantMameluke, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantManchu, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantNinja, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantOutlawPistol, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantOutlawRider, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantOutlawRifleman, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantPirate, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantRonin, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantSmuggler, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantStradiot, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantSwissPikeman, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantThuggee, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantWanderingHorseman, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantWaywardRonin, 0.0);
    kbUnitPickSetPreferenceFactor(gLandUnitPicker, cUnitTypeypRepentantYojimbo, 0.0);
    
    setConsulateArmyPreference();
  }
}

//==============================================================================
// initUnitPicker
//==============================================================================
int initUnitPicker(string name="BUG", int numberTypes=1, int minUnits=10,
   int maxUnits=20, int minPop=-1, int maxPop=-1, int numberBuildings=1,
   bool guessEnemyUnitType=false)
{   
   //Create it.
   int upID=kbUnitPickCreate(name);
   if (upID < 0)
      return(-1);

   //Default init.
   kbUnitPickResetAll(upID);

   kbUnitPickSetPreferenceWeight(upID, 1.0);
   if (gSPC == false)
      kbUnitPickSetCombatEfficiencyWeight(upID, 2.0);    // Changed from 1.0 to dilute the power of the preference weight.
   else
      kbUnitPickSetCombatEfficiencyWeight(upID, 1.0);    // Leave it at 1.0 to avoid messing up SPC balance
      
   kbUnitPickSetCostWeight(upID, 0.0);
   //Desired number units types, buildings.
   kbUnitPickSetDesiredNumberUnitTypes(upID, numberTypes, numberBuildings, true);
   //Min/Max units and Min/Max pop.
   kbUnitPickSetMinimumNumberUnits(upID, minUnits);   // Sets "need" level on attack plans
   kbUnitPickSetMaximumNumberUnits(upID, maxUnits);   // Sets "max" level on attack plans, sets "numberToMaintain" on train plans for primary unit,
                                                      // half that for secondary, 1/4 for tertiary, etc.
   kbUnitPickSetMinimumPop(upID, minPop); // Not sure what this does...
   kbUnitPickSetMaximumPop(upID, maxPop); // If set, overrides maxNumberUnits for how many of the primary unit to maintain.
   
   //Default to land units.
   kbUnitPickSetEnemyPlayerID(upID, aiGetMostHatedPlayerID());
   kbUnitPickSetAttackUnitType(upID, cUnitTypeLogicalTypeLandMilitary);
   kbUnitPickSetGoalCombatEfficiencyType(upID, cUnitTypeLogicalTypeLandMilitary);
   
   // Set the default target types and weights, for use until we've seen enough actual units.
//   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypeLogicalTypeLandMilitary, 1.0);
   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypeSettler, 0.2);   // We need to build units that can kill settlers efficiently.
   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypeHussar, 0.2);    // Major component
   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypeMusketeer, 0.4); // Bigger component  
   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypePikeman, 0.1);   // Minor component
   kbUnitPickAddCombatEfficiencyType(upID, cUnitTypeCrossbowman, 0.1);   // Minor component
  
   setUnitPickerPreference(upID);  // Set generic preferences for this civ
   
   xsEnableRule("artilleryMonitor");
   xsEnableRule("nativeMonitor");

   //Done.
   return(upID);
}



//==============================================================================
/*
   nativeMonitor
   
   Make and update maintain plans for native warriors
   since they don't show up often 
*/
//==============================================================================
rule nativeMonitor
inactive
minInterval 30
{
   
xsDisableSelf();
return;
   
   static int nativePlan = -1;
   
   if (nativePlan < 0)
      nativePlan = createSimpleMaintainPlan(cUnitTypeAbstractNativeWarrior, 0, false, kbBaseGetMainID(cMyID));
   
   int nativeQuery = kbVPSiteQuery(cVPNative, cMyID, cVPStateCompleted);
   int nativeSiteCount = xsArrayGetSize(nativeQuery);
   float nativeTarget = nativeSiteCount * 0.1 * aiGetMilitaryPop();  // 10% of mil pop per native site.
   int nativeInt = -1;
   
   if (btBiasNative > 0.0) 
      nativeTarget = nativeTarget * (1.0 + btBiasNative); // 0.0 gives no change, 1.0 max doubles it.
   else
      nativeTarget = nativeTarget * (1.0 + (btBiasNative/2.0)); // 0.0 gives no change, -1.0 min cuts pop in half
   nativeInt = nativeTarget;
   
   aiPlanSetVariableInt(nativePlan, cTrainPlanNumberToMaintain, 0, nativeInt );    // 20% of military pop
   
   static int oldTarget = -1;
   if (oldTarget != nativeInt)
      aiEcho("    Changing native maintain plan from "+oldTarget+" units to "+nativeInt+" units");
   
   oldTarget = nativeInt;   
}



//==============================================================================
/*
   moveDefenseReflex(vector, radius, baseID)
   
   Move the defend and reserve plans to the specified location
   Sets the gLandDefendPlan0 to a high pop count, so it steals units from the reserve plan,
   which will signal the AI to not start new attacks as no reserves are available.
*/
//==============================================================================
void moveDefenseReflex(vector location=cInvalidVector, float radius=-1.0, int baseID=-1)
{
   if (radius < 0.0)
      radius = cvDefenseReflexRadiusActive;
   if (location != cInvalidVector)
   {
      aiPlanSetVariableVector(gLandDefendPlan0, cDefendPlanDefendPoint, 0, location);
      aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanEngageRange, 0, radius);  
      aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanGatherDistance, 0, radius - 10.0);
      aiPlanAddUnitType(gLandDefendPlan0, cUnitTypeLogicalTypeLandMilitary, 0, 0, 200);
      
      aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, location);
      aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanEngageRange, 0, radius);    
      aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanGatherDistance, 0, radius - 10.0);
      aiPlanAddUnitType(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary, 0, 0, 1);
      
      gDefenseReflex = true;
      gDefenseReflexBaseID = baseID;
      gDefenseReflexLocation = location;
      gDefenseReflexStartTime = xsGetTime();
      gDefenseReflexPaused = false;
   }
   aiEcho("******** Defense reflex moved to base "+baseID+" with radius "+radius+" and location "+location);
}

//==============================================================================
/*
   pauseDefenseReflex()
   
   The base (gDefenseReflexBaseID) is still under attack, but we don't have enough
   forces to engage.  Retreat to main base, set a small radius, and wait until we 
   have enough troops to re-engage through a moveDefenseReflex() call.
   Sets gLandDefendPlan0 to high troop count to keep reserve plan empty.
   Leaves the base ID and location untouched, even though units will gather at home.
*/
//==============================================================================
void pauseDefenseReflex(void)
{
   vector loc = kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID));
   if ( gForwardBaseState != cForwardBaseStateNone )
      loc = gForwardBaseLocation;
   
   aiPlanSetVariableVector(gLandDefendPlan0, cDefendPlanDefendPoint, 0, loc);  
   aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanEngageRange, 0, cvDefenseReflexRadiusPassive);   
   aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanGatherDistance, 0, cvDefenseReflexRadiusPassive - 10.0);
   
   aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, loc);
   aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanEngageRange, 0, cvDefenseReflexRadiusPassive);    
   aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanGatherDistance, 0, cvDefenseReflexRadiusPassive - 10.0);   
   
   aiPlanAddUnitType(gLandDefendPlan0, cUnitTypeLogicalTypeLandMilitary, 0, 0, 200);
   aiPlanAddUnitType(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary, 0, 0, 1);

   
   gDefenseReflexPaused = true;
   
   aiEcho("******** Defense reflex paused.");
}

//==============================================================================
/*
   endDefenseReflex()
   
   Move the defend and reserve plans to their default positions
*/
//==============================================================================
void endDefenseReflex(void)
{
   vector resLoc = kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID));
   vector defLoc = kbBaseGetLocation(cMyID,kbBaseGetMainID(cMyID));
   if ( gForwardBaseState != cForwardBaseStateNone )
   {
      resLoc = gForwardBaseLocation;
      defLoc = gForwardBaseLocation;
   }
   aiPlanSetVariableVector(gLandDefendPlan0, cDefendPlanDefendPoint, 0, defLoc);  // Main base or forward base (if forward base exists)
   aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanEngageRange, 0, cvDefenseReflexRadiusActive);  
   aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanGatherDistance, 0, cvDefenseReflexRadiusActive - 10.0);
   aiPlanAddUnitType(gLandDefendPlan0, cUnitTypeLogicalTypeLandMilitary, 0, 0, 1);     // Defend plan will use 1 unit to defend against stray snipers, etc.
   
   aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, resLoc);  
   aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanEngageRange, 0, cvDefenseReflexRadiusPassive);   // Small radius
   aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanGatherDistance, 0, cvDefenseReflexRadiusPassive - 10.0);
   aiPlanAddUnitType(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary, 0, 0, 200);   // All unused troops
   
   aiEcho("******** Defense reflex terminated for base "+gDefenseReflexBaseID+" at location "+gDefenseReflexLocation);
   aiEcho("******** Returning to "+resLoc);
   aiEcho(" Forward base ID is "+gForwardBaseID+", location is "+gForwardBaseLocation);
   
   gDefenseReflex = false;
   gDefenseReflexPaused = false;
   gDefenseReflexBaseID = -1;
   gDefenseReflexLocation = cInvalidVector;
   gDefenseReflexStartTime = -1;
}

rule endDefenseReflexDelay    // Use this instead of calling endDefenseReflex in the createMainBase function, so that the new BaseID will be available.
inactive
minInterval 1
{
   xsDisableSelf();
   endDefenseReflex();
}


int baseBuildingCount(int baseID = -1)
{
   int retVal = -1;
   
   if (baseID >= 0)  // Check for buildings in the base, regardless of player ID (only baseOwner can have buildings there)
      retVal = kbBaseGetNumberUnits(kbBaseGetOwner(baseID), baseID, cPlayerRelationAny, cUnitTypeBuilding);
   
   
   return(retVal);
}


//==============================================================================
// mostHatedEnemy
// Determine who we should attack, checking control variables
//==============================================================================
rule mostHatedEnemy
minInterval 15
active
{
   if ( (cvPlayerToAttack > 0) && (kbHasPlayerLost(cvPlayerToAttack) == false) )
   {
      aiEcho("****  Changing most hated enemy from "+aiGetMostHatedPlayerID()+" to "+cvPlayerToAttack);
      aiSetMostHatedPlayerID(cvPlayerToAttack);
      return;
   }
   
   // For now, find your position in your team (i.e. 2nd of 3) and
   // target the corresponding player on the other team.  If the other
   // team is smaller, count through again.  (I.e. in a 5v2, player 5 on
   // one team will attack the 1st player on the other.)

   int ourTeamSize = 0;
   int theirTeamSize = 0;
   int myPosition = 0;
   int i=0;
   
   for (i=1; <cNumberPlayers)
   {
      if (kbHasPlayerLost(i) == false)
      {
         if ( kbGetPlayerTeam(i) == kbGetPlayerTeam(cMyID) )
         {  // Self or ally 
            ourTeamSize = ourTeamSize + 1;
            if ( i == cMyID )
               myPosition = ourTeamSize;   
         }
         else
         {
            theirTeamSize = theirTeamSize + 1;
         }
      }
   }
   int targetPlayerPosition = 0;
   
   if (myPosition > theirTeamSize)
   {
      targetPlayerPosition = myPosition - (theirTeamSize * (myPosition/theirTeamSize));      // myPosition modulo theirTeamSize
      if (targetPlayerPosition == 0)
         targetPlayerPosition = theirTeamSize;  // Need to be in range 1...teamsize, not 0...(teamSize-1).
   }
   else
      targetPlayerPosition = myPosition;
   
   int playerCount = 0;
   // Find the corresponding enemy player
   for (i=1; <cNumberPlayers)
   {
      if ( (kbHasPlayerLost(i) == false) && (kbGetPlayerTeam(i) != kbGetPlayerTeam(cMyID) ) )
      {
         playerCount = playerCount + 1;
         if (playerCount == targetPlayerPosition)
         { 
            if (aiGetMostHatedPlayerID() != i)
               aiEcho("****  Changing most hated enemy from "+aiGetMostHatedPlayerID()+" to "+i);
            aiSetMostHatedPlayerID(i);
            if (gLandUnitPicker >= 0)
               kbUnitPickSetEnemyPlayerID(gLandUnitPicker, i); // Update the unit picker
         }
      }
   }
}



//==============================================================================
// initMil
//==============================================================================
void initMil(void)
{
   aiSetAttackResponseDistance(65.0);

   // Choose a most-hated player
   xsEnableRule("mostHatedEnemy");

   // Call it immediately
	mostHatedEnemy();   

   //Auto gather our military units.
   aiSetAutoGatherMilitaryUnits(true);
}






//==============================================================================
/* Defend0

   Create a defend plan, protect the main base.
*/
//==============================================================================
rule defend0
inactive
group startup
minInterval 13
{  
   
   if (gLandDefendPlan0 < 0)
   {
      gLandDefendPlan0 = aiPlanCreate("Primary Land Defend", cPlanDefend);
      aiPlanAddUnitType(gLandDefendPlan0, cUnitTypeLogicalTypeLandMilitary , 0, 0, 1);    // Small, until defense reflex
      
      aiPlanSetVariableVector(gLandDefendPlan0, cDefendPlanDefendPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID)));
      aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanEngageRange, 0, cvDefenseReflexRadiusActive);  
      aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanGatherDistance, 0, cvDefenseReflexRadiusActive - 10.0);
      aiPlanSetVariableBool(gLandDefendPlan0, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(gLandDefendPlan0, cDefendPlanGatherDistance, 0, 20.0);
      aiPlanSetInitialPosition(gLandDefendPlan0, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      aiPlanSetUnitStance(gLandDefendPlan0, cUnitStanceDefensive);
      aiPlanSetVariableInt(gLandDefendPlan0, cDefendPlanRefreshFrequency, 0, 5);
      aiPlanSetVariableInt(gLandDefendPlan0, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
      aiPlanSetDesiredPriority(gLandDefendPlan0, 10);    // Very low priority, don't steal from attack plans
      aiPlanSetActive(gLandDefendPlan0); 
      aiEcho("Creating primary land defend plan");

      gLandReservePlan = aiPlanCreate("Land Reserve Units", cPlanDefend);
      aiPlanAddUnitType(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary , 0, 5, 200);    // All mil units, high MAX value to suck up all excess
      
      aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID)));
      if(kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID)) == cInvalidVector)
         if (getUnit(cUnitTypeAIStart, cMyID) >= 0)   // If no mil gather point, but there is a start block, use it.
            aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, kbUnitGetPosition(getUnit(cUnitTypeAIStart, cMyID)));
      if (aiPlanGetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0) == cInvalidVector) // If all else failed, use main base location.
         aiPlanSetVariableVector(gLandReservePlan, cDefendPlanDefendPoint, 0, kbBaseGetLocation(kbBaseGetMainID(cMyID)));
      aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanEngageRange, 0, 60.0);    // Loose
      aiPlanSetVariableBool(gLandReservePlan, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(gLandReservePlan, cDefendPlanGatherDistance, 0, 20.0);
      aiPlanSetInitialPosition(gLandReservePlan, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      aiPlanSetUnitStance(gLandReservePlan, cUnitStanceDefensive);
      aiPlanSetVariableInt(gLandReservePlan, cDefendPlanRefreshFrequency, 0, 5);
      aiPlanSetVariableInt(gLandReservePlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
      aiPlanSetDesiredPriority(gLandReservePlan, 5);    // Very very low priority, gather unused units.
      aiPlanSetActive(gLandReservePlan); 
      if (gMainAttackGoal >= 0)
         aiPlanSetVariableInt(gMainAttackGoal, cGoalPlanReservePlanID, 0, gLandReservePlan);
      aiEcho("Creating reserve plan");
   xsEnableRule("endDefenseReflexDelay"); // Reset to relaxed stances after plans have a second to be created.
   }
}






//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// General strategy (spans econ/mil)
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================






//==============================================================================
/* getActiveMissionCount(int missionType)
   
   Returns the number of active missions that match the optional type.  If no types
   is given, returns the total number of missions.
*/
//==============================================================================
/*int getActiveMissionCount(int missionType=-1)
{
   int retVal = 0;
   
   int missionCount = 0;
   int missionIndex = 0;
   int missionID = -1;
   
   for (missionIndex = 0; < aiPlanGetNumber(cPlanMission, -1, true))    // Step through all mission plans.  -1 means any state is OK.
   {
      missionID = aiPlanGetIDByIndex(cPlanMission, -1, true, missionIndex);
      if ( (missionType == -1) || (aiPlanGetVariableInt(missionID, cMissionPlanType, 0) == missionType) )   // No type specified, or type matches
         retVal = retVal + 1;
   }      
   
   return(retVal);
}*/


void setMilPopLimit(int age1=10, int age2=30, int age3=80, int age4=120, int age5=130)
{
   int limit = 10;
   int age = kbGetAge();
   if (age == cvMaxAge)
      age = cAge5;   // If we're at the highest allowed age, go for our full mil pop.
      // This overrides the normal settings, so an SPC AI capped at age 3 can use his full
      // military pop.
   switch(age)
   {
      case cAge1:
      {
         limit = age1;
         break;
      }
      case cAge2:
      {
         limit = age2;
         break;
      }
      case cAge3:
      {
         limit = age3;
         break;
      }
      case cAge4:
      {
         limit = age4;
         break;
      }
      case cAge5:
      {
         limit = age5;
         break;
      }
   }
   if ( (cvMaxArmyPop >= 0) && (cvMaxNavyPop >= 0) && (limit > (cvMaxArmyPop + cvMaxNavyPop)) )
      limit = cvMaxArmyPop+cvMaxNavyPop;     // Manual pop limits have been set
   
   if ( (cvMaxNavyPop <= 0) && (cvMaxArmyPop < limit) && (cvMaxArmyPop >= 0) )  // Only army pop set?
      limit = cvMaxArmyPop;
   
   aiSetMilitaryPop(limit);
}


//==============================================================================
/* rule popManager
   
   Set population limits based on age, difficulty and control variable settings
*/
//==============================================================================
rule popManager
active
minInterval 15
{
   float difficulty = aiGetWorldDifficulty();
   int intDifficulty = difficulty;
   int cvPopLimit = 200;      // Used to calculate implied total pop limit based on civ, army and navy components.
   
   if ( (cvMaxCivPop >= 0) && (cvMaxArmyPop >= 0) && (cvMaxNavyPop >= 0) )    // All three are defined, so set a hard total
      cvPopLimit = cvMaxCivPop + cvMaxArmyPop + cvMaxNavyPop;
   
   int maxMil = -1;  // The full age-5 max military size...to be reduced in earlier ages to control runaway spending.

   switch(intDifficulty)
   {
		case cDifficultySandbox: // Sandbox
		{  // Typically 20 econ, 20 mil
			gMaxPop = 40 + (30 * (difficulty - intDifficulty));     // Interpolate between integers
         if (gMaxPop > cvPopLimit)
            gMaxPop = cvPopLimit;
         aiSetEconomyPop(20);
         if ( (aiGetEconomyPop() > cvMaxCivPop) && (cvMaxCivPop >= 0) )
            aiSetEconomyPop(cvMaxCivPop);
         maxMil = gMaxPop - aiGetEconomyPop();
         setMilPopLimit(maxMil/8, maxMil/4, maxMil/2, maxMil, maxMil);
			break;
		}
		case cDifficultyEasy: // Easiest
		{  // Typically 35 econ, 35 mil.
			gMaxPop = 70 + (50 * (difficulty - intDifficulty));      // 70 at easy up to 120 at moderate
         if (gMaxPop > cvPopLimit)
            gMaxPop = cvPopLimit;
         aiSetEconomyPop(35);
         if (gSPC == true)
         {
            aiSetEconomyPop(25);
            gMaxPop = 55;
         }
         if ( (aiGetEconomyPop() > cvMaxCivPop) && (cvMaxCivPop >= 0) )
            aiSetEconomyPop(cvMaxCivPop);
         maxMil = gMaxPop - aiGetEconomyPop();
         setMilPopLimit(maxMil/8, maxMil/4, maxMil/2, maxMil, maxMil);
			break;
		}
		case cDifficultyModerate: // Moderate
		{  // Typically 60 econ, 60 mil
			gMaxPop = 120 + (80 * (difficulty - intDifficulty));      // 120 at moderate up to 200 at hard
         if (gMaxPop > cvPopLimit)
            gMaxPop = cvPopLimit;
         aiSetEconomyPop(60);
         if (gSPC == true)
         {
            aiSetEconomyPop(45);
            gMaxPop = 105;
         }
         if ( (aiGetEconomyPop() > cvMaxCivPop) && (cvMaxCivPop >= 0) )
            aiSetEconomyPop(cvMaxCivPop);
         maxMil = gMaxPop - aiGetEconomyPop();
         setMilPopLimit(maxMil/8, maxMil/4, maxMil/2, maxMil, maxMil);
			break;
		}
		case cDifficultyHard: // Hard
		{  // Typically 80 econ, 120 mil.
         gMaxPop = 200;
         if (gMaxPop > cvPopLimit)
            gMaxPop = cvPopLimit;
         aiSetEconomyPop(80 - (10 * (difficulty -  intDifficulty)));    // 80 at hard, down to 70 at hardest
         if (gSPC == true)
         {
            aiSetEconomyPop(65);
            gMaxPop = 185;
         }
         if ( (aiGetEconomyPop() > cvMaxCivPop) && (cvMaxCivPop >= 0) )
            aiSetEconomyPop(cvMaxCivPop);
         maxMil = gMaxPop - aiGetEconomyPop();
         setMilPopLimit(maxMil/4, maxMil/2, maxMil/2, maxMil, maxMil);
			break;
		}
		case cDifficultyExpert: // Expert
		{  // Typically 70 econ, 130 mil.
         gMaxPop = 200;
         if (gMaxPop > cvPopLimit)
            gMaxPop = cvPopLimit;
         aiSetEconomyPop(70);
         if ( (aiGetEconomyPop() > cvMaxCivPop) && (cvMaxCivPop >= 0) )
            aiSetEconomyPop(cvMaxCivPop);
         maxMil = gMaxPop - aiGetEconomyPop();
		 if(cMyCiv == cCivChinese)
		    maxMil = maxMil+10;
		 else if(cMyCiv == cCivDutch)
		    maxMil = maxMil+20;
		 
         if(cMyCiv == cCivOttomans || cMyCiv == cCivChinese)
		    setMilPopLimit(maxMil/4, maxMil/2, (maxMil*2)/3, maxMil, maxMil);
		 else if(cMyCiv == cCivXPSioux)
		    setMilPopLimit(maxMil/4, maxMil, maxMil, maxMil, maxMil);
		 else
		    setMilPopLimit(maxMil/4, maxMil/2, maxMil, maxMil, maxMil);
			break;
		}
   }
   
   gGoodArmyPop = aiGetMilitaryPop() / 3;
   //if ( (kbGetAge() == cAge2) && ((xsGetTime() - gAgeUpTime) < 300000) )   // In the first five minutes of age 2, go with tiny armies.
   //   gGoodArmyPop = gGoodArmyPop / 2;

   /*
   aiEcho(" ");
   aiEcho("Population tests:");
   aiEcho("  aiGetEconomyPop() "+ aiGetEconomyPop());
   aiEcho("  aiGetMilitaryPop() "+ aiGetMilitaryPop());
   aiEcho("  aiGetCurrentEconomyPop() "+ aiGetCurrentEconomyPop());
   aiEcho("  aiGetAvailableEconomyPop() "+ aiGetAvailableEconomyPop());
   aiEcho("  aiGetAvailableMilitaryPop() "+ aiGetAvailableMilitaryPop());
   aiEcho("  kbGetPopCap() "+ kbGetPopCap());
   aiEcho("  kbGetPop() "+ kbGetPop());
   aiEcho(" ");
   */
}



//==============================================================================
/* townCenterComplete
   
   Wait until the town center is complete, then build other stuff next to it.
   In a start with a TC, this will fire very quickly.
   In a scenario with no TC, we do the best we can.

*/
//==============================================================================
rule townCenterComplete
inactive
minInterval 2
{
   // First, create a query if needed, then use it to look for a completed town center
   static int townCenterQuery = -1;
   if (townCenterQuery < 0)
   {
      townCenterQuery=kbUnitQueryCreate("Completed Town Center Query");
      kbUnitQuerySetIgnoreKnockedOutUnits(townCenterQuery, true);
      if (townCenterQuery < 0)
         aiEcho("****  Query create failed in townCenterComplete.");
	   //Define the query
	   if (townCenterQuery != -1)
	   {
		   kbUnitQuerySetPlayerID(townCenterQuery, cMyID);
         kbUnitQuerySetUnitType(townCenterQuery, cUnitTypeTownCenter);
         kbUnitQuerySetState(townCenterQuery, cUnitStateAlive);
	   }
   }

   // Run the query
   kbUnitQueryResetResults(townCenterQuery);
   int count = kbUnitQueryExecute(townCenterQuery);

   //-- If our startmode is one without a TC, wait until a TC is found.
	if ((count < 1) && (gStartMode != cStartModeScenarioNoTC) )
      return;
   
   int tcID = kbUnitQueryGetResult(townCenterQuery, 0);
   aiEcho("New TC is "+tcID+" at "+kbUnitGetPosition(tcID));
   

   if (tcID >= 0)
   {
      int tcBase = kbUnitGetBaseID(tcID);
      gMainBase = kbBaseGetMainID(cMyID);
      aiEcho(" TC base is "+tcBase+", main base is "+gMainBase);
      // We have a TC.  Make sure that the main base exists, and it includes the TC
      if ( gMainBase < 0 )
      {  // We have no main base, create one
         gMainBase = createMainBase(kbUnitGetPosition(tcID));
         aiEcho(" We had no main base, so we created one: "+gMainBase);
      }
      tcBase = kbUnitGetBaseID(tcID);  // in case base ID just changed
      if ( tcBase != gMainBase ) 
      {
         aiEcho(" TC "+tcID+" is not in the main base ("+gMainBase+".");
         aiEcho(" Setting base "+gMainBase+" to non-main, setting base "+tcBase+" to main.");
         kbBaseSetMain(cMyID, gMainBase, false);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeEasy, gMainBase);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHunt, gMainBase);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHerdable, gMainBase);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeHuntAggressive, gMainBase);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeFish, gMainBase);
         aiRemoveResourceBreakdown(cResourceFood, cAIResourceSubTypeFarm, gMainBase);
         aiRemoveResourceBreakdown(cResourceWood, cAIResourceSubTypeEasy, gMainBase);
         aiRemoveResourceBreakdown(cResourceGold, cAIResourceSubTypeEasy, gMainBase);
         kbBaseSetMain(cMyID, tcBase, true);
         gMainBase = tcBase;
      }
   }
   else
   {
      aiEcho("No TC, leaving main base as it is.");
   }
   
   kbBaseSetMaximumResourceDistance(cMyID, kbBaseGetMainID(cMyID), 0.0);

   
   // Set up the escrows
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceFood, .70);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceWood, .50);   
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceGold, .30);
   kbEscrowSetPercentage(cEconomyEscrowID, cResourceShips, 0.0);
   kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 200);
   kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 200);
   if (kbGetCiv() == cCivDutch)
   {
      kbEscrowSetCap(cEconomyEscrowID, cResourceFood, 350); // Needed for banks
      kbEscrowSetCap(cEconomyEscrowID, cResourceWood, 350);
   }
   kbEscrowSetCap(cEconomyEscrowID, cResourceGold, 200);
   
   
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceFood, .0);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceWood, .0);  
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceGold, .0);
   kbEscrowSetPercentage(cMilitaryEscrowID, cResourceShips, 0.0);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceFood, 300);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceWood, 300);
   kbEscrowSetCap(cMilitaryEscrowID, cResourceGold, 300);
    
   kbEscrowCreate("VP Site", cResourceFood, .25, cRootEscrowID);     // Add an accelerator escrow
   gVPEscrowID = kbEscrowGetID("VP Site");   
   
   kbEscrowSetPercentage(gVPEscrowID, cResourceFood, 0.0);        
   kbEscrowSetPercentage(gVPEscrowID, cResourceWood, 0.0);        
   kbEscrowSetPercentage(gVPEscrowID, cResourceGold, 0.0);
   kbEscrowSetPercentage(gVPEscrowID, cResourceShips, 0.0);
   kbEscrowSetCap(gVPEscrowID, cResourceFood, 0);
   kbEscrowSetCap(gVPEscrowID, cResourceWood, 300);
   kbEscrowSetCap(gVPEscrowID, cResourceGold, 300);
   
   kbEscrowCreate("Age Upgrade", cResourceShips, 0.0, cRootEscrowID);     // Add an upgrade escrow
   gUpgradeEscrowID = kbEscrowGetID("Age Upgrade");    
   
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceFood, 0.0);        
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceWood, 0.0);        
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceGold, 0.0);
   kbEscrowSetPercentage(gUpgradeEscrowID, cResourceShips, 0.0);
   kbEscrowSetCap(gUpgradeEscrowID, cResourceFood, 0.0);
   kbEscrowSetCap(gUpgradeEscrowID, cResourceWood, 0.0);
   kbEscrowSetCap(gUpgradeEscrowID, cResourceGold, 0.0);

   kbEscrowAllocateCurrentResources();


  
   // Town center found, start building the other buildings
   xsDisableSelf();
   xsEnableRuleGroup("tcComplete");
   if (kbGetCiv() == cCivJapanese) {
      xsEnableRule("consulateMonitor");  // start checking for a consulate
    }

   if (kbGetCiv() == cCivOttomans)
      xsEnableRule("ottomanMonitor");

   
//   gSettlerMaintainPlan = createSimpleMaintainPlan(gEconUnit, 25 - (13.0*btRushBoom), true, kbBaseGetMainID(cMyID), 1);  // Good through age 2
   gSettlerMaintainPlan = createSimpleMaintainPlan(gEconUnit, xsArrayGetInt(gTargetSettlerCounts, kbGetAge()), true, kbBaseGetMainID(cMyID), 1);
   
   if (kbGetCiv() == cCivOttomans)
      aiPlanSetVariableInt(gSettlerMaintainPlan, cTrainPlanNumberToMaintain, 0, 0); // To not throw off resource planning
      
  if ( (kbGetCiv() == cCivJapanese) || (kbGetCiv() == cCivSPCJapanese) || (kbGetCiv() == cCivSPCJapaneseEnemy) ) {
    if (kbUnitCount(cMyID, cUnitTypeypBerryBuilding, cUnitStateAlive) < 1) {
      createSimpleBuildPlan(cUnitTypeypBerryBuilding, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      createSimpleBuildPlan(cUnitTypeypBerryBuilding, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
    }
  }
   
   if ( gWaterMap == true )
      gWaterTransportUnitMaintainPlan = createSimpleMaintainPlan(gCaravelUnit, 1, true, kbBaseGetMainID(cMyID), 1);

   if (aiGetGameMode() == cGameModeDeathmatch)
      deathMatchSetup();   // Add a bunch of custom stuff for a DM jump-start.
      
   if (kbUnitCount(cMyID, cUnitTypeypDaimyoRegicide, cUnitStateAlive) > 0)   
      xsEnableRule("regicideMonitor");
      
   if (cRandomMapName=="Honshu" || cRandomMapName=="HonshuRegicide")  {
     createSimpleBuildPlan(gDockUnit, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
     xsEnableRule("navyManager");
    }
    if (cRandomMapName=="Ceylon")  {
     xsEnableRule("navyManager");
    }
}

rule useFactoryWagons
inactive
minInterval 20
{
   int wagon = getUnit(cUnitTypeFactoryWagon, cMyID, cUnitStateAlive);
   
   // Check if we have a factory wagon, but no factory build plan....
   if ( (wagon >= 0) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeFactory) < 0) )
   {
      int planID = createSimpleBuildPlan(cUnitTypeFactory, 1, 50, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 0); //No settler builders
      aiPlanAddUnitType(planID, cUnitTypeFactoryWagon, 1, 1, 1);
	  if(cMyCiv == cCivChinese){
	     xsEnableRule("getMass");
		 return;
	  }
	  else if(cMyCiv == cCivBritish || cMyCiv == cCivGermans){
	     xsEnableRule("getMass");
		 xsEnableRule("getSteamPower");
		 return;
	  }
      xsEnableRule("getSteamPower");
	  xsEnableRule("getWaterPower");
   }
}

rule getSteamPower
inactive
minInterval 30
{
   if (kbTechGetStatus(cTechFactorySteamPower) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1200000)
      return;
   int factory = getUnit(cUnitTypeFactory, cMyID, cUnitStateAlive);
   if (factory >= 0)
   {
      createSimpleResearchPlan(cTechFactorySteamPower,factory,cEconomyEscrowID, 80);
      xsDisableSelf();
   }
}
rule getWaterPower
inactive
minInterval 30
{
   if (kbTechGetStatus(cTechFactoryWaterPower) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1200000)
      return;
   int factory = getUnit(cUnitTypeFactory, cMyID, cUnitStateAlive);
   if (factory >= 0)
   {
      createSimpleResearchPlan(cTechFactoryWaterPower,factory,cEconomyEscrowID, 80);
      xsDisableSelf();
   }
}


rule getMass
inactive
minInterval 30
{
   if (kbTechGetStatus(cTechFactoryMassProduction) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   int factory = getUnit(cUnitTypeFactory, cMyID, cUnitStateAlive);
   if (factory >= 0)
   {
      createSimpleResearchPlan(cTechFactoryMassProduction,factory,cEconomyEscrowID, 80);
      xsDisableSelf();
   }
}


rule getMassUpgrade // cTechImperialCannon
inactive
minInterval 30
{
   if (kbTechGetStatus(cTechImperialRocket) == cTechStatusActive)
   {
      xsDisableSelf();
      return;
   }
   int factory = getUnit(cUnitTypeFactory, cMyID, cUnitStateAlive);
   if (factory >= 0)
   {
      createSimpleResearchPlan(cTechImperialRocket,factory,cMilitaryEscrowID, 80);
      xsDisableSelf();
   }
}

rule useCoveredWagons
inactive
minInterval 10
{
   // Handle nomad start, extra covered wagons.
   int coveredWagon = getUnit(gCoveredWagonUnit, cMyID, cUnitStateAlive);
   
   // Check if we have a covered wagon, but no TC build plan....
   if ( (coveredWagon >= 0) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeTownCenter) < 0) )
   {
      // We need to figure out where to put the new TC.  Start with the current main base as an anchor.
      // From that, check all gold mines within 100 meters and on the same area group.  For each, see if there
      // is a TC nearby, if not, do it.  
      // If all gold mines fail, use the main base location and let it sort it out in the build plan, i.e. TCs repel, gold attracts, etc.
      static int mineQuery = -1;
      if (mineQuery < 0)
      {
         mineQuery = kbUnitQueryCreate("Mine query for TC placement");
         kbUnitQuerySetPlayerID(mineQuery, 0);
         kbUnitQuerySetUnitType(mineQuery, cUnitTypeMine);
         kbUnitQuerySetMaximumDistance(mineQuery, 100.0);
         kbUnitQuerySetAscendingSort(mineQuery, true);   // Ascending distance from initial location
      }
      kbUnitQuerySetPosition(mineQuery, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      kbUnitQueryResetResults(mineQuery);
      int mineCount = kbUnitQueryExecute(mineQuery);
      int i = 0;
      int mineID = -1;
      vector loc = cInvalidVector;
      int mineAreaGroup = -1;
      int mainAreaGroup = kbAreaGroupGetIDByPosition(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      bool found = false;
      aiEcho("**** Starting TC placement search, found "+mineCount+" mines.");
      for (i=0; < mineCount)
      {  // Check each mine for a nearby TC, i.e. w/in 30 meters.
         mineID = kbUnitQueryGetResult(mineQuery, i);
         loc = kbUnitGetPosition(mineID);
         mineAreaGroup = kbAreaGroupGetIDByPosition(loc);
         if ( (getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateABQ, loc, 30.0) < 0) && (mineAreaGroup == mainAreaGroup) )
         {
            aiEcho("    Found good mine at "+loc);
            found = true;
            break;
         }
         else
         {
            aiEcho("    Ignoring mine at "+loc);
         }
      }
      
      // If we found a mine without a nearby TC, use that mine's location.  If not, use the main base.
      if (found == false)
         loc = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
      
      gTCSearchVector = loc;
      
      aiEcho("Moving wagon to "+gTCSearchVector);
      aiTaskUnitMove(coveredWagon, gTCSearchVector);
      startTCBuildPlan(gTCSearchVector);  
   }
}

rule reInitGatherers
inactive
group tcComplete
minInterval 5
{
   if(xsGetTime() > 60000)
      xsDisableSelf();
   updateFoodBreakdown();     // Reinit each gatherer breakdown in case initial pass didn't yet have proper "actual" assignments.
   updateWoodBreakdown();
   updateGoldBreakdown();
}


//==============================================================================
/* House monitor

   Make sure we have a house build plan active, regardless of the number of houses.

   TODO: Check for the civ's max houses, and stop if we have max.
*/
//==============================================================================
rule houseMonitor
inactive
minInterval 3
{ 
   if ( (kbGetCiv() == cCivIndians) && (kbResourceGet(cResourceWood) < 180) )
      return;
   if ( (kbGetCiv() == cCivXPIroquois) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateABQ) < 1) )
      return;
   if ( (kbGetCiv() == cCivFrench) && (kbUnitCount(cMyID, cUnitTypeBarracks, cUnitStateABQ) < 1) && (kbGetAge() == cAge3))
      return;
   if ( (kbGetCiv() == cCivDutch) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateABQ) < 1) && (kbUnitCount(cMyID, gHouseUnit, cUnitStateABQ) >= 1))
      return;  // Dutch need bank before getting extra houses

   if (kbGetBuildLimit(cMyID, gHouseUnit) <= kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive))
      return;     // Don't build if we're at limit.

    //int houseBuildPlanID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gHouseUnit);
	static int houseBuildPlanID = -1;
	int n = 40;
	if(kbGetAge() == cAge1)
	   n = 10;
	else if(kbGetAge() < cAge4 && kbGetCiv() == cCivXPAztec)
	    n = 30;
	else if(kbGetCiv() == cCivBritish || kbGetCiv() == cCivDutch)
	    n = 35;
	else if(kbGetCiv() == cCivXPIroquois)
	    n = 20;
	else if(kbGetCiv() == cCivOttomans)
	    n = 25;
	else if(kbGetAge() < cAge3 && kbGetCiv() == cCivGermans)
	    n = 20;
	else if(kbGetAge() < cAge3 && kbGetCiv() == cCivFrench)
	    n = 50;
    
   if (houseBuildPlanID >= 0)
   {
		if (aiPlanGetState(houseBuildPlanID) >= 0)
        {
           return;  
        }
        else 
        {
           aiPlanDestroy(houseBuildPlanID);
           houseBuildPlanID = -1;
        }
   }
   if ( (houseBuildPlanID < 0) && ( (kbGetPopCap()-kbGetPop()) < n) )   // None in progress, and pop headroom < 15 in cAge1, etc.  
   {  // Start a new one  
      houseBuildPlanID = createSimpleBuildPlan(gHouseUnit, 1, 95, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      aiEcho("Starting a new house build plan.");
   }

}

rule houseMonitor2
inactive
minInterval 6
{
   if ((kbGetPopCap()-kbGetPop()) > 40)
   {
	  return;
   }
   if (xsIsRuleEnabled("ringWalk") == true)
	  return;

   static int shrinePlan = -1;
   static int start = -1;
   if(xsGetTime() > 720000)
   {
      xsDisableSelf();
	  if (xsIsRuleEnabled("houseMonitor") == false)
         xsEnableRule("houseMonitor");
	  if(shrinePlan != -1)
	     aiPlanDestroy(shrinePlan);
   }
   if (shrinePlan >= 0)
   {
		if((xsGetTime() - start) > 180000)
        {
           aiTaskUnitTrain(getUnit(cUnitTypeTownCenter),cUnitTypeypMonkJapanese);
		   aiPlanDestroy(shrinePlan);
           shrinePlan = -1;
        }
		else if (aiPlanGetState(shrinePlan) >= 0)
        {
           return;  
        }
		else 
        {
           aiPlanDestroy(shrinePlan);
           shrinePlan = -1;
        }
		return;
   }
   
   int locFound = 0;
   vector v = cInvalidVector;
	for(i=0; <3){
		v = aiRandLocation();
		if(getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateABQ, v, 100.0) < 0)
		{
		   locFound = 1;
		   break;
		}
	}
   if(locFound == 0)
      return;
   
   shrinePlan=aiPlanCreate("shrine build2", cPlanBuild);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanBuildingTypeID, 0, gHouseUnit);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanCenterPosition, 0, v);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanCenterPositionDistance, 0, 15.0);
   aiPlanSetDesiredPriority(shrinePlan, 93);
   aiPlanSetMilitary(shrinePlan, false);
   aiPlanSetEconomy(shrinePlan, true);
   aiPlanSetEscrowID(shrinePlan, cEconomyEscrowID);
   aiPlanAddUnitType(shrinePlan, cUnitTypeypMonkJapanese, 1, 1, 1);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanInfluencePosition, 0, v); 
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionDistance, 0, 100.0);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionValue, 0, 200.0);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(shrinePlan);
   start = xsGetTime();
}

rule houseMonitor3
inactive
minInterval 6
{
   if ((kbGetPopCap()-kbGetPop()) > 35)
   {
	  return;
   }
   if (xsIsRuleEnabled("randomWalk") == true)
	  return;

   static int shrinePlan = -1;
   static int stayPlan = -1;
   static int start = -1;
   //if((kbGetPopCap()-kbGetPop()) < 5)
   if(xsGetTime() > 720000 || kbGetPopCap() <= kbGetPop())
   {
      xsDisableSelf();
	  if (xsIsRuleEnabled("houseMonitor") == false)
         xsEnableRule("houseMonitor");
	  if(shrinePlan != -1)
	     aiPlanDestroy(shrinePlan);
	  if(stayPlan != -1)
	     aiPlanDestroy(stayPlan);
   }
   
   if (stayPlan < 0)  
   {
      stayPlan = aiPlanCreate("stay", cPlanDefend);
      aiPlanAddUnitType(stayPlan, cUnitTypeypMonkJapanese2, 1, 1, 1);
      
      aiPlanSetVariableVector(stayPlan, cDefendPlanDefendPoint, 0, gFbVec);
      aiPlanSetVariableFloat(stayPlan, cDefendPlanEngageRange, 0, 30.0);
      aiPlanSetVariableBool(stayPlan, cDefendPlanPatrol, 0, false);
      aiPlanSetVariableFloat(stayPlan, cDefendPlanGatherDistance, 0, 20.0);
      aiPlanSetInitialPosition(stayPlan, gFbVec);
      aiPlanSetUnitStance(stayPlan, cUnitStanceDefensive);
      aiPlanSetVariableInt(stayPlan, cDefendPlanRefreshFrequency, 0, 10);
      aiPlanSetVariableInt(stayPlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
      aiPlanSetDesiredPriority(stayPlan, 18);
      aiPlanSetActive(stayPlan); 
   }
   if (shrinePlan >= 0)
   {
		if((xsGetTime() - start) > 180000)
        {
           aiTaskUnitTrain(getUnit(cUnitTypeTownCenter),cUnitTypeypMonkJapanese2);
		   aiPlanDestroy(shrinePlan);
           shrinePlan = -1;
        }
		else if (aiPlanGetState(shrinePlan) >= 0)
        {
           return;  
        }
		else 
        {
           aiPlanDestroy(shrinePlan);
           shrinePlan = -1;
        }
		return;
   }
   
   shrinePlan=aiPlanCreate("shrine build2", cPlanBuild);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanBuildingTypeID, 0, gHouseUnit);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanCenterPosition, 0, gFbVec);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanCenterPositionDistance, 0, 15.0);
   aiPlanSetDesiredPriority(shrinePlan, 93);
   aiPlanSetMilitary(shrinePlan, false);
   aiPlanSetEconomy(shrinePlan, true);
   aiPlanSetEscrowID(shrinePlan, cEconomyEscrowID);
   aiPlanAddUnitType(shrinePlan, cUnitTypeypMonkJapanese2, 1, 1, 1);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanInfluencePosition, 0, gFbVec); 
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionDistance, 0, 100.0);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionValue, 0, 200.0);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(shrinePlan);
   start = xsGetTime();
}

int jpHouseTry()
{ 
   
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   vector huntLocation = cInvalidVector;
   vector monkLocation = cInvalidVector;
   
   int monkQuery = getUnit(cUnitTypeypMonkJapanese2, cMyID, cUnitStateABQ);
   monkLocation = kbUnitGetPosition(monkQuery);
   int huntQuery = getUnitByLocation(cUnitTypeHuntable, cPlayerRelationAny, cUnitStateABQ, monkLocation, 30.0);
   int tcQuery = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateABQ, monkLocation, 120.0);
   if((huntQuery < 0) || (tcQuery >= 0))
   {
      huntLocation = xsVectorSetX(huntLocation, xsVectorGetX(gFbVec));
      huntLocation = xsVectorSetZ(huntLocation, xsVectorGetZ(gFbVec));
   }
   else
      huntLocation = kbUnitGetPosition(huntQuery);
   
   int shrinePlan=aiPlanCreate("shrine build", cPlanBuild);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanBuildingTypeID, 0, gHouseUnit);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanCenterPosition, 0, huntLocation);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanCenterPositionDistance, 0, 15.0);
   aiPlanSetDesiredPriority(shrinePlan, 99);
   aiPlanSetMilitary(shrinePlan, false);
   aiPlanSetEconomy(shrinePlan, true);
   aiPlanSetEscrowID(shrinePlan, cEconomyEscrowID);
   aiPlanAddUnitType(shrinePlan, cUnitTypeypMonkJapanese2, 1, 1, 1);
   aiPlanSetVariableVector(shrinePlan, cBuildPlanInfluencePosition, 0, huntLocation); 
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionDistance, 0, 100.0);
   aiPlanSetVariableFloat(shrinePlan, cBuildPlanInfluencePositionValue, 0, 200.0);
   aiPlanSetVariableInt(shrinePlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(shrinePlan);
   
   return (shrinePlan);
}

//==============================================================================
/* Monastery monitor

   Make sure we have a Monastery around.
   Upgrade the Monks if they need it.

*/
//==============================================================================
rule monasteryMonitor
inactive
group tcComplete
minInterval 45
{ 
  if (civIsAsian() == false) { //don't need to be here unless we're Asian
    return;
  }
  
  if (kbGetAge() < cAge4) {
    return;
  }
  
  if ( (kbUnitCount(cMyID, cUnitTypeypMonastery, cUnitStateABQ) < 1) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypMonastery) < 0) ) {
    createSimpleBuildPlan(cUnitTypeypMonastery, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
    aiEcho("Starting a new monastery build plan.");
  }
  
  if (kbUnitCount(cMyID, cUnitTypeypMonastery, cUnitStateAlive) < 1) {
    return;
  }
  
  int monk1PlanID = -1;
  int monk2PlanID = -1;
  int monk3PlanID = -1;
  int monk4PlanID = -1;
  int compunctionPlanID = -1;
  
  if ((cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy)) {
    if (kbTechGetStatus(cTechypMonasteryJapaneseHealing) == cTechStatusObtainable)
    {
      monk1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryJapaneseHealing);
      if (monk1PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryJapaneseHealing, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
    if (kbTechGetStatus(cTechypMonasteryKillingBlowUpgrade) == cTechStatusObtainable)
    {
      monk3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryKillingBlowUpgrade);
      if (monk3PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryKillingBlowUpgrade, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
    
  }
  
  if ((cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese)) {
    if (kbTechGetStatus(cTechypMonasteryDiscipleAura) == cTechStatusObtainable)
    {
      monk1PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryDiscipleAura);
      if (monk1PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryDiscipleAura, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
	if (xsGetTime() < 1200000)
	   return;
    if (kbTechGetStatus(cTechypMonasteryAttackSpeed) == cTechStatusObtainable)
    {
      monk3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryAttackSpeed);
      if (monk3PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryAttackSpeed, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
    if (kbTechGetStatus(cTechypMonasteryCriticalUpgrade) == cTechStatusObtainable)
    {
      monk4PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryCriticalUpgrade);
      if (monk4PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryCriticalUpgrade, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
  }
  
  if ((cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians)) {
    if (kbTechGetStatus(cTechypMonasteryIndianSpeed) == cTechStatusObtainable)
    {
      monk3PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryIndianSpeed);
      if (monk3PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryIndianSpeed, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
    if (kbTechGetStatus(cTechypMonasteryStompUpgrade) == cTechStatusObtainable)
    {
      monk4PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMonasteryStompUpgrade);
      if (monk4PlanID < 0)
         createSimpleResearchPlan(cTechypMonasteryStompUpgrade, getUnit(cUnitTypeypMonastery),cEconomyEscrowID, 75);
    }
  }
  
}

//==============================================================================
/* BHG Consulate monitor

   Make sure we have a Consulate around.
   Take some Consulate Techs.

*/
//==============================================================================
rule consulateMonitor
inactive
minInterval 30
{ 
  if (civIsAsian() == false) { //don't need to be here unless we're Asian
    xsDisableSelf();
    return;
  }
  if (cvOkToBuildConsulate == false) {
    xsDisableSelf();
    return;
  }
  if (kbUnitCount(cMyID, cUnitTypeypConsulate, cUnitStateAlive) < 1)
     return;
  if(cMyCiv == cCivIndians){
     switch(gIndConsulateProc){
        case 0:
	    {
	       chooseConsulateFlag();
		   gIndConsulateProc = gIndConsulateProc+1;
		   if(kbGetHCLevel(cMyID) < 40)
		      gIndConsulateProc = 3;
		   break;
	    }
	    case 1:
	    {
		   createConsulateResearchPlan();
		   //if((kbTechGetStatus(cTechypConsulateOttomansInfantrySpeed) == cTechStatusActive) && (kbGetAge() > cAge2))
		      //createSimpleResearchPlan(cTechypBigSequesterOttomans, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		   if(kbTechGetStatus(cTechypBigSequesterOttomans) != cTechStatusObtainable)
		   {
		      chooseConsulateFlag();
			  gIndConsulateProc = gIndConsulateProc+1;
		   }
		   else if(kbGetAge() > cAge2){
		       createSimpleResearchPlan(cTechypBigSequesterOttomans, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		   }
		   break;
	    }
	    case 2:
	    {
	       createConsulateResearchPlan();
		   //if(kbGetAge() > cAge3 && kbUnitCount(cMyID, cUnitTypeypUrumi, cUnitStateAlive) > 8)
		      //createSimpleResearchPlan(cTechypBigSequesterFrench, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		   if(kbTechGetStatus(cTechypBigSequesterFrench) != cTechStatusObtainable)
		   {
		      chooseConsulateFlag();
			  gIndConsulateProc = gIndConsulateProc+1;
		   }
		   else if(kbGetAge() > cAge3){
		       createSimpleResearchPlan(cTechypBigSequesterFrench, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		   }
		   break;
	    }
	    case 3:
	    {
	       createConsulateResearchPlan();
		   break;
	    }
     }
   }
  //Sequester or not?
	 
   if(kbGetCiv()==cCivChinese)
   {
      createConsulateResearchPlan();
	  if((xsGetTime() > 1500000) && (kbGetAge() >= cAge4))
	  {
		//if((kbTechGetStatus(cTechypBigSequesterGermans) != cTechStatusObtainable) && (kbTechGetStatus(cTechypBigSequesterBritish) != cTechStatusObtainable))
		   //chooseConsulateFlag();
		if(kbTechGetStatus(cTechypBigSequesterRussians) == cTechStatusObtainable)
	       createSimpleResearchPlan(cTechypBigSequesterRussians, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		else if(kbTechGetStatus(cTechypBigSequesterGermans) == cTechStatusObtainable)
	       createSimpleResearchPlan(cTechypBigSequesterGermans, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
		else if(kbTechGetStatus(cTechypBigSequesterBritish) != cTechStatusObtainable)
	       chooseConsulateFlag();
	  }
	  if (gFlagChosen == false) {
	     chooseConsulateFlag();
	  }
   }
   if(kbGetCiv()==cCivJapanese)
   {
      if(kbGetAge() > cAge3)
	     createConsulateResearchPlan();
	  if((xsGetTime() > 1200000) && (kbGetAge() >= cAge4))
	  {
		if((kbTechGetStatus(cTechypBigSequesterJapanese) != cTechStatusObtainable) && (kbTechGetStatus(cTechypBigSequesterDutch) != cTechStatusObtainable))
		   chooseConsulateFlag();
		if(kbTechGetStatus(cTechypBigSequesterDutch) == cTechStatusObtainable)
	       createSimpleResearchPlan(cTechypBigSequesterDutch, cUnitTypeypConsulate, cMilitaryEscrowID, 50);
	  }
	  if (gFlagChosen == false) {
	     chooseConsulateFlag();
	  }
   }
	  
}

//==============================================================================
/* BHG Rickshaw monitor

   If theres a rickshaw, try to use it

*/
//==============================================================================
rule rickshawMonitor
inactive
group tcComplete
minInterval 30
{ 
  if (civIsAsian() == false) { //don't need to be here unless we're Asian
    xsDisableSelf();
    return;
  }
  
  //if (kbUnitCount(cMyID, cUnitTypeYPMilitaryRickshaw, cUnitStateAlive) > 0)
    //createSimpleBuildPlan(cUnitTypeypBarracksJapanese, 1, 75, true, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
    
  if (kbUnitCount(cMyID, cUnitTypeYPDojoWagon, cUnitStateAlive) > 0)
    createSimpleBuildPlan(cUnitTypeypDojo, 1, 75, true, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
}

//==============================================================================
/* BHG regicide monitor

   Pop the regent in the castle

*/
//==============================================================================
rule regicideMonitor
inactive
minInterval 10
{ 
  //if the castle is up, put the guy in it
  
  if (kbUnitCount(cMyID, cUnitTypeypCastleRegicide, cUnitStateAlive) > 0) {
    //gotta find the castle
     static int castleQueryID=-1;
     //If we don't have the query yet, create one.
     if (castleQueryID < 0)
     {
        castleQueryID=kbUnitQueryCreate("castleGetUnitQuery");
        kbUnitQuerySetIgnoreKnockedOutUnits(castleQueryID, true);
     }
    //Define a query to get all matching units
    if (castleQueryID != -1) {
      kbUnitQuerySetPlayerRelation(castleQueryID, -1);
      kbUnitQuerySetPlayerID(castleQueryID, cMyID);
      kbUnitQuerySetUnitType(castleQueryID, cUnitTypeypCastleRegicide);
      kbUnitQuerySetState(castleQueryID, cUnitStateAlive);
    }
    else {
      return;
    }
    
    //gotta find the regent
     static int regentQueryID=-1;
     //If we don't have the query yet, create one.
     if (regentQueryID < 0)
     {
        regentQueryID=kbUnitQueryCreate("regentGetUnitQuery");
        kbUnitQuerySetIgnoreKnockedOutUnits(regentQueryID, true);
     }
    //Define a query to get all matching units
    if (regentQueryID != -1) {
      kbUnitQuerySetPlayerRelation(regentQueryID, -1);
      kbUnitQuerySetPlayerID(regentQueryID, cMyID);
      kbUnitQuerySetUnitType(regentQueryID, cUnitTypeypDaimyoRegicide);
      kbUnitQuerySetState(regentQueryID, cUnitStateAlive);
    }
    else {
      return;
    }
  
    
    kbUnitQueryResetResults(castleQueryID);
    kbUnitQueryResetResults(regentQueryID);
    
    kbUnitQueryExecute(castleQueryID);
    kbUnitQueryExecute(regentQueryID);
    
    int index = 0;
    
    aiTaskUnitWork(kbUnitQueryGetResult(regentQueryID, index), kbUnitQueryGetResult(castleQueryID, index));
  }
  else {
    xsDisableSelf();
  }
}

//==============================================================================
/* BHG orchard monitor

   If we have a wagon, build an orchard.

*/
//==============================================================================
rule orchardMonitor
inactive
group tcComplete
minInterval 45
{ 
  if (kbUnitCount(cMyID, cUnitTypeYPBerryWagon1, cUnitStateAlive) > 0) {
    createSimpleBuildPlan(cUnitTypeypBerryBuilding, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
  }
}


//==============================================================================
/* Building monitor

   Make sure we have the right number of buildings, or at least a build plan,
   for each required building type.

*/
//==============================================================================
rule buildingMonitor
inactive
group tcComplete
minInterval 5
{
   static int check = 0;
   static int check2 = 0;
   int planID = -1;
   int n = 1;
   if(kbGetAge() > cAge3 && xsGetTime() > 1080000)
	  n = 2;
   if(kbGetCiv() == cCivXPSioux)
   {
      xsDisableSelf();
	  xsEnableRule("buildingMonitor2");
	  return;
   }
   
   if (cvOkToBuild == false)
      return;
   
   if (gDefenseReflexBaseID == kbBaseGetMainID(cMyID))
      return;  

	// if Dutch, add banks to the build limit.
   if (kbGetCiv() == cCivDutch)
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBank); 
	  if (planID < 0 && kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) < 1)  // If I'm not building one and I could be, do it.
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeBank, 1, 93, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      }
   }
   
   if ( (kbGetCiv() == cCivBritish) && (kbUnitCount(cMyID, gHouseUnit, cUnitStateABQ) < 4) )
      return;
   if ( (kbGetCiv() == cCivDutch) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateABQ) < 1) )
      return;

   // At least one market
   
   // If native, at least one fire pit   
   planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeFirePit);
   
   if (cMyCiv == cCivXPAztec) 
   {
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeFirePit, cUnitStateAlive) < 1) )
      {     // Start a new one if we have at least one house.
         createSimpleBuildPlan(cUnitTypeFirePit, 1, 95, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1); 
         aiEcho("Starting a new firepit build plan.");
      }  
   }
   
   // That's it for age 1
   if (kbGetAge() < cAge2) 
      return;
   
   //if(kbGetCiv() == cCivXPIroquois && kbUnitCount(cMyID, cUnitTypexpBuilder, cUnitStateAlive) > 0)
      //return;
   if((xsGetTime() - gAgeUpTime < 75000) && kbGetAge() == cAge2)
   {
	  if(kbGetCiv() == cCivRussians || kbGetCiv() == cCivPortuguese || kbGetCiv() == cCivSpanish)
	     return;
	  if(kbGetCiv() == cCivBritish || kbGetCiv() == cCivDutch || kbGetCiv() == cCivOttomans)
	     return;
   }
   
   // ***************************************************
   
	if(cMyCiv == cCivIndians && kbResourceGet(cResourceWood) < 200)
	   return;
	if (kbGetCiv() == cCivFrench)
    {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeChurch);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeChurch, cUnitStateAlive) < 1) && (aiGetWorldDifficulty() >= cDifficultyHard) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeChurch, 1, 60, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new church build plan.");
      }
	  if (kbGetAge() < cAge3) 
	     return;
    }
		  
    if (civIsAsian() == true) { //cMyCiv != cCivJapanese
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypCastle);
	  if ( (cMyCiv == cCivChinese) && (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypCastle, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypCastle, 1, 50, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new siege workshop build plan.");
      }
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypConsulate);
      if ( (cMyCiv == cCivIndians) && (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypConsulate, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypConsulate, 1, 88, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
    }
	
   // If Russian, at least 1 block house
	if (kbGetCiv() == cCivRussians)
	{ 
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBlockhouse);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeBlockhouse, cUnitStateAlive) < 1) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeBlockhouse, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new blockhouse build plan.");
		}
	}
   else if ( civIsNative() == true )
   {  // Natives, at least 1 war hut
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeWarHut);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) < 1) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeWarHut, 1, 71, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new war hut build plan.");
		}  
   }
   else if (civIsAsian() == true) {
      if ( (cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy) ) {
        planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypBarracksJapanese);
        if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypBarracksJapanese, cUnitStateAlive) < 2) )
        {     // Start a new one
          createSimpleBuildPlan(cUnitTypeypBarracksJapanese, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
          aiEcho("Starting a new bansho build plan.");
        }
      }
      else if ( (cMyCiv == cCivChinese) || (cMyCiv == cCivSPCChinese) ) {
        //if(kbUnitCount(cMyID, cUnitTypeypCastle, cUnitStateAlive) < 1)
		   //return;
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypWarAcademy);
        if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypWarAcademy, cUnitStateAlive) < n) )
        {     // Start a new one
          createSimpleBuildPlan(cUnitTypeypWarAcademy, 1, 86, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
          aiEcho("Starting a new war academy build plan.");
        }
      }
	  else if ( (cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians) ) {
        planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeYPBarracksIndian);
        if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeYPBarracksIndian, cUnitStateAlive) < 1) && (kbUnitCount(cMyID, cUnitTypeypWIAgraFort2, cUnitStateAlive) < 1) )
        {     // Start a new one
          createSimpleBuildPlan(cUnitTypeYPBarracksIndian, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        }
      }
   }
	else // every other civ gets a barracks.
	{
		// At least 1 barracks
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBarracks);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeBarracks, cUnitStateAlive) < n) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeBarracks, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new barracks build plan.");
		}
	}
	
	//double barrack
	planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBarracks);
	if (cMyCiv == cCivBritish || cMyCiv == cCivDutch || cMyCiv == cCivSpanish || cMyCiv == cCivPortuguese || cMyCiv == cCivOttomans)
    {
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeBarracks, cUnitStateAlive) < 2) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeBarracks, 1, 70, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new market build plan.");
      }   
    }
	
	//build again if bugged
	planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeWarHut);
	if (cMyCiv == cCivXPIroquois && kbResourceGet(cResourceWood) > 500 && kbUnitCount(cMyID, cUnitTypeAbstractCavalry, cUnitStateAlive) > 10 && check == 0)
    {
	  if (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) < 1)
      {     // Start a new one
         if(planID >= 0)
		    aiPlanDestroy(planID);
		 createSimpleBuildPlan(cUnitTypeWarHut, 1, 70, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new market build plan.");
		 check = 1;
      }   
    }
   
   // At least one stable   
   if ( (civIsNative() == true) )
   {  // Natives, at least 1 corral
      if (cMyCiv != cCivXPAztec)
      {
         planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeCorral);
		 if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 1) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) > 0) )
         {     // Start a new one
            createSimpleBuildPlan(cUnitTypeCorral, n, 80, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
            aiEcho("Starting a new corral build plan.");
         }  
      }
   }
  else if (civIsAsian() == true) {
    if ( (cMyCiv == cCivJapanese) || (cMyCiv == cCivSPCJapanese) || (cMyCiv == cCivSPCJapaneseEnemy) ) {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypStableJapanese);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypStableJapanese, cUnitStateAlive) < n) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypStableJapanese, 1, 86, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new dojo build plan.");
      }
    }
    else if ( (cMyCiv == cCivIndians) || (cMyCiv == cCivSPCIndians) ) {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypCaravanserai);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypCaravanserai, cUnitStateAlive) < 2) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypCaravanserai, 1, 86, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new Caravanserai build plan.");
      }
    }
   }
   else 
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeStable);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeStable, cUnitStateAlive) < n) && (civIsNative() == false) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeStable, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new stable build plan.");
      }
   }
   
   //build again if bugged
	planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeCorral);
	if (cMyCiv == cCivXPIroquois && kbResourceGet(cResourceWood) > 500 && kbUnitCount(cMyID, cUnitTypeAbstractInfantry, cUnitStateAlive) > 20 && check2 == 0)
    {
	  if (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 1)
      {     // Start a new one
         if(planID >= 0)
		    aiPlanDestroy(planID);
		 createSimpleBuildPlan(cUnitTypeCorral, 1, 70, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new market build plan.");
		 check2 = 1;
      }   
    }
   
    planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);
    
	if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) )
	{
	  if (kbGetCiv() != cCivDutch)
	     createSimpleBuildPlan(gMarketUnit, 1, 96, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);  // Just higher than house
      //aiEcho("Starting a new market build plan.");   
    }
   
   if (kbGetCiv() == cCivDutch && kbResourceGet(cResourceWood) > 500)
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBank); 
	  if ((planID < 0) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) < kbGetBuildLimit(cMyID, cUnitTypeBank)))  // If I'm not building one and I could be, do it.
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeBank, 1, 93, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      }
	  planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);   // Dutch market check...only if bank exists
      if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) && (kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) > 0) )
      {
         createSimpleBuildPlan(gMarketUnit, 1, 96, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);  // Just higher than house
      }
   }
   /*if (kbGetCiv() == cCivGermans && kbResourceGet(cResourceWood) > 500)
   {
	  planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);
      if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) )
      {
         createSimpleBuildPlan(gMarketUnit, 1, 96, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      }
   }*/
   
   // That's it for age 2
   if (kbGetAge() < cAge3)
      return;
   // **********************************************************
   
   if (civIsAsian() == true) {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypCastle);
	  if ( (cMyCiv != cCivIndians) && (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypCastle, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypCastle, 1, 50, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new siege workshop build plan.");
      }
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypConsulate);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypConsulate, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypConsulate, 1, 88, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
    }
   
   planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeFirePit);
   if ((cMyCiv == cCivXPIroquois) || (cMyCiv == cCivXPSioux)) 
   {
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeFirePit, cUnitStateAlive) < 1) )
      {     // Start a new one if we have at least one house.
         createSimpleBuildPlan(cUnitTypeFirePit, 1, 95, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1); 
         aiEcho("Starting a new firepit build plan.");
      }  
   }
   
    // At least one artillery depot
   if ( kbGetCiv() == cCivOttomans )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeArtilleryDepot);
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeArtilleryDepot, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new artillery depot build plan.");
      }
   }
   if ( cMyCiv == cCivXPIroquois )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeArtilleryDepot);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeArtilleryDepot, cUnitStateAlive) < n) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 65, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new artillery depot build plan.");
      }   
   }
   
   if ( (kbGetCiv() == cCivOttomans) && (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateABQ) < 2) )
      return;
   
   if ( civIsNative() == true )
   {  // Natives, at least 1 war hut
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeWarHut);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) < 1) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeWarHut, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new war hut build plan.");
		}  
   }
   // If Russian, at least 1 block house
	if (kbGetCiv() == cCivRussians)
	{
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeBlockhouse);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeBlockhouse, cUnitStateAlive) < n) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeBlockhouse, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new blockhouse build plan.");
		}  
		aiEcho("Starting a new blockhouse build plan.");
	}
   
   // That's it for age 3
   if (kbGetAge() < cAge4)
      return;
   // **********************************************************
   
   if (civIsAsian() == true) {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypCastle);
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypCastle, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypCastle, 1, 50, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new siege workshop build plan.");
      }
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypConsulate);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeypConsulate, cUnitStateAlive) < 1) )
      {     // Start a new one
        createSimpleBuildPlan(cUnitTypeypConsulate, 1, 88, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
      }
    }
	
   // At least one church
   if ( (civIsNative() == false) && (civIsAsian() == false) )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeChurch);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeChurch, cUnitStateAlive) < 1) && (aiGetWorldDifficulty() >= cDifficultyHard) )
      {     // Start a new one
         if ( (gTimeToFarm == false) || (kbUnitCount(cMyID, gFarmUnit, cUnitStateABQ) > 0) )   // We have a mill, or don't need any.
         {
            createSimpleBuildPlan(cUnitTypeChurch, 1, 60, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
            aiEcho("Starting a new church build plan.");
         }
      }
   }
   
   // At least one arsenal
   if ( (civIsNative() == false) && (civIsAsian() == false) && (xsGetTime() > 1350000) )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeArsenal);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeArsenal, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeArsenal, 1, 60, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new arsenal build plan.");
      }
   }
   
   if ( cMyCiv == cCivXPAztec )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeNoblesHut);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeNoblesHut, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeNoblesHut, 1, 92, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         //aiEcho("Starting a new artillery depot build plan.");
      }
   }
   
   if ( (civIsNative() == false) && (civIsAsian() == false) )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeArtilleryDepot);
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeArtilleryDepot, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeArtilleryDepot, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         aiEcho("Starting a new artillery depot build plan.");
      }
   }

   // That's it for age 4
   if (kbGetAge() < cAge5)
      return;
   // **********************************************************

   // And how 'bout a capitol, as long as we're here
   if ( (civIsNative() == false) && (civIsAsian() == false) ) {
     planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeCapitol);
     if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeCapitol, cUnitStateAlive) < 1) )
     {     // Start a new one
        createSimpleBuildPlan(cUnitTypeCapitol, 1, 60, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new capitol build plan.");
     }
   }
   
   //Asians have Rice Paddies instead of Plantations
   if ( civIsAsian() == false ) {
     int plantsNeeded = 0 + ( (kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) * 0.4) / cMaxSettlersPerPlantation);  //Enough for 40% of population
     plantsNeeded = plantsNeeded - kbUnitCount(cMyID, gPlantationUnit, cUnitStateABQ);
     planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gPlantationUnit);
     if ( (plantsNeeded > 0) && (planID < 0) )
     {     // Start a new one
        createSimpleBuildPlan(gPlantationUnit, 1, 60, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
        aiEcho("Starting a new plantation build plan.");
     }
   }

}

rule buildingMonitor2
inactive
minInterval 5
{
   int planID = -1;
   static int planID2 = -1;
   
   if (cvOkToBuild == false)
      return;
   
   if (gDefenseReflexBaseID == kbBaseGetMainID(cMyID))
      return;  

   
   // That's it for age 1
   if (kbGetAge() < cAge2) 
      return;
   
   // ***************************************************
   
   
   // At least one stable   
   if ( (civIsNative() == true) )
   {  // Natives, at least 1 corral
      if (cMyCiv != cCivXPAztec)
      {
         planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeCorral);
		 if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 1) )
         {     // Start a new one
            createSimpleBuildPlan(cUnitTypeCorral, 2, 80, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
            aiEcho("Starting a new corral build plan.");
         }
      }
   }
   
   if ( civIsNative() == true )
   {  // Natives, at least 1 war hut
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeWarHut);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) < 1) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) > 1) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeWarHut, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new war hut build plan.");
		}  
   }
   
   planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);
	if (cMyCiv != cCivDutch)
    {
	  if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) > 0) )
      {     // Start a new one
         createSimpleBuildPlan(gMarketUnit, 1, 96, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);  // Just higher than house
         aiEcho("Starting a new market build plan.");
      }   
    }
   
   // That's it for age 2
   if (kbGetAge() < cAge3)
      return;
   // **********************************************************
   
   // At least one stable
   if (planID2 >= 0)
   {
		if (aiPlanGetState(planID2) >= 0)
        {
           return;  
        }
        else 
        {
           aiPlanDestroy(planID2);
           planID2 = -1;
        }
   }
   if ( (planID2 < 0) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 2) )
   {  // Start a new one  
      planID2 = createSimpleBuildPlan(cUnitTypeCorral, 1, 95, true, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   
   if ( civIsNative() == true )
   {  // Natives, at least 1 war hut
		planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeWarHut);
		if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeWarHut, cUnitStateAlive) < 1) )
		{     // Start a new one
			createSimpleBuildPlan(cUnitTypeWarHut, 1, 70, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
			aiEcho("Starting a new war hut build plan.");
		}  
   }
   
   if ( (civIsNative() == true) )
   {  // Natives, at least 1 corral
      if (cMyCiv == cCivXPSioux)
      {
         planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeCorral);
		 if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeCorral, cUnitStateAlive) < 2) )
         {     // Start a new one
            createSimpleBuildPlan(cUnitTypeCorral, 1, 80, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
            aiEcho("Starting a new corral build plan.");
         }
      }
   }
   
   planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeFirePit);
   if ((cMyCiv == cCivXPIroquois) || (cMyCiv == cCivXPSioux)) 
   {
	  if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeFirePit, cUnitStateAlive) < 1) )
      {     // Start a new one if we have at least one house.
         createSimpleBuildPlan(cUnitTypeFirePit, 1, 95, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1); 
         aiEcho("Starting a new firepit build plan.");
      }  
   }
   
   // That's it for age 3
   if (kbGetAge() < cAge4)
      return;
   // **********************************************************
   
   
   if ( cMyCiv == cCivXPSioux )
   {
      planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeTeepee);
      if ( (planID < 0) && (kbUnitCount(cMyID, cUnitTypeTeepee, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeTeepee, 1, 92, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         //aiEcho("Starting a new Teepee build plan.");
      }   
   }

}



//==============================================================================
/* xpBuilder monitor

   Use an idle xpBuilder to build as needed.

*/
//==============================================================================
rule xpBuilderMonitor
inactive
group tcComplete
minInterval 20
{
   if (civIsNative() == false)
   {
      xsDisableSelf();
      return;
   }
   
   static int activePlan = -1;
   
   if (activePlan != -1)   // We already have something active?
   {
      if ( (aiPlanGetState(activePlan) < 0) || (aiPlanGetState(activePlan) == cPlanStateNone) ) 
      {
         aiPlanDestroy(activePlan);
         activePlan = -1;  // Plan is bad, but didn't die.  It's dead now, so continue below.
      }
      else
      {
         return;  // Something is active, let it run.
      }
   }
   
   // If we get this far, there is no active plan.  See if we have a xpBuilder to use.
   int xpBuilderID = -1;
   int buildingToMake = -1;
   int buildertype = -1;
   if (kbUnitCount(cMyID, cUnitTypexpBuilderStart, cUnitStateAlive) > 0) {
    xpBuilderID = getUnit(cUnitTypexpBuilderStart);
    buildingToMake = gHouseUnit;  // If all else fails, make a house since we can't make warhuts.
	//buildingToMake = gFarmUnit;
    buildertype = cUnitTypexpBuilderStart;
   }
   else {
    xpBuilderID = getUnit(cUnitTypexpBuilder);
    buildingToMake = cUnitTypeWarHut;  // If all else fails, make a war hut.
    buildertype = cUnitTypexpBuilder;
   }
   if (xpBuilderID < 0)
      return;

   // We have a xpBuilder, and no plan to use it.  Find something to do with it.  
   // Simple logic.  Farm if less than 3.  War hut if less than 2.  Corral if < 2.  House if below pop limit.
   // One override....avoid farms in age 1, they're too slow.
   if (kbGetAge() > cAge2)
      buildingToMake = cUnitTypePlantation;
   
   if (buildingToMake >= 0)
   {
      activePlan = aiPlanCreate("Use an xpBuilder", cPlanBuild);
      // What to build
      aiPlanSetVariableInt(activePlan, cBuildPlanBuildingTypeID, 0, buildingToMake);

      // 3 meter separation
      aiPlanSetVariableFloat(activePlan, cBuildPlanBuildingBufferSpace, 0, 3.0);
      if (buildingToMake == gFarmUnit)
         aiPlanSetVariableFloat(activePlan, cBuildPlanBuildingBufferSpace, 0, 8.0);       
      
      //Priority.
      aiPlanSetDesiredPriority(activePlan, 95);
      //Mil vs. Econ.
      //if ( (buildingToMake == cUnitTypeWarHut) || (buildingToMake == cUnitTypeCorral) )
      if (buildingToMake == cUnitTypeCorral)
	  {
         aiPlanSetMilitary(activePlan, true);
         aiPlanSetEconomy(activePlan, false);
      }
      else
      {
         aiPlanSetMilitary(activePlan, false);
         aiPlanSetEconomy(activePlan, true);
      }
      aiPlanSetEscrowID(activePlan, cEconomyEscrowID);

	   aiPlanAddUnitType(activePlan, buildertype, 1, 1, 1);

      aiPlanSetBaseID(activePlan, kbBaseGetMainID(cMyID));

      //Go.
      aiPlanSetActive(activePlan);
   }
}

int waterDanceCheck()
{
   vector targetLocation = cInvalidVector;
   int sf = getUnit(cUnitTypexpTlalocCanoe, cMyID, cUnitStateABQ);
   if(sf < 0)
      return (-1);
   targetLocation = kbUnitGetPosition(sf);
   int tf = getUnitCountByLocation(cUnitTypeAbstractWarShip, cPlayerRelationEnemy, cUnitStateAlive, targetLocation, 30.0);
   return(tf);
}
int fireDanceCheck()
{
   vector targetLocation = cInvalidVector;
   int sf = getUnit(cUnitTypeLogicalTypeLandMilitary, cMyID, cUnitStateABQ);
   if(sf < 0)
      return (-1);
   targetLocation = kbUnitGetPosition(sf);
   int tf = getUnitCountByLocation(cUnitTypeLogicalTypeLandMilitary, cPlayerRelationEnemy, cUnitStateAlive, targetLocation, 30.0);
   return(tf);
}


//==============================================================================
/* Native Dance Monitor

   Manage the number of natives dancing, and the 'tactic' they're dancing for.

const int cTacticFertilityDance=12;   Faster training
const int cTacticGiftDance=13;         Faster XP trickle
const int cTacticCityDance=14;
const int cTacticWaterDance=15;       Increases navy HP/attack
const int cTacticAlarmDance=16;        Town defense...
const int cTacticFounderDance=17;      xpBuilder units - Iroquois
const int cTacticMorningWarsDance=18;
const int cTacticEarthMotherDance=19;
const int cTacticHealingDance=20;
const int cTacticFireDance=21;
const int cTacticWarDanceSong=22;
const int cTacticGarlandWarDance=23;
const int cTacticWarChiefDance=24;    new war chief
const int cTacticHolyDance=25;

*/
//==============================================================================
rule danceMonitor
inactive
group tcComplete
minInterval 15
{
   if (civIsNative() == false)
   {
      xsDisableSelf();
      return;
   }
   if (cMyCiv == cCivXPIroquois && kbGetAge() < cAge4)
   {
      return;
   }
   
   static int lastTactic = -1;
   static int lastTacticTime = -1;
   static int lastWarChiefTime = -1;
   static int warChiefCount = 0;
   int n = 65;
   if(kbGetCiv() == cCivXPAztec)
	  n = 50;
   
   if (gNativeDancePlan < 0)
   {
      gNativeDancePlan = createNativeResearchPlan(cTacticNormal, 85, 1, 1, 1);
      lastTactic = cTacticNormal;
      lastTacticTime = xsGetTime();
   }
   //add
   int numWarPriests = kbUnitCount(cMyID, cUnitTypexpMedicineManAztec, cUnitStateAlive);
   aiPlanAddUnitType(gNativeDancePlan, cUnitTypexpMedicineManAztec, numWarPriests, numWarPriests, numWarPriests);
   
   // Set the number of dancers to 1/15 of pop, rounded down.
   int want = -1;
   int want2 = 14;
   if(kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) < 25)
      want2 = 0;
   //want = kbUnitCount(cMyID, gEconUnit, cUnitStateAlive) / 15;
   
   //add
   if(kbGetCiv() == cCivXPAztec)
      want = 2;
   else if (kbGetCiv() == cCivXPSioux && kbUnitCount(cMyID, cUnitTypeAbstractCavalry, cUnitStateAlive) > 40) 
      want = 10;
   else if (kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > n) 
      want = 10;
   else
      want = 0;
   
   // If in defense reflex, zero....forget that, let's just do the Alarm dance instead
//   if ( gDefenseReflexBaseID == kbBaseGetMainID(cMyID) )
  //    want = 0;
   
   
   
   if((kbUnitCount(cMyID, cUnitTypexpMedicineManAztec, cUnitStateAlive) > 2) && (kbGetAge() > cAge3))
   {
	   aiPlanAddUnitType(gNativeDancePlan, gEconUnit, want2, want2, want2);
   }
   else if((kbGetCiv() == cCivXPAztec) && (kbGetAge() == cAge3) && (agingUp() == true))
   {
	   aiPlanAddUnitType(gNativeDancePlan, gEconUnit, want2, want2, want2);
   }
   else if((kbUnitCount(cMyID, cUnitTypexpMedicineManAztec, cUnitStateAlive) > 9) || (kbGetAge() < cAge3))
   {
	   aiPlanAddUnitType(gNativeDancePlan, gEconUnit, 0, 0, 0);
   }
   else
   {
       aiPlanAddUnitType(gNativeDancePlan, gEconUnit, want, want, want);
   }
   
   // Select a tactic 
   
   //add
   //az
   if ((cMyCiv == cCivXPAztec) && (kbGetAge() < cAge2)) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticGiftDance);
      lastTactic = cTacticGiftDance;
      lastTacticTime = xsGetTime();
      return;
   }
   if ((cMyCiv == cCivXPAztec) && (kbUnitCount(cMyID, cUnitTypexpMedicineManAztec, cUnitStateAlive) < 10)) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticHolyDanceAztec);
      lastTactic = cTacticHolyDanceAztec;
      lastTacticTime = xsGetTime();
      return;
   }
   /*if ((cMyCiv == cCivXPAztec) && (kbTechGetStatus(cTechHCXPWaterDance) == cTechStatusActive) && (waterDanceCheck() > 0)) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticWaterDance);
      lastTactic = cTacticWaterDance;
      lastTacticTime = xsGetTime();
      return;
   }*/
   if ((cMyCiv == cCivXPAztec) && (kbGetAge() > cAge3) && (kbGetPop() < 190)) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticGarlandWarDance);
      lastTactic = cTacticGarlandWarDance;
      lastTacticTime = xsGetTime();
      return;
   }
   //sioux
   if ((cMyCiv == cCivXPSioux) && (fireDanceCheck() < 5) && (kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > 45)) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticFireDance);
      lastTactic = cTacticFireDance;
      lastTacticTime = xsGetTime();
      return;
   }
  
   if (kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > n) 
   {
      aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticWarDance);
      lastTactic = cTacticWarDance;
      lastTacticTime = xsGetTime();
      return;
   }
   
   // FertilityDance default
	  aiPlanSetVariableInt(gNativeDancePlan, cNativeResearchPlanTacticID, 0, cTacticFertilityDance);
      lastTactic = cTacticFertilityDance;
      lastTacticTime = xsGetTime();  
	  
	  if(kbUnitCount(cMyID, cUnitTypeFirePit, cUnitStateAlive) < 1)
	     aiPlanDestroy(gNativeDancePlan);
   
}

//==============================================================================
/* Rice Paddy Monitor

   Switch from Food to Coin.

cTacticPaddyFood
cTacticPaddyCoin

*/
//==============================================================================
rule ricepaddyMonitor
inactive
group tcComplete
minInterval 60
{
   if (civIsAsian() == false)
   {
      xsDisableSelf();
      return;
   }
   
   //gotta get all of the paddies
   static int paddyQueryID=-1;
   
   //If we don't have the query yet, create one.
   if (paddyQueryID < 0)
   {
      paddyQueryID=kbUnitQueryCreate("paddyGetUnitQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(paddyQueryID, true);
   }

	//Define a query to get all matching units
	if (paddyQueryID != -1)
	{
    kbUnitQuerySetPlayerRelation(paddyQueryID, -1);
    kbUnitQuerySetPlayerID(paddyQueryID, cMyID);
    kbUnitQuerySetUnitType(paddyQueryID, cUnitTypeypRicePaddy);
    kbUnitQuerySetState(paddyQueryID, cUnitStateAlive);
	}
	else
   	return;

  kbUnitQueryResetResults(paddyQueryID);
	int numberFound=kbUnitQueryExecute(paddyQueryID);
  int index = 0;
   
   // Select a tactic
   static int lastricefood = 0;
   
   int foodriceNeeded = 1 + kbUnitCount(cMyID, gFarmUnit, cUnitStateAlive)*0.5;
   float percentOnGold = aiGetResourceGathererPercentage( cResourceGold, cRGPActual );
   
   if (percentOnGold > 0.20) {
    foodriceNeeded--;
   }
  
  if ( foodriceNeeded != lastricefood ) {
    lastricefood = foodriceNeeded;
    for (index = 0; <foodriceNeeded) {
     //change the rice to food
     aiUnitSetTactic(kbUnitQueryGetResult(paddyQueryID, index), cTacticPaddyFood);
    }
    for (index = foodriceNeeded; < numberFound) {
     //change the rice to coin
     aiUnitSetTactic(kbUnitQueryGetResult(paddyQueryID, index), cTacticPaddyCoin);
    }
  }
}

//==============================================================================
/* Shrine Monitor

   Switch from Food to Wood.

cTacticShrineFood   Faster training
cTacticShrineWood         Faster XP trickle

*/
//==============================================================================
rule shrineMonitor
inactive
group tcComplete
minInterval 60
{
   if (kbGetCiv() != cCivJapanese)
   {
      xsDisableSelf();
      return;
   }

   if ((kbUnitCount(cMyID, cUnitTypeypShrineWagon, cUnitStateAlive) > 0) && (aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeypShrineJapanese) < 0)) {
     createSimpleBuildPlan(cUnitTypeypShrineJapanese, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   }
   
   static int tac = cTacticShrineWood;
   if(xsGetTime() > 600000)
   {
      xsDisableSelf();
	  tac = cTacticShrineCoin;
   }
   
   if(tac != -1)
   {
      int shrineQueryID=-1;
       
      shrineQueryID=kbUnitQueryCreate("shrineGetUnitQuery");
      kbUnitQuerySetIgnoreKnockedOutUnits(shrineQueryID, true);
      
      //Define a query to get all matching units
      if (shrineQueryID != -1) {
        kbUnitQuerySetPlayerRelation(shrineQueryID, -1);
        kbUnitQuerySetPlayerID(shrineQueryID, cMyID);
        kbUnitQuerySetUnitType(shrineQueryID, cUnitTypeypShrineJapanese);
        kbUnitQuerySetState(shrineQueryID, cUnitStateAlive);
        
        kbUnitQueryResetResults(shrineQueryID);
        int numberFound=kbUnitQueryExecute(shrineQueryID);
        if (numberFound > 0) {
          aiUnitSetTactic(kbUnitQueryGetResult(shrineQueryID, 0), tac);
		  tac = -1;
		  //xsDisableSelf();
        }
      }
   }
}

//==============================================================================
/* rule defenseReflex

   Monitor each VP site that we own, plus our main base.  Move and reconfigure 
   the defense and reserve plans as needed.

   At rest, the defend plan has only one unit, is centered on the main base, and
   is used to send one unit after trivial invasions, typically a scouting unit. 
   The reserve plan has a much larger MAX number, so it gets all the remaining units.
   It is centered on the military gather point with a conservative radius, to avoid
   engaging units far in front of the main base.

   When defending a base in a defense reflex, the defend plan gets a high MAX number
   so that it takes units from the reserve plan.  The low unit count in reserve 
   acts as a signal to not launch new attacks, as troops aren't available.  The 
   defend plan and reserve plan are relocated to the endangered base, with an aggressive
   engage radius.

   The search, active engage and passive engage radii are set by global 
   control variables, cvDefenseReflexRadiusActive, cvDefenseReflexRadiusPassive, and
   cvDefenseReflexSearchRadius.
   
   Once in a defense reflex, the AI stays in it until that base is cleared, unless
   it's defending a non-main base, and the main base requires defense.  In that case,
   the defense reflex moves back to the main base.
   
   pauseDefenseReflex() can only be used when already in a defense reflex.  So valid 
   state transitions are:

   none to defending       // start reflex with moveDefenseReflex(), sets all the base/location globals.
   defending to paused     // use pauseDefenseReflex(), takes no parms, uses vars set in prior moveDefenseReflex call.
   defending to end        // use endDefenseReflex(), clears global vars
   paused to end           // use endDefenseReflex(), clears global vars
   paused to defending     // use moveDefenseReflex(), set global vars again.

*/
//==============================================================================
// 

rule defenseReflex
inactive
minInterval 10
group startup
{

   //add
   if(grushPlan != -1 && xsGetTime() < 600000)
	   return;
   
   int armySize = aiPlanGetNumberUnits(gLandDefendPlan0, cUnitTypeLogicalTypeLandMilitary) + aiPlanGetNumberUnits(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary);
   int enemyArmySize = -1;
   static int lastHelpTime = -60000;
   static int lastHelpBaseID = -1;
   int i = 0;
   int unitID = -1;
   int protoUnitID = -1;
   bool panic = false;  // Indicates need for call for help
   
   static int enemyArmyQuery = -1;
   if (enemyArmyQuery < 0)
   {  // Initialize the queryID
      enemyArmyQuery = kbUnitQueryCreate("Enemy army query");
      kbUnitQuerySetIgnoreKnockedOutUnits(enemyArmyQuery, true);
      kbUnitQuerySetPlayerRelation(enemyArmyQuery, cPlayerRelationEnemyNotGaia);
      kbUnitQuerySetUnitType(enemyArmyQuery, cUnitTypeLogicalTypeLandMilitary);
      kbUnitQuerySetState(enemyArmyQuery, cUnitStateAlive);
      kbUnitQuerySetSeeableOnly(enemyArmyQuery, true);   // Ignore units we think are under fog
   }
   
   // Check main base first
   kbUnitQuerySetPosition(enemyArmyQuery,  kbBaseGetLocation(cMyID,  kbBaseGetMainID(cMyID)));
   kbUnitQuerySetMaximumDistance(enemyArmyQuery, cvDefenseReflexSearchRadius);   
   kbUnitQuerySetSeeableOnly(enemyArmyQuery, true);
   kbUnitQuerySetState(enemyArmyQuery, cUnitStateAlive);
   kbUnitQueryResetResults(enemyArmyQuery);
   enemyArmySize = kbUnitQueryExecute(enemyArmyQuery);
   if (enemyArmySize >= 2)
   {  // Main base is under attack
      aiEcho("******** Main base ("+kbBaseGetMainID(cMyID)+") under attack.");
      aiEcho("******** Enemy count "+enemyArmySize+", my army count "+armySize);
      if ( gDefenseReflexBaseID == kbBaseGetMainID(cMyID) )
      {  // We're already in a defense reflex for the main base
         if (  ((armySize * 3.0) < enemyArmySize)  && (enemyArmySize > 6.0) )  // Army at least 3x my size and more than 6 units total.
         {  // Too big to handle
            if (gDefenseReflexPaused == false)
            {  // We weren't paused, do it
               pauseDefenseReflex();
            }
            // Consider a call for help
            panic = true;
            if ( ((xsGetTime() - lastHelpTime) < 300000) && (lastHelpBaseID == gDefenseReflexBaseID) )  // We called for help in the last five minutes, and it was this base
               panic = false;
            if ( ((xsGetTime() - lastHelpTime) < 60000) && (lastHelpBaseID != gDefenseReflexBaseID) )  // We called for help anywhere in the last minute
               panic = false;
            
            if (panic == true)
            {
               sendStatement(cPlayerRelationAlly, cAICommPromptToAllyINeedHelpMyBase, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
               aiEcho("     I'm calling for help.");
               lastHelpTime = xsGetTime();
            }
         } 
         else
         {  // Size is OK to handle, shouldn't be in paused mode.
            if (gDefenseReflexPaused == true)   // Need to turn it active
            {
               moveDefenseReflex( kbBaseGetLocation(cMyID,  kbBaseGetMainID(cMyID)), cvDefenseReflexRadiusActive, kbBaseGetMainID(cMyID));
            }
         }
      }
      else  // Defense reflex wasn't set to main base.
      {  // Need to set the defense reflex to home base...doesn't matter if it was inactive or guarding another base, home base trumps all.
		  
		  moveDefenseReflex( kbBaseGetLocation(cMyID,  kbBaseGetMainID(cMyID)), cvDefenseReflexRadiusActive, kbBaseGetMainID(cMyID));
         // This is a new defense reflex in the main base.  Consider making a chat about it.
         int enemyPlayerID = kbUnitGetPlayerID(kbUnitQueryGetResult(enemyArmyQuery, 0));
         if ( (enemyPlayerID > 0) && (kbGetAge() > cAge1) ) 
         {  // Consider sending a chat as long as we're out of age 1.
            int enemyPlayerUnitCount = getUnitCountByLocation(cUnitTypeLogicalTypeLandMilitary, enemyPlayerID, cUnitStateAlive, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID), 50.0);
            if ( (enemyPlayerUnitCount > (2 * gGoodArmyPop)) && (enemyPlayerUnitCount > (3* armySize)) )
            {  // Enemy army is big, and we're badly outnumbered
               sendStatement(enemyPlayerID, cAICommPromptToEnemyISpotHisArmyMyBaseOverrun, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
               aiEcho("Sending OVERRUN prompt to player "+enemyPlayerID+", he has "+enemyPlayerUnitCount+" units.");
               aiEcho("I have "+armySize+" units, and "+gGoodArmyPop+" is a good army size.");
               return;
            }
            if (enemyPlayerUnitCount > (2 * gGoodArmyPop))
            {  // Big army, but I'm still in the fight
               sendStatement(enemyPlayerID, cAICommPromptToEnemyISpotHisArmyMyBaseLarge, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
               aiEcho("Sending LARGE ARMY prompt to player "+enemyPlayerID+", he has "+enemyPlayerUnitCount+" units.");
               aiEcho("I have "+armySize+" units, and "+gGoodArmyPop+" is a good army size.");
               return;
            }
            if (enemyPlayerUnitCount > gGoodArmyPop)
            {
               // Moderate size
               sendStatement(enemyPlayerID, cAICommPromptToEnemyISpotHisArmyMyBaseMedium, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
               aiEcho("Sending MEDIUM ARMY prompt to player "+enemyPlayerID+", he has "+enemyPlayerUnitCount+" units.");
               aiEcho("I have "+armySize+" units, and "+gGoodArmyPop+" is a good army size.");
               return;
            }
            if ( (enemyPlayerUnitCount < gGoodArmyPop) && (enemyPlayerUnitCount < armySize) )
            {  // Small, and under control
               sendStatement(enemyPlayerID, cAICommPromptToEnemyISpotHisArmyMyBaseSmall, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
               aiEcho("Sending SMALL ARMY prompt to player "+enemyPlayerID+", he has "+enemyPlayerUnitCount+" units.");
               aiEcho("I have "+armySize+" units, and "+gGoodArmyPop+" is a good army size.");
               return;
            }
         }
      }
      return;  // Do not check other bases
   }
   
   // If we're this far, the main base is OK.  If we're in a defense reflex, see if we should stay in it, or change from passive to active.
   
   if (gDefenseReflex == true) // Currently in a defense mode, let's see if it should remain
   {
      kbUnitQuerySetPosition(enemyArmyQuery, gDefenseReflexLocation);
      kbUnitQuerySetMaximumDistance(enemyArmyQuery, cvDefenseReflexSearchRadius);  
      kbUnitQuerySetSeeableOnly(enemyArmyQuery, true);
      kbUnitQuerySetState(enemyArmyQuery, cUnitStateAlive);
      kbUnitQueryResetResults(enemyArmyQuery);
      enemyArmySize = kbUnitQueryExecute(enemyArmyQuery);
      aiEcho("******** Defense reflex in base "+gDefenseReflexBaseID+" at "+gDefenseReflexLocation);
      aiEcho("******** Enemy unit count: "+enemyArmySize+", my unit count (defend+reserve) = "+armySize);
      for (i=0; < enemyArmySize)
      {
         unitID = kbUnitQueryGetResult(enemyArmyQuery, i);
         protoUnitID = kbUnitGetProtoUnitID(unitID);
         if (i < 2)
            aiEcho("    "+unitID+" "+kbGetProtoUnitName(protoUnitID)+" "+kbUnitGetPosition(unitID));
      }

      if (enemyArmySize < 2)
      {  // Abort, no enemies, or just one scouting unit
         aiEcho("******** Ending defense reflex, no enemies remain.");
         endDefenseReflex();
         return;
      }
      

      if (baseBuildingCount(gDefenseReflexBaseID) <= 0)
      {  // Abort, no enemies, or just one scouting unit
         aiEcho("******** Ending defense reflex, base "+gDefenseReflexBaseID+" has no buildings.");
         endDefenseReflex();
         return;
      }
      
      if ( kbBaseGetOwner(gDefenseReflexBaseID) <= 0)
      {  // Abort, base doesn't exist
         aiEcho("******** Ending defense reflex, base "+gDefenseReflexBaseID+" doesn't exist.");
         endDefenseReflex();
         return;
      }
      
      // The defense reflex for this base should remain in effect.
      // Check whether to start/end paused mode.
      int unitsNeeded = gGoodArmyPop;        // At least a credible army to fight them
      if (unitsNeeded > (enemyArmySize/2))   // Or half their force, whichever is less.
         unitsNeeded = enemyArmySize/2;
      bool shouldPause = false;
      if ( (armySize < unitsNeeded) && ( (armySize * 3.0) < enemyArmySize) )
         shouldPause = true;  // We should pause if not paused, or stay paused if we are
      
      if (gDefenseReflexPaused == false)
      {  // Not currently paused, do it
         if (shouldPause == true)
         {
            pauseDefenseReflex();
            aiEcho("******** Enemy count "+enemyArmySize+", my army count "+armySize);
         }
      }
      else
      {  // Currently paused...should we remain paused, or go active?
         if ( shouldPause == false )
         {
            moveDefenseReflex(gDefenseReflexLocation, cvDefenseReflexRadiusActive, gDefenseReflexBaseID);   // Activate it 
            aiEcho("******** Enemy count "+enemyArmySize+", my army count "+armySize);
         }
      }
      if (shouldPause == true)
      {  // Consider a call for help
         panic = true;
         if ( ((xsGetTime() - lastHelpTime) < 300000) && (lastHelpBaseID == gDefenseReflexBaseID) )  // We called for help in the last five minutes, and it was this base
            panic = false;
         if ( ((xsGetTime() - lastHelpTime) < 60000) && (lastHelpBaseID != gDefenseReflexBaseID) )  // We called for help anywhere in the last minute
            panic = false;
         
         if (panic == true)
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyINeedHelpMyBase, kbBaseGetLocation(cMyID,  gDefenseReflexBaseID));
            aiEcho("     I'm calling for help.");
            lastHelpTime = xsGetTime();
         }         
      }
      return;  // Done...we're staying in defense mode for this base, and have paused or gone active as needed.
   }

   
   // Not in a defense reflex, see if one is needed
 
   // Check other bases
   int baseCount = -1;
   int baseIndex = -1;
   int baseID = -1;

   baseCount = kbBaseGetNumber(cMyID);
   unitsNeeded = gGoodArmyPop/2;
   if (baseCount > 0)
   {
      for(baseIndex=0; < baseCount) 
      {
         baseID = kbBaseGetIDByIndex(cMyID, baseIndex);
         if (baseID == kbBaseGetMainID(cMyID))
            continue;   // Already checked main at top of function
         
         if ( baseBuildingCount(baseID) <= 0)
         {
            aiEcho("Base "+baseID+" has no buildings.");
            continue;   // Skip bases that have no buildings
         }

         // Check for overrun base
         kbUnitQuerySetPosition(enemyArmyQuery,  kbBaseGetLocation(cMyID,  baseID));
         kbUnitQuerySetMaximumDistance(enemyArmyQuery, cvDefenseReflexSearchRadius); 
         kbUnitQuerySetSeeableOnly(enemyArmyQuery, true);
         kbUnitQuerySetState(enemyArmyQuery, cUnitStateAlive);
         kbUnitQueryResetResults(enemyArmyQuery);
         enemyArmySize = kbUnitQueryExecute(enemyArmyQuery);
         // Do I need to call for help?

         if ( (enemyArmySize >= 2)  )
         {  // More than just a scout...set defense reflex for this base
            moveDefenseReflex(kbBaseGetLocation(cMyID, baseID), cvDefenseReflexRadiusActive, baseID);
            aiEcho("******** Enemy count is "+enemyArmySize+", my army size is "+armySize);                  

            if ( (enemyArmySize > (armySize * 2.0)) && (enemyArmySize > 6))   // Double my size, get help...
            {
               panic = true;
               if ( ((xsGetTime() - lastHelpTime) < 300000) && (lastHelpBaseID == baseID) )  // We called for help in the last five minutes, and it was this base
                  panic = false;
               if ( ((xsGetTime() - lastHelpTime) < 60000) && (lastHelpBaseID != baseID) )  // We called for help anywhere in the last minute
                  panic = false;
               
               if (panic == true)
               {
                  // Don't kill other missions, this isn't the main base.  Just call for help.
                  sendStatement(cPlayerRelationAlly, cAICommPromptToAllyINeedHelpMyBase, kbBaseGetLocation(cMyID, baseID));
                  aiEcho("     I'm calling for help.");
                  lastHelpTime = xsGetTime();
               }
                  
            }
            return;     // If we're in trouble in any base, ignore the others.
         } 
      }  // For baseIndex...
   }
}



//==============================================================================
/*
   selectCaptain

   Updates the global gIAmCaptain bool.  Also sets the gCaptainPlayerNumber int.
   Algorithm is brain-dead simple.
   I am captain if I am the lowest-numbered AI player on a team with no 
   human players.  Otherwise, I am not captain.

*/
//==============================================================================
rule selectCaptain
active
minInterval 30
{
   int player = -1;
   bool amCaptain = false;  // Unless proven otherwise
   bool humanTeammate = false;   // Set true if/when a human teammate is found
   int captainsNumber = -1;   // Set when we find a captain


   for (player = 1; < cNumberPlayers)
   {
      if (kbHasPlayerLost(player) == false)
      {
         if (kbIsPlayerAlly(player) == true)
         {
            // if this player is human, that's the captainsNumber
            if ( (kbIsPlayerHuman(player) == true) && (kbHasPlayerLost(player) == false) && (humanTeammate == false) )
            {
               amCaptain = false;         // AI player is definitely not human
               captainsNumber = player;
               humanTeammate = true;
            }
            else
            {  // This is an AI player or a human player other than the first.  If it's not me and has a lower number and there's no human yet, he's captain.
               if( (kbIsPlayerHuman(player) == false) && (kbHasPlayerLost(player) == false)  && (humanTeammate == false) )
               {
                  if ( (player <= cMyID) && (captainsNumber < 0) )   // He's <= me and there's no captain yet
                  {
                     captainsNumber = player;
                     if (player == cMyID)
                        amCaptain = true;    // I'm the captain...unless human player is found later.
                  }
               }
            }
         }
      }
   }  // End for(player) loop.
   if ( (captainsNumber != gCaptainPlayerNumber) || (gIAmCaptain != amCaptain) )
   {  // Something changed
      aiEcho("***  Old captain was "+gCaptainPlayerNumber+", new captain is "+captainsNumber);
      gCaptainPlayerNumber = captainsNumber;
      gIAmCaptain = amCaptain;
   }
}




int getMapID(void)
{
   int mapIndex = 0;
   for (mapIndex = 0; < xsArrayGetSize(gMapNames))
   {
      if ( xsArrayGetString(gMapNames, mapIndex) == cRandomMapName )
      {
         return(mapIndex);
      }
   }
   return(-1);
}

//==============================================================================
/* initPersonality()
   
   A function to set defaults that need to be in place before the loader file's
   preInit() function is called.  
*/
//==============================================================================
void initPersonality(void)
{

   int civ = kbGetCiv();
   if (civ == cCivTheCircle)
      civ = cCivBritish;
   if (civ == cCivPirate)
      civ = cCivBritish;
   if (civ == cCivSPCAct3)
      civ = cCivBritish;
   // Set behavior traits
   aiEcho("My civ is "+civ);
   switch(civ)
   {
      case cCivBritish:    // Elizabeth:  Infantry oriented boomer, favors natives
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivFrench:     // Napoleon:  Cav oriented, balanced, favors natives
      {
         btRushBoom = -1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivSpanish:    // Isabella:  Rusher, disdains trading posts
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivRussians:   // Ivan:  Infantry oriented turtler
      {
         btRushBoom = 1.0;   // Slight boomer, he needs the econ in age 2 to keep settlers training.
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivGermans:    // Cavalry oriented rusher
      {
         btRushBoom = -1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = 0.0;
         break;
      }
      case cCivDutch:      // Turtler, boomish, huge emphasis on trade
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivPortuguese: // Artillery oriented boomer, favors trade   
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivOttomans:   // Artillery oriented, balanced
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivXPSioux:   // Extreme rush, ignores trade routes
      {
         btRushBoom = -1.0;
         btOffenseDefense = 0.5;
         btBiasCav = 0.5;
         btBiasInf = -0.5;
         btBiasArt = 0.0;  
         btBiasNative = -1.0;
         btBiasTrade = -1.0;
         break;
      }
      case cCivXPIroquois:   // Balanced, trade and native bias.
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = 0.0;
         btBiasInf = 0.0;
         btBiasArt = 0.5;   
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivXPAztec:   // Chaotic, but usually light boom, defensive.
      {
         btRushBoom = -1.0;
         btOffenseDefense = 0.5;
         btBiasCav = -1.0;
         btBiasInf = -1.0;
         btBiasArt = -1.0;  
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivChinese:   // Kangxi:  Infantry oriented turtler
      {
         btRushBoom = -1.0;   // Slight boomer, he needs the econ in age 2 to keep settlers training.
         btOffenseDefense = 0.5;
         btBiasCav = 0.0;
         btBiasInf = 0.0;
         btBiasArt = 0.0;
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivJapanese:   // Extreme rush, ignores trade routes
      {
         btRushBoom = 1.0;
         btOffenseDefense = 0.5;
         btBiasCav = 0.0;
         btBiasInf = 0.0;
         btBiasArt = 0.0;  
         btBiasNative = -0.5;
         btBiasTrade = -0.5;
         break;
      }
      case cCivIndians:    // Cavalry oriented rusher
      {
         btRushBoom = -1.0;
         btOffenseDefense = 0.5;
         btBiasCav = 0.0;
         btBiasInf = -0.5;
         btBiasArt = 0.0;
         btBiasNative = -0.5;
         btBiasTrade = 0.0;
         break;
      }
   }
   
   if (gSPC == false)
      btBiasCav = btBiasCav - 0.30; // Adjust cav-heavy choices across the board.  This will reduce the pref by .15, equivalent to a combat efficiency change of .075

   
	// Set default politician choices
   aiSetPoliticianChoice(cAge2, aiGetPoliticianListByIndex(cAge2, 0));  // Just grab the first available
   aiSetPoliticianChoice(cAge3, aiGetPoliticianListByIndex(cAge3, 0));
   aiSetPoliticianChoice(cAge4, aiGetPoliticianListByIndex(cAge4, 0));
   aiSetPoliticianChoice(cAge5, aiGetPoliticianListByIndex(cAge5, 0));



	//-- See who we are playing against.  If we have played against these players before, seed out unitpicker data, and then chat some.
	//XS_HELP("float aiPersonalityGetGameResource(int playerHistoryIndex, int gameIndex, int resourceID): Returns the given resource from the gameIndex game. If gameIndex is -1, this will return the avg of all games played.")
	//XS_HELP("int aiPersonalityGetGameUnitCount(int playerHistoryIndex, int gameIndex, int unitType): Returns the unit count from the gameIndex game. If gameIndex is -1, this will return the avg of all games played.")
   // TODO:  To understand my opponent's unit biases, I'll have to do the following:
   //          1)  Store the opponents civ each game
   //          2)  On game start, look up his civ from last game
   //          3)  Based on his civ, look up how many units he made of each class (inf, cav, art), compare to 'normal'.
   //          4)  Set unitPicker biases to counter what he's likely to send.  
   
	int numPlayerHistories = aiPersonalityGetNumberPlayerHistories();
	aiEcho("PlayerHistories: "+numPlayerHistories);
	for (pid = 1; < cNumberPlayers)
	{
		//-- Skip ourself.
		if (pid == cMyID)
			continue;

		//-- get player name
		string playerName = kbGetPlayerName(pid);
		aiEcho("PlayerName: "+playerName);

		//-- have we played against them before.
		int playerHistoryID = aiPersonalityGetPlayerHistoryIndex(playerName);
		if(playerHistoryID == -1)
		{
			aiEcho("PlayerName: Never played against");
			//-- Lets make a new player history.
			playerHistoryID = aiPersonalityCreatePlayerHistory(playerName);
         if (kbIsPlayerAlly(pid) == true)
            sendStatement(pid, cAICommPromptToAllyIntro); 
         else
            sendStatement(pid, cAICommPromptToEnemyIntro);
			if(playerHistoryID == -1)
			{
				aiEcho("PlayerName: Failed to create player history for "+playerName);
				continue;
			}
			aiEcho("PlayerName: Created new history for "+playerName);
		}
		else
		{
			//-- get how many times we have played against them.
			float totalGames = aiPersonalityGetPlayerGamesPlayed(playerHistoryID, cPlayerRelationAny);
			float numberGamePlayedAgainst = aiPersonalityGetPlayerGamesPlayed(playerHistoryID, cPlayerRelationEnemy);
			float numberGamesTheyWon = aiPersonalityGetTotalGameWins(playerHistoryID, cPlayerRelationEnemy);
			float myWinLossRatio = 1.0 - (numberGamesTheyWon/numberGamePlayedAgainst);
			aiEcho("PlayedAgainst: "+numberGamePlayedAgainst);
			aiEcho("TimesTheyWon: "+numberGamesTheyWon);
			aiEcho("MyWinLossRatio: "+myWinLossRatio);

			bool iWonOurLastGameAgainstEachOther = aiPersonalityGetDidIWinLastGameVS(playerHistoryID);
			//bool weWonOurLastGameTogether; <-- cant do yet.
         

			//-- get how fast they like to attack
         // Minus one game index gives an average.
			int avgFirstAttackTime = aiPersonalityGetGameFirstAttackTime(playerHistoryID, -1);
			aiEcho("Player's Avg first Attack time: "+avgFirstAttackTime);

			int lastFirstAttackTime = aiPersonalityGetGameFirstAttackTime(playerHistoryID, totalGames-1);
			aiEcho("Player's Last game first Attack time: "+lastFirstAttackTime);

			//-- save some info.
			aiPersonalitySetPlayerUserVar(playerHistoryID, "myWinLossPercentage", myWinLossRatio);
			//-- test, get the value back out
			float tempFloat = aiPersonalityGetPlayerUserVar(playerHistoryID, "myWinLossPercentage");
         
         // Consider chats based on player history...
         // First, combinations of "was ally last time" and "am ally this time"
         bool wasAllyLastTime = true;
         bool isAllyThisTime = true;
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "wasMyAllyLastGame") == 0.0)
            wasAllyLastTime = false;
         if (kbIsPlayerAlly(pid) == false)
            isAllyThisTime = false;
         bool difficultyIsHigher = false;
         bool difficultyIsLower = false;
         float lastDifficulty = aiPersonalityGetPlayerUserVar(playerHistoryID, "lastGameDifficulty");
         if (lastDifficulty >= 0.0)
         {
            if (lastDifficulty > aiGetWorldDifficulty())
               difficultyIsLower = true;
            if (lastDifficulty < aiGetWorldDifficulty())
               difficultyIsHigher = true;
         }
         bool iBeatHimLastTime = false;
         bool heBeatMeLastTime = false;
         bool iCarriedHimLastTime = false;
         bool heCarriedMeLastTime = false;
  
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "heBeatMeLastTime") == 1.0) // STORE ME
            heBeatMeLastTime = true;         
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "iBeatHimLastTime") == 1.0) // STORE ME
            iBeatHimLastTime = true;
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "iCarriedHimLastTime") == 1.0) // STORE ME
            iCarriedHimLastTime = true;
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "heCarriedMeLastTime") == 1.0) // STORE ME
            heCarriedMeLastTime = true;
         
        
         if (wasAllyLastTime == false)
         {
            if (aiPersonalityGetPlayerUserVar(playerHistoryID, "iBeatHimLastTime") == 1.0) // STORE ME
               iBeatHimLastTime = true;
            if (aiPersonalityGetPlayerUserVar(playerHistoryID, "heBeatMeLastTime") == 1.0) // STORE ME
               heBeatMeLastTime = true;
         }
         
         bool iWonLastGame = false;
         if (aiPersonalityGetPlayerUserVar(playerHistoryID, "iWonLastGame") == 1.0) // STORE ME
            iWonLastGame = true;
         
        
         if (isAllyThisTime)
         {  // We are allies
            if (difficultyIsHigher == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenDifficultyHigher);
            if (difficultyIsLower == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenDifficultyLower);
            if (iCarriedHimLastTime == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenICarriedHimLastGame);
            if (heCarriedMeLastTime == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenHeCarriedMeLastGame);
            if (iBeatHimLastTime == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenIBeatHimLastGame);
            if (heBeatMeLastTime == true)
               sendStatement(pid, cAICommPromptToAllyIntroWhenHeBeatMeLastGame);

            aiEcho("Last map ID was "+aiPersonalityGetPlayerUserVar(playerHistoryID, "lastMapID"));
            if ( (getMapID() >= 0) && (getMapID() == aiPersonalityGetPlayerUserVar(playerHistoryID, "lastMapID")) )
            {
               sendStatement(pid, cAICommPromptToAllyIntroWhenMapRepeats);
               aiEcho("Last map ID was "+aiPersonalityGetPlayerUserVar(playerHistoryID, "lastMapID"));
            }
            if (wasAllyLastTime)
            {               
               aiEcho(playerName + " was my ally last game and is my ally this game.");
               if (iWonLastGame == false)
                  sendStatement(pid, cAICommPromptToAllyIntroWhenWeLostLastGame);
               else
                  sendStatement(pid, cAICommPromptToAllyIntroWhenWeWonLastGame);
            }
            else
            {
               aiEcho(playerName + " was my enemy last game and is my ally this game.");
            }
         }
         else
         {  // We are enemies
            if (difficultyIsHigher == true)
               sendStatement(pid, cAICommPromptToEnemyIntroWhenDifficultyHigher);
            if (difficultyIsLower == true)
               sendStatement(pid, cAICommPromptToEnemyIntroWhenDifficultyLower);
            if ( (getMapID() >= 0) && (getMapID() == aiPersonalityGetPlayerUserVar(playerHistoryID, "lastMapID")) )
               sendStatement(pid, cAICommPromptToEnemyIntroWhenMapRepeats);
            if (wasAllyLastTime)
            {
               aiEcho(playerName + " was my ally last game and is my enemy this game.");
            }
            else
            {
               aiEcho(playerName + " was my enemy last game and is my enemy this game.");
               // Check if he changed the odds
               // First, see if enemyCount is the same, but ally count is down
               int enemyCount = aiPersonalityGetPlayerUserVar(playerHistoryID, "myEnemyCount");
               int allyCount = aiPersonalityGetPlayerUserVar(playerHistoryID, "myAllyCount");
               if (enemyCount == getEnemyCount())
               {
                  if (allyCount > getAllyCount())  // I have fewer allies now
                     sendStatement(pid, cAICommPromptToEnemyIntroWhenTeamOddsEasier);  // He wimped out
                  if (allyCount < getAllyCount()) // I have more allies now
                     sendStatement(pid, cAICommPromptToEnemyIntroWhenTeamOddsHarder);  // He upped the difficulty
               }
               // Next, see if allyCount is the same, but enemyCount is smaller
               if (allyCount == getAllyCount())
               {
                  if (enemyCount > getEnemyCount())  // I have fewer enemies now
                     sendStatement(pid, cAICommPromptToEnemyIntroWhenTeamOddsHarder);  // He upped the difficulty
                  if (enemyCount < getEnemyCount()) // I have more enemies now
                     sendStatement(pid, cAICommPromptToEnemyIntroWhenTeamOddsEasier);  // He wimped out
               }               
            }
         }         
		}
      
      // Save info about this game
      aiPersonalitySetPlayerUserVar(playerHistoryID, "lastGameDifficulty", aiGetWorldDifficulty());
      int wasAlly = 0;
      if (kbIsPlayerAlly(pid)==true)
         wasAlly = 1;
      else
      {  // He is an enemy, remember the odds (i.e. 1v3, 2v2, etc.)
         aiPersonalitySetPlayerUserVar(playerHistoryID, "myAllyCount", getAllyCount());
         aiPersonalitySetPlayerUserVar(playerHistoryID, "myEnemyCount", getEnemyCount());         
      }
      aiPersonalitySetPlayerUserVar(playerHistoryID, "wasMyAllyLastGame", wasAlly);
      aiPersonalitySetPlayerUserVar(playerHistoryID, "lastMapID", getMapID());
     
	}
}

void gameOverHandler(int nothing = 0)
{
   bool iWon = false;
	if(kbHasPlayerLost(cMyID) == false)
		iWon = true;

	aiEcho("Game is over.");
   aiEcho("Have I lost returns "+kbHasPlayerLost(cMyID));
   if(iWon == false)
      aiEcho("I lost.");
   else
      aiEcho("I won.");
   
	for (pid = 1; < cNumberPlayers)
	{
		//-- Skip ourself.
		if (pid == cMyID)
			continue;

		//-- get player name
		string playerName = kbGetPlayerName(pid);
		aiEcho("PlayerName: "+playerName);

		//-- Does a record exist?
		int playerHistoryID = aiPersonalityGetPlayerHistoryIndex(playerName);
		if(playerHistoryID == -1)
		{
			aiEcho("PlayerName: Never played against");
			//-- Lets make a new player history.
			playerHistoryID = aiPersonalityCreatePlayerHistory(playerName);
      }
      
      
/* Store the following user vars:
      heBeatMeLastTime
      iBeatHimLastTime
      iCarriedHimLastTime
      heCarriedMeLastTime
      iWonLastGame
*/            
      if (iWon == true)
      {  // I won
         aiPersonalitySetPlayerUserVar(playerHistoryID, "iWonLastGame", 1.0);
         if (kbIsPlayerEnemy(pid) == true)
         {
            aiPersonalitySetPlayerUserVar(playerHistoryID, "iBeatHimLastTime", 1.0);
            aiPersonalitySetPlayerUserVar(playerHistoryID, "heBeatMeLastTime", 0.0);
            aiEcho("This player was my enemy.");
         }
      }
      else
      {  // I lost
         aiPersonalitySetPlayerUserVar(playerHistoryID, "iWonLastGame", 0.0);
         if (kbIsPlayerEnemy(pid) == true)
         {
            aiPersonalitySetPlayerUserVar(playerHistoryID, "iBeatHimLastTime", 0.0);
            aiPersonalitySetPlayerUserVar(playerHistoryID, "heBeatMeLastTime", 1.0);
            aiEcho("This player was my enemy.");
         }
      }
      if (kbIsPlayerAlly(pid) == true)
      {  // Was my ally
         if ( aiGetScore(cMyID) > (2 * aiGetScore(pid)) )   
         {  // I outscored him badly
            aiPersonalitySetPlayerUserVar(playerHistoryID, "iCarriedHimLastTime", 1.0);
            aiEcho("I carried my ally.");
         }
         else
            aiPersonalitySetPlayerUserVar(playerHistoryID, "iCarriedHimLastTime", 0.0);
         if ( aiGetScore(pid) > (2 * aiGetScore(cMyID) ) )
         {  // My ally carried me.
            aiEcho("My ally carried me.");
            aiPersonalitySetPlayerUserVar(playerHistoryID, "heCarriedMeLastTime", 1.0);
         }
         else
            aiPersonalitySetPlayerUserVar(playerHistoryID, "heCarriedMeLastTime", 0.0);
      }
      else
      {
         aiPersonalitySetPlayerUserVar(playerHistoryID, "iCarriedHimLastTime", 0.0);
         aiPersonalitySetPlayerUserVar(playerHistoryID, "heCarriedMeLastTime", 0.0);
      }
      
   }
   
}


//==============================================================================
/* SPCInit()
   
   A function to set defaults that need to be in place before the loader file's
   preInit() function is called.  
*/
//==============================================================================
void SPCInit(void)
{
   // Taunt defaults to true, but needs to be false in scenario games.
   if (gSPC == true)
      cvOkToTaunt = false;

   if (kbGetCiv() == cCivFrench)
   {
      int i = 0;
      for (i=0; <=cAge5)
      {  // Need fewer coureurs
         xsArraySetInt(gTargetSettlerCounts, i, xsArrayGetInt(gTargetSettlerCounts, i) * 0.9);
      }
   }

   if ( (cRandomMapName == "amazonia") || (cRandomMapName == "caribbean") || (cRandomMapName == "Ceylon") || (cRandomMapName == "Borneo") || (cRandomMapName == "Honshu") )
   {
      aiSetWaterMap(true);
      gWaterMap = true;
   }
}



int gCardNames = -1;       // Array of strings, handy name for this card.
int gCardStates = -1;      // Array of chars (strings), A = avail, N = Not avail, P = Purchased, D = in deck (and purchased)
int gCardPriorities = -1;  // Array of ints, used for selecting cards into deck.  

const int maxCards = 150;
const int deckSize = 44;
const int pointsForLevel2 = 5;   // First five cards must be level 1
const int pointsForLevel3 = 25;  // Cards 6..25 must be levels 1 or 2

rule buyCards
inactive
minInterval 1
{
   static int pass = 0; // Pass 0, init arrays.  Pass 1, buy cards.  Pass 2, create deck.
	static int startingSP = -1;
   if (startingSP < 0)
      startingSP = kbResourceGet(cResourceSkillPoints) - 15;   // XS won't allow float initialization of const ints, also subtract first 15 free cards.
   int remainingSP = kbResourceGet(cResourceSkillPoints) - 15;  
   int SPSpent = startingSP - remainingSP;

   int myLevel = 0;
   if (SPSpent >= 10)
      myLevel = 10;
   if (SPSpent >= 25)
      myLevel = 25;
   if (SPSpent >= 40)
      myLevel = 40;

   int totalCardCount = aiHCCardsGetTotal();
   aiEcho("My starting level is "+myLevel+", my SP remaining is "+remainingSP);
      
   switch(pass)      // Break processing load into 3 passes:  init, buy, deck.
   {
      case 0:  // Init arrays
      {
         gCardNames = xsArrayCreateString(maxCards, " ", "Card names");
         gCardStates = xsArrayCreateString(maxCards, "P", "Card states");  
         gCardPriorities = xsArrayCreateInt(maxCards, 0, "Card priorities");
         
         for (i=0; < totalCardCount)
         {  // First, set maximum priority for the "best" cards 
            // 'Royal Decree', 'Advanced Arsenal' & 'New Ways',
            // plus '2 Grove Rickshaws' & 'Shogun Tokugawa'

            // List of "best" cards also includes 'Agrarianism' for Indians
            // (A bug in aiHCDeckAddCardToDeck() keeps 'Foreign Logging' from being added.)

            // Now, set priorities for the prerequisite cards for the "best" ones.
            // These will be ignored later on.
            // For all other cards, set priorities based on unit type.
            string tempString = "";
            int unit = aiHCCardsGetCardUnitType(i);
            int tech = aiHCCardsGetCardTechID(i);
			   
			if(kbGetCiv() == cCivJapanese)
            {  
               if ( (tech == cTechYPHCMercsSohei1) ||
			   (tech == cTechYPHCMercsSohei2) ||
			   (tech == cTechYPHCMercsSohei3) ||
			   (tech == cTechYPHCShipFune1) ||
			   (tech == cTechYPHCShipFune2) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechYPHCEuropeanCannons) ||
			   (tech == cTechYPHCRainbowTrickle) ||
			   (tech == cTechYPHCChonindoTeam) ||
			   (tech == cTechHCRumDistillery) ||
			   (tech == cTechHCCigarRoller) ||
			   (tech == cTechHCFoodSilos) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCTextileMills) ||
			   (tech == cTechHCRoyalMint) ||
			   (tech == cTechYPHCRedSealShip) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivXPAztec)
            {  
			   if ( (tech == cTechHCXPTempleXipeTotec) ||
			   (tech == cTechHCXPTempleXolotl) ||
			   (tech == cTechHCXPGreatTempleQuetzalcoatl) ||
			   (tech == cTechHCXPTempleXochipilli) ||
			   (tech == cTechHCXPTempleTlaloc) ||
			   (tech == cTechHCXPTempleCenteotl) ||
			   (tech == cTechHCXPTempleCoatlicue) ||
			   (tech == cTechHCXPGreatTempleHuitzilopochtli) ||
			   (tech == cTechHCXPShipFishingBoats) ||
			   (tech == cTechHCXPShipCanoes1) ||
			   (tech == cTechHCXPShipWarCanoes1) ||
			   (tech == cTechHCXPShipHeavyWarCanoes1) ||
			   (tech == cTechHCXPShipHeavyWarCanoes2) ||
			   (tech == cTechHCAdmirality) ||
			   (tech == cTechHCXPWaterDance) ||
			   (tech == cTechHCXPOffshoreSupport) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCFoodSilos) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCXPChinampa2) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivIndians)
            {  
               if ( (tech == cTechYPHCMercsTigerClaw1) ||
			   (tech == cTechYPHCMercsTigerClaw2) ||
			   (tech == cTechYPHCMercsTigerClaw3) ||
			   (tech == cTechYPHCShipCaravel1) ||
			   (tech == cTechYPHCShipCaravel2) ||
			   (tech == cTechYPHCShipCaravel3Double) ||
			   (tech == cTechYPHCBombayMarine) ||
			   (tech == cTechYPHCNavalCombatIndians) ||
			   (tech == cTechYPHCGoraksha) ||
			   (tech == cTechYPHCIronmongerIndians) ||
			   (tech == cTechYPHCRoyalMintIndians) ||
			   (tech == cTechYPHCSawmillsIndians) ||
			   (tech == cTechYPHCAdvancedConsulateIndians) ||
			   (tech == cTechypHCConsulateRelationsIndians) ||
			   (tech == cTechYPHCSmoothRelationsIndians) ||
			   (tech == cTechYPHCForeignLogging) ||
			   (tech == cTechYPHCAgrarianism) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivChinese)
            {  
               if ( (tech == cTechHCMercsManchu) ||
			   (tech == cTechYPHCMercsMandarinArmy1) ||
			   (tech == cTechYPHCShipManchuTeam) ||
			   (tech == cTechYPHCShipWarJunk1) ||
			   (tech == cTechYPHCNavalCombatTeam) ||
			   (tech == cTechYPHCEuropeanCannons) ||
			   (tech == cTechYPHCShipFuchuan1) ||
			   (tech == cTechYPHCShipFuchuanTeam) ||
			   (tech == cTechYPHCShipFireship1) ||
			   (tech == cTechYPHCShipFireshipTeam) ||
			   (tech == cTechYPHCFireshipDamage) ||
			   (tech == cTechYPHCRainbowTrickle) ||
			   (tech == cTechHCCigarRoller) ||
			   (tech == cTechHCSawmills) ||
			   (tech == cTechHCExoticHardwoods) ||
			   (tech == cTechYPHCBannerSchool) ||
			   (tech == cTechHCTextileMills) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivDutch)
            {  
               if ( (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipCaravels2) ||
			   (tech == cTechHCShipFluyts1) ||
			   (tech == cTechHCShipFluyts2) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCPrivateers) ||
			   (tech == cTechHCPrivateers2) ||
			   (tech == cTechHCFoodSilos) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCSawmills) ||
			   (tech == cTechHCMercsLandsknecht2) ||
			   (tech == cTechHCMercsSwissPikemen) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCXPColbertism) ||
			   (tech == cTechHCExoticHardwoods) ||
			   (tech == cTechHCUnlockFactory) ||
			   (tech == cTechHCRobberBarons) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivGermans)
            {  
               if ( (tech == cTechHCMercsLandsknecht1German) ||
			   (tech == cTechHCMercsHessiansGerman) ||
			   (tech == cTechHCMercsLandsknecht2German) ||
			   (tech == cTechHCMercsBlackRidersGerman) ||
			   (tech == cTechHCMercenaryCombatGerman) ||
			   (tech == cTechHCXPDanceHallGerman) ||
			   (tech == cTechHCNavalCombatGerman) ||
			   (tech == cTechHCGuildArtisans) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCUnlockFactoryGerman) ||
			   (tech == cTechHCRobberBaronsGerman) ||
			   (tech == cTechHCRoyalDecreeGerman) ||
			   (tech == cTechHCShipCaravels1German) ||
			   (tech == cTechHCShipGalleonsGerman) ||
			   (tech == cTechHCShipFrigatesGerman) ||
			   (tech == cTechHCShipCaravels2German) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivFrench)
            {  
               if ( (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCPrivateers) ||
			   (tech == cTechHCPrivateers2) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCMercsSwissPikemen) ||
			   (tech == cTechHCFurrier) ||
			   (tech == cTechHCSpiceTrade) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCFoodSilos) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCSilversmith) ||
			   (tech == cTechHCRoyalMint) ||
			   (tech == cTechHCRoyalDecreeFrench) ||
			   (tech == cTechHCRobberBarons) ||
			   (tech == cTechHCUnlockFactory) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivXPIroquois)
            {  
               if ( (tech == cTechHCXPShipFishingBoats) ||
			   (tech == cTechHCXPShipCanoes1) ||
			   (tech == cTechHCFurrierTeam) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCXPIroquoisWoodworking) ||
			   (tech == cTechHCSawmills) ||
			   (tech == cTechHCXPBuccaneers) ||
			   (tech == cTechHCExoticHardwoods) ||
			   (tech == cTechHCRumDistillery) ||
			   (tech == cTechHCXPConservativeTactics) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivOttomans)
            {  
               if ( (tech == cTechHCMercsMamelukes) ||
			   (tech == cTechHCShipGalleys1) ||
			   (tech == cTechHCShipGalleys2) ||
			   (tech == cTechHCShipGalleys3) ||
			   (tech == cTechHCIronmongerTeam) ||
			   (tech == cTechHCSilversmith) ||
			   (tech == cTechHCRoyalMint) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCStonemasons) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCRobberBarons) ||
			   (tech == cTechHCUnlockFactory) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivPortuguese)
            {  
               if ( (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipCaravels2) ||
			   (tech == cTechHCShipCaravels3) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCMercsCorsairs) ||
			   (tech == cTechHCMercsMamelukes) ||
			   (tech == cTechHCMedicine) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCIronmonger) ||
			   (tech == cTechHCSilversmith) ||
			   (tech == cTechHCRoyalMint) ||
			   (tech == cTechHCUnlockFactory) ||
			   (tech == cTechHCRobberBarons) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivXPSioux)
            {  
               if ( (tech == cTechHCXPSiouxDakotaSupport) ||
			   (tech == cTechHCXPSiouxSanteeSupport) ||
			   (tech == cTechHCXPSiouxYanktonSupport) ||
			   (tech == cTechHCXPSiouxNakotaSupport) ||
			   (tech == cTechHCFoodSilos) ||
			   (tech == cTechHCFurrier) ||
			   (tech == cTechHCXPCheyenneAlliesTeam) ||
			   (tech == cTechHCXPCreeAlliesTeam) ||
			   (tech == cTechHCXPSiouxNakotaSupport) ||
			   (tech == cTechHCXPCheyenneAllies1) ||
			   (tech == cTechHCXPCheyenneAllies2) ||
			   (tech == cTechHCXPCreeAllies1) ||
			   (tech == cTechHCXPCreeAllies2) ||
			   (tech == cTechHCSpiceTrade) ||
			   (tech == cTechHCXPGreatHunter) ||
			   (tech == cTechHCXPBuccaneers) ||
			   (tech == cTechHCXPRenegadoAllies) ||
			   (tech == cTechHCXPPistoleroAllies) ||
			   (tech == cTechHCXPEarthBounty) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivBritish)
            {  
               if ( (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCAdmirality) ||
			   (tech == cTechHCNavalGunners) ||
			   (tech == cTechHCMercsHessians) ||
			   (tech == cTechHCUnlockFactory) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCXPImprovedGrenades) ||
			   (tech == cTechHCShipCaravels2) ||
			   (tech == cTechHCPrivateers) ||
			   (tech == cTechHCPrivateers2) ||
			   (tech == cTechHCRobberBarons) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivRussians)
            {  
               if ( (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipCaravels2) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCStonemasons) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCUnlockFactory) ||
			   (tech == cTechHCSawmills) ||
			   (tech == cTechHCExoticHardwoods) ||
			   (tech == cTechHCXPDistributivism) ||
			   (tech == cTechHCMercsHighlanders) ||
			   (tech == cTechHCXPIndustrialRevolution) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else if(kbGetCiv() == cCivSpanish)
            {  
               if ( (tech == cTechHCXPDanceHall) ||
			   (tech == cTechHCShipCaravels1) ||
			   (tech == cTechHCShipGalleons) ||
			   (tech == cTechHCSpanishGalleons) ||
			   (tech == cTechHCArmada) ||
			   (tech == cTechHCSpanishTreasureFleet) ||
			   (tech == cTechHCXPSpanishGold) ||
			   (tech == cTechHCShipFrigates) ||
			   (tech == cTechHCNavalCombat) ||
			   (tech == cTechHCRumDistillery) ||
			   (tech == cTechHCCigarRoller) ||
			   (tech == cTechHCTextileMills) ||
			   (tech == cTechHCSustainableAgriculture) ||
			   (tech == cTechHCRefrigeration) ||
			   (tech == cTechHCIronmongerTeam) ||
			   (tech == cTechHCSilversmith) ||
			   (tech == cTechHCRoyalMint) ||
			   (tech == cTechHCShipCaravels2) ||
			   (tech == cTechHCXPEconomicTheory) ||
			   (tech == cTechHCUnlockFactory) ||
			   (tech == cTechHCColonialMilitia) ||
			   (tech == cTechHCXPIndustrialRevolution) )
			      xsArraySetInt(gCardPriorities, i, 7);
			   else
			      xsArraySetInt(gCardPriorities, i, 6);
            }
			else
            {  
               if(i>100)
			      xsArraySetInt(gCardPriorities, i, 6);
			   else
			      xsArraySetInt(gCardPriorities, i, 5);
            }
			
			
            // Priorities 2-4 will be set when the card is purchased, based on "find best" category that gets them.
            
			//add
			xsArraySetString(gCardStates, i, "A"); 

            if (aiHCCardsGetCardCount(i) < 0)
               tempString = " Infinite";
            else
               tempString = "   "+aiHCCardsGetCardCount(i)+" use";
            tempString = tempString + " Pri "+xsArrayGetInt(gCardPriorities, i)+" ";
            tempString = tempString + " "+xsArrayGetString(gCardStates, i);
            tempString = tempString + "  L"+aiHCCardsGetCardLevel(i);
            tempString = tempString + "  A"+aiHCCardsGetCardAgePrereq(i);
            tempString = tempString + " ("+tech+") "+kbGetTechName(tech);
            if (unit >= 0)
            {
               tempString = tempString + " "+aiHCCardsGetCardUnitCount(i)+" "+kbGetProtoUnitName(unit);
            }
            
            xsArraySetString(gCardNames, i, tempString);
            aiEcho(i+" "+tempString);
         }
         pass = 1;   // Buy cards next time
         break;
      }
      case 1:  // Buy cards
      {
         for (attempt = 0; < 5)
         {
            
            if (remainingSP <= 0) // Have no points to spend...
               break;
            
            bool result = false;

            int boughtCardIndex = -1;
            int highestPriority = 0;   // Priority higher than this will be bought.
            // First, scan for the high-priority cards.
            for (index=0; <totalCardCount)  
            {  // Scan the list, looking for the highest-priority card still available
               if ( (aiHCCardsGetCardLevel(index) > myLevel) || (aiHCCardsCanIBuyThisCard(-1, index) == false) || (xsArrayGetString(gCardStates, index) == "P"))
                  continue;   // Skip it.  Note...I use the "P" (purchased) flag to indicate ones that are purchased, AND ones that have failed in a buy attempt.                  
               // It is legal and available
               if (xsArrayGetInt(gCardPriorities, index) > highestPriority)
               {
                  boughtCardIndex = index;
                  highestPriority = xsArrayGetInt(gCardPriorities, index);
               }
            }
            if (boughtCardIndex >= 0)
            {
               result = aiHCCardsBuyCard(boughtCardIndex);
               aiEcho("Buying priority "+highestPriority+" card "+xsArrayGetString(gCardNames, boughtCardIndex));
            }
          

            // If we're here, we've either selected a card, or exhausted the list.
            if (boughtCardIndex < 0)
            {  // Nothing to buy?!
               aiEcho("  ERROR!  We have points to spend, but no cards to buy.");
               pass = 2;   // go on to deck picking
               return;
            }
            // We've selected a card.  Did the purchase work?
            if (result == false)
            {  // It failed, blacklist this card by marking it owned in the array.
               aiEcho("  ERROR!  Failed to buy card "+xsArrayGetString(gCardNames, boughtCardIndex));
            }
            xsArraySetString(gCardStates, boughtCardIndex, "P");  // Even if purchase failed, mark it purchased so we don't get stuck on it.
            remainingSP = remainingSP - 1;
            SPSpent = SPSpent + 1;
            if (SPSpent >= 10)
               myLevel = 10;
            if (SPSpent >= 25)
               myLevel = 25;
			if (SPSpent >= 40)
               myLevel = 40;
         }  // For attempt 0..4
         
         if (remainingSP <= 0)
            pass = 2;
      }  // case 1
      case 2:  // Make deck
      {  
         aiEcho("Making deck");
         if (gSPC == true)
			{
				if (gDefaultDeck < 0)
					gDefaultDeck = aiHCDeckCreate("The AI Deck");
			}
			else
			{
				//-- In non spc games, the game will make an empty deck for AI's at index 0.
				gDefaultDeck = 0;
			}
         
         aiEcho("Building Deck");
         int cardsRemaining = 24;
         int toPick = 2;
        
         // First, "best" cards (if available).
         for (card=0; < maxCards)
         {
            if (((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipSettlersAsian2") ) ||
                ((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipSamurai2") ) ||
                ((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCSamuraiDamage") ) ||
                ((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCSamuraiSpeed") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCNaginataHitpoints") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "ypHCShipWoodCrates4") ) || //YPHCNaginataAntiInfantryDamage
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCJapaneseSiege") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipShogunate") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCNobleCombat") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCRedSealShip") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCIncreasedTribute") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCChonindoTeam") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCEuropeanCannons") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCMercsSohei3") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCArtilleryHitpointsJapanese") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCJapaneseMonkRangeAura") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipFune2") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCRainbowTrickle") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCArtilleryCostJapanese") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "ypHCShipWoodCrates2") ) ||
				((kbGetCiv() == cCivJapanese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "ypHCShipCoinCrates2") ) ||
				
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCInfantrySpeedHitpointsTeam") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCElephantLimit") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCElephantCombatIndians") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipUrumiTeam") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipUrumi2") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCRidingSchoolIndians") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCAgrarianism") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCRoyalMintIndians") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCMercsTigerClaw3") ) ||
                ((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCElephantTrampling") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCMeleeDamageIndians") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipUrumi1") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCGrazing") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCForeignLogging") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCNavalCombatIndians") ) || //YPHCEuropeanCannonsIndians
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipUrumiRegiment") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipWoodCrates2Indians") ) || 
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipFoodCrates4Indians") ) || //YPHCSmoothRelationsIndians
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipRhino1") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCEastIndiaCompany") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipCoinCrates4Indians") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipCoinCrates2Indians") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipCaravel2") ) ||
				((kbGetCiv() == cCivIndians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipCaravel3Double") ) ||
				
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCWesternReforms") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCArtilleryCombatChinese") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCManchuCombat") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCAccupuncture") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) || //HCShipCoinCrates3 HCShipWoodCrates3
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCMongolianScourge") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCEngineeringSchoolTeam") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCNavalCombatTeam") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCEuropeanCannons") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCOldHanArmyReforms") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCSpawnRefugees1") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCArtilleryHitpointsChinese") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCArtilleryDamageChinese") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipManchuTeam") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCHanAntiCavalryBonus") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipFuchuanTeam") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCForbiddenArmyArmor") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCBannerSchool") ) ||
				((kbGetCiv() == cCivChinese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "YPHCShipFuchuan1") ) ||
				
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlerWagons3") ) ||
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3German") ) || //HCShipSettlerWagons4
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3German") ) ||
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatGerman") ) ||
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactoryGerman") ) ||
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBaronsGerman") ) ||
                ((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCHandInfantryCombatGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4German") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUhlanCombatGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryDamageGermanTeam") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4German") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercsBlackRidersGerman") ) || // HCMercsLandsknecht2German
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercenaryCombatGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenalGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels2German") ) || //HCXPDanceHallGerman
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2German") ) || //HCFencingSchoolGerman
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRidingSchoolGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalDecreeGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlerWagons4") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFrigatesGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryHitpointsGerman") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEconomicTheory") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCannons1German") ) ||
				((kbGetCiv() == cCivGermans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMintGerman") ) ||
				
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers3") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatDutch") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBarons") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCBetterBanks") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalDecreeDutch") ) || //HCNavalCombat
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCBanks1") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCBanks2") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCInfantryHitpointsDutchTeam") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCFencingSchool") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCInfantryDamageDutch") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) || //HCXPColbertism
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates2") ) || //HCRidingSchool
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCInfantryCombatDutch") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) || //HCShipCaravels2
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates2") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPMilitaryReforms") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercsSwissPikemen") ) || //HCMercsLandsknecht2
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCPrivateers2") ) ||
				((kbGetCiv() == cCivDutch) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFluyts2") ) ||
				
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers3") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBarons") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatBritish") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFalconets3") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates2") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels2") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPOffshoreSupport") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCFencingSchool") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) || //HCMusketeerGrenadierHitpointsBritishTeam
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryHitpointsBritish") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
                ((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMusketeerGrenadierCombatBritish") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMusketeerGrenadierDamageBritish") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) || //HCNavalCombat
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalGunners") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers4") ) || //HCShipFoodCrates3 HCShipCoinCrates3
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipRockets2") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCImprovedLongbows") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipHorseArtillery2") ) ||
				((kbGetCiv() == cCivBritish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCPrivateers2") ) ||
				
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatFrench") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBarons") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRidingSchool") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPThoroughbreds") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCHandCavalryDamageFrenchTeam") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCHandCavalryHitpointsFrench") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalDecreeFrench") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoureurs3") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoureurs2") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFalconets3") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercsSwissPikemen") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPGribeauvalSystem") ) ||
                ((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRangedInfantryDamageFrenchTeam") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCPrivateers2") ) ||
				((kbGetCiv() == cCivFrench) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEconomicTheory") ) ||
				
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers4") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPUnction") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers2") ) || //HCShipFoodCrates2 HCNavalCombat
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPIndustrialRevolution") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCHandCavalryCombatSpanish") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFalconets3") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCHandInfantryCombatSpanish") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers3") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels2") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCArmada") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCFencingSchool") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates2") ) || //HCHandInfantryDamageSpanishTeam
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCannons1") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCaballeros") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
                ((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFrigates") ) ||
				((kbGetCiv() == cCivSpanish) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEconomicTheory") ) ||
				
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBarons") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCDragoonCombatPortuguese") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates2") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercsMamelukes") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEconomicTheory") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRangedInfantryCombatPortuguese") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels3") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels2") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) || //HCEngineeringSchool
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCFencingSchool") ) ||
                ((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates2") ) || //HCShipCoinCrates2
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRangedInfantryHitpointsPortugueseTeam") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRangedInfantryDamagePortuguese") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates4") ) || //HCArtilleryHitpointsPortugueseTeam
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPGenitours") ) ||
				((kbGetCiv() == cCivPortuguese) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) || //HCRidingSchool
				
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatRussian") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFalconets3") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUniqueCombatRussian") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPIndustrialRevolution") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPDistributivism") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryLOSTeam") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRidingSchool") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCDuelingSchoolTeam") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCaravels2") ) || //HCNavalCombat
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFrigates") ) ||
                ((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCStreletsCombatRussian") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEconomicTheory") ) ||
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCSpawnStrelet") ) || //HCMercsHighlanders
				((kbGetCiv() == cCivRussians) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates2") ) || //HCShipCossacks4
				
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers3") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSettlers2") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCUnlockFactory") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRobberBarons") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCAdvancedArsenal") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCMercsMamelukes") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipSpahisTeam") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates4") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates3") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipGalleys3") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipGalleys2") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) || //HCTeamCoinCrates2
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCEngineeringSchool") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCJanissaryCombatOttoman") ) ||
                ((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCJanissaryCost") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFoodCrates2") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipFalconets3") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCCavalryCombatOttoman") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRefrigeration") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRoyalMint") ) ||
				((kbGetCiv() == cCivOttomans) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) ||
				
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers3") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers2") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCavalryCombatSioux") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCavalryDamageSioux") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipDogsoldiersTeam1") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPMustangs") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCavalryHitpointsSioux") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPNewWaysSioux") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiouxSanteeSupport") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiouxYanktonSupport") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCommandSkill") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCRidingSchool") ) ||
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) || //HCXPWarChiefSioux1
                ((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipAxeRiders3") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates3") ) || //HCXPWindRunner HCShipFoodCrates2
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates3") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) || //HCFoodSilos
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipDogsoldiersTeam2") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipRifleRiders3") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPEarthBounty") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPTeamFoodCrates1") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCheyenneAlliesTeam") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCreeAlliesTeam") ) ||
				((kbGetCiv() == cCivXPSioux) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPBuccaneers") ) ||
				
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers3") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCoyoteCombat") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPKnightCombat") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPTempleXipeTotec") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPGreatTempleHuitzilopochtli") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagersTeam") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPKnightDamage") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPKnightHitpoints") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipSkullKnights4") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPChinampa2") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCTeamCoinCrates2") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCoinCratesAztec5") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers4") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCTeamCoinCrates1") ) ||
                //((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPChinampa1") ) ||
                ((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPOffshoreSupport") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipSkullKnights3") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates4") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipMedicineMenTeamAztec") ) || //HCXPShipMedicineMen2Aztec
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPWarHutTraining") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPWaterDance") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipHeavyWarCanoes2") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPTempleCenteotl") ) ||
				((kbGetCiv() == cCivXPAztec) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPTempleTlaloc") ) ||
				
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCFurrierTeam") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers2") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers3") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipVillagers4") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipWoodCrates2") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCShipCoinCrates2") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipHorsemen3") ) ||
                ((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipMixedCrates5") ) ||
                ((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPConservativeTactics") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPInfantryCombatIroquois") ) ||
                ((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPInfantryDamageIroquois") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPInfantryHitpointsIroquois") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiegeHitpoints") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiegeDamage") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiegeCombat") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPSiegeDiscipline") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCEngineeringSchool") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPBuccaneers") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPShipLightCannon2") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCavalryHitpointsIroquois") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCXPCavalryDamageIroquois") ) ||
				((kbGetCiv() == cCivXPIroquois) && (kbGetTechName(aiHCCardsGetCardTechID(card)) == "HCNavalCombat") ) )
				
            {
               aiHCDeckAddCardToDeck(gDefaultDeck, card);
               cardsRemaining = cardsRemaining - 1;
               xsArraySetString(gCardStates, card, "D");
               aiEcho("  Adding card "+xsArrayGetString(gCardNames, card));
            }
         }  // All done, no cards remaining. 

         aiHCDeckActivate(gDefaultDeck);
         
         xsDisableSelf();
         break;
      }
   }
}


//==============================================================================
// init...Called once we have units in the new world.
//==============================================================================
void init(void)
{
   //Set the Explore Danger Threshold.
   aiSetExploreDangerThreshold(110.0);

   // Set the gIAmCaptain bool and gCaptainPlayerNumber vars.
	selectCaptain();  

   //Setup the resign handler
   aiSetHandler("resignHandler", cXSResignHandler);

	//Setup the nugget handler
	aiSetHandler("nuggetHandler", cXSNuggetHandler);
   
   // Set up the age-up chat handler
//   aiSetHandler("ageUpHandler", cXSAgeHandler);
   
   aiSetHandler("ageUpHandler", cXSPlayerAgeHandler);

	//-- set the ScoreOppHandler
	aiSetHandler("scoreOpportunity", cXSScoreOppHandler);
   
   //Set up the communication handler
   aiCommsSetEventHandler("commHandler");
   
   // This handler runs when you have a shipment available in the home city
   aiSetHandler("shipGrantedHandler", cXSShipResourceGranted);
   
   // Handlers for mission start/end
   aiSetHandler("missionStartHandler",cXSMissionStartHandler);
   aiSetHandler("missionEndHandler",cXSMissionEndHandler);
   
   // Game ending handler, to save game-to-game data before game ends
   aiSetHandler("gameOverHandler",cXSGameOverHandler);
   
   // Handler when a player starts the monopoly victory timer
   aiSetHandler("monopolyStartHandler",cXSMonopolyStartHandler);
   
   // And when a monopoly timer prematurely ends
   aiSetHandler("monopolyEndHandler",cXSMonopolyEndHandler);
   
   // Handler when a player starts the KOTH victory timer
   aiSetHandler("KOTHVictoryStartHandler",cXSKOTHVictoryStartHandler);
   
   // And when a KOTH timer prematurely ends
   aiSetHandler("KOTHVictoryEndHandler",cXSKOTHVictoryEndHandler);

   //-- init Econ and Military stuff.
	initEcon();
   initMil();
  
   if ( (aiGetGameType() == cGameTypeScenario) || (aiGetGameType() == cGameTypeScenario) )
      cvOkToResign = false;   // Default is to not allow resignation in scenarios.  Can override in postInit().

   // Fishing always viable on these maps
	if ( (cRandomMapName=="carolina") ||   
		  (cRandomMapName=="carolinalarge") || 
		  (cRandomMapName=="new england") || 
		  (cRandomMapName=="caribbean") || 
		  (cRandomMapName=="patagonia") || 
		  (cRandomMapName=="yucatan") ||
		  (cRandomMapName=="caribbean") ||
        (cRandomMapName=="hispaniola") ||
        (cRandomMapName=="araucania") ||
        (cRandomMapName=="california") ||
        (cRandomMapName=="northwest territory") ||
        (cRandomMapName=="saguenay") ||
        (cRandomMapName=="saguenaylarge") ||
        (cRandomMapName=="unknown") ||
        (cRandomMapName=="Ceylon") ||
        (cRandomMapName=="Borneo") ||
        (cRandomMapName=="Honshu") ||
        (cRandomMapName=="HonshuRegicide") ||
		(cRandomMapName=="indochina") ||
        (cRandomMapName=="Yellow riverWet") )
	{
      gGoodFishingMap = true;    
	}
   if (cRandomMapName == "great lakes")
      if (kbUnitCount(cMyID, cUnitTypeHomeCityWaterSpawnFlag) > 0)   // We have a flag, the lake isn't frozen
         gGoodFishingMap = true;
         
   if (gSPC == true) 
   {
      if (aiIsMapType("AIFishingUseful") == true)
         gGoodFishingMap = true;
      else
         gGoodFishingMap = false;
   }
   
   if ( (cRandomMapName == "amazonia") || (cRandomMapName == "caribbean") )
      gNavyMap = true;
	if ( (cRandomMapName=="carolina") ||   
		  (cRandomMapName=="carolinalarge") || 
		  (cRandomMapName=="new england") || 
		  (cRandomMapName=="caribbean") || 
		  (cRandomMapName=="patagonia") || 
		  (cRandomMapName=="yucatan") ||
		  (cRandomMapName=="caribbean") ||
        (cRandomMapName=="hispaniola") ||
        (cRandomMapName=="araucania") ||
        (cRandomMapName=="great lakes") ||
        (cRandomMapName=="california") ||
        (cRandomMapName=="northwest territory") ||
        (cRandomMapName=="saguenay") ||
        (cRandomMapName=="saguenaylarge") ||
        (cRandomMapName=="unknown") ||
        (cRandomMapName=="Ceylon") ||
        (cRandomMapName=="Borneo") ||
        (cRandomMapName=="Honshu") ||
        (cRandomMapName=="HonshuRegicide") ||
		(cRandomMapName=="indochina") ||
        (cRandomMapName=="Yellow riverWet") )
   {
      if (kbUnitCount(cMyID, cUnitTypeHomeCityWaterSpawnFlag) > 0)   // We have a flag, there must be water...
         gNavyMap = true;     
      else
         aiEcho("No water flag found, turning off navy.");
   }
   else{
	  if (kbUnitCount(cMyID, cUnitTypeHomeCityWaterSpawnFlag) > 0)   // We have a flag, there must be water...
         gNavyMap = true;   
   }
   if (gSPC == true)
   {
      if (kbUnitCount(cMyID, cUnitTypeHomeCityWaterSpawnFlag) > 0)   // We have a flag, there must be water...
         gNavyMap = true;    
      else
         gNavyMap = false;
   }
   

      
   // Create a temporary main base so the plans have something to deal with.
   // If there is a scenarioStart object, use it.  If not, use the TC, if any.
   // Failing that, use an explorer, a settlerWagon, or a Settler.  Failing that,
   // select any freakin' unit and use it.
   vector tempBaseVec = cInvalidVector;
   int unitID = -1;
   unitID = getUnit(cUnitTypeAIStart, cMyID, cUnitStateAlive);
   if (unitID < 0)
      unitID = getUnit(cUnitTypeTownCenter, cMyID, cUnitStateAlive);
   if (unitID < 0)
      unitID = getUnit(cUnitTypeExplorer, cMyID, cUnitStateAlive);
   if (unitID < 0)
      unitID = getUnit(gCoveredWagonUnit, cMyID, cUnitStateAlive);
   if (unitID < 0)
      unitID = getUnit(cUnitTypeSettler, cMyID, cUnitStateAlive);
   if (unitID < 0)
      unitID = getUnit(gEconUnit, cMyID, cUnitStateAlive);
   
   if (unitID < 0)
      aiEcho("**** I give up...I can't find an aiStart unit, TC, wagon, explorer or settler.  How do you expect me to play?!");
   else
      tempBaseVec = kbUnitGetPosition(unitID);
   
   // This will create an interim main base at this location. 
   // Only done if there is no TC, otherwise we rely on the auto-created base
	if ( (gStartMode == cStartModeScenarioNoTC) || (getUnit(cUnitTypeTownCenter, cMyID, cUnitStateAlive) < 0) )
      gMainBase = createMainBase(tempBaseVec);     

   // If we have a covered wagon, let's pick a spot for the TC search to begin, and a TC start time to activate the build plan.
   int coveredWagon = getUnit(gCoveredWagonUnit, cMyID, cUnitStateAlive);
   if (coveredWagon >= 0)
   {
      vector coveredWagonPos = kbUnitGetPosition(coveredWagon);
      vector normalVec = xsVectorNormalize(kbGetMapCenter()-coveredWagonPos);
      int offset = 40;
      gTCSearchVector = coveredWagonPos + (normalVec * offset);
      
      while (  kbAreaGroupGetIDByPosition(gTCSearchVector) != kbAreaGroupGetIDByPosition(coveredWagonPos) )
      {  
			// Try for a goto point 40 meters toward center.  Fall back 5m at a time if that's on another continent/ocean.  
			// If under 5, we'll take it.
         offset = offset - 5;
         gTCSearchVector = coveredWagonPos + (normalVec * offset);
         if (offset < 5)
            break;  
      }
      
      // Note...if this is a scenario, we should use the AIStart object's position, NOT the covered wagon position.  Override...
      int aiStart = getUnit(cUnitTypeAIStart, cMyID, cUnitStateAny);
      if (aiStart >= 0)
      {
         gTCSearchVector = kbUnitGetPosition(aiStart);
         aiEcho("Using aiStart object at "+gTCSearchVector+" to start TC placement search");
      }
   }
   
   // Set up the generic land explore plan.
   if (cvOkToExplore == true)
   {
      if (cMyCiv == cCivDutch)
      {  // Keep the envoy busy.
         int envoyExplore = aiPlanCreate("Envoy Explore", cPlanExplore);
         aiPlanSetDesiredPriority(envoyExplore, 79);
         aiPlanAddUnitType(envoyExplore, cUnitTypeEnvoy, 0, 1, 1);
         aiPlanSetEscrowID(envoyExplore, cEconomyEscrowID);
         aiPlanSetBaseID(envoyExplore, kbBaseGetMainID(cMyID));
         aiPlanSetVariableBool(envoyExplore, cExplorePlanDoLoops, 0, false);
         aiPlanSetActive(envoyExplore);         
      }
	  if (cMyCiv == cCivFrench)
      {  // Keep the scout busy.
         int sExplore = aiPlanCreate("NativeScout Explore", cPlanExplore);
         aiPlanSetDesiredPriority(sExplore, 79);
         aiPlanAddUnitType(sExplore, cUnitTypeNativeScout, 0, 1, 1);
         aiPlanSetEscrowID(sExplore, cEconomyEscrowID);
         aiPlanSetBaseID(sExplore, kbBaseGetMainID(cMyID));
         aiPlanSetVariableBool(sExplore, cExplorePlanDoLoops, 0, false);
         aiPlanSetActive(sExplore);         
      }
      
   }
   
   // Disables early groups, starts nugget hunting, moves explorer later.
	//xsEnableRule("exploreMonitor"); 
	//xsEnableRule("testMonitor");
	xsEnableRule("addtionalChat");
	if(civIsAsian() == true || cMyCiv == cCivSpanish)
	   xsEnableRule("ringWalk");
	
	if(cMyCiv == cCivXPIroquois)
	   xsEnableRule("ringWalk"); //randomWalk
	else
	   xsEnableRule("randomWalk");

   if ( (gStartMode == cStartModeScenarioWagon) || 
		  (gStartMode == cStartModeLandWagon) || 
		  (gStartMode == cStartModeBoat) )
   {
      aiEcho("Creating a TC build plan.");
      // Make a town center, pri 100, econ, main base, 1 builder.
      int buildPlan=aiPlanCreate("TC Build plan ", cPlanBuild);
      // What to build
      aiPlanSetVariableInt(buildPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeTownCenter);
      // Priority.
      aiPlanSetDesiredPriority(buildPlan, 100);
      // Mil vs. Econ.
      aiPlanSetMilitary(buildPlan, false);
      aiPlanSetEconomy(buildPlan, true);
      // Escrow.
      aiPlanSetEscrowID(buildPlan, cEconomyEscrowID);
      // Builders.
      aiPlanAddUnitType(buildPlan, gCoveredWagonUnit, 1, 1, 1);
   
      // Instead of base ID or areas, use a center position and falloff.
      if(gTCSearchVector == cInvalidVector)
         aiPlanSetVariableVector(buildPlan, cBuildPlanCenterPosition, 0, coveredWagonPos);
      else
         aiPlanSetVariableVector(buildPlan, cBuildPlanCenterPosition, 0, gTCSearchVector);
      aiPlanSetVariableFloat(buildPlan, cBuildPlanCenterPositionDistance, 0, 40.00);
   
      // Add position influences for trees, gold
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitTypeID, 3, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitDistance, 3, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitValue, 3, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluenceUnitFalloff, 3, true);
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 0, cUnitTypeWood);
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 0, 30.0);     // 30m range.
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 0, 10.0);        // 10 points per tree
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 1, cUnitTypeMine);
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 1, 50.0);              // 50 meter range for gold
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 1, 300.0);                // 300 points each
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 1, cBPIFalloffLinear);  // Linear slope falloff
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 2, cUnitTypeMine);
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 2, 20.0);              // 20 meter inhibition to keep some space
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 2, -300.0);                // -300 points each
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 2, cBPIFalloffNone);      // Cliff falloff
      
      // Two position weights
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluencePosition, 2, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluencePositionDistance, 2, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluencePositionValue, 2, true);
      aiPlanSetNumberVariableValues(buildPlan, cBuildPlanInfluencePositionFalloff, 2, true);
      
      // Give it a positive but wide-range prefernce for the search area, and a more intense but smaller negative to avoid the landing area.
      // Weight it to prefer the general starting neighborhood
      aiPlanSetVariableVector(buildPlan, cBuildPlanInfluencePosition, 0, gTCSearchVector);    // Position influence for search position
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionDistance, 0, 200.0);     // 200m range.
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionValue, 0, 300.0);        // 300 points max
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff
      
      // Add negative weight to avoid initial drop-off beach area
      aiPlanSetVariableVector(buildPlan, cBuildPlanInfluencePosition, 1, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));    // Position influence for landing position
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionDistance, 1, 50.0);     // Smaller, 50m range.
      aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionValue, 1, -400.0);      // -400 points max
      aiPlanSetVariableInt(buildPlan, cBuildPlanInfluencePositionFalloff, 1, cBPIFalloffLinear);  // Linear slope falloff
      // This combo will make it dislike the immediate landing (-100), score +25 at 50m, score +150 at 100m, then gradually fade to +0 at 200m.
   
   
      // Wait to activate TC build plan, to allow adequate exploration
      gTCBuildPlanID = buildPlan;   // Save in a global var so the rule can access it.
      aiPlanSetEventHandler(buildPlan, cPlanEventStateChange, "tcPlacedEventHandler");    
      
      xsEnableRule("tcBuildPlanDelay");
   }

   xsEnableRule("buyCards");

	xsEnableRule("townCenterComplete");  // Rule to build other buildings after TC completion
   xsEnableRule("useCoveredWagons");   
   xsEnableRule("useFactoryWagons");
   xsEnableRule("tcMonitor");    // Recreate a TC if the TC is destroyed or if the build plan dies
   xsEnableRule("ageUpgradeMonitor");  // Make sure we freeze spending to allow age-ups at certain villie pop levels
  
   initCrates();
   postInit();		// All normal initialization is done, let loader file clean up what it needs to.
   
   // Store the initial settings for later retrieval (to handle 'cancel' after a train bias command.
   gInitRushBoom = btRushBoom;
   gInitOffenseDefense = btOffenseDefense;
   gInitBiasCav = btBiasCav;
   gInitBiasInf = btBiasInf;
   gInitBiasArt = btBiasArt;
   gInitBiasNative = btBiasNative;
   gInitBiasTrade = btBiasTrade;
   aiEcho("INITIAL BEHAVIOR SETTINGS");
   aiEcho("    Rush "+btRushBoom);
   aiEcho("    Offense "+btOffenseDefense);
   aiEcho("    Cav "+btBiasCav);
   aiEcho("    Inf "+btBiasInf);
   aiEcho("    Art "+btBiasArt);
   aiEcho("    Natives "+btBiasNative);
   aiEcho("    Trade "+btBiasTrade);
   
   // Re-do politician choices now that postInit() is complete...
   int poliScores = xsArrayCreateFloat(6, 0.0, "Politician scores");
   int numChoices = -1;
   int politician = -1;
   float bonus = 0.0;
   
   for (age = cAge2; <= cAge5)
   {
      for (p=0; <6)
         xsArraySetFloat(poliScores, p, 0.0);   // Reset scores
      numChoices = aiGetPoliticianListCount(age);
      for (p=0; <numChoices)
      {  // Score each of these choices based on the strength of our behavior settings.
         politician = aiGetPoliticianListByIndex(age, p);
         // Rusher bonuses
         if (btRushBoom > 0.0)
            bonus = btRushBoom;
         else
            bonus = 0.0;
         if (  (politician == cTechPoliticianQuartermaster) || 
               (politician == cTechPoliticianScout) ||
               (politician == cTechPoliticianScoutRussian) ||
               (politician == cTechPoliticianSergeantDutch) || 
               (politician == cTechPoliticianSergeantGerman) ||
               (politician == cTechPoliticianSergeantSpanish) || 
               (politician == cTechPoliticianMohawk) || 
               (politician == cTechPoliticianMarksman) ||
               (politician == cTechPoliticianMarksmanOttoman) ||
               (politician == cTechPoliticianMarksmanPortuguese) ||
               (politician == cTechPoliticianAdventurerBritish) ||
               (politician == cTechPoliticianAdventurerRussian) ||
               (politician == cTechPoliticianAdventurerSpanish) )
         {
            xsArraySetFloat(poliScores, p, xsArrayGetFloat(poliScores, p) + bonus); // Add in a bonus based on our rusher trait.
         }
         // Boomer bonuses
         if (btRushBoom < 0.0)
            bonus = -1.0 * btRushBoom;
         else
            bonus = 0.0;
         if (  (politician == cTechPoliticianBishop) ||
               (politician == cTechPoliticianBishopGerman) ||
               (politician == cTechPoliticianTycoon) ||
               (politician == cTechPoliticianExiledPrince) ||
               (politician == cTechPoliticianPresidente) )
         {
            xsArraySetFloat(poliScores, p, xsArrayGetFloat(poliScores, p) + bonus); // Add in a bonus based on our boomer trait.
         }
         // Defense bonuses
         if (btOffenseDefense < 0.0)
            bonus = -1.0 * btOffenseDefense; // Defense rating
         else
            bonus = 0.0;
         if (politician == cTechPoliticianGovernor)
         {
            xsArraySetFloat(poliScores, p, xsArrayGetFloat(poliScores, p) + bonus); // Add in a bonus based on our defense trait.
         }
         // Offense bonuses
         if (btOffenseDefense > 0.0)
            bonus = btOffenseDefense;
         else
            bonus = 0.0;
         if (  (politician == cTechPoliticianScout) ||
               (politician == cTechPoliticianScoutRussian) ||
               (politician == cTechPoliticianSergeantDutch) || 
               (politician == cTechPoliticianSergeantGerman) ||
               (politician == cTechPoliticianSergeantSpanish) || 
               (politician == cTechPoliticianMohawk) || 
               (politician == cTechPoliticianMarksman) ||
               (politician == cTechPoliticianMarksmanOttoman) ||
               (politician == cTechPoliticianMarksmanPortuguese) ||
               (politician == cTechPoliticianAdventurerBritish) ||
               (politician == cTechPoliticianAdventurerRussian) ||
               (politician == cTechPoliticianAdventurerSpanish) ||
               (politician == cTechPoliticianGeneral) ||
               (politician == cTechPoliticianGeneralBritish) ||
               (politician == cTechPoliticianGeneralOttoman) )
         {
            xsArraySetFloat(poliScores, p, xsArrayGetFloat(poliScores, p) + bonus); // Add in a bonus based on our offense trait.
         }
         if (gNavyMap == false)
         {
            bonus = -10.0; // Essentially disqualify any navy polis
            if (  (politician == cTechPoliticianAdmiral) ||
                  (politician == cTechPoliticianAdmiralOttoman) ||
                  (politician == cTechPoliticianPirate) )
            {
               xsArraySetFloat(poliScores, p, xsArrayGetFloat(poliScores, p) + bonus); // Disqualify naval polis on land maps
            }
         }         
      }  // for (p=0; <numChoices)
      
      // The scores are set, find the high score
      int bestChoice = 0;        // Select 0th item if all else fails
      float bestScore = -100.0;  // Impossibly low
      for (p=0; <numChoices)
      {
         if (xsArrayGetFloat(poliScores, p) > bestScore)
         {
            bestScore = xsArrayGetFloat(poliScores, p);
            bestChoice = p;
         }
      }
      politician = aiGetPoliticianListByIndex(age, bestChoice);
      aiSetPoliticianChoice(age, politician);
      aiEcho("Politician for age "+age+" is #"+politician+", "+kbGetTechName(politician));
   } //for (age = cAge2; <= cAge5)
}
   
//==============================================================================
// initRule
// Add a brief delay to make sure the covered wagon (if any) has time to unload
//==============================================================================
rule initRule
inactive
minInterval 3
{
   if (cvInactiveAI == true) 
      return;  // Wait forever unless this changes
   init();
   xsDisableSelf();
}






//==============================================================================
// ottomanMonitor
// Make sure they always have a church, get techs as available
//==============================================================================
rule ottomanMonitor
inactive
minInterval 30
{  
   int speedPlanID = -1;   // Plan for improving vill training speed.
   int capPlanID = -1;     // Plan for raising settler pop limit.
   int churchPlanID = -1;
   int tcPlanID = -1;
   
   // If no mosque and no build plan, build one, exit.
   if (kbUnitCount(cMyID, cUnitTypeChurch, cUnitStateAlive) < 1)
   {  // No mosque, check for build plan, add one if needed
      churchPlanID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeChurch);  
      if (churchPlanID < 0)
      {
         aiEcho(" ");
         aiEcho("Creating church build plan");
         aiEcho(" ");
         createSimpleBuildPlan(cUnitTypeChurch, 1, 93, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      }
      return;
   }
   
   //if (kbGetAge() > cAge2)
      //aiRansomExplorer(getUnit(cUnitTypeExplorer), cMilitaryEscrowID, getUnit(cUnitTypeTownCenter));
   
   // We have a church, continue...
   // Check for each of their techs.  If it's obtainable and there's 
   // no plan, get it.
   

   if (kbTechGetStatus(cTechChurchMilletSystem) == cTechStatusObtainable)
   {
      speedPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchMilletSystem);
      if (speedPlanID < 0)
         createSimpleResearchPlan(cTechChurchMilletSystem, getUnit(cUnitTypeChurch),cEconomyEscrowID, 91);
   }

   if ((kbTechGetStatus(cTechChurchKopruluViziers) == cTechStatusObtainable) && (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) > 1))
   {
      speedPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchKopruluViziers);
      if (speedPlanID < 0)
         createSimpleResearchPlan(cTechChurchKopruluViziers, getUnit(cUnitTypeChurch),cEconomyEscrowID, 91);
   }     
   
   if ((kbTechGetStatus(cTechChurchAbbassidMarket) == cTechStatusObtainable) && (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) > 2))
   {
      speedPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchAbbassidMarket);
      if (speedPlanID < 0)
         createSimpleResearchPlan(cTechChurchAbbassidMarket, getUnit(cUnitTypeChurch),cEconomyEscrowID, 91);
   }
   
   if ((kbTechGetStatus(cTechChurchGalataTowerDistrict) == cTechStatusObtainable) && (kbUnitCount(cMyID, gEconUnit) > 20))
   {
      capPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchGalataTowerDistrict);
      if (capPlanID < 0)
         createSimpleResearchPlan(cTechChurchGalataTowerDistrict, getUnit(cUnitTypeChurch),cEconomyEscrowID, 91);
   }     
 
   if ((kbTechGetStatus(cTechChurchTopkapi) == cTechStatusObtainable) && (kbUnitCount(cMyID, gEconUnit) > 40))
   {
      capPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechChurchTopkapi);
      if (capPlanID < 0)
         createSimpleResearchPlan(cTechChurchTopkapi, getUnit(cUnitTypeChurch),cEconomyEscrowID, 91);
   }  
  
}

rule addTC
inactive
group tcComplete
minInterval 10
{
   int tcPlanID = -1;
   int tcNum = 2;
   if(civIsAsian() == true || cMyCiv == cCivDutch || cMyCiv == cCivBritish)
       tcNum = 1;
   else if(cMyCiv == cCivOttomans)
       tcNum = 3;
   
   //if(kbUnitCount(cMyID, gPlantationUnit, cUnitStateABQ) < 1 && cMyCiv == cCivGermans)
      //return;
   if ((kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) < tcNum) && (kbGetAge() > cAge2))
   {
      tcPlanID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeTownCenter);
      if (tcPlanID < 0)
      {     // Start a new one
         createSimpleBuildPlan(cUnitTypeTownCenter, 1, 99, false, cMilitaryEscrowID, kbBaseGetMainID(cMyID), 1);
         
      }   
   }
}


rule herdMonitor
inactive
minInterval 20
{
   static bool done = false;
   if (done == true)
   {
      xsDisableSelf();
      return;
   }
   
   // Activated when a livestock pen is being built.  Wait for completion, and then
   // move the herd plan to the livestock pen.
   if (civIsNative() == true)
   {         
      if ( kbUnitCount(cMyID, cUnitTypeFarm, cUnitStateAlive) > 0 )
      {
         aiPlanSetVariableInt(gHerdPlanID, cHerdPlanBuildingTypeID, 0, cUnitTypeFarm);
         aiPlanSetVariableInt(gHerdPlanID, cHerdPlanBuildingID, 0, getUnit(cUnitTypeFarm, cMyID, cUnitStateAlive));
         xsDisableSelf();
         done = true;
         aiEcho("Moving livestock to farm.");
      }
   }
   else
   {         
      if ( kbUnitCount(cMyID, gLivestockPenUnit, cUnitStateAlive) > 0 )
      {
         aiPlanSetVariableInt(gHerdPlanID, cHerdPlanBuildingTypeID, 0, gLivestockPenUnit);
         aiPlanSetVariableInt(gHerdPlanID, cHerdPlanBuildingID, 0, getUnit(gLivestockPenUnit, cMyID, cUnitStateAlive));
         xsDisableSelf();
         done = true;
         aiEcho("Moving livestock to livestock pen.");
      }
   }
}



//==============================================================================
// tcBuildPlanDelay
/*
   Allows delayed activation of the TC build plan, so that the explorer has 
   uncovered a good bit of the map before a placement is selected.

   The int gTCBuildPlanID is used to simplify passing of the build plan ID from
   init().
*/
//==============================================================================

rule tcBuildPlanDelay
inactive
minInterval 1
{
  if (xsGetTime() < gTCStartTime)
      return;     // Do nothing until game time is beyond 10 seconds
   
   aiPlanSetActive(gTCBuildPlanID);
   aiEcho("Activating TC build plan "+gTCBuildPlanID+".");
   xsDisableSelf();
}






//==============================================================================
/* transportArrive()
   
   This function is called when it is time for the AI to come to life.

   In Scenario/Campaign games, it means the aiStart object has been placed.

   In RM/GC games, it means that the player has all the starting units.  This may
   mean that the initial boat has been unloaded, or the player has started
   with a TC and units, or the player has initial units and a covered wagon
   and must choose a TC location.  

   This function activates "initRule" if everything is OK for a start...
*/
//==============================================================================
void transportArrive(int parm=-1) // Event handler
{
   static bool firstTime = true;
   
   if (gSPC == true)
   {
      // Verify aiStart object, return if it isn't there
      if (kbUnitCount(cMyID, cUnitTypeAIStart, cUnitStateAlive) < 1)
      {
         xsEnableRule("waitForStartup");
         return();
      }
   }
   
   if (firstTime == true)
   {  
		// Do init processing
		aiEcho("The transport has arrived.");
		firstTime = false;
		// No need for it, we're running
		xsDisableRule("transportArriveFailsafe");	
      xsEnableRule("initRule");
   }
}

rule transportArriveFailsafe
inactive
minInterval 60
{	// This rule is normally killed when transportArrive runs the first time.
	transportArrive(-1);		// Call it if we're still running at 30 seconds, make sure the AI starts.
}




rule autoSave
inactive
minInterval 5
{
   int interval = 2; // Interval in minutes
   static int nextTime = 0;
   
   // First, do an auto save game if needed
   //Dont save if we are told not to.
   if (aiGetAutosaveOn() == true)
   {
      int firstCPPlayerID = -1;
      for(i=0; < cNumberPlayers)
      {
         if(kbIsPlayerHuman(i) == true)
            continue;
   
         firstCPPlayerID = i;
      }
      if ( (cMyID == firstCPPlayerID) && (xsGetTime() >= nextTime) && (cvDoAutoSaves == true))
      {  // We're the first CP, it's our job to do the save, and it's time to do it.
         //Create the savegame name.
         static int psCount = 0;
         //Save it.
         if (cvDoAutoSaves == true)
         {
            aiQueueAutoSavegame(psCount);
            //Inc our count.
            psCount=psCount+interval;   // Count roughly matches game time in minutes
            while (psCount < (xsGetTime()/60000) )
               psCount = psCount+interval;    // Handle reloading of save games from machines that had saves off...
            nextTime = psCount * 60 * 1000;
         }
      }
   }
}

//==============================================================================
/* rule ageUpgradeMonitor

   This rule decides when it makes sense to work toward an age upgrade.  When that
   time comes, it shifts the normal escrow accounts to zero, sets the upgrade account 
   to 100%, and reallocates everything.  

   This causes the upgrade account to take everything it needs until the age upgrade
   is complete.  The escrows are restored in the next age's 'monitor' rule, i.e.
   the age2monitor, age3Monitor, etc.  
*/
//==============================================================================

rule ageUpgradeMonitor
inactive
group tcComplete
minInterval 10
{
   int specialAgeTech = -1;   // Used for personality-specific overrides
   int planID = -1;
   int i=0;
   static int lastAgeFrozen = -1;
   static int start = -1;
   int food2 = gAgeNeedFood;
   int gold2 = gAgeNeedGold;
   
   
   if (kbGetAge() >= cAge5)
   {
      xsDisableSelf();
      return;
   }
   if((xsGetTime() - gAgeUpTime) < 180000 && kbGetAge() == cAge2)
   {
      if(cMyCiv == cCivOttomans || cMyCiv == cCivXPSioux)
	  {
	     food2 = gAgeNeedFood+500;
		 gold2 = gAgeNeedFood+500;
	  }
   }
   if(gAgeUpResearchPlan < 0)
      start = xsGetTime();
   
   if ( kbGetAge() >= cvMaxAge ) 
      return;  // Don't disable, this var could change later...
   if((food2 > kbResourceGet(cResourceFood)) || (gold2 > kbResourceGet(cResourceGold)))
      return;
   // Check if we're over the deadline.
   int deadline = -1;
   if (kbGetAge() < cAge5)
      deadline = xsArrayGetInt(gTargetSettlerCounts, kbGetAge());
   
   int politician = -1;

  if ( civIsAsian() == false ) {
     // Quit if we already have a plan in the works
     if (gAgeUpResearchPlan >= 0)
     {
        if ((aiPlanGetState(gAgeUpResearchPlan) >= 0) && ((xsGetTime()-start) < 240000))
        {
           return;  
        }
        else 
        {  // Plan variable is set, but plan is dead.
           aiPlanDestroy(gAgeUpResearchPlan);
           gAgeUpResearchPlan = -1;
           // OK to continue, as we don't have an active plan
        }
     }
	 
     // Not at deadline...see if we can afford the preferred politician
     politician = aiGetPoliticianChoice(kbGetAge()+1);    // Get the specified politician
     if (politician < 0)     //None specified, need one...
        politician = aiGetPoliticianListByIndex(kbGetAge()+1, 0);   // Pick the first in the list
		
	 if((cMyCiv == cCivRussians) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianQuartermaster;
	 if((cMyCiv == cCivRussians) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianExiledPrince;
	 if((cMyCiv == cCivGermans) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianQuartermaster;
	 if((cMyCiv == cCivGermans) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianMarksman;
	 
	 if((cMyCiv == cCivXPSioux) && (kbGetAge() == cAge1))
	    politician =cTechTribalSiouxChief2;
     if((cMyCiv == cCivXPSioux) && (kbGetAge() == cAge2))
	    politician =cTechTribalSiouxYouth3;
	 if((cMyCiv == cCivXPSioux) && (kbGetAge() == cAge3))
	    politician =cTechTribalSiouxWarrior4;
	 if((cMyCiv == cCivXPIroquois) && (kbGetAge() == cAge1))
	    politician =cTechTribalIroquoisYouth2;
     if((cMyCiv == cCivXPIroquois) && (kbGetAge() == cAge2))
	    politician =cTechTribalIroquoisWarrior3;
	 if((cMyCiv == cCivXPIroquois) && (kbGetAge() == cAge3))
	    politician =cTechTribalIroquoisChief4;
	 if((cMyCiv == cCivXPAztec) && (kbGetAge() == cAge1))
	    politician =cTechTribalAztecYouth2;
     if((cMyCiv == cCivXPAztec) && (kbGetAge() == cAge2))
	    politician =cTechTribalAztecWarrior3;
	 
	 if((cMyCiv == cCivSpanish) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianPhilosopherPrince;
	 if((cMyCiv == cCivSpanish) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianAdmiral;
	 if((cMyCiv == cCivSpanish) && (kbGetAge() == cAge3))
	    politician =cTechPoliticianCavalierSpanish;
	 if((cMyCiv == cCivBritish) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianPhilosopherPrince;
     if((cMyCiv == cCivBritish) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianAdmiral;
	 if((cMyCiv == cCivPortuguese) && (kbGetAge() == cAge1))
		politician =cTechPoliticianQuartermaster;
     if((cMyCiv == cCivPortuguese) && (kbGetAge() == cAge2))
		politician =cTechPoliticianAdmiral;
	 if((cMyCiv == cCivOttomans) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianQuartermaster;
	 if((cMyCiv == cCivOttomans) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianAdmiralOttoman;
	 if((cMyCiv == cCivFrench) && (kbGetAge() == cAge1))
	    politician =cTechPoliticianQuartermaster;
	 if((cMyCiv == cCivFrench) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianScout;
	 if((cMyCiv == cCivFrench) && (kbGetAge() == cAge3))
	    politician =cTechPoliticianTycoon;
	 if((cMyCiv == cCivDutch) && (kbGetAge() == cAge2))
	    politician =cTechPoliticianExiledPrince;
  
     // First, see if we can afford an age-up politician
  
     //-- try our personality choice first.
     specialAgeTech = politician;
     if ( specialAgeTech != -1 )
     {
        if ( kbCanAffordTech(specialAgeTech, cEmergencyEscrowID) == true )   
        {  // Can afford or in "escrow-wait" mode...go ahead and make the plan
           if ( (kbTechGetStatus(specialAgeTech) == cTechStatusObtainable) && (gAgeUpResearchPlan < 0) )
           {  // Tech is valid, and we're not yet researching it...
              gAgeUpResearchPlan = createSimpleResearchPlan(specialAgeTech, -1, cEmergencyEscrowID, 99);
              aiEcho("Creating plan #"+gAgeUpResearchPlan+" to get age upgrade with tech "+kbGetTechName(specialAgeTech));
			  return;
           }
        }
     }
    
     // No previous choice, let's see if something is available
     if (gAgeUpResearchPlan < 0) // If we're not already waiting for one...
     {
        //-- Walk what is available to us and choose the first one we can afford.
        int count = aiGetPoliticianListCount(kbGetAge()+1);
        for (i=0; < count)
        {
           specialAgeTech = aiGetPoliticianListByIndex(kbGetAge()+1, i);
           if ( kbCanAffordTech(specialAgeTech, cEmergencyEscrowID) == true )   
           {  // Can afford or in "escrow-wait" mode...go ahead and make the plan
              if ( (kbTechGetStatus(specialAgeTech) == cTechStatusObtainable) && (gAgeUpResearchPlan < 0) )
              {
                 gAgeUpResearchPlan = createSimpleResearchPlan(specialAgeTech, -1, cEmergencyEscrowID, 99);                
                 aiEcho("Creating plan #"+gAgeUpResearchPlan+" to get age upgrade with tech "+kbGetTechName(specialAgeTech));
				 return;
              }
           }
        }
     }
  }
  else {  //We are Asian, time to build a wonder
  // Not at deadline...see if we can afford the preferred politician
     politician = getPreferredWonderToBuild(kbGetAge()+1);    // Get the specified wonder
     
     // Quit if we already have a plan in the works
	 if (gAgeUpResearchPlan >= 0)
     {
		if ((aiPlanGetState(gAgeUpResearchPlan) >= 0) && ((xsGetTime()-start) < 240000))
        {
           return;  
        }
        else 
        {  // Plan variable is set, but plan is dead.
           aiPlanDestroy(gAgeUpResearchPlan);
           gAgeUpResearchPlan = -1;
           // OK to continue, as we don't have an active plan
        }
     }
  
     // First, see if we can afford an age-up politician
  
     //-- try our personality choice first.
     specialAgeTech = politician;
     if ( specialAgeTech != -1 )
     {
      aiEcho("Wonder to build: "+kbGetProtoUnitName(specialAgeTech));
      aiEcho("Should we make the plan?: "+gAgeUpResearchPlan);
       if ( gAgeUpResearchPlan < 0 )
       {  // Tech is valid, and we're not yet researching it...
          if(kbGetAge() == cAge1) //(kbGetCiv() == cCivJapanese || kbGetCiv() == cCivIndians)
		      gAgeUpResearchPlan = createSimpleBuildPlan(specialAgeTech, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 2);
		  else
		      gAgeUpResearchPlan = createSimpleBuildPlan(specialAgeTech, 1, 100, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 4);
		  aiEcho("<<<<<<<<<<RushBoom + OffenseDefense = "+btRushBoom+" + "+btOffenseDefense+" = "+(btRushBoom+btOffenseDefense));
          aiEcho("Creating plan #"+gAgeUpResearchPlan+" to get age upgrade with wonder "+kbGetProtoUnitName(specialAgeTech));
		  return;
       }
     }
  }
}

void setShipValue(void)
{
   int mapType = 0;
   int totalCards = aiHCDeckGetNumberCards(gDefaultDeck);
   int age = -1;
   int totalValue = -1;
   int isNormalCS = 1;
   
   for (i=1; <=cNumberPlayers)
   {
      if ( (kbIsPlayerEnemy(i) == true) && (kbHasPlayerLost(i) == false) && (kbIsPlayerHuman(i) == false) )
      {
         isNormalCS = 0;
      }
   }
   
   if(gNavyMap == true)
      mapType = 401;
   if((cRandomMapName=="Mongolia") ||
      (cRandomMapName=="Deccan") ||
      (cRandomMapName=="great lakes") ||
      (cRandomMapName=="saguenay") ||
      (cRandomMapName=="saguenayLarge") ||
      (cRandomMapName=="california") ||
      (cRandomMapName=="new england"))
      mapType = mapType+1;
   if(cMyCiv == cCivJapanese)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipFune2") &&
			    (mapType > 400))
   			   totalValue = 201;
   		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipSettlersAsian2")
			   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "ypHCShipCoinCrates2")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "ypHCShipWoodCrates2")
	   		   totalValue = 608;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCRedSealShip")
	   		   totalValue = 599;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCMercsSohei3")
			   totalValue = 1201;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCChonindoTeam")
			   totalValue = 600;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCRainbowTrickle")
			   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCSamuraiDamage")
			   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCNobleCombat")
			   totalValue = 903;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "ypHCShipWoodCrates4") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "ypHCShipCoinCrates4"))
			   totalValue = 902;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRoyalMint") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRefrigeration") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCNaginataHitpoints"))
			   totalValue = 901;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivChinese)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCEuropeanCannons") &&
			    (mapType < 400))
	   		   totalValue = 200;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCNavalCombatTeam") &&
			    (mapType < 400))
	   		   totalValue = 200;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipFuchuan1") &&
			    (mapType > 400))
	   		   totalValue = 202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipFuchuanTeam")
	   		   totalValue = 1201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 703;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 704;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCBannerSchool")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipManchuTeam")
	   		   totalValue = 905;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4")
	   		   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCArtilleryCombatChinese")
	   		   totalValue = 902;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCAccupuncture")
	   		   totalValue = 901;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCRainbowTrickle")
	   		   totalValue = 301;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivGermans)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat") &&
			    (mapType < 400))
	   		   totalValue = 200;
   		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2German") &&
					 (mapType > 400))
			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFrigatesGerman") &&
					 (mapType > 400))
			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCFencingSchoolGerman") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRidingSchoolGerman") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRidingSchoolGerman2") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCAdvancedArsenalGerman"))
			   totalValue = 599;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipDopplesoldners1")
	   		   totalValue = 100;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3German")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipSettlerWagons4")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates2German")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3German")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRoyalMintGerman")
	   		   totalValue = 600;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4German")
	   		   totalValue = 901;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4German")
	   		   totalValue = 903;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCannons1German")
	   		   totalValue = 1202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCUnlockFactoryGerman") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipHorseArtillery2German") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRobberBaronsGerman"))
			   totalValue = 1201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercenaryCombatGerman")
	   		   totalValue = 91;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsBlackRidersGerman")
	   		   totalValue = 902;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsLandsknecht2German") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsHessiansGerman"))
			   totalValue = 904;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivDutch)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
   		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFluyts2") &&
			    (mapType > 400))
   			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCPrivateers2") &&
			    (mapType > 400))
   			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2") &&
			    (mapType > 400))
   			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRobberBarons") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCUnlockFactory"))
			   totalValue = 1201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCInfantryDamageDutch")
	   		   totalValue = 599;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3") 
	   		   totalValue = 606;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 605;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates2")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsLandsknecht2")
	   		   totalValue = 905;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPColbertism") ||
			         (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipSettlers3"))
			   totalValue = 600;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivIndians)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipCaravel2") &&
			    (mapType > 400))
   			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipCaravel3Double") &&
			    (mapType > 400))
   			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCEastIndiaCompany") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCRoyalMintIndians"))
			   totalValue = 600;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCForeignLogging")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipWoodCrates2Indians")
	   		   totalValue = 605;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipCoinCrates2Indians")
	   		   totalValue = 607;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCRidingSchoolIndians")
	   		   totalValue = 603;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipUrumiTeam") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCMercsTigerClaw3"))
			   totalValue = 1202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipCoinCrates4Indians")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCElephantTrampling")
	   		   totalValue = 902;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCElephantCombatIndians")
	   		   totalValue = 901;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCElephantLimit")
	   		   totalValue = 899;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipUrumi1")
			   totalValue = 101;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "YPHCShipRhino1")
			   totalValue = 100;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivXPAztec)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
   			   totalValue = 200;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipMedicineMenTeamAztec")
   			   totalValue = 100;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipVillagers4")
   			   totalValue = 604;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipVillagersTeam") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipMedicineMen2Aztec"))
			   totalValue = 605;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPKnightCombat")
   			   totalValue = 901;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCTeamCoinCrates1")
   			   totalValue = 904;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipSkullKnights3") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4"))
   			   totalValue = 905;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCoinCratesAztec5")
   			   totalValue = 899;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipSkullKnights4")
   			   totalValue = 1201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPGreatTempleHuitzilopochtli")
   			   totalValue = 1202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPChinampa2")
   			   totalValue = 897;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivFrench)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
   		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCPrivateers2") &&
			    (mapType > 400))
   			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRobberBarons") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCUnlockFactory"))
			   totalValue = 1201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPGribeauvalSystem") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCAdvancedArsenal"))
	   		   totalValue = 598;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRoyalDecreeFrench")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoureurs2")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4")
	   		   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFalconets3")
	   		   totalValue = 902;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsSwissPikemen")
	   		   totalValue = 905;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivXPIroquois)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPBuccaneers") &&
				(mapType > 400))
   			   totalValue = 201;
   		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
   			   totalValue = 598;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPSiegeHitpoints") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPSiegeDamage") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCavalryHitpointsIroquois") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCavalryDamageIroquois") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPInfantryDamageIroquois") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPInfantryHitpointsIroquois"))
			   totalValue = 599;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipBearsTeam")
			   totalValue = 100;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPConservativeTactics")
   			   totalValue = 901;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates2")
   			   totalValue = 902;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipVillagers4")
   			   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates2")
   			   totalValue = 904;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipHorsemen3") &&
					 (isNormalCS == 1))
			   totalValue = 905;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipMixedCrates5")
			   totalValue = 906;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivOttomans)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipGalleys2") &&
				(mapType > 400))
   			   totalValue = 201;
   		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipGalleys3") &&
				(mapType > 400))
   			   totalValue = 202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRoyalMint")
	   		   totalValue = 899;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 605;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipSettlers2")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates2")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates2")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCJanissaryCost")
	   		   totalValue = 1198;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsMamelukes") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4"))
	   		   totalValue = 903;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFalconets3"))
			   totalValue = 902;
		    else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivPortuguese)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels3") &&
				(mapType > 400))
   			   totalValue = 202;
   		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2") &&
				(mapType > 400))
   			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCAdvancedArsenal") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCEngineeringSchool"))
			   totalValue = 597;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCUnlockFactory") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRobberBarons"))
			   totalValue = 1201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates2")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPEconomicTheory")
	   		   totalValue = 600;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates2")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 605;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRoyalMint") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRefrigeration"))
			   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates4")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4")
	   		   totalValue = 905;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsMamelukes")
	   		   totalValue = 906;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRangedInfantryDamagePortuguese") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCRangedInfantryHitpointsPortugueseTeam"))
	   		   totalValue = 599;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivXPSioux)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipDogsoldiersTeam1")
			   totalValue = 906;
		    else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPBuccaneers") &&
				(mapType > 400))
   			   totalValue = 202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipAxeRiders3")
	   		   totalValue = 605;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates2")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipVillagers2")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCavalryDamageSioux")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCavalryHitpointsSioux")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipRifleRiders3")
	   		   totalValue = 101;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCommandSkill")
	   		   totalValue = 1199;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPCavalryCombatSioux")
	   		   totalValue = 902;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPMustangs")
	   		   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4")
	   		   totalValue = 905;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPWindRunner")
	   		   totalValue = 598;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPSiouxYanktonSupport")
	   		   totalValue = 597;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipDogsoldiersTeam2")
	   		   totalValue = 1202;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivBritish)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2") &&
				(mapType > 400))
   			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCPrivateers2") &&
				(mapType > 400))
   			   totalValue = 202;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalGunners") &&
				(mapType < 400))
   			   totalValue = 200;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCImprovedLongbows")
	   		   totalValue = 899;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates2")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFalconets3")
	   		   totalValue = 903;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPShipHorseArtillery2")
	   		   totalValue = 1199;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCAdvancedArsenal")
	   		   totalValue = 599;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivSpanish)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2") &&
				(mapType > 400))
   			   totalValue = 201;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFrigates") &&
					 (mapType > 400))
			   totalValue = 202;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCArmada") &&
					 (mapType < 400))
			   totalValue = 200;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
	   		   totalValue = 203;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCHandInfantryCombatSpanish") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCCaballeros"))
   			   totalValue = 897;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCHandCavalryCombatSpanish")
	   		   totalValue = 898;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 606;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 605;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipSettlers4")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates2")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates2")
	   		   totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFalconets3")
	   		   totalValue = 902;
		    else if (age == 0)
	   		   totalValue = 600;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else if(cMyCiv == cCivRussians)
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCNavalCombat")
   			   totalValue = 200;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCaravels2") &&
				(mapType > 400))
	   		   totalValue = 201;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFalconets3")
	   		   totalValue = 904;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4")
	   		   totalValue = 903;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates4")
	   		   totalValue = 898;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCUniqueCombatRussian")
	   		   totalValue = 602;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates3")
	   		   totalValue = 603;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates3")
	   		   totalValue = 604;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates3")
	   		   totalValue = 605;
			//else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipFoodCrates2")
	   		   //totalValue = 601;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCAdvancedArsenal")
	   		   totalValue = 599;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCMercsHighlanders")
	   		   totalValue = 905;
			//else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCXPDistributivism")
	   		   //totalValue = 301;
			else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCSpawnStrelet")
	   		   totalValue = 898;
			else if ((kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCStreletsCombatRussian") ||
					 (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipCoinCrates4"))
			   totalValue = 899;
		    else if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCCavalryLOSTeam")
	   		   totalValue = 599;
			else if (age == 0)
	   		   totalValue = 600;
			else
		       totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   else
   {
         for (i=0; < totalCards)
   	     {
   		    age = aiHCDeckGetCardAgePrereq(gDefaultDeck, i);
		    totalValue = 300*(age+1);
		    xsArraySetInt(gCardValues, i, totalValue);
	     }
   }
   gCardsReady = true;
}

//==============================================================================
/* shipGrantedHandler()

   

	Update 02/10/2004:  New algorithm.
	1)  Clear the list
	2)  Get all the settlers you can.
	3)  If space remains, get the resource you're lowest on.

   Update on 04/22/2004:  New algorithm:
   1)  First year, get wood
   2)  Later years, get the resource that gives the largest bucket.
   3)  In a tie, coin > food > wood
   Note, in the early years, the resourceManager will sell food and buy wood as needed
   to drive early housing growth.

   Update on 4/27/2004:  Get wood for first TWO years.

   Scrapped on 5/12/2004.  Now, settlers have to be imported.  New logic:
   1)  Get settlers always, except:
   2)  If I can afford governor and I don't have him yet, get him
   3)  If I can afford viceroy and I don't have him yet and he's available, get him.
   4)  If settlers aren't available or less than 10 are available, get most needed resource.
   
   August:  Always get an age upgrade if you can.  Otherwise, compute the value for each bucket,
   and choose the best buy.  
   
   November:  Adding multiplier for econ/mil units based on rush/boom emphasis
*/
//==============================================================================
void shipGrantedHandler(int parm=-1) // Event handler
{
   aiEcho(" ");
   aiEcho("SHIP GRANTED:");
   
   if(cMyCiv == cCivPortuguese && kbGetAge() == cAge1)
      return;
   if (kbResourceGet(cResourceShips) < 1.0)
      return;     // Early out if we don't have a ship...no point even checking.
   
   //test add
   if(gCardsReady==false)
      return;
   
	aiEcho("Choosing contents for next transport");

   int bestUnitScore = -1;
   static int count = 0;
   int totalCards = aiHCDeckGetNumberCards(gDefaultDeck);
   int bestCard = -1;
   int totalValue = -1;         // What is this bucket worth to me?
   //add
   int numEnemy = getUnitCountByLocation(cUnitTypeLogicalTypeLandMilitary, cPlayerRelationEnemy, cUnitStateAlive, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 40.0);
   int numNavy = kbUnitCount(cMyID, cUnitTypeAbstractWarShip, cUnitStateAlive);
   if (kbUnitCount(cMyID, cUnitTypeSaloon, cUnitStateAlive) > 0 && count > 10)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 91)
				bestCard = i;
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
	else if (xsGetTime() > 480000 && kbGetAge() > cAge2 && getNavalTargetPlayer() > 0)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 202)
			{
			   bestCard = i;
			}
		}
		if(bestCard < 0)
		{
		  for (i=0; < totalCards)
		  {
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 201)
			{
			   bestCard = i;
			}
		  }
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
	else if (kbGetAge() == cAge3 && numEnemy > 10)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 101)
				bestCard = i;
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
    else if (xsGetTime() > 480000 && getNavalTargetPlayer() > 0)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 201)
			{
			   bestCard = i;
			}
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
   else if (kbGetAge() == cAge2 && numEnemy > 10)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 100)
				bestCard = i;
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
	else if (xsGetTime() > 1200000 && numNavy > 5)
	{
		for (i=0; < totalCards)
		{
			//-- Skip card if we can't play it.
			if(aiHCDeckCanPlayCard(i) == false)
				continue;
		    
			totalValue = xsArrayGetInt(gCardValues, i);

			if (totalValue == 203)
				bestCard = i;
		}
		if (bestCard >= 0)
		{
			aiHCDeckPlayCard(bestCard);
			return;
		}
	}
   
   //go default
   //if (aiPlanGetState(gAgeUpResearchPlan) >= 0)
   if(agingUp() == true)
   {
      // We're aging up, save this shipment for after it completes
      aiEcho("We're aging up, delaying this shipment until then.");
	  if(cMyCiv == cCivFrench && kbGetAge() == cAge2)
         aiEcho("pass.");
	  else if(cMyCiv == cCivPortuguese && kbGetAge() == cAge2)
         aiEcho("pass.");
	  else if(cMyCiv == cCivGermans && kbGetAge() == cAge2)
         aiEcho("pass.");
	  else
	     return;
   }
   aiEcho("**** Picking HC card to play");
   for (i=0; < totalCards)
   {
      //-- Skip card if we can't play it.
		if(aiHCDeckCanPlayCard(i) == false)
			continue;
		    
		totalValue = xsArrayGetInt(gCardValues, i);

	    if (totalValue > bestUnitScore)
        {
           bestUnitScore = totalValue;
           bestCard = i;
        }
   }

	//jap
	if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, bestCard)) == "ypHCShipCoinCrates4")
	   xsArraySetInt(gCardValues, bestCard, 899);
	if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, bestCard)) == "ypHCShipWoodCrates4")
	   xsArraySetInt(gCardValues, bestCard, 899);
	if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, bestCard)) == "ypHCShipWoodCrates2")
	   xsArraySetInt(gCardValues, bestCard, 600);
	if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, bestCard)) == "ypHCShipCoinCrates2")
	   xsArraySetInt(gCardValues, bestCard, 604);
	
	if ((count > 0) && (kbGetAge() == cAge1) && (xsGetTime() < 300000))
		return;

	if ((count == 3) && (cMyCiv == cCivFrench) && (kbGetAge() < cAge3 || kbResourceGet(cResourceGold) < 1000) && (xsGetTime() < 450000))
		return;
	if ((count == 3) && (cMyCiv == cCivChinese) && (kbGetAge() < cAge3 || kbResourceGet(cResourceGold) < 1000) && (xsGetTime() < 450000))
		return;
	if ((count == 3) && (cMyCiv == cCivIndians) && (kbGetAge() < cAge3 || kbResourceGet(cResourceFood) < 600) && (xsGetTime() < 450000))
		return;
	if((count == 3) && (cMyCiv == cCivGermans) && (kbGetAge() == cAge2))
	  {
         for (i=0; < aiHCDeckGetNumberCards(gDefaultDeck))
   	     {
   		    if (kbGetTechName(aiHCDeckGetCardTechID(gDefaultDeck, i)) == "HCShipWoodCrates4German")
   			   xsArraySetInt(gCardValues, i, 900);
		 }
	  }
	if ((xsArrayGetInt(gCardValues, bestCard) < 601) && (cMyCiv == cCivOttomans) && (kbGetAge() == cAge2))
	{
		return;
	}
	if ((xsArrayGetInt(gCardValues, bestCard) < 604) && (cMyCiv == cCivXPAztec) && (kbGetAge() == cAge2) && (xsGetTime() < 480000))
	{
		return;
	}
	if (bestCard >= 0)
	{
		aiEcho("  Choosing card "+bestCard);
		aiHCDeckPlayCard(bestCard);
		count = count+1;
	}
}


//==============================================================================
// extraShipMonitor
// Watches for extra ships...granted in bulk via scenario, or 
// due to oversight in shipGrantedHandler()?
//==============================================================================
rule extraShipMonitor
inactive
group tcComplete
minInterval 5
{
   if (kbResourceGet(cResourceShips) > 0)
      shipGrantedHandler();   // Spend the surplus
}


void getHCTech(string name="", int techID=-1, int pri=50)
{  // Make a simple plan to research a HC tech.
   int planID = aiPlanCreate(name, cPlanResearch);
   aiPlanSetVariableInt(planID, cResearchPlanTechID, 0, techID);
   aiPlanSetEscrowID(planID, cRootEscrowID);
   aiPlanSetDesiredPriority(planID, pri);
   aiPlanSetActive(planID);
}


 



//==============================================================================
// ShouldIResign
//==============================================================================
rule ShouldIResign
   minInterval 7
   active
{
   static bool hadHumanAlly = false;
   
   if (gSPC == true)
   {
      xsDisableSelf();
      return;
   }
   
   if (cvOkToResign == false)
   {
      return;     // Early out if we're not allowed to think about this.
   }
   
   // Don't resign if you have a human ally that's still in the game
   int i = 0;
   bool humanAlly = false;    // Set true if we have a surviving human ally.
   int humanAllyID = -1;
   bool complained = false;   // Set flag true if I've already whined to my ally.
   bool wasHumanInGame = false;  // Set true if any human players were in the game
   bool isHumanInGame = false;   // Set true if a human survives.  If one existed but none survive, resign.
   
   // Look for humans
   for (i=1; <=cNumberPlayers)
   {
      if ( kbIsPlayerHuman(i) == true)
      {
         wasHumanInGame = true;
         if ( kbHasPlayerLost(i) == false )
            isHumanInGame = true;
      }
      if ( (kbIsPlayerAlly(i) == true) && (kbHasPlayerLost(i) == false) && (kbIsPlayerHuman(i) == true) )
      {
         humanAlly = true; // Don't return just yet, let's see if we should chat.
         hadHumanAlly = true; // Set flag to indicate that we once had a human ally.
         humanAllyID = i;  // Player ID of lowest-numbered surviving human ally.
      }
   }
   
//   if ( (wasHumanInGame == true) && (isHumanInGame == false) )
   if ( (hadHumanAlly == true) && (humanAlly == false) ) // Resign if my human allies have quit.
   {
      //aiResign(); // If there are no humans left, and this wasn't a bot battle from the start, quit.
      aiEcho("Resigning because I had a human ally, and he's gone...");
      aiResign(); // I had a human ally or allies, but do not any more.  Our team loses.
      return;  // Probably not necessary, but whatever...
   }
   // Check for MP with human allies gone.  This trumps the OkToResign setting, below.
   if ( (aiIsMultiplayer() == true) && (hadHumanAlly == true) && (humanAlly == false) )   
   {  // In a multiplayer game...we had a human ally earlier, but none remain.  Resign immediately
      aiEcho("Resign because my human ally is no longer in the game.");
      aiResign();    // Don't ask, just quit.
      xsEnableRule("resignRetry");
      xsDisableSelf();
      return;
   }




   //Don't resign too soon.
   if (xsGetTime() < 600000)     // 600K = 10 min
     return;

   //Don't resign if we have over 30 active pop slots.
   if (kbGetPop() >= 10)
      return;
   
   if (kbGetPop() < 3)
      aiResign();
   // Resign if the known enemy pop is > 10x mine
  
   int enemyPopTotal = 0.0;
   int enemyCount = 0;
   int myPopTotal = 0.0;

   for (i=1; < cNumberPlayers)
   {
      if (kbHasPlayerLost(i) == false)
      {
         if( i == cMyID )
            myPopTotal = myPopTotal + kbUnitCount(i, cUnitTypeUnit, cUnitStateAlive);
         if( (kbIsPlayerEnemy(i) == true) && (kbHasPlayerLost(i) == false) )
         {
            enemyPopTotal = enemyPopTotal + kbUnitCount(i, cUnitTypeUnit, cUnitStateAlive);
            enemyCount = enemyCount + 1;
         }
      }
   }

   if (enemyCount < 1)
      enemyCount = 1;      // Avoid div 0
   
   float enemyRatio = (enemyPopTotal/enemyCount) / myPopTotal;

   if ( enemyRatio > 10 )       // My pop is 1/10 the average known pop of enemies
   {
      if ( humanAlly == false )
      {
         aiEcho("Resign at 10:1 pop: EP Total("+enemyPopTotal+"), MP Total("+myPopTotal+")");
         aiAttemptResign(cAICommPromptToEnemyMayIResign);
         xsEnableRule("resignRetry");
         xsDisableSelf();
         return;
      }
      if ( (humanAlly == true) && (complained == false) )
      {  // Whine to your partner
         sendStatement(humanAllyID, cAICommPromptToAllyImReadyToQuit);
         xsEnableRule("resignRetry");
         xsDisableSelf();
         complained = true;
      }
   }
   if ( (enemyRatio > 4) && (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) < 1 ) )       // My pop is 1/4 the average known pop of enemies, and I have no TC
   {
      if (humanAlly == false)
      {
         aiEcho("Resign with no 4:1 pop and no TC: EP Total("+enemyPopTotal+"), MP Total("+myPopTotal+")");     
         //sendStatement(aiGetMostHatedPlayerID(), cAICommPromptAIResignActiveEnemies, -1);
         aiAttemptResign(cAICommPromptToEnemyMayIResign);
         //breakpoint;
         xsEnableRule("resignRetry");
         xsDisableSelf();
         return;
      }
   }
}


rule resignRetry
inactive
minInterval 240
{
   xsEnableRule("ShouldIResign");
   xsDisableSelf();
}



//==============================================================================
// resignHandler
//==============================================================================
void resignHandler(int result =-1)
{
   aiEcho("***************** Resign handler running with result "+result);
   if (result == 0)
   {

      xsEnableRule("resignRetry");
      return;
   }
   aiEcho("Resign handler returned "+result);

   aiResign();
   return;
}

int createTechProgression(int techID = -1, int escrowID = -1, int pri = 50)
{
   int planID = -1;
   if ((techID < 0) || (escrowID < 0))
      return(-1);
   
   planID = aiPlanCreate("Tech Progression "+techID, cPlanProgression);
   if (planID < 0)
      return(-1);
   
   aiPlanSetVariableInt(planID, cProgressionPlanGoalTechID, 0, techID);
   aiPlanSetDesiredPriority(planID, pri);
   aiPlanSetEscrowID(planID, escrowID);
   aiPlanSetBaseID(planID, kbBaseGetMainID(cMyID));
   aiPlanSetActive(planID);
   
   return(planID);
}

rule bigTechManager
group tcComplete
inactive
minInterval 300
{
   if (civIsNative() == false)
   {
      xsDisableSelf();
      return;
   }

   if (xsGetTime() < 25*60*1000)
      return;  // Wait until 25 minutes
   
   if (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) < 1)
      return;

   aiEcho(" ");
   aiEcho("#### Starting 'big tech' research plans. ####");
   aiEcho(" ");
   
   
   if (cMyCiv == cCivXPIroquois)
   {
      createSimpleResearchPlan(cTechBigFarmStrawberry, -1, cMilitaryEscrowID, 80);
      createSimpleResearchPlan(cTechBigPlantationMapleFestival, -1, cMilitaryEscrowID, 80);
      createSimpleResearchPlan(cTechBigLonghouseWoodlandDwellers, -1, cMilitaryEscrowID, 80);
   }
   else if (cMyCiv == cCivXPSioux)
   {
      createSimpleResearchPlan(cTechBigSiouxDogSoldiers, -1, cMilitaryEscrowID, 80);
      createSimpleResearchPlan(cTechBigPlantationGunTrade, -1, cMilitaryEscrowID, 80);
      createSimpleResearchPlan(cTechBigFarmHorsemanship, -1, cMilitaryEscrowID, 80);
   }
   
   xsDisableSelf();
}


//==============================================================================
// rule lateInAge
//==============================================================================
extern int gLateInAgePlayerID = -1;
extern int gLateInAgeAge = -1;
rule lateInAge
minInterval 120
inactive
{
   // This rule is used to taunt a player who is behind in the age race, but only if
   // he is still in the previous age some time (see minInterval) after the other
   // players have all advanced.  Before activating this rule, the calling function
   // (ageUpHandler) must set the global variables for playerID and age, 
   // gLateInAgePlayerID and gLateInAgeAge.  When the rule finally fires minInterval 
   // seconds later, it checks to see if that player is still behind, and taunts accordingly.
   if (gLateInAgePlayerID < 0)
      return;
   
   if (kbGetAgeForPlayer(gLateInAgePlayerID) == gLateInAgeAge)
   {
      if ( gLateInAgeAge == cAge1 )
      {
         if ( (kbIsPlayerAlly(gLateInAgePlayerID) == true) && (gLateInAgePlayerID != cMyID) )
            sendStatement(gLateInAgePlayerID, cAICommPromptToAllyHeIsAge1Late); 
         if ( (kbIsPlayerEnemy(gLateInAgePlayerID) == true ) )
            sendStatement(gLateInAgePlayerID, cAICommPromptToEnemyHeIsAge1Late);
      }
      else
      {
         if ( (kbIsPlayerAlly(gLateInAgePlayerID) == true) && (gLateInAgePlayerID != cMyID) )
            sendStatement(gLateInAgePlayerID, cAICommPromptToAllyHeIsStillAgeBehind); 
         if ( (kbIsPlayerEnemy(gLateInAgePlayerID) == true ) )
            sendStatement(gLateInAgePlayerID, cAICommPromptToEnemyHeIsStillAgeBehind);
      }
   }
   gLateInAgePlayerID = -1;
   gLateInAgeAge = -1;
   xsDisableSelf();
}


//==============================================================================
// AgeUpHandler
//==============================================================================
void ageUpHandler(int playerID = -1) 
{
   
   int age = kbGetAgeForPlayer(playerID);
   bool firstToAge = true;      // Set true if this player is the first to reach that age, false otherwise
   bool lastToAge = true;         // Set true if this player is the last to reach this age, false otherwise
   int index = 0;
   int slowestPlayer = -1;
   int lowestAge = 100000;
   int lowestCount = 0;          // How many players are still in the lowest age?
   
   //aiEcho("AGE HANDLER:  Player "+playerID+" is now in age "+age);
   
   for (index = 1; < cNumberPlayers)
   {
      if (index != playerID)
      {
         // See if this player is already at the age playerID just reached.
         if (kbGetAgeForPlayer(index) >= age)
            firstToAge = false;  // playerID isn't the first
         if (kbGetAgeForPlayer(index) < age)
            lastToAge = false;   // Someone is still behind playerID.
      }
      if (kbGetAgeForPlayer(index) < lowestAge)
      {
         lowestAge = kbGetAgeForPlayer(index);
         slowestPlayer = index;
         lowestCount = 1;
      }
      else
      {
         if (kbGetAgeForPlayer(index) == lowestAge)
            lowestCount = lowestCount + 1;
      }
   }


   if ( (firstToAge == true) && (age == cAge2) )
   {  // This player was first to age 2
      if ( (kbIsPlayerAlly(playerID) == true) && (playerID != cMyID) )
         sendStatement(playerID, cAICommPromptToAllyHeReachesAge2First); 
      if ( (kbIsPlayerEnemy(playerID) == true ) )
         sendStatement(playerID, cAICommPromptToEnemyHeReachesAge2First);
      return();
   }
   if ( (lastToAge == true) && (age == cAge2) )
   {  // This player was last to age 2
      if ( (kbIsPlayerAlly(playerID) == true) && (playerID != cMyID) )
         sendStatement(playerID, cAICommPromptToAllyHeReachesAge2Last); 
      if ( (kbIsPlayerEnemy(playerID) == true ) )
         sendStatement(playerID, cAICommPromptToEnemyHeReachesAge2Last);
      return();
   }

   // Check to see if there is a lone player that is behind everyone else
   if ( (lowestCount == 1) && (slowestPlayer != cMyID) )
   {
      // This player is slowest, nobody else is still in that age, and it's not me,
      // so set the globals and activate the rule...unless it's already active.
      // This will cause a chat to fire later (currently 120 sec mininterval) if
      // this player is still lagging technologically.
      if (gLateInAgePlayerID < 0)
      {
         if (xsIsRuleEnabled("lateInAge") == false)
         {
            gLateInAgePlayerID = slowestPlayer;
            gLateInAgeAge = lowestAge;
            xsEnableRule("lateInAge");
            return();
         }
      }
   }
   
   // Check to see if ally advanced before me
   if ( (kbIsPlayerAlly(playerID) == true) && (age > kbGetAgeForPlayer(cMyID)) )
   {
      sendStatement(playerID, cAICommPromptToAllyHeAdvancesAhead);   
      return();
   }

   // Check to see if ally advanced before me
   if ( (kbIsPlayerEnemy(playerID) == true) && (age > kbGetAgeForPlayer(cMyID)) )
   {
      sendStatement(playerID, cAICommPromptToEnemyHeAdvancesAhead);   
      return();
   }      

}


/*
   getNuggetChatID()

   Called from the nugget event handler.  Given the player ID, determine what
   type of nugget was just claimed, and return a specific appropriate chat ID, if any.

   If none apply, return the general 'got nugget' chat ID.
*/
int getNuggetChatID(int playerID = -1)
{
   int retVal = cAICommPromptToEnemyWhenHeGathersNugget;
   int type = aiGetLastCollectedNuggetType(playerID);
   int effect = aiGetLastCollectedNuggetEffect(playerID);
   
   switch(type)
   {
      case cNuggetTypeAdjustResource:
      {
         switch(effect)
         {
            case cResourceGold:
            {
               retVal = cAICommPromptToEnemyWhenHeGathersNuggetCoin;
               break;
            }
            case cResourceFood:
            {
               retVal = cAICommPromptToEnemyWhenHeGathersNuggetFood;
               break;
            }
            case cResourceWood:
            {
               retVal = cAICommPromptToEnemyWhenHeGathersNuggetWood;
               break;
            }
         }
         break;
      }
      case cNuggetTypeSpawnUnit:
      {
         if ( (effect == cUnitTypeNatMedicineMan) || (effect == cUnitTypeNatClubman) || (effect == cUnitTypeNatRifleman)
               || (effect == cUnitTypeNatHuaminca) || (effect == cUnitTypeNatTomahawk) || (effect == cUnitTypeNativeScout)
               || (effect == cUnitTypeNatEagleWarrior) )
         {
            retVal = cAICommPromptToEnemyWhenHeGathersNuggetNatives;
         }
         if ( (effect == cUnitTypeSettler) || (effect == cUnitTypeCoureur) || (effect == cUnitTypeSettlerNative) || (effect == cUnitTypeypSettlerAsian) || (effect == cUnitTypeypSettlerIndian) )
            retVal = cAICommPromptToEnemyWhenHeGathersNuggetSettlers;
         break;
      }
      case cNuggetTypeGiveLOS:
      {
         break;
      }
      case cNuggetTypeAdjustSpeed:
      {
         break;
      }
      case cNuggetTypeAdjustHP:
      {
         break;
      }
      case cNuggetTypeConvertUnit:
      {
         if ( (effect == cUnitTypeNatMedicineMan) || (effect == cUnitTypeNatClubman) || (effect == cUnitTypeNatRifleman)
               || (effect == cUnitTypeNatHuaminca) || (effect == cUnitTypeNatTomahawk) || (effect == cUnitTypeNativeScout)
               || (effect == cUnitTypeNatEagleWarrior) )
         {
            retVal = cAICommPromptToEnemyWhenHeGathersNuggetNatives;
         }
         if ( (effect == cUnitTypeSettler) || (effect == cUnitTypeCoureur) || (effect == cUnitTypeSettlerNative) || (effect == cUnitTypeypSettlerAsian) || (effect == cUnitTypeypSettlerIndian) )
            retVal = cAICommPromptToEnemyWhenHeGathersNuggetSettlers;
         break;
      }
   }
   
   
   return(retVal);
}




//==============================================================================
// nuggetHandler
//==============================================================================
void nuggetHandler(int playerID =-1)
{
   if (kbGetAge() > cAge2)
      return;  // Do not send these chats (or even bother keeping count) after age 2 ends.
	//aiEcho("***************** Nugget handler running with playerID"+playerID);   
   static int nuggetCounts = -1;    // Array handle.  nuggetCounts[i] will track how many nuggets each player has claimed
   static int totalNuggets = 0;
   const int  cNuggetRange = 100;   // Nuggets within this many meters of a TC are "owned".
   int defaultChatID = getNuggetChatID(playerID);
   
   if ( (playerID < 1) || (playerID > cNumberPlayers) )
      return;
   
   // Initialize the array if we haven't done this before.
   if (nuggetCounts < 0)
   {
      nuggetCounts = xsArrayCreateInt(cNumberPlayers, 0, "Nugget Counts");
   }
   
   // Score this nugget
   totalNuggets = totalNuggets + 1;
   xsArraySetInt(nuggetCounts, playerID, xsArrayGetInt(nuggetCounts, playerID) + 1);
   
   // Check to see if one of the special-case chats might be appropriate.
   // If so, use it, otherwise, fall through to the generic ones.
   // First, some bookkeeping
   int i = 0;
   int count = 0;
   int lowestPlayer = -1;
   int lowestCount = 100000;  // Insanely high start value, first pass will reset it.
   int totalCount = 0;
   int averageCount = 0;
   int highestPlayer = -1;
   int highestCount = 0;
   for (i=1; <cNumberPlayers)
   {
      count = xsArrayGetInt(nuggetCounts, i,);  // How many nuggets has player i gathered?
      if ( count < lowestCount )
      {
         lowestCount = count;
         lowestPlayer = i;
      }
      if ( count > highestCount )
      {
         highestCount = count;
         highestPlayer = i;
      }
      totalCount = totalCount + count; 
   }
   averageCount = totalCount / (cNumberPlayers - 1);
   
   if (totalCount == 1) // This is the first nugget in the game
   {
      if(playerID != cMyID)
      {
         if(kbIsPlayerAlly(playerID) == true)
         {
            sendStatement(playerID, cAICommPromptToAllyWhenHeGathersFirstNugget); 
            return;
         }
         else
         {
            sendStatement(playerID, cAICommPromptToEnemyWhenHeGathersFirstNugget);
            return;
         }
      }
   }
   
   int playersCount = 0;
   int myCount = 0;
   myCount = xsArrayGetInt(nuggetCounts, cMyID);
   playersCount = xsArrayGetInt(nuggetCounts, playerID);
   // Check if this player is way ahead of me, i.e. 2x my total and ahead by at least 2
   if ( ((playersCount - myCount) >= 2) && (playersCount >= (myCount*2)) )
   {
      if(kbIsPlayerAlly(playerID) == true)
      {
         sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetHeIsAhead); 
         return;
      }
      else
      {
         sendStatement(playerID, cAICommPromptToEnemyWhenHeGathersNuggetHeIsAhead);
         return;
      }
   }

   // Check if I'm way ahead of any other players
   int player = 0;      // Loop counter...who might I send a message to
   bool messageSent = false;
   if (playerID == cMyID)
   {
      for (player = 1; <cNumberPlayers)
      {
         playersCount = xsArrayGetInt(nuggetCounts, player);
         if ( ((myCount - playersCount) >= 2) && (myCount >= (playersCount*2)) )
         {
            if(kbIsPlayerAlly(player) == true)
            {
               sendStatement(player, cAICommPromptToAllyWhenIGatherNuggetIAmAhead); 
               messageSent = true;
            }
            else
            {
               sendStatement(player, cAICommPromptToEnemyWhenIGatherNuggetIAmAhead);
               messageSent = true;
            }
         }  
      }
   }
   if (messageSent == true)
      return;
   
   // Check to see if the nugget was gathered near a main base.  
   // For now, check playerID's explorer location, assume nugget was gathered there.
   // Later, we may add location info to the event handler.
   vector explorerPos = cInvalidVector;
   int explorerID = -1;
   int tcID = -1;
   
   explorerID = getUnit(cUnitTypeExplorer, playerID, cUnitStateAlive);
   if (explorerID >= 0) // We know of an explorer for this player
   {
      if (kbUnitVisible(explorerID) == true)
      {  // And we can see him.
         explorerPos = kbUnitGetPosition(explorerID);
         if (playerID == cMyID)
         {  // I gathered the nugget
            // Get nearest ally TC distance
            tcID = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAlly, cUnitStateAlive, explorerPos, cNuggetRange);
            if ( (tcID > 0) && (kbUnitGetPlayerID(tcID) != cMyID) )
            {  // A TC is near, owned by an ally, and it's not mine...
               sendStatement(kbUnitGetPlayerID(tcID), cAICommPromptToAllyWhenIGatherNuggetHisBase); // I got a nugget near his TC
               return;
            }
            // Get nearest enemy TC distance
            tcID = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateAlive, explorerPos, cNuggetRange);
            if ( tcID > 0 )
            {  // A TC is near, owned by an enemy...
               sendStatement(kbUnitGetPlayerID(tcID), cAICommPromptToEnemyWhenIGatherNuggetHisBase); // I got a nugget near his TC
               return;
            }
         }
         else 
         {
            if (kbIsPlayerAlly(playerID) == true)
            {  // An ally has found a nugget, see if it's close to my TC
               tcID = getUnitByLocation(cUnitTypeTownCenter, cMyID, cUnitStateAlive, explorerPos, cNuggetRange);   
               if (tcID > 0)
               {  // That jerk took my nugget!
                  sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetMyBase); // He got one in my zone
                  return;
               }
            }
            else 
            {  // An enemy has found a nugget, see if it's in my zone
               tcID = getUnitByLocation(cUnitTypeTownCenter, cMyID, cUnitStateAlive, explorerPos, cNuggetRange);   
               if (tcID > 0)
               {  // That jerk took my nugget!
                  sendStatement(playerID, cAICommPromptToEnemyWhenHeGathersNuggetMyBase); // He got one in my zone
                  return;      
               }
            }
         }     // if me else
      }  // If explorer is visible to me
   }  // If explorer known
   
   // No special events fired, so go with generic messages
   // defaultChatID has the appropriate chat if an enemy gathered the nugget...send it.
   // Otherwise, convert to the appropriate case.
	if(playerID != cMyID)
	{
		if(kbIsPlayerEnemy(playerID) == true)
		{
			sendStatement(playerID, defaultChatID);
		}
		else
		{  // Find out what was returned, send the equivalent ally version
         switch(defaultChatID)
         {
            case cAICommPromptToEnemyWhenHeGathersNugget:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNugget); 
               break;
            }
            case cAICommPromptToEnemyWhenHeGathersNuggetCoin:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetCoin); 
               break;
            }
            case cAICommPromptToEnemyWhenHeGathersNuggetFood:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetFood); 
               break;
            }
            case cAICommPromptToEnemyWhenHeGathersNuggetWood:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetWood); 
               break;
            }
            case cAICommPromptToEnemyWhenHeGathersNuggetNatives:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetNatives); 
               break;
            }
            case cAICommPromptToEnemyWhenHeGathersNuggetSettlers:
            {
               sendStatement(playerID, cAICommPromptToAllyWhenHeGathersNuggetSettlers); 
               break;
            }
         }
		}
	}
	else
	{
		//-- I gathered the nugget.  Figure out what kind it is based on the defaultChatID enemy version.
      // Substitute appropriate ally and enemy chats.
      switch(defaultChatID)
      {
         case cAICommPromptToEnemyWhenHeGathersNugget:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNugget);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNugget);
            break;
         }
         case cAICommPromptToEnemyWhenHeGathersNuggetCoin:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNuggetCoin);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNuggetCoin);
            break;
         }
         case cAICommPromptToEnemyWhenHeGathersNuggetFood:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNuggetFood);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNuggetFood);
            break;
         }
         case cAICommPromptToEnemyWhenHeGathersNuggetWood:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNuggetWood);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNuggetWood);
            break;
         }
         case cAICommPromptToEnemyWhenHeGathersNuggetNatives:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNuggetNatives);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNuggetNatives);
            break;
         }
         case cAICommPromptToEnemyWhenHeGathersNuggetSettlers:
         {
            sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenIGatherNuggetSettlers);
            sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyWhenIGatherNuggetSettlers);
            break;
         }
      }
	}

	return;
}




rule monitorFeeding
inactive
minInterval 60
{
   // Once a minute, check the global vars to see if there is somebody we need
   // to be sending resources to.  If so, send whatever we have in root.  If not,
   // go to sleep.
   bool stayAwake = false; // Set true if we have orders to feed anything, keeps rule active.
   float toSend = 0.0;
   bool goldSent = false;  // Used for choosing chat at end.
   bool woodSent = false;
   bool foodSent = false;
   bool failure = false;
   int failPlayerID = -1;
   
   if (gFeedGoldTo > 0)
   {
      stayAwake = true; // There is work to do, stay active.
      toSend = 0.0;
      if (aiResourceIsLocked(cResourceGold) == false)
      {
         kbEscrowFlush(cEconomyEscrowID, cResourceGold, false);
         kbEscrowFlush(cMilitaryEscrowID, cResourceGold, false);
         toSend = kbEscrowGetAmount(cRootEscrowID, cResourceGold) * .85;   // Round down for trib penalty
      }
      if (toSend > 100.0)
      {  // can send something
         goldSent = true;
         gLastTribSentTime = xsGetTime();
         if (toSend > 200.0)
            aiTribute(gFeedGoldTo, cResourceGold, toSend/2);
         else
            aiTribute(gFeedGoldTo, cResourceGold, 100.0);
      }
      else
      {
         failure = true;
         failPlayerID = gFeedGoldTo;
      }
      stayAwake = true; // There is work to do, stay active.
   }
   
   if (gFeedWoodTo > 0)
   {
      stayAwake = true; // There is work to do, stay active.
      toSend = 0.0;
      if (aiResourceIsLocked(cResourceWood) == false)
      {
         kbEscrowFlush(cEconomyEscrowID, cResourceWood, false);
         kbEscrowFlush(cMilitaryEscrowID, cResourceWood, false);
         toSend = kbEscrowGetAmount(cRootEscrowID, cResourceWood) * .85;   // Round down for trib penalty
      }
      if (toSend > 100.0)
      {  // can send something
         gLastTribSentTime = xsGetTime();
         woodSent = true;
         if (toSend > 200.0)
            aiTribute(gFeedWoodTo, cResourceWood, toSend/2);
         else
            aiTribute(gFeedWoodTo, cResourceWood, 100.0);
      }
      else
      {
         failure = true;
         failPlayerID = gFeedWoodTo;
      }
      stayAwake = true; // There is work to do, stay active.
   }
   
   if (gFeedFoodTo > 0)
   {
      stayAwake = true; // There is work to do, stay active.
      toSend = 0.0;
      if (aiResourceIsLocked(cResourceFood) == false)
      {
         kbEscrowFlush(cEconomyEscrowID, cResourceFood, false);
         kbEscrowFlush(cMilitaryEscrowID, cResourceFood, false);
         toSend = kbEscrowGetAmount(cRootEscrowID, cResourceFood) * .85;   // Round down for trib penalty
      }
      if (toSend > 100.0)
      {  // can send something
         gLastTribSentTime = xsGetTime();
         foodSent = true;
         if (toSend > 200.0)
            aiTribute(gFeedFoodTo, cResourceFood, toSend/2);
         else
            aiTribute(gFeedFoodTo, cResourceFood, 100.0);
      }
      else
      {
         failure = true;
         failPlayerID = gFeedFoodTo;
      }
      stayAwake = true; // There is work to do, stay active.
   }
   
   int tributes = 0;
   if (goldSent == true)
      tributes = tributes + 1;
   if (woodSent == true)
      tributes = tributes + 1;
   if (foodSent == true)
      tributes = tributes + 1;
   if ( (tributes == 0) && (failure == true) )
   {  // I sent no tribute, but I should have.  Apologize
      // sendStatement(failPlayerID, cAICommPromptToAllyDeclineCantAfford);
   }
   else
   {/*   Turning off annoying repeated chats
      if (goldSent == true)  // Sent gold, chat about it
         sendStatement(gFeedGoldTo, cAICommPromptToAllyITributedCoin);
      if (foodSent == true)         
         sendStatement(gFeedFoodTo, cAICommPromptToAllyITributedFood);
      if (woodSent == true)         
         sendStatement(gFeedWoodTo, cAICommPromptToAllyITributedWood);
      */
   }
      
   
   
   if (stayAwake == false)
   {
      aiEcho("Disabling monitorFeeding rule.");
      xsDisableSelf();  // No work to do, go to sleep.
   }
}


extern int gMissionToCancel = -1;   // Function returns # of units available, sets global var so commhandler can kill the mission if needed.
int unitCountFromCancelledMission(int oppSource = cOpportunitySourceAllyRequest)
{
   int retVal = 0;   // Number of military units available
   gMissionToCancel = -1;
   
   if (oppSource == cOpportunitySourceTrigger)
      return(0); // DO NOT mess with scenario triggers
   
   int planCount = aiPlanGetNumber(cPlanMission, cPlanStateWorking, true);
   int plan = -1;
   int childPlan = -1;
   int oppID = -1;
   int pri = -1;

   
   aiEcho(planCount+" missions found");
   for (i=0; < planCount)
   {
      plan = aiPlanGetIDByIndex(cPlanMission, cPlanStateWorking, true, i);
      if (plan < 0)
         continue;
      childPlan = aiPlanGetVariableInt(plan, cMissionPlanPlanID, 0);
      oppID = aiPlanGetVariableInt(plan, cMissionPlanOpportunityID, 0);
      aiEcho("  Examining mission "+plan);
      aiEcho("    Child plan is "+childPlan);
      aiEcho("    Opp ID is "+oppID);
      pri = aiGetOpportunitySourceType(oppID);
      aiEcho("    Opp priority is "+pri+", incoming command is "+oppSource);
      if ( (pri > cOpportunitySourceAutoGenerated) && (pri <= oppSource) ) // This isn't an auto-generated opp, and the incoming command has sufficient rank.
      {
         aiEcho("  This is valid to cancel.");
         gMissionToCancel = plan;   // Store this so commHandler can kill it.
         aiEcho("    Child plan has "+aiPlanGetNumberUnits(childPlan, cUnitTypeLogicalTypeLandMilitary)+" units.");
         retVal = aiPlanGetNumberUnits(childPlan, cUnitTypeLogicalTypeLandMilitary);
      }
      else
      {
         aiEcho("Cannot cancel mission "+plan);
         retVal = 0;
      }
   }   
   return(retVal);
}


//==============================================================================
// commHandler
//==============================================================================
void commHandler(int chatID =-1)
{
   // Set up our parameters in a convenient format...
   int fromID = aiCommsGetSendingPlayer(chatID);         // Which player sent this?
   int verb = aiCommsGetChatVerb(chatID);                // Verb, like cPlayerChatVerbAttack or cPlayerChatVerbDefend
   int targetType = aiCommsGetChatTargetType(chatID);    // Target type, like cPlayerChatTargetTypePlayers or cPlayerChatTargetTypeLocation
   int targetCount = aiCommsGetTargetListCount(chatID);  // How many targets?
   static int targets = -1;                              // Array handle for target array.
   vector location = aiCommsGetTargetLocation(chatID);   // Target location
   int firstTarget = -1;
   static int  targetList = -1;
   int opportunitySource = cOpportunitySourceAllyRequest;             // Assume it's from a player unless we find out it's player 0, Gaia, indicating a trigger
	int newOppID = -1;
   
   if (fromID == 0)  // Gaia sent this 
      opportunitySource = cOpportunitySourceTrigger;
   
   if (fromID == cMyID)
      return;  // DO NOT react to echoes of my own commands/requests.
   
   if ( (kbIsPlayerEnemy(fromID) == true) && (fromID != 0) )
      return;  // DO NOT accept messages from enemies.
   
   if (targets < 0)
   {
      aiEcho("Creating comm handler target array.");
      targets = xsArrayCreateInt(30, -1, "Chat targets");
      aiEcho("Create array int returns "+targets);
   }  
   
   // Clear, then fill targets array
   int i=0;
   for (i=0; <30)
      xsArraySetInt(targets, i, -1);
   
   if (targetCount > 30)
      targetCount = 30; // Stay within array bounds
   for (i=0; <targetCount)
      xsArraySetInt(targets, i, aiCommsGetTargetListItem(chatID, i));
   
   if (targetCount > 0)
      firstTarget = xsArrayGetInt(targets, 0);
   
   // Spew
   aiEcho(" ");
   aiEcho(" ");
   aiEcho("***** Incoming communication *****");
   aiEcho("From: "+fromID+",  verb: "+verb+",  targetType: "+targetType+",  targetCount: "+targetCount);
   for (i=0; <targetCount)
      aiEcho("        "+xsArrayGetInt(targets, i));
   aiEcho("Vector: "+location);
   aiEcho(" ");
   aiEcho("***** End of communication *****");
   
   switch(verb)      // Parse this message starting with the verb
   {
      case cPlayerChatVerbAttack: 
      {     // "Attack" from an ally player could mean attack enemy base, defend my base, or claim empty VP Site.  
            // Attack from a trigger means attack unit list.
            // Permission checks need to be done inside the inner switch statement, as cvOkToAttack only affects true attack commands.
         int militaryAvail = unitCountFromCancelledMission(opportunitySource);
         int reserveAvail = aiPlanGetNumberUnits(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary);
         int totalAvail = militaryAvail + reserveAvail;
         aiEcho("Plan units available: "+militaryAvail+", reserve ="+reserveAvail+", good army size is "+gGoodArmyPop); 
         if(opportunitySource == cOpportunitySourceAllyRequest)
         {  // Don't mess with triggers this late in development
            if (totalAvail < 3)
            {
               aiEcho("Sorry, no units available.");
               // chat "no units" and bail
               sendStatement(fromID, cAICommPromptToAllyDeclineNoArmy);
               return;
            }
            if ( aiTreatyActive() == true )
            {
               aiEcho("Can't attack under treaty.");
               sendStatement(fromID, cAICommPromptToAllyDeclineProhibited);
               return;
            }
            else
            {
               if (totalAvail < (gGoodArmyPop/2))
               {
                  aiEcho("Sorry, not enough units.");
                  // chat "not enough army units" and bail
                  sendStatement(fromID, cAICommPromptToAllyDeclineSmallArmy);
                  return;
               }
            }
            // If we get here, it's not a trigger, but we do have enough units to go ahead.
            // See if cancelling an active mission is really necessary.
            if ( (reserveAvail > gGoodArmyPop) || (gMissionToCancel < 0) )
            {
               aiEcho("Plenty in reserve, no need to cancel...or no mission to cancel.");
            }
            else
            {
               aiEcho("Not enough military units, need to destroy mission "+gMissionToCancel);
               aiPlanDestroy(gMissionToCancel); // Cancel the active mission.
            }
         }
         switch(targetType)
         {
            case cPlayerChatTargetTypeLocation:
            {
               //-- Figure out what is in the this area, and do the correct thing.
               //-- Find nearest base and vpSite, and attack/defend/claim as appropriate.
               int closestBaseID = kbFindClosestBase(cPlayerRelationAny, location);     // If base is ally, attack point/radius to help out
               int closestVPSite = getClosestVPSite(location, cVPAll, cVPStateAny, -1);
               
               if ( (closestVPSite >= 0) && (distance(location, kbVPSiteGetLocation(closestVPSite)) < 20.0))
               {  // Near a VP site...this is a claim opportunity
                  newOppID = createOpportunity(cOpportunityTypeClaim, cOpportunityTargetTypeVPSite, closestVPSite, -1, opportunitySource);
                  sendStatement(fromID, cAICommPromptToAllyConfirm);
                  aiActivateOpportunity(newOppID, true);
                  break;   // We've created an Opp, we're done.
               }
               if( (closestBaseID != -1) && (distance(location, kbBaseGetLocation(kbBaseGetOwner(closestBaseID),closestBaseID)) < 50.0) )
               {  // Command is inside a base.  If enemy, base attack.  If ally, point/radius attack.  TODO:  Make the ally case a defend opportunity.
                  if (kbIsPlayerAlly( kbBaseGetOwner(closestBaseID) ) == false)
                  {  // This is an enemy base, create a base attack opportunity
                     if ( (cvOkToAttack == false) && (opportunitySource == cOpportunitySourceAllyRequest) )  // Attacks prohibited unless it's a trigger
                     {
                        // bail out, we're not allowed to do this.
                        sendStatement(fromID, cAICommPromptToAllyDeclineProhibited);
                        aiEcho("ERROR:  We're not allowed to attack.");
                        return();
                        break;
                     }
                     newOppID = createOpportunity(cOpportunityTypeDestroy, cOpportunityTargetTypeBase, closestBaseID, kbBaseGetOwner(closestBaseID), opportunitySource);
                     sendStatement(fromID, cAICommPromptToAllyConfirm, kbBaseGetLocation(kbBaseGetOwner(closestBaseID),closestBaseID));
                  }
                  else
                  {  // Ally base, so do attack point/radius here.  TODO:  Make this a defend opportunity.
                     //newOppID = createOpportunity(cOpportunityTypeDestroy, cOpportunityTargetTypePointRadius, -1, chooseAttackPlayerID(location, 50.0), opportunitySource);
                     newOppID = createOpportunity(cOpportunityTypeDefend, cOpportunityTargetTypeBase, closestBaseID, kbBaseGetOwner(closestBaseID), opportunitySource);
                     aiSetOpportunityLocation(newOppID, kbBaseGetLocation(kbBaseGetOwner(closestBaseID),closestBaseID));
                     aiSetOpportunityRadius(newOppID, 50.0);                     
                     sendStatement(fromID, cAICommPromptToAllyIWillHelpDefend, location);
                     //createOpportunity(int type, int targettype, int targetID, int targetPlayerID, int source ): 
                  }
                  aiActivateOpportunity(newOppID, true);
                  break;   // We've created an Opp, we're done.
               }  

               // If we're here, it's not a VP site, and not an enemy or ally base - basically open map.
               // Create a point/radius destroy opportunity.   TODO:  Make this a defend opportunity.
               newOppID = createOpportunity(cOpportunityTypeDestroy, cOpportunityTargetTypePointRadius, -1, chooseAttackPlayerID(location, 50.0), opportunitySource);
//                     newOppID = createOpportunity(cOpportunityTypeDefend, cOpportunityTargetTypePointRadius, -1, chooseAttackPlayerID(location, 50.0), opportunitySource);
               aiSetOpportunityLocation(newOppID, location);
               aiSetOpportunityRadius(newOppID, 50.0);
               aiActivateOpportunity(newOppID, true);                     
               sendStatement(fromID, cAICommPromptToAllyConfirm);               
               break;   
            }  // case targetType location
            case cPlayerChatTargetTypeUnits:
            {  // This is a trigger command to attack a unit list.  TODO:  Make this a unit list attack.
               //newOppID = createOpportunity(cOpportunityTypeDestroy, cOpportunityTargetTypePointRadius, -1, chooseAttackPlayerID(location, 50.0), opportunitySource);
               newOppID = createOpportunity(cOpportunityTypeDestroy, cOpportunityTargetTypeUnitList, targets, chooseAttackPlayerID(location, 50.0), opportunitySource);
               aiSetOpportunityLocation(newOppID, location);
               aiSetOpportunityRadius(newOppID, 50.0);    
               aiActivateOpportunity(newOppID, true);                 
               sendStatement(fromID, cAICommPromptToAllyConfirm);               
               break;
            }
            default:
            {  // Not recognized
               sendStatement(fromID, cAICommPromptToAllyDeclineGeneral);  
               aiEcho("ERROR!  Target type "+targetType+" not recognized.");
               return();   // Don't risk sending another chat...
               break;
            }
         }  // end switch targetType
         break;   
      }  // end verb attack
      
      case cPlayerChatVerbTribute:
      {
         if ( opportunitySource == cOpportunitySourceAllyRequest )
         {
            aiEcho("    Command was to tribute to player "+fromID+".  Resource list:");
            bool alreadyChatted = false;
            for (i=0; < targetCount)
            {
               float amountAvailable = 0.0;
               if (xsArrayGetInt(targets, i) == cResourceGold)
               {
                  kbEscrowFlush(cEconomyEscrowID, cResourceGold, false);
                  kbEscrowFlush(cMilitaryEscrowID, cResourceGold, false);
                  amountAvailable = kbEscrowGetAmount(cRootEscrowID, cResourceGold) * .85;   // Leave room for tribute penalty
                  if (aiResourceIsLocked(cResourceGold) == true)
                     amountAvailable = 0.0;
                  if (amountAvailable > 100.0)
                  {  // We will tribute something
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyITributedCoin);  
                        alreadyChatted = true;
                     }
                     gLastTribSentTime = xsGetTime();
                     if (amountAvailable > 200.0)
                        aiTribute(fromID, cResourceGold, amountAvailable/2);
                     else
                        aiTribute(fromID, cResourceGold, 100.0);
                  }
                  else
                  {
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyDeclineCantAfford);
                        alreadyChatted = true;
                     }
                  }
                  aiEcho("        Tribute gold");
               }
               if (xsArrayGetInt(targets, i) == cResourceFood)
               {
                  kbEscrowFlush(cEconomyEscrowID, cResourceFood, false);
                  kbEscrowFlush(cMilitaryEscrowID, cResourceFood, false);
                  amountAvailable = kbEscrowGetAmount(cRootEscrowID, cResourceFood) * .85;   // Leave room for tribute penalty
                  if (aiResourceIsLocked(cResourceFood) == true)
                     amountAvailable = 0.0;
                  if (amountAvailable > 100.0)
                  {  // We will tribute something
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyITributedFood);  
                        alreadyChatted = true;
                     }
                     gLastTribSentTime = xsGetTime();
                     if (amountAvailable > 200.0)
                        aiTribute(fromID, cResourceFood, amountAvailable/2);
                     else
                        aiTribute(fromID, cResourceFood, 100.0);
                  }
                  else
                  {
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyDeclineCantAfford);
                        alreadyChatted = true;
                     }
                  }
                  aiEcho("        Tribute food");
               }
               if (xsArrayGetInt(targets, i) == cResourceWood)
               {
                  kbEscrowFlush(cEconomyEscrowID, cResourceWood, false);
                  kbEscrowFlush(cMilitaryEscrowID, cResourceWood, false);
                  amountAvailable = kbEscrowGetAmount(cRootEscrowID, cResourceWood) * .85;   // Leave room for tribute penalty
                  if (aiResourceIsLocked(cResourceWood) == true)
                     amountAvailable = 0.0;
                  if (amountAvailable > 100.0)
                  {  // We will tribute something
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyITributedWood);  
                        alreadyChatted = true;
                     }
                     gLastTribSentTime = xsGetTime();
                     if (amountAvailable > 200.0)
                        aiTribute(fromID, cResourceWood, amountAvailable/2);
                     else
                        aiTribute(fromID, cResourceWood, 100.0);
                     kbEscrowAllocateCurrentResources();
                  }
                  else
                  {
                     if (alreadyChatted == false)
                     {
                        sendStatement(fromID, cAICommPromptToAllyDeclineCantAfford);
                        alreadyChatted = true;
                     }
                  }
                  aiEcho("        Tribute wood");
               }
            }
         } // end source allyRequest
         else
         {     // Tribute trigger...send it to player 1
            aiEcho("    Command was a trigger to tribute to player 1.  Resource list:");
            for (i=0; <= 2)   // Target[x] is the amount of resource type X to send
            {
               float avail = kbEscrowGetAmount(cRootEscrowID, i) * .85;
               int qty = xsArrayGetInt(targets, i);
               if (qty > 0)
               {
                  aiEcho("        Resource # "+i+", amount: "+qty+" requested.");
                  if (avail >= qty)  // we can afford it
                  {
                     aiTribute(1, i, qty);
                     aiEcho("            Sending full amount.");
                  }
                  else
                  {
                     aiTribute(1, i, avail);   // Can't afford it, send what we have.
                     aiEcho("            Sending all I have, "+avail+".");
                  }
               }
            }
         }
         break;
      }  // End verb tribute
      
      case cPlayerChatVerbFeed:     // Ongoing tribute.  Once a minute, send whatever you have in root.
      {
         aiEcho("    Command was to feed resources to a player.");
         alreadyChatted = false;
         for (i=0; < targetCount)
         {
            switch(xsArrayGetInt(targets, i))
            {
               case cResourceGold:
               {
                  gFeedGoldTo = fromID;
                  if (xsIsRuleEnabled("monitorFeeding") == false)
                  {
                     xsEnableRule("monitorFeeding");
                     monitorFeeding();
                  }
                  if (alreadyChatted == false)
                  {
                     sendStatement(fromID, cAICommPromptToAllyIWillFeedCoin);
                     alreadyChatted = true;
                  }
                  break;
               }
               case cResourceWood:
               {
                  gFeedWoodTo = fromID;
                  if (xsIsRuleEnabled("monitorFeeding") == false)
                  {
                     xsEnableRule("monitorFeeding");
                     monitorFeeding();
                  }
                  if (alreadyChatted == false)
                  {
                     sendStatement(fromID, cAICommPromptToAllyIWillFeedWood);
                     alreadyChatted = true;
                  }
                  break;
               }
               case cResourceFood:
               {
                  gFeedFoodTo = fromID;
                  if (xsIsRuleEnabled("monitorFeeding") == false)
                  {
                     xsEnableRule("monitorFeeding");
                     monitorFeeding();
                  }
                  if (alreadyChatted == false)
                  {
                     sendStatement(fromID, cAICommPromptToAllyIWillFeedFood);
                     alreadyChatted = true;
                  }
                  break;
               }
            }            
         }
         break;
      } // End verb feed

      case cPlayerChatVerbTrain:
      {
         aiEcho("    Command was to train units starting with "+firstTarget+", unit type "+kbGetProtoUnitName(firstTarget));
         // See if we have authority to change the settings
         bool okToChange = false;
         if (opportunitySource == cOpportunitySourceTrigger)
            okToChange = true;   // Triggers always rule
         if (opportunitySource == cOpportunitySourceAllyRequest)
         {
            if ( (gUnitPickSource == cOpportunitySourceAllyRequest) || (gUnitPickSource == cOpportunitySourceAutoGenerated) )
               okToChange = true;
         }
         if (okToChange == true)
         {
            aiEcho("    Permission granted, changing units.");
            gUnitPickSource = opportunitySource;    // Record who made this change
            gUnitPickPlayerID = fromID;
            
				cvPrimaryArmyUnit = firstTarget;
            cvSecondaryArmyUnit = -1;
            aiEcho("        Primary unit is "+firstTarget+" "+kbGetProtoUnitName(firstTarget));
            setUnitPickerPreference(gLandUnitPicker);
         }
         else 
         {
            sendStatement(fromID, cAICommPromptToAllyDeclineProhibited);
            aiEcho("    Cannot override existing settings.");
         }
         break;
      }
      case cPlayerChatVerbDefend:
      {  // Currently, defend is only available via the aiCommsDefend trigger, it is not in the UI.
         // An "implicit" defend can be done when a human player issues an attack command on a location
         // that does not have enemy units nearby.  
         // Currently, all defend verbs will be point/radius
         newOppID = createOpportunity(cOpportunityTypeDefend, cOpportunityTargetTypePointRadius, -1, chooseAttackPlayerID(location, 50.0), opportunitySource);
         aiSetOpportunityLocation(newOppID, location);
         aiSetOpportunityRadius(newOppID, 50.0);              
         aiActivateOpportunity(newOppID, true);
         break;
      }
      case cPlayerChatVerbClaim:
      {  // Available only from trigger, sends a vector.  Humans can send implicit claim commands
         // by sending "attack" with a point that is near an unclaimed VP site.
         closestVPSite = getClosestVPSite(location, cVPAll, cVPStateAny, -1);
         bool permitted = true;
         if ( (cvOkToClaimTrade == false) && (kbVPSiteGetType(closestVPSite) == cVPTrade) )
            permitted = false;
         if ( (cvOkToAllyNatives== false) && (kbVPSiteGetType(closestVPSite) == cVPNative) )
            permitted = false;
         
         if (permitted = false)
         {
            sendStatement(fromID, cAICommPromptToAllyDeclineProhibited);
            aiEcho("    Not allowed to claim this type of site.");            
         }
         else
         {
            newOppID = createOpportunity(cOpportunityTypeClaim, cOpportunityTargetTypeVPSite, closestVPSite, -1, opportunitySource);
            aiActivateOpportunity(newOppID, true); 
         }            
         break;
      }
		case cPlayerChatVerbStrategy:
		{
			if(xsArrayGetInt(targets, 0) == cPlayerChatTargetStrategyRush)
			{
				btRushBoom = 1.0;            
            xsEnableRule("turtleUp");
            gPrevNumTowers = gNumTowers;
            gNumTowers = 0;
			}
			else if(xsArrayGetInt(targets, 0) == cPlayerChatTargetStrategyBoom)
			{
				btRushBoom = -1.0;
			}
			else if(xsArrayGetInt(targets, 0) == cPlayerChatTargetStrategyTurtle)
			{
            
            btOffenseDefense = -1.0;
            xsEnableRule("turtleUp");
            gPrevNumTowers = gNumTowers;
            gNumTowers = 7;
			}
			sendStatement(fromID, cAICommPromptToAllyConfirm);
			break;
		}
      case cPlayerChatVerbCancel:
      {
         // Clear training (unit line bias) settings
         if ( (gUnitPickSource == cOpportunitySourceAllyRequest) || (opportunitySource == cOpportunitySourceTrigger) )  
         {  // We have an ally-generated unit line choice, destroy it
            gUnitPickSource = cOpportunitySourceAutoGenerated;
            gUnitPickPlayerID = -1;
            cvPrimaryArmyUnit = -1;
            cvSecondaryArmyUnit = -1;
            setUnitPickerPreference(gLandUnitPicker);
         }
         
         // Clear Feeding (ongoing tribute) settings
         gFeedGoldTo = -1;
         gFeedWoodTo = -1;
         gFeedFoodTo = -1;
      
         // Cancel any active attack, defend or claim missions from allies or triggers
         if ( (opportunitySource == cOpportunitySourceTrigger) || (opportunitySource == cOpportunitySourceAllyRequest) )
         {
            if (gMostRecentAllyOpportunityID >= 0)
            {
               aiDestroyOpportunity(gMostRecentAllyOpportunityID);
               aiEcho("Destroying opportunity "+gMostRecentAllyOpportunityID+" because of cancel command.");
               gMostRecentAllyOpportunityID = -1;
            }
         }
         if (opportunitySource == cOpportunitySourceTrigger)
         {
            if (gMostRecentTriggerOpportunityID >= 0)
            {
               aiDestroyOpportunity(gMostRecentTriggerOpportunityID);
               aiEcho("Destroying opportunity "+gMostRecentTriggerOpportunityID+" because of cancel command.");
               gMostRecentTriggerOpportunityID = -1;
            }       
            // Also, a trigger cancel must kill any active auto-generated attack or defend plans
            int numPlans = aiPlanGetNumber(cPlanMission, -1, true);
            int index = 0;
            int plan = -1;
            int planOpp = -1;
            for (index = 0; < numPlans)
            {
               plan = aiPlanGetIDByIndex(cPlanMission, -1, true, index);
               planOpp = aiPlanGetVariableInt(plan, cMissionPlanOpportunityID, 0);
               if (planOpp >= 0)
               {
                  if (aiGetOpportunitySourceType(planOpp) == cOpportunitySourceAutoGenerated)
                  {
                     aiEcho("--------DESTROYING MISSION "+plan+" "+aiPlanGetName(plan));
                     aiPlanDestroy(plan);
                  }
               }
            }
         }
         // Reset number of towers
         if (gPrevNumTowers >= 0)
            gNumTowers = gPrevNumTowers;
         break;
      }
      default:
      {
         aiEcho("    Command verb not found, verb value is: "+verb);
         break;
      }
   }
   aiEcho("********************************************");   
}





rule delayAttackMonitor
inactive
group tcComplete
minInterval 10
{
   // If this rule is active, it means that gDelayAttacks has been set true,
   // and we're on a diffuclty level where we can't attack until AFTER someone
   // has attacked us, or until we've reached age 4.  
   
   
   if (kbGetAge() >= cAge4)
   {
      if ( (gDelayAttacks == true) && (aiGetWorldDifficulty() >= cDifficultyEasy) )
      {
         aiEcho(" ");
         aiEcho("    OK, THE GLOVES COME OFF NOW!");
         aiEcho(" ");
         gDelayAttacks = false;
      }
      xsDisableSelf();
      return;
   }
   
   // See if we're under attack.
   if (gDefenseReflexBaseID == kbBaseGetMainID(cMyID))
   {  // Main base is under attack
      if ( (gDelayAttacks == true) && (aiGetWorldDifficulty() >= cDifficultyEasy) )
      {
         aiEcho(" ");
         aiEcho("    OK, THE GLOVES COME OFF NOW!");
         aiEcho(" ");
         gDelayAttacks = false;
      }
      xsDisableSelf();  // If sandbox, just turn off.
   }   
}



//==============================================================================
// exploreMonitor
/*
   Used to correctly implement changes in cvOkToExplore.
   If it's off, make sure the explore plan is killed.
   If it's on, make sure the explore plan is active.

   Initially, the explore plan gets an explorer plus 5/15/20 military units,
   so that it can effectively gather nuggets.  We switch out of this mode 3 minutes
   after reaching age 2, unless the explore plan is in nugget gathering mode.
*/
//==============================================================================
rule exploreMonitor
inactive 
minInterval 10
{
   //return;
   const int   cExploreModeStart = 0;     // Initial setting, when first starting out
   const int   cExploreModeNugget = 1;    // Explore and gather nuggets.  Heavy staffing, OK to recruit more units.
   const int   cExploreModeStaff = 2;     // Restaffing the plan, active for 10 seconds to let the plan grab 1 more unit.
   const int   cExploreModeExplore = 3;   // Normal...explore until this unit dies, check again in 5 minutes.
   
   static int  exploreMode = cExploreModeStart;
   static int  age2Time = -1;
   static int  nextStaffTime = -1;        // Prevent the explore plan from constantly sucking in units.
   
   if(kbGetCiv() == cCivIndians && xsGetTime() < 720000)
      return;
   
   if ( (age2Time < 0) && (kbGetAge() >= cAge2) )
      age2Time = xsGetTime();

   // Check for a failed plan
   if ( (gLandExplorePlan >= 0) && (aiPlanGetState(gLandExplorePlan) < 0) )
   {
      // Somehow, the plan has died.  Reset it to start up again if allowed.
      gLandExplorePlan = -1;
      exploreMode = cExploreModeStart;
      nextStaffTime = -1;
   }
   
   // First, check the control variable and react appropriately
   
   if ( cvOkToExplore == true )
   {
      if (aiPlanGetActive(gLandExplorePlan) == false)
         if (gLandExplorePlan >= 0)
            aiPlanSetActive(gLandExplorePlan);     // Reactivate if we were shut off
      switch(exploreMode)
      {
         case cExploreModeStart:
         {
            if (aiPlanGetState(gLandExplorePlan) < 0)
            {  // Need to create it.
			   gLandExplorePlan=aiPlanCreate("Land Explore", cPlanExplore);
               aiPlanSetDesiredPriority(gLandExplorePlan, 75);
			   if (cvOkToGatherNuggets == true)
               {
				  aiPlanAddUnitType(gLandExplorePlan, cUnitTypeExplorer, 1, 1, 1);
				  if(kbGetCiv() == cCivXPIroquois || kbGetCiv() == cCivJapanese)
				     aiPlanAddUnitType(gLandExplorePlan, cUnitTypeAbstractCavalry, 1, 1, 1);
                  else if(kbGetCiv() == cCivXPAztec)
				     aiPlanAddUnitType(gLandExplorePlan, cUnitTypexpCoyoteMan, 1, 1, 1);
				  else
				     aiPlanAddUnitType(gLandExplorePlan, cUnitTypeLogicalTypeScout, 1, 1, 2);
				  aiPlanSetVariableBool(gLandExplorePlan, cExplorePlanOkToGatherNuggets, 0, true);
                  exploreMode = cExploreModeNugget;
               }
               else
               {
				  aiPlanAddUnitType(gLandExplorePlan, cUnitTypeLogicalTypeScout, 1, 1, 1);
				  aiPlanAddUnitType(gLandExplorePlan, cUnitTypeExplorer, 0, 0, 0);
                  aiPlanSetVariableBool(gLandExplorePlan, cExplorePlanOkToGatherNuggets, 0, false);
                  exploreMode = cExploreModeStaff;
                  nextStaffTime = xsGetTime() + 120000;     // Two minutes from now, let it get another soldier if it loses this one.
                  if (gExplorerControlPlan < 0)
                  {
                     gExplorerControlPlan = aiPlanCreate("Explorer control plan", cPlanDefend);
                     aiPlanAddUnitType(gExplorerControlPlan, cUnitTypeExplorer, 1, 1, 1);    // One explorer
                     aiPlanSetVariableVector(gExplorerControlPlan, cDefendPlanDefendPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID)));
                     aiPlanSetVariableFloat(gExplorerControlPlan, cDefendPlanEngageRange, 0, 20.0);    // Tight
                     aiPlanSetVariableBool(gExplorerControlPlan, cDefendPlanPatrol, 0, false);
                     aiPlanSetVariableFloat(gExplorerControlPlan, cDefendPlanGatherDistance, 0, 20.0);
                     aiPlanSetInitialPosition(gExplorerControlPlan, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
                     aiPlanSetUnitStance(gExplorerControlPlan, cUnitStanceDefensive);
                     aiPlanSetVariableInt(gExplorerControlPlan, cDefendPlanRefreshFrequency, 0, 30);
                     aiPlanSetVariableInt(gExplorerControlPlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
                     aiPlanSetDesiredPriority(gExplorerControlPlan, 90);    // Quite high, don't suck him into routine attack plans, etc.
                     aiPlanSetActive(gExplorerControlPlan);      
                  }     
               }
               //aiPlanSetUnitStance(gLandExplorePlan, cUnitStancePassive);
			   aiPlanSetEscrowID(gLandExplorePlan, cEconomyEscrowID);
               //aiPlanSetBaseID(gLandExplorePlan, kbBaseGetMainID(cMyID));
               aiPlanSetVariableBool(gLandExplorePlan, cExplorePlanDoLoops, 0, true);
               aiPlanSetVariableInt(gLandExplorePlan, cExplorePlanNumberOfLoops, 0, 1);
               aiPlanSetActive(gLandExplorePlan); 
            }
            else
            {
               exploreMode = cExploreModeNugget;
            }
            break;
         }
         case cExploreModeNugget:
         {  
            // Check to see if we're out of time, and switch to single-unit exploring if we are.
            if (age2Time >= 0)
            {
               if ( ((xsGetTime() - age2Time) > 180000) && (aiPlanGetState(gLandExplorePlan) != cPlanStateClaimNugget) )  // we've been in age 2 > 3 minutes
               {  // Switch to a normal explore plan, create explorer control plan
                  if (gExplorerControlPlan < 0)
                  {
                     gExplorerControlPlan = aiPlanCreate("Explorer control plan", cPlanDefend);
                     aiPlanAddUnitType(gExplorerControlPlan, cUnitTypeExplorer, 1, 1, 1);    // One explorer
                     aiPlanSetVariableVector(gExplorerControlPlan, cDefendPlanDefendPoint, 0, kbBaseGetMilitaryGatherPoint(cMyID, kbBaseGetMainID(cMyID)));
                     aiPlanSetVariableFloat(gExplorerControlPlan, cDefendPlanEngageRange, 0, 20.0);    // Tight
                     aiPlanSetVariableBool(gExplorerControlPlan, cDefendPlanPatrol, 0, false);
                     aiPlanSetVariableFloat(gExplorerControlPlan, cDefendPlanGatherDistance, 0, 20.0);
                     aiPlanSetInitialPosition(gExplorerControlPlan, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
                     aiPlanSetUnitStance(gExplorerControlPlan, cUnitStanceDefensive);
                     aiPlanSetVariableInt(gExplorerControlPlan, cDefendPlanRefreshFrequency, 0, 30);
                     aiPlanSetVariableInt(gExplorerControlPlan, cDefendPlanAttackTypeID, 0, cUnitTypeUnit); // Only units
                     aiPlanSetDesiredPriority(gExplorerControlPlan, 90);    // Quite high, don't suck him into routine attack plans, etc.
                     aiPlanSetActive(gExplorerControlPlan);      
                  }                     
                  
                  aiPlanAddUnitType(gLandExplorePlan, cUnitTypeExplorer, 0, 0, 0);
				  if(kbGetCiv() == cCivXPIroquois || kbGetCiv() == cCivJapanese)
				     aiPlanAddUnitType(gLandExplorePlan, cUnitTypeAbstractCavalry, 1, 1, 1);
                  else if(kbGetCiv() == cCivXPAztec)
				     aiPlanAddUnitType(gLandExplorePlan, cUnitTypexpCoyoteMan, 1, 1, 1);
				  else
                     aiPlanAddUnitType(gLandExplorePlan, cUnitTypeLogicalTypeScout, 1, 1, 1);
				  aiPlanSetNoMoreUnits(gLandExplorePlan, false);
                  aiPlanSetVariableInt(gLandExplorePlan, cExplorePlanNumberOfLoops, 0, 0);
                  aiPlanSetVariableBool(gLandExplorePlan, cExplorePlanDoLoops, 0, false);
                  exploreMode = cExploreModeStaff;
                  nextStaffTime = xsGetTime() + 120000;     // Two minutes from now, let it get another soldier.
                  aiEcho("Allowing the explore plan to grab a unit.");
               }
            }
            if (cvOkToGatherNuggets == false)
            {
               aiPlanAddUnitType(gLandExplorePlan, cUnitTypeExplorer, 0, 0, 0);
			   aiPlanAddUnitType(gLandExplorePlan, cUnitTypeLogicalTypeScout, 1, 1, 1);
               aiPlanSetNoMoreUnits(gLandExplorePlan, false);
               aiPlanSetVariableInt(gLandExplorePlan, cExplorePlanNumberOfLoops, 0, 0);
               aiPlanSetVariableBool(gLandExplorePlan, cExplorePlanDoLoops, 0, false);
               exploreMode = cExploreModeStaff;
               nextStaffTime = xsGetTime() + 120000;     // Two minutes from now, let it get another soldier.
               aiEcho("Allowing the explore plan to grab a unit.");               
            }
            break;
         }
         case cExploreModeStaff:
         {
            // We've been staffing for 10 seconds, set no more units to true
            aiPlanSetNoMoreUnits(gLandExplorePlan, true);
            exploreMode = cExploreModeExplore;
            aiEcho("Setting the explore plan to 'noMoreUnits'");
            break;
         }
         case cExploreModeExplore:
         {  // See if we're allowed to add another unit
            if (xsGetTime() > nextStaffTime)
            {
               aiPlanSetNoMoreUnits(gLandExplorePlan, false);     // Let it grab a unit
               aiEcho("Setting the explore plan to grab a unit if needed.");
               nextStaffTime = xsGetTime() + 120000;
               exploreMode = cExploreModeStaff;
            }
            break;
         }
      }
   }
   else // cvOkToExplore = false
   {
      aiPlanSetActive(gLandExplorePlan, false);
   }
}

rule randomWalk
inactive
minInterval 10
{
   
   static int activePlan = -1;
   static int def = -1;
   static int times = -1;
   static int rst = 0;
   static int jpBuildPlanID = -1;
   vector v = aiRandLocation();
   
   int tcQuery = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateABQ, v, 50.0);
   if(tcQuery >= 0)
      v = aiRandLocation();
   
   if(cMyCiv == cCivIndians && xsGetTime() > 720000)
   {
      if (activePlan != -1)
	     aiPlanDestroy(activePlan);
	  
	  xsEnableRule("exploreMonitor");
	  xsDisableSelf();
	  return;
   }// xsGetTime() > 360000
   else if(kbGetAge() > cAge1 || aiGetWorldDifficulty() < cDifficultyHard || cMyCiv == cCivGermans || cMyCiv == cCivFrench)
   {
      if (jpBuildPlanID != -1)
	  {
	     if (xsGetTime() < 120000)
		    return;
		 aiPlanDestroy(jpBuildPlanID);
	  }
	  if (activePlan != -1)
	     aiPlanDestroy(activePlan);
	  
	  if(cMyCiv == cCivGermans || cMyCiv == cCivBritish || cMyCiv == cCivOttomans || cMyCiv == cCivRussians || cMyCiv == cCivPortuguese)
	     xsEnableRule("ringWalk"); 
	  else
	     xsEnableRule("exploreMonitor"); 
	  xsDisableSelf();
	  return;
   }
   times = times + 1;
   
   if(def == -1)
   {
	  vector myBaseLocation=kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)); // Main base location...need to find reflection.
	  vector centerOffset = kbGetMapCenter() - myBaseLocation;
      v = kbGetMapCenter() + centerOffset;
	  if (cMyCiv == cCivJapanese)
	     def = cUnitTypeypMonkJapanese2;
	  else if (cMyCiv == cCivChinese)
	     def = cUnitTypeypMonkChinese;
	  else if (cMyCiv == cCivIndians)
	     def = cUnitTypeypMonkIndian;
	  else if (cMyCiv == cCivXPAztec)
	     def = cUnitTypexpAztecWarchief;
	  else if (cMyCiv == cCivXPIroquois)
	     def = cUnitTypexpIroquoisWarChief;
	  else if (cMyCiv == cCivXPSioux)
	     def = cUnitTypexpLakotaWarchief;
	  else
	     def = cUnitTypeExplorer;
		 
   }
   
   if(gFbVec == cInvalidVector)
   {
	  if(times == 2 && kbGetCiv() != cCivJapanese)
	     gFbVec = kbUnitGetPosition(getUnit(def));
	  else if(getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateABQ, kbUnitGetPosition(getUnit(def)), 120.0) < 0)
	     gFbVec = kbUnitGetPosition(getUnit(def));
   }
   
   if(gFbVec != cInvalidVector && kbGetCiv() == cCivJapanese && kbResourceGet(cResourceWood) > 125)
   {
	  if (activePlan != -1)
	  {
	     aiPlanDestroy(activePlan);
		 activePlan = -1;
	  }
	  
	  if (jpBuildPlanID >= 0)
      {
		if (aiPlanGetState(jpBuildPlanID) >= 0)
        {
           return;  
        }
        else 
        {
           aiPlanDestroy(jpBuildPlanID);
           jpBuildPlanID = -1;
        }
      }
	  else
	     jpBuildPlanID = jpHouseTry();
   
      return;
   }
   
   if(rst > 0){
      rst = rst - 1;
	  if(kbGetCiv() != cCivXPSioux)
	     return;
   }
   if (activePlan != -1)   // We already have something active?
   {
	  aiPlanDestroy(activePlan);
	  activePlan = -1;
   }
   
      activePlan = aiPlanCreate("random walk", cPlanMove);
      aiPlanSetDesiredPriority(activePlan, 85);
	  aiPlanAddUnitType(activePlan, def, 1, 1, 1);
	  aiPlanAddWaypoint(activePlan, v);
      aiPlanSetUnitStance(activePlan, cUnitStanceDefensive);
	  aiPlanSetActive(activePlan); 
	  
	  if(distance(v,kbUnitGetPosition(getUnit(def))) > 400)
         rst = 5;
	  else if(distance(v,kbUnitGetPosition(getUnit(def))) > 320)
         rst = 4;
	  else if(distance(v,kbUnitGetPosition(getUnit(def))) > 240)
         rst = 3;
	  else if(distance(v,kbUnitGetPosition(getUnit(def))) > 160)
         rst = 2;
	  else if(distance(v,kbUnitGetPosition(getUnit(def))) > 80)
         rst = 1;
}

rule ringWalk
inactive
minInterval 3
{
   
   if(cMyCiv == cCivXPSioux)
   {
      xsEnableRule("randomWalk");
	  xsDisableSelf();
	  return;
   }
   
   static int activePlan = -1;
   static int def = -1;
   static int timeout = -1;
   static int times = 0;
   static int approach = 0;
   static int start = 0;
   static int flag = 0;
   
   vector testVec = cInvalidVector;

   float spacingDistance = distance(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)),kbGetMapCenter());
   //float spacingDistance = 30.0;
   
   float dx = spacingDistance;
   float dz = spacingDistance;
   
   if (def == -1)
   {
	  if (cMyCiv == cCivJapanese)
	     def = cUnitTypeypMonkJapanese;
	  else if (cMyCiv == cCivChinese)
	     def = cUnitTypeypMonkDisciple;
	  else if (cMyCiv == cCivIndians)
	     def = cUnitTypeypMonkIndian2;
	  else if (cMyCiv == cCivSpanish)
	     def = cUnitTypeWarDog;
	  else if (cMyCiv == cCivXPAztec)
	     def = cUnitTypexpAztecWarchief;
	  else if (cMyCiv == cCivXPIroquois)
	     def = cUnitTypexpIroquoisWarChief;
	  else if (cMyCiv == cCivXPSioux)
	     def = cUnitTypexpLakotaWarchief;
	  else
	     def = cUnitTypeExplorer;
	  
	  vector testVec2 = cInvalidVector;
	  //testVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
	  testVec = kbGetMapCenter();
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) - 0.7*dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) + 0.7*dz);
	  float d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec));
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) + dz);
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 1;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) + 0.7*dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) + 0.7*dz);
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 2;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) + dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec));
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 3;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) + 0.7*dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) - 0.7*dz);
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 4;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec));
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) - dz);
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 5;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) - 0.7*dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec) - 0.7*dz);
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 6;
	  }
	  
	  testVec2 = xsVectorSetX(testVec2, xsVectorGetX(testVec) - dx);
	  testVec2 = xsVectorSetZ(testVec2, xsVectorGetZ(testVec));
	  if(distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) < d)
	  {
	     d = distance(testVec2,kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
		 start = 7;
	  }
   }
   
   testVec = kbGetMapCenter();
   //testVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   if((times+start)%8 == 0)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) - 0.7*dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) + 0.7*dz);
   }
   else if((times+start)%8 == 1)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec));
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) + dz);
   }
   else if((times+start)%8 == 2)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) + 0.7*dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) + 0.7*dz);
   }
   else if((times+start)%8 == 3)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) + dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec));
   }
   else if((times+start)%8 == 4)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) + 0.7*dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) - 0.7*dz);
   }
   else if((times+start)%8 == 5)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec));
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) - dz);
   }
   else if((times+start)%8 == 6)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) - 0.7*dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) - 0.7*dz);
   }
   else if((times+start)%8 == 7)
   {
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) - dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec));
   }
   
   if (activePlan != -1 && approach == 1)   // We already have something active?
   {
      aiPlanDestroy(activePlan);
	  activePlan = -1;
	  //sendChatToAllies("2");
   }
   if(activePlan == -1)
   {
	  activePlan = aiPlanCreate("ring walk", cPlanMove);
      aiPlanSetDesiredPriority(activePlan, 87);
	  aiPlanAddUnitType(activePlan, def, 1, 1, 1);
	  aiPlanAddWaypoint(activePlan, testVec);
      aiPlanSetUnitStance(activePlan, cUnitStanceDefensive);
	  aiPlanSetActive(activePlan);
	  timeout = xsGetTime();
   }
   if(flag == 1)
   {
      timeout = timeout + 15000;
	  flag = 0;
   }

   if(kbLocationVisible(testVec) == true)
   {
      approach = 1;
	  times = times + 1;
   }
   else if((xsGetTime() - timeout) > 35000)
   {
      approach = 1;
	  times = times + 1;
	  flag = 1;
   }
   else
      approach = 0;
   
   if(times == 8)
	{
	   xsDisableSelf();
	   if (activePlan != -1)
	      aiPlanDestroy(activePlan);
	   if(xsIsRuleEnabled("exploreMonitor") == false && xsIsRuleEnabled("randomWalk") == false)
	   //if(kbGetCiv() == cCivXPIroquois)
	      xsEnableRule("exploreMonitor"); 
	   return;
	}
   
}


//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// Opportunities and Missions
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================



void missionStartHandler(int missionID = -1)
{  // Track times for mission starts, so we can tell how long its been since
   // we had a mission of a given type.
   if (missionID < 0)
      return;
   
   int oppID = aiPlanGetVariableInt(missionID, cMissionPlanOpportunityID, 0);
   int oppType = aiGetOpportunityType(oppID);
   
   aiPlanSetVariableInt(missionID, cMissionPlanStartTime, 0, xsGetTime()); // Set the start time in ms.
   
   switch(oppType)
   {
      case cOpportunityTypeDestroy:
      {
         gLastAttackMissionTime = xsGetTime();
         aiEcho("-------- ATTACK MISSION ACTIVATION: Mission "+missionID+", Opp "+oppID);
         break;
      }
      case cOpportunityTypeDefend:
      {
         gLastDefendMissionTime = xsGetTime();
         aiEcho("-------- DEFEND MISSION ACTIVATION: Mission "+missionID+", Opp "+oppID);
         break;
      }
      case cOpportunityTypeClaim:
      {
         gLastClaimMissionTime = xsGetTime();
         aiEcho("-------- CLAIM MISSION ACTIVATION: Mission "+missionID+", Opp "+oppID);
         break;
      }
      default:
      {
         aiEcho("-------- UNKNOWN MISSION ACTIVATION: Mission "+missionID+", Opp "+oppID);
         break;
      }
   }
}


void missionEndHandler(int missionID = -1)
{
   aiEcho("-------- MISSION TERMINATION:  Mission "+missionID+", Opp "+aiGetOpportunityType(aiPlanGetVariableInt(missionID, cMissionPlanOpportunityID, 0)));
}


// Get a class rating, 0.0 to 1.0, for this type of opportunity.
// Scores zero when an opportunity of this type was just launched.
// Scores 1.0 when it has been 'gXXXMissionInterval' time since the last one.
float getClassRating(int oppType = -1, int target = -1)
{
   float retVal = 1.0;
   float timeElapsed = 0.0;
   int targetType = -1;
   
   switch(oppType)
   {
      case cOpportunityTypeDestroy:
      {
         timeElapsed = xsGetTime() - gLastAttackMissionTime;
         retVal = 1.0 * (timeElapsed / gAttackMissionInterval);
         break;
      }
      case cOpportunityTypeDefend:
      {
         timeElapsed = xsGetTime() - gLastDefendMissionTime;
         retVal = 1.0 * (timeElapsed / gDefendMissionInterval);
         break;
      }
      case cOpportunityTypeClaim:
      {
         timeElapsed = xsGetTime() - gLastClaimMissionTime;
         if (kbVPSiteGetType(target) == cVPTrade)
         {
            if ( btBiasTrade > 0.0)
               timeElapsed = timeElapsed * (1.0 + btBiasTrade);   // Multiply by at least one, up to 2, i.e. btBiasTrade of 1.0 will double elapsed time.
            else
               timeElapsed = timeElapsed / ((-1.0 * btBiasTrade) + 1.0);  // Divide by 1.00 up to 2.00, i.e. cut it in half if btBiasTrade = -1.0
            retVal = 1.0 * (timeElapsed / gClaimMissionInterval);
         }
         else  // VPNative
         {
            if ( btBiasNative > 0.0)
               timeElapsed = timeElapsed * (1.0 + btBiasNative);   // Multiply by at least one, up to 2, i.e. btBiasNative of 1.0 will double elapsed time.
            else
               timeElapsed = timeElapsed / ((-1.0 * btBiasNative) + 1.0);  // Divide by 1.00 up to 2.00, i.e. cut it in half if btBiasNative = -1.0
            retVal = 1.0 * (timeElapsed / gClaimMissionInterval);
         }
         break;
      }
   }
   if (retVal > 1.0)
      retVal = 1.0;
   if (retVal < 0.0)
      retVal = 0.0;
   return(retVal);
}


// Calculate an approximate rating for enemy strength in/near this base.
float getBaseEnemyStrength(int baseID = -1)
{
   
   float retVal = 0.0;
   int owner = kbBaseGetOwner(baseID);
   static int allyBaseQuery = -1;
  
   if (allyBaseQuery < 0)
   {
      allyBaseQuery = kbUnitQueryCreate("Ally Base query");
      kbUnitQuerySetIgnoreKnockedOutUnits(allyBaseQuery, true);
      kbUnitQuerySetPlayerRelation(allyBaseQuery, cPlayerRelationEnemyNotGaia);
      kbUnitQuerySetState(allyBaseQuery, cUnitStateABQ);
      kbUnitQuerySetUnitType(allyBaseQuery, cUnitTypeLogicalTypeLandMilitary);
   }

   
   if (baseID < 0)
      return(-1.0);
   
   if (owner <= 0)
      return(-1.0);
   
   if (kbIsPlayerEnemy(owner) == true)  
   {  // Enemy base, add up military factors normally
      retVal = retVal + (5.0 * kbBaseGetNumberUnits(owner, baseID, cPlayerRelationEnemyNotGaia, cUnitTypeTownCenter));  // 5 points per TC
      retVal = retVal + (10.0 * kbBaseGetNumberUnits(owner, baseID, cPlayerRelationEnemy, cUnitTypeFortFrontier));  // 10 points per fort
      retVal = retVal + kbBaseGetNumberUnits(owner, baseID, cPlayerRelationEnemyNotGaia, cUnitTypeLogicalTypeLandMilitary); // 1 point per soldier
      retVal = retVal + (3.0 * kbBaseGetNumberUnits(owner, baseID, cPlayerRelationEnemyNotGaia, cUnitTypeOutpost));  // 3 points per outpost
   }
   else
   {  // Ally base, we're considering defending.  Count enemy units present
      kbUnitQuerySetUnitType(allyBaseQuery, cUnitTypeLogicalTypeLandMilitary);
      kbUnitQuerySetPosition(allyBaseQuery, kbBaseGetLocation(owner, baseID));
      kbUnitQuerySetMaximumDistance(allyBaseQuery, 50.0);
      kbUnitQueryResetResults(allyBaseQuery);
      retVal = kbUnitQueryExecute(allyBaseQuery);
   }
   if (retVal < 1.0)
      retVal = 1.0;  // Return at least 1.
   return(retVal);
}


// Calculate an approximate strength rating for the enemy units/buildings near this point.
float getPointEnemyStrength(vector loc = cInvalidVector)
{
   float retVal = 0.0;
   static int enemyPointQuery = -1;
  
   if (enemyPointQuery < 0)
   {
      enemyPointQuery = kbUnitQueryCreate("Enemy Point query");
      kbUnitQuerySetIgnoreKnockedOutUnits(enemyPointQuery, true);
      kbUnitQuerySetPlayerRelation(enemyPointQuery, cPlayerRelationEnemyNotGaia);
      kbUnitQuerySetState(enemyPointQuery, cUnitStateABQ);
      kbUnitQuerySetUnitType(enemyPointQuery, cUnitTypeLogicalTypeLandMilitary);
   }

   kbUnitQuerySetUnitType(enemyPointQuery, cUnitTypeLogicalTypeLandMilitary);
   kbUnitQuerySetPosition(enemyPointQuery, loc);
   kbUnitQuerySetMaximumDistance(enemyPointQuery, 50.0);
   kbUnitQueryResetResults(enemyPointQuery);
   retVal = kbUnitQueryExecute(enemyPointQuery);

   kbUnitQuerySetUnitType(enemyPointQuery, cUnitTypeFortFrontier);
   kbUnitQueryResetResults(enemyPointQuery);
   retVal = retVal + 10.0 * kbUnitQueryExecute(enemyPointQuery);  // Each fort counts as 10 units
   
   kbUnitQuerySetUnitType(enemyPointQuery, cUnitTypeTownCenter);
   kbUnitQueryResetResults(enemyPointQuery);
   retVal = retVal + 5.0 * kbUnitQueryExecute(enemyPointQuery);  // Each TC counts as 5 units
   
   kbUnitQuerySetUnitType(enemyPointQuery, cUnitTypeOutpost);
   kbUnitQueryResetResults(enemyPointQuery);
   retVal = retVal + 3.0 * kbUnitQueryExecute(enemyPointQuery);  // Each tower counts as 3 units 
     
   if (retVal < 1.0)
      retVal = 1.0;  // Return at least 1.
   return(retVal);
}

// Calculate an approximate strength rating for the allied units/buildings near this point.
float getPointAllyStrength(vector loc = cInvalidVector)
{
   float retVal = 0.0;
   static int allyPointQuery = -1;
  
   if (allyPointQuery < 0)
   {
      allyPointQuery = kbUnitQueryCreate("Ally Point query 2");
      kbUnitQuerySetIgnoreKnockedOutUnits(allyPointQuery, true);
      kbUnitQuerySetPlayerRelation(allyPointQuery, cPlayerRelationAlly);
      kbUnitQuerySetState(allyPointQuery, cUnitStateABQ);
      kbUnitQuerySetUnitType(allyPointQuery, cUnitTypeLogicalTypeLandMilitary);
   }
   
   kbUnitQuerySetUnitType(allyPointQuery, cUnitTypeLogicalTypeLandMilitary);
   kbUnitQuerySetPosition(allyPointQuery, loc);
   kbUnitQuerySetMaximumDistance(allyPointQuery, 50.0);
   kbUnitQueryResetResults(allyPointQuery);
   retVal = kbUnitQueryExecute(allyPointQuery);

   kbUnitQuerySetUnitType(allyPointQuery, cUnitTypeFortFrontier);
   kbUnitQueryResetResults(allyPointQuery);
   retVal = retVal + 10.0 * kbUnitQueryExecute(allyPointQuery);  // Each fort counts as 10 units

   kbUnitQuerySetUnitType(allyPointQuery, cUnitTypeTownCenter);
   kbUnitQueryResetResults(allyPointQuery);
   retVal = retVal + 5.0 * kbUnitQueryExecute(allyPointQuery);  // Each TC counts as 5 units
   
   kbUnitQuerySetUnitType(allyPointQuery, cUnitTypeOutpost);
   kbUnitQueryResetResults(allyPointQuery);
   retVal = retVal + 3.0 * kbUnitQueryExecute(allyPointQuery);  // Each tower counts as 3 units 
   
   if (retVal < 1.0)
      retVal = 1.0;  // Return at least 1.
   return(retVal);
}



// Calculate an approximate value for this base.
float getBaseValue(int baseID = -1)
{
   float retVal = 0.0;
   int owner = kbBaseGetOwner(baseID);
   int relation = -1;
   
   if (baseID < 0)
      return(-1.0);
   
   if (owner <= 0)
      return(-1.0);
   
   if (kbIsPlayerAlly(owner) == true)
      relation = cPlayerRelationAlly;
   else
      relation = cPlayerRelationEnemyNotGaia;
   
   retVal = retVal + (200.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeLogicalTypeBuildingsNotWalls));
   retVal = retVal + (1000.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeTownCenter));  // 1000 points extra per TC
   retVal = retVal + (600.0 * kbBaseGetNumberUnits(owner, baseID, relation, gPlantationUnit));  // 600 points per plantation
   retVal = retVal + (2000.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeFortFrontier));  // 2000 points per fort
   retVal = retVal + (150.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeLogicalTypeLandMilitary)); // 150 points per soldier
   retVal = retVal + (200.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeSettler));  // 200 points per settler
   retVal = retVal + (200.0 * kbBaseGetNumberUnits(owner, baseID, relation, cUnitTypeTradingPost));  // 1000 points per trading post
   if (retVal < 1.0)
      retVal = 1.0;  // Return at least 1.
   return(retVal);
}


// Calculate an approximate value for the playerRelation units/buildings near this point.
// I.e. if playerRelation is enemy, calculate strength of enemy units and buildings.
float getPointValue(vector loc = cInvalidVector, int relation = cPlayerRelationEnemyNotGaia)
{
   float retVal = 0.0;
   static int allyQuery = -1;
   static int enemyQuery = -1;
   int queryID = -1; // Use either enemy or ally query as needed.
   
   if (allyQuery < 0)
   {
      allyQuery = kbUnitQueryCreate("Ally point value query");
      kbUnitQuerySetIgnoreKnockedOutUnits(allyQuery, true);
      kbUnitQuerySetPlayerRelation(allyQuery, cPlayerRelationAlly);
      kbUnitQuerySetState(allyQuery, cUnitStateABQ);
   }

   if (enemyQuery < 0)
   {
      enemyQuery = kbUnitQueryCreate("Enemy point value query");
      kbUnitQuerySetIgnoreKnockedOutUnits(enemyQuery, true);
      kbUnitQuerySetPlayerRelation(enemyQuery, cPlayerRelationEnemyNotGaia);
      kbUnitQuerySetSeeableOnly(enemyQuery, true);
      kbUnitQuerySetState(enemyQuery, cUnitStateAlive);
   }   
   
   if ( (relation == cPlayerRelationEnemy) || (relation == cPlayerRelationEnemyNotGaia) )
      queryID = enemyQuery;
   else
      queryID = allyQuery;
   
   kbUnitQueryResetResults(queryID);
   kbUnitQuerySetUnitType(queryID, cUnitTypeLogicalTypeBuildingsNotWalls);
   kbUnitQueryResetResults(queryID);
   retVal = 200.0 * kbUnitQueryExecute(queryID);   // 200 points per building
   
   kbUnitQuerySetUnitType(queryID, cUnitTypeTownCenter);
   kbUnitQueryResetResults(queryID);
   retVal = retVal + 1000.0 * kbUnitQueryExecute(queryID);  // Extra 1000 per TC
   
   kbUnitQuerySetUnitType(queryID, gPlantationUnit);
   kbUnitQueryResetResults(queryID);
   retVal = retVal + 1000.0 * kbUnitQueryExecute(queryID);  // Extra 1000 per Plantation
   
   kbUnitQuerySetUnitType(queryID, cUnitTypeSPCXPMiningCamp);
   kbUnitQueryResetResults(queryID);
   retVal = retVal + 1000.0 * kbUnitQueryExecute(queryID);  // Extra 1000 per SPC mining camp for XPack scenario
      
   kbUnitQuerySetUnitType(queryID, cUnitTypeUnit);
   kbUnitQueryResetResults(queryID);
   retVal = retVal + 200.0 * kbUnitQueryExecute(queryID);  // 200 per unit.

   if (retVal < 1.0)
      retVal = 1.0;
      
   return(retVal);
}

//==============================================================================
// Called for each opportunity that needs to be scored.
//==============================================================================
void scoreOpportunity(int oppID = -1)
{
   /*
   
   Sets all the scoring components for the opportunity, and a final score.  The scoring
   components and their meanings are:
   
   int PERMISSION  What level of permission is needed to do this?  
      cOpportunitySourceAutoGenerated is the lowest...go ahead and do it.
      cOpportunitySourceAllyRequest...the AI may not do it on its own, i.e. it may be against the rules for this difficulty.
      cOpportunitySourceTrigger...even ally requests are denied, as when prevented by control variables, but a trigger (gaia request) may do it.
      cOpportunitySourceTrigger+1...not allowed at all.
   
   float AFFORDABLE  Do I have what it takes to do this?  This includes appropriate army sizes, resources to pay for things (like trading posts)
      and required units like explorers.  0.80 indicates a neutral, good-to-go position.  1.0 means overstock, i.e. an army of 20 would be good, 
      and I have 35 units available.  0.5 means extreme shortfall, like the minimum you could possibly imagine.  0.0 means you simply can't do it,
      like no units at all.  Budget issues like amount of wood should never score below 0.5, scores below 0.5 mean deep, profound problems.
   
   int SOURCE  Who asked for this mission?  Uses the cOpportunitySource... constants above.
   
   float CLASS  How much do we want to do this type of mission?   Based on personality, how long it's been since the last mission of this type, etc.
      0.8 is a neutral, "this is a good mission" rating.  1.0 is extremely good, I really, really want to do this next.  0.5 is a poor score.  0.0 means 
      I just flat can't do it.  This class score will creep up over time for most classes, to make sure they get done once in a while.
   
   float INSTANCE  How good is this particular target?  Includes asset value (is it important to attack or defend this?) and distance.  Defense values
      are incorporated in the AFFORDABLE calculation above.  0.0 is no value, this target can't be attacked.  0.8 is a good solid target.  1.0 is a dream target.
   
   float TOTAL  Incorporates AFFORDABLE, CLASS and INSTANCE by multiplying them together, so a zero in any one sets total to zero.  Source is added as an int
      IF AND ONLY IF SOURCE >= PERMISSION.  If SOURCE < PERMISSION, the total is set to -1.  Otherwise, all ally source opportunities will outrank all self generated
      opportunities, and all trigger-generated opportunities will outrank both of those.  Since AFFORDABLE, CLASS and INSTANCE all aim for 0.8 as a good, solid
      par value, a total score of .5 is rougly "pretty good".  A score of 1.0 is nearly impossible and should be quite rare...a high-value target, weakly defended,
      while I have a huge army and the target is close to me and we haven't done one of those for a long, long time.  
   
   Total of 0.0 is an opportunity that should not be serviced.  >0 up to 1 indicates a self-generated opportunity, with 0.5 being decent, 1.0 a dream, and 0.2 kind
   of marginal.  Ally commands are in the range 1.0 to 2.0 (unless illegal), and triggers score 2.0 to 3.0.
   
   */
   	
   // Interim values for the scoring components:
   int   permission = 0; 
   float instance = 0.0;
   float classRating = 0.0;
   float total = 0.0;
   float affordable = 0.0;
	float score = 0.0;
   
   // Info about this opportunity
   int   source = aiGetOpportunitySourceType(oppID);
   if (source < 0) 
      source = cOpportunitySourceAutoGenerated;
   if (source > cOpportunitySourceTrigger)
      source = cOpportunitySourceTrigger;
   int target = aiGetOpportunityTargetID(oppID);
   int targetType = aiGetOpportunityTargetType(oppID);
   int oppType = aiGetOpportunityType(oppID);
   int targetPlayer = aiGetOpportunityTargetPlayerID(oppID);
   vector location = aiGetOpportunityLocation(oppID);
   float radius = aiGetOpportunityRadius(oppID);
   if (radius < 10.0)
      radius = 40.0;
   int baseOwner = -1;
   float baseEnemyPower = 0.0;   // Used to measure troop and building strength.  Units roughly equal to unit count of army.
   float baseAllyPower = 0.0;    // Strength of allied buildings and units, roughly equal to unit count.
   float netEnemyPower = 0.0;    // Basically enemy minus ally, but the ally effect can, at most, cut 80% of enemy strength
   float baseAssets = 0.0;    // Rough estimate of base value, in aiCost.  
   float affordRatio = 0.0;
   bool  errorFound = false;  // Set true if we can't do a good score.  Ends up setting score to -1.

   // Variables for available number of units and plan to kill if any
   float armySizeAuto = 0.0;  // For source cOpportunitySourceAutoGenerated
   float armySizeAlly = 0.0;  // For ally-generated commands, how many units could we scrounge up?
   int missionToKillAlly = -1;   // Mission to cancel in order to provide the armySizeAlly number of units.  
   float armySizeTrigger = 0.0;  // For trigger-generated commands, how many units could we scrounge up?
   int missionToKillTrigger = -1;   // Mission to cancel in order to provide the armySizeTrigger number of units.
   float armySize = 0.0;      // The actual army size we'll use for calcs, depending on how big the target is.
   float missionToKill = -1;  // The actual mission to kill based on the army size we've selected.
   
   float oppDistance = 0.0;      // Distance to target location or base.
   bool  sameAreaGroup = true;   // Set false if opp is on another areagroup.
   
   bool defendingMonopoly = false;
   bool attackingMonopoly = false;
   int  tradePostID = -1;     // Set to trade post ID if this is a base target, and a trade post is nearby.
   
   bool defendingKOTH = false;
   bool attackingKOTH = false;
   int  KOTHID = -1;     // Set to the hill ID if this is a base target, and the hill is nearby.
   
   if (gIsMonopolyRunning == true)
   {
      if (gMonopolyTeam == kbGetPlayerTeam(cMyID))
         defendingMonopoly = true;  // We're defending, let's not go launching any attacks
      else
         attackingMonopoly = true;  // We're attacking, focus on trade posts
   }
   
   if (gIsKOTHRunning == true)
   {
      if (gKOTHTeam == kbGetPlayerTeam(cMyID))
         defendingKOTH = true;  // We're defending, let's not go launching any attacks
      else
         attackingKOTH = true;  // We're attacking, focus on the hill
   }

   //-- get the number of units in our reserve.
	armySizeAuto = aiPlanGetNumberUnits(gLandReservePlan, cUnitTypeLogicalTypeLandMilitary);
   armySizeAlly = armySizeAuto;
   armySizeTrigger = armySizeAlly;
   
//   aiEcho(" ");
//   aiEcho("Scoring opportunity "+oppID+", targetID "+target+", location "+location);
   
   // Get target info
   switch(targetType)
   {
      case cOpportunityTargetTypeBase:
      {
         location = kbBaseGetLocation(kbBaseGetOwner(target),target);
         tradePostID = getUnitByLocation(cUnitTypeTradingPost, kbBaseGetOwner(target), cUnitStateAlive, location, 40.0);   
         KOTHID = getUnitByLocation(cUnitTypeypKingsHill, kbBaseGetOwner(target), cUnitStateAlive);//, location, 40.0);   
         radius = 50.0;
         baseOwner = kbBaseGetOwner(target);
         baseEnemyPower = getBaseEnemyStrength(target);  // Calculate "defenses" as enemy units present
         baseAllyPower = getPointAllyStrength(kbBaseGetLocation(kbBaseGetOwner(target),target));
         if ( (baseEnemyPower*0.8) > baseAllyPower)   
            netEnemyPower = baseEnemyPower - baseAllyPower;   // Ally power is less than 80% of enemy
         else
            netEnemyPower = baseEnemyPower * 0.2;  // Ally power is more then 80%, but leave a token enemy rating anyway.
            
         baseAssets = getBaseValue(target);  //  Rough value of target
         if ( (gIsMonopolyRunning == true) && (tradePostID >= 0) )
            baseAssets = baseAssets + 10000; // Huge bump if this is a trade post (enemy or ally) and a monopoly is running  
         if ( (gIsKOTHRunning == true) && (KOTHID >= 0) )
            baseAssets = baseAssets + 10000; // Huge bump if this is the hill (enemy or ally) and a timer is running             
         break;
      }
      case cOpportunityTargetTypePointRadius:
      {
         baseEnemyPower = getPointEnemyStrength(location);
         baseAllyPower = getPointAllyStrength(location);
         if ( (baseEnemyPower*0.8) > baseAllyPower)   
            netEnemyPower = baseEnemyPower - baseAllyPower;   // Ally power is less than 80% of enemy
         else
            netEnemyPower = baseEnemyPower * 0.2;  // Ally power is more then 80%, but leave a token enemy rating anyway.
            
         baseAssets = getPointValue(location);  //  Rough value of target
         break;
      }
      case cOpportunityTargetTypeVPSite:     // This is only for CLAIM missions.  A VP site that is owned will be a 
                                             // defend or destroy opportunity.
      {
         location = kbVPSiteGetLocation(target);
         radius = 50.0;
         
         baseEnemyPower = getPointEnemyStrength(location);
         baseAllyPower = getPointAllyStrength(location);
         if ( (baseEnemyPower*0.8) > baseAllyPower)   
            netEnemyPower = baseEnemyPower - baseAllyPower;   // Ally power is less than 80% of enemy
         else
            netEnemyPower = baseEnemyPower * 0.2;  // Ally power is more then 80%, but leave a token enemy rating anyway.
        
         baseAssets = 1000.0;    // Arbitrary...consider a claimable VP Site as worth 1000 resources.
         break;
      }
   }
   
   if (netEnemyPower < 1.0)
      netEnemyPower = 1.0;   // Avoid div 0
   
   oppDistance = distance(location, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
   if (oppDistance <= 0.0)
      oppDistance = 1.0;
   if ( kbAreaGroupGetIDByPosition(location) != kbAreaGroupGetIDByPosition(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) )
      sameAreaGroup = false;
   
   
   // Figure which armySize to use.  This currently is a placeholder, we may not need to mess with it.
   armySize = armySizeAuto;   // Default

//   aiEcho("    EnemyPower "+baseEnemyPower+", AllyPower "+baseAllyPower+", NetEnemyPower "+netEnemyPower);
//   aiEcho("    BaseAssets "+baseAssets+", myArmySize "+armySize);
   
   switch(oppType)
   {
      case cOpportunityTypeDestroy:
      {
         // Check permissions required.
         if(cvOkToAttack == false)
            permission = cOpportunitySourceTrigger;   // Only triggers can make us attack.
         
         if (gDelayAttacks == true)
            permission = cOpportunitySourceTrigger;   // Only triggers can override this difficulty setting.
         
         // Check affordability
         
         if (netEnemyPower < 0.0)
         {
            errorFound = true;
            affordable = 0.0;
         }
         else
         {
            // Set affordability.  Roughly armySize / baseEnemyPower, but broken into ranges.
            // 0.0 is no-can-do, i.e. no troops.  0.8 is "good", i.e. armySize is double baseEnemyPower.  
            // Above a 2.0 ratio, to 5.0, scale this into the 0.8 to 1.0 range.
            // Above 5.0, score it 1.0
            affordRatio = armySize / netEnemyPower;
            if (affordRatio < 2.0)
               affordable = affordRatio / 2.5;  // 0 -> 0.0,  2.0 -> 0.8
            else
               affordable = 0.8 + ((affordRatio - 2.0) / 15.0); // 2.0 -> 0.8 and 5.0 -> 1.0
            if (affordable > 1.0)
               affordable = 1.0;
         }  // Affordability is done
            
         // Check target value, calculate INSTANCE score.
         if (baseAssets < 0.0)
         {
            errorFound = true;
         }
         // Clip base value to range of 100 to 10K for scoring
         if (baseAssets < 100.0)
            baseAssets = 100.0;
         if (baseAssets > 10000.0)
            baseAssets = 10000.0;
         // Start with an "instance" score of 0 to .8 for bases under 2K value.
         instance = (0.8 * baseAssets) / 2000.0;
         // Over 2000, adjust so 2K = 0.8, 30K = 1.0
         if (baseAssets > 2000.0)
            instance = 0.8 + ( (0.2 * (baseAssets - 2000.0)) / 8000.0);
         
         // Instance is now 0..1, adjust for distance. If < 100m, leave as is.  Over 100m to 400m, penalize 10% per 100m.
         float penalty = 0.0;
         if (oppDistance > 100.0)
            penalty = (0.1 * (oppDistance - 100.0)) / 100.0;
         if (penalty > 0.6)
            penalty = 0.6;
         instance = instance * (1.0 - penalty); // Apply distance penalty, INSTANCE score is done.
         if (sameAreaGroup = false)
            instance = instance / 2.0;
         if (targetType == cOpportunityTargetTypeBase)
            if (kbHasPlayerLost(baseOwner) == true)
               instance = -1.0;
         // Illegal if it's over water, i.e. a lone dock
         if (kbAreaGetType(kbAreaGetIDByPosition(location)) == cAreaTypeWater)
            instance = -1.0;
         
         // Check for weak target blocks, which means the content designer is telling us that this target needs its instance score bumped up
         int weakBlockCount = 0;
         int strongBlockCount = 0;
         if ( targetType == cOpportunityTargetTypeBase)
         {
            weakBlockCount = getUnitCountByLocation(cUnitTypeAITargetBlockWeak, cMyID, cUnitStateAlive, kbBaseGetLocation(baseOwner, target), 40.0);
            strongBlockCount = getUnitCountByLocation(cUnitTypeAITargetBlockStrong, cMyID, cUnitStateAlive, kbBaseGetLocation(baseOwner, target), 40.0);
         }
         if ( (targetType == cOpportunityTargetTypeBase) && (weakBlockCount > 0) && (instance >= 0.0) )
         {  // We have a valid instance score, and there is at least one weak block in the area.  For each weak block, move the instance score halfway to 1.0.
            while (weakBlockCount > 0)
            {
               instance = instance + ((1.0-instance) / 2.0);   // halfway up to 1.0
               weakBlockCount--;
            }
         }         
         
         classRating = getClassRating(cOpportunityTypeDestroy);   // 0 to 1.0 depending on how long it's been.
         if ( (gIsMonopolyRunning == true) && (tradePostID < 0) ) // Monopoly, and this is not a trade post site
            classRating = 0.0;
         
         //if ( defendingMonopoly == true )
            //classRating = 0.0;      // If defending, don't attack other targets
         
         if ( ( attackingMonopoly == true) && (tradePostID >= 0) )  // We're attacking, and this is an enemy trade post...go get it
            classRating = 1.0;
            
         if ( (gIsKOTHRunning == true) && (KOTHID < 0) ) // KOTH, and this is the hill
            classRating = 0.0;
         
         if ( defendingKOTH == true )
            classRating = 0.0;      // If defending, don't attack other targets
         
         if ( ( attackingKOTH == true) && (KOTHID >= 0) )  // We're attacking, and this is an enemy hill...go get it
            classRating = 1.0;

         if ( (targetType == cOpportunityTargetTypeBase) && (strongBlockCount > 0) && (classRating >= 0.0) )
         {  // We have a valid instance score, and there is at least one strong block in the area.  For each weak block, move the classRating score halfway to 1.0.
            while (strongBlockCount > 0)
            {
               classRating = classRating + ((1.0-classRating) / 2.0);   // halfway up to 1.0
               strongBlockCount--;
            }
         }
         
         if (aiTreatyActive() == true)
            classRating = 0.0;   // Do not attack anything if under treaty
         
         break;
      }
      case cOpportunityTypeClaim:
      {
         // Check permissions required.
         if( (cvOkToClaimTrade == false) && (kbVPSiteGetType(target) == cVPTrade) )
            permission = cOpportunitySourceTrigger;   // Only triggers can let us override this.
         if( (cvOkToAllyNatives == false) && (kbVPSiteGetType(target) == cVPNative) )
            permission = cOpportunitySourceTrigger;   // Only triggers can let us override this.
         if (gDelayAttacks == true)     // Taking trade sites and natives is sort of aggressive, turn it off on easy/sandbox.
            permission = cOpportunitySourceTrigger;   // Only triggers can override this difficulty setting.
         
         // Check affordability.  50-50 weight on military affordability and econ affordability
         float milAfford = 0.0;
         float econAfford = 0.0;
         affordRatio = armySize / netEnemyPower;
            if (affordRatio < 2.0)
               milAfford = affordRatio / 2.5;  // 0 -> 0.0,  2.0 -> 0.8
            else
               milAfford = 0.8 + ((affordRatio - 2.0) / 15.0); // 2.0 -> 0.8 and 5.0 -> 1.0
            if (milAfford > 1.0)
               milAfford = 1.0; 
         affordRatio = (kbEscrowGetAmount(cRootEscrowID, cResourceWood) + kbEscrowGetAmount(cEconomyEscrowID, cResourceWood)) / (1.0 + kbUnitCostPerResource(cUnitTypeTradingPost, cResourceWood));
            if (affordRatio < 1.0)
               econAfford = affordRatio;
            else
               econAfford = 1.0;
            if (econAfford > 1.0)
               econAfford = 1.0;      
            if (econAfford < 0.0)
               econAfford = 0.0;
         affordable = (econAfford + milAfford) / 2.0; // Simple average
         
         // Instance
         instance = 0.8;   // Same for all, unless I prefer to do one type over other (personality)
         penalty = 0.0;
         if (oppDistance > 100.0)
            penalty = (0.1 * (oppDistance - 100.0)) / 100.0;
         if (penalty > 0.6)
            penalty = 0.6;
         instance = instance * (1.0 - penalty); // Apply distance penalty, INSTANCE score is done.         
         if (sameAreaGroup = false)
            instance = instance / 2.0;
         classRating = getClassRating(cOpportunityTypeClaim, target);   // 0 to 1.0 depending on how long it's been.
         break;
      }
      case cOpportunityTypeRaid:
      {
         break;
      }
      case cOpportunityTypeDefend:
      {  
        
         // Check affordability
 
         if (netEnemyPower < 0.0)
         {
            errorFound = true;
            affordable = 0.0;
         }
         else
         {
            // Set affordability.  Roughly armySize / netEnemyPower, but broken into ranges.
            // Very different than attack calculations.  Score high affordability if the ally is really 
            // in trouble, especially if my army is large.  Basically...does he need help?  Can I help?
            if (baseAllyPower < 1.0)
               baseAllyPower = 1.0;
            float enemyRatio = baseEnemyPower / baseAllyPower;
            float enemySurplus = baseEnemyPower - baseAllyPower;
            if (enemyRatio < 0.5)   // Enemy very weak, not a good opp.
            {
               affordRatio = enemyRatio;  // Low score, 0 to .5
               if (enemyRatio < 0.2)
                  affordRatio = 0.0;
            }
            else
               affordRatio = 0.5 + ( (enemyRatio - 0.5) / 5.0);   // ratio 0.5 scores 0.5, ratio 3.0 scores 1.0
            if ( (affordRatio * 10.0) > enemySurplus )
               affordRatio = enemySurplus / 10.0;  // Cap the afford ratio at 1/10 the enemy surplus, i.e. don't respond if he's just outnumbered 6:5 or something trivial.
            if (enemySurplus < 0)
               affordRatio = 0.0;
            if (affordRatio > 1.0)
               affordRatio = 1.0;
            // AffordRatio now represents how badly I'm needed...now, can I make a difference
            if (armySize < enemySurplus)  // I'm gonna get my butt handed to me
               affordRatio = affordRatio * (armySize / enemySurplus);   // If I'm outnumbered 3:1, divide by 3.
            // otherwise, leave it alone.
            
            affordable = affordRatio;
         }  // Affordability is done
            
         // Check target value, calculate INSTANCE score.
         if (baseAssets < 0.0)
         {
            errorFound = true;
         }
         // Clip base value to range of 100 to 30K for scoring
         if (baseAssets < 100.0)
            baseAssets = 100.0;
         if (baseAssets > 30000.0)
            baseAssets = 30000.0;
         // Start with an "instance" score of 0 to .8 for bases under 2K value.
         instance = (0.8 * baseAssets) / 1000.0;
         // Over 1000, adjust so 1K = 0.8, 30K = 1.0
         if (baseAssets > 1000.0)
            instance = 0.8 + ( (0.2 * (baseAssets - 1000.0)) / 29000.0);
         
         // Instance is now 0..1, adjust for distance. If < 200m, leave as is.  Over 200m to 400m, penalize 10% per 100m.
         penalty = 0.0;
         if (oppDistance > 200.0)
            penalty = (0.1 * (oppDistance - 200.0)) / 100.0;
         if (penalty > 0.6)
            penalty = 0.6;
         instance = instance * (1.0 - penalty); // Apply distance penalty, INSTANCE score is done.
         if (sameAreaGroup == false)
            instance = 0.0;
         if (targetType == cOpportunityTargetTypeBase)
            if (kbHasPlayerLost(baseOwner) == true)
               instance = -1.0;
                 
         if ( (defendingMonopoly == true) && (tradePostID >= 0) && (instance > 0.0))
            instance = instance + ((1.0 - instance)/1.2);   // Bump it almost up to 1.0 if we're defending monopoly and this is a trade site.
         if ( (defendingKOTH == true) && (KOTHID >= 0) && (instance > 0.0))
            instance = instance + ((1.0 - instance)/1.2);   // Bump it almost up to 1.0 if we're defending the hill
         classRating = getClassRating(cOpportunityTypeDefend);   // 0 to 1.0 depending on how long it's been.
         if ( (defendingMonopoly == true) && (tradePostID >= 0) ) 
            classRating = 1.0;      // No time delay for 2nd defend mission if we're defending trading posts during monopoly.
         if (attackingMonopoly == true) 
            classRating = 0.0;   // Don't defend anything if we should be attacking a monopoly!
         if ( (defendingKOTH == true) && (KOTHID >= 0) ) 
            classRating = 1.0;      // No time delay for 2nd defend mission if we're defending the hill.
         if (attackingKOTH == true) 
            classRating = 0.0;   // Don't defend anything if we should be attacking the hill!
         break;    
      }
      case cOpportunityTypeRescueExplorer:
      {
         break;
      }
      default:
      {
         aiEcho("ERROR ERROR ERROR ERROR");
         aiEcho("scoreOpportunity() failed on opportunity "+oppID);
         aiEcho("Opportunity Type is "+oppType+" (invalid)");
         break;
      }
   }
   
   score = classRating * instance * affordable;
//   aiEcho("    Class "+classRating+", Instance "+instance+", affordable "+affordable);
//   aiEcho("    Final Score: "+score);
   
   if (score > 1.0)
      score = 1.0;
   if (score < 0.0)
      score = 0.0;
      
   score = score + source; // Add 1 if from ally, 2 if from trigger.
   
   if (permission > source)
      score = -1.0;
   if (errorFound == true)
      score = -1.0;
   if (cvOkToSelectMissions == false)
      score = -1.0;
   aiSetOpportunityScore(oppID, permission, affordable, classRating, instance, score);
}















//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
// Personality and chats
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================
//==============================================================================



rule introChat    // Send a greeting to allies and enemies
inactive
group startup
minInterval 1
{
   xsDisableSelf();
   sendStatement(cPlayerRelationAlly, cAICommPromptToAllyIntro); 
   sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyIntro);
}

rule tcChats
inactive
group tcComplete
minInterval 10
{  // Send chats about enemy TC placement
   static int tcID1 = -1;  // First enemy TC
   static int tcID2 = -1;  // Second
   static int enemy1 = -1; // ID of owner of first enemy TC.
   static int enemy2 = -1; // Second.
   static int secondTCQuery = -1;
   
   if (tcID1 < 0)
   {  // Look for first enemy TC
      tcID1 = getUnit(cUnitTypeTownCenter, cPlayerRelationEnemy, cUnitStateAlive);
      if (tcID1 >= 0)
         enemy1 = kbUnitGetPlayerID(tcID1);
      return;  // Done for now
   }
   
   // If we get here, we already know about one enemy TC.  Now, find the next closest enemy TC.
   if (secondTCQuery < 0)
   {  //init - find all enemy TC's within 200 meters of first one.
      secondTCQuery = kbUnitQueryCreate("Second enemy TC");
   }
   kbUnitQuerySetPlayerRelation(secondTCQuery, cPlayerRelationEnemy);
   kbUnitQuerySetUnitType(secondTCQuery, cUnitTypeTownCenter);
   kbUnitQuerySetState(secondTCQuery, cUnitStateAlive);
   kbUnitQuerySetPosition(secondTCQuery, kbUnitGetPosition(tcID1));
   kbUnitQuerySetMaximumDistance(secondTCQuery, 500.0);

   kbUnitQueryResetResults(secondTCQuery);
   int tcCount = kbUnitQueryExecute(secondTCQuery);
   if (tcCount > 1)  // Found another enemy TC
   {
      tcID2 = kbUnitQueryGetResult(secondTCQuery, 1); // Second unit in list
      enemy2 = kbUnitGetPlayerID(tcID2);
   }
   
   if (tcID2 < 0)
      return;
   
   // We have two TCs.  See if we have a unit in range.  If so, send a taunt if appropriate.  Either way, shut the rule off.
   xsDisableSelf();
   
   if (enemy1 == enemy2)
      return;  // Makes no sense to taunt if the same player owns both...
   
   bool haveLOS = false;
   if (getUnitByLocation(cUnitTypeUnit, cMyID, cUnitStateAlive, kbUnitGetPosition(tcID1), 50.0) >= 0)
      haveLOS = true;
   if (getUnitByLocation(cUnitTypeUnit, cMyID, cUnitStateAlive, kbUnitGetPosition(tcID2), 50.0) >= 0)
      haveLOS = true;
   
   if (haveLOS == true)
   {
      float d = distance(kbUnitGetPosition(tcID1), kbUnitGetPosition(tcID2));
      if (d < 100.0)
      {  // Close together.  Taunt the two, flaring the other's bases.
         aiEcho("Enemy TCs are "+d+" meters apart.  Taunting for closeness.");
         sendStatement(enemy1, cAICommPromptToEnemyHisTCNearAlly, kbUnitGetPosition(tcID2)); // Taunt enemy 1 about enemy 2's TC
         sendStatement(enemy2, cAICommPromptToEnemyHisTCNearAlly, kbUnitGetPosition(tcID1)); // Taunt enemy 2 about enemy 1's TC
      }
      if (d > 200.0)
      {  // Far apart.  Taunt.
         aiEcho("Enemy TCs are "+d+" meters apart.  Taunting for isolation.");
         sendStatement(enemy1, cAICommPromptToEnemyHisTCIsolated, kbUnitGetPosition(tcID2)); // Taunt enemy 1 about enemy 2's TC
         sendStatement(enemy2, cAICommPromptToEnemyHisTCIsolated, kbUnitGetPosition(tcID1)); // Taunt enemy 2 about enemy 1's TC         
      }
      aiEcho("Enemy TCs are "+d+" meters apart.");
   }  // Otherwise, rule is turned off, we missed our chance.   
   else
   {
      aiEcho("Had no LOS to enemy TCs");
   }
}


rule monitorScores
inactive
minInterval 60
group tcComplete
{
   static int startingScores = -1;  // Array holding initial scores for each player
   static int highScores = -1;      // Array, each player's high-score mark
   static int teamScores = -1;
   int player = -1;
   int teamSize = 0;
   int myTeam = kbGetPlayerTeam(cMyID);
   int enemyTeam = -1;
   int highAllyScore = -1;
   int highAllyPlayer = -1;
   int highEnemyScore = -1;
   int highEnemyPlayer = -1;
   int score = -1;
   int firstHumanAlly = -1;
   
   if (aiGetGameType() != cGameTypeRandom)   // TODO:  Check for DM if/when we have a DM type.
   {
      xsDisableSelf();
      return;
   }
   
   if (highScores < 0)
   {
      highScores = xsArrayCreateInt(cNumberPlayers, 1, "High Scores");   // create array, init below.
   }
   if (startingScores < 0)
   {
      if (aiGetNumberTeams() != 3)  // Gaia, plus two
      {
         // Only do this if there are two teams with the same number of players on each team.
         xsDisableSelf();
         return;
      }
      startingScores = xsArrayCreateInt(cNumberPlayers, 1, "Starting Scores");   // init array
      for (player = 1; <cNumberPlayers)
      {
         score = aiGetScore(player);            
         aiEcho("Starting score for player "+player+" is "+score);
         xsArraySetInt(startingScores, player, score);
         xsArraySetInt(highScores, player, 0);     // High scores will track score actual - starting score, to handle deathmatch better.
      }
   }
   
   teamSize = 0;
   for (player = 1; <cNumberPlayers)
   {
      if (kbGetPlayerTeam(player) == myTeam)
      {
         teamSize = teamSize + 1;
         if ( (kbIsPlayerHuman(player) == true) && (firstHumanAlly < 1) )
            firstHumanAlly = player;
      }
      else
         enemyTeam = kbGetPlayerTeam(player);   // Don't know if team numbers are 0..1 or 1..2, this works either way.
   }

   if ( (2 * teamSize) != (cNumberPlayers - 1) )   // Teams aren't equal size
   {
      xsDisableSelf();
      return;
   }
      
   // If we got this far, there are two teams and each has 'teamSize' players.  Otherwise, rule turns off.
   if (teamScores < 0)
   {
      teamScores = xsArrayCreateInt(3, 0, "Team total scores");
   }
  
   if (firstHumanAlly < 0) // No point if we don't have a human ally.
   {
      xsDisableSelf();
      return;
   }
   
   // Update team totals, check for new high scores
   xsArraySetInt(teamScores, myTeam, 0);
   xsArraySetInt(teamScores, enemyTeam, 0);
   highAllyScore = -1;
   highEnemyScore = -1;
   highAllyPlayer = -1;
   highEnemyPlayer = -1;
   int lowestRemainingScore = 100000;   // Very high, will be reset by first real score 
   int lowestRemainingPlayer = -1;
   int highestScore = -1;
   int highestPlayer = -1;
   
   for (player = 1; <cNumberPlayers)
   {
      score = aiGetScore(player) - xsArrayGetInt(startingScores, player);  // Actual score relative to initial score
      if (kbHasPlayerLost(player) == true)
         continue;
      if (score < lowestRemainingScore)
      {
         lowestRemainingScore = score;
         lowestRemainingPlayer = player;
      }
      if (score > highestScore)
      {
         highestScore = score;
         highestPlayer = player;
      }
      if (score > xsArrayGetInt(highScores, player) )   
         xsArraySetInt(highScores, player, score);   // Set personal high score
      if (kbGetPlayerTeam(player) == myTeam)    // Update team scores, check for highs
      {
         xsArraySetInt(teamScores, myTeam, xsArrayGetInt(teamScores, myTeam) + score);
         if (score > highAllyScore)
         {
            highAllyScore = score;
            highAllyPlayer = player;
         }
      }
      else
      {
         xsArraySetInt(teamScores, enemyTeam, xsArrayGetInt(teamScores, enemyTeam) + score);
         if (score > highEnemyScore)
         {
            highEnemyScore = score;
            highEnemyPlayer = player;
         }
      }
   }

   // Bools used to indicate chat usage, prevent re-use.
   static bool enemyNearlyDead = false;
   static bool enemyStrong = false;
   static bool losingEnemyStrong = false;
   static bool losingEnemyWeak = false;
   static bool losingAllyStrong = false;
   static bool losingAllyWeak = false;
   static bool winningNormal = false;
   static bool winningAllyStrong = false;
   static bool winningAllyWeak = false;
   
   static int shouldResignCount = 0;   // Set to 1, 2 and 3 as chats are used.
   static int shouldResignLastTime = 420000;   // When did I last suggest resigning?  Consider it again 3 min later.          
                                                   // Defaults to 7 min, so first suggestion won't be until 10 minutes.
   
   // Attempt to fire chats, from most specific to most general.
   // When we chat, mark that one used and exit for now, i.e no more than one chat per rule execution.
   
   // First, check the winning / losing / tie situations.  
   // Bail if earlier than 12 minutes
   if (xsGetTime() < 60*1000*12)
      return;
   
   if (aiTreatyActive() == true)
      return;
   
   bool winning = false;
   bool losing = false;
   float ourAverageScore = (aiGetScore(cMyID) + aiGetScore(firstHumanAlly)) / 2.0;   
   
   if ( xsArrayGetInt(teamScores, myTeam) > (1.20 * xsArrayGetInt(teamScores, enemyTeam)) )
   {  // We are winning
      winning = true;
            
      // Are we winning because my ally rocks?
      if ( (winningAllyStrong == false) && (firstHumanAlly == highestPlayer) )
      {
         winningAllyStrong = true;
         sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreWinningHeIsStronger);
         return;
      }
      
      // Are we winning in spite of my weak ally?
      if ( (winningAllyWeak == false) && (cMyID == highestPlayer) )
      {
         winningAllyWeak = true;
         sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreWinningHeIsWeaker);
         return;
      }     

      // OK, we're winning, but neither of us has high score.
      if (winningNormal == false)
      {
         winningNormal = true;
         sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreWinning);
         return;
      }
   }  // End chats while we're winning.
   
   
   if ( xsArrayGetInt(teamScores, myTeam) < (0.70 * xsArrayGetInt(teamScores, enemyTeam)) )
   {  // We are losing
      losing = true;
      
      // Talk about resigning?
      if ( (shouldResignCount < 3) && ( (xsGetTime() - shouldResignLastTime) > 3*60*1000) )  // Haven't done it 3 times or within 3 minutes
      {
         switch(shouldResignCount)
         {
            case 0:
            {
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeShouldResign1);
               break;
            }
            case 1:
            {
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeShouldResign2);
               break;
            }
            case 2:
            {
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeShouldResign3);
               break;
            }
         }
         shouldResignCount = shouldResignCount + 1;
         shouldResignLastTime = xsGetTime();
         return;
      }  // End resign
      
      // Check for "we are losing but let's kill the weakling"
      if ( (losingEnemyWeak == false) && (kbIsPlayerEnemy(lowestRemainingPlayer) == true) )
      {
         switch(kbGetCivForPlayer(lowestRemainingPlayer))
         {
            case cCivRussians:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakRussian);
               return;  
               break;
            }
            case cCivFrench:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakFrench);
               return;
               break;
            }
            case cCivGermans:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakGerman);
               return;  
               break;
            }
            case cCivBritish:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakBritish);
               return;
               break;
            }
            case cCivSpanish:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakSpanish);
               return;  
               break;
            }
            case cCivDutch:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakDutch);
               return;
               break;
            }
            case cCivPortuguese:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakPortuguese);
               return;  
               break;
            }
            case cCivOttomans:
            {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakOttoman);
               return;
               break;
            }
            case cCivJapanese:
            {
              if (civIsAsian() == true) {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakJapanese);
               return;
               break;
              }
            }
            case cCivChinese:
            {
              if (civIsAsian() == true) {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakChinese);
               return;
               break;
              }
            }
            case cCivIndians:
            {
              if (civIsAsian() == true) {
               losingEnemyWeak = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyWeakIndian);
               return;
               break;
              }
            }
         }
      }
      
      // Check for losing while enemy player has high score.
      if ( (losingEnemyStrong == false) && (kbIsPlayerEnemy(highestPlayer) == true) )
      {
         switch(kbGetCivForPlayer(highestPlayer))
         {
            case cCivRussians:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongRussian);
               return;  
               break;
            }
            case cCivFrench:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongFrench);
               return;
               break;
            }
            case cCivGermans:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongGerman);
               return;  
               break;
            }
            case cCivBritish:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongBritish);
               return;
               break;
            }
            case cCivSpanish:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongSpanish);
               return;  
               break;
            }
            case cCivDutch:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongDutch);
               return;
               break;
            }
            case cCivPortuguese:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongPortuguese);
               return;  
               break;
            }
            case cCivOttomans:
            {
               losingEnemyStrong = true; // chat used.
               sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongOttoman);
               return;
               break;
            }
            case cCivJapanese:
              {
                if (civIsAsian() == true) {
                 losingEnemyStrong = true; // chat used.
                 sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongJapanese);
                 return;
                 break;
                }
              }
              case cCivChinese:
              {
                if (civIsAsian() == true) {
                 losingEnemyStrong = true; // chat used.
                 sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongChinese);
                 return;
                 break;
                }
              }
              case cCivIndians:
              {
                if (civIsAsian() == true) {
                 losingEnemyStrong = true; // chat used.
                 sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingEnemyStrongIndian);
                 return;
                 break;
                }
              }
         }
      }
      
      // If we're here, we're losing but our team has the high score.  If it's my ally, we're losing because I suck.
      if ( (losingAllyStrong == false) && (firstHumanAlly == highestPlayer) )
      {
         losingAllyStrong = true;
         sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingHeIsStronger);
         return;
      }
      if ( (losingAllyWeak == false) && (cMyID == highestPlayer) )
      {
         losingAllyWeak = true;
         sendStatement(firstHumanAlly, cAICommPromptToAllyWeAreLosingHeIsWeaker);
         return;
      }      
   }  // End chats while we're losing.
   
   if ( (winning == false) && (losing == false) )
   {  // Close game
      
      // Check for a near-death enemy
      if ( (enemyNearlyDead == false) && (kbIsPlayerEnemy(lowestRemainingPlayer) == true) )// Haven't used this chat yet
      {
         if ( (lowestRemainingScore * 2) < xsArrayGetInt(highScores, lowestRemainingPlayer) )   // He's down to half his high score.
         {
            switch(kbGetCivForPlayer(lowestRemainingPlayer))
            {
               case cCivRussians:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadRussian);
                  return;  
                  break;
               }
               case cCivFrench:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadFrench);
                  return;
                  break;
               }
               case cCivBritish:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadBritish);
                  return;
                  break;
               }
               case cCivSpanish:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadSpanish);
                  return;
                  break;
               }
               case cCivGermans:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadGerman);
                  return;
                  break;
               }
               case cCivOttomans:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadOttoman);
                  return;
                  break;
               }
               case cCivDutch:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadDutch);
                  return;
                  break;
               }
               case cCivPortuguese:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadPortuguese);
                  return;
                  break;
               }
               case cCivJapanese:
                {
                  if (civIsAsian() == true) {
                   enemyNearlyDead = true; // chat used.
                   sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadJapanese);
                   return;
                   break;
                  }
                }
                case cCivChinese:
                {
                  if (civIsAsian() == true) {
                   enemyNearlyDead = true; // chat used.
                   sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadChinese);
                   return;
                   break;
                  }
                }
                case cCivIndians:
                {
                  if (civIsAsian() == true) {
                   enemyNearlyDead = true; // chat used.
                   sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyNearlyDeadIndian);
                   return;
                   break;
                  }
                }
               
            }
         }
      }
      
      // Check for very strong enemy
      if ( (enemyStrong == false) && (kbIsPlayerEnemy(highestPlayer) == true) )
      {
         if ( (ourAverageScore * 1.5) < highestScore) 
         {  // Enemy has high score, it's at least 50% above our average.
            switch(kbGetCivForPlayer(highestPlayer))
            {
               case cCivRussians:
               {
                  enemyStrong = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongRussian);
                  return;  
                  break;
               }
               case cCivFrench:
               {
                  enemyStrong = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongFrench);
                  return;
                  break;
               }
               case cCivBritish:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongBritish);
                  return;
                  break;
               }
               case cCivSpanish:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongSpanish);
                  return;
                  break;
               }
               case cCivGermans:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongGerman);
                  return;
                  break;
               }
               case cCivOttomans:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongOttoman);
                  return;
                  break;
               }
               case cCivDutch:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongDutch);
                  return;
                  break;
               }
               case cCivPortuguese:
               {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongPortuguese);
                  return;
                  break;
               }
               case cCivJapanese:
               {
                 if (civIsAsian() == true) {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongJapanese);
                  return;
                  break;
                 }
               }
               case cCivChinese:
               {
                 if (civIsAsian() == true) {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongChinese);
                  return;
                  break;
                 }
               }
               case cCivIndians:
               {
                 if (civIsAsian() == true) {
                  enemyNearlyDead = true; // chat used.
                  sendStatement(firstHumanAlly, cAICommPromptToAllyEnemyStrongIndian);
                  return;
                  break;
                 }
               }
             }
         }
      }        
   }  // End chats for close game 
}


rule firstEnemyUnitSpotted
inactive
group startup
minInterval 5
{
   static int targetPlayer = -1;
   
   if (targetPlayer < 0)
   {
      targetPlayer = getEnemyPlayerByTeamPosition(getTeamPosition(cMyID));    // Corresponding player on other team
      if (targetPlayer < 0)
      {
         xsDisableSelf();
         aiEcho("No corresponding player on other team, firstEnemyUnitSpotted is deactivating.");
         aiEcho("    My team position is "+getTeamPosition(cMyID));
         return;
      }
      aiEcho("Rule firstEnemyUnitSpotted will watch for player #"+targetPlayer); 
   }
   
   if (kbUnitCount(targetPlayer, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive) > 0) 
   {  // We see one of this player's units for the first time...let's do some analysis on it
      int unitID = getUnit(cUnitTypeLogicalTypeLandMilitary, targetPlayer, cUnitStateAlive); // Get the (or one of the) enemy units
      if (unitID < 0)
      {
         aiEcho("kbUnitCount said there are enemies, but getUnit finds nothing.");
         return;
      }
      
      aiEcho("Enemy unit spotted at "+kbUnitGetPosition(unitID));
      aiEcho("My base is at "+kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
      aiEcho("Distance is "+distance(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), kbUnitGetPosition(unitID)));
      aiEcho("Unit ID is "+unitID);
      // Three tests in priority order....anything near my town, an explorer anywhere, or default.
      // In my town?
      if ( distance(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), kbUnitGetPosition(unitID)) < 60.0 )
      {
         sendStatement(targetPlayer, cAICommPromptToEnemyISeeHisFirstMilitaryMyTown, kbUnitGetPosition(unitID));
         aiEcho("Spotted a unit near my town, so I'm threatening player #"+targetPlayer);
         xsDisableSelf();         
         return;
      }
      // Is it an explorer?
      if ( kbUnitIsType(unitID, cUnitTypeExplorer) == true )
      {
         sendStatement(targetPlayer, cAICommPromptToEnemyISeeHisExplorerFirstTime, kbUnitGetPosition(unitID));
         aiEcho("Spotted an enemy explorer, so I'm threatening player #"+targetPlayer);
         xsDisableSelf();         
         return;
      }
      // Generic
      if (getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateAlive, kbUnitGetPosition(unitID), 70.0) < 0)   
      {  // No TCs nearby
         sendStatement(targetPlayer, cAICommPromptToEnemyISeeHisFirstMilitary, kbUnitGetPosition(unitID));
         aiEcho("Spotted an enemy military unit for the first time, so I'm threatening player #"+targetPlayer);
      }
      xsDisableSelf();         
      return;
   }
}





//==============================================================================
// main
//==============================================================================
void main(void)
{ 
	aiEcho("Main is starting.");
   aiEcho("Game type is "+aiGetGameType()+", 0=Scn, 1=Saved, 2=Rand, 3=GC, 4=Cmpgn");
   aiEcho("Map name is "+cRandomMapName);
   
   initArrays();              // Create the global arrays
   aiRandSetSeed(-1);         // Set our random seed.  "-1" is a random init.
   kbAreaCalculate();         // Analyze the map, create area matrix
	aiPopulatePoliticianList(); // Fill out the PoliticanLists.
   
   if ( (aiGetGameType() == cGameTypeCampaign) || (aiGetGameType() == cGameTypeScenario) )
      gSPC = true;
   else
      gSPC = false;  // RM game

   int intDifficulty = -1;
   float difficulty = aiGetWorldDifficulty();
   float diffRemainder = -1.0;
   intDifficulty = difficulty;
   diffRemainder = difficulty - intDifficulty;
   
   // Call the rule once as a function, to get all the pop limits set up.
	popManager();     
   
   aiEcho("I see "+kbUnitCount(cMyID, cUnitTypeHomeCityWaterSpawnFlag)+" water flags.");

   //-- setup the handicaps.
   // baseLineHandicap is a global multiplier that we can use to adjust all up or down.  Probably will remain at 1.0.
   // startingHandicap is the handicap set at game launch in the UI, i.e. boost this player 10% == 1.10.  That needs to be
   // multiplied by the appropriate difficulty for each level.
   float startingHandicap = kbGetPlayerHandicap(cMyID);
	switch(intDifficulty)
   {
		case cDifficultySandbox: // Sandbox
		{
			kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 0.3 );    // Set handicap to a small fraction of baseline, i.e. minus 70%.
         gDelayAttacks = true;      // Prevent attacks...actually stays that way, never turns true.
         cvOkToBuildForts = false;
 			break;
		}
		case cDifficultyEasy: // Easiest
		{
         if (gSPC == true)
            kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 0.5 ); // minus 50 percent for scenarios
         else
            kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 0.4 ); // minus 60 percent
            
         gDelayAttacks = true;
         cvOkToBuildForts = false;
         xsEnableRule("delayAttackMonitor");    // Wait until I am attacked, then let slip the hounds of war.
			break;
		}
		case cDifficultyModerate: // Moderate
		{
         if (gSPC == true)
            kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 0.75 ); // minus 25% for scenarios
         else
            kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 0.65 ); // minus 35%
			break;
		}
		case cDifficultyHard: // Hard
		{
			kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 1.0 );    // 1.0 handicap at hard, i.e. no bonus
			break;
		}
		case cDifficultyExpert: // Expert
		{
			kbSetPlayerHandicap( cMyID, startingHandicap * baselineHandicap * 1.5 );    // +50% boost.
			break;
		}
   }
   aiEcho("Handicap is "+kbGetPlayerHandicap(cMyID));
   aiEcho("Difficulty is "+aiGetWorldDifficulty());

   // Do some overrides for the SPC/campaign games before the loader file wakes up.
	SPCInit();

   // Find out what our personality is, init variables from it.
	initPersonality(); 
   
   // Allow loader file to change default values before we start.
	preInit();
   if (cvInactiveAI == true)
   {
      cvOkToSelectMissions = false;
      cvOkToTrainArmy = false;
      cvOkToAllyNatives = false;
      cvOkToClaimTrade = false;
      cvOkToGatherFood = false;
      cvOkToGatherGold = false;
      cvOkToGatherWood = false;
      cvOkToExplore = false;
      cvOkToResign  = false;
      cvOkToAttack = false;
   }
   
   // Figure out the starting conditions, and deal with them.
   if (gSPC == true)
   {     
      aiEcho("Start mode:  Scenario, details TBD after aiStart object is found.");
		// Wait for the aiStart unit to appear, then figure out what to do.
		// That rule will have to set the start mode to ScenarioTC or ScenarioNoTC.
      xsEnableRule("waitForStartup");     
   }
   else
   {  
      // RM or GC game
		aiSetRandomMap(true);
      // Check for a TC.
		if (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) > 0) 
      {  
			// TC start
         aiEcho("Start mode:  Land TC");
         gStartMode = cStartModeLandTC;
         // Call init directly.
			init();
      }
      else 
      {
         // Check for a Boat.
			if (kbUnitCount(cMyID, cUnitTypeAbstractWarShip, cUnitStateAlive) > 0) 
         {
            gStartMode = cStartModeBoat;
            aiEcho("Start mode: Boat");
            // Needed for first transport unloading 
				aiSetHandler("transportArrive", cXSHomeCityTransportArriveHandler);	

            // Rule that fires after 30 seconds in case
				// something goes wrong with unloading
				xsEnableRule("transportArriveFailsafe");	
         }
         else
         {  
				// This must be a land nomad start
            aiEcho("Start mode:  Land Wagon");
            gStartMode = cStartModeLandWagon;  
            // Call the function that sets up explore plans, etc.
				transportArrive();
         }
      }
   }

	//-- set the default Resource Selector factor.
	kbSetTargetSelectorFactor(cTSFactorDistance, gTSFactorDistance);
	kbSetTargetSelectorFactor(cTSFactorPoint, gTSFactorPoint);
	kbSetTargetSelectorFactor(cTSFactorTimeToDone, gTSFactorTimeToDone);
	kbSetTargetSelectorFactor(cTSFactorBase, gTSFactorBase);
	kbSetTargetSelectorFactor(cTSFactorDanger, gTSFactorDanger);
   
   xsEnableRule("autoSave");
   // Trigger first autosave immediately
	autoSave();
	//aiSetDefaultStance(cUnitStancePassive);

   // postInit() is called by transportArrive() or by the waitForStartup rule.
}



rule waitForStartup
inactive
minInterval 1
{
   if (kbUnitCount(cMyID, cUnitTypeAIStart, cUnitStateAny) < 1)
      return;
   xsDisableSelf();
   
   if (kbUnitCount(cMyID, cUnitTypeTownCenter, cUnitStateAlive) > 0)
   {
      aiEcho("Start mode:  Scenario TC.");
      gStartMode = cStartModeScenarioTC;
   }
   else
   {
      if (kbUnitCount(cMyID, gCoveredWagonUnit, cUnitStateAlive) > 0)
      {
         aiEcho("Start mode:  Scenario wagon.");
         gStartMode = cStartModeScenarioWagon;
      }
      else
      {
         aiEcho("Start mode:  Scenario, no TC.");
         gStartMode = cStartModeScenarioNoTC;
      }
   }
   if (cvInactiveAI == false)
      transportArrive();
}

void testHandler(int parm=-1)
{
   aiEcho("StateChanged EventHandlerCalled with PlanID " + parm);
}


//==============================================================================
// RULE fillInWallGaps
//==============================================================================
rule fillInWallGaps
   minInterval 31
   inactive
{
   //If we're not building walls, go away.
   if (gBuildWalls == false)
   {
      xsDisableSelf();
      return;
   }

   //If we already have a build wall plan, don't make another one.
   if(aiPlanGetIDByTypeAndVariableType(cPlanBuildWall, cBuildWallPlanWallType, cBuildWallPlanWallTypeRing, true) >= 0)
      return;

   int wallPlanID=aiPlanCreate("FillInWallGaps", cPlanBuildWall);
   if (wallPlanID != -1)
   {
         aiPlanSetVariableInt(wallPlanID, cBuildWallPlanWallType, 0, cBuildWallPlanWallTypeRing);
         aiPlanAddUnitType(wallPlanID, cUnitTypeSettler, 1, 1, 1);
         aiPlanSetVariableVector(wallPlanID, cBuildWallPlanWallRingCenterPoint, 0, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
         aiPlanSetVariableFloat(wallPlanID, cBuildWallPlanWallRingRadius, 0, 30.0);
         aiPlanSetVariableInt(wallPlanID, cBuildWallPlanNumberOfGates, 0, 2);
         aiPlanSetBaseID(wallPlanID, kbBaseGetMainID(cMyID));
         aiPlanSetEscrowID(wallPlanID, cEconomyEscrowID);
         aiPlanSetDesiredPriority(wallPlanID,80);
         aiPlanSetActive(wallPlanID, true);
   }
   
}

void monopolyStartHandler(int teamID=-1)
{
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("MonopolyStartHandler:  Team "+teamID);
   if (teamID < 0)
      return;
   
   // If this is my team, congratulate teammates and taunt enemies
   if ( kbGetPlayerTeam(cMyID) == teamID)
   {
      sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenWeGetMonopoly, cInvalidVector);
      sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemyWhenWeGetMonopoly, cInvalidVector);
   }
   else // Otherwise, snide comment to enemies and condolences to partners
   {
      sendStatement(cPlayerRelationAlly, cAICommPromptToAllyWhenEnemiesGetMonopoly, cInvalidVector);
      sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemyWhenTheyGetMonopoly, cInvalidVector);
   }      
   gIsMonopolyRunning = true;
   gMonopolyTeam = teamID;
   gMonopolyEndTime = xsGetTime() + 5*60*1000; 
   xsEnableRule("monopolyTimer");
}


void monopolyEndHandler(int teamID=-1)
{
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("MonopolyEndHandler:  Team "+teamID);
   if (teamID < 0)
      return;
   // If this is my team, console partners, and send defiant message to enemies
   if ( kbGetPlayerTeam(cMyID) == teamID)
   {
      sendStatement(cPlayerRelationAlly, cAICommPromptToAllyEnemyDestroyedMonopoly, cInvalidVector);
      sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemyTheyDestroyedMonopoly, cInvalidVector);
   }
   else // Otherwise, gloat at enemies
   {
      sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemyIDestroyedMonopoly, cInvalidVector);
   }         
   gIsMonopolyRunning = false;
   gMonopolyTeam = -1;
   gMonopolyEndTime = -1;
   xsDisableRule("monopolyTimer");
}

rule monopolyTimer
inactive
minInterval 5
{
   if ((gIsMonopolyRunning == false) || (gMonopolyEndTime < 0))
   {
      xsDisableSelf();
      return;
   }
   if (xsGetTime() > gMonopolyEndTime)
   {
      // If this is my team, congratulate teammates and taunt enemies
      if ( kbGetPlayerTeam(cMyID) == gMonopolyTeam)
      {
         sendStatement(cPlayerRelationAlly, cAICommPromptToAlly1MinuteLeftOurMonopoly, cInvalidVector);
         sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemy1MinuteLeftOurMonopoly, cInvalidVector);
      }
      else // Otherwise, snide comment to enemies and panic to partners
      {
         sendStatement(cPlayerRelationAlly, cAICommPromptToAlly1MinuteLeftEnemyMonopoly, cInvalidVector);
         sendStatement(cPlayerRelationEnemyNotGaia, cAICommPromptToEnemy1MinuteLeftEnemyMonopoly, cInvalidVector);
      }       
      xsDisableSelf();
      return;
   }
}

rule monopolyManager
minInterval 21
inactive
group tcComplete
{
   if (aiTreatyActive() == true)
   {
      aiEcho("    Monopoly delayed because treaty is active.");
      return;
   }
   if ( aiIsMonopolyAllowed() == false )
   {
      aiEcho("    Monopoly not allowed, terminating rule.");
      xsDisableSelf();
   }
   if ( kbUnitCount(cMyID, cUnitTypeTradingPost, cUnitStateAlive) < 1)
      return;     // Not allowed to research without a building...

   if( aiReadyForTradeMonopoly() == true)
   {
      aiEcho("      Trade monopoly is available.");
      if (kbResourceGet(cResourceGold) >= kbTechCostPerResource(cTechTradeMonopoly, cResourceGold) && 
          kbResourceGet(cResourceFood) >= kbTechCostPerResource(cTechTradeMonopoly, cResourceFood) &&
          kbResourceGet(cResourceWood) >= kbTechCostPerResource(cTechTradeMonopoly, cResourceWood)
         )
      {
         aiEcho("    Attempting trade monopoly");
         if (aiDoTradeMonopoly() == true)
            kbEscrowAllocateCurrentResources();
      }
      else
      {
         aiEcho("    ....but I can't afford it.");
      }
   }
}

void KOTHVictoryStartHandler(int teamID=-1)
{
   int newOppID = -1;
   
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("KOTHStartHandler:  Team "+teamID);
   if (teamID < 0)
      return;
      
   gIsKOTHRunning = true;
   gKOTHTeam = teamID;
}


void KOTHVictoryEndHandler(int teamID=-1)
{
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("     ");
   aiEcho("KOTHEndHandler:  Team "+teamID);
   if (teamID < 0)
      return;
      
   gIsKOTHRunning = false;
   gKOTHTeam = -1;
}

rule goldenPavillionTacticMonitor
inactive
group tcComplete
mininterval 120
{
   // Disable rule for anybody but Japanese
   if (kbGetCiv() != cCivJapanese)
   {
      xsDisableSelf();
      return;
   }

   int goldenPavillionType = -1;
   if (kbUnitCount(cMyID, cUnitTypeypWJGoldenPavillion3, cUnitStateAlive) > 0)
      goldenPavillionType = cUnitTypeypWJGoldenPavillion3;

   if (goldenPavillionType > 0)
   {
      int goldenPavillionQueryID = -1;
      goldenPavillionQueryID = kbUnitQueryCreate("goldenPavillionQueryID");
      kbUnitQuerySetIgnoreKnockedOutUnits(goldenPavillionQueryID, true);
      if (goldenPavillionQueryID != -1)
      {
         kbUnitQuerySetPlayerRelation(goldenPavillionQueryID, -1);
         kbUnitQuerySetPlayerID(goldenPavillionQueryID, cMyID);
         kbUnitQuerySetUnitType(goldenPavillionQueryID, goldenPavillionType);
         kbUnitQuerySetState(goldenPavillionQueryID, cUnitStateAlive);
         kbUnitQueryResetResults(goldenPavillionQueryID);
         int numberFound = kbUnitQueryExecute(goldenPavillionQueryID);

         // Activate land military hitpoint bonus and disable rule
         if (numberFound > 0)
         {
            aiUnitSetTactic(kbUnitQueryGetResult(goldenPavillionQueryID, 0), cTacticUnitHitpoints);
            xsDisableSelf();
         }
      }
   }
}

rule summerPalaceTacticMonitor
inactive
group tcComplete
mininterval 30
{
   int summerPalaceType = -1;
   //int randomizer = -1;

   if(kbGetCiv() != cCivChinese)
   {
      xsDisableSelf();
	  return;
   }

   if (kbUnitCount(cMyID, cUnitTypeypWCSummerPalace2, cUnitStateAlive) > 0)
      summerPalaceType = cUnitTypeypWCSummerPalace2;
   if (summerPalaceType > 0)
   {
      int summerPalaceQueryID = -1;
      summerPalaceQueryID = kbUnitQueryCreate("summerPalaceQueryID");
      kbUnitQuerySetIgnoreKnockedOutUnits(summerPalaceQueryID, true);
      if (summerPalaceQueryID != -1)
      {
         kbUnitQuerySetPlayerRelation(summerPalaceQueryID, -1);
         kbUnitQuerySetPlayerID(summerPalaceQueryID, cMyID);
         kbUnitQuerySetUnitType(summerPalaceQueryID, summerPalaceType);
         kbUnitQuerySetState(summerPalaceQueryID, cUnitStateAlive);
         kbUnitQueryResetResults(summerPalaceQueryID);
         int numberFound = kbUnitQueryExecute(summerPalaceQueryID);

         if (numberFound > 0)
         {
            aiUnitSetTactic(kbUnitQueryGetResult(summerPalaceQueryID, 0), cTacticOldHanArmy);
			xsDisableSelf();
         }
      }
   }
}

rule wcMonitor
inactive
group tcComplete
mininterval 30
{
   int WCType = -1;
   //int randomizer = -1;
   static int tac = -1;

   if(kbGetCiv() != cCivChinese)
   {
      xsDisableSelf();
	  return;
   }
   if(kbResourceGet(cResourceWood) > 1000)
      tac = 1;
   else
      tac = 0;


   if (kbUnitCount(cMyID, cUnitTypeypWCPorcelainTower3, cUnitStateAlive) > 0)
      WCType = cUnitTypeypWCPorcelainTower3;
   if (WCType > 0)
   {
      int QueryID = -1;
      QueryID = kbUnitQueryCreate("QueryID");
      kbUnitQuerySetIgnoreKnockedOutUnits(QueryID, true);
      if (QueryID != -1)
      {
         kbUnitQuerySetPlayerRelation(QueryID, -1);
         kbUnitQuerySetPlayerID(QueryID, cMyID);
         kbUnitQuerySetUnitType(QueryID, WCType);
         kbUnitQuerySetState(QueryID, cUnitStateAlive);
         kbUnitQueryResetResults(QueryID);
         int numberFound = kbUnitQueryExecute(QueryID);

         if (numberFound > 0)
         {
            if(tac > 0)
			   aiUnitSetTactic(kbUnitQueryGetResult(QueryID, 0), cTacticWonderCoin);
			else
			   aiUnitSetTactic(kbUnitQueryGetResult(QueryID, 0), cTacticWonderWood);
         }
      }
   }
}

rule MarketUpgradeI
inactive
minInterval 30
{  
   if ((civIsAsian() == true) || (civIsNative() == true))
   {
      xsDisableSelf();
      return;
   }
   if(kbTechGetStatus(cTechCircularSaw) == cTechStatusActive)
   {
      xsDisableSelf();
	  return;
   }
   
   int FoodPlanID = -1;
   int WoodPlanID = -1;
   int GoldPlanID = -1;
   int OtherPlanID = -1;
   
   if(kbGetCiv() == cCivDutch && kbGetAge() == cAge1)
      return;
   if (kbTechGetStatus(cTechHuntingDogs) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechHuntingDogs);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechHuntingDogs, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(kbGetAge() < cAge2 || kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 4)
      return;

   if(kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) < 3 && cMyCiv == cCivDutch)
      return;
   if (kbTechGetStatus(cTechPlacerMines) == cTechStatusObtainable)
   {
      GoldPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechPlacerMines);
      if (GoldPlanID < 0)
         createSimpleResearchPlan(cTechPlacerMines, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 8)
      return;
   
   if(kbGetCiv() == cCivFrench && kbResourceGet(cResourceWood) < 500)
      return;
   if(kbGetCiv() == cCivGermans && kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 10)
      return;
   if (kbTechGetStatus(cTechSteelTraps) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechSteelTraps);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechSteelTraps, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   
   if (kbTechGetStatus(cTechGreatCoat) == cTechStatusObtainable)
   {
      OtherPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechGreatCoat);
      if (OtherPlanID < 0)
         createSimpleResearchPlan(cTechGreatCoat, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 12)
      return;
   
   if (kbTechGetStatus(cTechGangsaw) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechGangsaw);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechGangsaw, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechAmalgamation) == cTechStatusObtainable)
   {
      GoldPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechAmalgamation);
      if (GoldPlanID < 0)
         createSimpleResearchPlan(cTechAmalgamation, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 900000)
      return;
   
   if (kbTechGetStatus(cTechLogFlume) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechLogFlume);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechLogFlume, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 1500000)
      return;
   
   if (kbTechGetStatus(cTechCircularSaw) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechCircularSaw);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechCircularSaw, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }

}

rule MarketUpgradeII
inactive
minInterval 30
{
   if (civIsAsian() == false)
   {
      xsDisableSelf();
      return;
   }
   if(kbTechGetStatus(cTechypMarketCircularSaw) == cTechStatusActive)
   {
      xsDisableSelf();
	  return;
   }
   if(cMyCiv == cCivIndians && kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 7)
      return;
   if(cMyCiv == cCivChinese && kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 4)
      return;
   
   int FoodPlanID = -1;
   int WoodPlanID = -1;
   int GoldPlanID = -1;
   int OtherPlanID = -1;
   
   if (kbTechGetStatus(cTechypMarketWheelbarrow) == cTechStatusObtainable)
   {
      OtherPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketWheelbarrow);
      if (OtherPlanID < 0)
         createSimpleResearchPlan(cTechypMarketWheelbarrow, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 300000)
      return;
   
   if (kbTechGetStatus(cTechypMarketBerryDogs) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketBerryDogs);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketBerryDogs, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechypMarketPlacerMines) == cTechStatusObtainable)
   {
      GoldPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketPlacerMines);
      if (GoldPlanID < 0)
         createSimpleResearchPlan(cTechypMarketPlacerMines, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechypMarketBerryTraps) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketBerryTraps);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketBerryTraps, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 420000)
      return;
	
   int planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);
   if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) )
      createSimpleBuildPlan(gMarketUnit, 1, 79, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
   
   if (kbTechGetStatus(cTechypMarketHuntingDogs) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketHuntingDogs);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketHuntingDogs, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 540000)
      return;
	  
   if (kbTechGetStatus(cTechypMarketSteelTraps) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketSteelTraps);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketSteelTraps, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechypMarketGangsaw) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketGangsaw);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketGangsaw, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechypMarketLogFlume) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketLogFlume);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketLogFlume, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 600000)
      return;
   
   if (kbTechGetStatus(cTechypMarketAmalgamation) == cTechStatusObtainable)
   {
      GoldPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketAmalgamation);
      if (GoldPlanID < 0)
         createSimpleResearchPlan(cTechypMarketAmalgamation, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if (kbTechGetStatus(cTechypMarketSpiritMedicine) == cTechStatusObtainable)
   {
      OtherPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketSpiritMedicine);
      if (OtherPlanID < 0)
         createSimpleResearchPlan(cTechypMarketSpiritMedicine, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 900000)
      return;
   
   if (kbTechGetStatus(cTechypMarketWheelbarrow2) == cTechStatusObtainable)
   {
      OtherPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketWheelbarrow2);
      if (OtherPlanID < 0)
         createSimpleResearchPlan(cTechypMarketWheelbarrow2, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 1500000)
      return;
	  
   if (kbTechGetStatus(cTechypMarketCircularSaw) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechypMarketCircularSaw);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechypMarketCircularSaw, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
}

rule MarketUpgradeIII
inactive
minInterval 30
{  
   if (civIsNative()==false)
   {
      xsDisableSelf();
      return;
   }
   if(kbTechGetStatus(cTechForestSpiritCeremony) == cTechStatusActive)
   {
      xsDisableSelf();
	  return;
   }
   if((kbGetPopCap()-kbGetPop()) < 10)
      return;
   
   int FoodPlanID = -1;
   int WoodPlanID = -1;
   int GoldPlanID = -1;
   int OtherPlanID = -1;
   
   if(kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < 2 && cMyCiv == cCivXPAztec)
      return;
   
   if (kbTechGetStatus(cTechHuntingDogs) == cTechStatusObtainable)
   {
      FoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechHuntingDogs);
      if (FoodPlanID < 0)
         createSimpleResearchPlan(cTechHuntingDogs, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(kbGetAge() < cAge3 && cMyCiv == cCivXPIroquois)
      return;

   if (kbTechGetStatus(cTechPlacerMines) == cTechStatusObtainable)
   {
      GoldPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechPlacerMines);
      if (GoldPlanID < 0)
         createSimpleResearchPlan(cTechPlacerMines, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(kbGetAge() < cAge4 && cMyCiv == cCivXPAztec)
      return;
   if(xsGetTime() < 720000 && cMyCiv == cCivXPSioux)
      return;
	  
   if (kbTechGetStatus(cTechLumberCeremony) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechLumberCeremony);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechLumberCeremony, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 720000)
      return;
   
   if (kbTechGetStatus(cTechSpiritMedicine) == cTechStatusObtainable)
   {
      OtherPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechSpiritMedicine);
      if (OtherPlanID < 0)
         createSimpleResearchPlan(cTechSpiritMedicine, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 900000 && cMyCiv != cCivXPIroquois)
      return;
   
   if (kbTechGetStatus(cTechForestPeopleCeremony) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechForestPeopleCeremony);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechForestPeopleCeremony, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }
   if(xsGetTime() < 1200000)
      return;
   
   if (kbTechGetStatus(cTechForestSpiritCeremony) == cTechStatusObtainable)
   {
      WoodPlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechForestSpiritCeremony);
      if (WoodPlanID < 0)
         createSimpleResearchPlan(cTechForestSpiritCeremony, getUnit(gMarketUnit),cEconomyEscrowID, 91);
   }

}

rule initGather
inactive
group tcComplete
mininterval 5
{
   if(civIsNative() == true)
   {
      xsEnableRule("MarketUpgradeIII");
	  xsDisableSelf();
      return;
   }
   if (cMyCiv == cCivJapanese || cMyCiv == cCivChinese)
   {
      xsEnableRule("MarketUpgradeII");
	  xsDisableSelf();
      return;
   }
   if (cMyCiv == cCivSpanish || cMyCiv == cCivRussians || cMyCiv == cCivPortuguese || cMyCiv == cCivBritish)
   {
      xsEnableRule("MarketUpgradeI");
	  xsDisableSelf();
      return;
   }
   
   //start after crates gathered
   //if (getUnitCountByLocation(cUnitTypeAbstractResourceCrate, cPlayerRelationAny, cUnitStateABQ, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 20.0) > 1)
   if(kbUnitCount(cMyID, cUnitTypeAbstractResourceCrate,cUnitStateAlive) > 1)
   {
      return;
   }
   
   //build market?
   int noGold = 0;
   if(cMyCiv == cCivDutch || cMyCiv == cCivIndians || cMyCiv == cCivChinese || cMyCiv == cCivGermans)
      noGold = 1;
   int planID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gMarketUnit);
   
   if ( ((kbGetPopCap()-kbGetPop()) > 10) && (noGold == 0) )
   {
	  if ( (planID < 0) && (kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) < 1) )
      {     // Start a new one
         createSimpleBuildPlan(gMarketUnit, 1, 96, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);  // Just higher than house
         aiEcho("Starting a new market build plan.");
      }   
   }
   
   int unitt = gEconUnit;
   if(cMyCiv == cCivGermans)
      unitt = cUnitTypeSettlerWagon;

   if (gGoldPlanID == -1 && noGold == 0)
   {  // Initialize the plan
      gGoldPlanID = aiPlanCreate("Mine", cPlanGather);
      aiPlanSetBaseID(gGoldPlanID, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(gGoldPlanID, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeAbstractMine);
      aiPlanSetVariableInt(gGoldPlanID, cGatherPlanResourceType, 0, cAllResources);
	  aiPlanAddUnitType(gGoldPlanID, unitt, 1, 1, 1);
      aiPlanSetDesiredPriority(gGoldPlanID, 95);
      aiPlanSetActive(gGoldPlanID);
   }

    if((kbResourceGet(cResourceGold) > 50 || xsIsRuleEnabled("militaryManager") == true) && noGold == 0)
	{
		aiPlanAddUnitType(gGoldPlanID, unitt, 0, 0, 0);
	}
	
	static int woodPlanID = -1;
	if (woodPlanID == -1)
   {  // Initialize the plan
      woodPlanID = aiPlanCreate("Wood", cPlanGather);
      aiPlanSetBaseID(woodPlanID, kbBaseGetMainID(cMyID));
      aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeWood);
      aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceType, 0, cAllResources);
	  aiPlanAddUnitType(woodPlanID, unitt, 1, 1, 1);
      aiPlanSetDesiredPriority(woodPlanID, 95);
      aiPlanSetActive(woodPlanID);
   }
	if(cMyCiv == cCivDutch)
	   aiPlanAddUnitType(woodPlanID, unitt, 5, 5, 5);
	else if(cMyCiv == cCivIndians)
	   aiPlanAddUnitType(woodPlanID, unitt, 3, 3, 3);
	else if(cMyCiv == cCivGermans)
	   aiPlanAddUnitType(woodPlanID, unitt, 1, 1, 1);
	else if(cMyCiv == cCivBritish || cMyCiv == cCivOttomans)
	   aiPlanAddUnitType(woodPlanID, unitt, 0, 0, 0);
	else
	   aiPlanAddUnitType(woodPlanID, unitt, 2, 2, 2);
	
	
	
	if(cMyCiv == cCivIndians)
	{
		if(xsGetTime() > 210000 || kbResourceGet(cResourceWood) > 550 || kbGetAge() > cAge1)
		{
		   xsDisableSelf();
		   aiPlanDestroy(woodPlanID);
		   woodPlanID = -1;
		   xsEnableRule("MarketUpgradeII");
		   return;
		}	
	}
	else if(cMyCiv == cCivChinese)
	{
		if(xsGetTime() > 130000 || kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) > 2){
		   xsDisableSelf();
		   aiPlanDestroy(woodPlanID);
		   woodPlanID = -1;
		   gGoldPlanID = -2;
		   xsEnableRule("MarketUpgradeII");
		   return;
		}
	}
	else if(cMyCiv == cCivDutch)
	{
		if(xsGetTime() > 140000 || kbResourceGet(cResourceWood) > 350 || kbUnitCount(cMyID, cUnitTypeBank, cUnitStateAlive) > 0)
		{
		   xsDisableSelf();
		   aiPlanDestroy(woodPlanID);
		   woodPlanID = -1;
		   xsEnableRule("MarketUpgradeI");
		   return;
		}	
	}
	else if(cMyCiv == cCivGermans)
	{
		if(xsGetTime() > 70000 || kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) > 1)
		{
		   xsDisableSelf();
		   aiPlanDestroy(woodPlanID);
		   woodPlanID = -1;
		   xsEnableRule("MarketUpgradeI");
		   return;
		}	
	}
	else if((kbResourceGet(cResourceWood) >= 50 && kbUnitCount(cMyID, gMarketUnit, cUnitStateAlive) > 0) || (xsGetTime() > 120000))
	{
	   aiPlanDestroy(woodPlanID);
	   woodPlanID = -1;
	}
	
	
	if((cMyCiv == cCivBritish || cMyCiv == cCivOttomans || cMyCiv == cCivFrench) && (kbResourceGet(cResourceGold) > 50 || xsGetTime() > 90000))
	{
	   aiPlanDestroy(gGoldPlanID);
	   gGoldPlanID = -2;
	}
	if((woodPlanID == -1) && (kbResourceGet(cResourceGold) >= 50))
	{
	   xsDisableSelf();
	   xsEnableRule("MarketUpgradeI");
	   xsEnableRule("MarketUpgradeII");
	   xsEnableRule("MarketUpgradeIII");
	}
}

rule towerManager2
inactive
minInterval 15
{
   if (cvOkToFortify == false)
   {
      return;  // Oops.  I shouldn't be running.
   }
   
   static int towerUpgradePlan = -1;
   int numT = 1;
   if(getNavalTargetPlayer() > 0)
      numT = 2;
   

   if ( (kbUnitCount(cMyID, gTowerUnit, cUnitStateABQ) >= numT) && (kbUnitCount(cMyID, cUnitTypeOutpostWagon, cUnitStateAlive) <= 0) && (kbUnitCount(cMyID, cUnitTypeYPCastleWagon, cUnitStateAlive) <= 0) )
      return;  // We have enough, thank you, and no idle outpost wagons.
   
   if ( aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gTowerUnit) >= 0 )
      return;  // We're already building one.
   
    if (civIsAsian() == false) { //BHG: Asians have different outpost wagon types so it's ok to keep going
     if ( aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, cUnitTypeOutpost) >= 0 )
        return;  // We're already building one.  (Weird case of civs that don't usually make towers having an outpost wagon given to them.
    }
   
   // Need more, not currently building any.  Need to select a builder type (settler or outpostWagon) and a location.
   int builderType = -1;
   
   if ( (civIsAsian() == false) && (kbUnitCount(cMyID, cUnitTypeOutpostWagon, cUnitStateAlive) > 0) )
      builderType = cUnitTypeOutpostWagon;
   else if ( (civIsAsian() == true) && (kbUnitCount(cMyID, cUnitTypeYPCastleWagon, cUnitStateAlive) > 0) )
      builderType = cUnitTypeYPCastleWagon;
   else
      builderType = gEconUnit;
   
   //-------------
   int dQuery = getUnit(gDockUnit, cPlayerRelationSelf, cUnitStateABQ);
   if(dQuery < 0)
      return;
   int nQuery = getUnit(cUnitTypeAbstractWarShip, cPlayerRelationSelf, cUnitStateABQ);
   if(nQuery < 0 && xsGetTime() > 1200000)
      return;
   
   int attempt = 0;
   vector testVec = cInvalidVector;
   float spacingDistance = 12.0; // Mid- and corner-spots on a square with 'radius' spacingDistance, i.e. each side is 2 * spacingDistance.
   
   float exclusionRadius = spacingDistance / 2.0;
   float dx = spacingDistance;
   float dz = spacingDistance;
   static int towerSearch = -1;
   bool success = false;
   
   for (attempt = 0; < 10) // Take ten tries to place it
   {
      testVec = kbUnitGetPosition(dQuery); // Start with base location
      
      switch(aiRandInt(8)) // 0..7
      {  // Use 0.9 * on corners to "round them" a bit
         case 0:
         {  // W
            dx = -0.9 * dx;
            dz = 0.9 * dz;
            aiEcho("West...");
            break;
         }
         case 1:
         {  // NW
            dx = 0.0;
            aiEcho("Northwest...");
            break;
         }
         case 2:
         {  // N
            dx = 0.9 * dx;
            dz = 0.9 * dz;
            aiEcho("North...");
            break;
         }
         case 3:
         {  // NE
            dz = 0.0;
            aiEcho("NorthEast...");
            break;
         }
         case 4:
         {  // E
            dx = 0.9 * dx;
            dz = -0.9 * dz;
            aiEcho("East...");
            break;
         }
         case 5:
         {  // SE
            dx = 0.0;
            dz = -1.0 * dz;
            aiEcho("SouthEast...");
            break;
         }
         case 6:
         {  // S
            dx = -0.9 * dx;
            dz = -0.9 * dz;
            aiEcho("South...");
            break;
         }
         case 7:
         {  // SW
            dx = -1.0 * dx;
            dz = 0;
            aiEcho("SouthWest...");
            break;
         }
      }
      testVec = xsVectorSetX(testVec, xsVectorGetX(testVec) + dx);
      testVec = xsVectorSetZ(testVec, xsVectorGetZ(testVec) + dz);
      aiEcho("Testing tower location "+testVec);
      if (towerSearch < 0)
      {  // init
         towerSearch = kbUnitQueryCreate("Tower placement search");
         kbUnitQuerySetPlayerRelation(towerSearch, cPlayerRelationAny);
         kbUnitQuerySetUnitType(towerSearch, gTowerUnit);
         kbUnitQuerySetState(towerSearch, cUnitStateABQ);
      }
      kbUnitQuerySetPosition(towerSearch, testVec);
      kbUnitQuerySetMaximumDistance(towerSearch, exclusionRadius);
      kbUnitQueryResetResults(towerSearch);
      if (kbUnitQueryExecute(towerSearch) < 1)
      {  // Site is clear, use it
         if ( kbAreaGroupGetIDByPosition(testVec) == kbAreaGroupGetIDByPosition(kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID))) )
         {  // Make sure it's in same areagroup.
            success = true;
            break;
         }
		 //success = true;
		 //break;
      }
   }
   
   // We have found a location (success == true) or we need to just do a brute force placement around the TC.
   if (success == false)
      //testVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
	  return;
   
   int buildPlan=aiPlanCreate("Tower build plan ", cPlanBuild);
   // What to build
   if ( (builderType == cUnitTypeOutpostWagon) && (civIsAsian() == false) )
      aiPlanSetVariableInt(buildPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeOutpost);
   else if (cMyCiv == cCivXPSioux)
      aiPlanSetVariableInt(buildPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeWarHut);
   else
      aiPlanSetVariableInt(buildPlan, cBuildPlanBuildingTypeID, 0, gTowerUnit);
   // Priority.
   aiPlanSetDesiredPriority(buildPlan, 85);
   // Econ, because mil doesn't get enough wood.
   aiPlanSetMilitary(buildPlan, false);
   aiPlanSetEconomy(buildPlan, true);
   // Escrow.
   aiPlanSetEscrowID(buildPlan, cEconomyEscrowID);
   // Builders.
   aiPlanAddUnitType(buildPlan, builderType, 1, 2, 2);

   // Instead of base ID or areas, use a center position and falloff.
   aiPlanSetVariableVector(buildPlan, cBuildPlanCenterPosition, 0, testVec);
   if (success == true)
      aiPlanSetVariableFloat(buildPlan, cBuildPlanCenterPositionDistance, 0, exclusionRadius);
   else
      aiPlanSetVariableFloat(buildPlan, cBuildPlanCenterPositionDistance, 0, 50.0);

   // Add position influence for nearby towers
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitTypeID, 0, gTowerUnit);   // Russian's won't notice ally towers and vice versa...oh well.
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitDistance, 0, spacingDistance);    
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluenceUnitValue, 0, -20.0);        // -20 points per tower
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluenceUnitFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff

   // Weight it to stay very close to center point.
   aiPlanSetVariableVector(buildPlan, cBuildPlanInfluencePosition, 0, testVec);    // Position influence for landing position
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionDistance, 0, exclusionRadius);     // 100m range.
   aiPlanSetVariableFloat(buildPlan, cBuildPlanInfluencePositionValue, 0, 10.0);        // 10 points for center
   aiPlanSetVariableInt(buildPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);  // Linear slope falloff

   aiEcho("Starting building plan ("+buildPlan+") for tower at location "+testVec);
   aiEcho("Cheapest tech for tower buildings is "+ kbGetTechName(kbTechTreeGetCheapestUnitUpgrade(gTowerUnit)) );
   aiEcho("Cheapest tech ID is "+kbTechTreeGetCheapestUnitUpgrade(gTowerUnit));
   aiPlanSetActive(buildPlan);
}

rule FFmonitor2
inactive
mininterval 10
{
   if(kbGetAge() < cAge2)
      return;
   
   if((kbResourceGet(cResourceGold) < 1000) && (kbResourceGet(cResourceFood) > 2000))
   {
      aiSellResourceOnMarket(cResourceFood);
   }
   if((kbResourceGet(cResourceGold) > 1600) && (kbResourceGet(cResourceFood) < 1200))
   {
      aiBuyResourceOnMarket(cResourceFood);
   }
   
   if((kbGetAge() > cAge2) && (cMyCiv == cCivFrench))
   {
      if(kbResourceGet(cResourceGold) < 1000 && kbResourceGet(cResourceFood) > 600)
	     aiSellResourceOnMarket(cResourceFood);
   }
   if((kbGetAge() > cAge2) && (cMyCiv == cCivChinese))
   {
	  if(kbResourceGet(cResourceGold) < 1100 && kbResourceGet(cResourceFood) > 300)
	     aiSellResourceOnMarket(cResourceFood);
   }
   if((kbGetAge() > cAge2) && (cMyCiv == cCivIndians))
   {
      if(kbResourceGet(cResourceGold) > 200 && kbResourceGet(cResourceFood) < 600)
	     aiBuyResourceOnMarket(cResourceFood);
   }
   
   if ((xsIsRuleEnabled("militaryManager") == false) && (cMyCiv != cCivFrench))
   {
		xsEnableRule("militaryManager");
        militaryManager();   // runImmediately doesn't work.
   }
   else if(kbGetAge() > cAge2)
      xsDisableSelf();
   
}

rule FFmonitor
inactive
mininterval 10
{
   if(kbGetAge() < cAge2)
      return;
   
   if((kbResourceGet(cResourceGold) < 1000) && (kbResourceGet(cResourceFood) > 1600))
   {
      aiSellResourceOnMarket(cResourceFood);
   }
   if((kbResourceGet(cResourceGold) > 1200) && (kbResourceGet(cResourceFood) < 1200) && (cMyCiv != cCivFrench))
   {
      aiBuyResourceOnMarket(cResourceFood);
   }
   if((kbResourceGet(cResourceGold) > 1300) && (kbResourceGet(cResourceWood) < 110) && (cMyCiv == cCivFrench))
   {
      aiBuyResourceOnMarket(cResourceWood);
   }
   if((kbResourceGet(cResourceGold) > 900) && (kbResourceGet(cResourceFood) > 1300) && (aiPlanGetState(gAgeUpResearchPlan) >= 0) && (cMyCiv == cCivIndians))
   {
      aiSellResourceOnMarket(cResourceFood);
   }
   
}

rule age1Monitor
inactive
group tcComplete
mininterval 15
{
   //static int woodPlanID = -1;
   static int done = -1;
   int houseBuildPlanID = aiPlanGetIDByTypeAndVariableType(cPlanBuild, cBuildPlanBuildingTypeID, gHouseUnit);
   int needHouse = 1;
   
   if(kbGetCiv() == cCivXPAztec || kbGetCiv() == cCivIndians || kbGetCiv() == cCivGermans || kbGetCiv() == cCivChinese)
      needHouse = 2;
   else if(kbGetCiv() == cCivBritish)
      needHouse = 3;
   else if(kbGetCiv() == cCivJapanese || kbGetCiv() == cCivXPSioux)
      needHouse = 0;
   if ( (houseBuildPlanID < 0) && (kbUnitCount(cMyID, gHouseUnit, cUnitStateAlive) < needHouse) ) 
   {  // Start a new one  
      createSimpleBuildPlan(gHouseUnit, 1, 95, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 1);
      aiEcho("Starting a new house build plan.");
   }
   
   if(kbGetAge() > cAge1)
   {
      xsDisableSelf();
	  if(cMyCiv == cCivSpanish ||
	  cMyCiv == cCivRussians ||
	  cMyCiv == cCivPortuguese ||
	  cMyCiv == cCivOttomans ||
	  cMyCiv == cCivBritish ||
	  cMyCiv == cCivDutch)
	  {
		 xsEnableRule("houseMonitor");
		 xsEnableRule("rushMonitor");
		 return;
	  }
	  else if(cMyCiv == cCivJapanese)
	  {
		 xsEnableRule("houseMonitor2");
		 xsEnableRule("houseMonitor3");
	  }
	  else if(cMyCiv == cCivGermans)
	  {
		 xsEnableRule("houseMonitor");
		 //xsEnableRule("woodKeeper");
	  }
	  else if(cMyCiv == cCivXPIroquois)
	     xsEnableRule("rushMonitor");
	  
	  if (cMyCiv == cCivXPIroquois && xsIsRuleEnabled("houseMonitor") == false)
         xsEnableRule("houseMonitor");
	  if (xsIsRuleEnabled("militaryManager") == false)
      {
         xsEnableRule("militaryManager");
         aiEcho("Enabling the military manager.");
		 militaryManager();   // runImmediately doesn't work.
      }
   }
   if (aiPlanGetState(gAgeUpResearchPlan) >= 0)
   {
      if(cMyCiv == cCivXPIroquois)
	  {
		 if(done == -1)
		 {
			xsEnableRule("houseMonitor");
			done = 1;
		 }
		 return;
	  }
	  else if(cMyCiv == cCivIndians ||
	  cMyCiv == cCivChinese ||
	  cMyCiv == cCivFrench ||
	  cMyCiv == cCivXPAztec)
	  {
	     xsDisableSelf();
		 xsEnableRule("houseMonitor");
		 if(cMyCiv == cCivIndians || cMyCiv == cCivFrench || cMyCiv == cCivChinese)
		    xsEnableRule("FFmonitor2");
		 else
		    gGoldPlanID = -2;

		 return;
	  }
	  
	  if((cMyCiv == cCivBritish ||
	  cMyCiv == cCivChinese ||
	  cMyCiv == cCivIndians ||
	  cMyCiv == cCivXPAztec ||
	  cMyCiv == cCivPortuguese) &&
	  done == -1)
	  {
	     xsEnableRule("littleChop");
		 done = 1;
	  }
	  else if((cMyCiv == cCivOttomans ||
	  cMyCiv == cCivDutch ||
	  cMyCiv == cCivSpanish) &&
	  done == -1)
	  {
	     xsEnableRule("woodKeeper");
		 done = 1;
	  }
   }
}

rule littleChop
inactive
mininterval 10
{
   static int woodPlanID=-1;
   int num = kbUnitCount(cMyID, gEconUnit, cUnitStateAlive);
   if(cMyCiv == cCivBritish)
      num = num - 5;
   else if(cMyCiv == cCivDutch)
      num = 5;
   else if(cMyCiv == cCivOttomans || cMyCiv == cCivPortuguese)
      num = num/3;
   else
      num = (num/2)+1;
      
   if(kbUnitCount(cMyID, gRushBuilding1, cUnitStateABQ) > 0 ||
   kbUnitCount(cMyID, gRushBuilding2, cUnitStateABQ) > 0)
   {
	  xsDisableSelf();
	  if(woodPlanID != -1)
	     aiPlanDestroy(woodPlanID);
	  return;
   }
   if (woodPlanID < 0)
      {  // Initialize the plan
         woodPlanID = aiPlanCreate("Wood", cPlanGather);
         aiPlanSetBaseID(woodPlanID, kbBaseGetMainID(cMyID));
         aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeWood);
         aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceType, 0, cAllResources);
	     aiPlanAddUnitType(woodPlanID, gEconUnit, num, num, num);
         aiPlanSetDesiredPriority(woodPlanID, 95);
         aiPlanSetActive(woodPlanID);
      }
}

rule woodKeeper
inactive
mininterval 14
{
   static int woodPlanID=-1;
   int num = 2;
   //if(cMyCiv != cCivOttomans)
      //num = 2;
      
   if(kbGetAge() > cAge2)
   {
	  xsDisableSelf();
	  if(woodPlanID != -1)
	     aiPlanDestroy(woodPlanID);
	  return;
   }
   if (woodPlanID < 0)
      {  // Initialize the plan
         woodPlanID = aiPlanCreate("Wood", cPlanGather);
         aiPlanSetBaseID(woodPlanID, kbBaseGetMainID(cMyID));
         aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceUnitTypeFilter, 0, cUnitTypeWood);
         aiPlanSetVariableInt(woodPlanID, cGatherPlanResourceType, 0, cAllResources);
	     aiPlanAddUnitType(woodPlanID, gEconUnit, num, num, num);
         aiPlanSetDesiredPriority(woodPlanID, 94);
         aiPlanSetActive(woodPlanID);
      }
}

rule startCardsHandle
inactive
group tcComplete
mininterval 10
{
   if(xsGetTime() > 40000)
   {
      xsDisableSelf();
	  setShipValue();
	  //sendChatToAllies("");
   }
}

rule insertEye
inactive
group tcComplete
mininterval 45
{
   if(cMyCiv == cCivXPSioux)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 1200000)
   {
      return;
   }
   
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   vector center = kbGetMapCenter();
   vector targetLocation = cInvalidVector;
   
   int treeQuery = getUnit(cUnitTypeTree, cPlayerRelationAny, cUnitStateABQ);
   
   targetLocation = kbUnitGetPosition(treeQuery);
   int tcQuery = getUnitByLocation(cUnitTypeTownCenter, cPlayerRelationAny, cUnitStateABQ, targetLocation, 60.0);
   int wcQuery = getUnitCountByLocation(cUnitTypeWallConnector, cPlayerRelationSelf, cUnitStateABQ, targetLocation, 30.0);
   if((tcQuery >= 0) || (wcQuery > 0))
      return;
   
   int wcPlan=aiPlanCreate("wall connector plan", cPlanBuild);
   aiPlanSetVariableInt(wcPlan, cBuildPlanBuildingTypeID, 0, cUnitTypeWallConnector);
   aiPlanSetVariableVector(wcPlan, cBuildPlanCenterPosition, 0, targetLocation);
   aiPlanSetVariableFloat(wcPlan, cBuildPlanCenterPositionDistance, 0, 15.0);
   aiPlanSetDesiredPriority(wcPlan, 99);
   aiPlanSetMilitary(wcPlan, false);
   aiPlanSetEconomy(wcPlan, true);
   aiPlanSetEscrowID(wcPlan, cEconomyEscrowID);
   aiPlanAddUnitType(wcPlan, gEconUnit, 1, 1, 1);
   aiPlanSetVariableVector(wcPlan, cBuildPlanInfluencePosition, 0, targetLocation); 
   aiPlanSetVariableFloat(wcPlan, cBuildPlanInfluencePositionDistance, 0, 100.0);
   aiPlanSetVariableFloat(wcPlan, cBuildPlanInfluencePositionValue, 0, 200.0);
   aiPlanSetVariableInt(wcPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(wcPlan);
}

rule runHorse
inactive
group tcComplete
mininterval 6
{  // Broke this out separately (from navyManager) so that scenarios that start with a pre-made navy will work.
   if (cvInactiveAI == true || cMyCiv == cCivIndians || cMyCiv == cCivXPAztec)
   {
      xsDisableSelf();
      return;
   }
   if(xsGetTime() < 660000)
   {
      return;
   }
   static int offset = 0;
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   vector center = kbGetMapCenter();
   int sf1 = getUnit(cUnitTypeSettler, cPlayerRelationEnemy, cUnitStateABQ);
   int sf2 = getUnit(cUnitTypeCoureur, cPlayerRelationEnemy, cUnitStateABQ);
   int sf3 = getUnit(cUnitTypeSettlerNative, cPlayerRelationEnemy, cUnitStateABQ);
   int sf4 = getUnit(cUnitTypeypSettlerAsian, cPlayerRelationEnemy, cUnitStateABQ);
	
	if(sf1 < 0 && sf2 < 0 && sf3 < 0 && sf4 < 0)
	   return;
	   
	  if (gtestPlan1 < 0)  // There's something to attack
      {
         gtestPlan1 = aiPlanCreate("random attack 1", cPlanAttack);
		 aiPlanSetVariableInt(gtestPlan1, cAttackPlanPlayerID, 0, getRandomPlayerByRelation(cPlayerRelationEnemy));
		 aiPlanSetVariableInt(gtestPlan1, cAttackPlanTargetTypeID, 0, cUnitTypeLogicalTypeAffectedByTownBell);
         aiPlanSetVariableVector(gtestPlan1, cAttackPlanGatherPoint, 0, mainBaseVec);
         aiPlanSetVariableFloat(gtestPlan1, cAttackPlanGatherDistance, 0, 38.0);
         aiPlanSetVariableInt(gtestPlan1, cAttackPlanRefreshFrequency, 0, 5);
         aiPlanSetDesiredPriority(gtestPlan1, 80);
		 if(cMyCiv == cCivRussians)
			aiPlanAddUnitType(gtestPlan1, cUnitTypeOprichnik, 3, 4, 5);
		 else if(cMyCiv == cCivBritish)
			aiPlanAddUnitType(gtestPlan1, cUnitTypeLongbowman, 4, 5, 6); 
		 else if(cMyCiv != cCivXPAztec)
			aiPlanAddUnitType(gtestPlan1, cUnitTypeAbstractCavalry, 3, 4, 4); 
		 else
			aiPlanAddUnitType(gtestPlan1, cUnitTypeAbstractLightInfantry, 5, 6, 7); 
         aiPlanSetInitialPosition(gtestPlan1, mainBaseVec);
         aiPlanSetActive(gtestPlan1, true);
		 
	  } 
	  else
		offset = offset+1;
	if(offset == 30){
		offset = 0;
		aiPlanDestroy(gtestPlan1);
		gtestPlan1 = -1;
	}
}

rule rushMonitor
inactive
mininterval 15
{
   
   static int wcPlan = -1;
   static int wcPlan2 = -1;
   static int q1 = 0;
   
   int u1 = cUnitTypeMusketeer;
   
   if(cMyCiv == cCivOttomans)
   {
      u1 = cUnitTypeJanissary;
   }
   else if(cMyCiv == cCivXPIroquois)
   {
      u1 = cUnitTypexpTomahawk;
   }
   else if(cMyCiv == cCivPortuguese)
   {
      u1 = cUnitTypeCrossbowman;
   }
   else if(cMyCiv == cCivDutch)
   {
      u1 = cUnitTypeSkirmisher;
   }
   else if(cMyCiv == cCivJapanese)
   {
      u1 = cUnitTypeypKensei;
   }
   
   if(grushPlan < 0)
   {
      grushPlan = createSimpleMaintainPlan(u1, 15, false, kbBaseGetMainID(cMyID),5);
   }
   
   //prepare fb
   if(cMyCiv == cCivXPSioux || cMyCiv == cCivXPIroquois || cMyCiv == cCivJapanese)
      return;
   
   int sQuery = getUnitByLocation(gRushBuilding2, cPlayerRelationSelf, cUnitStateAlive, gFbVec, 50.0);
   
   if(cMyCiv == cCivXPIroquois || sQuery < 0)
      sQuery = getUnitByLocation(gRushBuilding1, cPlayerRelationSelf, cUnitStateAlive, gFbVec, 50.0);
   
   q1 = q1 + 1;
   if(q1 == 9)
   {
      xsDisableSelf();
	  if(wcPlan != -1)
	     aiPlanDestroy(wcPlan);
	  if(wcPlan2 != -1)
	     aiPlanDestroy(wcPlan2);
	  return;
   }
   else if(sQuery >= 0 || (xsGetTime() - gAgeUpTime) > 90000) //150000
   {
	  if (xsIsRuleEnabled("militaryManager") == false)
      {
         xsEnableRule("militaryManager");
         aiEcho("Enabling the military manager.");
         militaryManager();   // runImmediately doesn't work.
      }
	  
	  if(sQuery >= 0)
	  {
		 moveDefenseReflex(kbUnitGetPosition(sQuery), cvDefenseReflexRadiusActive, kbUnitGetBaseID(sQuery));
	  }
	  return;
   }
   
   if(wcPlan != -1)
      return;
   
   vector Offset = gFbVec - kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   vector v = cInvalidVector;
   float f = 0.25;
   v = Offset*f;
   //gForwardBaseLocation = gFbVec - v;
   
   wcPlan=aiPlanCreate("dog plan", cPlanBuild);
   aiPlanSetVariableInt(wcPlan, cBuildPlanBuildingTypeID, 0, gRushBuilding1);
   aiPlanSetVariableVector(wcPlan, cBuildPlanCenterPosition, 0, gFbVec-v);
   aiPlanSetVariableFloat(wcPlan, cBuildPlanCenterPositionDistance, 0, 35.0);
   aiPlanSetDesiredPriority(wcPlan, 97);
   aiPlanSetMilitary(wcPlan, true);
   aiPlanSetEconomy(wcPlan, false);
   aiPlanSetEscrowID(wcPlan, cMilitaryEscrowID);
   aiPlanAddUnitType(wcPlan, gEconUnit, 2, 2, 2);
   aiPlanSetVariableVector(wcPlan, cBuildPlanInfluencePosition, 0, gFbVec-v); 
   aiPlanSetVariableFloat(wcPlan, cBuildPlanInfluencePositionDistance, 0, 20.0);
   aiPlanSetVariableFloat(wcPlan, cBuildPlanInfluencePositionValue, 0, 40.0);
   aiPlanSetVariableInt(wcPlan, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(wcPlan);
   
   f = 0.5;
   v = Offset*f;
   //gForwardBaseLocation = gFbVec - v;
   
   wcPlan2=aiPlanCreate("dog plan2", cPlanBuild);
   aiPlanSetVariableInt(wcPlan2, cBuildPlanBuildingTypeID, 0, gRushBuilding2);
   aiPlanSetVariableVector(wcPlan2, cBuildPlanCenterPosition, 0, gFbVec-v);
   aiPlanSetVariableFloat(wcPlan2, cBuildPlanCenterPositionDistance, 0, 35.0);
   aiPlanSetDesiredPriority(wcPlan2, 97);
   aiPlanSetMilitary(wcPlan2, true);
   aiPlanSetEconomy(wcPlan2, false);
   aiPlanSetEscrowID(wcPlan2, cMilitaryEscrowID);
   aiPlanAddUnitType(wcPlan2, gEconUnit, 2, 2, 2);
   aiPlanSetVariableVector(wcPlan2, cBuildPlanInfluencePosition, 0, gFbVec-v); 
   aiPlanSetVariableFloat(wcPlan2, cBuildPlanInfluencePositionDistance, 0, 20.0);
   aiPlanSetVariableFloat(wcPlan2, cBuildPlanInfluencePositionValue, 0, 40.0);
   aiPlanSetVariableInt(wcPlan2, cBuildPlanInfluencePositionFalloff, 0, cBPIFalloffLinear);
   aiPlanSetActive(wcPlan2);
   
   if (gDefenseReflex == false)
      endDefenseReflex();
}

rule dogMonitor
inactive
group tcComplete
mininterval 16
{  // Broke this out separately (from navyManager) so that scenarios that start with a pre-made navy will work.
   
   static int q1 = 0;
   if (cvInactiveAI == true || cMyCiv == cCivXPSioux || cMyCiv == cCivFrench)
   {
      xsDisableSelf();
      return;
   }
   
   if(aiRandInt(100) < 20)
   {
      return;
   }
   if(gtestPlan2 < 0 && (kbGetAge() == cAge3 || xsGetTime() > 540000))
   {
      xsDisableSelf();
	  gtestPlan2 = -1;
	  if(grushPlan != -1)
	  {
	     aiPlanDestroy(grushPlan);
		 grushPlan = -1;
	  }
	  return;
   }
   
   int numTroop = kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive);
	
	if(q1 != 0)
	   q1 = q1+1;
	else if(q1 > 20)
	{
	   xsDisableSelf();
	   aiPlanDestroy(gtestPlan2);
	   gtestPlan2 = -1;
	}
	  
	if (cMyCiv == cCivOttomans)
	   numTroop = numTroop+5;
	if(numTroop < 25)
	   return;
	   
	  if (getDogTargetPlayer() > 0 && q1 == 0)  // There's something to attack
      {
         gtestPlan2 = aiPlanCreate("dog attack 1", cPlanAttack);
		 aiPlanSetVariableInt(gtestPlan2, cAttackPlanPlayerID, 0, getDogTargetPlayer());
		 aiPlanSetNumberVariableValues(gtestPlan2, cAttackPlanTargetTypeID, 3, true);
		 aiPlanSetVariableInt(gtestPlan2, cAttackPlanTargetTypeID, 0, cUnitTypeTownCenter);
         aiPlanSetVariableInt(gtestPlan2, cAttackPlanTargetTypeID, 1, cUnitTypeLogicalTypeBuildingsNotWalls);
         aiPlanSetVariableInt(gtestPlan2, cAttackPlanTargetTypeID, 2, cUnitTypeUnit);
         aiPlanSetVariableVector(gtestPlan2, cAttackPlanGatherPoint, 0, gFbVec);
         aiPlanSetVariableFloat(gtestPlan2, cAttackPlanGatherDistance, 0, 100.0);
         aiPlanSetVariableInt(gtestPlan2, cAttackPlanRefreshFrequency, 0, 5);
         aiPlanSetDesiredPriority(gtestPlan2, 97);
		 aiPlanAddUnitType(gtestPlan2, cUnitTypeLogicalTypeLandMilitary, 1, numTroop, 2*numTroop); 
         aiPlanSetInitialPosition(gtestPlan2, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)));
         aiPlanSetActive(gtestPlan2, true);
		 q1 = 1;
		 if(grushPlan != -1)
		 {
		    aiPlanDestroy(grushPlan);
			grushPlan = -1;
		 }
	  } 
	  
}

rule dogMonitor2
inactive
mininterval 16
{
   
   if (cMyCiv != cCivFrench)
   {
      xsDisableSelf();
      return;
   }
   
   int numTroop = kbUnitCount(cMyID, cUnitTypeLogicalTypeLandMilitary, cUnitStateAlive);
   if (kbGetAge() < cAge3 || numTroop < 21)
      return;
   
   vector mainBaseVec = kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID));
   static int attackPlan = -1;
	   
	if (getDogTargetPlayer() > 0)  // There's something to attack
    {
	  attackPlan = aiPlanCreate("any attack plan", cPlanAttack);
         aiPlanSetVariableInt(attackPlan, cAttackPlanPlayerID, 0, getDogTargetPlayer());
         aiPlanSetNumberVariableValues(attackPlan, cAttackPlanTargetTypeID, 2, true);
         aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 0, cUnitTypeTownCenter);
		 aiPlanSetVariableInt(attackPlan, cAttackPlanTargetTypeID, 1, cUnitTypeUnit);
         aiPlanSetVariableVector(attackPlan, cAttackPlanGatherPoint, 0, mainBaseVec);
         aiPlanSetVariableFloat(attackPlan, cAttackPlanGatherDistance, 0, 30.0);
         aiPlanSetVariableInt(attackPlan, cAttackPlanRefreshFrequency, 0, 5);
         aiPlanSetDesiredPriority(attackPlan, 96);
         aiPlanAddUnitType(attackPlan, cUnitTypeLogicalTypeLandMilitary, numTroop, numTroop, 2*numTroop); 
         aiPlanSetInitialPosition(attackPlan, mainBaseVec);
         aiPlanSetActive(attackPlan, true);
		 xsDisableSelf();
	}
	  
}

rule defendTest
inactive
group tcComplete
minInterval 15
{
   if (kbGetCiv() == cCivXPSioux)
   {
      xsDisableSelf();
      return;
   }
   
   int numEnemy = getUnitCountByLocation(cUnitTypeLogicalTypeLandMilitary, cPlayerRelationEnemy, cUnitStateAlive, kbBaseGetLocation(cMyID, kbBaseGetMainID(cMyID)), 40.0);
   static int times = 0;
   if (gDefenseReflexBaseID == kbBaseGetMainID(cMyID) && gGoldPlanID > -1) 
   {
      aiPlanDestroy(gGoldPlanID);
	  gGoldPlanID = -2;
   }
   if(numEnemy < 10 || kbGetAge() < cAge2)
      return;
   
   if((cMyCiv == cCivIndians) && (kbTechGetStatus(cTechypConsulateOttomansSettlerCombat) == cTechStatusObtainable))
      createSimpleResearchPlan(cTechypConsulateOttomansSettlerCombat, cUnitTypeypConsulate, cMilitaryEscrowID, 99);
   if (cMyCiv == cCivXPAztec && kbGetAge() > cAge2)
   {
      createSimpleResearchPlan(cTechBigAztecRaidingParty, -1, cMilitaryEscrowID, 80);
      createSimpleResearchPlan(cTechBigAztecScoutingParty, -1, cMilitaryEscrowID, 80);
   }
   
   if(times > 10)
      xsDisableSelf();
   
   if(times == 0 || times == 4 || times == 8)
      createSimpleBuildPlan(gTowerUnit, 1, 93, true, cEconomyEscrowID, kbBaseGetMainID(cMyID), 4);
   times = times+1;
}

rule musketForceUpgrade
inactive
group tcComplete
minInterval 30
{
   int numTroop = kbUnitCount(cMyID, cUnitTypeMusketeer, cUnitStateAlive);
   int PlanID = -1;
   if(kbGetAge() < cAge3 || numTroop < 25)
      return;
   
   if (kbTechGetStatus(cTechVeteranMusketeers) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechVeteranMusketeers);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechVeteranMusketeers, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 86);
   }
   if(kbGetAge() < cAge4 || numTroop < 30)
      return;
   
   if (kbTechGetStatus(cTechGuardMusketeers) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechGuardMusketeers);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechGuardMusketeers, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 76);
   }
   if (kbTechGetStatus(cTechRGRedcoats) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechRGRedcoats);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechRGRedcoats, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 76);
   }
   if (kbTechGetStatus(cTechRGGuerreiros) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechRGGuerreiros);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechRGGuerreiros, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 76);
   }
   if(kbGetAge() < cAge5 || numTroop < 35)
      return;
   
   if (kbTechGetStatus(cTechImperialRedcoat) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechImperialRedcoat);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechImperialRedcoat, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 66);
   }
   if (kbTechGetStatus(cTechImperialMusketeers) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechImperialMusketeers);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechImperialMusketeers, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 66);
   }
}

rule lbForceUpgrade
inactive
group tcComplete
minInterval 30
{
   if (cMyCiv != cCivBritish)
   {
      xsDisableSelf();
      return;
   }
   int numTroop = kbUnitCount(cMyID, cUnitTypeLongbowman, cUnitStateAlive);
   int PlanID = -1;
   if(kbGetAge() < cAge3 || numTroop < 20)
      return;
   
   if (kbTechGetStatus(cTechVeteranLongbowmen) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechVeteranLongbowmen);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechVeteranLongbowmen, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 86);
   }

}

rule uhlanForceUpgrade
inactive
group tcComplete
minInterval 30
{
   if (cMyCiv != cCivGermans)
   {
      xsDisableSelf();
      return;
   }
   int numTroop = kbUnitCount(cMyID, cUnitTypeUhlan, cUnitStateAlive);
   int PlanID = -1;
   if(kbGetAge() < cAge3 || numTroop < 15)
      return;
   
   if (kbTechGetStatus(cTechVeteranUhlans) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechVeteranUhlans);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechVeteranUhlans, getUnit(cUnitTypeStable),cMilitaryEscrowID, 86);
   }

}

rule dopForceUpgrade
inactive
group tcComplete
minInterval 30
{
   if (cMyCiv != cCivGermans)
   {
      xsDisableSelf();
      return;
   }
   int numTroop = kbUnitCount(cMyID, cUnitTypeUhlan, cUnitStateAlive);
   int PlanID = -1;
   if(kbGetAge() < cAge3 || numTroop < 15)
      return;
   
   if (kbTechGetStatus(cTechVeteranDopplesoldners) == cTechStatusObtainable)
   {
      PlanID = aiPlanGetIDByTypeAndVariableType(cPlanResearch, cResearchPlanTechID, cTechVeteranDopplesoldners);
      if (PlanID < 0)
         createSimpleResearchPlan(cTechVeteranDopplesoldners, getUnit(cUnitTypeBarracks),cMilitaryEscrowID, 86);
   }

}

rule ransom1
inactive
minInterval 60
{
   aiRansomExplorer(getUnit(cUnitTypeExplorer), cMilitaryEscrowID, getUnit(cUnitTypeTownCenter));
}

rule addtionalChat
inactive
minInterval 10
{

   if(fireDanceCheck() > 5)
   {
      sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyJustBeforeAttack);
	  sendStatement(cPlayerRelationEnemy, cAICommPromptToEnemyBattleStartMyFavor);
   }
   
   if(getUnit(cUnitTypeAbstractWall, cPlayerRelationEnemy, cUnitStateABQ) > 0)
      sendStatement(cPlayerRelationEnemy, 168);
}

rule testMonitor
inactive
minInterval 10
{
   return;
}