import { ethers } from "ethers";

import abi from "./Keyboard.json";

const contractAddress = "0x86dCC94B2bf8395D68f00b5A2eac40C74b69a202";
const contractABI = abi.abi;

export default function getKeyboardsContract(ethereum) {
  if (ethereum) {
    const provider = new ethers.providers.Web3Provider(ethereum);
    const signer = provider.getSigner();
    return new ethers.Contract(contractAddress, contractABI, signer);
  } else {
    return undefined;
  }
}
