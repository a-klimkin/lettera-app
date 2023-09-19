import 'dart:ui';

extension ColorExtension on Color {
  Color get disabled => withOpacity(0.24);

  Color get lighter => withOpacity(0.56);

}