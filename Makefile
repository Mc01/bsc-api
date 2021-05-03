node:
	npx hardhat node

compile:
	npx hardhat compile

runtest:
	npx hardhat test

deploy-auto:
	npx hardhat run scripts/deploy-auto.js

deploy-cake:
	npx hardhat run scripts/deploy-cake.js

deploy-cakev2:
	npx hardhat run scripts/deploy-cakev2.js

deploy-api:
	npx hardhat run scripts/deploy-api.js
