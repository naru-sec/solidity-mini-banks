# solidity-mini-calculator add or multi 

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;




   
contract calci{

    function add(uint a,uint b) public  pure returns  (uint){
        return a + b;
    }

    function multi(uint a, uint b) public  pure returns (uint){
        return a * b;
    }
    function div(uint a,uint b) public  pure returns (uint){
        return a / b;
    }
    function minus(uint a, uint b) public  pure returns (uint){
        return a - b;
    }
}


