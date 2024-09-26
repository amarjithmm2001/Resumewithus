import 'package:fpdart/fpdart.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:resumewithus/core/error/failures.dart';
import 'package:resumewithus/features/cv_creation/data/model/template.dart';

class FirebaseTemplateDataSource {
  final FirebaseStorage _firebaseStorage;

  FirebaseTemplateDataSource(this._firebaseStorage);

  Future<Either<Failures, List<TemplateModel>>> getTemplatesFromFolder(
      String folderPath) async {
    try {
      List<TemplateModel> templateModels = [];
      final ListResult result =
          await _firebaseStorage.ref(folderPath).listAll();

      for (final Reference ref in result.items) {
        final String url = await ref.getDownloadURL();
        final String name = ref.name;
        templateModels.add(TemplateModel(name: name, url: url));
      }
      return Right(templateModels);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
