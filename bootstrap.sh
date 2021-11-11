#!/bin/sh

PROJMKDIR=`dirname $0`

case "$1" in
-h|--help)
	echo "Usage: `basename $0` [TEMPLATE_NAME PROJECT_NAME]"
	echo
	echo "  TEMPLATE_NAME can be:"
	for n in `ls $PROJMKDIR/tmpl`; do
		echo "    `echo $n | sed -e 's/\.proj\.mk$//'`"
	done
	echo
	echo "  PROJECT_NAME   Future value of PROJECT variable"
	exit
	;;
esac

mkdir .proj.mk || exit 1
(cd $PROJMKDIR; tar -c --exclude=".git" --exclude="tests" --exclude="tmpl" --exclude="bootstrap.sh" --exclude="TODO" .) | (cd .proj.mk;tar -x)

cp -rf $PROJMKDIR/db .proj.mk/
mkdir .proj.mk/db.priv

if [ ! -d tests ]; then
	mkdir tests
	cp -f $PROJMKDIR/tests_skel/* tests/
fi

if [ "$1" ]; then
	if [ ! -e "$PROJMKDIR/tmpl/${1}.proj.mk" ]; then
		echo "template '$1' isn't found"
		exit 1
	fi
	if [ -z "$2" ]; then
		echo "project name should be specified with template name"
		exit 1
	fi
	cp $PROJMKDIR/tmpl/${1}.proj.mk ${2}.proj.mk
	sed -i -e "s/__MYPROJNAME__/${2}/" ${2}.proj.mk
	if [ ! -e Makefile ]; then
		ln -s ${2}.proj.mk Makefile
	fi
fi
