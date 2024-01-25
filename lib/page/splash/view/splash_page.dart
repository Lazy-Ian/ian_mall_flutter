import 'package:flutter/material.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/page/splash/view_model/splash_view_model.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SplashViewModel splashViewModel = SplashViewModel();

  @override
  Widget build(BuildContext context) {
    return ProviderConsumerWidget<SplashViewModel>(
        viewModel: splashViewModel,
        onReady: (viewModel) {
          splashViewModel.getAdList();
        },
        isValue: true,
        builder:
            (BuildContext context, SplashViewModel viewModel, Widget? child) {
          return MultiStateWidget(
            netState: viewModel.splashState.netState,
            placeHolderType: PlaceHolderType.noPlaceHolder,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color(0xff333333),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bg_splash.png'),
                    fit: BoxFit.fill, // 完全填充
                  ),
                ),
                child: Stack(children: <Widget>[
                  Column(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          alignment: Alignment.topCenter,
                          margin: const EdgeInsets.all(120),
                          child: Image(
                              // width: DeviceUtil.width(context) * 93 / 1125,
                              // height: DeviceUtil.width(context) * 678 / 93,
                              width: DeviceUtil.width(context) * 73 / 1125,
                              height: DeviceUtil.width(context) * 660 / 93,
                              image: const AssetImage(
                                  'assets/images/bg_splash_slogan.png')),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        top: 0,
                        child: Image(
                            // width: DeviceUtil.width(context) * 82 / 245,
                            // height: DeviceUtil.width(context) * 27 / 41,
                            width: DeviceUtil.width(context) * 72 / 245,
                            height: DeviceUtil.width(context) * 20 / 41,
                            image: const AssetImage(
                                'assets/images/bg_splash_bottom.png')),
                      ),
                    ],
                  ),
                ]),
              );
            },
          );
        });
  }
}
