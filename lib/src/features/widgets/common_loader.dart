import '../../../common_imports.dart';

class CommonLoader extends StatelessWidget {
  const CommonLoader({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}