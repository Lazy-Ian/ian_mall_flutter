import 'package:flutter/material.dart';
import 'package:ian_mall_flutter/base/selector_plus_data.dart';
import 'package:provider/provider.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class ProviderSelectorWidget<T extends ChangeNotifier, A>
    extends StatefulWidget {
  final Widget Function(BuildContext context, dynamic value, Widget? child)
      builder;
  final T viewModel;
  final Widget? child;
  final Function(T)? onReady;

  /// ChangeNotifierProvider 在某种场景下,程序热启动时会失效,但是ChangeNotifierProvider<T>.value会一直保持状态
  final bool? isValue;

  /// 判断是否需要刷新的字段 特别需要指明的是selector的结果，必须是不可变的对象。 如果同一个对象，只是改变对象属性，那shouldRebuild的两个值永远是相等的。
  final SelectorPlusData Function(BuildContext, T)? plusDataSelector;
  final A Function(BuildContext, T)? selector;

  const ProviderSelectorWidget(
      {super.key,
      required this.viewModel,
      this.child,
      this.onReady,
      required this.builder,
      this.selector,
      this.plusDataSelector,
      this.isValue});

  @override
  State<ProviderSelectorWidget> createState() =>
      _ProviderSelectorWidgetState<T, A>();
}

class _ProviderSelectorWidgetState<T extends ChangeNotifier, A>
    extends State<ProviderSelectorWidget<T, A>> {
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
        child: widget.plusDataSelector != null
            ? Selector<T, SelectorPlusData>(
                builder: widget.builder,
                selector: widget.plusDataSelector!,
                shouldRebuild: (pre, next) => next.shouldRebuild(),
                child: widget.child,
              )
            : Selector<T, A>(
                builder: widget.builder,
                selector: widget.selector!,
                shouldRebuild: (pre, next) => pre != next,
                child: widget.child,
              ),
      );
    } else {
      return ChangeNotifierProvider<T>(
          create: (_) => widget.viewModel,
          child: widget.plusDataSelector != null
              ? Selector<T, SelectorPlusData>(
                  builder: widget.builder,
                  selector: widget.plusDataSelector!,
                  shouldRebuild: (pre, next) => next.shouldRebuild(),
                  child: widget.child,
                )
              : Selector<T, A>(
                  builder: widget.builder,
                  selector: widget.selector!,
                  shouldRebuild: (pre, next) => pre != next,
                  child: widget.child,
                ));
    }
  }
}
