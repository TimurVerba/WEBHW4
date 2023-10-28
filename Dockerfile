FROM python:3.11.3

ENV APP_HOME /app

WORKDIR $APP_HOME

COPY pyproject.toml $APP_HOME/pyproject.toml
COPY poetry.lock $APP_HOME/poetry.lock

COPY . .

RUN pip install poetry
RUN poetry config virtualenvs.create false && poetry install --only main

EXPOSE 3000

CMD ["python", "main.py"]