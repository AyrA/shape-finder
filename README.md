# Shape finder

This mod will find shape deposits in close or medium proximity that match your search query.

![Dialog](https://raw.githubusercontent.com/AyrA/shape-finder/master/res/dialog.png "Dialog")

## Installation

Copy `findshape.js` into the mods directory of your installation and start the game.

On windows, you can use the `install.bat` file for this.
On other systems, click the "Open mods folder" button
located at the top right of the mod list in the game.

## Usage

Use `CTRL`+`F` or the magnifying icon in the top right corner to open the dialog.

In the box, set your desired values and begin the search.
If the search is successful, the camera will be automatically centered and zoomed at the node.
If the search fails, a message is displayed instead.

The dialog will remember your choices during the current game session.
This makes repeated search for rare nodes easier for you.

### Shape declaration

Default value: *None*

Enter the shape using the 4 shape letter codes:

- `C` Circle
- `R` Rectangle
- `S` Star
- `W` Windmill

The shape declaration starts at the top right piece and goes clockwise.
It is case insensitive. This is basically the standard shape declaration syntax from the game,
but simply without color since all nodes are uncolored by default.

Additionally, the dash (`-`) which normally stands for "empty" can be used for positions you don't care about.
`W-W-` for example finds any shape that has two windmill pieces in opposite corners.

### Search radius

Default value: **500**

Defines the radius in which to search for the shape.
Radius in this case is a bit of a generous term.
Entering 50 means the search begins 50 tiles to the left and 50 tiles up,
and ends 50 tiles to the right and 50 tiles down.
In other words, it's a square with side length `radius × 2 + 1` that's centered around your camera.

**CAUTION!** Going above 1000 radius can severely lag the game.
The limit of the mod is 5000 units.

To alleviate the memory problems to some extent,
the mod will forcibly unload all empty chunks about 500 milliseconds after your search completes.

### Quick search

Default value: **Yes**

The quick search will abort the search progress when the first result was found.
This can massively speed up the search process when searching large areas.

The mod currently uses a simple scanline search process,
scanning chunks linewise going down (like you read text in a book).
Enabling quick search with a large radius will tend to find your node above you,
and fairly far away.

When this option is disabled, the entire specified area is searched and the closest node is returned.

This entire option can be removed if you feel adventurous and change the search algorithm to a spiral pattern.

### Allow rotated shapes

Default value: **Yes**

There's usually no reason to disable this because rotation is trivial.
This simply allows your shape declaration to be found in all possible 4 rotations.

The algorithm is smart enough to detect that `SSSS` has only one rotation or `SRSR` has only two.

This option will not find mirrored versions, only rotated versions.

## Attribution

The magnifying glass icon in use by this mod was obtained from Freepik.

See https://flaticon.com/free-icon/magnifier_71403 for details.
