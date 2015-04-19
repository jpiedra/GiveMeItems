//=============================================================================
// GMIPageWindowA.
//=============================================================================
class GMIPageWindowA expands UMenuPageWindow config(GiveMeItems);

var UWindowSmallCloseButton CloseButton;
var UWindowLabelControl Credits;

var int i;
var int j;
var int y;
var int yb;
var int d_count;

var UWindowLabelControl AddStatus[12];
var UWindowLabelControl SuggestedAmmo[12];
var UWindowComboControl WeaponControl_A[12];
var UWindowSmallButton Randomize_D;
var UWindowSmallButton Clear_Customs;

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'GiveMeItems.GMIBackGround');
}

function Created()
{
	SetSize(480, 480);
	CloseButton = UWindowSmallCloseButton(CreateControl(class'UWindowSmallCloseButton', WinWidth-23, WinHeight-23, 48, 1));
	CloseButton.SetText( "Close" );

	Randomize_D = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 0, WinHeight-23, 120, 20));
	Randomize_D.SetText( "Set Random Defaults" );
	
	Clear_Customs = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 140, WinHeight-23, 140, 20));
	Clear_Customs.SetText( "Clear Custom Entries" );

	j = 0;
	y = 1;
	yb = 20;

	for (i = 0; i < 6; i++){
	
		WeaponControl_A[i] = UWindowComboControl(CreateControl(class'UWindowComboControl', 10, (y * 35) - 20, 230, 1));
		WeaponControl_A[i].SetText("Enter Item #" $ i+1);
		WeaponControl_A[i].SetEditable(True);
		for (d_count = 0; d_count < 35; d_count++){
			WeaponControl_A[i].AddItem(class'GiveMeItems.DefaultItems'.default.Defaults[d_count]);}
		WeaponControl_A[i].SetValue(class'GiveMeItems.GiveMeItems'.default.ItemChoice[i]);		

		//load the custom choices saved into the .ini file.
		//to-do: find a way to detect custom choice entered manually, by comparing that entry with a list of 
		//pre-determined, hard-coded default items... possibly through a method. 
		
		j = 0;	

		while(class<Inventory>(DynamicLoadObject(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j], class'Class')) != None && j < 255){
			//only add if not a duplicate. smaller function used.
			if(droplist_isDuplicate(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j])){
				WeaponControl_A[i].AddItem(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j]);
			}
			j++;
		}

			
		AddStatus[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, (y * 35), 250, 16));
		AddStatus[i].SetFont(F_Bold);
		AddStatus[i].Align = TA_Left;
		AddStatus[i].SetText(" ");

		SuggestedAmmo[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, (y * 35 + 12), 250, 16));
		SuggestedAmmo[i].SetFont(F_Bold);
		SuggestedAmmo[i].Align = TA_Left;
		SuggestedAmmo[i].SetText("  ");

		y += 2;
		
	}


	y = 1;

	for (i = 6; i < 12; i++){
	
		WeaponControl_A[i] = UWindowComboControl(CreateControl(class'UWindowComboControl', 265, (y * 35) - 20, 230, 1));
		WeaponControl_A[i].SetText("Enter Item #" $ i+1);
		WeaponControl_A[i].SetEditable(True);
		for (d_count = 0; d_count < 35; d_count++){
			WeaponControl_A[i].AddItem(class'GiveMeItems.DefaultItems'.default.Defaults[d_count]);}
		WeaponControl_A[i].SetValue(class'GiveMeItems.GiveMeItems'.default.ItemChoice[i]);		

		j = 0;	

		while(class<Inventory>(DynamicLoadObject(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j], class'Class')) != None && j < 255){
			//only add if not a duplicate. smaller function used.
			if(droplist_isDuplicate(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j])){
				WeaponControl_A[i].AddItem(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j]);
			}
			j++;
		}


		AddStatus[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 265, (y * 35), 230, 1));
		AddStatus[i].SetFont(F_Bold);
		AddStatus[i].Align = TA_Left;
		AddStatus[i].SetText(" ");

		SuggestedAmmo[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 265, (y * 35 + 12), 250, 16));
		SuggestedAmmo[i].SetFont(F_Bold);
		SuggestedAmmo[i].Align = TA_Left;
		SuggestedAmmo[i].SetText("  ");

		y += 2;
		
	}


	Credits = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 440, 480, 16));
	Credits.SetFont(F_Bold);
	Credits.Align = TA_Center;
	Credits.SetText(" GiveMeItems! - 2014 ");

	Super.Created();
}

function bool Is_Default(string s){
	
	if (s == "botpack.translocator" ||
		s == "botpack.chainsaw" ||
		s == "botpack.impacthammer" ||
		s == "botpack.enforcer" ||
		s == "botpack.doubleenforcer" ||	
		s == "botpack.ut_biorifle" ||
		s == "botpack.shockrifle" ||
		s == "botpack.supershockrifle" ||
		s == "botpack.pulsegun" ||
		s == "botpack.ripper" ||
		s == "botpack.minigun2" ||
		s == "botpack.ut_flakcannon" ||
		s == "botpack.ut_eightball" ||
		s == "botpack.sniperrifle" ||
		s == "botpack.warheadlauncher" ||
		s == "botpack.healthvial" ||
		s == "botpack.medbox" ||
		s == "botpack.healthpack" ||
		s == "botpack.thighpads" ||
		s == "botpack.armor2" ||
		s == "botpack.ut_shieldbelt" ||
		s == "botpack.udamage" ||
		s == "botpack.ut_invisibility" ||
		s == "botpack.ut_jumpboots" ||
		s == "botpack.bioammo" ||
    		s == "botpack.bladehopper" ||
   		s == "botpack.bulletbox" ||
     		s == "botpack.rifleshell" ||
     		s == "botpack.flakammo" ||
     		s == "botpack.miniammo" ||
     		s == "botpack.eclip" ||
     		s == "botpack.pammo" ||
     		s == "botpack.rocketpack" ||
   		s == "botpack.shockcore" ||
     		s == "botpack.supershockcore") return true;
	else return false;
}


function bool process_Custom(string s){ //returns false if it didn't process anything, true if it did

	local int i;
	local int j;
	local bool isDuplicate;
	isDuplicate = false;

	//check if the counter has been tampered with...
	if (class'GiveMeItems.GiveMeItems'.default.customCounter < 0 || class'GiveMeItems.GiveMeItems'.default.customCounter > 254){		
		//reset counter to 0, then: process every item until the last valid value.
		//where-ever that processing ends, is the value of the counter. 
		j = 0;
		while(class<Inventory>(DynamicLoadObject(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j], class'Class')) != None && j < 255){
			j++;
		}
		class'GiveMeItems.GiveMeItems'.default.customCounter = j;
	}

	//check if counter is maxed out, as in it is 254, the last possible value.
	//if so, start over at 0.
	if 	(class'GiveMeItems.GiveMeItems'.default.customCounter == 254) 
		class'GiveMeItems.GiveMeItems'.default.customCounter = 0;

	//check to see if it is a duplicate
	for (i = 0; i < class'GiveMeItems.GiveMeItems'.default.customCounter; i++){
		if (class'GiveMeItems.GiveMeItems'.default.CustomChoice[i] == s){
			isDuplicate = true;
		}	
	}
	
	if (isDuplicate){
		return false;
	} else {
		add_Custom(s);
		return true;
	}

}

function add_Custom(string s){
		class'GiveMeItems.GiveMeItems'.default.CustomChoice[class'GiveMeItems.GiveMeItems'.default.customCounter] = s;
		class'GiveMeItems.GiveMeItems'.default.customCounter += 1;
		StaticSaveConfig();
}

function bool droplist_isDuplicate(string s){

	local int i;
	local int j;
	local bool isDuplicate;
	isDuplicate = false;

	//check if the counter has been tampered with...
	if (class'GiveMeItems.GiveMeItems'.default.customCounter < 0 || class'GiveMeItems.GiveMeItems'.default.customCounter > 254){		
		//reset counter to 0, then: process every item until the last valid value.
		//where-ever that processing ends, is the value of the counter. 
		j = 0;
		while(class<Inventory>(DynamicLoadObject(class'GiveMeItems.GiveMeItems'.default.CustomChoice[j], class'Class')) != None && j < 255){
			j++;
		}
		class'GiveMeItems.GiveMeItems'.default.customCounter = j;
	}

	//check if counter is maxed out, as in it is 254, the last possible value.
	//if so, start over at 0.
	if 	(class'GiveMeItems.GiveMeItems'.default.customCounter == 254) 
		class'GiveMeItems.GiveMeItems'.default.customCounter = 0;

	//check to see if it is a duplicate
	for (i = 0; i < class'GiveMeItems.GiveMeItems'.default.customCounter; i++){
		if (class'GiveMeItems.GiveMeItems'.default.CustomChoice[i] == s){
			isDuplicate = true;
		}	
	}
	
	return isDuplicate;

}

function Notify(UWindowDialogControl C, byte E){

local int i_C;
local int i;
local int count;

local string pass[12];
local class<Weapon> WeaponHolder[12];

for (count = 0; count < 12; count++){
	pass[count] = WeaponControl_A[count].GetValue();
}

	switch(E){ 
		case DE_Click:
			switch(C){
				case CloseButton:
	  				StaticSaveConfig();
         			break;
				case Randomize_D:
					for (i = 0; i < 12; i++){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[i] = class'GiveMeItems.DefaultItems'.default.Defaults[Rand(35)];
						WeaponControl_A[i].SetValue(class'GiveMeItems.GiveMeItems'.default.ItemChoice[i]);
					}
					StaticSaveConfig();
					break;
				case Clear_Customs:
					i_C = 0;
					for (i_C = 0; i_C < 255; i_C++){
						class'GiveMeItems.GiveMeItems'.default.CustomChoice[i_C] = " ";
					}
					class'GiveMeItems.GiveMeItems'.default.customCounter = 0;	
					StaticSaveConfig();
					break;
			}

		case DE_Change: // the message sent by buttons
      		switch(C){
    			case WeaponControl_A[0]:
					if(class<Inventory>(DynamicLoadObject(pass[0], class'Class')) != None){
						if(!Is_Default(pass[0])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[0] = WeaponControl_A[0].GetValue();
							process_Custom(WeaponControl_A[0].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[0].TextColor.R = 0;
							AddStatus[0].TextColor.G = 0;
							AddStatus[0].TextColor.B = 100;
							AddStatus[0].SetText(" Item #1: Custom Added ");
							WeaponHolder[0] = class<Weapon>(DynamicLoadObject(pass[0], class'Class'));
							if (WeaponHolder[0] != None && WeaponHolder[0].default.AmmoName != None){
								SuggestedAmmo[0].TextColor.R = 0;
								SuggestedAmmo[0].TextColor.G = 0;
								SuggestedAmmo[0].TextColor.B = 100;
								SuggestedAmmo[0].SetText(" Suggested Entry: " $ WeaponHolder[0].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[0] = WeaponControl_A[0].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[0].TextColor.R = 0;
							AddStatus[0].TextColor.G = 80;
							AddStatus[0].TextColor.B = 0;
							AddStatus[0].SetText(" Added Item #1 ");
							SuggestedAmmo[0].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[0], class'Class')) == None){
						AddStatus[0].TextColor.R = 250;
						AddStatus[0].TextColor.G = 0;
						AddStatus[0].TextColor.B = 0;
						AddStatus[0].SetText(" Item #1: Not added. ");
						SuggestedAmmo[0].SetText(" ");
					} break; 

				case WeaponControl_A[1]:
					if(class<Inventory>(DynamicLoadObject(pass[1], class'Class')) != None){
						if(!Is_Default(pass[1])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[1] = WeaponControl_A[1].GetValue();
							process_Custom(WeaponControl_A[1].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[1].TextColor.R = 0;
							AddStatus[1].TextColor.G = 0;
							AddStatus[1].TextColor.B = 100;
							AddStatus[1].SetText(" Item #2: Custom Added ");
							WeaponHolder[1] = class<Weapon>(DynamicLoadObject(pass[1], class'Class'));
							if (WeaponHolder[1] != None && WeaponHolder[1].default.AmmoName != None){
								SuggestedAmmo[1].TextColor.R = 0;
								SuggestedAmmo[1].TextColor.G = 0;
								SuggestedAmmo[1].TextColor.B = 100;
								SuggestedAmmo[1].SetText(" Suggested Entry: " $ WeaponHolder[1].default.AmmoName);
							}
						} else {							
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[1] = WeaponControl_A[1].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[1].TextColor.R = 0;
							AddStatus[1].TextColor.G = 80;
							AddStatus[1].TextColor.B = 0;
							AddStatus[1].SetText(" Added Item #2 ");
							SuggestedAmmo[1].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[1], class'Class')) == None){
						AddStatus[1].TextColor.R = 250;
						AddStatus[1].TextColor.G = 0;
						AddStatus[1].TextColor.B = 0;
						AddStatus[1].SetText(" Item #2: Not added. ");
						SuggestedAmmo[1].SetText(" ");
					} break; 

				case WeaponControl_A[2]:
					if(class<Inventory>(DynamicLoadObject(pass[2], class'Class')) != None){
						if(!Is_Default(pass[2])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[2] = WeaponControl_A[2].GetValue();
							process_Custom(WeaponControl_A[2].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[2].TextColor.R = 0;
							AddStatus[2].TextColor.G = 0;
							AddStatus[2].TextColor.B = 100;
							AddStatus[2].SetText(" Item #3: Custom Added ");
							WeaponHolder[2] = class<Weapon>(DynamicLoadObject(pass[2], class'Class'));
							if (WeaponHolder[2] != None && WeaponHolder[2].default.AmmoName != None){
								SuggestedAmmo[2].TextColor.R = 0;
								SuggestedAmmo[2].TextColor.G = 0;
								SuggestedAmmo[2].TextColor.B = 100;
								SuggestedAmmo[2].SetText(" Suggested Entry: " $ WeaponHolder[2].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[2] = WeaponControl_A[2].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[2].TextColor.R = 0;
							AddStatus[2].TextColor.G = 80;
							AddStatus[2].TextColor.B = 0;
							AddStatus[2].SetText(" Added Item #3 ");
							SuggestedAmmo[2].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[2], class'Class')) == None){
						AddStatus[2].TextColor.R = 250;
						AddStatus[2].TextColor.G = 0;
						AddStatus[2].TextColor.B = 0;
						AddStatus[2].SetText(" Item #3: Not added. ");
						SuggestedAmmo[2].SetText(" ");
					} break; 

				case WeaponControl_A[3]:
					if(class<Inventory>(DynamicLoadObject(pass[3], class'Class')) != None){
						if(!Is_Default(pass[3])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[3] = WeaponControl_A[3].GetValue();
							process_Custom(WeaponControl_A[3].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[3].TextColor.R = 0;
							AddStatus[3].TextColor.G = 0;
							AddStatus[3].TextColor.B = 100;
							AddStatus[3].SetText(" Item #4: Custom Added ");
							WeaponHolder[3] = class<Weapon>(DynamicLoadObject(pass[3], class'Class'));
							if (WeaponHolder[3] != None && WeaponHolder[3].default.AmmoName != None){
								SuggestedAmmo[3].TextColor.R = 0;
								SuggestedAmmo[3].TextColor.G = 0;
								SuggestedAmmo[3].TextColor.B = 100;
								SuggestedAmmo[3].SetText(" Suggested Entry: " $ WeaponHolder[3].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[3] = WeaponControl_A[3].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[3].TextColor.R = 0;
							AddStatus[3].TextColor.G = 80;
							AddStatus[3].TextColor.B = 0;
							AddStatus[3].SetText(" Added Item #4 ");
							SuggestedAmmo[3].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[3], class'Class')) == None){
						AddStatus[3].TextColor.R = 250;
						AddStatus[3].TextColor.G = 0;
						AddStatus[3].TextColor.B = 0;
						AddStatus[3].SetText(" Item #4: Not added. ");
						SuggestedAmmo[3].SetText(" ");
					} break; 

				case WeaponControl_A[4]:
					if(class<Inventory>(DynamicLoadObject(pass[4], class'Class')) != None){
						if(!Is_Default(pass[4])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[4] = WeaponControl_A[4].GetValue();
							process_Custom(WeaponControl_A[4].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[4].TextColor.R = 0;
							AddStatus[4].TextColor.G = 0;
							AddStatus[4].TextColor.B = 100;
							AddStatus[4].SetText(" Item #5: Custom Added ");
							WeaponHolder[4] = class<Weapon>(DynamicLoadObject(pass[4], class'Class'));
							if (WeaponHolder[4] != None && WeaponHolder[4].default.AmmoName != None){
								SuggestedAmmo[4].TextColor.R = 0;
								SuggestedAmmo[4].TextColor.G = 0;
								SuggestedAmmo[4].TextColor.B = 100;
								SuggestedAmmo[4].SetText(" Suggested Entry: " $ WeaponHolder[4].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[4] = WeaponControl_A[4].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[4].TextColor.R = 0;
							AddStatus[4].TextColor.G = 80;
							AddStatus[4].TextColor.B = 0;
							AddStatus[4].SetText(" Added Item #5 ");
							SuggestedAmmo[4].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[4], class'Class')) == None){
						AddStatus[4].TextColor.R = 250;
						AddStatus[4].TextColor.G = 0;
						AddStatus[4].TextColor.B = 0;
						AddStatus[4].SetText(" Item #5: Not added. ");
						SuggestedAmmo[4].SetText(" ");
					} break; 

				case WeaponControl_A[5]:
					if(class<Inventory>(DynamicLoadObject(pass[5], class'Class')) != None){
						if(!Is_Default(pass[5])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[5] = WeaponControl_A[5].GetValue();
							process_Custom(WeaponControl_A[5].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[5].TextColor.R = 0;
							AddStatus[5].TextColor.G = 0;
							AddStatus[5].TextColor.B = 100;
							AddStatus[5].SetText(" Item #6: Custom Added ");
							WeaponHolder[5] = class<Weapon>(DynamicLoadObject(pass[5], class'Class'));
							if (WeaponHolder[5] != None && WeaponHolder[5].default.AmmoName != None){
								SuggestedAmmo[5].TextColor.R = 0;
								SuggestedAmmo[5].TextColor.G = 0;
								SuggestedAmmo[5].TextColor.B = 100;
								SuggestedAmmo[5].SetText(" Suggested Entry: " $ WeaponHolder[5].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[5] = WeaponControl_A[5].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[5].TextColor.R = 0;
							AddStatus[5].TextColor.G = 80;
							AddStatus[5].TextColor.B = 0;
							AddStatus[5].SetText(" Added Item #6 ");
							SuggestedAmmo[5].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[5], class'Class')) == None){
						AddStatus[5].TextColor.R = 250;
						AddStatus[5].TextColor.G = 0;
						AddStatus[5].TextColor.B = 0;
						AddStatus[5].SetText(" Item #6: Not added. ");
						SuggestedAmmo[5].SetText(" ");
					} break; 

				case WeaponControl_A[6]:
					if(class<Inventory>(DynamicLoadObject(pass[6], class'Class')) != None){
						if(!Is_Default(pass[6])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[6] = WeaponControl_A[6].GetValue();
							process_Custom(WeaponControl_A[6].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[6].TextColor.R = 0;
							AddStatus[6].TextColor.G = 0;
							AddStatus[6].TextColor.B = 100;
							AddStatus[6].SetText(" Item #7: Custom Added ");
							WeaponHolder[6] = class<Weapon>(DynamicLoadObject(pass[6], class'Class'));
							if (WeaponHolder[6] != None && WeaponHolder[6].default.AmmoName != None){
								SuggestedAmmo[6].TextColor.R = 0;
								SuggestedAmmo[6].TextColor.G = 0;
								SuggestedAmmo[6].TextColor.B = 100;
								SuggestedAmmo[6].SetText(" Suggested Entry: " $ WeaponHolder[6].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[6] = WeaponControl_A[6].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[6].TextColor.R = 0;
							AddStatus[6].TextColor.G = 80;
							AddStatus[6].TextColor.B = 0;
							AddStatus[6].SetText(" Added Item #7 ");
							SuggestedAmmo[6].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[6], class'Class')) == None){
						AddStatus[6].TextColor.R = 250;
						AddStatus[6].TextColor.G = 0;
						AddStatus[6].TextColor.B = 0;
						AddStatus[6].SetText(" Item #7: Not added. ");
						SuggestedAmmo[6].SetText(" ");
					} break; 

				case WeaponControl_A[7]:
					if(class<Inventory>(DynamicLoadObject(pass[7], class'Class')) != None){
						if(!Is_Default(pass[7])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[7] = WeaponControl_A[7].GetValue();
							process_Custom(WeaponControl_A[7].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[7].TextColor.R = 0;
							AddStatus[7].TextColor.G = 0;
							AddStatus[7].TextColor.B = 100;
							AddStatus[7].SetText(" Item #8: Custom Added ");
							WeaponHolder[7] = class<Weapon>(DynamicLoadObject(pass[7], class'Class'));
							if (WeaponHolder[7] != None && WeaponHolder[7].default.AmmoName != None){
								SuggestedAmmo[7].TextColor.R = 0;
								SuggestedAmmo[7].TextColor.G = 0;
								SuggestedAmmo[7].TextColor.B = 100;
								SuggestedAmmo[7].SetText(" Suggested Entry: " $ WeaponHolder[7].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[7] = WeaponControl_A[7].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[7].TextColor.R = 0;
							AddStatus[7].TextColor.G = 80;
							AddStatus[7].TextColor.B = 0;
							AddStatus[7].SetText(" Added Item #8 ");
							SuggestedAmmo[7].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[7], class'Class')) == None){
						AddStatus[7].TextColor.R = 250;
						AddStatus[7].TextColor.G = 0;
						AddStatus[7].TextColor.B = 0;
						AddStatus[7].SetText(" Item #8: Not added. ");
						SuggestedAmmo[7].SetText(" ");
					} break; 

				case WeaponControl_A[8]:
					if(class<Inventory>(DynamicLoadObject(pass[8], class'Class')) != None){
						if(!Is_Default(pass[8])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[8] = WeaponControl_A[8].GetValue();
							process_Custom(WeaponControl_A[8].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[8].TextColor.R = 0;
							AddStatus[8].TextColor.G = 0;
							AddStatus[8].TextColor.B = 100;
							AddStatus[8].SetText(" Item #9: Custom Added ");
							WeaponHolder[8] = class<Weapon>(DynamicLoadObject(pass[8], class'Class'));
							if (WeaponHolder[8] != None && WeaponHolder[8].default.AmmoName != None){
								SuggestedAmmo[8].TextColor.R = 0;
								SuggestedAmmo[8].TextColor.G = 0;
								SuggestedAmmo[8].TextColor.B = 100;
								SuggestedAmmo[8].SetText(" Suggested Entry: " $ WeaponHolder[8].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[8] = WeaponControl_A[8].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[8].TextColor.R = 0;
							AddStatus[8].TextColor.G = 80;
							AddStatus[8].TextColor.B = 0;
							AddStatus[8].SetText(" Added Item #9 ");
							SuggestedAmmo[8].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[8], class'Class')) == None){
						AddStatus[8].TextColor.R = 250;
						AddStatus[8].TextColor.G = 0;
						AddStatus[8].TextColor.B = 0;
						AddStatus[8].SetText(" Item #9: Not added. ");
						SuggestedAmmo[8].SetText(" ");
					} break; 

				case WeaponControl_A[9]:
					if(class<Inventory>(DynamicLoadObject(pass[9], class'Class')) != None){
						if(!Is_Default(pass[9])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[9] = WeaponControl_A[9].GetValue();
							process_Custom(WeaponControl_A[9].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[9].TextColor.R = 0;
							AddStatus[9].TextColor.G = 0;
							AddStatus[9].TextColor.B = 100;
							AddStatus[9].SetText(" Item #10: Custom Added ");
							WeaponHolder[9] = class<Weapon>(DynamicLoadObject(pass[9], class'Class'));
							if (WeaponHolder[9] != None && WeaponHolder[9].default.AmmoName != None){
								SuggestedAmmo[9].TextColor.R = 0;
								SuggestedAmmo[9].TextColor.G = 0;
								SuggestedAmmo[9].TextColor.B = 100;
								SuggestedAmmo[9].SetText(" Suggested Entry: " $ WeaponHolder[9].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[9] = WeaponControl_A[9].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[9].TextColor.R = 0;
							AddStatus[9].TextColor.G = 80;
							AddStatus[9].TextColor.B = 0;
							AddStatus[9].SetText(" Added Item #10 ");
							SuggestedAmmo[9].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[9], class'Class')) == None){
						AddStatus[9].TextColor.R = 250;
						AddStatus[9].TextColor.G = 0;
						AddStatus[9].TextColor.B = 0;
						AddStatus[9].SetText(" Item #10: Not added. ");
						SuggestedAmmo[9].SetText(" ");
					} break; 
		
				case WeaponControl_A[10]:
					if(class<Inventory>(DynamicLoadObject(pass[10], class'Class')) != None){
						if(!Is_Default(pass[10])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[10] = WeaponControl_A[10].GetValue();
							process_Custom(WeaponControl_A[10].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[10].TextColor.R = 0;
							AddStatus[10].TextColor.G = 0;
							AddStatus[10].TextColor.B = 100;
							AddStatus[10].SetText(" Item #11: Custom Added ");
							WeaponHolder[10] = class<Weapon>(DynamicLoadObject(pass[10], class'Class'));
							if (WeaponHolder[10] != None && WeaponHolder[10].default.AmmoName != None){
								SuggestedAmmo[10].TextColor.R = 0;
								SuggestedAmmo[10].TextColor.G = 0;
								SuggestedAmmo[10].TextColor.B = 100;
								SuggestedAmmo[10].SetText(" Suggested Entry: " $ WeaponHolder[10].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[10] = WeaponControl_A[10].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[10].TextColor.R = 0;
							AddStatus[10].TextColor.G = 80;
							AddStatus[10].TextColor.B = 0;
							AddStatus[10].SetText(" Added Item #11 ");
							SuggestedAmmo[10].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[10], class'Class')) == None){
						AddStatus[10].TextColor.R = 250;
						AddStatus[10].TextColor.G = 0;
						AddStatus[10].TextColor.B = 0;
						AddStatus[10].SetText(" Item #11: Not added. ");
						SuggestedAmmo[10].SetText(" ");
					} break; 

				case WeaponControl_A[11]:
					if(class<Inventory>(DynamicLoadObject(pass[11], class'Class')) != None){
						if(!Is_Default(pass[11])){
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[11] = WeaponControl_A[11].GetValue();
							process_Custom(WeaponControl_A[11].GetValue());
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[11].TextColor.R = 0;
							AddStatus[11].TextColor.G = 0;
							AddStatus[11].TextColor.B = 100;
							AddStatus[11].SetText(" Item #12: Custom Added ");
							WeaponHolder[11] = class<Weapon>(DynamicLoadObject(pass[11], class'Class'));
							if (WeaponHolder[11] != None && WeaponHolder[11].default.AmmoName != None){
								SuggestedAmmo[11].TextColor.R = 0;
								SuggestedAmmo[11].TextColor.G = 0;
								SuggestedAmmo[11].TextColor.B = 100;
								SuggestedAmmo[11].SetText(" Suggested Entry: " $ WeaponHolder[11].default.AmmoName);
							}
						} else {
							class'GiveMeItems.GiveMeItems'.default.ItemChoice[11] = WeaponControl_A[11].GetValue();
							class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
							AddStatus[11].TextColor.R = 0;
							AddStatus[11].TextColor.G = 80;
							AddStatus[11].TextColor.B = 0;
							AddStatus[11].SetText(" Added Item #12 ");
							SuggestedAmmo[11].SetText(" ");
						}
					} else if(class<Inventory>(DynamicLoadObject(pass[11], class'Class')) == None){
						AddStatus[11].TextColor.R = 250;
						AddStatus[11].TextColor.G = 0;
						AddStatus[11].TextColor.B = 0;
						AddStatus[11].SetText(" Item #12: Not added. ");
						SuggestedAmmo[11].SetText(" ");
					} break; 

 
		}
	}
}

defaultproperties
{
}
