import 'package:get_it/get_it.dart';
import 'package:intern_project/repo/firestore_services.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<FirestoreServices>(() => FirestoreServices());
}
