import 'package:flutter/material.dart';
class AnimatedBalloon extends StatefulWidget {
  const AnimatedBalloon({Key? key}) : super(key: key);

  @override
  State<AnimatedBalloon> createState() => _AnimatedBalloonState();
}

class _AnimatedBalloonState extends State<AnimatedBalloon> with TickerProviderStateMixin{
  AnimationController? _controller;
  Animation<double>? _animationFloatUp;
  Animation<double>? _animationGrowSize;
    double? _balloonHeight;
    double? _balloonWidth;
    double? _balloonBottomLocation;

  @override
   void initState(){
    super.initState();
    _controller = AnimationController(duration: Duration(seconds: 10), vsync: this);
  }

    @override
    void didChangeDependencies() {
      super.didChangeDependencies();

      _balloonHeight = MediaQuery.of(context).size.height / 2;
      _balloonWidth = MediaQuery.of(context).size.height / 3;
      _balloonBottomLocation = MediaQuery.of(context).size.height - _balloonHeight!;

      _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Interval(0.0, 0.9, curve: Curves.fastOutSlowIn),
        ),
      );

      _animationGrowSize = Tween(begin: 40.0, end: _balloonWidth).animate(
        CurvedAnimation(
          parent: _controller!,
          curve: Interval(0.0, 0.85, curve: Curves.elasticInOut),
        ),
      );

      if (_controller!.isCompleted) {
        _controller!.reverse();
      } else {
        _controller!.forward();
      }
    }

  @override
  void dispose()
  {
    _controller!.dispose();
    super.dispose();
  }
  Widget build(BuildContext context)
  {
    return AnimatedBuilder(
        animation: _animationFloatUp!,
        builder: (context, child) {
      return Container(
        child: child,
        margin: EdgeInsets.only(
          top: _animationFloatUp!.value,
          left: _animationGrowSize!.value * 0.25,
        ),
        width: _animationGrowSize!.value,
      );
    },
      child: GestureDetector(
        child: Image.asset('assets/images/baloon.jpeg',height: _balloonHeight,width: _balloonWidth),
        onTap: ()
        {
          if (_controller!.isCompleted) {
            _controller!.reverse();
          } else {
            _controller!.forward();
          }
        },
      ),
    );
  }
}
