const hre = require("hardhat");
require("dotenv").config();

async function main() {
  const NFT = await hre.ethers.getContractFactory(process.env.CONTRACT_NAME);
	const contract = NFT.attach(process.env.CONTRACT_ADDRESS);

  txn = await contract.startSale();
  console.log("\nStart Sale Txn: ", txn);
  console.log("Sale Active: ", await contract.isSaleActive());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
