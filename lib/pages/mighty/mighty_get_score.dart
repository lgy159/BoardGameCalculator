import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GetScore extends StatefulWidget {
  final Function(int) callBack;

  const GetScore({required this.callBack, super.key});

  @override
  State<GetScore> createState() => _GetScoreState();
}

class _GetScoreState extends State<GetScore> {
  int getScore = 13;
  late Function(int) callBack;

  @override
  void initState() {
    super.initState();
    callBack = widget.callBack;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('여당이 얻은 점수'),
        const SizedBox(width: 16.0),
        Container(
          width: 50,
          height: 30,
          child: Center(
              child: Text(
                '$getScore',
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ),
        const SizedBox(width: 16.0),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (getScore > 0) {
                getScore -= 1;
                callBack(getScore);
              }
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (getScore < 20) {
                getScore += 1;
                callBack(getScore);
              }
            });
          },
        ),
      ],
    );
  }
}
