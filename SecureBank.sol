// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SecureBank {
    // Digital ledger to track user balances
    mapping(address => uint) public balances;

    // Events for logging deposits and withdrawals
    event DepositMade(address indexed accountHolder, uint amount);
    event WithdrawMade(address indexed accountHolder, uint amount);

    // Function to deposit ETH into the bank
    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero!");
        balances[msg.sender] += msg.value;
        emit DepositMade(msg.sender, msg.value);
    }

    // Secure withdraw function (Checks-Effects-Interactions pattern)
    function withdraw(uint amount) public {
        // [Check] 1. Check if the user has enough balance
        require(balances[msg.sender] >= amount, "Not enough balance!");

        // [Effect] 2. Deduct balance before sending money (Prevents Reentrancy attack)
        balances[msg.sender] -= amount;

        // [Interaction] 3. Transfer ETH to the user's wallet
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Transaction failed!");

        // 4. Emit the withdrawal event
        emit WithdrawMade(msg.sender, amount);
    }

    // Function to check total bank contract balance
    function getBankBalance() public view returns (uint) {
        return address(this).balance;
    }
}
