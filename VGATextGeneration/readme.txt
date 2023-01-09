My attempt to make text generation easier on VGA.
This project uses a singular ROM to decode ASCII to a 8x16 bit pattern of the character. E.g. ASCII 0x46 uses the ROM to decode and read the bit pattern for character 'F'.

Features:
1. You can pass in a character via ASCII code that you wish to display
 (such as reading from a memory file)
2. You can control where the character is displayed via desired X,Y inputs
3.  If data to display is wired to another module, this data updates in real-time on display
4. Each character displayed only needs to instantiate one module.
