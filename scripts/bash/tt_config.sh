#!/bin/bash

# Produces a test consisting of 40 random words drawn from your system's dictionary.
alias ttr="shuf -n 40 /usr/share/dict/words|tt"

# Produces a test consisting of a random quote.
alias ttq="curl http://api.quotable.io/random|jq '[.text=.content|.attribution=.author]'|tt -quotes -"

# Creates an alias called ttd which keeps a log of progress in your home directory`.
alias ttd="tt -csv >> ~/wpm.csv"
