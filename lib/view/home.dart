import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tic_tac/controller/provider.dart';

import '../module/player.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<MyProvider>(context);
    return Scaffold(
      body: SafeArea(
        child:
        OrientationBuilder(
          builder: (_ , o) {
            if ( o == Orientation.portrait)
              {
                return Column(

                  children: [


                    SwitchListTile.adaptive(
                      title: const Text(
                        'Turn on/off two players mode',
                        style: TextStyle(
                          fontSize: 33,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      value: state.switchValue,
                      onChanged: (newVal) => state.changeSwitch(newVal),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'It\'s ${state.activePlayer} turn ! ',

                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Expanded(
                      child: GridView.builder(
                        itemCount: 9,
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 140,
                          childAspectRatio: 1,
                          mainAxisExtent: 120,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (ctx, index) =>   InkWell(

                          onTap: () => MyProvider.gameOver ? null : state.onTap(index),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromRGBO(0, 256, 140, 1),
                            ),
                            child: Center(
                              child: Text(
                                Player.playerX.contains(index)
                                    ? 'X'
                                    : Player.playerO.contains(index)
                                    ? 'O'
                                    : '',
                                style: TextStyle(
                                    fontSize: 70,
                                    color: Player.playerX.contains(index)
                                        ? Colors.blueAccent
                                        : Colors.pink),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      state.result,
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          state.reset();
                        },
                        icon: const Icon(
                          Icons.replay,
                          size: 40,
                        ),
                        label: const Text(
                          'Repeat the game ',
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          ),
                        ),
                      ),
                    ),
                  ],
                ) ;
              }
            else
              {
                return  Row(
                  children: [
                    SwitchListTile.adaptive(
                      title: const Text(
                        'Turn on/off two players mode',
                        style: TextStyle(
                          fontSize: 33,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      value: state.switchValue,
                      onChanged: (newVal) => state.changeSwitch(newVal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'It\'s ${state.activePlayer} turn ! ',

                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      state.result,
                      style: const TextStyle(
                        fontSize: 50,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
                      child: ElevatedButton.icon(
                        onPressed: () {
                          state.reset();
                        },
                        icon: const Icon(
                          Icons.replay,
                          size: 40,
                        ),
                        label: const Text(
                          'Repeat the game ',
                          style: TextStyle(fontSize: 30),
                        ),
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true ,
                        itemCount: 9,
                        padding: const EdgeInsets.all(16),
                        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 140,
                          childAspectRatio: 1,
                          mainAxisExtent: 120,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                        itemBuilder: (ctx, index) =>   InkWell(

                          onTap: () => MyProvider.gameOver ? null : state.onTap(index),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: const Color.fromRGBO(0, 256, 140, 1),
                            ),
                            child: Center(
                              child: Text(
                                Player.playerX.contains(index)
                                    ? 'X'
                                    : Player.playerO.contains(index)
                                    ? 'O'
                                    : '',
                                style: TextStyle(
                                    fontSize: 70,
                                    color: Player.playerX.contains(index)
                                        ? Colors.blueAccent
                                        : Colors.pink),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),


                    /// expanded >> gird view
                  ],
                );
              }

          },
        ),

      ),
    );
  }
}
