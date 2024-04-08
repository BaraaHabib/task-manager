import 'package:task_master/app/environment/production_environment.dart';
import 'package:task_master/app/view/app.dart';
import 'package:task_master/bootstrap.dart';

Future<void> main() async {
  await bootstrap(builder: App.new, environment: ProductionEnvironment());
}
