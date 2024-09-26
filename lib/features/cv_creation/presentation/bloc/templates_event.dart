part of 'templates_bloc.dart';

@immutable
sealed class TemplatesEvent {}

final class FetchTemplatesEvent extends TemplatesEvent {
  final String folderPath;

  FetchTemplatesEvent(this.folderPath);
}
