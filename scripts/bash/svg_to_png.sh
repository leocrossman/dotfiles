#!/bin/bash

echo Enter width:
read width

echo Enter height:
read height

echo Enter input image:
read input

echo Enter output image:
read output

# Inkscape older than v1.0
# inkscape -z -w 1024 -h 1024 input.svg -e output.png
inkscape -z -w $width -h $height $input.svg -e png/${output}.png
