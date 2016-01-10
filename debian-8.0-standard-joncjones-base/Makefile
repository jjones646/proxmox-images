BASEDIR := $(shell dab basedir)
IMG_NAME := $(shell dab packagefile)
VER := "1.1"
NAME := "base"
DESC := "A small Debian Lenny system including all standard packages with additional packages for network management, SSH is configured, and common environment files are installed."

.PHONY: clean dist-clean

$(IMG_NAME): info/init_ok
	dab bootstrap
	# Extended set of packages
	dab install $(PARENTPATH)/common/base.pkglist
	# Allow default ssh key root access
	dab exec mkdir -p -m 0700 /root/.ssh
	install -m 0600 $(PARENTPATH)/common/watson.id_rsa.pub ${BASEDIR}/root/.ssh/authorized_keys
	# Update /etc/fstab
	install -m 0750 $(PARENTPATH)/common/config-fstab.sh $(BASEDIR)/root/config-fstab.sh
	dab exec /root/config-fstab.sh
	dab exec rm -f /root/config-fstab.sh
	# Update openssh server config
	install -m 0750 $(PARENTPATH)/common/config-sshd.sh $(BASEDIR)/root/config-sshd.sh
	dab exec /root/config-sshd.sh
	dab exec rm -f /root/config-fstab.sh
	# Move over network profile files - they'll auto update once installed
	-dab exec mkdir -p /root/.net-common
	install -m 0644 $(NETSHARE)/net-common/.vimrc $(BASEDIR)/etc/skel/.vimrc
	install -m 0755 -d $(NETSHARE)/net-common/ $(BASEDIR)/root/.net-common/
	install -m 0644 $(NETSHARE)/net-common/.vimrc $(BASEDIR)/root/.vimrc
	-dab exec mv -f /root/.bashrc /root/.bashrc.bak
	dab exec chmod -R 0644 /root/.net-common
	install -m 0644 $(NETSHARE)/net-common/.bashrc.sync $(BASEDIR)/root/.bashrc
	install -m 0644 $(NETSHARE)/net-common/.bashrc.custom $(BASEDIR)/root/.bashrc.custom
	# Set default editor
	dab exec update-alternatives --set editor /usr/bin/vim.basic
	# Make sure our unattended-upgrades is setup correctly
	dab exec echo 'APT::Periodic::Update-Package-Lists "1";' > /etc/apt/apt.conf.d/20auto-upgrades
	dab exec echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades
	# Setup default global git configurations
	dab exec git config --global user.name "Jonathan Jones"
	dab exec git config --global user.email "jjones646@gmail.com"
	dab exec git config --global push.default simple
	# Finalize everything
	dab finalize
	mv $(IMG_NAME) ../run/
	
info/init_ok: dab.conf
	dab init
	touch $@

dab.conf:
	$(PARENTPATH)/common/gen-dab.sh $(VER) $(NAME) $(DESC) > dab.conf

clean:
	dab clean
	rm -f dab.conf
	rm -f *~

dist-clean:
	dab dist-clean
	rm -f *~

