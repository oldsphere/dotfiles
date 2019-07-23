Notes on WSL
================================================================================

## Remove the anoying beep
* I tend to use a lot the shell and vim, and both can have that irritating
  "beep" sound.

* For vim just add `set belloff=all` in `.vimrc`  
* for zsh add `unsetopt BEEP` on `.zshrc`
  Seen on https://blog.vghaisas.com/zsh-beep-sound/


## Adding fonts for powershell
* Install the fonts using `pip`

```bash
sudo apt-get install python-fontforge python-pip python-dev libfreetype6-dev fonts-powerline
```

* Install `powershell` tool

```bash
rc
cd src
git clone https://github.com/banga/powerline-shell
cd powerline-shell
python setup.py install

cd ~
git clone https://github.com/powerline/fonts.git --depth=
cd fonts
./install.sh
```

* Navigate to this folder and launch `install.ps1` on powershell.

* Select `DejaVu Sans Mono for Powershell` font on the shell terminal.

Seen how to install in https://thecustomizewindows.com/2018/01/install-powerline-fonts-symbols-bash-windows-10/
