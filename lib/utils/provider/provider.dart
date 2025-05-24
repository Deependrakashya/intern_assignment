import 'package:intern_project/viewModel/home/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
  ];
}
