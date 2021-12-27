// SPDX-License-Identifier: MIT
pragma solidity >=0.5.22 <0.9.0;


contract KittuToken {

    //constructor
    //Set the total number of token
    //Read the total number of token

    uint public totalSupply;
    string public tokenName = "Kittu";
    mapping(address => uint) public balanceOf;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );


    constructor(uint _totalsupply){
        balanceOf[msg.sender] = _totalsupply;
        totalSupply = _totalsupply;
    }

    //name of the token
    function name() public view returns (string memory){
        return tokenName;
    }

    //symbole of token
    function symbol() public pure returns (string memory){
        return "KIT";
    }


    function transfer(address _to, uint256 _value) public returns (bool success) {
    require(balanceOf[msg.sender] >= _value);

    balanceOf[msg.sender] -= _value;
    balanceOf[_to] += _value;

    emit Transfer(msg.sender, _to, _value);

    return true;
    }
    

    


}