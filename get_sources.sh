#! /bin/sh

# edit for latest version numbers:
file=file_cmds-430.100.5
libutil=libutil-72
libinfo=Libinfo-583.0.1
shell=shell_cmds-309
text=text_cmds-165.100.8
archive=libarchive-131
curl=curl-154

# Cleanup:
rm -rf file_cmds shell_cmds text_cmds libutil libinfo libarchive curl
rm -rf $file $libutil $libinfo $shell $text $archive $curl

# get source for file_cmds
echo "Getting file_cmds"
# curl https://opensource.apple.com/tarballs/file_cmds/$file.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/file_cmds/tar.gz/refs/tags/$file -o $file.tar.gz
tar xfz $file.tar.gz
rm $file.tar.gz
# move to position independent of version number
# so Xcode project stays valid
mv $file file_cmds
(cd file_cmds ; patch -p1 < ../file_cmds.patch ; cd ..)

# get source for libutil:
echo "Getting libutil"
# curl https://opensource.apple.com/tarballs/libutil/$libutil.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/libutil/tar.gz/refs/tags/$libutil -o $libutil.tar.gz

tar xfz $libutil.tar.gz
rm $libutil.tar.gz
mv $libutil libutil
(cd libutil ; patch -p1 < ../libutil.patch ; cd ..)

# get source for libInfo:
echo "Getting libinfo"
# curl https://opensource.apple.com/tarballs/Libinfo/$libinfo.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/Libinfo/tar.gz/refs/tags/$libinfo -o $libinfo.tar.gz

tar xfz $libinfo.tar.gz
rm $libinfo.tar.gz
mv $libinfo libinfo

# get source for shell_cmds:
echo "Getting shell_cmds"
# curl https://opensource.apple.com/tarballs/shell_cmds/$shell.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/shell_cmds/tar.gz/refs/tags/$shell_cmds -o $shell_cmds.tar.gz
tar xfz $shell.tar.gz
rm $shell.tar.gz
mv $shell shell_cmds
(cd shell_cmds ; patch -p1 < ../shell_cmds.patch ; cd ..)

# get source for text_cmds:
echo "Getting text_cmds"
# curl https://opensource.apple.com/tarballs/text_cmds/$text.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/text_cmds/tar.gz/refs/tags/$text_cmds -o $text_cmds.tar.gz
tar xfz $text.tar.gz
rm $text.tar.gz
mv $text text_cmds
(cd text_cmds ; patch -p1 < ../text_cmds.patch ; cd ..)

# get source for BSD-tar: (not gnu-tar because licensing issues).
# curl https://opensource.apple.com/tarballs/libarchive/$archive.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/libarchive/tar.gz/refs/tags/$libarchive -o $archive.tar.gz
tar xfz $archive.tar.gz
rm $archive.tar.gz
mv $archive libarchive
(cd libarchive ; patch -p1 < ../libarchive.patch ; cd ..)

# get source for curl. This one requires OpenSSH + libssl
# curl https://opensource.apple.com/tarballs/curl/$curl.tar.gz -O
curl https://codeload.github.com/apple-oss-distributions/curl/tar.gz/refs/tags/$curl -o $curl.tar.gz
tar xfz $curl.tar.gz
rm $curl.tar.gz
mv $curl curl
(cd curl ; patch -p1 < ../curl.patch ; cd ..)

ls -all
