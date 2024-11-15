FROM python:3.9

WORKDIR /app

COPY . .

ENV SNOWFLAKE_USERNAME="sam"
ENV SNOWFLAKE_PASSWORD='P10\$\$word'

RUN pip install -r requirements.txt

CMD ["dbt", "run"]