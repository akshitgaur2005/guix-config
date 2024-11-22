(list (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (branch "master")
        (introduction
          (make-channel-introduction
            "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
            (openpgp-fingerprint
              "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))

      (channel
	(name 'sakura)
	(url "https://g.freya.cat/freya/sakura")
	(branch "main")
	(introduction
	  (make-channel-introduction
	    "8fb2f9c2fa414754c41c1c73665e3e73e12693ab"
	    (openpgp-fingerprint
	      "3CD3 65F0 373C EB13 853A  F568 9FBC 6FFD 6D2D BF17"))))

      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
