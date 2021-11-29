Explanation of rotation:

The rotation occurs in the rotate(PShape sphere, int i) function in the 45th line.

The initial pattern of spinning is arbitrary. For each of the 3 axes, it will rotate a number of radians in the range of 50 to 200 for all 
3 axes x, y, and z. This can be seen in the mousePressed function when I add a new sphere object when the mouse is clicked.

Whenever a ball is not hitting any of the walls, it will continually spin in the same direction (along its respective x,y, and z direction).
However, the moment it hits a wall, it will reverse its direction in the corresponding direction. For example, if it hits the side wall,
it will rotate in the other x direction which makes sense. Until it hits a wall, it will continue spinning in its initial direction.

I abritrarily chose the balls to change their radians in denominations of 5, since it appeared the most realistic.