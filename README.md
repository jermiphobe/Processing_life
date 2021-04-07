# Processing_life

[Conway's Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life)

This was the project I decided to learn Processing with.  It's just a simple 2D game of life simmulation.  There isn't any interacting with it, you just get to watch it progress.  That wasn't enough though, I wanted to make it unique somehow.  I decided to learn a little about colors and transitioning from one color to another, and what better way to do that than to explore lifespans of the cities.  

This is just another 2D array filled with simple town objects.  As the board is updated I check to see if the town is staying alive or not.  If it was alive and stays alive, I increment a counter to indicate how long it's been alive.  This counter is how the program increments the color.  The longer a town has been alive, the darker pink it turns.

I do the same with towns that alternate between life and death.  I two more counters to keep track of this.  The first counter keeps track of how long a town has been dead.  If a town becomes alive, it resets that counter.  The second counter keeps track of how many times the town has fliped from death back to life.  If the death counter equals one, then I increment the ever-other counter.  However, if the death counter goes any higher, it resets the every-other counter.  As the every-other counter increases, the town transitions into a dark shade of blue.
