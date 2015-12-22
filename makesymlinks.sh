#! /bin/bash
# -------------------------------------------------
# file: $HOME/scripts/makesymlinks.sh
# author    jls - http://sjorssparreboom.nl
# vim:nu:ai:si:et:ts=4:sw=4:fdm=indent:fdn=1:ft=vim:
# ----------------------------------------------------
source $HOME/scripts/term_colors.sh

dir=~/dotfiles              #dofiles directory
olddir=~/dotfiles_old       #old dotfiles directory (for backup purposes)
file=$dir/dotstracker
arrow=$(printf "$COL_CYAN  => $COL_RESET")
k=1

printf "$COL_GREEN# Creating directories\n# -------------------------------------------------------------------\n"
mkdir -p $dir $olddir 2>/dev/null
printf "$COL_CYAN  => $COL_RESET $dir\n"
printf "$COL_CYAN  => $COL_RESET $olddir\n"
printf "$COL_GREEN# -------------------------------------------------------------------\n\n$COL_RESET"
printf "  Done...\n\n"

printf "$COL_GREEN# Reading $file\n# -------------------------------------------------------------------\n$COL_RESET"
while read file;do
printf "$COL_GREEN# Current dotfile:\n# -------------------------------------------------------------------\n$COL_RESET"
    printf "$COL_CYAN  =>$COL_RESET  .$file\n"
    printf "$COL_GREEN# -------------------------------------------------------------------\n\n$COL_RESET"
    for f in $file; do
        printf "$COL_RED# Moving existing dotfiles from $HOME to $olddir\n"
        printf "$COL_RED# -------------------------------------------------------------------\n$COL_RESET"
        printf "$arrow Moving $HOME/.$file to $olddir!\n"
        mv $HOME/.$file $olddir 2>/dev/null
        printf "$COL_RED# -------------------------------------------------------------------\n\n$COL_RESET"
        printf "$COL_YELLOW# Creating symlink to .$file in $HOME\n$COL_RESET"
        printf "$COL_YELLOW# -------------------------------------------------------------------\n$COL_RESET"
        printf "$arrow Symlinking $dir/$file to .$file\n"
        ln -s $dir/$file $HOME/.$file 2>/dev/null
        printf "$COL_YELLOW# -------------------------------------------------------------------\n\n$COL_RESET"
    done
    ((k++))
done < $file
printf "Total amount of files moved: $((k-1))\n"

zsh () {
    # Check zshell is installed
    if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
        # Set the default shell to zsh if it isn't currently set to zsh
        if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
            chsh -s $(which zsh)
        fi
    else
        # Get the platform of the current machine
        platform=$(uname);
        # If the platform is Linux, try an apt-get to install zsh and then recurse
        if [[ $platform == 'Linux' ]]; then
            if [[ -f /etc/redhat-release ]]; then
                sudo yum install zsh
                zsh
            fi
            if [[ -f /etc/debian_version ]]; then
                sudo apt-get install zsh
                zsh
            fi
            if [[ -f /etc/arch-release ]]; then
                sudo pacman -S zsh
                zsh
            fi
            # If the platform is OS X
        elif [[ $platform == 'Darwin' ]]; then
            echo "Please install zsh, then re-run this script!"
            exit
        fi
    fi
}

zsh
