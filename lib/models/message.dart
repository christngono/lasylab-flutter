class MessageField {
  static final String createdAt = 'createdAt';
}

class Message {
  final int idUser;
  final int senderType;
  final String name;
  final String message;
  final DateTime createdAt;

  const Message({
    required this.idUser,
    required this.senderType,
    required this.message,
    required this.createdAt,
    required this.name,
  });
}
