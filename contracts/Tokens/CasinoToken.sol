pragma solidity 0.4.15;

import "zeppelin-solidity/contracts/token/MintableToken.sol";

contract CasinoToken is MintableToken {
  string public name = "FlipToken";
  string public symbol = "FLT";
  uint256 public decimals = 1;

  /**
   * modifier
   */
  modifier canMint(uint value) {
    require(value <= this.balance);
    _;
  }

  /**
   * @constructor
   */
  function CasinoToken() payable {
    owner = msg.sender;
  }
}
