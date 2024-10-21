FROM python:3.12-slim

ARG DEBUG

RUN apt update
RUN apt upgrade -y
RUN pip install --upgrade pip pip-tools

RUN mkdir -p /home/python/app
WORKDIR /home/python/app/

COPY requirements.in ./
RUN pip-compile
RUN pip-sync

COPY ./src /home/python/app/
