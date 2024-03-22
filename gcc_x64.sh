gcc \
    -march=x86-64 \
    -fno-asynchronous-unwind-tables \
    -fno-dwarf2-cfi-asm \
    -fcf-protection=branch \
    -mmanual-endbr \
    $@
