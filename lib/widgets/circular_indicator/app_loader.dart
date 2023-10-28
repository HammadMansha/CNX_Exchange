import 'package:gnx_exchange/utils/libraries/app_libraries.dart';

import '../../constants/app_colors/app_colors.dart';


class AppLoader extends StatelessWidget {
  const AppLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.yellowIconsColor,
        //color: AppColors.allButtonsColor,
      ),
    );
  }
}
