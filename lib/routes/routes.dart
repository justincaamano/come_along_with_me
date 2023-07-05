import 'package:come_along_with_me/pages/Dashboard.dart';
import 'package:come_along_with_me/pages/create_new_group_page.dart';
import 'package:come_along_with_me/pages/login_page.dart';
import 'package:come_along_with_me/pages/register_page.dart';
import 'package:come_along_with_me/pages/single_chat_page.dart';
import 'package:flutter/material.dart';

import '../pages/group_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  "login": (_) => LoginPage(
        uid: '',
      ),
  "register": (_) => registerpage(),
  "dashboard": (_) => DashboardPage(uid: ''),
  "CreateGroup": (_) => CreateGroupPage(),
  "SingleChat": (_) => SingleChat(),
  "grouppage": (_) => GroupPage(),
};
