TARGETS = mountkernfs.sh hostname.sh mountdevsubfs.sh hwclock.sh rpcbind networking mountall.sh mountall-bootclean.sh checkroot.sh urandom mountnfs.sh mountnfs-bootclean.sh kmod x11-common checkfs.sh checkroot-bootclean.sh bootmisc.sh procps
INTERACTIVE = checkroot.sh checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
hwclock.sh: mountdevsubfs.sh
rpcbind: networking mountall.sh mountall-bootclean.sh
networking: mountkernfs.sh mountall.sh mountall-bootclean.sh urandom procps
mountall.sh: checkfs.sh checkroot-bootclean.sh
mountall-bootclean.sh: mountall.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
urandom: mountall.sh mountall-bootclean.sh
mountnfs.sh: mountall.sh mountall-bootclean.sh networking rpcbind
mountnfs-bootclean.sh: mountall.sh mountall-bootclean.sh mountnfs.sh
kmod: checkroot.sh
x11-common: mountall.sh mountall-bootclean.sh mountnfs.sh mountnfs-bootclean.sh
checkfs.sh: checkroot.sh
checkroot-bootclean.sh: checkroot.sh
bootmisc.sh: mountnfs-bootclean.sh mountall.sh mountall-bootclean.sh mountnfs.sh checkroot-bootclean.sh
procps: mountkernfs.sh mountall.sh mountall-bootclean.sh
