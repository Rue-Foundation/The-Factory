pragma solidity ^0.4.11;

// Desctiortion

//imports




// External calls

contract factory {

function getProfile(address _owner) constant returns (address _Profile);

}


contract Registrator {

  factory ProfilesFactory;


  // KonstrUktor
  function Registrator(address Factory){
    ProfilesFactory = factory(Factory);
  }

/*
  // tyoe of entangle link
  enum TypeL {
    facebook,
    vk,
    github,
    email,
    telegram
  }
*/




  struct SocLinks {
    bytes32 fcb;
    bytes32 vk;
    bytes32 git;
    bytes32 eml;
    bytes32 tlgr;
  }

//  TypeL public linktype

  mapping (address => SocLinks) public entangled;

  /* NOTE I should notice, that we cannot simply use array of links cause every link is bytes32 array itself.


  */



  function facebook (bytes32 link, address profile) internal returns (bool success) {
    SocLinks memory links = entangled[profile];
    links.fcb = link;
    entangled[profile] = links;
    return true;
  }


    function vk (bytes32 link, address profile) internal returns (bool success) {
      SocLinks memory links = entangled[profile];
      links.vk = link;
      entangled[profile] = links;
      return true;
    }


      function git (bytes32 link, address profile) internal returns (bool success) {
        SocLinks memory links = entangled[profile];
        links.git = link;
        entangled[profile] = links;
        return true;
      }


        function email (bytes32 link, address profile) internal returns (bool success) {
          SocLinks memory links = entangled[profile];
          links.eml = link;
          entangled[profile] = links;
          return true;
        }


          function telegram (bytes32 link, address profile) internal returns (bool success) {
            SocLinks memory links = entangled[profile];
            links.tlgr = link;
            entangled[profile] = links;
            return true;
          }

    function entangle (bytes32 _link,uint8 _type) public returns (bool success) {

      address profile = ProfilesFactory.getProfile(msg.sender);

    //  if (_type==TypeL.facebook) facebook(_link,profile);

    /* NOTE here we are CASE structure. someone probably will improve it in future

    */

    if (_type==1) require(facebook(_link,profile));
    if (_type==2) require(vk(_link,profile));
    if (_type==3) require(gitl(_link,profile));
    if (_type==4) require(email(_link,profile));
    if (_type==5) require(telegram(_link,profile));


    return true;
    }


}
