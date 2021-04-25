require("@nomiclabs/hardhat-waffle");
const { key } = require('./secrets.json');

module.exports = {
  solidity: "0.7.6",
  defaultNetwork: "mainnet",
  networks: {
    mainnet: {
      url: "https://bsc-dataseed.binance.org/",
      accounts: [key]
    }
  }
};
