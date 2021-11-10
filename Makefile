.PHONY:
.SILENT:

build:
	go build -o ./.bin/bot cmd/bot/main.go

run: build
	./.bin/bot

build-image:
	docker build -t pocket-collections-bot:v0.1 .

start-container:
	docker run --name pocket-collections-bot -p 80:80 --env-file .env pocket-collections-bot:v0.1