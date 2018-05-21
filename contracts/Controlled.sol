pragma solidity ^0.4.18;

contract Controlled {
    /// @notice The address of the controller is the only address that can call
    ///  a function with this modifier (plus the failsafe)
    modifier onlyController { 
		bool isController = (msg.sender == controller);
		bool isFailsafe   = (msg.sender == failsafe);
		require((isController || isFailsafe)); _; }

    /// @notice The address of the failsafe is the only address that can call
    ///  a function with this modifier
    modifier onlyFailsafe { require(msg.sender == failsafe); _; }

    address public controller;
    address public failsafe = 0xdd870fa1b7c4700f2bd7f44238821c26f7392148;
	
    function Controlled() public { controller = msg.sender;}

    /// @notice Changes the controller of the contract
    /// @param _newController The new controller of the contract
    function changeController(address _newController) public onlyController {
        controller = _newController;
    }

    /// @notice Changes the failsafe of the contract
    /// @param _newFailsafe The new failsafe of the contract
    function changeFailsafe(address _newFailsafe) public onlyFailsafe {
        failsafe = _newFailsafe;
    }
}
