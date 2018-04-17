.PHONY: run-web, stop-web rm-web

PWD := $(shell pwd)
USER := $(shell id -u)
GROUP := $(shell id -g)

run-web: 
	docker-compose -p "atlassian-$(USER)" up -d

stop-web: 
	docker-compose -p "atlassian-$(USER)" stop 

rm-web: 
	docker-compose -p "atlassian-$(USER)" rm 

build-con:
	docker build -f ./confluence/Dockerfile -t confluence:6.3 .
	
build-jira:
	docker build -f ./jira/Dockerfile -t jira:7.4.1 .
