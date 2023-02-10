part of api;

apiPost(
  String route,
  data, {
  String? token,
  context,
  bool showSuccess = false,
  bool showError = false,
  String? successMessage,
  String? errorMessage,
}) async {
  String baseUrl = await BaissApi.getBaseUrl();
  var dio = Dio();

  try {
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.options.headers['content-Type'] = 'application/json';

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    if (!data['APP_PROD_ENV']) {
      print("............................... Posting data to : $baseUrl$route");
    }

    final result = await dio.post(baseUrl + route,
        data: data, options: Options(method: "Post"));

    if (result.statusCode == 200) {
      if (!data['APP_PROD_ENV']) {
        print(
            "............................... Data posted to : $baseUrl$route successfuly");
      }

      if (context != null && showSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.green,
            content: Text(
              successMessage ?? 'Effectué avec success 👌🏽',
              textAlign: TextAlign.center,
            )));
      }

      return {
        'data': result,
        'status': result.statusCode,
      };
    } else {
      return {
        'data': result,
        'status': result.statusCode,
      };
    }
  } catch (e) {
    if (e is DioError) {
      if (!data['APP_PROD_ENV']) {
        print(
            "............................... ${e.message} where posting data to : $baseUrl$route");
      }

      if (context != null && showError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              errorMessage ?? "Une erreur est suevenue !!",
              textAlign: TextAlign.center,
            )));
      }

      return {
        'data': e,
        'status': e.response!.statusCode,
        'error': e.response,
      };
    }

    return {
      'data': e,
      'status': '',
      'error': e.toString(),
    };
  }
}
