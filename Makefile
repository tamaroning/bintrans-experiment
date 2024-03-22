MAKE_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
CC_ARM64 := $(MAKE_DIR)/gcc_arm64.sh
CC_X86_64 := $(MAKE_DIR)/gcc_x64.sh

DIRS := square

all:
	@for dir in $(DIRS); do \
        echo "Processing $$dir..."; \
        cd $$dir; \
		$(CC_ARM64) a.c -S -o arm64.S; \
		$(CC_X86_64) a.c -S -o x86_64.S; \
		$(CC_ARM64) a.c -c -o arm64.o; \
		$(CC_X86_64) a.c -c -o x86_64.o; \
		cd ..; \
    done

.PHONY: clean
clean:
	rm */*.S */*.o