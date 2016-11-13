FROM dbndev/linphone-dev

RUN git clone --recursive https://github.com/BelledonneCommunications/linphone-android.git \
 && cd linphone-android \
 && ./prepare.py \
 && make 
