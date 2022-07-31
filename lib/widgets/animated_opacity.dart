import 'package:flutter/material.dart';
class AnimatedOpacityContainer extends StatefulWidget {
  const AnimatedOpacityContainer({Key? key}) : super(key: key);

  @override
  State<AnimatedOpacityContainer> createState() => _AnimatedOpacityContainerState();
}

class _AnimatedOpacityContainerState extends State<AnimatedOpacityContainer> {
  double _opacity = 1.0;

  void changeOpacity()
  {
    setState(()
    {
      _opacity = _opacity == 1.0 ? 0.7: 1.0;

    });
  }
  @override
  Widget build(BuildContext context) {
     return Row(
       children: <Widget>[
         AnimatedOpacity(opacity: _opacity, duration: Duration(seconds: 3), child: Container(
           height: 100.0,
           width: 100.0,
           color: Colors.blue,
           child: FlatButton(
             child: Text('Tap to Fade the Opacity'),
             onPressed: (){
               changeOpacity();
             },
           ),
         ),
         )
       ],
     );
  }
}
