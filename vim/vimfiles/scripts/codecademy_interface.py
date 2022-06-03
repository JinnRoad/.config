import pyautogui as pag
import sys
import time

from codecademy_locations import Locations

type = 'fullscreen'

def main():
    if len(sys.argv) == 1:
        sys.argv.append('to')
    elif (direction := sys.argv[1]) not in ('to', 'from'):
        raise KeyError('script argument must be \'to\' or \'from\'')
    locs = Locations(pag.size(), type)
    original_position = (locs.lesson[0], pag.position()[1])
    pag.press('esc')
    pag.hotkey('alt', 'tab')
    pag.click(locs.code)
    pag.hotkey('ctrl', 'a')
    if direction == 'to':
        pag.hotkey('ctrl', 'v')
        time.sleep(0.25)
        pag.hotkey('ctrl', 'enter')
        pag.click(original_position)
    elif direction == 'from':
        pag.hotkey('ctrl', 'c')
        pag.click(locs.code)
        pag.click(original_position)
        pag.hotkey('alt', 'tab')
        pag.typewrite('P')
        pag.hotkey('alt', 'tab')

main()
