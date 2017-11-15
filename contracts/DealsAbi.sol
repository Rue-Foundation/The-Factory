pragma solidity ^0.4.15;


contract DealsAbi{
  function OpenDeal(address _hub, address _client, uint256 _specHash, uint256 _price, uint _workTime);
  function AcceptDeal(uint id);
  function CloseDeal(uint id);
  function GetDealInfo(uint dealIndex) constant returns (uint specHach, address client, address hub, uint price, uint startTime, uint workTime, uint endTIme, uint status);
  function GetDeals(address addr) constant returns (uint[]);
  function GetDealsAmount() constant returns (uint);
  }
