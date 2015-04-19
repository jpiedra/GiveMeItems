//=============================================================================
// GMIClientWindow.
//=============================================================================
class GMIClientWindow expands UWindowDialogClientWindow;

#exec TEXTURE IMPORT NAME=GMIBackGround FILE=Textures\GMIBACKGROUND.PCX LODSET=0

var UWindowSmallCloseButton CloseButton;
var UWindowPageControl GameSettings;

function Created()
{
	SetSize(512, 512);
	CloseButton = UWindowSmallCloseButton(CreateControl(class'UWindowSmallCloseButton', WinWidth-56, WinHeight-22, 48, 16));
	CloseButton.SetText( "Close" );

	GameSettings = UWindowPageControl(CreateWindow(class'UWindowPageControl', 0, 0, 512, 512));
	GameSettings.SetMultiLine(True);
	GameSettings.AddPage("Items 1-12", class'GMIPageWindowA');
	GameSettings.AddPage("Items 13-24", class'GMIPageWindowB');
	GameSettings.AddPage("Options", class'GMIPageGlobals');

	Super.Created();
}

defaultproperties
{
}
