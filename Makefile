start:
	docker-compose up

stop:
	docker-compose stop

console:
	docker-compose run --rm web rails c
