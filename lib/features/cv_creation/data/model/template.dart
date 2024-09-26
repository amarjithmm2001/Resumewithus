import 'package:resumewithus/features/cv_creation/domain/entity/template.dart';

class TemplateModel {
  final String name;
  final String url;

  TemplateModel({
    required this.name,
    required this.url,
  });

  factory TemplateModel.fromEntity(Template template) {
    return TemplateModel(
      name: template.name,
      url: template.url,
    );
  }


  Template toEntity() {
    return Template(
      name: name,
      url: url,
    );
  }
}
