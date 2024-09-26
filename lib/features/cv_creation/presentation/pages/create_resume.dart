// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:resumewithus/features/cv_creation/data/remote_data_source/firebase_data_source.dart';
// import 'package:resumewithus/features/cv_creation/data/repository/templates_repository_impl.dart';
// import 'package:resumewithus/features/cv_creation/domain/usecase/template_usecase.dart';
// import 'package:resumewithus/features/cv_creation/presentation/bloc/templates_bloc.dart';
// import 'package:resumewithus/features/cv_creation/presentation/pages/add_details-page.dart';
// import 'package:resumewithus/features/cv_creation/presentation/widgets/special_appbar.dart';
// import 'package:resumewithus/features/cv_creation/presentation/widgets/template_text.dart';
// import 'package:resumewithus/features/cv_creation/utils/list_of_templates.dart';

// class CreateResumePage extends StatelessWidget {
//   const CreateResumePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     ListOfTemplates templatess = ListOfTemplates();
//     List temp = templatess.resume;
//     final templateRepository = TemplateRepositoryImpl(
//       FirebaseTemplateDataSource(FirebaseStorage.instance),
//     );
//     final fetchTemplates = FetchTemplates(templateRepository);
//     return BlocProvider(
//       create: (context) =>
//           TemplatesBloc(fetchTemplates)..add(FetchTemplatesEvent("Templates")),
//       child: Scaffold(
//         appBar: specialappbar(appbarName: 'Create your resume'),
//         body: BlocBuilder<TemplatesBloc, TemplatesState>(
//           builder: (context, state) {
//             if (state is TemplatesLoading) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (state is TemplatesSuccess) {
//               return GridView.builder(
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10.0,
//                   mainAxisSpacing: 10.0,
//                 ),
//                 itemCount: state.templates.length,
//                 itemBuilder: (context, index) {
//                   final template = state.templates[index];
//                   return InkWell(
//                     onTap: () {
//                       final page = temp[index];
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => AddDetailspage(
//                                   page: page,
//                                 )),
//                       );
//                     },
//                     child: Card(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                             height: 100.0,
//                             width: double.infinity,
//                             child: Image.network(
//                               template.url,
//                               fit: BoxFit.fill,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return const Center(
//                                   child: Text('Image failed to load'),
//                                 );
//                               },
//                             ),
//                           ),
//                           const SizedBox(height: 20.0),
//                           MyTextWidget(text: template.name),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else if (state is TemplatesFailure) {
//               return Center(child: Text('Error: ${state.message}'));
//             }
//             return const Center(child: Text('Something went wrong.'));
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resumewithus/features/cv_creation/data/remote_data_source/firebase_data_source.dart';
import 'package:resumewithus/features/cv_creation/data/repository/templates_repository_impl.dart';
import 'package:resumewithus/features/cv_creation/domain/usecase/template_usecase.dart';
import 'package:resumewithus/features/cv_creation/presentation/bloc/templates_bloc.dart';
import 'package:resumewithus/features/cv_creation/presentation/pages/add_details-page.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/special_appbar.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/template_text.dart';
import 'package:resumewithus/features/cv_creation/utils/list_of_templates.dart';

class CreateResumePage extends StatelessWidget {
  const CreateResumePage({super.key});

  @override
  Widget build(BuildContext context) {
    ListOfTemplates templatess = ListOfTemplates();
    List<TemplateData> templates = templatess.resume;
    final templateRepository = TemplateRepositoryImpl(
      FirebaseTemplateDataSource(FirebaseStorage.instance),
    );
    final fetchTemplates = FetchTemplates(templateRepository);
    return BlocProvider(
      create: (context) =>
          TemplatesBloc(fetchTemplates)..add(FetchTemplatesEvent("Templates")),
      child: Scaffold(
        appBar: specialappbar(appbarName: 'Create your resume'),
        body: BlocBuilder<TemplatesBloc, TemplatesState>(
          builder: (context, state) {
            if (state is TemplatesLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TemplatesSuccess) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: state.templates.length,
                itemBuilder: (context, index) {
                  final template = state.templates[index];
                  return InkWell(
                    onTap: () {
                      final data = templates[index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddDetailspage(
                            data: data,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 100.0,
                            width: double.infinity,
                            child: Image.network(
                              template.url,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: Text('Image failed to load'),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          MyTextWidget(text: template.name),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is TemplatesFailure) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text('Something went wrong.'));
          },
        ),
      ),
    );
  }
}
