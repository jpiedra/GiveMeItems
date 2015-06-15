//=============================================================================
// GMIPageGlobals.
//=============================================================================
class GMIPageGlobals expands UMenuPageWindow config(GiveMeItems);

var UWindowSmallCloseButton CloseButton;
var UWindowLabelControl Credits;
var UWindowHSliderControl setDestroyTime;

function Paint(Canvas C, float X, float Y) {
	Super.Paint(C, X, Y);
	DrawStretchedTexture(C, 0, 0, WinWidth, WinHeight, Texture'GiveMeItems.GMIBackGround');
}

function Created() {
	SetSize(480, 480);
	CloseButton = UWindowSmallCloseButton(CreateControl(class'UWindowSmallCloseButton', WinWidth-23, WinHeight-23, 48, 16));
	CloseButton.SetText( "Close" );

	setDestroyTime = UWindowHSliderControl(CreateControl(class'UWindowHSliderControl', 50, 30, 355, 65));
	setDestroyTime.SetRange(10, 100, 10);
	setDestroyTime.SetValue(class'GiveMeItems.GiveMeItems'.default.destroyTime, true);	
	setDestroyTime.SetText("Remove drops every " $ int(setDestroyTime.Value) $ " seconds.");

		
	Credits = UWindowLabelControl(CreateControl(class'UWindowLabelControl', 10, 440, 480, 16));
	Credits.SetFont(F_Bold);
	Credits.Align = TA_Center;
	Credits.SetText(" GiveMeItems! - 2014");

	Super.Created();
}


function Notify(UWindowDialogControl C, byte E) {
	switch(E) {
		case DE_Change:
			switch(C) {
			case setDestroyTime:
				setDestroyTIme.SetText("Remove drops every " $ int(setDestroyTime.Value) $ " seconds");
				class'GiveMeItems.GiveMeItems'.default.destroyTime=setDestroyTime.Value;
				class'GiveMeItems.GiveMeItems'.static.StaticSaveConfig();
				break;
			}
	}
}

defaultproperties
{
}
