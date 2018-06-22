# dotfiles

Start by cloning the repo into your home directory or another folder where you like
```
$ git clone https://github.com/JanDriesen/dotfiles.git
```

Then change in the repo folder and run the installation script
```
$ cd dotfiles && ./install.sh
```

The installation script will
+ install brew package manager
+ install zsh via brew
+ add zsh to the list of approved shells
+ change the default shell to zsh for the current user
+ install oh-my-zsh
+ install dockutil via brew
+ run a macOS settings script with my system defaults
