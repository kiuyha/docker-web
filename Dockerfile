FROM python:3.9-slim

WORKDIR /app

RUN apt-get update && apt-get install -y git

RUN git clone https://github.com/kiuyha/Study-World.git

WORKDIR /app/Study-World

COPY ./.env /app/Study-World/website/.env

RUN pip install --no-cache-dir -r requirements.txt

RUN flask db init

RUN flask db migrate

RUN flask db upgrade

EXPOSE 5000

CMD ["python","main.py"]