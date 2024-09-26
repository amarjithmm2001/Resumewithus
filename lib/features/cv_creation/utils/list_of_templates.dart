import 'package:flutter/material.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template.two.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_five.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_four.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_one.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_seven.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_six.dart';
import 'package:resumewithus/features/cv_creation/presentation/resume-templates/template_three.dart';

class ListOfTemplates {
  List<TemplateData> resume = [
    TemplateData(
      template: const ClassicElegantResume(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const CreativeResumeTemplate(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const InfographicResume(
        name: '',
        title: '',
        email: '',
        skills: [],
        phone: '',
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const MinimalistResume(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const ModernResumeTemplate(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const ModernSplitResume(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
    TemplateData(
      template: const SimpleResumeTemplate(
        name: '',
        title: '',
        email: '',
        phone: '',
        skills: [],
        disc: '',
      ),
      name: '',
      title: '',
      email: '',
      phone: '',
      skills: [],
      disc: '',
    ),
  ];
}

class TemplateData {
  final Widget template;
  final String name;
  final String title;
  final String email;
  final String phone;
  final List<String> skills;
  final String disc;

  TemplateData({
    required this.template,
    required this.name,
    required this.title,
    required this.email,
    required this.phone,
    required this.skills,
    required this.disc,
  });
}
