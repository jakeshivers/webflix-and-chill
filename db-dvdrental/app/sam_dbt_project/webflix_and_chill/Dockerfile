FROM python:3.9

WORKDIR /app

COPY . .

ENV SNOWFLAKE_USERNAME="sam"
ENV SNOWFLAKE_PASSWORD="my secret password"

RUN pip install -r requirements.txt

CMD ["dbt", "run"]