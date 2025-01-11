import 'dart:io';

import 'package:injectable/injectable.dart';

import 'exceptions.dart';

abstract class InternetExceptionThrower {
  Future throwInternetException();
}

@Injectable(as: InternetExceptionThrower)
class InternetExceptionThrowerImpl implements InternetExceptionThrower {
  @override
  Future throwInternetException() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      throw NoInternetException();
    }
  }
}
