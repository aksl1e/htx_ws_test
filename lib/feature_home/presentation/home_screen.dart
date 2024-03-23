import 'dart:convert';
import 'dart:io';
import 'package:floating/floating.dart';
import 'package:flutter/material.dart';
import 'package:htx_ws_test/feature_home/presentation/util/home_textstyles.dart';
import 'package:htx_ws_test/feature_home/presentation/widgets/home_appbar.dart';
import 'package:htx_ws_test/feature_home/presentation/widgets/home_body.dart';
import 'package:htx_ws_test/feature_home/presentation/widgets/pip_view.dart';
import 'package:web_socket_channel/io.dart';
import 'package:home_widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double price = 0;
  late Floating pip;
  bool isPipAvailable = false;
  OverlayEntry? entry;

  final channel = IOWebSocketChannel.connect('wss://api.huobi.pro/ws');


  @override
  void initState() {
    super.initState();

    HomeWidget.setAppGroupId('com.example.htx_ws_test');
    pip = Floating();
    _checkPiPAvailability();

    _subscribe();
    _streamListener();

  }

  _checkPiPAvailability() async {
    isPipAvailable = await pip.isPipAvailable;
  }

  _subscribe() {
    channel.sink.add(jsonEncode(
        {'sub': 'market.tonusdt.trade.detail', 'id': 'id1'}
    ));
  }
  _streamListener() {
    channel.stream.listen((message) {
      debugPrint(utf8.decode(ZLibDecoder().convert(message)));
      Map jsonMessageMap = json.decode(utf8.decode(ZLibDecoder().convert(message)));
      if(jsonMessageMap['ping'] != null) {
        channel.sink.add(jsonEncode(
            {'pong': '${jsonMessageMap['ping']}'}
        ));
      } else {
        setState(() {
          price = jsonMessageMap['tick']['data'][0]['price'];
        });
        updateWidgetPrice(jsonMessageMap['tick']['data'][0]['price']);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PiPSwitcher(
        childWhenEnabled: PipView(price),
        childWhenDisabled: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: const HomeAppBar(),
          body: HomeBody(price),
          floatingActionButton: FloatingActionButton(
            child: const Icon(
                Icons.close_fullscreen
            ),
            onPressed: () {
              if (isPipAvailable) {
                pip.enable(aspectRatio: const Rational.landscape());
              }
            },
          ),
        )
    );
  }

  updateWidgetPrice(double price) {
    HomeWidget.saveWidgetData<String>('price', price.toString());

    HomeWidget.updateWidget(
      androidName: 'PriceWidget',
      qualifiedAndroidName: 'com.example.htx_ws_test.PriceWidget'
    );
  }
}
