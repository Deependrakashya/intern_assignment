import 'package:intern_project/viewModel/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  // list of all providers so that can be use for resister on app starts
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ];
}
