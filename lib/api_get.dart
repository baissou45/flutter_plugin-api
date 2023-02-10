part of api;

apiGet(
  String route, {
  String? token,
  context,
  bool showSuccess = false,
  bool showError = false,
  String? successMessage,
  String? errorMessage,
}) async {
  final String response = await rootBundle.loadString('env.json');
  final data = await json.decode(response);

  var dio = Dio();
  String baseUrl = await BaissApi.getBaseUrl();

  try {
    dio.options.connectTimeout = 10000;
    dio.options.receiveTimeout = 10000;
    dio.options.headers['content-Type'] = 'application/json';

    if (token != null) {
      dio.options.headers["authorization"] = "Bearer $token";
    }

    if (!data['APP_PROD_ENV']) {
      print(
          "............................... Getting data from : $baseUrl$route");
    }
    var result = await dio.get(baseUrl + route);

    if (!data['APP_PROD_ENV']) {
      print(
          "............................... Data get succesfully from : $baseUrl$route");
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
  } catch (e) {
    if (e is DioError) {
      if (context != null && showError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            duration: const Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              errorMessage ?? "Une erreur est suevenue !!",
              textAlign: TextAlign.center,
            )));
      }

      if (e is DioError) {
        if (!data['APP_PROD_ENV']) {
          print(
              "............................... ${e.message} where getting data from : $baseUrl$route");
        }
        return {
          'data': e,
          'error': e.response,
          'status': e.response!.statusCode,
        };
      }

      return {
        'data': e,
        'status': '',
        'error': e.toString(),
      };
    }
  }
}
