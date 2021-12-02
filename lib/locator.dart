import 'package:endsars/services/FirestoreService.dart';
import 'package:endsars/services/push_Notification.dart';
import 'package:get_it/get_it.dart';
import 'package:endsars/services/navigation_service.dart';
import 'package:endsars/utils/customFunction.dart';


//Instead of creating instance of an Object, Multiple times
//Dependency inject solvpe it by creating this code.

GetIt locator = GetIt.instance;

//Register class for Dep. Injection.
void setupLocator() {
locator.registerLazySingleton(() => CustomFunction());
locator.registerLazySingleton(() => NavigationService());
locator.registerLazySingleton(() => PushNotification());
locator.registerLazySingleton(() => FirestoreService());
}
