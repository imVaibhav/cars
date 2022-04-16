import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

abstract class GenericService {
  Map<String, String> _header;

  @protected
  Future<void> setupAuthentication() async {
    setupHeader({
      'Content-Type': 'application/json; charset=UTF-8'
    });
  }

  @protected
  void setupHeader(Map<String, String> header) {
    _header = header;
  }

  @protected
  Future<Response> getData(String endpoint, [Map<String, String> headers]) async {
    if (headers == null) {
      await setupAuthentication();
    }
    return await get(endpoint, headers: (headers != null) ? headers : _header);
  }

  @protected
  Future<Response> postData(String endpoint, Object data) async {
    await setupAuthentication();
    return await post(endpoint, headers: _header, body: data);
  }

  @protected
  Future<Response> patchData(String endpoint, Object data) async {
    await setupAuthentication();
    return await patch(endpoint, headers: _header, body: data);
  }

  @protected
  Future<Response> deleteData(String endpoint, Object data) async {
    await setupAuthentication();
    return await delete(endpoint, headers: _header);
  }

}