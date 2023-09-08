import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view_model/temp_view_model/temp_view_model.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => TempNotifier()),
  ];
}
