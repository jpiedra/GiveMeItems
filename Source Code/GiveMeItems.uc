//=============================================================================
// GiveMeItems...
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
     destroyTime=20
     ItemChoice(0)="unreali.bandages"
     ItemChoice(1)="unreali.bandages"
     ItemChoice(2)="unreali.bandages"
     ItemChoice(3)="unreali.bandages"
     ItemChoice(4)="unreali.bandages"
     ItemChoice(5)="unreali.bandages"
     ItemChoice(6)="unreali.bandages"
     ItemChoice(7)="unreali.bandages"
     ItemChoice(8)="unreali.bandages"
     ItemChoice(9)="unreali.bandages"
     ItemChoice(10)="unreali.bandages"
     ItemChoice(11)="unreali.bandages"
     ItemChoice(12)="unreali.bandages"
     ItemChoice(13)="unreali.bandages"
     ItemChoice(14)="unreali.bandages"
     ItemChoice(15)="unreali.bandages"
     ItemChoice(16)="unreali.bandages"
     ItemChoice(17)="unreali.bandages"
     ItemChoice(18)="unreali.bandages"
     ItemChoice(19)="unreali.bandages"
     ItemChoice(20)="unreali.bandages"
     ItemChoice(21)="unreali.bandages"
     ItemChoice(22)="unreali.bandages"
     ItemChoice(23)="unreali.bandages"
}
