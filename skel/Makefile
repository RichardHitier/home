#$Id: Makefile,v 1.3 2005-10-18 07:25:36 hitier Exp $
VERSION 		:= $(shell cat ./VERSION)
CVSMODULENAME 	=$(shell cat ./CVS/Repository)
TAGNAME 		= $(CVSMODULENAME)-$(subst .,_,$(VERSION))
NAME	 		= $(TAGNAME)
DIST_DIR 		= ../$(NAME)
ARCHIVE 		= ../$(NAME).tar.gz
RSYNC_OPT 		= -avC --delete --delete-excluded

INSTALL			=  /usr/bin/install

prefix 			= /usr/local
exec_prefix 	= $(prefix)
libdir			= $(prefix)/lib
bindir 			= $(exec_prefix)/bin
localstatedir	= $(prefix)/var


.PHONY: all
all:

.PHONY: tag
tag: VERSION
	cvs rtag $(TAGNAME) $(CVSMODULENAME)

.PHONY: installdirs 
installdirs:
	$(INSTALL) -d 

.PHONY: install 
install:
	$(INSTALL) 

.PHONY: clean 
clean: 

.PHONY: dist 
dist: clean
	- [ -d $(DIST_DIR) ] || mkdir $(DIST_DIR)
	- [ -f $(ARCHIVE) ] && rm $(ARCHIVE)
	- rsync $(RSYNC_OPT) ./ $(DIST_DIR)
	- tar czf $(ARCHIVE) $(DIST_DIR)

.PHONY: release
release: dist
	- $(INSTALL) -m 644 $(ARCHIVE) $(FTP_DIR)

