const hre = require("hardhat");

async function main() {
  const Cake = await hre.ethers.getContractFactory("CakeProxy");
  const cake = await Cake.deploy();

  await cake.deployed();

  console.log("Cake deployed to:", cake.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
