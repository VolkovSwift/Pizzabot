# Pizzabot

Pizzabot - command line application for calculating movement directions for Pizzabot.

## How it works

Pizzabot moves on the grid (where each point on the grid is one house) by the following instructions:
 - N: Move north
 - S: Move south
 - E: Move east
 - W: Move west
 - D: Drop pizza

We set grid size and list of points in the format: **"5x5 (1, 3) (4, 4)"** where:
- **5x5** - grid width and height parameters
- **(1, 3) (4, 4)** - destination points


## How to execute
- Open project
- Select Pizzabot scheme
- Build the project ('cmd + B')
- Go to the products folder
- Drag pizzabot file to the terminal window
- Add string with coordinates (For example: "5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)”)
- Execute

Full example should look like this:
'/Users/uladzislau.volkau/Library/Developer/Xcode/DerivedData/Pizzabot-czgxerlditsxxfatosxhscbdhers/Build/Products/Debug/Pizzabot "5x5 (4,1)”'

## How to rus tests
- Select PizzabotTests scheme
- Run tests ('cmd + U')

