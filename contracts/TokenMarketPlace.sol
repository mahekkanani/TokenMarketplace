// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract TokenMarketPlace{
    //int for both positive and neg value store
    //uint for positive value store

    uint public  constant TOKEN_PRICE = 1 ether;
    //constant means it should not change 
    uint private reservedOrderedTokens;
    //we can call only public variable cannot private variable
    // solidity shows the value of eth in wei 
    error TokenMarketplace_ZeroTokens(uint256 numberOfTokens);
    error TokenMarketplace_InsufficientEthPayment(uint256 expectedPayment,uint256 actualPayment);


    function _isNumberOfTokensZero(uint256 numberOfTokens) internal pure { 
        if(numberOfTokens==0){
            revert TokenMarketplace_ZeroTokens(numberOfTokens);
        }
    }

    function _checkEthPayment(uint256 numberOfTokens) internal view {
        if(numberOfTokens*TOKEN_PRICE!=msg.value){
            revert TokenMarketplace_InsufficientEthPayment(numberOfTokens*TOKEN_PRICE,msg.value);
        }
    }

    function buyTokensFromMarketplace(uint256 numberOfTokens) external payable{
        _isNumberOfTokensZero(numberOfTokens);
        _checkEthPayment(numberOfTokens);
        
    }
    
}