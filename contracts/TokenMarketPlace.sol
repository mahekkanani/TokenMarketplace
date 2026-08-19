// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TokenMarketPlace{
    //int for both positive and neg value store
    //uint for positive value store

    uint public  constant TOKEN_PRICE = 1 ether;
    //constant means it should not change 
    uint private reservedTokens;
    //we can call only public variable cannot private variable
    // solidity shows the value of eth in wei 

    function buyTokensFromMarketplace(uint256 noOfTokens) external {
        
    }
}