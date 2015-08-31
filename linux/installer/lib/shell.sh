#
# Shell specifics
#


ln -s `pwd`/../../.bashrc ~/.bashrc

# ----
# Tmux
#-----

apt-get install tmux
ln -s `pwd`/../../common/.tmux.conf ~/.tmux.conf

# Default status bar at bottom of tmux is pretty bland and basic.
pip install --user powerline-status

wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/ && mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/ && mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
