DOCKER_COMPOSE = cd docker && docker-compose
API_DIR = cd api/src/btsapi
APP_DIR = cd app

.PHONY: up down build run run-api run-app

install-poetry:
	poetry install

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

build:
	$(DOCKER_COMPOSE) build

run-api: install-poetry
	$(API_DIR) && poetry run uvicorn main:app --reload

run-app:
	$(APP_DIR) && npm install && npm run dev

run: up
	$(MAKE) run-api &
	$(MAKE) run-app
	wait
