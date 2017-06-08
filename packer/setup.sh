#!/bin/sh -ex
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export DEBIAN_FRONTEND=noninteractive

die() {
    echo "$@" >&2
    exit 1
}

apt update
apt install -y \
	qrencode \
	haveged \
	gnupg \
	git \
	python \
	python-setuptools \
	python-prettytable \
	python-blessings

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
