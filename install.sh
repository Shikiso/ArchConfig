echo "sup bruh gonna install sum things :)"


# Installing packages made it auto yes
packages=("kitty" "nvim" "picom" "broot" "feh" "fastfetch" "i3blocks" "i3lock" "i3-status" "i3-wm" "zsh")

for package in "${packages[@]}"; do
  yes | sudo pacman -S "${package}" |
  if command -v "${package}" &>/dev/null; then
    echo "${package} failed to install!"
  fi
done

# Copy Configs over
userConfigFolder="$HOME/.config/"

configs="./configs"
for file in "$configs"/*; do
  config=$(echo "$file" | tr '.' '/' | tr '_' '.')
  cp ./configs/${file} "${userConfigFolder}${config:1}"
done

# Moving background images
if test -d ~/Pictures/Background/; then
  echo "Background folder exists!"
else
  mkdir ~/Pictures/Background/
fi 

cp ./images/Acheron+Black+Hole.png ~/Pictures/Background/
cp ./images/purple-aesthetic-anime-77bzbfv29ertde6w.jpg ~/Pictures/Background/

# Load Configs
nvim
reboot
