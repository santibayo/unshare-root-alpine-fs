#!/bin/bash
unshare -m -U -r -p -u --fork bash -c '
  # 1. Hacer los montajes privados respecto al host
  mount --make-rprivate /

  # 2. Montar el sistema de archivos proc virtual en la carpeta aislada
  mkdir -p ./mi_rootfs/proc
  mount -t proc proc ./mi_rootfs/proc

  hostname r2d2

  # 3. Entrar a la shell aislada dentro del directorio
  chroot ./mi_rootfs /usr/bin/fish
'
