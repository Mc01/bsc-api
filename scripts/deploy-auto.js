const hre = require("hardhat");

async function main() {
  const Auto = await hre.ethers.getContractFactory("AutoProxy");
  const auto = await Auto.deploy();

  await auto.deployed();

  console.log("Auto deployed to:", auto.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
