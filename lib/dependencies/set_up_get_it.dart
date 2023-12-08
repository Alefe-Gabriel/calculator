import 'package:calculator/controllers/main_controller.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setUpGetIt() {
  getIt.registerSingleton<MainController>(MainControllerImpl());
}
