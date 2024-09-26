import 'package:fpdart/fpdart.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/cv_creation/domain/entity/template.dart';

abstract class TemplateRepository {
  Future<Either<Failures, List<Template>>> getTemplatesFromFolder(
      String folderPath);
}
