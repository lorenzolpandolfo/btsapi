# BTS Api
An API to display BTS musical group members data.

### Running
Requirements:
- poetry
- docker
- python >= 3.13
- npm

With Makefile:
`make run`

then access http://localhost:5173/

or start everything manually:

- database: `cd docker && docker-compose up -d`
- api: `poetry install && cd api/src/btsapi && poetry run uvicorn main:app --reload`
- app: `cd app && npm install && npm run dev`

### Stopping
Just CTRL + C when running and execute `make down` to stop postgreSQL container.