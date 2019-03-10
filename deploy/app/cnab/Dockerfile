FROM docker:latest
RUN mkdir /cnab

COPY Dockerfile /cnab/Dockerfile
COPY app /cnab/app
RUN chmod 777 /cnab/app/run

CMD "/cnab/app/run"
