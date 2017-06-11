#!/bin/sh -ex
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export DEBIAN_FRONTEND=noninteractive

die() {
    echo "$@" >&2
    exit 1
}

# add sources
cat <<-EOF >> /etc/apt/sources.list.d/backports.list
	deb http://ftp.debian.org/debian stretch-backports main
EOF

apt update
apt install -y \
	sudo \
	qrencode \
	haveged \
	gnupg2 \
	dirmngr \
	git \
	libusb-dev \
	libudev-dev \
	expect \
	yubikey-ksm \
	yubikey-personalization \
	yubico-piv-tool \
	u2f-host \
	pass \
	nodejs \
	python-pyrex \
	cython \
	cython3 \
	python3 \
	python3-dev \
	python-dev \
	python-trezor \
	python3-flufl.password \
	python-setuptools \
	python3-setuptools \
	python-trezor \
	python-mnemonic

# Create 'airgap' user
useradd -m 'airgap' -G sudo -s /bin/bash
sudo passwd --delete airgap
echo "airgap ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

chown -R airgap:airgap /home/airgap

# Automatically log in to 'airgap' user on boot
sudo mkdir -pv /etc/systemd/system/getty@tty1.service.d
cat <<-EOF > /etc/systemd/system/getty@tty1.service.d/autologin.conf
	[Service]
	ExecStart=
	ExecStart=-/sbin/agetty --autologin airgap --noclear %I 38400 linux
EOF
sudo systemctl enable getty@tty1.service

# Include trusted GPG keys
gpg --keyserver pgp.mit.edu --recv-key 91F3B339B9A02A3D
echo "trusted-key 91F3B339B9A02A3D" >> ~/.gnupg/gpg.conf

## python-mnemonic
#git clone https://github.com/trezor/python-mnemonic.git /tmp/python-mnemonic
#cd /tmp/python-mnemonic
#git verify-commit 094c4f4939dc6b5097575b787332f73d47759043 || {
#	die "Verification of python-mnemonic commit failed";
#}
#git checkout 094c4f4939dc6b5097575b787332f73d47759043
#python setup.py install

# bip32-utils
git clone https://github.com/prusnak/bip32utils.git /tmp/bip32utils
cd /tmp/bip32utils
	git verify-commit dd9c541767a2a8ff60c7868c9f4b03277fabb8ba || {
	die "Verification of bip32utils commit failed";
}
git checkout dd9c541767a2a8ff60c7868c9f4b03277fabb8ba
python setup.py install

#git clone https://github.com/trezor/python-trezor.git /tmp/python-trezor
#cd /tmp/python-trezor
#git verify-commit e39021d7fd4f4bf830f8520e85da1a316e5a99bf || {
#	die "Verification of python-trezor commit failed";
#}
#git checkout e39021d7fd4f4bf830f8520e85da1a316e5a99bf
#python setup.py install

# pycoin
git clone https://github.com/richardkiss/pycoin.git /tmp/pycoin
cd /tmp/pycoin
git checkout 39a5f47f21f5f31c68c147dc173d9b2751c3213a
python setup.py install

# Minimize the size of the disk image if fstrim is available
if [ -x /sbin/fstrim ]; then
   fstrim -av
fi
