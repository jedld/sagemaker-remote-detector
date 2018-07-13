FROM ubuntu:16.04

RUN apt-get -y update && apt-get install -y --no-install-recommends \
         python3-pip \
         python3-dev \
         python3-setuptools \
         wget \
         nginx \
         ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install -U pip
RUN pip3 install -U tensorflow pandas flask gevent gunicorn && \
        rm -rf /root/.cache

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"


# Set up the program in the image
COPY scripts /opt/program
WORKDIR /opt/program