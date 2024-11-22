;; This is an operating system configuration generated
;; by the graphical installer.

(use-modules 
  (gnu) 
  (gnu services desktop)
  (gnu services xorg)
  (nongnu packages linux)
  (nongnu system linux-initrd)
  (nongnu packages nvidia)
  (nongnu services nvidia)
)
(use-service-modules cups desktop networking ssh xorg nix)
(use-package-modules
  wm
  video
  version-control
  terminals
  xdisorg
  web-browsers
  package-management
)

(operating-system
  (kernel linux)
  (kernel-arguments '("modprobe.blacklist=nouveau"
                     "nvidia_drm.modeset=1"))
  (initrd microcode-initrd)
  (firmware (list linux-firmware))
  (locale "en_IN.utf8")
  (timezone "Asia/Kolkata")
  (keyboard-layout (keyboard-layout "us"))
  (host-name "guix")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "akshit")
                  (comment "Akshit Gaur")
                  (group "users")
                  (home-directory "/home/akshit")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide
  (packages (append (map specification->package
			 '("i3-wm" "i3status" "dmenu" "st"
			   "hyprland" "wofi" "mako" "wireplumber" "pipewire"
			   "mpv" "git" "nix"))
		    %base-packages))

  ;; Services configuration
  (services (append
    (list 
      (service nix-service-type)
      (service nvidia-service-type)
      ;; Configure GDM login manager
      (service gnome-desktop-service-type)
      ;; Configure Xorg with NVIDIA support
      (set-xorg-configuration
       (xorg-configuration
        (keyboard-layout keyboard-layout)
        (modules (cons nvda %default-xorg-modules))
        (drivers '("nvidia"))))
      ;; Added OpenSSH service with updated configuration
      ;;(service openssh-service-type
      ;;         (openssh-configuration
      ;;          (permit-root-login 'prohibit-password)
      ;;          (password-authentication? #f)))
      ;; Added basic Tor service
      ;; (service tor-service-type)
      )
    %desktop-services
    ;; Use desktop services but remove conflicting ones
    ;;(modify-services %desktop-services
    ;;                (delete gdm-service-type)
    ;;                )
    ))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))

  ;; File systems configuration
  (file-systems (cons* (file-system
                         (mount-point "/")
                         (device (uuid
                                  "b171fd0a-1d5d-4472-a507-e5adf325f7d0"
                                  'ext4))
                         (type "ext4"))
                       (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "6CC4-5E90"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/home/akshit/storage")
                         (device (uuid
                                  "44d8d8ec-d939-409c-93c2-22c955f5111c"
                                  'ext4))
                         (type "ext4"))
                       %base-file-systems)))
