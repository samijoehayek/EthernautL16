// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {NaughtCoin} from "../src/NaughtCoin.sol";

contract NaughtCoinScript is Script {
    NaughtCoin public naughtCoin =
        NaughtCoin(0xc8A1B5d80417F4B5D9C4c2409379e44af68E4236);

    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log(
            "balance of user",
            naughtCoin.balanceOf(
                address(0xA86Ea1be0A43Ea977dd7489c7c91247B1a7bC50b)
            )
        );

        naughtCoin.approve(
            address(0x45F537Ad768970269fa556dbDAD432a6Fee6c96C),
            1000000000000000000000000
        );
        vm.stopBroadcast();

        console.log(
            "Allowance of second user",
            naughtCoin.allowance(
                address(0xA86Ea1be0A43Ea977dd7489c7c91247B1a7bC50b),
                address(0x45F537Ad768970269fa556dbDAD432a6Fee6c96C)
            )
        );

        vm.startBroadcast(vm.envUint("PRIVATE_KEY_2"));
        console.log(
            "balance of second user",
            naughtCoin.balanceOf(
                address(0x45F537Ad768970269fa556dbDAD432a6Fee6c96C)
            )
        );

        naughtCoin.transferFrom(
            address(0xA86Ea1be0A43Ea977dd7489c7c91247B1a7bC50b),
            address(0x45F537Ad768970269fa556dbDAD432a6Fee6c96C),
            1000000000000000000000000
        );

        console.log(
            "balance of second user",
            naughtCoin.balanceOf(
                address(0x45F537Ad768970269fa556dbDAD432a6Fee6c96C)
            )
        );
        vm.stopBroadcast();
    }
}
