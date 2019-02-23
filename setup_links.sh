#!/usr/bin/env bash

ln -sfn ~/.dotfiles/.bashrc ~/.bashrc
ln -sfn ~/.dotfiles/.vim ~/.vim
ln -sfn ~/.dotfiles/.vimrc ~/.vimrc
ln -sfn ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -sfn ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/.dotfiles/background.png ~/.background.png
ln -sfn ~/.dotfiles/.dircolors ~/.dircolors
ln -sfn ~/.dotfiles/.inputrc ~/.inputrc

mkdir -p ~/.config
ln -sfn ~/.dotfiles/.config/* ~/.config/

mkdir -p ~/.fonts
ln -sfn ~/.dotfiles/.fonts/* ~/.fonts/

#don't need this for dwm
#update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 50

#dont need #sudo apt install wpasupplicant
  #sudo apt install wicd wicd-ncurses wicd-cli
  #install patched version of wicd-curses?
#sudo apt install rfkill
#sudo apt install xbase-clients
#sudo apt install xrdb
#sudo apt install x11-xserver-utils
#sudo apt install libX11-dev
#sudo apt install libxrandr-dev
#sudo apt install lm-sensors
#sudo apt install build-essential
#sudo apt install xinput
#dont need #sudo apt install xbacklight
  #https://gitlab.com/wavexx/acpilight.git
    #edit udev rules
#sudo apt install alsa-base
#sudo apt install pulseaudio
#sudo apt install ffmpeg
#sudo apt install scrot
#sudo apt install physlock

### t440p synaptics touchpad ###
#sudo apt install xserver-xorg-input-synaptics
  #copy /usr/share/X11/xorg.conf.d/*syanptics.conf /etc/X11/xorg.conf.d/
#Section "InputClass"
#        Identifier "touchpad"
#        MatchProduct "SynPS/2 Synaptics TouchPad"
#        Driver "synaptics"
#        # fix touchpad resolution
#        # Option "VertResolution" "100"
#        # Option "HorizResolution" "65"
#        # disable synaptics driver pointer acceleration
#        Option "MinSpeed" "1"
#        Option "MaxSpeed" "1"
#        # tweak the X-server pointer acceleration
#        Option "AccelerationProfile" "2"
#        Option "AdaptiveDeceleration" "1000"
#        Option "ConstantDeceleration" "16"
#        Option "VelocityScale" "30"
#        Option "AccelerationNumerator" "30"
#        Option "AccelerationDenominator" "10"
#        Option "AccelerationThreshold" "10"
#EndSection

#setup fonts directory
