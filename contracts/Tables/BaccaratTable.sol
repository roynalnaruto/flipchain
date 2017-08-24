pragma solidity 0.4.15;

import "./Table.sol";

/**
 * @title BaccaratTable - Game engine for Baccarat table
 * @author Rohit Narurkar <rohitnarurkar@gmail.com>
 */
contract BaccaratTable is Table {

  /**
   * Enum BetType
   * @dev type of bet
   * @param PLAYER - bet that player will win
   * @param BANKER - bet that banker will win
   * @param DRAW - bet that outcome will be draw
   */
  enum BetType { PLAYER, BANKER, DRAW }

  /**
   * Enum Outcome
   * @dev type of Outcome
   * @param PLAYER - player wins
   * @param BANKER - banker wins
   * @param DRAW - outcome is Draw
   */
  enum Outcome { PLAYER, BANKER, DRAW }

  /**
   * Enum State
   * @dev state of the round at present
   * @param SHUFFLING - shuffling cards
   * @param WAITING - waiting for users to place bets
   * @param DRAWING - drawing cards
   * @param SETTLING - settling tokens based on outcome
   * @param INTERVAL - interval between two rounds/hands
   */
  enum State { SHUFFLING, WAITING, DRAWING, SETTLING, INTERVAL }

  /**
   * Enum CardType
   * @dev type of card
   */
  enum CardType { A, K, Q, J, TEN, NINE, EIGHT, SEVEN, SIX, FIVE, FOUR, THREE, TWO }

  /**
   * Enum CardSuit
   * @dev suit of card
   */
  enum CardSuit { SPADE, HEART, CLUB, DIAMOND }

  /**
   * Struct Bet
   * @dev structure of a baccarat bet
   * @param user - the user who bets
   * @param amount - the amount that is bet
   * @param bet - type of bet
   */
  struct Bet {
    address user;
    uint amount;
    BetType bet;
  }

  /**
   * Struct Card
   */
  struct Card {
    CardType card;
    CardSuit suit;
  }

  /**
   * Struct Hand
   */
  struct Hand {
    Card[] cards;
    uint8 value;
  }

  /**
   * struct Round
   */
  struct Round {
    Bet[] bets;
    Hand player;
    Hand banker;
    Outcome outcome;
  }

  /**
   * Storage
   */
  State public state;
  uint8 delay;
  uint8[] cardOrder;
  uint8 cardIndex;
  Round[] previousRounds;
  Round currentRound;

  /**
   * @dev Constructor
   * @param _creator Creator of table
   * @param _scope Scope of table public or private
   * @param _interval Interval between two rounds
   */
  function BaccaratTable(address _creator, Scope _scope, uint _interval)
    public Table(_creator, _scope, _interval) {

    }
}
