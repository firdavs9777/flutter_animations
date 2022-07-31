import 'package:flutter/material.dart';
class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerWidget> createState() => _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double _height = 100.0;
  double _width = 100.0;
  _increaseWidth(){
    setState((){
       _width = _width >= 300.0 ? 100.0 : _width += 50;
       _height = _height >= 320.0 ? 100.0 : _height += 50;
       // If the width is equal or higher than 320 => The width should be equak to 100.0 otherwise add 50
    });
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Center(
          child: AnimatedContainer(duration: Duration(milliseconds: 500),
          curve: Curves.elasticInOut,
            color: Colors.amber,
            height: _height,
            width: _width,
            child: FlatButton(
              child: Text('Press to change the width '),
              onPressed: (){
                _increaseWidth();
              },
            ),
          ),
        )
      ],
    );
  }
}
