pragma solidity ^0.4.13;


//Declaration contains declaretion of existed contracts and their functions


/* The token is used as a voting shares */
contract token {
    mapping (address => uint) public balances;
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
    function transfer(address _to, uint _value) public returns (bool success);
    function balanceOf(address _owner) public constant returns (uint balance);
    function approve(address _spender, uint _value) public returns (bool success);
    function allowance(address _owner, address _spender) public constant returns (uint remaining);
}


contract network {
  function Register(address _owner, address _wallet, uint64 time) public returns(bool);
  function DeRegister(address _owner, address _wallet,  uint localR) public returns(bool);
  function getGlobalRate(address _owner, address _Profile) public returns (uint);
}


// Factory safe definition
contract factory{
    //Profile type
    enum TypeW {
    Hub,
    Client
    }

    //function getProfiles(address _owner) constant returns (address[] _Profile);
    function getType(address _Profile) public constant returns (TypeW _type);
}

contract profile{
    function OpenDeal(uint cost, uint _endTime) external returns (uint lockId);
}

contract Declaration {

}
