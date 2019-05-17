FROM python:2.7-alpine3.8
MAINTAINER oldiy <oldiy2018@gmail.com>

RUN apk update && \
    apk --no-cache add git && \
    pip install Jinja2==2.10 tornado==5.1 && \
    git clone https://github.com/hondajojo/podcast4us /app && \
    cd app && \
    apk del git && rm -rf /app/.git  && \
    sed -i "s#http://twitter.com/maijver#https://odcn.top#g" /app/templates/index.html  && \
    sed -i "s#maijver#oD^Blog#g" /app/templates/index.html

WORKDIR /app
EXPOSE 5000
CMD python start.py