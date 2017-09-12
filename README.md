# Airgap #

<https://github.com/lrvick/airgap>

## About ##

A live debian based distribution designed for managing secrets offline.

Built for those of us that want to be -really- sure our most important secrets
are managed in a clean environment with an "air gap" between us and the
internet.

## Use Cases ##
- Generate GPG keychain
- Store/Restore gpg keychain to security token such as a Yubikey or Nitrokey
- Signing cryptocurrency transactions
- Generate/backup BIP39 universal cryptocurrency wallet seed
- Store/Restore BIP39 seed to a hardware wallet such as a Trezor or Ledger

## Tools ##

### Hardware Security Modules
- [btchip]: Utilities to interact with Ledger hardware wallets
- [trezorctl]: Utilities to interact with Trezor hardware wallet
- [keepkeyctl]: Utilities to interact with Keepkey hardware wallets
- [yubico-piv-tool]: Interact with PIV application on Yubikey
- [yubikey-hsm]: Manage YubiHSM Hardware Security Modules for servers.
- [yhsm-tools]: Various utilities for use of YubiHSM.
- [yubikey-personalization]: Various settings management for yubikeys.
- [ykneomgr]: Modify settings for Yubikey Neo

### Cryptocurrency
- [gen-hdwallet]: Simple script to export a bip44 wallet as jsony
- [bip32-utils]: Generate/manage BIP32 cryptocurrency wallets
- [bx]: Bitcoin tools for signing transactions, managing keys, etc.
- [electrum]: Utilities for popular bitcoin wallet format

### Entropy
- [haveged]: Dameon that acts as a software random number generator
- [rng-tools]: Daemon that supports many different hardware TRNG devices
- [infnoise]: Fetch entropy from the Infinite Noise TRNG

### Cryptography
- [gen-gpgchain]: Generate 4096RSA gpg keychain suitable for a hardware token
- [gnupg]: Perform PGP operations for local keys or smartcards
- [scrypt]: creating password key derivations using the Script algorithm
- [ssdeep]: Recursive piecewise hashing tool
- [hash-slinger]: Create TLSA records for the DANE protocol
- [seccure]: Tools for elliptic curve cryptography
- [monkeysphere]: Utilities for extended use cases of OpenGPG
- [pgpgpg]: Wrapper for using GnuPG in programs designed for PGP
- [signing-party]: Various OpenPGP related tools for assisting with signing.
- [pius]: Quick and easy signing of each UID on a PGP keyring
- [ssl-cert]: Simple debconf wrapper for OpenSSL
- [openssl]: Secure Socket Layer (SSL) binary and related cryptographic tools
- [gpgv]: GNU privacy guard - signature verification tool
- [pgpdump]: PGP packet visualizer
- [keyringer]: Distributed secret management using GnuPG and Git
- [keyutils]: Linux Key Management Utilities

### Backup
- [ssss]: Backup secrets into parts shared with multiple trusted individuals
- [paperkey]: Backup PGP key to paper in a human friendly format
- [qrencode]: Render data as QR code for easy transfer to mobile device
- [duplicity]: GPG encrypted backup solution
- [rsync]: Fast, versatile, remote (and local) file-copying tool

### Password Management
- [pass]: Simple text file based password manager based on GPG and Git
- [cpm]: Curses based password manager using PGP
- [kpcli]: Interact with KeePassX password manager databases
- [pwman3]: Console password managment application
- [passwordmaker-cli]: Creates unique, secure passwords - CLI version
- [apg]: Automated Password Generator - Standalone version
- [libpwqulity-tools]: Tools for password quality checking and generation
- [pwgen]: Automatic Password generation
- [donkey]: One Time Password calculator
- [otpw-bin]: Generate One Time Password lists
- [hashalot]: Read and hash a passphrase
- [yapet]: Yet Another Password Encryption Tool

### Password Recovery
- [hydra]: Very fast logon cracker
- [pdfcrack]: PDF files password cracker.
- [fcrackzip]: password cracker for zip archives
- [rarcrack]: Password cracker for rar archives
- [ophcrack-cli]: Microsoft Windows password cracker using rainbow tables
- [chntpw]: NT SAM password recovery utility
- [john]: Active password list creation and cracking tool
- [crack]: Password guessing program
- [lcrack]: A generic password cracker
- [nasty]: recover the passphrase of your PGP or GPG-key

### Release Management
- [twine]: Prepare/Sign Python packages
- [debsigs]: Sign Debian packages

### RFID / NFC
- [mfoc]: MiFare Password Cracker
- [mfcuk]: MiFare Classic Universal toolKit (MFCUK)
- [libfreefare]: Mifare/desfire manipulation tools
- [nfctool]: Manage NFC devices and read/write tags via neard.
- [neard]: Near Field Communication (NFC) management daemon
- [ndeftool]: Create/Manipulate NDEF formatted packets
- [cardpeek]: Tool to read the contents of ISO7816 smartcards
- [libchipcard-tools]: Tools for accessing chipcards
- [pcsc-tools]: Some tools to use with smart cards and PC/SC
- [rfdump]: Tool to decode RFID tag data

### Forensics / Reverse Engineering
- [binwalk]: Examine and extract files from binaries
- [mac-robber]: Collects data from allocated files in a mounted file system
- [rkhunter]: Rootkit, backdoor, sniffer and exploit scanner
- [chkrootkit]: Rootkit detector
- [unhide]: Find processes and TCP/UDP ports hidden by rootkits

### Utilities
- [vim]: Vi IMproved - enhanced vi editor
- [emacs]: GNU Emacs editor (metapackage)
- [nano]: Small, friendly text editor inspired by Pico
- [p7zip]: 7z file archiver with high compression ratio
- [jq]: Extract, manipulate, or create JSON
- [tmux]: Terminal window manager and multiplexer
- [ncdu]: Ncurses disk usage viewer
- [glances]: CLI curses based monitoring tool
- [htop]: Interactive processes viewer/manager
- [strace]: A system call tracer
- [gdb]: The GNU Debugger
- [guncat]: Catenates files while decrypting PGP-encrypted sections
- [zfsnap]: Automatic snapshot creation and removal for ZFS
- [zfs-fuse]: ZFS on FUSE
- [usbutils]: Examine attached USB devices

### Programming Languages
- [python]: interactive high-level object-oriented language
- [nodejs]: evented I/O for V8 javascript
- [perl]: Larry Wall's Practical Extraction and Report Language

[unhide]: http://www.unhide-forensics.info/
[usbutils]: https://github.com/gregkh/usbutils
[mfoc]: https://github.com/nfc-tools/mfoc
[mfcuk]: https://github.com/nfc-tools/mfcuk
[libfreefare]: http://www.nfc-tools.org/index.php?title=Libfreefare
[nfctool]: http://manpages.ubuntu.com/manpages/trusty/man1/nfctool.1.html
[ndeftool]: https://github.com/nfcpy/ndeftool
[infnoise]: https://github.com/waywardgeek/infnoise
[rng-tools]: https://www.kernel.org/doc/Documentation/hw_random.txt
[haveged]: http://issihosts.com/haveged/
[bx]: https://github.com/libbitcoin/libbitcoin-explorer/wiki
[hash-slinger]: https://packages.qa.debian.org/h/hash-slinger.html
[duplicity]: http://duplicity.nongnu.org/
[perl]: https://www.perl.org/
[yapet]: http://www.guengel.ch/myapps/yapet/
[otpw-bin]: http://www.cl.cam.ac.uk/~mgk25/otpw.html
[ssdeep]: http://ssdeep.sourceforge.net/
[hashalot]: http://www.paranoiacs.org/~sluskyb/
[kpcli]: http://kpcli.sourceforge.net/
[donkey]: https://devel.ringlet.net/security/donkey/
[seccure]: http://point-at-infinity.org/seccure/
[pius]: https://www.phildev.net/pius/
[cpm]: http://www.harry-b.de/dokuwiki/doku.php?id=harry:cpm
[nasty]: https://www.vanheusden.com/nasty/
[twine]: https://github.com/dstufft/twine
[mac-robber]: http://www.sleuthkit.org/mac-robber/desc.php
[rkhunter]: http://rkhunter.sourceforge.net/
[chkrootkit]: http://www.chkrootkit.org/
[zfsnap]: https://github.com/zfsnap/zfsnap
[zfs-fuse]: https://packages.qa.debian.org/z/zfs-fuse.html
[neard]: https://01.org/linux-nfc
[cardpeek]: http://pannetrat.com/Cardpeek/
[libchipcard-tools]: https://www.aquamaniac.de/sites/libchipcard/
[pcsc-tools]: http://ludovic.rousseau.free.fr/softwares/pcsc-tools/
[rfdump]: http://www.rfdump.org/
[htop]: http://hisham.hm/htop/
[keyringer]: https://keyringer.pw/
[keyutils]: http://people.redhat.com/~dhowells/keyutils/
[guncat]: https://fbb-git.github.io/guncat/
[gpgv]: https://www.gnupg.org/
[pgpdump]: http://www.mew.org/~kazu/proj/pgpdump/en/
[debsigs]: http://metadata.ftp-master.debian.org/changelogs/main/d/debsigs/unstable_changelog
[strace]: https://strace.io/
[gdb]: http://www.gnu.org/software/gdb/
[ssl-cert]: http://metadata.ftp-master.debian.org/changelogs/main/s/ssl-cert/unstable_changelog
[openssl]: https://www.openssl.org/
[vim]: http://www.vim.org/
[nano]: https://www.nano-editor.org/
[emacs]: https://packages.qa.debian.org/e/emacs-defaults.html
[glances]: https://nicolargo.github.io/glances/
[monkeysphere]: http://web.monkeysphere.info/
[pgpgpg]: https://packages.qa.debian.org/p/pgpgpg.html
[signing-party]: https://pgp-tools.alioth.debian.org/
[tmux]: https://github.com/tmux/tmux/wiki
[ncdu]: https://dev.yorhel.nl/ncdu
[rsync]: http://rsync.samba.org/
[p7zip]: http://p7zip.sourceforge.net/
[lcrack]: https://packages.qa.debian.org/l/lcrack.html
[rarcrack]: http://rarcrack.sourceforge.net/
[ophcrack-cli]: http://ophcrack.sourceforge.net/
[chntpw]: http://pogostick.net/~pnh/ntpasswd/
[john]: http://www.openwall.com/john/
[crack]: https://dropsafe.crypticide.com/alecm/software/crack/
[hydra]: https://www.thc.org/thc-hydra/
[pdfcrack]: http://pdfcrack.sourceforge.net/
[fcrackzip]: http://oldhome.schmorp.de/marc/fcrackzip.html
[python]: https://www.python.org/
[nodejs]: https://nodejs.org/en/
[jq]: https://stedolan.github.io/jq/
[pwgen]: https://packages.qa.debian.org/p/pwgen.html
[libpwqulity-tools]: https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
[passwordmaker-cli]: http://passwordmaker.org/
[apg]: https://packages.qa.debian.org/a/apg.html
[qrencode]: https://packages.qa.debian.org/q/qrencode.html
[gen-hdwallet]: https://github.com/lrvick/airgap/blob/master/scripts/gen-hdwallet
[gen-gpgchain]: https://github.com/lrvick/airgap/blob/master/scripts/gen-gpgchain
[bip32-utils]: https://pypi.python.org/pypi/bip32utils/0.3-1
[paperkey]: http://www.jabberwocky.com/software/paperkey/
[pass]: https://www.passwordstore.org/
[pwman3]: http://pwman3.github.io/pwman3/
[yubikey-hsm]: https://www.yubico.com/products/yubihsm/
[yubico-piv-tool]: https://developers.yubico.com/yubico-piv-tool/
[yubikey-personalization]: https://developers.yubico.com/yubikey-personalization/
[yhsm-tools]: https://developers.yubico.com/python-pyhsm/
[ykneomgr]: https://developers.yubico.com/libykneomgr/
[gnupg]: https://www.gnupg.org/
[electrum]: https://electrum.org/#home
[scrypt]: http://www.tarsnap.com/scrypt.html
[binwalk]: https://github.com/devttys0/binwalk
[trezorctl]: https://github.com/trezor/python-trezor
[ssss]: http://point-at-infinity.org/ssss/
[btchip]: https://github.com/LedgerHQ/btchip-c-api
[libbitcoin-explorr]: https://github.com/libbitcoin/libbitcoin-explorer/wiki

## Install ##

Download:
```
wget https://github.com/lrvick/airgap/releases/download/v0.0.1/airgap-201706210145.raw.gz
wget https://github.com/lrvick/airgap/releases/download/v0.0.1/airgap-201706210145.raw.gz.sig
```

Verify
```
gpg --recv-key 8E47A1EC35A1551D
gpg --verify airgap-201706210145.raw.gz.sig
```

Create bootable USB drive:
```
gunzip airgap-201706210145.raw.gz | pv | sudo dd of=/dev/sda
```

Note: The above assumes /dev/sda is a flash media device of 8GB or larger.

## Examples ##

### HD Cryptocurrency Wallet ###

#### Start Hardware Entropy Generator (Optional) ####

If you want to be extra paranoid you can use a hardware random number
generator such as an Infinite Noise or a TrueRNG.

This will rule out the possibility of a flaw in the software random number
generator built into your system that allows an attacker to predict it
and re-create any secret keys you generate during this process.

In the case of an Infinite Noise device you can insert it and run:

```
sudo infnoise --dev-random &
```

#### Generate 24 Word Mnemonic Seed ####

##### Option 1: Symmetric Encryption (Passphrase)  #####
```
bx seed -b 256 | bx mnemonic-new | gpg -ac > mnemonic.asc
```
##### Option 2: Asymmetric Encryption (To imported public key)  #####

You will need to copy your GPG public keys to a flash drive on another system.

Assuming the drive is is /dev/sda you could do:

```
mount /dev/sda1 /mnt/
gpg --import /mnt/your-pubkey.asc
bx seed -b 256 | bx mnemonic-new | gpg -aer 0xYOURKEYID > mnemonic.asc
```

#### Backup ####

##### Option 1: Flash Drive #####
Identify attached flash drive:
```
lsblk
```

Format (assuming drive is /dev/sdb):
```
sudo mkfs.ext4 -j /dev/sdb
```

Mount filesystem:
```
sudo mkdir /mnt/backup
sudo mount /dev/sdb /mnt/backup
```

Copy backup file:
```
cp mnemonic.asc /mnt/backup/
```

Unmount drive:
```
unmount /mnt/backup
```

##### Option 2: NFC Tag #####

Write (Assuming a common Mifare Classic tag):
```
ndeftool text "$(cat mnemonic.asc)" > mnemonic.ndef
sudo mifare-classic-write-ndef -y -i mnemonic.ndef
```

Verify:
```
sudo mifare-classic-read-ndef -y -o - \
  | ndeftool --silent load - print \
  | sed -e 's/^\([^-]\+\)-/-/g' \
  | gpg -d
```

#### Initialize Hardware Wallet ####

##### Trezor #####

```
gpg -d mnemonic.asc
trezorctl recovery_device -w 24 -t matrix
```

##### Keepkey #####

```
gpg -d mnemonic.asc
keepkeyctl recovery_device -w 24
```

##### Ledger #####
You will need to choose a pin code.

Assuming you choose PIN 12345678:
```
btchip_setup \
  "WALLET" \
  "RFC6979" \
  "" \
  "" \
  "12345678" # Your pin here \
  "" \
  "QWERTY" \
  "$(bx mnemonic-to-seed --language en $(gpg -d mnemonic.asc))" \
  "" \
  ""
```

## Development ##

To build an image suitable for a liveusb do:

```
make all
```

Boot image in qemu
```
gunzip dist/airgap-latest.raw.gz
qemu-system-x86_64 \
  -m 512M \
  -machine type=pc,accel=kvm \
  -drive format=raw,file=$(ls -1 dist/airgap-*.raw)
```

## Notes ##

  Things are still pretty early right now. Please report issues.

  Use at your own risk. You may be eaten by a grue.

  Questions/Comments?

  Reach out to me on IRC at:
  - lrvick@irc.hashbang.sh/6697
  - lrvick@irc.freenode.net/6697

  You can also find me on the web via:

  [Email](mailto://lance@lrvick.net) |
  [Blog](http://lrvick.net) |
  [Twitter](http://twitter.com/lrvick) |
  [Facebook](http://facebook.com/lrvick) |
  [Google+](http://plus.google.com/109278148620470841006) |
  [YouTube](http://youtube.com/lrvick) |
  [Last.fm](http://last.fm/user/lrvick) |
  [LinkedIn](http://linkedin.com/in/lrvick) |
  [Github](http://github.com/lrvick/)
