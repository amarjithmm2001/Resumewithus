import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/cv_creation/data/remote_data_source/firebase_data_source.dart';
import 'package:resumewithus/features/cv_creation/domain/entity/template.dart';
import 'package:resumewithus/features/cv_creation/domain/repository/template_repository.dart';

class TemplateRepositoryImpl implements TemplateRepository {
  final FirebaseTemplateDataSource _dataSource;

  TemplateRepositoryImpl(this._dataSource);

  @override
  Future<Either<Failures, List<Template>>> getTemplatesFromFolder(
      String folderPath) async {
    final result = await _dataSource.getTemplatesFromFolder(folderPath);

    return result.fold(
      (failure) => Left(failure), // Forward the failure
      (templateModels) {
        final templates =
            templateModels.map((model) => model.toEntity()).toList();
        return Right(
            templates); // Return the list of Template entities on success
      },
    );
  }
}
