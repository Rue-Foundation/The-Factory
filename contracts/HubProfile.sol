pragma solidity ^0.4.14;

//Raw prototype for Hub Profile contract.

//import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
// ^ uncomment this after debug
import "./Profile.sol";


contract HubProfile is Profile{

  ///@dev constructor
  function HubProfile(address _hubowner,address _dao,network _Network,token sharesAddress){
    owner=_hubowner;
    DAO=_dao;
    Network= network(_Network);
    Factory=msg.sender;
    genesisTime=uint64(now);

    sharesTokenAddress = token(sharesAddress);

    //1 SNM token is needed to registrate in Network
    freezeQuote = 1 * (1 ether / 1 wei);

    //in promilles
    daoFee = 10;

    freezePeriod = 10 days;


    currentPhase = Phase.Idle;

  }

  function Registration() public returns (bool success){

    require(currentPhase==Phase.Idle);
    require(sharesTokenAddress.balanceOf(this) >= freezeQuote);

    if(!super.CheckIn()) revert();
    return true;
  }

}
