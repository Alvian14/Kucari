class ApiService {
  static Uri url(url) {
    Uri Server = Uri.parse("http://172.17.111.136/webKucari/public/mobile/" + url);
    return Server;
  }
  static String urlGambar(url) {
    String Server = "http://172.17.111.136/webKucari/public/mobile/uploads/" + url;
    return Server;
  }

  // static String urlGambar(url) {
  //   String Server = "assets/images/" + url;
  //   return Server;
  // }

    //  static String urlString(String url) {
//     String Server = "http://172.17.202.43/Baticraft/baticraft/fh_db/" + url;
//     return Server;
// }

}