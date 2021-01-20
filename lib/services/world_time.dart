import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; //location for UI to get Time
  String time; //time for specific location
  String flag; //flag for UI location
  String url; //Url for Api end point

  WorldTime({this.location, this.flag, this.url});

  Future<String> getTimeForPK() async {
    //make request for world time api
    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map apiData = jsonDecode(response.body);
    //print(apiData);

    //get Properties from apiData
    String dateTime = apiData['datetime'];
    String utcOffset = apiData['utc_offset'].substring(1, 3);
    //print(dateTime);
    //print(utcOffset);

    //add Offset in Actual Time
    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(utcOffset)));
    //print(now);

    //set time property
    time = now.toString();
    return time;
  }
}
