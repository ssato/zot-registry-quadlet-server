%global pkgname zot-registry-quadlet-server
%global desc \
Configuration and data to run zot, oci image registry, as podman quadlet.

%global quadlet_filepath %{_sysconfdir}/containers/systemd/zot.container
%global config_filepath %{_sysconfdir}/zot/config.json
%global cert_dirpath %{_sysconfdir}/zot/cert
%global system_cert_path %{_sysconfdir}/pki/ca-trust/source/anchors/zot-registry.crt
%global image_dirpath %{_sharedstatedir}/zot

%global container_filepath %{_datadir}/%{name}-%{version}/*.tar
%global container_id ghcr.io/project-zot/zot-linux-amd64:latest

Name:           %{pkgname}
Version:        0.1.0
Release:        1%{?dist}
Summary:        Configuration data to run zot as podman quadlet
License:        MIT
URL:            https://github.com/ssato/zot-registry-quadlet-server
Source0:        %{pkgname}-%{version}-Source.tar.gz
Requires:       podman
Requires:       ca-certificates
%{?systemd_requires}

BuildArch:      noarch

# BuildRequires:  podman
BuildRequires:  cmake

%description    %{desc}

%prep
%autosetup -n %{pkgname}-%{version}-Source

%build
%cmake .
%cmake_build

%install
%cmake_install
mkdir -p %{buildroot}%{image_dirpath}

%post
if [ $1 -eq 1 ]; then
    /usr/bin/podman load -i %{container_filepath}
fi
/usr/bin/update-ca-trust
%systemd_post zot.service

%preun
%systemd_preun zot.service
if [ $1 -eq 0 ]; then
    /usr/bin/podman rmi %{container_id} || :
fi

%files
%license LICENSE.MIT
%config(noreplace) %{quadlet_filepath}
%config(noreplace) %{config_filepath}
%{container_filepath}
%{system_cert_path}

%dir %attr(0755, root, nobody) %{cert_dirpath}
%attr(0640, root, nobody) %config(noreplace) %{cert_dirpath}/*

%dir %{image_dirpath}

%changelog
* Tue May 19 2026 Satoru SATOH <ssato@redhat.com> - 0.1.0-1
- Initial packaging
