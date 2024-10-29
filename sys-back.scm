;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules 
  (gnu) 
  (nongnu packages linux)
  (nongnu system linux-initrd)
  (gnu services xorg)
)
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (kernel linux-xanmod)  ;; Changed from just 'linux' to specific version
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
  (packages (append (list (specification->package "awesome")
                         (specification->package "i3-wm")
                         (specification->package "i3status")
                         (specification->package "dmenu")
                         (specification->package "st")) 
                   %base-packages))
  
  ;; System services
  (services (append
             (list (service gnome-desktop-service-type)
                   (service openssh-service-type)
                   (service tor-service-type)
                   (set-xorg-configuration
                    (xorg-configuration (keyboard-layout keyboard-layout)))
             %desktop-services)))
  
  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  
  ;; File systems
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
                      %base-file-systems)))
