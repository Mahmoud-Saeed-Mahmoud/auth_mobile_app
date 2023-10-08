import 'package:auth_mobile_app/data/models/loginDeviceAuth/post_login_device_auth_resp.dart';

import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PostLoginDeviceAuthResp> loginDeviceAuth({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.loginDeviceAuth(
      headers: headers,
      requestData: requestData,
    );
  }
}
