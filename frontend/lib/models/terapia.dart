class User {
  final int id;
  final String email;
  final String nickname;

  User({required this.id, required this.email, required this.nickname});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      nickname: json['nickname'],
    );
  }
}

class Conversation {
  final int id;
  final String userId;
  final List<Message> messages;

  Conversation(
      {required this.id, required this.userId, required this.messages});

  factory Conversation.fromJson(Map<String, dynamic> json) {
    var messageList = json['messages'] as List;
    List<Message> messages =
        messageList.map((message) => Message.fromJson(message)).toList();

    return Conversation(
      id: json['id'],
      userId: json['userId'],
      messages: messages,
    );
  }
}

class Message {
  final int id;
  final String text;
  final DateTime timestamp;

  Message({required this.id, required this.text, required this.timestamp});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      text: json['text'],
      timestamp: json['timestamp'],
    );
  }
}

class Advice {
  final String text;

  Advice({required this.text});

  factory Advice.fromJson(Map<String, dynamic> json) {
    return Advice(
      text: json['text'],
    );
  }
}
