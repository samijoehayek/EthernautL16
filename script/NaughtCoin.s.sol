// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {NaughtCoin} from "../src/NaughtCoin.sol";


contract NaughtCoinMalicious is Script {
    NaughtCoin public naughtCoin = new NaughtCoin();


    function run() public {
        naughtCoin.transfer();
    }
}

contract NaughtCoinScript is Script {

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        NaughtCoinMalicious naughtCoinM = new NaughtCoinMalicious();
        naughtCoinM.run();
        vm.stopBroadcast(); 
    }
}
