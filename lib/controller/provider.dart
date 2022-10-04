import 'package:flutter/material.dart';
import 'package:tic_tac/module/game.dart';

import '../module/player.dart';

class MyProvider with ChangeNotifier{
  String activePlayer = 'X';


  late bool switchValue = false;

  void changeSwitch(bool value) {

    switchValue = value;
    notifyListeners();
  }
  static bool gameOver = false;

  int turn = 0;
  void updatePlayer(){


    if(activePlayer == 'X')
      activePlayer = 'O';

    else
      activePlayer = 'X';
    turn ++;
    String winner = Game.checkWinner();

    if( winner != '')
      result = '$winner is the winner';
    else if(  !gameOver && turn == 9 )
      {result = 'It\'s even '  ;}
     notifyListeners();

  }

  String result = '';
  void reset() {
    result = '';
    turn = 0;
    gameOver = false;
    Player.playerX = [];
    Player.playerO = [];
    activePlayer = 'X';
    notifyListeners();
  }





  void onTap(int index)  {
        if(gameOver == false) {
          if (!Player.playerX.contains(index) &&
              !Player.playerO.contains(index)) {
            Game.playGame(activePlayer, index);
            updatePlayer();


            if (!switchValue && !gameOver && turn != 9 ) {
              Game.autoPlay(activePlayer);
              updatePlayer();
            }
          }

        }
  }





}