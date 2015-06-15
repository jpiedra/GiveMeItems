//=============================================================================
// GMIConfigWindow.
//=============================================================================
class GMIConfigWindow expands UWindowFramedWindow;

function BeginPlay() {

Super.BeginPlay();
//Set the title of the Framed Window
	WindowTitle = "Configure GiveMeItems!";

//The class of the content
	ClientClass = class'GMIClientWindow';
//Make the Framed Window resizable
	bSizable = false;
}


function Created() {
  	Super.Created();
  	SetSize(512, 512); 
  	WinLeft = (Root.WinWidth - WinWidth) / 2;
  	WinTop = (Root.WinHeight - WinHeight) / 2;
}

defaultproperties
{
}
