up:
	cd docker && docker-compose up -d

down:
	cd docker && docker-compose down

build:
	cd docker && docker-compose build

run-api:
	cd api/src/btsapi && poetry run uvicorn main:app --reload

run-app:
	cd app && npm install && npm run dev

run:
	$(MAKE) up
	$(MAKE) run-api &
	$(MAKE) run-app
	wait
