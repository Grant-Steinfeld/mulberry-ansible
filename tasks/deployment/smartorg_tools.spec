Summary: SmartOrg software suite rpm
Name: smartorg_tools
Version: 1
Release: 1
License: Commercial

# notes:
#files owned by user x                                                                                |
#files executed has read+x access to scripts and write to data files                                  |
#rpm -i ( root/sudo )   


# BuildArch states the intented architecture; in this case we build a package for all.
# if you copy binaries for a specific architecture please state it here
BuildArch: noarch
Group: Development/Tools

# The name of our source tar.gz file is next, make sure this name is correct.
# The version number does matter a lot!
Source0: AstroTemplates.tar.gz


#Requires: python > 4.0
#Requires: /opt/e/x1



#BuildRoot: %{_tmppath}/smartorg-tools

%description
This is a testpackages that containes some files. The files will be placed on a system.

%prep

# This is where you could, instead of the untar performed by %setup, do something
# like "git clone ..."

# You probably want to de-git-ify the directories here rather than in the build process.


#%setup -q -n %{name}.%{version}
%setup -q
# In the prep section the tar.gz file gets unpacked to a directory.
# the directory is

%build
# Normally this part would be full of fancy compile stuff. Make this, make that.
# We simple folks, we just want to copy some files out of a tar.gz.
# so we pass this section with nothing done...

%install
echo "RPM_BUILD_ROOT: ${RPM_BUILD_ROOT}"
echo "Build area:"
find ${RPM_BUILD_ROOT} -type f -ls
PWD=`pwd`
echo "Source area ${PWD}:"
#find . -type f -ls

# Installing happens here, normally using the “make install”
# command, it normally places the files
# where they need to go. You can also copy the files, as we do here...

# First we make sure we start clean
#rm -rf /opt/rangal/1.0.0/bin

# Then we create the directories where the files go
# don't worry if the directories exist on your target systems, rpm
# creates if necessary
#mkdir -p /opt/rangal/1.0.0/bin

# The actual moving
#cp -p /opt/rangal/1.0.0/build/rpm/BUILD/smartorg_tools.1/*  /opt/rangal/1.0.0/bin -R

mkdir -p $RPM_BUILD_ROOT/opt/rangaltestinstall/1.0.0/bin/apps
cp -Rp /home/smartorg/RangalBuild/RpmBuild/SOURCES/smartorg_tools-1/AstroTemplates $RPM_BUILD_ROOT/opt/rangaltestinstall/1.0.0/bin/apps

#mkdir -p $RPM_BUILD_ROOT/opt/rangaltestinstall/1.0.0/bin/apps
#cp -Rp ./load/sources/AstroTemplates $RPM_BUILD_ROOT/opt/rangaltestinstall/1.0.0/bin/apps
#rm -rf $RPM_BUILD_ROOT/opt/rangaltestinstall/1.0.0/bin/apps/AstroTemplates/.git




%clean
rm -rf $RPM_BUILD_ROOT

%files
# The file section, it has to be exact, matching all files.
# Here you have the power to implement all rights, even if
# they are different in the tar.gz


#default attribute setting for smartorg user applided to all
#paths below
%defattr(-,smartorg,smartorg)
/opt/rangaltestinstall/1.0.0/bin/apps/AstroTemplates
#/opt/rangaltestinstall/1.0.0/bin/service/AstroService
#or specifally like this
#%attr(0755,smartorg,smartorg) /opt/rangaltestinstall/1.0.0/bin/apps/AstroTemplates/*



%changelog
* Thu Mar 09 2017 Grant Steinfeld <gsteinfeld@smartorg.com> - 1-1
First tests with Fan and Grant
