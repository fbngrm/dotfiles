audio-srv:
	sudo pacman -S --needed --noconfirm \
		mpd \
		pulseaudio \
		pulseaudio-alsa \
		pulseaudio-bluetooth
	ln -vsf "${PWD}/mpd/mpd.conf" "${HOME}/.config/mpd/mpd.conf"
	ln -vsf "${PWD}/mpd/playlists" "${HOME}/.config/mpd/playlists"
	systemctl --user enable mpd.service

audio-cli:
	sudo pacman -S --needed --noconfirm \
		mpv \
		ncmpcpp
	ln -vsf "${PWD}/ncmpcpp" "${HOME}/.config"


audio: audio-srv audio-cli

ranger:
	sudo pacman -S --needed --noconfirm ranger
	ln -vsf "${PWD}/ranger/rc.conf" "${HOME}/.config/ranger/rc.conf"

zsh-cfg:
	ln -vsf "${PWD}/zsh/aliases.sh" "${HOME}/.bash_aliases"
	ln -vsf "${PWD}/zsh/zshrc" "${HOME}/.zshrc"
	ln -vsf "${PWD}/zsh/profile.sh" "${HOME}/.profile"
	ln -vsf "${PWD}/zsh/theme" "${HOME}/.grimme.zsh-theme"

zsh-setup:
	sudo pacman -S --needed --noconfirm zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	sh chsh -s /usr/bin/zsh

zsh: zsh-cfg zsh-setup

brightnessctl:
	sudo pacman -S --needed --noconfirm brightnessctl

capture-pkgs:
	sudo pacman -S --needed --noconfirm \
		grim \
		slurp \
		wf-recorder \
		wl-clipboard \

capture-cfg:
	sudo ln -sf "${PWD}/capture/screen-capture.sh" /usr/local/bin/dotfiles--screen-capture
	sudo ln -sf "${PWD}/capture/selection-capture.sh" /usr/local/bin/dotfiles--selection-capture
	sudo ln -sf "${PWD}/capture/selection-record.sh" /usr/local/bin/dotfiles--selection-record

capture: capture-pkgs capture-cfg

docker:
	sudo pacman -S --needed --noconfirm \
		docker \
		docker-compose

dropbox-pkgs:
	curl -Lo - https://www.dropbox.com/download?plat=lnx.x86_64 | tar xzf - -C ~

dropbox-srv:
	mkdir -vp "${HOME}/.config/systemd/user"
	cp -v "${PWD}/dropbox/service.ini" "${HOME}/.config/systemd/user/dropbox.service"
	systemctl --user daemon-reload
	systemctl --user enable dropbox.service
	systemctl --user start dropbox.service

dropbox: dropbox-pkgs dropbox-srv

dunst-pkgs:
	sudo pacman -S --needed --noconfirm \
		libnotify \
		dunst \

dunst-cfg:
	mkdir -vp "${HOME}/.config/dunst"
	ln -vsf "${PWD}/dunst/config.cfg" "${HOME}/.config/dunst/dunstrc"
	sudo ln -vsf "${PWD}/dunst/notification.sh" /usr/local/bin/dotfiles--notification-play-sound

dunst-srv:
	mkdir -vp "${HOME}/.config/systemd/user"
	cp -v "${PWD}/dunst/service.ini" "${HOME}/.config/systemd/user/dunst.service"
	systemctl --user daemon-reload
	systemctl --user enable dunst.service
	systemctl --user start dunst.service

dunst: dunst-pkgs dunst-cfg dunst-srv

fonts:
	mkdir -vp "${HOME}/.config/fontconfig"
	ln -vsf "${PWD}/fonts/config.conf" "${HOME}/.config/fontconfig/fonts.conf"
	cp -v ${PWD}/fonts/*.ttf "${HOME}/.local/share/fonts/"
	fc-cache -fv

gammastep-pkgs:
	sudo pacman -S --needed --noconfirm \
		gammastep \

gammastep-cfg:
	mkdir -vp "${HOME}/.config/gammastep"
	ln -vsf "${PWD}/gammastep/config.ini" "${HOME}/.config/gammastep/config.ini"

gammastep-srv:
	mkdir -vp "${HOME}/.config/systemd/user"
	cp -v "${PWD}/gammastep/service.ini" "${HOME}/.config/systemd/user/gammastep.service"
	systemctl --user daemon-reload
	systemctl --user enable gammastep.service
	systemctl --user start gammastep.service

gammastep: gammastep-pkgs gammastep-cfg gammastep-srv


gnupg-cfg:
	mkdir -vp "${HOME}/.gnupg"
	ln -vsf "${PWD}/gnupg/config.cfg" "${HOME}/.gnupg/gpg-agent.conf"
	sudo ln -vsf "${PWD}/gnupg/password-to-clipboard.sh" /usr/local/bin/dotfiles--password-to-clipboard
	sudo ln -vsf "${PWD}/gnupg/pam.cfg" "/etc/pam.d/system-local-login"

gnupg: gnupg-pkgs gnupg-pkgs-aur gnupg-cfg

guis-pkgs:
	sudo pacman -S --needed --noconfirm \
		chromium \
		filezilla \
		libreoffice-fresh \
		thunderbird \

guis-pkgs-aur: yay
	yay -S --needed --noconfirm \
		postman-bin \
		slack-desktop \
		telegram-desktop \

guis: guis-pkgs guis-pkgs-aur

kitty-pkgs:
	sudo pacman -S --needed --noconfirm \
		kitty \

kitty-cfg:
	mkdir -vp "${HOME}/.config/kitty"
	ln -vsf "${PWD}/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
	ln -vsf "${PWD}/kitty/theme.conf" "${HOME}/.config/kitty/theme.conf"
	ln -vsfn "${PWD}/kitty/sessions" "${HOME}/.config/kitty/sessions"

kitty: kitty-pkgs kitty-cfg

neovim-pkgs:
	sudo pacman -S --needed --noconfirm neovim

neovim-cfg:
	ln -vsfn "${PWD}/nvim/init.vim" "${HOME}/.config/nvim/init.vim"
	ln -vsfn "${PWD}/nvim/snippets" "${HOME}/.config/nvim/UltiSnips"
	# sudo ln -vsf "${PWD}/nvim/editor.sh" "/etc/profile.d/"

neovim: neovim-pkgs neovim-cfg

network-manager-pkgs:
	sudo pacman -S --needed --noconfirm \
		networkmanager \

network-manager-srv:
	sudo systemctl enable NetworkManager
	sudo systemctl start NetworkManager

network-manager: network-manager-pkgs network-manager-srv

pipewire-pkgs:
	sudo pacman -S --needed --noconfirm \
		pipewire \
		pipewire-media-session \
		xdg-desktop-portal \
		xdg-desktop-portal-wlr \

pipewire-srv:
	systemctl --user enable pipewire.service
	systemctl --user start pipewire.service

pipewire: pipewire-pkgs pipewire-srv

rofi-pkgs:
	sudo pacman -S --needed --noconfirm \
		rofi \

rofi-cfg:
	mkdir -vp "${HOME}/.config/rofi"
	ln -vsf "${PWD}/rofi/config.rasi" "${HOME}/.config/rofi/config.rasi"

rofi: rofi-pkgs rofi-cfg

sway-pkgs:
	sudo pacman -S --needed --noconfirm \
		wayland \
		xorg-xwayland \
		sway \

sway-cfg:
	mkdir -vp "${HOME}/.config/sway"
	ln -vsf "${PWD}/sway/config.cfg" "${HOME}/.config/sway/config"

sway: rofi sway-pkgs sway-cfg

waybar-pkgs:
	sudo pacman -S --needed --noconfirm \
		waybar \
		fmt \

waybar-cfg:
	mkdir -vp "${HOME}/.config/waybar"
	ln -vsf "${PWD}/waybar/config.json" "${HOME}/.config/waybar/config"
	ln -vsf "${PWD}/waybar/style.css" "${HOME}/.config/waybar/style.css"

waybar: waybar-pkgs waybar-cfg

pet-install:
	mkdir -p $GOPATH/src/github.com/knqyf263
	cd $GOPATH/src/github.com/knqyf263
	git clone https://github.com/knqyf263/pet.git
	cd pet
	make install

pet-cfg:
	mkdir -vp "${HOME}/.config/pet"
	ln -vsf "${PWD}/pet/config.toml" "${HOME}/.config/pet/config.toml"
	ln -vsf "${PWD}/pet/snippet.toml" "${HOME}/.config/pet/snippet.toml"

pet: pet-cfg pet-install

git-pkg:
	sudo pacman -S --needed --noconfirm git

git-cfg:
	ln -vsf "${PWD}/git/gitconfig" "${HOME}/.gitconfig"
	ln -vsf "${PWD}/git/gitconfig_work" "${HOME}/.gitconfig_work"
	ln -vsf "${PWD}/git/gitignore_global" "${HOME}/.gitignore_global"

git: git-pkg git-cfg

nicotine:
	sudo pacman -S --needed --noconfirm nicotine+

.PHONY: \
	zsh \
	capture \
	dropbox \
	dunst \
	fonts \
	gammastep \
	gnupg \
	install \
	kitty \
	neovim \
	rofi \
	git \
	nicotine \
	dropbox \

install: \
	git \
	audio \
	bash \
	brightnessctl \
	capture \
	docker \
	dropbox \
	dunst \
	fonts \
	gammastep \
	gnupg \
	guis \
	hledger \
	kitty \
	neovim \
	network-manager \
	pipewire \
	rofi \
	sway \
	waybar \
	nicotine \
