FINAL_PROJECT_DIR := ~/final_project

setup:
	mkdir -p ~/.gc
	touch ~/.gc/credentials.json
	nano ~/.gc/credentials.json
	
config:
	echo 'export GOOGLE_APPLICATION_CREDENTIALS=~/.gc/credentials.json' >> ~/.bashrc \
	&& . ~/.bashrc

install_pack:
	cd $(FINAL_PROJECT_DIR)/recreate_project && \
	chmod +x package_install.sh && \
	chmod +x teardown.sh && \
	./package_install.sh

build_run_docker:
	cd $(FINAL_PROJECT_DIR) 
	cp dev.env .env 
	docker-compose build 
	docker-compose up -d 
	docker exec -it final_project-magic-1 sh -c "cd /home/src/movies_tv_shows/dbt/movies_tv_shows_dbt && dbt deps"

teardown:
	cd $(FINAL_PROJECT_DIR)/recreate_project && \
	./teardown.sh
