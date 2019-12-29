
.PHONY:

cors:
ifndef CORS_ORIGIN
	$(error CORS_ORIGIN not set)
endif
ifndef BUCKET
	$(error BUCKET not set)
endif
	sed -i "s/MY_CORS_ORIGIN/$(CORS_ORIGIN)/g" cors.json
	gsutil cors set cors.json gs://$(BUCKET)
	sed -i "s/$(CORS_ORIGIN)/MY_CORS_ORIGIN/g" cors.json

deploy:
ifndef BUCKET
	$(error BUCKET not set)
endif
	gsutil cp -r ajax/ gs://$(BUCKET)/static/js/

