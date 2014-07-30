//=============================================================================
// GMIPageWindowB.
//=============================================================================
class GMIPageWindowB expands UMenuPageWindow config(GiveMeItems);

var UWindowSmallCloseButton CloseButton;
var UWindowLabelControl Credits;

var int i;
var int y;
var int yb;

var UWindowEditControl ItemAddBox[12];
var UWindowSmallButton AddItemButton[12];
var UWindowLabelControl AddStatus[12];

function Paint(Canvas C, float X, float Y)
{
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'GiveMeItems.GMIBackGround');
}

function Created()
{
	SetSize(480, 480);
	CloseButton = UWindowSmallCloseButton(CreateControl(class'UWindowSmallCloseButton', WinWidth-23, WinHeight-23, 48, 16));
	CloseButton.SetText( "Close" );
	
	y = 1;
	yb = 20;

	for (i = 0; i < 6; i++){
	
		ItemAddBox[i] = UWindowEditControl(CreateControl(class'UWindowEditControl', 10, (y * 30), 250, 1));
		ItemAddBox[i].SetNumericOnly(False);
		ItemAddBox[i].SetMaxLength(256);
		ItemAddBox[i].EditBoxWidth = 150;
		ItemAddBox[i].Align = TA_Right;

			AddItemButton[i] = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 10, (y * 30) + 20, 80, 20));
			AddItemButton[i].SetText( " Set Item " $ (i + 13) $ " " );

		AddStatus[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 100, (y * 30) + 20, 250, 16));
		AddStatus[i].SetFont(F_Bold);
		AddStatus[i].Align = TA_Left;
		AddStatus[i].SetText(" ");

		y += 2;
		
	}

	y = 1;

	for (i = 6; i < 12; i++){
	
		ItemAddBox[i] = UWindowEditControl(CreateControl(class'UWindowEditControl', 230, (y * 30), 250, 1));
		ItemAddBox[i].SetNumericOnly(False);
		ItemAddBox[i].SetMaxLength(256);
		ItemAddBox[i].EditBoxWidth = 150;
		ItemAddBox[i].Align = TA_Right;

			AddItemButton[i] = UWindowSmallButton(CreateControl(class'UWindowSmallButton', 230, (y * 30) + 20, 80, 20));
			AddItemButton[i].SetText( " Set Item " $ (i + 13) $ " " );

		AddStatus[i] = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 320, (y * 30) + 20, 250, 16));
		AddStatus[i].SetFont(F_Bold);
		AddStatus[i].Align = TA_Left;
		AddStatus[i].SetText(" ");

		y += 2;
		
	}


	Credits = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 440, 480, 16));
	Credits.SetFont(F_Bold);
	Credits.Align = TA_Center;
	Credits.SetText(" GiveMeItems! - 2014 ");

	Super.Created();
}


function Notify(UWindowDialogControl C, byte E){

local int count;
local string pass[12];

for (count = 0; count < 12; count++){
	pass[count] = ItemAddBox[count].GetValue();
}


	switch(E){ 
	    case DE_Click: // the message sent by buttons
      		switch(C){
        		case CloseButton:
	  				StaticSaveConfig();
         			break;
				case AddItemButton[0]:
					if(class<Inventory>(DynamicLoadObject(pass[0], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[12] = ItemAddBox[0].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[0].TextColor.R = 0;
						AddStatus[0].TextColor.G = 80;
						AddStatus[0].TextColor.B = 0;
						AddStatus[0].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[0], class'Class')) == None){
						AddStatus[0].TextColor.R = 250;
						AddStatus[0].TextColor.G = 0;
						AddStatus[0].TextColor.B = 0;
						AddStatus[0].SetText(" Not added. ");
					} break; 
				case AddItemButton[1]:
					if(class<Inventory>(DynamicLoadObject(pass[1], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[13] = ItemAddBox[1].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[1].TextColor.R = 0;
						AddStatus[1].TextColor.G = 80;
						AddStatus[1].TextColor.B = 0;
						AddStatus[1].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[1], class'Class')) == None){
						AddStatus[1].TextColor.R = 250;
						AddStatus[1].TextColor.G = 0;
						AddStatus[1].TextColor.B = 0;
						AddStatus[1].SetText(" Not added. ");
					} break; 
				case AddItemButton[2]:
					if(class<Inventory>(DynamicLoadObject(pass[2], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[14] = ItemAddBox[2].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[2].TextColor.R = 0;
						AddStatus[2].TextColor.G = 80;
						AddStatus[2].TextColor.B = 0;
						AddStatus[2].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[2], class'Class')) == None){
						AddStatus[2].TextColor.R = 250;
						AddStatus[2].TextColor.G = 0;
						AddStatus[2].TextColor.B = 0;
						AddStatus[2].SetText(" Not added. ");
					} break; 
				case AddItemButton[3]:
					if(class<Inventory>(DynamicLoadObject(pass[3], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[15] = ItemAddBox[3].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[3].TextColor.R = 0;
						AddStatus[3].TextColor.G = 80;
						AddStatus[3].TextColor.B = 0;
						AddStatus[3].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[3], class'Class')) == None){
						AddStatus[3].TextColor.R = 250;
						AddStatus[3].TextColor.G = 0;
						AddStatus[3].TextColor.B = 0;
						AddStatus[3].SetText(" Not added. ");
					} break; 
				case AddItemButton[4]:
					if(class<Inventory>(DynamicLoadObject(pass[4], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[16] = ItemAddBox[4].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[4].TextColor.R = 0;
						AddStatus[4].TextColor.G = 80;
						AddStatus[4].TextColor.B = 0;
						AddStatus[4].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[4], class'Class')) == None){
						AddStatus[4].TextColor.R = 250;
						AddStatus[4].TextColor.G = 0;
						AddStatus[4].TextColor.B = 0;
						AddStatus[4].SetText(" Not added. ");
					} break; 
			case AddItemButton[5]:
					if(class<Inventory>(DynamicLoadObject(pass[5], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[17] = ItemAddBox[5].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[5].TextColor.R = 0;
						AddStatus[5].TextColor.G = 80;
						AddStatus[5].TextColor.B = 0;
						AddStatus[5].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[5], class'Class')) == None){
						AddStatus[5].TextColor.R = 250;
						AddStatus[5].TextColor.G = 0;
						AddStatus[5].TextColor.B = 0;
						AddStatus[5].SetText(" Not added. ");
					} break; 
			case AddItemButton[6]:
					if(class<Inventory>(DynamicLoadObject(pass[6], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[18] = ItemAddBox[6].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[6].TextColor.R = 0;
						AddStatus[6].TextColor.G = 80;
						AddStatus[6].TextColor.B = 0;
						AddStatus[6].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[6], class'Class')) == None){
						AddStatus[6].TextColor.R = 250;
						AddStatus[6].TextColor.G = 0;
						AddStatus[6].TextColor.B = 0;
						AddStatus[6].SetText(" Not added. ");
					} break;
			case AddItemButton[7]:
					if(class<Inventory>(DynamicLoadObject(pass[7], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[19] = ItemAddBox[7].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[7].TextColor.R = 0;
						AddStatus[7].TextColor.G = 80;
						AddStatus[7].TextColor.B = 0;
						AddStatus[7].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[7], class'Class')) == None){
						AddStatus[7].TextColor.R = 250;
						AddStatus[7].TextColor.G = 0;
						AddStatus[7].TextColor.B = 0;
						AddStatus[7].SetText(" Not added. ");
					} break; 
			case AddItemButton[8]:
					if(class<Inventory>(DynamicLoadObject(pass[8], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[20] = ItemAddBox[8].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[8].TextColor.R = 0;
						AddStatus[8].TextColor.G = 80;
						AddStatus[8].TextColor.B = 0;
						AddStatus[8].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[8], class'Class')) == None){
						AddStatus[8].TextColor.R = 250;
						AddStatus[8].TextColor.G = 0;
						AddStatus[8].TextColor.B = 0;
						AddStatus[8].SetText(" Not added. ");
					} break; 
			case AddItemButton[9]:
					if(class<Inventory>(DynamicLoadObject(pass[9], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[21] = ItemAddBox[9].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[9].TextColor.R = 0;
						AddStatus[9].TextColor.G = 80;
						AddStatus[9].TextColor.B = 0;
						AddStatus[9].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[9], class'Class')) == None){
						AddStatus[9].TextColor.R = 250;
						AddStatus[9].TextColor.G = 0;
						AddStatus[9].TextColor.B = 0;
						AddStatus[9].SetText(" Not added. ");
					} break; 
			case AddItemButton[10]:
					if(class<Inventory>(DynamicLoadObject(pass[10], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[22] = ItemAddBox[10].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[10].TextColor.R = 0;
						AddStatus[10].TextColor.G = 80;
						AddStatus[10].TextColor.B = 0;
						AddStatus[10].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[10], class'Class')) == None){
						AddStatus[10].TextColor.R = 250;
						AddStatus[10].TextColor.G = 0;
						AddStatus[10].TextColor.B = 0;
						AddStatus[10].SetText(" Not added. ");
					} break; 
			case AddItemButton[11]:
					if(class<Inventory>(DynamicLoadObject(pass[11], class'Class')) != None){
						class'GiveMeItems.GiveMeItems'.default.ItemChoice[23] = ItemAddBox[11].GetValue();
						class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
						AddStatus[11].TextColor.R = 0;
						AddStatus[11].TextColor.G = 80;
						AddStatus[11].TextColor.B = 0;
						AddStatus[11].SetText(" Added! ");
					} else if(class<Inventory>(DynamicLoadObject(pass[11], class'Class')) == None){
						AddStatus[11].TextColor.R = 250;
						AddStatus[11].TextColor.G = 0;
						AddStatus[11].TextColor.B = 0;
						AddStatus[11].SetText(" Not added. ");
					} break; 
 
		}
	}
}

defaultproperties
{
}
