pragma solidity 0.4.15;

import '../Tables/Table.sol';
import '../Tables/BaccaratTable.sol';
import '../Tokens/CasinoToken.sol';

/**
 * @title TableFactory this contract creates Tables
 * @author Rohit Narurkar <rohitnarurkar@gmail.com>
 */
contract TableFactory {

  /**
   * @dev Constants
   */
  uint baccaratTableBalance = 1000;

  /**
   * Events
   */
  event BaccaratTableCreated(address indexed creator, BaccaratTable baccaratTable, Table.Scope scope, uint interval, uint maxUsers);

  /**
   * Storage
   */
  address public owner;
  mapping (bytes32 => BaccaratTable) public baccaratTables;
  CasinoToken token;

  /**
   * @dev Constructor
   */
  function TableFactory() {
    owner = msg.sender;
    token = new CasinoToken();
  }

  /**
   * @dev Create new Baccarat Table
   * @param scope Scope of Table
   * @param interval Interval between rounds
   * @param maxUsers Maximum users that can play on the table
   * @return Table contract
   */
  function createBaccaratTable(Table.Scope scope, uint interval, uint maxUsers) returns (BaccaratTable baccaratTable) {
    bytes32 tableHash = keccak256(msg.sender, now);
    require(address(baccaratTables[tableHash]) == 0);
    baccaratTable = new BaccaratTable(msg.sender, scope, interval, maxUsers);
    token.mint(address(baccaratTable), baccaratTableBalance);
    baccaratTables[tableHash] = baccaratTable;
    BaccaratTableCreated(msg.sender, baccaratTable, scope, interval, maxUsers);
  }

}
