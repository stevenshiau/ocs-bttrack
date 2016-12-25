Summary: Clonezilla bittorrent restoring tracker
Name: ocs-bttrack
Version: 0.2
Release: drbl1
Source0: %{name}-%{version}.tar.xz

License: MIT
Group:	Development/Clonezilla
URL: http://clonezilla.org
BuildRoot: %{_tmppath}/%{name}-buildroot
Prefix: %{_prefix}
Requires: coreutils, pciutils, procps, clonezilla >= 3.25.3
ExclusiveArch: %{ix86}, x86_64

%description
ocs-bttrack is a bittorrent tracker, and is specially used for Clonezilla SE.

ocs-bttrack is a bittorrent tracker, and is specially used for Clonezilla SE.
This bittorrent tracker was extracted and modified from BitTornado by
Clonezilla project.
The upstream source was obtained from http://bittornado.com/download.html
and was written by John Hoffman <theshadow _at_ degreez net>

%prep
%setup -q -n %{name}-%{version}

%build
make clean
make

%install
rm -rf $RPM_BUILD_ROOT
%makeinstall

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_bindir}/ocs-bttrack
%{_libdir}/*
%doc README
%doc AUTHORS LICENSE.txt README.txt

%changelog
* Mon Jun 06 2016 Steven Shiau <steven _at_ clonezilla org> 0.2-drbl1
- Initial rpm package release (Not finished).
