pragma solidity ^0.4.14;


//Raw prototype of Profile Factory
//TODO - DOCS

import './Declaration.sol';
import './Profile.sol';


contract Factory is factory {

    address sharesTokenAddress;

    address dao;

    address Sonm;

    // owner => Profile
    mapping (address => address[]) public Profiles;

    // Profile => type
    mapping (address => TypeW) public types;

    event ProfileCreated(address owner, address profile, bool isHub);

    address fish = 0x0;

    function Factory(address TokenAddress) public {
        sharesTokenAddress = TokenAddress;
        dao = msg.sender;
    }

    modifier onlyDao(){
        if (msg.sender != dao) {
            revert();
        }
        _;
    }

    function changeAdresses(address _dao, address _Sonm) public onlyDao {
        //network _Sonm
        dao = _dao;
        Sonm = _Sonm;
    }

    function createProfile(bool isHub) public returns (address){
        require(Sonm != fish);
        var profile = address(new Profile(msg.sender, dao, Sonm, sharesTokenAddress, isHub));
        //TODO: getting profile type from array
        Profiles[msg.sender].push(profile);
        ProfileCreated(msg.sender, profile , isHub);
        return profile;
    }

    function getProfiles(address _owner)public constant returns (address[] _Profile) {
        return Profiles[_owner];
    }

    function getType(address _Profile) public constant returns (TypeW _type) {
        return types[_Profile];
    }
}
