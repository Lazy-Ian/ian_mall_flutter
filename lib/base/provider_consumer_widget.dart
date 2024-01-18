import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
///

class ProviderConsumerWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final T viewModel;
  final Widget? child;
  final Function(T)? onReady;

  /// ChangeNotifierProvider 在某种场景下,程序热启动时会失效,但是ChangeNotifierProvider<T>.value会一直保持状态
  final bool? isValue;

  const ProviderConsumerWidget(
      {super.key,
      required this.viewModel,
      this.child,
      this.onReady,
      required this.builder,
      this.isValue});

  @override
  State<ProviderConsumerWidget> createState() =>
      _ProviderConsumerWidgetState<T>();
}

class _ProviderConsumerWidgetState<T extends ChangeNotifier>
    extends State<ProviderConsumerWidget<T>> {
  @override
  void initState() {
    super.initState();
    if (widget.onReady != null) {
      widget.onReady!(widget.viewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isValue == true) {
      return ChangeNotifierProvider<T>.value(
        value: widget.viewModel,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ),
      );
    } else {
      return ChangeNotifierProvider<T>(
        create: (_) => widget.viewModel,
        child: Consumer<T>(
          builder: widget.builder,
          child: widget.child,
        ),
      );
    }
  }
}
