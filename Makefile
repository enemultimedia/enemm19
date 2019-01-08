start:
	docker-compose up

stop:
	docker-compose stop

console:
	docker-compose run --rm web rails c

migrate:
	docker-compose run --rm web rails db:migrate

rollback:
	docker-compose run --rm web rails db:rollback
