pragma solidity ^0.4.24;

contract Ownable {                                                              // The Ownable contract has an owner address, and provides basic authorization control functions, this simplifies the implementation of "user permissions".

    address public owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() public
    {
        owner = msg.sender;                                                     //The Ownable constructor sets the original `owner` of the contract to the senderaccount.
    }

    modifier onlyOwner()
    {
        require(msg.sender == owner);                                           // Throws if called by any account other than the owner.
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner
    {
        _transferOwnership(_newOwner);                                          // Allows the current owner to transfer control of the contract to a newOwner address to transfer ownership to.
    }

    function _transferOwnership(address _newOwner) internal                     // Transfers control of the contract to a newOwner address to transfer ownership to.
    {
        require(_newOwner != address(0));
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
}

contract CCGX_Swap is Ownable {

    constructor() public {}

    function OneToOneSwapTRC10(address toAddress, trcToken id) payable public   // OneToOneSwapTRC10 SWAP
    {
        uint256 toeknValue = (msg.value)/1000000;
        toAddress.transferToken(toeknValue, id);
    }



    function TwoToOneSwapTRC10(address toAddress, trcToken id) payable public  // TwoToOneSwapTRC10 SWAP
    {
        uint256 toeknValue = (msg.value)/2000000;
        toAddress.transferToken(toeknValue, id);
    }

    // FiveToOneSwapTRC10 SWAP
    function FiveToOneSwapTRC10(address toAddress, trcToken id) payable public
    {
        uint256 toeknValue = (msg.value)/5000000;
        toAddress.transferToken(toeknValue, id);
    }

    function getTRC10TokenBalance(trcToken id) public view returns (uint256)    //FiveToOneSwapTRC10 SWAP END
    {
        return address(this).tokenBalance(id);
    }

    function ACTIVSwapTRC10(address toAddress, trcToken id) payable public
    {
        uint256 tokenValue = (msg.value);
        toAddress.transferToken(tokenValue, id);
    }

    // @dev Returns contract ETH balance
    function getBalance() public view returns (uint256)
    {
        return address(this).balance;
    }

    // @dev Transfers TRX from contract to specified address
    function withdrawTRX(address _address, uint256 _amount) onlyOwner public returns (uint256)
    {
        // transfer reward to account
        _address.transfer(_amount*1000000);
    }

    // @dev Transfers TRX from specified address to contract
    function depositTRX() public payable onlyOwner returns (bool)
    {
        return true;
    }
}
