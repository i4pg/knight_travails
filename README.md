# knight_travails

This project uses graph implementation to search for the shortest path a knights takes 
from a given position to it's final position on a standard 8x8 board 

#### How it works?

A 8x8 board is created on the fly firstly in the form of an array.the program then constructs a graph.
Each cell on the board is a node with the its parent and positions

Then, using breadth first search, it searches for the final position. it then constructs the path and outputs it.

This program took me almost a week since i had other things to do and graphs were a new data structure for me and it took some time for me to figure it out, but it was worth learning

### Sample usage

```
Knight.new([0, 0], [7, 7])
"you made it in 6 moves! Here's your path"
[0, 0]
[1, 2]
[2, 4]
[3, 6]
[4, 4]
[5, 6]
[7, 7]
