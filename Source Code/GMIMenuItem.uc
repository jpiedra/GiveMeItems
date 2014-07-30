//=============================================================================
// GMIMenuItem.
//=============================================================================
class GMIMenuItem expands UMenuModMenuItem;

function Setup()
{
//The MenuCaption variable is used to store the menu item's name on
// the menu. Unfortunately, the menu item is created before Setup()
// is called, and thus uses the default property. Still, this is
// provided as a reference.
	MenuCaption = "GiveMeItems! Config";
//MenuHelp is simply the string written in the status bar at the bottom
// of the screen when the mouse hovers over this menu item. Luckily
// for us, setting the help caption here DOES work.
	MenuHelp = "Pick and Chose GiveMeItems! items-drops.";
}
function Execute()
{
//Create a window using the following function:
// CreateWindow( class, top, left, width, height )
//The window I will create will automatically resize itself to
// the right proportions (I'll show you how when we get to the
// Framed Window part), so it doesn't matter what the top, left,
// width or height variables are. Just the class portion matters.
	MenuItem.Owner.Root.CreateWindow(class'GMIConfigWindow',
	10,10,10,10);
}

defaultproperties
{
}
