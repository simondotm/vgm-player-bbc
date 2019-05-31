@echo on
rem| VGM audio compile script
rem| @simondotm

echo Processing >vgm_process.txt

rem|-------------------------------------------------------------------------
rem| all audio is VGM SN76489 format transposed from NTSC to 4Mhz
rem| then converted to raw format 50Hz
rem| music is EXO compressed using a 256 byte dictionary
rem| sfx is just raw chip data
rem| After compilation we delete any intermediate files
rem|  and only keep the EXO or RAW file data.
rem|
rem| folders:
rem|  vgm - original vgm source files
rem|  vgm_out - converted vgm files
rem|
rem| the script will compile any VGM source files it finds in the "vgm" subfolders.
rem| the script uses a copied version of the "vgmconverter" python script from
rem|  https://github.com/simondotm/vgm-converter
rem|-------------------------------------------------------------------------

rem|---- compile the music ----

del vgm_out\*.bbc.vgm
del vgm_out\*.bin
del vgm_out\*.exo
for %%x in (vgm\*.vgm) do bin\vgmconverter.py "%%x" -n -t bbc -q 50 -r "vgm_out\%%~nx.bin" -o "vgm_out\%%~nx.bbc.vgm" >>vgm_process.txt
for %%x in (vgm_out\*.bin) do bin\exomizer.exe raw -c -m 256 "%%x" -o "vgm_out\%%~nx.bin.exo" >>vgm_process.txt
rem del vgm_out\*.bbc.vgm
rem del vgm_out\*.raw


rem pause