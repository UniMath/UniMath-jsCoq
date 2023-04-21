
REPO = https://github.com/UniMath/UniMath.git
WORKDIR = UniMath

JSCOQ_CLI = npx jscoq

build: $(WORKDIR)
	# Use current workspace, not jsCoq's
	(cd $(WORKDIR) ; git pull)
	$(JSCOQ_CLI) sdk dune build --root $(WORKDIR)

$(WORKDIR):
	git clone $(REPO) $(WORKDIR)
	cp dune ./UniMath

setup:
	npm i
	docker pull jscoq/jscoq:sdk
	docker tag jscoq/jscoq:sdk jscoq:sdk
	rm -rf /tmp/jscoq-sdk  # cleanup in case there was a previous build there

clean:
	dune clean
