const hre = require("hardhat");
const json = require("./whitelist.json");

async function main() {
  const NFT = await hre.ethers.getContractFactory(process.env.CONTRACT_NAME);
	const contract = NFT.attach(process.env.CONTRACT_ADDRESS);

  txn = await contract.setWhiteList(json.whitelist);
  console.log("\nStart Sale Txn: ", txn);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
