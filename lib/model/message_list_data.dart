class MessageListData {
  const MessageListData({
    required this.senderName,
    required this.message,
    required this.messageDate,
    required this.dataMessage,
    required this.profilePicture,
  });

  final String senderName;
  final String message;
  final DateTime messageDate;
  final String dataMessage;
  final String profilePicture;
}
