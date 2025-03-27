// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Sender} from "src/Sender.sol";

contract DeploySender is Script {
    function run() external {
        vm.startBroadcast();
        Sender sender = new Sender();
        vm.stopBroadcast();

        console.log("Sender deployed at: ", address(sender));
    }
}
