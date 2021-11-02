const hre = require("hardhat");
const timer = ms => new Promise( res => setTimeout(res, ms));
async function main() {
  //const txgasLimit = ethers.utils.parseUnits("285000", "wei");
  //const txgasPrice = ethers.utils.parseUnits("30", "wei");
  //console.log("txgasPrice", txgasPrice)
  const NFT = await hre.ethers.getContractFactory("YOURNFTNAME");
  const WALLET_ADDRESS =   "0x0000000000000000000000000000000000000000"
  const CONTRACT_ADDRESS = "0x0000000000000000000000000000000000000000"
  const contract = NFT.attach(CONTRACT_ADDRESS);
  // for (let i = 0; i < 50; i++) {
  //   await timer(5000);
  //   mintedNFT = await contract.mint(WALLET_ADDRESS,{ gasLimit: 295000, gasPrice: ethers.utils.parseUnits('30', 'gwei')});
  //   console.log("NFT minted:", mintedNFT);
  // } 
  mintedNFT = await contract.mint(WALLET_ADDRESS,{ gasLimit: 295000, gasPrice: ethers.utils.parseUnits('30', 'gwei')});
  console.log("NFT minted:", mintedNFT);
}
main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});