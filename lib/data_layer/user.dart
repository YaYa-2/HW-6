import 'package:h6/data/user_data.dart';
import 'package:h6/model/user.data.dart';
import 'package:get_it/get_it.dart';
class UserDataService {
  List<User> users = [];

  get name => null;

  get email => null;

  getUsers() {
    for (var element in userData) {
      users.add(User.fromJson(element));
    }
  }
}

setUp() {
 
  GetIt.instance;
  GetIt.I.registerSingleton<UserDataService>(UserDataService());
}