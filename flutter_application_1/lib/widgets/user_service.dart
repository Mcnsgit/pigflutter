import 'package:flutter/material.dart';


class User {
  final String name;
  final String imageUrl;
  final double distance;
  final int age;

  User(
      {required this.name,
      required this.imageUrl,
      required this.distance,
      required this.age});
}

class Filters {
  double age;
  double weight;
  double height;
  String tribe;
  String bodyType;
  String position;
  String lookingFor;
  String relationshipStatus;
  String meetAt;
  bool acceptsNSFW;
  bool onlineNow;
  bool photosOnly;

  Filters({
    required this.age,
    required this.weight,
    required this.height,
    required this.tribe,
    required this.bodyType,
    required this.position,
    required this.lookingFor,
    required this.relationshipStatus,
    required this.meetAt,
    required this.acceptsNSFW,
    required this.onlineNow,
    required this.photosOnly,
  });
}

class UserService extends ChangeNotifier {
  final List<Filters> users;

  UserService(this.users);

  List<Filters> filterByPosition(String? position) {
    if (position == null || position.isEmpty) {
      return users;
    }
    return users.where((user) => user.position == position).toList();
  }

  List<Filters> filterByLookingFor(String? lookingFor) {
    if (lookingFor == null || lookingFor.isEmpty) {
      return users;
    }
    return users.where((user) => user.lookingFor == lookingFor).toList();
  }

  List<Filters> filterByAgeRange(ageRange) {
    if (ageRange == null) {
      return users;
    }
    return users
        .where((user) => user.age >= ageRange.start && user.age <= ageRange.end)
        .toList();
  }

  List<Filters> filterByOnlineStatus(bool isOnline) {
    return users.where((user) => user.onlineNow == isOnline).toList();
  }

  List<Filters> applyFilters({
    String? position,
    String? lookingFor,
    RangeValues? ageRange,
    bool? isOnline,
  }) {
    List<Filters> filteredUsers = users;
    if (position != null && position.isNotEmpty) {
      filteredUsers = filterByPosition(position);
    }
    if (lookingFor != null && lookingFor.isNotEmpty) {
      filteredUsers = filterByLookingFor(lookingFor);
    }
    if (ageRange != null) {
      filteredUsers = filterByAgeRange(ageRange);
    }
    if (isOnline != null) {
      filteredUsers = filterByOnlineStatus(isOnline);
    }
    return filteredUsers;
  }

  void listUser() {
    // Implementation of listUser method
  }

  void fetchOnlineUsers() {
    // Implementation of fetchOnlineUsers method
  }
}
// The above code is a Flutter implementation of a user filtering system.  

// The  Filters  class represents the filters that can be applied to the users. It has properties such as age, weight, height, tribe, body type, position, looking for, relationship status, meet at, accepts NSFW, online now, and photos only. These properties are required for creating an instance of the  Filters  class. 

// The  UserService  class is responsible for managing the list of users and applying filters to it. It has a constructor that takes a list of  Filters  objects. The class also extends  ChangeNotifier , which allows it to notify listeners when the list of users is updated. 

// The  filterByPosition ,  filterByLookingFor ,  filterByAgeRange , and  filterByOnlineStatus  methods are helper methods that filter the list of users based on the given criteria. These methods return a new list of filtered users. 

// The  applyFilters  method is the main method that applies all the specified filters to the list of users. It takes optional parameters for position, looking for, age range, and online status. It applies the filters one by one and returns the final filtered list of users. 