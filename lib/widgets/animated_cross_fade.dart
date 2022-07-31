import 'package:flutter/material.dart';
class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeWidget> createState() => _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _crossFadeStateShowFirst = false;
 _crossFade(){
    setState(()
        {
          if(_crossFadeStateShowFirst  == false)
            {
              _crossFadeStateShowFirst = true;
            }
          else
            {
              _crossFadeStateShowFirst = false;
            }

        }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            AnimatedCrossFade(
                duration: Duration(seconds:3),
                sizeCurve: Curves.bounceOut,
                crossFadeState: _crossFadeStateShowFirst ?  CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: Container(
                  color: Colors.amber,
                  height: 200.0,
                  width: 200.0,
                ),
                secondChild: Container(
                  color: Colors.red,
                  height: 400.0,
                  width: 400.0,
                ),
               ),
            FlatButton(
              child: Text('Tap to Fade Color & Size'),
              onPressed: (){
                _crossFade();
                print(_crossFadeStateShowFirst);
              },
            ),
          ],
        )
      ],
    );
  }
}
