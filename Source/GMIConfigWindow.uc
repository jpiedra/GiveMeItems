//=============================================================================
// GMIConfigWindow.
//=============================================================================
class GMIConfigWindow expands UWindowFramedWindow;

function BeginPlay() {
	Super.BeginPlay();
	WindowTitle = "Configure GiveMeItems!";
	ClientClass = class'GMIClientWindow';
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
