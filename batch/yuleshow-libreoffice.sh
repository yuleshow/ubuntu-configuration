# LibreOffice latest stable. Upstream publishes x86_64 and aarch64 tarballs;
# fall back to the distro package on any other arch.
LO_VERSION=25.2.2
ARCH=$(dpkg --print-architecture)
case "$ARCH" in
    amd64) LO_ARCH=x86_64; LO_SUFFIX=x86-64 ;;
    arm64) LO_ARCH=aarch64; LO_SUFFIX=aarch64 ;;
    *)
        echo "LibreOffice tarball not published for $ARCH; installing from apt instead."
        sudo apt install -y libreoffice
        exit 0
        ;;
esac
wget "https://download.documentfoundation.org/libreoffice/stable/${LO_VERSION}/deb/${LO_ARCH}/LibreOffice_${LO_VERSION}_Linux_${LO_SUFFIX}_deb.tar.gz"
tar -zxf Libre*.tar.gz
