echo
echo "Configuring iTerm..."

cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Downloading patchable fonts..."

git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd .. && rm -rf fonts

