FINAL_PROJECT_DIR := ~/final_project

# Establish a `.gc/` directory, generate a `credentials.json` file, and insert the Service Account credentials within it.
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

edit_env:
	cd $(FINAL_PROJECT_DIR) && \
	mv dev.env .env  && \
	nano .env

build_run_docker:
	cd $(FINAL_PROJECT_DIR) 
	docker-compose build 
	docker-compose up -d 
	docker exec -it final_project-magic-1 sh -c "cd /home/src/movies_tv_shows/dbt/movies_tv_shows_dbt && dbt deps"

teardown:
	cd $(FINAL_PROJECT_DIR)/recreate_project && \
	./teardown.sh
