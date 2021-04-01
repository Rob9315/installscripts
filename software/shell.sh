#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

# just some text
powlvl10kprezshrctext='# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi' 
powlvl10kpostzshrctext='# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh'

# change default shell
sudo chsh --shell /bin/zsh $USER

# install fonts
sudo wget -nc -P /usr/share/fonts \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf \
  https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# reload font cache if not already exists
fc-list | grep -q "MesloLGS NF" || fc-cache -f -v

# install oh-my-zsh
export RUNZSH=no
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k || git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull -f
# add default powerlevel10k text in front of .zshrc
grep -q $powlvl10kprezshrctext ~/.zshrc || sed -i "1s+^+$powlvl10kprezshrctext\n+" ~/.zshrc
# add default powerlevel10k text in the end of .zshrc
grep -q $powlvl10kpostzshrctext ~/.zshrc || echo $powlvl10kpostzshrctext >> ~/.zshrc

# set powerlevel10k as oh-my-zsh theme
sed -E -i 's+ZSH_THEME=".*"+ZSH_THEME="powerlevel10k/powerlevel10k"+g' ~/.zshrc
