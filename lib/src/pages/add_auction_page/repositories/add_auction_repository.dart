import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import '../../../infrastructure/commens/base_url.dart';
import '../../auction_home_page/models/auction_view_model.dart';
import '../models/add_record_dto.dart';

class AddRecordRepository {
  final httpClient = http.Client();

  Map<String, String> customHeaders = {"content-type": "application/json"};
  Future<Either<String, AuctionViewModel>> addRecords(AddRecordDto dto) async {
    final url = Uri.http(BaseUrl.baseUrl, 'auction');
    final jsonDto = dto.toJson();
    final responseOrException = await httpClient.post(url, body: json.encode(jsonDto), headers: customHeaders);
    if (responseOrException.statusCode >= 200 &&
        responseOrException.statusCode <= 400) {
      return Right(
        AuctionViewModel.fromJson(
          json.decode(responseOrException.body),
        ),
      );
    } else {
      return const Left('error');
    }
  }
}
