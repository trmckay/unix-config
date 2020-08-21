#!/bin/bash

paccache -r
pacman -Rns $(pacman -Qtdq)
