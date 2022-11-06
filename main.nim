import ioutils
type
  TMultiboot_header = object
  PMultiboot_header = ptr TMultiboot_header

proc kmain(mb_header: PMultiboot_header, magic: int) {.exportc.} =
  if magic != 0x2BADB002:
    discard # Something went wrong?
  
  let bg = LightBlue
  var vram = cast[PVIDMem](0xB8000)
  screenClear(vram, bg) # Make the screen yellow.

  # Demonstration of error handling.
  var x = len(vram[])
  # var outOfBounds = vram[x]
  # A loop to maybe have a animating display
  while 1 != 0:
    # The screen clear system
    #screenClear(vram, bg)
    let attr = makeColor(bg, Black)
    writeString(vram, "\"Nim\" -Imagineee 2022", attr, (25, 9))
    writeString(vram, "Expressive. Efficient. Elegant.", attr, (25, 10))
    rainbow(vram, "It's quite simple.", bg, (x: 25, y: 11))
    writeString(vram, "nimkernal-ex (by imagineee)", makeColor(bg, LightCyan), (VGAWidth-27, VGAHeight-1))

