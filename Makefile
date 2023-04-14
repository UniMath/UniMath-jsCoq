
REPO = https://github.com/UniMath/UniMath.git
WORKDIR = UniMath

JSCOQ_CLI = npx jscoq

build: $(WORKDIR)
	# Use current workspace, not jsCoq's
	$(JSCOQ_CLI) sdk dune build UniMath/Foundations

$(WORKDIR):
	git clone --recursive --depth=1 $(REPO) ./tmp
	cp -r tmp/dune-project tmp/coq-unimath.opam tmp/util tmp/UniMath ./
	rm -r ./tmp

setup:
	npm i
	docker pull jscoq/jscoq:sdk
	docker tag jscoq/jscoq:sdk jscoq:sdk
	rm -rf /tmp/jscoq-sdk  # cleanup in case there was a previous build there

clean:
	dune clean
