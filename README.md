# i3

This will explain what stems you need to have i3 setup theway you want and install all the necessary features

## required installations
```
sudo apt install pasystray &&\
sudo apt install gnome-tweak-tool &&\
sudo apt install i3blocks &&\
sudo apt install ranger &&\
sudo apt install cmus &&\
sudo apt install highlight &&\
sudo apt install scrot &&\
mkdir -p ~/Pictures/Scrot &&\
```

## install playerctl controll (ubuntu)
```
git clone https://github.com/acrisci/playerctl.git && \
cd playerctl && \
sudo apt-get install gtk-doc-tools gobject-introspection build-essential libglib2.0-dev && \
./autogen.sh && \
make && \
sudo make install && \
sudo ldconfig
```
