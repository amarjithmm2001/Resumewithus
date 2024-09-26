import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/cv_creation/domain/entity/template.dart';
import 'package:resumewithus/features/cv_creation/domain/repository/template_repository.dart';

class FetchTemplates {
  final TemplateRepository repository;

  FetchTemplates(this.repository);

  Future<Either<Failures, List<Template>>> execute(String folderPath) async {
    return await repository.getTemplatesFromFolder(folderPath);
  }
}
