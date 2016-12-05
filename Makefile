DOMAIN         ?= magit.vc
PUBLIC         ?= https://$(DOMAIN)
CFRONT_DIST    ?= E2LUHBKU1FBV02
PUBLISH_BUCKET ?= s3://$(DOMAIN)
S3_DOMAIN      ?= s3-website.eu-central-1.amazonaws.com
PUBLISH_S3_URL ?= http://$(DOMAIN).$(S3_DOMAIN)

help:
	$(info make publish - publish to https://magit.vc/assets/logo/)

publish:
	@aws s3 sync images/ $(PUBLISH_BUCKET)/assets/logo/ --delete
	@aws cloudfront create-invalidation \
	--distribution-id $(CFRONT_DIST) --paths "/assets/logo/*"
