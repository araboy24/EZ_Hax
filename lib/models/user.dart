class User {
  final String uid;
  User({this.uid});

  String getUid(){
    return uid;
  }

}

class UserData {
  final String uid;
  final Map hack;
  final Map crack;
  final Map debug;
  UserData({this.uid, this.hack, this.crack, this.debug});
}

