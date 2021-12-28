// SPDX-License-Identifier: MIT
pragma solidity >=0.5.22 <0.9.0;
import './Kittutoken.sol';

contract KittuTokenSale {
    
    address  admin;
    KittuToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    constructor(uint256 _tokenPrice, KittuToken _tokenContract){
        //assign a admin
        admin = msg.sender;

        //token price 
        tokenPrice = _tokenPrice;

        //token contract
        tokenContract = _tokenContract;
    }

}