# vgm-player-bbc

## VGM music players for the SN76489-based 6502 BBC Micro.

This project contains 6502 source code that will playback music using various file formats and playback techniques.

Despite the name of the project, the routines in this project do not play `.VGM` files "as-is" because VGM is quite a complex format that requires a lot of storage (for 8-bit computers anyway), so there are two principle ways the data is pre-processed into a more compact data format.

1. `VGMPLAY` Using [Vgm Converter](https://github.com/simondotm/vgm-converter) to create a compact `.RAW` or `.BIN` file version of the VGM data, which is then compressed using Exomizer.
2. `VGCPLAY` Using [Vgm Packer](https://github.com/simondotm/vgm-packer) to create a compressed `.VGC` file version of the VGM data, which is played back using a custom decoder.

For the second player, there are two types of playback engine:
1. Standard 50Hz playback
2. "Bass Enhanced" 50Hz playback with 6522 IRQ routines to synthesize squarewave frequencies below 122Hz that the 4Mhz SN76489 cannot normally reproduce





