

import 'package:football_app/ui/main/settings/notifications.dart';

import '../../ui/main/settings/introduction.dart';
import '../../ui/main/settings/share_page.dart';
import '../../ui/other_pages/profile_edit.dart';

List<Map<String, dynamic>> buttomData3 = [

  {
    'image': 'assets/images/warning.png',
    'text': 'Tanishtiruv',
    'navigation': const Introduction(),
    'text2': ''

  },
  {
    'image': 'assets/images/person.png',
    'text': 'Profilni o’zgartirish',
    'navigation': ProfileScreen(),
    'text2': ''
  },
  {
    'image': 'assets/images/ring.png',
    'text': 'Bildirishnomalar',
    'navigation': Notifications(),
    'text2': ''

  },
  {
    'image': 'assets/images/share.png',
    'text': 'Ilovani ulashish',
    'navigation': SharePage(),
    'text2': ''

  },
  {
    'image': 'assets/images/share.png',
    'text': 'Do\'stlarni taklif qiling',
    'navigation': const SharePage(),
    'text2': ''

  },
];
