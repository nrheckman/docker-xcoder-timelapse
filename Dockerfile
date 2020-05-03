FROM jrottenberg/ffmpeg:vaapi

WORKDIR /app

RUN mkdir /in
RUN mkdir /out

COPY bin/run.sh /app/

ENTRYPOINT ["bash","/app/run.sh"]