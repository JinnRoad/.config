class Locations:
    def __init__(self, size, type):
        self.width, height = size
        self.height = height//2
        if type == 'fullscreen':
            self.lesson = (self.width//6, self.height)
            self.code = (self.width//2, self.height)
        elif type == 'splitscreen':
            self.lesson = (self.width*7//12, self.height)
            self.code = (self.width*3//4+50, self.height)
        else:
            raise TypeError('unsupported type for \'Location\'')

"""
Screen calculations

Full screen
_____________
|   |   |   |
| a | b |   |
|___|___|___|

b = 1/2
a = 1/6


Split screen
_____________
|     | | | |
|     |a|b| |
|_____|_|_|_|

b = 3/4
a = (2/3 + 1/2)/2
  = (4+3)/6/2
  = 7/12
"""

