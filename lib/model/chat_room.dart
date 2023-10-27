class ChatRoomModel {
  String? lastMessage;
  List<dynamic>? users;
  DateTime? creatDon;
  ChatRoomModel({this.lastMessage, this.users, this.creatDon});

  ChatRoomModel.fromMap(Map<String, dynamic> map) {
    lastMessage = map['lastMessage'];
    users = map['users'];
    creatDon = map['creatDon'].toDate();
  }

  Map<String, dynamic> roomtoMap() {
    return {'lastMessage': lastMessage, 'users': users, 'creatDon': creatDon};
  }
}
