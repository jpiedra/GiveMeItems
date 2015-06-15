//=============================================================================
// GMIMenuItem.
//=============================================================================
class GMIMenuItem expands UMenuModMenuItem;

function Setup() {
	MenuCaption = "GiveMeItems! Config";
	MenuHelp = "Pick and Chose GiveMeItems! items-drops.";
}

function Execute() {
	MenuItem.Owner.Root.CreateWindow(class'GMIConfigWindow',
	10,10,10,10);
}

defaultproperties
{
}
