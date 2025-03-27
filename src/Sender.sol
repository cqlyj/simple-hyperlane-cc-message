// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {IMailbox} from "@hyperlane/contracts/interfaces/IMailbox.sol";
import {TypeCasts} from "@hyperlane/contracts/libs/TypeCasts.sol";

contract Sender {
    // send message from sepolia to polygonamoy Receiver
    IMailbox mailbox =
        IMailbox(payable(0xfFAEF09B3cd11D9b20d1a19bECca54EEC2884766));

    function sendMessage(address recipient) external payable {
        uint32 destination = 80002;
        bytes memory body = bytes("Hello, world");
        uint256 fee = mailbox.quoteDispatch(
            destination,
            TypeCasts.addressToBytes32(recipient),
            body
        );
        mailbox.dispatch{value: fee}(
            destination,
            TypeCasts.addressToBytes32(recipient),
            body
        );
    }

    function getFee(address recipient) external view returns (uint256) {
        uint32 destination = 80002;
        bytes memory body = bytes("Hello, world");
        return
            mailbox.quoteDispatch(
                destination,
                TypeCasts.addressToBytes32(recipient),
                body
            );
    }
}
