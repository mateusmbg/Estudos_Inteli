// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract PropertyTransfer {
    address public owner;
    string public location;
    string public transferType;

    constructor() {
        owner = msg.sender;
        location = "Piaui";
        transferType = "Doacao";
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Only contract owner can call this function");
        _;
    }

    function getLoc() public view returns (string memory) {
        return location;
    }

    function setLoc(string memory _location) public onlyOwner {
        location = _location;
    }

    function getTipo() public view returns (string memory) {
        return transferType;
    }

    function setTipo(string memory _transferType) public onlyOwner {
        transferType = _transferType;
    }

    function getAliquota() public view returns (uint256) {
        if (keccak256(abi.encodePacked(location)) == keccak256(abi.encodePacked("Ceara"))) {
            if (keccak256(abi.encodePacked(transferType)) == keccak256(abi.encodePacked("Heranca"))) {
                return 6;
            } else {
                return 3;
            }
        } else if (keccak256(abi.encodePacked(location)) == keccak256(abi.encodePacked("Piaui"))) {
            return 4;
        } else {
            return 2;
        }
    }
}
