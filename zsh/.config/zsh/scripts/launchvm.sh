qemu-system-x86_64 \
    -machine q35 \
    -cpu host \
    -enable-kvm \
    -smp cores=6 \
    -m 16384 \
    -hda /var/lib/libvirt/images/win10-1.qcow2 \
    -vga qxl \
    -device qemu-xhci \
    -device usb-tablet \
    -device virtio-mouse-pci \
    -audiodev pa,id=snd0 -device usb-audio,audiodev=snd0 \
    -netdev user,id=net0 -device e1000,netdev=net0 
    # -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -device e1000,netdev=net0 
    
    # qemu-xhci 提供 usb 3.0 支持，故可以使用 usb-tablet
    # usb-tablet 用於改善滑鼠在虛擬機的精確度
