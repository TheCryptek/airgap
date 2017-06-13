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
	gnupg \
	gnupg2 \
	dirmngr \
	git \
	libusb-dev \
	libudev-dev \
	expect \
	yubikey-ksm \
	yubikey-personalization \
	yubico-piv-tool \
	yhsm-tools \
	ykneomgr \
	u2f-host \
	pass \
	pwman3 \
	hashalot \
	ssdeep \
	hash-slinger \
	passwordmaker-cli \
	apg \
	libpwquality-tools \
	scrypt \
	fcrackzip \
	pdfcrack \
	otpw-bin \
	yapet \
	samdump2 \
	lcrack \
	rarcrack \
	ophcrack-cli \
	chntpw \
	kpcli \
	john \
	crack \
	crack-common \
	nodejs \
	duplicity \
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
	python-mnemonic \
	python-electrum \
	electrum \
	v86d \
	rsync \
	tmux \
	gpm \
	ncdu \
	binwalk \
	bzip2 \
	p7zip \
	hydra \
	strace \
	gdb \
	rkhunter \
	chkrootkit \
	unhide \
	mac-robber \
	ssl-cert \
	openssl \
	gnutls-bin \
	monkeysphere \
	pgpgpg \
	signing-party \
	gpgv \
	gpgv2 \
	twine \
	guncat \
	nasty \
	cpm \
	debsigs \
	pius \
	libnfc-bin \
	libnfc-dev \
	libnfc5 \
	neard \
	cardpeek \
	cardpeek-data \
	rfdump \
	libccid \
	libchipcard-tools \
	libchipcard-data \
	libpcsclite1 \
	pcsc-tools \
	pcscd \
	python-pyscard \
	keyringer \
	keyutils \
	vim \
	paperkey \
	nano \
	emacs \
	seccure \
	console-setup \
	zfsnap \
	zfs-fuse \
	parted \
	hwinfo \
	lvm2 \
	glances \
	htop \
	x509-util \
	keyanalyze \
	kleopatra \
	pgpdump \
	donkey \
	ssss



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
sudo systemctl enable haveged.service

# Include trusted GPG keys
gpg --keyserver pgp.mit.edu --recv-key 91F3B339B9A02A3D
echo "trusted-key 91F3B339B9A02A3D" >> ~/.gnupg/gpg.conf

# bip32-utils
git clone https://github.com/prusnak/bip32utils.git /tmp/bip32utils
cd /tmp/bip32utils
	git verify-commit dd9c541767a2a8ff60c7868c9f4b03277fabb8ba || {
	die "Verification of bip32utils commit failed";
}
git checkout dd9c541767a2a8ff60c7868c9f4b03277fabb8ba
python setup.py install

# pycoin
git clone https://github.com/richardkiss/pycoin.git /tmp/pycoin
cd /tmp/pycoin
git checkout 39a5f47f21f5f31c68c147dc173d9b2751c3213a
python setup.py install

# Minimize the size of the disk image if fstrim is available
if [ -x /sbin/fstrim ]; then
   fstrim -av
fi
