const hre = require("hardhat");
require("dotenv").config();

async function main() {
  const NFT = await hre.ethers.getContractFactory(process.env.CONTRACT_NAME);
  const nft = await NFT.deploy();

  let txn = await nft.deployed();
  console.log("NFT deployed to: ", nft.address)
  console.log("\nTxn: ", txn);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
