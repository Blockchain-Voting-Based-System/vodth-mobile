import 'dart:io';

extension StringExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

void main() async {
  String viewFilePath = 'scripts/generate_views/templates/view.dart.template';
  String viewAdaptiveFilePath = 'scripts/generate_views/templates/view_adaptive.dart.template';
  String viewModelFilePath = 'scripts/generate_views/templates/view_model.dart.template';

  String viewContents = await File(viewFilePath).readAsString();
  String viewAdaptiveContents = await File(viewAdaptiveFilePath).readAsString();
  String viewModelContents = await File(viewModelFilePath).readAsString();

  // path, libary
  Map<String, String> views = {
    // 'home': 'Home',
    // 'main_screen' : 'main_screen',
    // 'events': 'events',
    // 'candidates': 'candidates',
    // 'vote_result': 'vote_result',
    // 'setting': 'setting',
  };

  for (final view in views.entries) {
    generateViewFor(
      path: view.key,
      library: view.value,
      viewContents: viewContents,
      viewAdaptiveContents: viewAdaptiveContents,
      viewModelContents: viewModelContents,
    );
  }
}

Future<void> generateViewFor({
  required String path,
  required String library,
  required String viewContents,
  required String viewAdaptiveContents,
  required String viewModelContents,
}) async {
  String viewLibraryName = library.toLowerCase();
  String viewFileName = '${viewLibraryName.toLowerCase()}_view.dart';
  String viewAdaptivFileName = '${viewLibraryName.toLowerCase()}_adaptive.dart';
  String viewModelFileName = '${viewLibraryName.toLowerCase()}_view_model.dart';

  String className = viewLibraryName.split('_').map((e) => e.capitalize()).join('');
  String viewClassName = '${className}View';
  String viewModelClassName = '${className}ViewModel';
  String viewAdaptiveClassName = '_${className}Adaptive';

  String newViewContents = viewContents
      .replaceAll('{{view}}', viewLibraryName)
      .replaceAll('{{view_adaptive.dart}}', viewAdaptivFileName)
      .replaceAll('{{view_model.dart}}', viewModelFileName)
      .replaceAll('{{View}}', viewClassName)
      .replaceAll('{{ViewModel}}', viewModelClassName)
      .replaceAll('{{_ViewAdaptive}}', viewAdaptiveClassName);

  String newViewAdaptiveContents = viewAdaptiveContents
      .replaceAll('{{view}}', viewLibraryName)
      .replaceAll('{{_ViewAdaptive}}', viewAdaptiveClassName)
      .replaceAll('{{ViewModel}}', viewModelClassName);

  String newViewModelContents = viewModelContents.replaceAll('{{ViewModel}}', viewModelClassName);

  final newViewFile = File('lib/views/$path/$viewFileName');
  final newViewAdaptiveFile = File('lib/views/$path/$viewAdaptivFileName');
  final newViewModelFile = File('lib/views/$path/$viewModelFileName');

  if (await newViewFile.exists()) return;

  if (!await newViewFile.parent.exists()) await newViewFile.parent.create(recursive: true);
  if (!await newViewAdaptiveFile.parent.exists()) await newViewAdaptiveFile.parent.create(recursive: true);
  if (!await newViewModelFile.parent.exists()) await newViewModelFile.parent.create(recursive: true);

  await newViewFile.writeAsString(newViewContents);
  await newViewAdaptiveFile.writeAsString(newViewAdaptiveContents);
  await newViewModelFile.writeAsString(newViewModelContents);
}
