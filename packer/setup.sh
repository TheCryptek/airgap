#!/bin/sh -ex
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export DEBIAN_FRONTEND=noninteractive

die() {
    echo "$@" >&2
    exit 1
}

# use tmpfs workdir
mount -t tmpfs -o size=8G tmpfs /tmp/

# add sources
cat <<-EOF >> /etc/apt/sources.list.d/backports.list
	deb http://ftp.debian.org/debian stretch-backports main
	deb http://ftp.debian.org/debian/ sid main contrib non-free
EOF

cat <<-EOF >> /etc/apt/preferences
Package: *
Pin: release a=stable
Pin-Priority: 700

Package: *
Pin: release a=unstable
Pin-Priority: 800
EOF

apt install -y \
	libsecp256k1-0 \
	libsecp256k1-dev \
	libzmq5 \
	libboost-dev \
	libboost-all-dev \
	sudo \
	jq \
	qrencode \
	haveged \
	gnupg \
	gnupg2 \
	dirmngr \
	git \
	libconfig-dev \
	libhidapi-libusb0 \
	libusb-1.0-0 \
	libusb-1.0-0-dev \
	libudev-dev \
	libhidapi-dev \
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
	pwgen \
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
	python-crypto \
	python3-crypto \
	python-pycryptopp \
	python3-dev \
	python-dev \
	python-trezor \
	python3-flufl.password \
	python-setuptools \
	python3-setuptools \
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
	paperkey \
	vim \
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
	pgpdump \
	donkey \
	ssss \
	build-essential \
	autoconf \
	automake \
	libtool \
	pkg-config


# Create 'airgap' user
useradd -m 'airgap' -G sudo -s /bin/bash
sudo passwd --delete airgap
echo "airgap ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# Clean login prompt
touch /home/airgap/.hushlogin
echo "clear" >> /home/airgap/.bash_profile
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
sudo systemctl disable apache2

# Include trusted GPG keys
gpg --keyserver pgp.mit.edu --recv-key 91F3B339B9A02A3D
echo "trusted-key 91F3B339B9A02A3D" >> ~/.gnupg/gpg.conf
#gpg --keyserver pgp.mit.edu --recv-key 48BCF826EBFA4D17
#echo "trusted-key 48BCF826EBFA4D17" >> ~/.gnupg/gpg.conf

# btchip-c-api
git clone https://github.com/LedgerHQ/btchip-c-api.git /tmp/btchip-c-api
cd /tmp/btchip-c-api
#git verify-commit 1d1d85b4e98316d33f001f58b4b65730a16b2426 || {
#	die "Verification of btchip-c-api commit failed";
#}
git checkout 1d1d85b4e98316d33f001f58b4b65730a16b2426
make -f Makefile.hidapi
sudo cp bin/* /usr/local/bin/

# libzmq
git clone https://github.com/zeromq/libzmq.git /tmp/libzmq
cd /tmp/libzmq
git checkout 2d83acceffdef71c62c936487db9478b5478a00c
./autogen.sh
./configure --prefix=/usr
make
sudo make install

# libbitcoin
git clone https://github.com/libbitcoin/libbitcoin.git /tmp/libbitcoin
cd /tmp/libbitcoin
git checkout ddf19b34aac222a834177830de485a665b152a6a
./autogen.sh
./configure --prefix=/usr
make
sudo make install

# libbitcoin-protocol
git clone https://github.com/libbitcoin/libbitcoin-protocol.git /tmp/libbitcoin-protocol
cd /tmp/libbitcoin-protocol
git checkout 57ebd9c32233a76f83038b7655b4a4f8e862bac5
./autogen.sh
./configure --prefix=/usr
make
sudo make install

# libbitcoin-network
git clone https://github.com/libbitcoin/libbitcoin-network.git /tmp/libbitcoin-network
cd /tmp/libbitcoin-network
git checkout 1e79325d063f4efbbdc1551b2a2cffcf0babb501
./autogen.sh
./configure --prefix=/usr
make
sudo make install

# libbitcoin-client
git clone https://github.com/libbitcoin/libbitcoin-client.git /tmp/libbitcoin-client
cd /tmp/libbitcoin-client
git checkout de8a7b2232d29e28e47454392dfad9bca532735b
./autogen.sh
./configure --prefix=/usr
make
sudo make install
sudo ldconfig

#libbitcoin-explorer
git clone https://github.com/libbitcoin/libbitcoin-explorer.git /tmp/libbitcoin-explorer
cd /tmp/libbitcoin-explorer
git checkout 231323a5886c2ebf9d33011b8b2c3d49a9af6d52
./autogen.sh
./configure --prefix=/usr
make
sudo make install
sudo ldconfig

# bip32-utils
git clone https://github.com/prusnak/bip32utils.git /tmp/bip32utils
cd /tmp/bip32utils
git verify-commit dd9c541767a2a8ff60c7868c9f4b03277fabb8ba || {
	die "Verification of bip32utils commit failed";
}
git checkout dd9c541767a2a8ff60c7868c9f4b03277fabb8ba
python3 setup.py install

# python-mnemonic
git clone https://github.com/trezor/python-mnemonic.git /tmp/mnemonic
cd /tmp/mnemonic
git verify-commit bd441b693271a07ee0ce51f89d3141457785b108 || {
	die "Verification of python-mnemonic commit failed";
}
git checkout bd441b693271a07ee0ce51f89d3141457785b108
python3 setup.py install

# pycoin
git clone https://github.com/richardkiss/pycoin.git /tmp/pycoin
cd /tmp/pycoin
git checkout 39a5f47f21f5f31c68c147dc173d9b2751c3213a
python3 setup.py install

# pycryptodome
git clone https://github.com/Legrandin/pycryptodome.git /tmp/pycryptodome
cd /tmp/pycryptodome
git checkout 2e0f288809bd68a46f881865b0a60f9c54c4751f
python3 setup.py install


# remove cruft
rm -rf \
	/var/cache/apt/* \
	/var/cache/debconf/* \
	/var/lib/mysql/* \
	/var/lib/apt/* \
	/var/log/* \
	/usr/share/doc/* \
	/usr/share/icons/* \
	/tmp/*


# Minimize the size of the disk image if fstrim is available
if [ -x /sbin/fstrim ]; then
   fstrim -av
fi
