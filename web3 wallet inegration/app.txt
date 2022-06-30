import React, {useState, useEffect} from "react";
import SimpleStorageContract from "./contract/SimpleStorage.json";
import getWeb3 from "./getWeb3";
import connection from "./connection";

import "./app.css";

const app =() =>  {
    const [web3, setWeb3] =  useState(undefined)
    const [accounts, setaccounts] =  useState(undefined)
    const [contract, setcontract] =  useState(undefined)

useEffect (() => {
const init = async() => {
    // Get network provider and web3 instance.
const web3 = await getWeb3();

// use web3 to get the user's accounts.
const accounts = await web3.eth.getAccounts();

// get the contract instance.
const networkId = await web3.eth.net.getId();
const deployedNetwork = SimpleStorageContract.networks[networkId];
const instance = new web3.eth.contract(
    SimpleStorageContract.abi,
    deployedNetwork && deployedNetwork.address,
);

setWeb3(web3)
setaccounts(accounts)
setcontract(contract)
}
init()
},[])

   return (
    <div className="app">
        <h1>Good to Go!</h1>
        <p>your truffle box is installed and ready</p>
        <h2>Smart Contract Example</h2>
        <p>
            if your contracts compiled and migrated succesfully, below will show
            a stored value of 5 (by default).
        </p>
        <p>
            try changing the value stored on <strong>line 40</strong> of app.js.
        </p>
<connection />
        </div>
   );
}