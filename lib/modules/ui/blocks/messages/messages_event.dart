part of 'messages_bloc.dart';

abstract class MessagesEvent {}

class SendMessage extends MessagesEvent {
  final String getterUid;
  final String message;
  final String getterName;

  SendMessage({
    required this.getterUid,
    required this.message,
    required this.getterName,
  });

  List<Object?> get props => [
        getterUid,
      ];
}

class SendImage extends MessagesEvent {
  final bool isCamera;

  SendImage({required this.isCamera});
}
