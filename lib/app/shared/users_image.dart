import 'package:flutter/material.dart';

Widget currentUserImage([double radius = 20]) => CircleAvatar(
      radius: radius,
      backgroundImage: const AssetImage("assets/default_user.png"),
    );
