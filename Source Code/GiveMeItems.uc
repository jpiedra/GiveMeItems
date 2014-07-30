//=============================================================================
// GiveMeItems.
//=============================================================================
class GiveMeItems expands Mutator config(GiveMeItems);

var() config int destroyTime;
var() config String ItemChoice[24];
var class<Inventory> IVar[24];
var int i;
var float Selection;



function PreBeginPlay()
{
 	log("~GiveMeItems - 6/11/2014~");
	log("Initializing Items to load for Monsters...");

	//see below.
	SetTimer(destroyTime, true);
	

	for (i = 0; i < 24; i++){
		IVar[i] = class<Inventory>(DynamicLoadObject(ItemChoice[i], class'Class'));				
		if (IVar[i] == None){
				log("GiveMeItems: Invalid Class for ItemChoice["$i$"], substituting...");
				IVar[i] = class'unrealshare.bandages';} 
		IVar[i].default.event = 'GMIMutDeleteMe';
		
	}
   
}


function Timer(){

	local inventory inv;

	foreach allactors(class'inventory', inv){
		if (inv.event == 'GMIMutDeleteMe' && inv.IsInState('pickup')){
			inv.destroy();}
		}
}

function bool CheckReplacement(Actor Other, out byte bSuperRelevant) 
{ 
		
	Selection = Rand(24);
		
	if (Selection < 24){
    	 if(Other.IsA('ScriptedPawn') &&  ScriptedPawn(Other).DropWhenKilled == None)
    	 { 
       			
			ScriptedPawn(Other).DropWhenKilled = IVar[Selection];
	 	 } 
 	}


return true; 
            
}

defaultproperties
{
     destroyTime=40
     ItemChoice(0)="exu.shockflare"
     ItemChoice(1)="exu.shockflare"
     ItemChoice(2)="exu.shockflare"
     ItemChoice(3)="exu.plasmasprayerflare"
     ItemChoice(4)="exu.plasmasprayerflare"
     ItemChoice(5)="exu.plasmasprayerflare"
     ItemChoice(6)="botpack.healthvial"
     ItemChoice(7)="botpack.healthvial"
     ItemChoice(8)="botpack.healthvial"
     ItemChoice(9)="exu.blastbapes"
     ItemChoice(10)="exu.fuckercola"
     ItemChoice(11)="exu.fuckercola"
     ItemChoice(12)="botpack.healthvial"
     ItemChoice(13)="botpack.healthvial"
     ItemChoice(14)="botpack.healthvial"
     ItemChoice(15)="botpack.healthvial"
     ItemChoice(16)="exu.hellgun"
     ItemChoice(17)="exu.hellgun"
     ItemChoice(18)="exu.fuckercola"
     ItemChoice(19)="exu.fuckercola"
     ItemChoice(20)="exu.fuckercola"
     ItemChoice(21)="exu.blastbapes"
     ItemChoice(22)="botpack.healthvial"
     ItemChoice(23)="botpack.healthvial"
}
