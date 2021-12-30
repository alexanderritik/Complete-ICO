// SPDX-License-Identifier: MIT
pragma solidity >=0.5.22 <0.9.0;
import './Kittutoken.sol';

contract KittuTokenSale {
    
    address  admin;
    KittuToken public tokenContract;
    uint256 public tokenPrice;
    uint256 public tokensSold;

    event Sell(address _buyer, uint256 _amount);


    constructor(uint256 _tokenPrice, KittuToken _tokenContract){
        //assign a admin
        admin = msg.sender;

        //token price 
        tokenPrice = _tokenPrice;

        //token contract
        tokenContract = _tokenContract;
    }

    function multiply(uint x, uint y) internal pure returns (uint z) {
        require(y == 0 || (z = x * y) / y == x);
    }

    function buyTokens(uint256 _numberOfTokens) public payable {
        //check wether the minimum number of ether is sent or not
        require(msg.value == multiply(_numberOfTokens, tokenPrice));

        //does our contract have that much number of token
        require(tokenContract.balanceOf(address(this)) >= _numberOfTokens);

        //token is transfer to the address
        require(tokenContract.transfer(msg.sender, _numberOfTokens));

        tokensSold += _numberOfTokens;

        emit Sell(msg.sender, _numberOfTokens);
    }

    function endSale() public {

        //only admin can do this
        require(msg.sender == admin);

        //we to send the remaning token to admin
        require(tokenContract.transfer(admin, tokenContract.balanceOf(address(this))));

        // Just transfer the balance to the admin
        // payable(admin).transfer(address(this).balance);

                            //both method is correct

        //you can also call the reset of state variable and 
        // it autmatically transfer the contract money to adress
        selfdestruct(payable(admin));
    }




}