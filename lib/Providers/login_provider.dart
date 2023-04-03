import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qit_flutter/Services/login_services.dart';

import '../Services/home_services.dart';

final loginProvider =
    StateNotifierProvider<LoginServices, bool>((ref) => LoginServices());
