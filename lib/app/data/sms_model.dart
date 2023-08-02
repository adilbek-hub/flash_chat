import 'dart:convert';

class Message {
  Message({
    required this.sender,
    required this.sms,
    required this.dateTime,
    this.isMy,
  });
  final String sender;
  final String sms;
  final DateTime dateTime;
  bool? isMy;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'sender': sender});
    result.addAll({'sms': sms});
    result.addAll({'dateTime': dateTime.millisecondsSinceEpoch});
    if (isMy != null) {
      result.addAll({'isMy': isMy});
    }

    return result;
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      sender: map['sender'] ?? '',
      sms: map['sms'] ?? '',
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime']),
      isMy: map['isMy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source));
}
