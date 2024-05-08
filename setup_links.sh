#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

ln -sfn $DIR/.bashrc ~/.bashrc
ln -sfn $DIR/.vim ~/.vim
ln -sfn $DIR/.vimrc ~/.vimrc
ln -sfn $DIR/.tmux.conf ~/.tmux.conf
ln -sfn $DIR/.gitconfig ~/.gitconfig
ln -sfn $DIR/.gitignore_global ~/.gitignore_global
ln -sfn $DIR/background.png ~/.background.png
ln -sfn $DIR/.dircolors ~/.dircolors
ln -sfn $DIR/.inputrc ~/.inputrc

mkdir -p ~/.config
ln -sfn $DIR/.config/* ~/.config/

mkdir -p ~/.fonts
ln -sfn $DIR/.fonts/* ~/.fonts/

#update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/local/bin/st 50

#make this a link?
# for touchpad and trackpoint
#sudo cp $DIR/40-libinput.conf /usr/share/X11/xorg.conf.d/40-libinput.conf
# for xbacklight
#sudo cp $DIR/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf

# X390 font size: 18 pixel tall

#notes for x390 install, start with ubuntu minimal
#sudo apt install compton

#notes for t440p install, start with ubuntu server
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
