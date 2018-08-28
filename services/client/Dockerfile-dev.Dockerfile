# base image
FROM python:3.6.5-alpine

# install dependencies
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev && \
    apk add netcat-openbsd

# set working directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# add and install requirements
COPY ./requirements.txt .
RUN pip install --upgrade pip -r requirements.txt

# add entrypoint.sh
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh
RUN chmod -R 755 /usr/src/app/entrypoint.sh

# add app
COPY . .

# run server
CMD ["sh","-c","chmod 777 /usr/src/app/entrypoint.sh && /usr/src/app/entrypoint.sh"]