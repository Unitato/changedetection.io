FROM python:3.8-slim
COPY requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

COPY backend /app
WORKDIR /app

# https://stackoverflow.com/questions/58701233/docker-logs-erroneously-appears-empty-until-container-stops

ENV PYTHONUNBUFFERED=1

# Attempt to store the triggered commit
RUN echo "docker hub: $SOURCE_COMMIT" >/source.txt

RUN [ ! -d "/datastore" ] && mkdir /datastore

CMD [ "python", "./backend.py" ]



