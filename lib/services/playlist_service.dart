import 'package:dio/dio.dart';

class PlaylistService {
  final Dio dio = Dio();

  Future<String> fetchPlaylist(String url) async {
    final res = await dio.get(url);
    return res.data.toString();
  }
}
