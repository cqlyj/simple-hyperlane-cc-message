// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Receiver {
    bytes32 public lastSender;
    string public lastMessage;

    event ReceivedMessage(
        uint32 origin,
        bytes32 sender,
        uint256 value,
        string data
    );

    /// @notice Implement access control
    function handle(
        uint32 _origin,
        bytes32 _sender,
        bytes calldata _message
    ) external payable {
        emit ReceivedMessage(_origin, _sender, msg.value, string(_message));
        lastSender = _sender;
        lastMessage = string(_message);
    }
}
