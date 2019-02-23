start:
	if [ -f tmp/pids/server.pid ]; then\
		rm tmp/pids/server.pid;\
	fi
	docker-compose up

stop:
	docker-compose stop

console:
	docker-compose run --rm web rails c

migrate:
	docker-compose run --rm web rails db:migrate

rollback:
	docker-compose run --rm web rails db:rollback

routes:
	docker-compose run --rm web rails routes

bundle:
	docker-compose run --rm web bundle
