// SPDX-License-Identifier: MIT
pragma solidity >=0.5.22 <0.9.0;


contract KittuToken {

    //constructor
    //Set the total number of token
    //Read the total number of token

    uint public totalSupply;
    string public tokenName = "Kittu";
    mapping(address => uint) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
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


    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        // here messenger is giving power  to spender that he can trasfer money on his behalf

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);

        //does _from give the permission to msg.sender to share that amount token

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;

        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);

        return true;
    }
    

    


}