import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:htx_ws_test/feature_home/presentation/home_screen.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


void main() {

  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}