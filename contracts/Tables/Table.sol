pragma solidity 0.4.15;

/**
 * @title Table contract - provide basic functionality for any casino Table
 * @author Rohit Narurkar <rohitnarurkar@gmail.com>
 */
contract Table {

  /**
   * Enum Scope
   * @dev scope of the table whether public or private
   */
  enum Scope { PUBLIC, PRIVATE }

  /**
   * Storage
   */
  uint public interval;
  address public owner;
  address public creator;
  Scope public scope;
  uint public balance;
  address[] users;
  mapping (address => uint) balances;

  /**
   * @dev Constructor for Table
   * @param _creator Creator of table
   * @param _scope Scope of table public or private
   * @param _interval Interval between two rounds
   */
  function Table(address _creator, Scope _scope, uint _interval) {
    creator = _creator;
    scope = _scope;
    interval = _interval;
  }
}
