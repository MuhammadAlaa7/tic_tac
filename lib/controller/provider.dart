import 'package:flutter/material.dart';
import 'package:tic_tac/module/game.dart';

import '../module/player.dart';

class MyProvider with ChangeNotifier{

  bool switchValue = false;

  void changeSwitch(bool value) {

    switchValue = value;
    notifyListeners();
  }

  String activePlayer = 'X';
  void updatePlayer(){

    if(activePlayer == 'X')
      activePlayer = 'O';

    else
      activePlayer = 'X';

     notifyListeners();

  }

  String result = '******';
  void reset() {
    result = '';
    Player.playerX = [];
    Player.playerO = [];
    activePlayer = 'X';
    notifyListeners();
  }

  bool gameOver = false;


  void onTap(int index)  {

    if (!Player.playerX.contains(index) && !Player.playerO.contains(index)) {
      Game.playGame(activePlayer, index);
      updatePlayer();


    if(!switchValue) {
       Game.autoPlay(activePlayer);
      updatePlayer();

    }
    }
  }




}