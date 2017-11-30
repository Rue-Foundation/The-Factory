pragma solidity ^0.4.15;

import "./TSCToken.sol";

contract Deals{

  function Deals(address _libra, TSCToken token){
    //convert to low-level signature
    bytes4 signature = bytes4(keccak256("DealsLib(TSCToken _tkn)"));
    //address of library contract
    libra = _libra;

    // Compute the size of the call data
    //address has 20(!) bytes
    //but we need only last argument
    //thats why we take only one arg.
    // should it multiple 2x?
    uint argarraysize = 1;
    //address has 20(!) bytes (on ethscan 40 symbols)
    // should it multiple 2x?
    uint argsize = 2 * (argarraysize * 20);

    assembly{
      //add the signature to begin of memory
      signature 0x0 mstore

      //call data is at the end of code

      let valuepart:= argsize codesize sub
      //copy agrsize bytes from end of codesize to 0x8
      argsize valuepart 0x8 codecopy
      // where the messge ends
      let msgend:= 0x8 argsize add
      //delegate call to library
      // 0x0 means we dont need output
      // 0x8 means where we store beigin of argument
      // end is on the 0x8 + argumentsize
      0x0 0x0 msgend 0x8 _libra delegatecall
    }
  }

  address libra;
  //fallback and center of magic
  function() payable {
    if (msg.data.length > 0)
      libra.delegatecall(msg.data);
  }

  function GetDealInfo(uint dealIndex) constant returns (bool){
      return libra.delegatecall(msg.data);
  }

  function GetDeals(address addr) constant returns (bool){
      return libra.delegatecall(msg.data);
  }

  function GetDealsAmount() constant returns (bool){
      return libra.delegatecall(msg.data);
    }

  function ChangeLibAddress(address _newlib) returns (bool success){
    libra = _newlib;
    return true;
  }

  }
