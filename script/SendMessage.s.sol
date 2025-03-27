// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {Vm} from "forge-std/Vm.sol";
import {Sender} from "src/Sender.sol";

contract SendMessage is Script {
    function run() external {
        address senderAddress = Vm(address(vm)).getDeployment(
            "Sender",
            uint64(block.chainid)
        );
        address recipient = Vm(address(vm)).getDeployment("Receiver", 80002); // 80002 is the destination Polygonamoy chain ID

        Sender sender = Sender(senderAddress);

        vm.startBroadcast();

        uint256 fee = sender.getFee(recipient);
        sender.sendMessage{value: fee}(recipient);

        vm.stopBroadcast();

        console.log("Message sent to: ", recipient);
    }
}
