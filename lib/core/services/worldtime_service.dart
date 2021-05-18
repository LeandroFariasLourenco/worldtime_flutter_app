import "package:http/http.dart";
import "dart:convert";
import 'package:intl/intl.dart';

class WorldTimeService {
  String location;
  String time;
  String flag;

  bool isDayTime;

  Uri _endpoint;

  WorldTimeService({this.location, this.flag, String timezone}) {
    this._endpoint = Uri.https('worldtimeapi.org', '/api/timezone/$timezone');
  }

  void isDateDaytime(DateTime date) {
    this.isDayTime = date.hour > 6 && date.hour < 18 ? true : false;
  }

  Future<void> getTimezone() async {
    try {
      Response response = await get(this._endpoint);
      Map timezone = jsonDecode(response.body);

      DateTime currentTime = DateTime.parse(timezone['datetime']);
      String offset = timezone['utc_offset'].substring(1, 3);

      currentTime = currentTime.add(Duration(hours: int.parse(offset)));

      this.isDateDaytime(currentTime);
      this.time = DateFormat.jm().format(currentTime);
    } catch (e) {
      print('Error: $e');
      this.time = 'Could not get timezone';
      this.isDateDaytime(DateTime.now());
    }
  }
}
