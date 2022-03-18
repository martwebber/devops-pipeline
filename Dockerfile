FROM alpine:3.14
ADD . /devops-pipeline
WORKDIR /devops-pipeline
RUN apt-get update
RUN pip install -r requirements.txt

ENTRYPOINT [ "flask"]
CMD [ "run", "--host", "0.0.0.0" ]