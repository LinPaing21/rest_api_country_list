import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rest_api_country_list/api/apiservice.dart';
import 'package:rest_api_country_list/models/country.dart';

class Home extends StatelessWidget {
  ApiService apiService = ApiService(Dio());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('RestApi Country List'),
        backgroundColor: Colors.blue,
      ),
      body: FutureBuilder(
        future: apiService.getCountries(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Country>? country = snapshot.data;
            return ListView.builder(
              itemCount: country?.length,
              itemBuilder: (context, position) {
                return ListTile(
                  onTap: () {
                    // Navigator.push(context, 
                    // MaterialPageRoute(builder: (context) => DetailScreen)
                    // )
                  },
                  leading: CachedNetworkImage(
                    imageUrl: country![position].flags.png,
                    width: 100,
                    height: 100,
                    placeholder: (_,__) => Center(child: CircularProgressIndicator()),
                  ),
                  title: Text(country[position].name),
                  subtitle: Text(country[position].region),
                );
              }
            );
          }
          else if(snapshot.hasError) return Text('Error');
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}