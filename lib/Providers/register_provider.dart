import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qit_flutter/Services/register_services.dart';


final registerProvider =
StateNotifierProvider<RegisterServices, bool>((ref) => RegisterServices());
