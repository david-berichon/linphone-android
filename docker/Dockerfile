FROM dbndev/openjdk-base

ARG ANDROID_COMPILE_SDK="25"
ARG ANDROID_BUILD_TOOLS="24.0.0"
ARG ANDROID_SDK_TOOLS="24.4.1"

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
 libqt5widgets5 \
 aptitude

RUN dpkg --add-architecture i386
RUN aptitude update && aptitude install -y \
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
RUN curl https://dl.google.com/android/android-sdk_r${ANDROID_SDK_TOOLS}-linux.tgz | tar xz \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter android-${ANDROID_COMPILE_SDK} \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter platform-tools \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter build-tools-${ANDROID_BUILD_TOOLS} \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-android-m2repository \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-google-google_play_services \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter extra-google-m2repository \
 && echo y  | $ANDROID_HOME/tools/android update sdk --no-ui --all --filter sys-img-x86-google_apis-${ANDROID_COMPILE_SDK} \
 && echo no | $ANDROID_HOME/tools/android create avd -n test -t android-${ANDROID_COMPILE_SDK} --abi google_apis/x86
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Add android-wait-for-emulator executable
RUN mkdir -p bin \
 && cd bin \
 && curl https://raw.githubusercontent.com/travis-ci/travis-cookbooks/0f497eb71291b52a703143c5cd63a217c8766dc9/community-cookbooks/android-sdk/files/default/android-wait-for-emulator > android-wait-for-emulator \
 && chmod +x android-wait-for-emulator
ENV PATH $PATH:$HOME/bin

# Add Android NDK
RUN curl https://dl.google.com/android/repository/android-ndk-r12b-linux-x86_64.zip > android-ndk-r12b.zip \
 && unzip android-ndk-r12b.zip \
 && rm android-ndk-r12b.zip
ENV ANDROID_NDK_HOME $HOME/android-ndk-r12b
ENV PATH $PATH:$ANDROID_NDK_HOME
