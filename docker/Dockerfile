FROM dbndev/openjdk-base

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
 yasm \
 nasm \
 ant \
 python \
 cmake \
 vim-common \
 patch \
 pkg-config \
 git \
 curl \
 unzip \
 aptitude 

RUN aptitude install -y \
 libstdc++6:i386 \
 libgcc1:i386 \
 zlib1g:i386 \
 libncurses5:i386

# Add non-admin user
RUN adduser --disabled-password --gecos "" user
# Switch to user land
USER user

# Expose user HOME to docker build environment
ENV HOME /home/user

WORKDIR $HOME

# Add Sndroid SDK
ENV ANDROID_HOME $HOME/android-sdk-linux
RUN curl https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xz \
 && ( while [ 1 ]; do sleep 5; echo y; done ) | $ANDROID_HOME/tools/android update sdk --no-ui  
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Add Android NDK
RUN curl https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip > android-ndk-r12b.zip \
 && unzip android-ndk-r12b.zip \
 && rm android-ndk-r12b.zip
ENV ANDROID_NDK_HOME $HOME/android-ndk-r12b
ENV PATH $PATH:$ANDROID_NDK_HOME
