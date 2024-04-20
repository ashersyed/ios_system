#! /bin/sh

# edit for latest version numbers:
file=file_cmds-430.100.5
libutil=libutil-72
libinfo=Libinfo-583.0.1
shell=shell_cmds-309
text=text_cmds-165.100.8
archive=libarchive-131
curl=curl-154

find . -name .DS_Store -exec rm {} \; -print

# get source for file_cmds
echo "Getting file_cmds"
# curl https://opensource.apple.com/tarballs/file_cmds/$file.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/file_cmds/tar.gz/refs/tags/$file -o $file.tar.gz
mkdir $file
tar xfz $file.tar.gz -C $file --strip 1
rm $file.tar.gz

echo "Creating file_cmds.patch"
diff -Naur $file file_cmds > file_cmds.patch
rm -rf $file

# get source for libutil:
echo "Getting libutil"
# curl https://opensource.apple.com/tarballs/libutil/$libutil.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/libutil/tar.gz/refs/tags/$libutil -o $libutil.tar.gz
mkdir $libutil
tar xfz $libutil.tar.gz -C $libutil --strip 1
rm $libutil.tar.gz

echo "Creating libutil.patch"
diff -Naur $libutil libutil > libutil.patch
rm -rf $libutil

# get source for shell_cmds:
echo "Getting shell_cmds"
# curl https://opensource.apple.com/tarballs/shell_cmds/$shell.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/shell_cmds/tar.gz/refs/tags/$shell -o $shell.tar.gz
mkdir $shell
tar xfz $shell.tar.gz -C $shell --strip 1
rm $shell.tar.gz

echo "Creating shell_cmds.patch"
diff -Naur $shell shell_cmds > shell_cmds.patch
rm -rf $shell

# get source for text_cmds:
echo "Getting text_cmds"
# curl https://opensource.apple.com/tarballs/text_cmds/$text.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/text_cmds/tar.gz/refs/tags/$text -o $text.tar.gz
mkdir $text
tar xfz $text.tar.gz -C $text --strip 1
rm $text.tar.gz

echo "Creating text_cmds.patch"
diff -Naur $text text_cmds > text_cmds.patch
rm -rf $text

# get source for BSD-tar: (not gnu-tar because licensing issues).
# curl https://opensource.apple.com/tarballs/libarchive/$archive.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/libarchive/tar.gz/refs/tags/$archive -o $archive.tar.gz
mkdir $archive
tar xfz $archive.tar.gz -C $archive --strip 1
rm $archive.tar.gz

echo "Creating libarchive.patch"
diff -Naur $archive libarchive > libarchive.patch
rm -rf $archive

# get source for curl. This one requires OpenSSH + libssl
# curl https://opensource.apple.com/tarballs/curl/$curl.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/curl/tar.gz/refs/tags/$curl -o $curl.tar.gz
mkdir $curl
tar xfz $curl.tar.gz -C $curl --strip 1
rm $curl.tar.gz

echo "Creating curl.patch"
diff -Naur $curl curl > curl.patch
rm -rf $curl

