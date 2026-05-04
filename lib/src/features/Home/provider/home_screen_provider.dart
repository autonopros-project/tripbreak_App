


import '../../../../common_imports.dart';
import '../../../core/core/constants/constant_text.dart';
import '../../../core/core/network/common_repository.dart';
import '../../../core/core/network/network_index.dart';
import '../../../core/core/utils/routes.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;

  void isLoadData(bool isLoading) {
    this.isLoading = isLoading;
    //  notifyListeners();
  }

//********************************GET SAVE IMSQ INSPECT DETAILS API CALL**********************************//
  Future<void> postIMSQInspectDetailsApiCall(
      HomeProvider homeProvider) async {
    final HTTPResponse<dynamic> response = await ApiCalling.callApi(
      apiUrl: AppUrls.registerDetails,
      apiFunType: APITypes.post,
      //sendingData: postList.toJson(),
    );

    print('API Response: ${response.body}');
    //print('API Response: ${postList.toJson()}');
    print('Response Type: ${response.body.runtimeType}');

    if (response.body is Map<String, dynamic>) {
      final responseBody = response.body as Map<String, dynamic>;
      final mItem1 = responseBody['m_Item1'] as Map<String, dynamic>?;

      if (mItem1 != null) {
        final responseCode = mItem1['ResponseCode'];
        final description = mItem1['Description'];

        if (responseCode == '300' && description != null) {
          EasyLoading.showError(description); // Error case
        } else if (responseCode == '200' && description != null) {
          EasyLoading.showSuccess(description); // Show success message like "Success Pkey is :3"
          await Future.delayed(const Duration(seconds: 2));
          NavigateRoutes.navigatePop();
        } else {
          EasyLoading.showError(description ?? ConstantMessage.somethingWentWrongPleaseTryAgain);
        }
      }

    }

    notifyToAllValues();
  }



  void notifyToAllValues() => notifyListeners();
}