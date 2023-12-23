qemu-system-x86_64 \
    -machine q35 \
    -cpu host \
    -enable-kvm \
    -smp cores=4 \
    -m 16384 \
    -hda /home/liam/Documents/virtual-machine/windows10.qcow2 \
    -vga qxl \
    -device qemu-xhci \
    -device usb-tablet \
    -device virtio-mouse-pci \
    -netdev user,id=net0 -device e1000,netdev=net0 \
    -audiodev pa,id=snd0 -device usb-audio,audiodev=snd0 \
    
    # qemu-xhci 提供 usb 3.0 支持，故可以使用 usb-tablet
    # usb-tablet 用於改善滑鼠在虛擬機的精確度
