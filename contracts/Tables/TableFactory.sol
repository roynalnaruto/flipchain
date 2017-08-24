pragma solidity 0.4.15;

import "./Table.sol";
import "./BaccaratTable.sol";

/**
 * @title TableFactory this contract creates Tables
 * @author Rohit Narurkar <rohitnarurkar@gmail.com>
 */
contract TableFactory {

  /**
   * Events
   */
  event BaccaratTableCreated(address indexed creator, BaccaratTable baccaratTable, Table.Scope scope, uint interval);

  /**
   * Storage
   */
  mapping (bytes32 => BaccaratTable) public baccaratTables;

  /**
   * @dev Create new Baccarat Table
   * @param scope Scope of Table
   * @param interval Interval between rounds
   * @return Table contract
   */
  function createBaccaratTable(Table.Scope scope, uint interval) returns (BaccaratTable baccaratTable) {
    bytes32 tableHash = keccak256(msg.sender, now);
    require(address(baccaratTables[tableHash]) == 0);
    baccaratTable = new BaccaratTable(msg.sender, scope, interval);
    baccaratTables[tableHash] = baccaratTable;
    BaccaratTableCreated(msg.sender, baccaratTable, scope, interval);
  }

}
