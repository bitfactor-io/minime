pragma solidity ^0.4.18;

import "./MiniMeToken.sol";

contract BitfactorToken is MiniMeToken { 

  // Constructor
  function BitfactorToken(address _tokenFactory) public 
    MiniMeToken(
      _tokenFactory,
      0x0,
      0,
      "Bitfactor Token",
      18, // decimals
      "BTF",
      false) {
    
    controller = msg.sender;
  }

  function () payable public {
    revert();
  }

}

