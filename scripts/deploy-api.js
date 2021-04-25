const hre = require("hardhat");

async function main() {
  const Api = await hre.ethers.getContractFactory("BscApi");
  const api = await Api.deploy();

  await api.deployed();

  console.log("Api deployed to:", api.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
