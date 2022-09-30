import 'dart:math';

import 'player.dart';

class Game {

 static void playGame(String activePlayer , int index ) {


     if (activePlayer == 'X')
       Player.playerX.add(index); // to give each player their values
     else
       Player.playerO.add(index);

 }

 static void autoPlay(String activePlayer  )  {

  List<int> emptyChances = [];
  for( int i= 0 ; i< 8 ; i++)
    {
     if ( ! (Player.playerX.contains(i) || Player.playerO.contains(i))  )
      emptyChances.add(i);
    }
    Random random = Random();
       int  randomIndex = random.nextInt(emptyChances.length);   // e.g. >> 3
     int index = emptyChances[randomIndex];

      print(emptyChances[randomIndex]);
      playGame(activePlayer, index);





  }

}