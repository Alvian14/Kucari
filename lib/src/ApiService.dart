class ApiService {
  static Uri url(url) {
    Uri Server = Uri.parse("http://192.168.1.2/webKucari/mobile/" + url);
    return Server;
  }
//  static String urlString(String url) {
//     String Server = "http://172.17.202.43/Baticraft/baticraft/fh_db/" + url;
//     return Server;
// }
//   static String urlImageDatabase(url) {
//     String Server = "http://172.17.202.43/Baticraft/baticraft/fh_db/images/" + url;
//     return Server;
//   }

  // static String urlGambar(url) {
  //   String Server = "assets/images/" + url;
  //   return Server;
  // }
}