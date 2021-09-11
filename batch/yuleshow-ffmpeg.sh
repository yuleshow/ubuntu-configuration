sudo apt remove ffmpeg -y

# sudo curl -Lf# https://github.com/homebridge/ffmpeg-for-homebridge/releases/latest/download/ffmpeg-debian-$(uname -m).tar.gz | sudo tar xzf - -C / --no-same-owner

sudo apt-get update -qq && sudo apt-get -y install \
  autoconf \
  automake \
  build-essential \
  cmake \
  git-core \
  libass-dev \
  libfreetype6-dev \
  libgnutls28-dev \
  libsdl2-dev \
  libtool \
  libva-dev \
  libvdpau-dev \
  libvorbis-dev \
  libxcb1-dev \
  libxcb-shm0-dev \
  libxcb-xfixes0-dev \
  meson \
  ninja-build \
  pkg-config \
  texinfo \
  wget \
  yasm \
  zlib1g-dev

sudo apt install nasm -y
sudo apt install libx264-dev -y
sudo apt install libx265-dev libnuma-dev -y
sudo apt-get install libvpx-dev -y
sudo apt install libfdk-aac-dev -y
sudo apt install libmp3lame-dev -y
sudo apt-get install libopus-dev -y
sudo apt-get install libdav1d-dev -y

sudo apt-get install libunistring-dev -y
sudo apt-get install libdav1d-dev -y

mkdir -p ~/ffmpeg_sources ~/bin


cd ~/ffmpeg_sources && \
    git -C SVT-AV1 pull 2> /dev/null || git clone https://gitlab.com/AOMediaCodec/SVT-AV1.git && \
            mkdir -p SVT-AV1/build && \
            cd SVT-AV1/build && \
            PATH="$HOME/bin:$PATH" cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DCMAKE_BUILD_TYPE=Release -DBUILD_DEC=OFF -DBUILD_SHARED_LIBS=OFF .. && \
            PATH="$HOME/bin:$PATH" make && \
            make install



cd ~/ffmpeg_sources && \
wget -O ffmpeg-snapshot.tar.bz2 https://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2 && \
tar xjvf ffmpeg-snapshot.tar.bz2 && \
cd ffmpeg && \
PATH="$HOME/bin:$PATH" PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure \
  --prefix="$HOME/ffmpeg_build" \
  --pkg-config-flags="--static" \
  --extra-cflags="-I$HOME/ffmpeg_build/include" \
  --extra-ldflags="-L$HOME/ffmpeg_build/lib" \
  --extra-libs="-lpthread -lm" \
  --ld="g++" \
  --bindir="$HOME/bin" \
  --enable-gpl \
  --enable-gnutls \
  --enable-libass \
  --enable-libfdk-aac \
  --enable-libfreetype \
  --enable-libmp3lame \
  --enable-libopus \
  --enable-libsvtav1 \
  --enable-libdav1d \
  --enable-libvorbis \
  --enable-libvpx \
  --enable-libx264 \
  --enable-libx265 \
  --enable-nonfree && \
PATH="$HOME/bin:$PATH" make && \
make install && \
    hash -r

# ./configure --enable-shared --disable-static --enable-debug=3 --enable-libfdk-aac --enable-gpl --enable-libx265 --enable-libx264 --enable-libmp3lame 
