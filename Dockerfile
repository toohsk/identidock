FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

ADD requierments.txt requierments.txt
RUN pip install -r requierments.txt

WORKDIR /app
COPY ./app /app

COPY cmd.sh /

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]