// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Receiver} from "src/Receiver.sol";

contract DeployReceiver is Script {
    function run() external {
        vm.startBroadcast();
        Receiver receiver = new Receiver();
        vm.stopBroadcast();

        console.log("Receiver deployed at: ", address(receiver));
    }
}
