#!/bin/sh
set -x

name=book
CHAPTER=chapter
BOOK=book
APPENDIX=appendix

function system {
  "$@"
  if [ $? -ne 0 ]; then
    echo "make.sh: unsuccessful command $@"
    echo "abort!"
    exit 1
  fi
}

preprocess -DFORMAT=html ../chapters/newcommands.p.tex > newcommands_keep.tex

opt="CHAPTER=$CHAPTER BOOK=$BOOK APPENDIX=$APPENDIX"
opt="$opt --exercise_numbering=chapter"

# Compile HTML Bootstrap book
system doconce format html $name $opt --html_style=bootswatch_journal --html_code_style=inherit --html_output=$name
system doconce split_html $name.html

# Compile standard sphinx
theme=uio
system doconce format sphinx $name $opt --sphinx_keep_splits
system doconce split_rst $name
system doconce sphinx_dir theme=$theme dirname=sphinx-${theme} $name
# Change logo
doconce replace _static/uio_logo.png https://raw.githubusercontent.com/CINPLA/logo/master/brain/cinpla_logo_transparent.png sphinx-${theme}/_themes/uio/layout.html
system python automake_sphinx.py

# Generate and compile RunestoneInteractive book
# (temporarily not available after their setup changed)
# see bin/doconce and update generation of automake_sphinx.py
#system doconce format sphinx $name --runestone $opt --sphinx_keep_splits -DRUNESTONE
#system doconce split_rst $name
#system doconce sphinx_dir theme=cbc dirname=runestone $name
#system python automake_sphinx.py --runestone

# Publish
dest=../../pub
cp $name.html ._${name}*.html $dest
figdirs="fig-* mov-*"
for figdir in $figdirs; do
    # slash important for copying files in links to dirs
    if [ -d $figdir/ ]; then
        cp -r $figdir/ $dest
    fi
done

rm -rf $dest/sphinx
#rm -rf $dest/sphinx-runestone
cp -r sphinx-${theme}/_build/html $dest/sphinx
#cp -r runestone/RunestoneTools/build $dest/sphinx-runestone

cd $dest
git add sphinx-*
