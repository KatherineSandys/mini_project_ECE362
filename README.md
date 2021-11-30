# ECE362_Mini_Project

# Submission 2:

## Internal Peripherals: ADC DAC GPIO SPI I2C

## External Peripherals: Analog SPI I2C

## What are you making?

### Splitting project description into describing the physical hardware, and then what it will be doing.

### Hardware Description:
ILI9341 driven 320x240 3.5" TFT Display controller via SPI.
I2C button matrix (Adafruit Product ID 1616, Trellis 4x4 Keypad) with internal LEDs. LEDs are controlled independently of whether buttons are pushed or not. Button state can be read via I2C, and LED state written via I2C.
Touchscreen on top of TFT: Resistive touchscreen overlay, read via 2 ADC channels giving XY coordinates of touch. calibrated via mapping recorded touch points to position user was told to press on the LCD screen (this is the standard way to calibrate these). Some GPIO used to control additional control signals such as D/C line.
(Tentative, will use if time allows for game menu, otherwise will use button matrix)
-Note- both display and keypad matrix are already owned by a team member and don't need to be purchased.
Audio output: Simple audio output via circuitry used in class to headphones. Will use DAC along with DMA to output music during gameplay.

### Operational Description:
A memory game using buttons. The screen will show you the buttons that need to be pressed along with the corresponding buttons lighting up. 
The screen will show what order each needs to be pressed in by superimposing a number on the representation of the buttons on the screen. 
The screen will only show these details for a short period of time, during which the player must memorize this sequence to be able to win. 
Once the screen stops showing the order and the buttons, the user must then press the buttons in the correct order. 
They have an unlimited amount of time to do so. The more buttons pressed and more sequences that they have been through, the higher the score will be.
Once the display has stopped showing what buttons should be pressed, it will display points, a count-up timer, and a representation of what buttons are currently neing pressed.
Of course, Tetris music will be played during operation for the nice ambiance it has.

## How will you demonstrate it?
The game will be played with music in the background.
The aim is to score as many points possible as you complete the game.
As you press the buttons in the correct order for a given problem the score will increase.
If you do not press the correct buttons in the correct order you do not achieve any remaining points for that level.

## What are the criteria for a successful project?

### Hardware requirements:
full control over contents of display
touchscreen properly calibrated, touch points properly map to intended location of press on the LCD.
no visible delay between pressing of keypad and any requisite lighting of keys.
audible audio, with no unpleasant crackles or pops caused by software delay.

### Software
Points are only awarded for correct gameplay, i.e. only when buttons are pressed in the sequence directed.
Display properly shows the buttons to be pressed as well as the sequence in which they should be pressed.
LEDs on keyad light when sequence is shown.
