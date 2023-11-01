// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract BlackList {

    address public immutable owner;

    constructor(address initialOwner) {
        require(initialOwner != address(0), "Initial owner cannot be the zero address");
        owner = initialOwner;
    }

    mapping (address => bool) private isBlacklist;

    modifier onlyOwner {
        require(msg.sender == owner, "You cannot do this because you are not the owner");
        _;
    }

    function addBlocklist(address user) public onlyOwner {
        require(!isBlacklist[user], "User is already blacklisted");
        isBlacklist[user] = true;
    }

    function removeBlocklist(address user) public onlyOwner {
        require(isBlacklist[user], "User is already whitelisted");
        isBlacklist[user] = false;
    }

    function isBlacklisted(address user) public view returns (bool) {
        return isBlacklist[user];
    }
}
