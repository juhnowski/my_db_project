import 'dart:async';

import 'package:aqueduct/aqueduct.dart';
import 'package:my_project/model/user.dart';
//import 'package:users/users.dart';
    
class UsersController extends ResourceController {
  UsersController(this.context);
  final ManagedContext context;

  @Operation.get()
  Future<Response> getAllUsers({@Bind.query('name') String name}) async {
    final userQuery = Query<User>(context);
    if (name != null) {
      userQuery.where((u) => u.name).contains(name, caseSensitive: false);
    }
    final users = await userQuery.fetch();
    return Response.ok(users);
  }

  @Operation.get('id')
  Future<Response> getUserById(@Bind.path('id') int id) async {
    final userQuery = Query<User>(context)
      .. where((h) => h.id).equalTo(id);

    final user = await userQuery.fetchOne();

    if (user == null) {
      return Response.notFound();
    }

    return Response.ok(user);
  }

  @Operation.post()
  Future<Response> createUser() async {
    final Map<String, dynamic> body = await request.body.decode();
    final query = Query<User>(context)
      ..values.name = body['name'] as String;

    final insertedUser = await query.insert();

    return Response.ok(insertedUser);
  }
  
  
} 