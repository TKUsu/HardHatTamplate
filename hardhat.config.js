require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-web3");
require("dotenv").config();

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts")
  .addParam("account", "The account's address to show detail")
  .setAction(async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  if (taskArgs.account) {
    const account = web3.utils.toChecksumAddress(taskArgs.account);
    const balance = await web3.eth.getBalance(account);
    console.log(web3.utils.fromWei(balance, "ether"), "ETH");
  }else {
    for (const account of accounts) {
      console.log(account.address);
    }
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  defaultNetwork: "localhost",
  networks: {
    hardhat: {
    },
    localhost: {
      url: "http://127.0.0.1:8545"
    },
    mainnet: {
      url: `https://mainnet.infura.io/v3/${process.env.INFURA_API_KEY}`,
      accounts: process.env.Accounts_PRIVATE_KEY,
      gas: process.env.Network_Gas,
      gasPrice: process.env.Network_Gas_Price
    },
    rinkeby: {
      url: `https://rinkeby.infura.io/v3/${process.env.INFURA_API_KEY}`,
      accounts: process.env.Accounts_PRIVATE_KEY,
      gas: process.env.Network_Gas,
      gasPrice: process.env.Network_Gas_Price
    },
    ropsten: {
      url: `https://ropsten.infura.io/v3/${process.env.INFURA_API_KEY}`,
      accounts: process.env.Accounts_PRIVATE_KEY,
      gas: process.env.Network_Gas,
      gasPrice: process.env.Network_Gas_Price
    },
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts"
  },
  mocha: {
    timeout: 20000
  }
};
