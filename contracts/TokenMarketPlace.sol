// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// IERC20 is an interface 

contract TokenMarketPlace{
    //int for both positive and neg value store
    //uint for positive value store

    uint public  constant TOKEN_PRICE = 1 ether;
    //constant means it should not change 
    uint private reservedOrderedTokens;
    //we can call only public variable cannot private variable
    // solidity shows the value of eth in wei 


    IERC20 public gldToken;
    
    error TokenMarketplace_ZeroTokens(uint256 numberOfTokens);
    error TokenMarketplace_InsufficientEthPayment(uint256 expectedPayment,uint256 actualPayment);

    constructor(address _gldToken){
        gldToken=IERC20(_gldToken);
    }
    //constructor executes first


    //this function is used to fetch the balance of current wallet
    function _getGldTokenBalanceMarketPlace() internal view returns(uint256){
        return gldToken.balanceOf(address(this));
    }

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