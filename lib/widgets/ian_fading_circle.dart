import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/src/tweens/delay_tween.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :

class SpinKitFadingCircle extends StatefulWidget {
  final Color? color;
  final double size;
  final IndexedWidgetBuilder? itemBuilder;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<SpinKitFadingCircle> createState() => _SpinKitFadingCircleState();

  const SpinKitFadingCircle(
      {super.key,
      this.color,
      this.size = 48,
      this.itemBuilder,
      this.duration = const Duration(milliseconds: 1000),
      this.controller})
      : assert(
            !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
                !(itemBuilder == null && color == null),
            'You should specify either a itemBuilder or a color');
}

class _SpinKitFadingCircleState extends State<SpinKitFadingCircle> with SingleTickerProviderStateMixin{
  static const _itemCount = 12;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();

  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Stack(
          children: List.generate(_itemCount, (i) {
            final position = widget.size * .5;
            return Positioned.fill(
                left: position,
                top: position,
                child: Transform(
                  transform: Matrix4.rotationZ(30.0 * i * 0.0174533),
                  child: Align(
                    alignment: Alignment.center,
                    child: FadeTransition(
                      opacity: DelayTween(
                              begin: 0.0, end: 1.0, delay: 1 / _itemCount)
                          .animate(_controller),
                      child: SizedBox.fromSize(
                        size: Size.square(widget.size * 0.15),
                        child: _itemBuilder(i),
                      ),
                    ),
                  ),
                ));
          }),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(context, index)
      : DecoratedBox(
          decoration:
              BoxDecoration(color: widget.color, shape: BoxShape.circle));

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
