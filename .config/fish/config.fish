# ~/.config/fish/config.fish

# 1. SETTINGS
set -U fish_greeting ""
set -gx TERM xterm-256color
set -gx EDITOR nano
set -gx BROWSER zen-browser
fish_add_path ~/.local/bin

# 2. THEME (Catppuccin / Blue Archive Colors)
set -g fish_color_normal cdd6f4
set -g fish_color_command 89b4fa
set -g fish_color_param f5c2e7
set -g fish_color_keyword f38ba8
set -g fish_color_quote a6e3a1
set -g fish_color_redirection f5e0dc
set -g fish_color_end f9e2af
set -g fish_color_error f38ba8
set -g fish_color_gray 6c7086
set -g fish_color_selection --background=313244
set -g fish_color_search_match --background=313244
set -g fish_color_operator f5c2e7
set -g fish_color_escape eba0ac
set -g fish_color_autosuggestion 6c7086

# 3. INTERACTIVE SESSION
if status is-interactive

    # Initialize Starship Prompt
    starship init fish | source

    # Initialize Zoxide
    if type -q zoxide
        zoxide init fish | source
    end

    # Function to run your custom script instead of default fastfetch
    function fastfetch
        ~/.config/fastfetch/random_fetch.sh
    end

    # Aliases
    alias ..='cd ..'
    alias ...='cd ../..'
    alias ....='cd ../../..'

    if type -q eza
        alias ls='eza -l --icons --group-directories-first'
        alias la='ls -alh'
        alias ll='eza -al --icons --group-directories-first'
        alias tree='eza --tree --icons'
    end

    if type -q bat
        alias catb='bat'
    end

    alias c='clear'
    alias q='exit'
    alias cp='cp -iv'
    alias mv='mv -iv'
    alias rm='rm -iv'
    alias grep='grep --color=auto'

    # Config Shortcuts
    alias rice='nano ~/.config/hypr/hyprland.conf'
    alias waybarconf='nano ~/.config/waybar/config.jsonc'
    alias fishconf='nano ~/.config/fish/config.fish'
    alias fetch='fastfetch'

    # Arch Linux Package Management
    alias pac='sudo pacman -S'
    alias uwur='sudo pacman -Rns'
    alias update='sudo pacman -Syu'
    alias y='yay -S'

    # --- RUN ON STARTUP ---
    fastfetch

end
