FROM python:3.9.2-alpine
ENV PYTHONUNBUFFERED 1

RUN apk update \
    && apk add --virtual build-deps gcc python3-dev musl-dev \
    && apk add postgresql-dev \
    && apk add jpeg-dev zlib-dev freetype-dev lcms2-dev openjpeg-dev tiff-dev tk-dev tcl-dev \
    && apk add libffi-dev py-cffi \
    && apk add gettext

WORKDIR /backendPython

COPY ./apiFileUpload .
CMD python -m venv env
CMD cd env\Scripts\activate
COPY ./apiFileUpload/requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000