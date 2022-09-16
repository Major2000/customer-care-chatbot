FROM python:3.7.7-stretch AS BASE

RUN apt-get update \
    && apt-get --assume-yes --no-install-recommends install \
        build-essential \
        curl \
        git \
        jq \
        libgomp1 \
        vim

WORKDIR /app

# upgrade pip version
RUN pip install --no-cache-dir --upgrade pip

RUN pip install --no-cache-dir -r /app/requirements.txt \
    && pip install --no-cache-dir -r /optional-requirements.txt

RUN pip install rasa==2.8.1

# RUN pip rasa-sdk==2.8.1


ADD config.yml config.yml
ADD domain.yml domain.yml
ADD credentials.yml credentials.yml
ADD endpoints.yml endpoints.yml