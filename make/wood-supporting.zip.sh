#!/bin/sh

# Build the supporting information
DEST=wood-supporting
rm -rf $DEST
mkdir $DEST
cp -R figure wood.Rmd wood.md wood.html $DEST
mkdir -p $DEST/output
cp -R output/results $DEST/output

# Copy our data over, leaving external data behind.  This should be
# easier!
mkdir $DEST/data
tar -cf - `git ls-files --directory data` | tar -xpf - -C $DEST

zip -r $DEST.zip $DEST
rm -rf $DEST
