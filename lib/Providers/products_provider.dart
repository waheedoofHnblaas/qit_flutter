import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Services/home_services.dart';



final productsDataProvider = FutureProvider(
  (ref) => ref.watch(productsProvider).getProducts(),
);

