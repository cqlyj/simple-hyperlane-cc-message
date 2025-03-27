// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";
import {Receiver} from "src/Receiver.sol";

contract GetLastMessage is Script {
    function run() external {
        address receiver = Vm(address(vm)).getDeployment(
            "Receiver",
            uint64(block.chainid)
        );

        Receiver receiverContract = Receiver(receiver);

        vm.startBroadcast();
        string memory lastMessage = receiverContract.lastMessage();
        vm.stopBroadcast();

        console.log("Last message: ", lastMessage);
    }
}
