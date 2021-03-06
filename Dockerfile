FROM python:3.6-alpine
RUN apk add gcc musl-dev && pip install pipenv

COPY Pipfile /opt
RUN cd /opt && pipenv lock --requirements > requirements.txt && pip install -r /opt/requirements.txt

ADD src/ /opt/coronabot

CMD ["python", "/opt/coronabot/coronabot.py"]
