part of 'common_repository.dart';

class _ApiCallTypes {
  static const String postHeaderKey = 'Content-Type';
  static const String postHeaderValue = 'application/json; charset=UTF-8';

  // static const String bearerHeaderValue = 'Bearer';

  /* ------------------          POST REQUESTS           --------------------------------------------   */
  static Future<http.Response> postRequestAPI({
    required Uri url,
    // ignore: always_specify_types
    required data,

  }) async {
    final http.Response response = await http.post(
      url,
      headers: header(),
      body: data,
    );
    return response;
  }

  /* ------------------------       GET REQUESTS           -------------------------------------------   */
  static Future<http.Response> getRequestApi({
    required Uri url,
 
  }) async {
    final http.Response response = await http.get(
      url,
      headers: header(),
    );
    return response;
  }

  /* ------------------          PUT REQUESTS           ---------------------------------------------------   */
  static Future<http.Response> putRequestApi({
    required Uri url,
  
    String? updatedData,
  }) async {
    final http.Response response = await http.put(
      url,
      headers: header(),
      body: updatedData,
    );
    return response;
  }

  /* ------------------          DELETE REQUESTS           ---------------------------------------------------   */
  static Future<http.Response> deleteRequestAPI({
    required Uri url,
  
  }) async {
    final http.Response response = await http.delete(
      url,
      headers: header(),
    );
    return response;
  }

  /* ------------------          COMMON HEADERS           ---------------------------------------------------   */
  // static Map<String, String> header({
  //   required bool isTokenUsed,
  //   String? token,
  // }) {
  //   if (isTokenUsed && (token?.isNotEmpty ?? false)) {
  //     return <String, String>{
  //       // postHeaderKey: postHeaderValue,
  //       // HttpHeaders.authorizationHeader: '$bearerHeaderValue ${token!}'
  //       postHeaderKey: postHeaderValue,
  //       bearerHeaderValue: token!,
  //     };
  //   } else {
  //     return <String, String>{postHeaderKey: postHeaderValue};
  //   }
  // }

  static Map<String, String> header(
      // {
      // required String username,
      // required String password,
      // }
      ) {
    String username = 'edp';
    ///Live
    //String password = 'U2FsdGVkX19ZonFiPxqywPI8fJuoFKh270UZEhenTxU=';

    ///Staging
     String password = 'Navayuga123';
    final Map<String, String> headers = <String, String>{
      postHeaderKey: postHeaderValue,
    };

    if (username.isNotEmpty && password.isNotEmpty) {
      final String authHeader =
          'Basic ${base64Encode(utf8.encode('$username:$password'))}';
      headers[HttpHeaders.authorizationHeader] = authHeader;
    }

    return headers;
  }
}
