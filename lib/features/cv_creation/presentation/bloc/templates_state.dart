part of 'templates_bloc.dart';

sealed class TemplatesState {
  const TemplatesState();
}

final class TemplatesInitial extends TemplatesState {}

final class TemplatesLoading extends TemplatesState {}

final class TemplatesFailure extends TemplatesState {
  final String message;

  TemplatesFailure(this.message);
}

final class TemplatesSuccess extends TemplatesState {
  final List<Template> templates;

  TemplatesSuccess(this.templates);
}
