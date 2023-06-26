import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:either_dart/either.dart';
import '../../../infrastructure/commens/base_url.dart';
import '../models/auction_view_model.dart';
import '../models/edit_record_dto.dart';

class AuctionHomePageRepository {
  final httpClient = http.Client();

  Future<Either<String, List<AuctionViewModel>>> getAuctionRecords() async {
    final url = Uri.http(BaseUrl.baseUrl, 'auction');
    final responseOrException = await httpClient.get(url);

    if (responseOrException.statusCode >= 200 &&
        responseOrException.statusCode <= 400) {
      final List<AuctionViewModel> weatherRecords = [];
      for (final record in json.decode(responseOrException.body)) {
        weatherRecords.add(AuctionViewModel.fromJson(record));
      }
      return Right(weatherRecords);
    } else {
      return const Left('error');
    }
  }

  Future<Either<String, String>> deleteAuctionRecords(
      final int recordId) async {
    final url = Uri.http(BaseUrl.baseUrl, 'auction/$recordId');
    final responseOrException = await httpClient.delete(url);

    if (responseOrException.statusCode >= 200 &&
        responseOrException.statusCode <= 400) {
      return const Right ('success');
    } else {
      return const Left('error');
    }
  }

  Map<String, String> customHeaders = {"content-type": "application/json"};
  Future<Either<String, AuctionViewModel>> editRecords(EditRecordDto dto) async {
    final url = Uri.http(BaseUrl.baseUrl, 'auction/${dto.id}');
    final jsonDto = dto.toJson();
    final responseOrException = await httpClient.put(url, body: json.encode(jsonDto), headers: customHeaders);
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
