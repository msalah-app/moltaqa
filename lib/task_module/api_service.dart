import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moltaqa/task_module/products_model.dart';

class ApiService {
  final String token =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDIwYWNhYjVkNDQzM2FiZWJmM2EyZDRiNDJjOTNlZjBiZWMwMjMzZWYxYTkwOGM5YmQxZjExMzQ4YjRmY2JmNjcxMzU1MmQ2ZjZjYjJhODkiLCJpYXQiOjE2NTQ4MjUwNzYuODQ3OTM2LCJuYmYiOjE2NTQ4MjUwNzYuODQ3OTQxLCJleHAiOjE2ODYzNjEwNzYuODM2ODc5LCJzdWIiOiIxMiIsInNjb3BlcyI6W119.iqZ7U9GoivJQ4WBuWTXMQiP-KrHIs91pwB23B7CSflF6KzRX5a5h-NYkCAwiXn6eNi_70uA1-QvCH8hXKjxg2cpcTJ4_sEaGNvBz-UaGFbg2S3Y3tM728l-Hbzb7VEWWrLH42-oVOpZNIj1teqM23l6yxKlzgmZcY-q_z5qJli2KlUR3ssarJxHkd5ByAv_0k47Sg87XdNTnFJQf7QQ3fEHLSRndzNUWnvjIlXJbXIKBSlekwZNPSDxnIFA_XxC721ImiHLCNzSpbBa5cfNyG3i4_JtFn8MwHWNp3CVTs_Z5CzMreswYTDeXEW1GVeR1XLNz0flPv0NPvXQl8quhThTSKnKNZVjYboywNiE0BVpOxBJmt6TkEEImcTD7lBrltbQcNwYj2Ne_i1Rjp47f31DTsXKp31wSjC9ax_U4IeLALunRH6xOR2AbYDap5m8wo08YfNCRUhCDQiSKAvaF8m33T57aZueVZehsNLzbpzLeB3ORJLv5_VPjdeI_juoXsMUcohaZI401SZ2eMSSIMPZp5OVzkspfpad5GPAQIPBdGkAch_ENBvPTEskGiS5N05OgUZn0PGuPRCXcTPp4To_cmLnU2MH9iyp4Uww-OMHsWYBlktqfnkttYVXY0ARnLfYyO_sxS3Q9motkwsBAomWMW7W9WaZVRQvafowjqQM";
  final String baseUrl = "https://ecommerce.royalclean-uae.com/api/v1/home/";

  Future<List<ProductData>> getProducts(
    int offset,
  ) async {
    http.Response response = await http.get(
      Uri.parse(baseUrl + 'products?&page=$offset'),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );
    var map = Products.fromJson(json.decode(response.body));
    List<ProductData> data = map.data;
    print(data.length);

    return data;
  }

  Future<List<ProductData>> filterProducts(
    int page,int brand, int categories ,int tags,int collections1 ,int collections2 ,int collections0 ,int minPrice ,int maxPrice ,int attributes ,String q,
  ) async {
    http.Response response = await http.get(
      Uri.parse(baseUrl +
          'products?&page=$page&q=$q&brands[]=$brand&categories[]=$categories&tags[]=$tags&collections[0]=$collections0&'
              'collections[1]=$collections1&collections[2]=$collections2&min_price=$minPrice&max_price=$maxPrice&attributes[0]=$attributes'),
      headers: {
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      },
    );
    var map = Products.fromJson(json.decode(response.body));
    List<ProductData> data = map.data;

    return data;
  }
}
