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

Assuming the drive is is `/dev/sda` you could do:

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

###### Convert GPG to NDEF

```
ndeftool text "'$(cat mnemonic.asc)'" save mnemonic.ndef
```

###### Write NDEF

Mifare Classic tag:
```
mifare-classic-write-ndef -y -i mnemonic.ndef
```

Forum 2 tag:
```
tagtool load mnemonic.ndef
```

###### Read NDEF

Mifare Classic tag:
```
mifare-classic-read-ndef -y -o mnemonic.ndef
```

Forum 2 tag:
```
tagtool dump -o mnemonic.ndef
```

###### Convert NDEF to GPG

```
ndeftool load mnemonic.ndef print | sed 's/^[^-]\+\-/-/g' > mnemonic.asc
```

###### Decrypt GPG

```
gpg -d mnemonic.asc
```

#### Initialize Hardware Wallet ####

##### Trezor #####

```
trezorctl recovery_device -w 24 -t matrix
```

##### Keepkey #####

```
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


