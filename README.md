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
- [yubico-piv-tool]:
- [yubikey-hsm]:
- [yubico-personalization]:
- [yhsm-tools]:
- [ykneomgr]:

### Cryptocurrency
- [gen-hdwallet]: Simple script to export a bip44 wallet as jsony
- [bip32-utils]: Generate/manage BIP32 cryptocurrency wallets
- [bx]: Bitcoin tools for signing transactions, managing keys, etc.
- [electrum]: Utilities for popular bitcoin wallet format

### Cryptography
- [gen-gpgchain]: Generate 4096RSA gpg keychain suitable for a hardware token
- [gnupg]: Perform PGP operations for local keys or smartcards
- [haveged]: Dameon that generates random entropy for secure key creation.
- [scrypt]: creating password key derivations using the Script algorithm
- [ssdeep]: Recursive piecewise hashing tool
- [hash-slinger]: Create TLSA records for the DANE protocol
- [seccure]: Tools for elliptic curve cryptography
- [monkeysphere]:
- [pgpgpg]:
- [signing-party]:
- [pius]:
- [ssl-cert]:
- [openssl]:
- [gpgv]:
- [pgpdump]:
- [keyringer]:
- [keyutils]:

### Backup
- [ssss]: Backup secrets into parts shared with multiple trusted individuals
- [paperkey]: Backup PGP key to paper in a human friendly format
- [qrencode]: Render data as QR code for easy transfer to mobile device
- [duplicity]: GPG encrypted backup solution

### Password Management
- [pass]: Simple text file based password manager based on GPG and Git
- [cpm]: Curses based password manager using PGP
- [kpcli]: Interact with KeePassX password manager databases
- [pwman3]:
- [passwordmaker-cli]:
- [apg]:
- [libpwqulity-tools]:
- [pwgen]:
- [donkey]: One Time Password calculator
- [otpw-bin]: Generate One Time Password lists
- [hashalot]: Read and hash a passphrase
- [yapet]: Yet Another Password Encryption Tool

### Password Recovery
- [hydra]:
- [pdfcrack]:
- [fcrackzip]:
- [rarcrack]:
- [ophcrack-cli]:
- [chntpw]:
- [john]:
- [crack]:
- [lcrack]:
- [chntpw]:
- [nasty]: recover the passphrase of your PGP or GPG-key

### Release Management
- [twine]: Prepare/Sign Python packages
- [debsigs]: Sign Debian packages

### RFID / NFC
- [neard]:
- [cardpeek]:
- [libchipcard-tools]:
- [pcsc-tools]:
- [rfdump]:

### Forensics / Reverse Engineering
- [binwalk]: Examine and extract files from binaries
- [mac-robber]: Collects data from allocated files in a mounted file system
- [rkhunter]:
- [chkrootkit]:

### Utilities
- [jq]: Extract, manipulate, or create JSON
- [tmux]:
- [ncdu]:
- [rsync]:
- [p7zip]:
- [vim]:
- [nano]:
- [emacs]:
- [glances]:
- [strace]:
- [gdb]:
- [guncat]:
- [htop]:
- [zfsnap]:
- [zfs-fuse]:

### Programming Languages
- [python]:
- [nodejs]:

[yapet]:
[otpw-bin]:
[ssdeep]:
[hashalot]:
[kpcli]:
[donkey]:
[seccure]:
[pius]:
[cpm]:
[nasty]:
[twine]:
[mac-robber]: http://www.sleuthkit.org/mac-robber/desc.php
[rkhunter]:
[chkrootkit]:
[zfsnap]:
[zfs-fuse]:
[neard]:
[cardpeek]:
[libchipcard-tools]:
[pcsc-tools]:
[rfdump]:
[htop]:
[keyringer]:
[keyutils]:
[guncat]:
[gpgv]:
[pgpdump]:
[debsigs]:
[strace]:
[gdb]:
[ssl-cert]:
[openssl]:
[vim]:
[nano]:
[emacs]:
[glances]:
[monkeysphere]:
[pgpgpg]:
[signing-party]:
[tmux]:
[ncdu]:
[rsync]:
[p7zip]:
[lcrack]:
[rarcrack]:
[ophcrack-cli]:
[chntpw]:
[john]:
[crack]:
[hydra]:
[pdfcrack]:
[fcrackzip]:
[python]:
[nodejs]:
[jq]:
[pwgen]:
[libpwqulity-tools]:
[passwordmaker-cli]:
[apg]:
[qrencode]:
[gen-hdwallet]:
[gen-gpgchain]:
[bip32-utils]:
[paperkey]:
[pass]
[pwman3]
[yubikey-hsm]:
[yubico-piv-tool]:
[yubico-personalization]:
[yhsm-tools]:
[ykneomgr]:
[gnupg]:
[electrum]:
[scrypt]:
[binwalk]:
[trezorctl]: https://github.com/trezor/python-trezor
[ssss]: http://point-at-infinity.org/ssss/
[btchip]: https://github.com/LedgerHQ/btchip-c-api
[libbitcoin-explorr]: https://github.com/libbitcoin/libbitcoin-explorer/wiki

## Build ##

To build an image suitable for a liveusb do:

```
make all
```
## Usage ##

Create LiveUSB:
```
zcat dist/airgap-latest.raw.gz | dd of=/dev/sdz bs=4M
```

## Development ##

Boot image in qemu
```
qemu-system-x86_64]:
  -m 512M]:
  -machine type=pc,accel=kvm
  dist/airgap-latest.raw.gz
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
