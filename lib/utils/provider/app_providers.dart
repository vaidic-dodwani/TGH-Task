import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../view_model/language_view_model/languages_view_model.dart';

class AppProvider {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => LanguagesNotifier()),
  ];
}
