FROM python:3.9.2-alpine
ENV PYTHONUNBUFFERED=1

RUN apk add jpeg-dev zlib-dev
RUN apk add --virtual .build-deps build-base linux-headers

WORKDIR /src

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

RUN apk del .build-deps

EXPOSE 8000

COPY . .

RUN python manage.py migrate