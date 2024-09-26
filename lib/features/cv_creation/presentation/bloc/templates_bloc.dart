import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumewithus/features/cv_creation/domain/entity/template.dart';
import 'package:resumewithus/features/cv_creation/domain/usecase/template_usecase.dart';
part 'templates_event.dart';
part 'templates_state.dart';

class TemplatesBloc extends Bloc<TemplatesEvent, TemplatesState> {
  final FetchTemplates _fetchTemplates;

  TemplatesBloc(this._fetchTemplates) : super(TemplatesInitial()) {
    on<FetchTemplatesEvent>(_onFetchTemplates);
  }

  Future<void> _onFetchTemplates(
    FetchTemplatesEvent event,
    Emitter<TemplatesState> emit,
  ) async {
    emit(TemplatesLoading());

    final result = await _fetchTemplates.execute(event.folderPath);

    result.fold(
      (failure) => emit(TemplatesFailure(failure.message)),
      (templates) => emit(TemplatesSuccess(templates)),
    );
  }
}
