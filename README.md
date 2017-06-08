# Airgap #

<https://github.com/lrvick/airgap>

## About ##

A live debian based distribution designed for managing secrets offline.

Built for those of us that want to be -really- sure our most important secrets
are managed in a clean environment with an "air gap" between us and the
internet.

## Use Cases ##
- Generate GPG keychain
- Store/Restore gpg keychain to Security Token such as a Yubikey
- Signing cryptocurrency transactions
- Generate/backup BIP39 universal cryptocurrency wallet seed
- Store/Restore BIP39 seed to a hardware wallet such as a Trezor or Ledger

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
qemu-system-x86_64 \
  -m 512M \
  -machine type=pc,accel=kvm \
  dist/airgap-latest.raw.gz
```

## Notes ##

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
  [Github](http://github.com/lrvick/)```
