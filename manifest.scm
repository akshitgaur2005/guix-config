;; This "manifest" file can be passed to 'guix package -m' to reproduce
;; the content of your profile.  This is "symbolic": it only specifies
;; package names.  To reproduce the exact same profile, you also need to
;; capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(specifications->manifest
  (list "fd"
        "ripgrep"
        "emacs-ivy-rich"
        "emacs-which-key"
        "emacs-helpful"
        "emacs-doom-themes"
        "emacs-rainbow-delimiters"
        "nss-certs"
        "wget"
        "curl"
        "fish"
        "qbittorrent"
        "ungoogled-chromium"
        "gamescope"
        "steam-nvidia"
        "xorg-server-xwayland"
        "libreoffice"
        "steam"
        "vscodium"
        "emacs"
        "nvidia-system-monitor"
        "flatpak"
        "git"
        "kitty"
        "librewolf"
        "font-microsoft-times-new-roman"
        "exfatprogs"
        "neovim"))
