clean:
	git restore .
	git clean -fxd -e .env

install:
	yarn

migrate:
	yarn rw prisma migrate dev

reset: clean install migrate

upgrade: install
	yarn rw upgrade

# run
# ---

run-dev:
	yarn rw dev

# files
# -----

PACKAGE_JSONS=$(shell fd 'package.json')

open-package-jsons:
	code $(PACKAGE_JSONS)

sort-package-jsons:
	yarn dlx sort-package-json $(PACKAGE_JSONS)

TSCONFIG_JSON=$(shell fd 'tsconfig.json')

open-tsconfig-jsons:
	code $(TSCONFIG_JSON)

# framework
# ---------

CWD=$(shell pwd)

tarsync:
	cd $(RWFW_PATH) && \
		yarn node ./tasks/framework-tools/tarsync.mjs $(CWD) --verbose

reset_framework:
	cd $(RWFW_PATH) && \
		git clean -fxd -e .env && \
		yarn && \
		yarn build

reset_tarsync: reset reset_framework tarsync

# branch
# ------

open-vercel:
	open 'https://vercel.com/jtoar?projectDeleted=rw-vercel-deploy-repro'

open-neon:
	open 'https://console.neon.tech/app/projects/floral-bar-01537254'
