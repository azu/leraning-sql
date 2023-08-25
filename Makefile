
up:
	mysql.server start

sh:
	mysql -u root

down:
	mysql.server stop

.PHONY: up down
