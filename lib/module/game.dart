import 'dart:math';

import 'package:provider/provider.dart';
import 'package:tic_tac/controller/provider.dart';

import 'player.dart';



extension ContainsAll on List {
  bool containsAll( int x , int y , [ z ] ) {

    if( z == null )
      {
        return this.contains(x) && this.contains(y);
      }
    else
      {
         return this.contains(x) && this.contains(y) && this.contains(z) ;   // return bool value

      }


  // this here means what will use this function >> the class the will use it

  }

}

class Game {

 static void playGame(String activePlayer , int index ) {


     if (activePlayer == 'X')
       Player.playerX.add(index); // to give each player their values
     else
       Player.playerO.add(index);

 }
//TODO: MAKE THE AUTO PLAY SMART
 static void autoPlay(String activePlayer  )  {
int index = 0;
  List<int> emptyChances = [];
  for( int i= 0 ; i< 8 ; i++)
    {
     if ( ! (Player.playerX.contains(i) || Player.playerO.contains(i))  )
      emptyChances.add(i);
    }
  // first it will attack to win
  if( Player.playerO.containsAll(0, 1) && emptyChances.contains(2) ) index = 2;
else if( Player.playerO.containsAll(0, 2) && emptyChances.contains(1) ) index = 1;
else if( Player.playerO.containsAll(1, 2) && emptyChances.contains(0) ) index = 0;
else if( Player.playerO.containsAll(3, 4) && emptyChances.contains(5) ) index = 5;
else if( Player.playerO.containsAll(3, 5) && emptyChances.contains(4) ) index = 4;
else if( Player.playerO.containsAll(4, 5) && emptyChances.contains(3) ) index = 3;
else if( Player.playerO.containsAll(6, 7) && emptyChances.contains(8) ) index = 8;
else if( Player.playerO.containsAll(6, 8) && emptyChances.contains(7) ) index = 7;
else if( Player.playerO.containsAll(7, 8) && emptyChances.contains(6) ) index = 6;
else if( Player.playerO.containsAll(0, 3) && emptyChances.contains(6) ) index = 6;
else if( Player.playerO.containsAll(0, 6) && emptyChances.contains(3) ) index = 3;
else if( Player.playerO.containsAll(3, 6) && emptyChances.contains(0) ) index = 0;
else if( Player.playerO.containsAll(1, 4) && emptyChances.contains(7) ) index = 7;
else if( Player.playerO.containsAll(1, 7) && emptyChances.contains(4) ) index = 5;
else if( Player.playerO.containsAll(4, 7) && emptyChances.contains(1) ) index = 1;
else if( Player.playerO.containsAll(2, 5) && emptyChances.contains(8) ) index = 8;
else if( Player.playerO.containsAll(2, 8) && emptyChances.contains(5) ) index = 5;
else if( Player.playerO.containsAll(5, 8) && emptyChances.contains(2) ) index = 2;
else if( Player.playerO.containsAll(0, 4) && emptyChances.contains(8) ) index = 8;
else if( Player.playerO.containsAll(0, 8) && emptyChances.contains(4) ) index = 4;
else if( Player.playerO.containsAll(4, 8) && emptyChances.contains(0) ) index = 0;
else if( Player.playerO.containsAll(2, 4) && emptyChances.contains(6) ) index = 6;
else if( Player.playerO.containsAll(2, 6) && emptyChances.contains(4) ) index = 4;
else if( Player.playerO.containsAll(4, 6) && emptyChances.contains(2) ) index = 2;


else  if( Player.playerX.containsAll(0, 1) && emptyChances.contains(2) ) index = 2;
else if( Player.playerX.containsAll(0, 2) && emptyChances.contains(1) ) index = 1;
else if( Player.playerX.containsAll(1, 2) && emptyChances.contains(0) ) index = 0;
else if( Player.playerX.containsAll(3, 4) && emptyChances.contains(5) ) index = 5;
else if( Player.playerX.containsAll(3, 5) && emptyChances.contains(4) ) index = 4;
else if( Player.playerX.containsAll(4, 5) && emptyChances.contains(3) ) index = 3;
else if( Player.playerX.containsAll(6, 7) && emptyChances.contains(8) ) index = 8;
else if( Player.playerX.containsAll(6, 8) && emptyChances.contains(7) ) index = 7;
else if( Player.playerX.containsAll(7, 8) && emptyChances.contains(6) ) index = 6;
else if( Player.playerX.containsAll(0, 3) && emptyChances.contains(6) ) index = 6;
else if( Player.playerX.containsAll(0, 6) && emptyChances.contains(3) ) index = 3;
else if( Player.playerX.containsAll(3, 6) && emptyChances.contains(0) ) index = 0;
else if( Player.playerX.containsAll(1, 4) && emptyChances.contains(7) ) index = 7;
else if( Player.playerX.containsAll(1, 7) && emptyChances.contains(4) ) index = 4;
else if( Player.playerX.containsAll(4, 7) && emptyChances.contains(1) ) index = 1;
else if( Player.playerX.containsAll(2, 5) && emptyChances.contains(8) ) index = 8;
else if( Player.playerX.containsAll(2, 8) && emptyChances.contains(5) ) index = 5;
else if( Player.playerX.containsAll(5, 8) && emptyChances.contains(2) ) index = 2;
else if( Player.playerX.containsAll(0, 4) && emptyChances.contains(8) ) index = 8;
else if( Player.playerX.containsAll(0, 8) && emptyChances.contains(4) ) index = 4;
else if( Player.playerX.containsAll(4, 8) && emptyChances.contains(0) ) index = 0;
else if( Player.playerX.containsAll(2, 4) && emptyChances.contains(6) ) index = 6;
else if( Player.playerX.containsAll(2, 6) && emptyChances.contains(4) ) index = 4;
else if( Player.playerX.containsAll(4, 6) && emptyChances.contains(2) ) index = 2;


else
  {
    Random random = Random();
    int  randomIndex = random.nextInt(emptyChances.length);   // e.g. >> 3
    index = emptyChances[randomIndex];  // this index is the place that will be played

  }



      playGame(activePlayer, index);





  }


  static String checkWinner(){
   String winner = '';

//TODO:    IF CONDITIONS FOR THAT WINNER
 if(
 Player.playerX.containsAll(0, 1, 2) ||
 Player.playerX.containsAll(3, 4, 5) ||
 Player.playerX.containsAll(6, 7, 8) ||
 Player.playerX.containsAll(0, 3, 6) ||
 Player.playerX.containsAll(1, 4, 7) ||
 Player.playerX.containsAll(2, 5, 8) ||
 Player.playerX.containsAll(0, 4, 8) ||
 Player.playerX.containsAll(2, 4, 6) )
 {
   winner = 'X';
   MyProvider.gameOver = true;
 }
else if (

     Player.playerO.containsAll(0, 1, 2) ||
     Player.playerO.containsAll(3, 4, 5) ||
     Player.playerO.containsAll(6, 7, 8) ||
     Player.playerO.containsAll(0, 3, 6) ||
     Player.playerO.containsAll(1, 4, 7) ||
     Player.playerO.containsAll(2, 5, 8) ||
     Player.playerO.containsAll(0, 4, 8) ||
     Player.playerO.containsAll(2, 4, 6) )
{
   winner = 'O';
 MyProvider.gameOver = true;
 }

else
  winner = '';

   return winner ;
  }

}






