// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract LUCRLedgerBridge {
    address public governance;

    event LedgerMint(address indexed to, uint256 amount, uint256 blockNum);
    event LedgerBurn(address indexed from, uint256 amount, uint256 blockNum);
    event LedgerSale(address indexed buyer, uint256 paid, uint256 amount, uint256 blockNum);

    modifier onlyGovernance() {
        require(msg.sender == governance, "Not governance");
        _;
    }

    constructor() {
        governance = msg.sender;
    }

    function recordMint(address to, uint256 amount) external onlyGovernance {
        emit LedgerMint(to, amount, block.number);
    }

    function recordBurn(address from, uint256 amount) external onlyGovernance {
        emit LedgerBurn(from, amount, block.number);
    }

    function recordSale(address buyer, uint256 paid, uint256 amount) external onlyGovernance {
        emit LedgerSale(buyer, paid, amount, block.number);
    }
}
