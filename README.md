This repository contains all files constituting the GiveMeItems mutator. 

Copies of the source code for these files will be shared, so that examination of the code comprising this project can be done without use of the UnrealScript IDE (UnrealEd). 

#Installation:

Simply copy all the .u and .ini files into the /System directory of your Unreal Tournament installation. 

Once in the game, the mutator can be used in-game through the "Mutators" section of "Start Practice Session." 

#Features:
    * 24 slots which the user can use to specify items to be dropped.

    * Choose how often items added through GiveMeItems are removed from the game.

    * Slots are filled in through GUI drop-down lists, which also double as text-entry fields.

    * Default Unreal Tournament inventory (weapons, health, etc.) provided in drop down menus.

    * Recognizes custom packages inventory items, when a user enters the summon string in the text-entry fields (double-click the drop-down fields to enter text).

    * Custom package entries are saved for later use; no need to memorize, simply find them in the drop-down menus!	

    * Evaluation of user input; invalid or improperly spelled items	are not added to the game.

    * Ammunition suggestion: When custom package weapons are detected, GiveMeItems will suggest the name of the ammo item used	by such weapons.

    * Randomized default items: Randomly select default Unreal Tournament items for all slots on a page.

    * Clear Custom Entries: Unused custom entries can be cleared, if so desired.