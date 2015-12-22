#! /bin/bash
#-------------------------------------------------
# file: $HOME/documents/scripts/term_colors.sh
#-------------------------------------------------
# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

printf "$COL_RED I'm Red\n"
printf "$COL_GREEN I'm Green\n"
printf "$COL_BLUE I'm Blue\n"
printf "$COL_YELLOW I'm Yellow\n"
printf "$COL_MAGENTA I'm Magenta\n"
printf "$COL_CYAN I'm Cyan\n"
