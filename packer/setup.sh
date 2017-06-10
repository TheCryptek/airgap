#!/bin/sh -ex
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export DEBIAN_FRONTEND=noninteractive

die() {
    echo "$@" >&2
    exit 1
}

apt update
apt install -y \
	sudo \
	qrencode \
	haveged \
	gnupg2 \
	git \
	expect \
	python \
	python-setuptools \
	python-prettytable \
	python-blessings

# Create 'airgap' user
useradd -m 'airgap' -G sudo -s /bin/bash
sudo passwd --delete airgap
echo "airgap ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Automatically log in to 'airgap' user on boot
sudo mkdir -pv /etc/systemd/system/getty@tty1.service.d
cat <<-EOF > /etc/systemd/system/getty@tty1.service.d/autologin.conf
	[Service]
	ExecStart=
	ExecStart=-/sbin/agetty --autologin airgap --noclear %I 38400 linux
EOF
sudo systemctl enable getty@tty1.service

# Install verified python-mnemonic library
gpg --keyserver pgp.mit.edu --recv-key 91F3B339B9A02A3D
echo "trusted-key 91F3B339B9A02A3D" >> ~/.gnupg/gpg.conf
git clone https://github.com/trezor/python-mnemonic.git /tmp/python-mnemonic
cd /tmp/python-mnemonic
git verify-commit 094c4f4939dc6b5097575b787332f73d47759043 || {
	die "Verification of python-mnemonic commit failed";
}
git checkout 094c4f4939dc6b5097575b787332f73d47759043
python setup.py install

# Minimize the size of the disk image if fstrim is available
if [ -x /sbin/fstrim ]; then
   fstrim -av
fi
