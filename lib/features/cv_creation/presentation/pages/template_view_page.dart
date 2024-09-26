import 'package:flutter/material.dart';
import 'package:resumewithus/features/cv_creation/presentation/widgets/template_text.dart';

class TemplateViewPage extends StatelessWidget {
  final String name;
  final String url;
  const TemplateViewPage({super.key, required this.name, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyTextWidget(text: name),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30.0,
              ),
              Expanded(
                  child: SizedBox(
                child: Image.network(
                  url,
                  fit: BoxFit.scaleDown,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
