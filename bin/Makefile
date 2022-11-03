
.PHONY: all
all: xmodmapgenerator generatexmodmapgenerator

%: %.c
	gcc $< -lX11 -o $@


.PHONY: clean 
clean: 
	- rm xmodmapgenerator generatexmodmapgenerator


