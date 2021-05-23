import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class PizzaBasic extends StatefulWidget {
  @override
  _PizzaBasicState createState() => _PizzaBasicState();
}

class _PizzaBasicState extends State<PizzaBasic> {
  void _togglePlay() {
    setState(() {
      _riveArtboard!
          .addController(_controller = SimpleAnimation('Animation 1'));
    });
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  RiveAnimationController? _controller;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/pizza_min.riv').then((data) async {
      final file = RiveFile.import(data);
      final artBoard = file.mainArtboard;

      setState(() => _riveArtboard = artBoard);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Pizza Basic"),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 300,
                    width: 300,
                    child: _riveArtboard == null
                        ? const SizedBox()
                        : Rive(artboard: _riveArtboard!),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: GestureDetector(
                    onTap: _togglePlay,
                    child: Image.asset(
                      'assets/capsicum.png',
                    ),
                  ),
                ),
//                FlatButton.icon(
//                  onPressed: _togglePlay,
//                  icon: Image.asset('assets/capsicum.png'),
//                  label: Text("Play"),
//                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
