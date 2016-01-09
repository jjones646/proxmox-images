BASEDIR := $(shell dab basedir)

all: info/init_ok
	@echo "Target: $(TARGET_IMAGE)"
	dab bootstrap
	# Extended set of packages
	dab install ../common/base.pkglist
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
	# Setup default global git configuration
	dab exec git config --global user.name "Jonathan Jones"
	dab exec git config --global user.email "jjones646@gmail.com"
	# Finalize everything
	dab finalize
	
info/init_ok: dab.conf
	dab init
	touch $@

.PHONY: clean
clean:
	dab clean
	rm -f *~

.PHONY: dist-clean
dist-clean:
	dab dist-clean
	rm -f *~

