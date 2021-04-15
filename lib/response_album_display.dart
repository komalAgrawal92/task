import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_rejolut/album_provider.dart';
import 'package:task_rejolut/photos_provider.dart';
import 'package:task_rejolut/response_photo_display.dart';

class ResponseAlbumDisplay extends StatelessWidget {
  final int userIndex;

  ResponseAlbumDisplay(this.userIndex);
  //final Function albumcall;

  //ResponseAlbumDisplay(this.albumcall);
  @override
  Widget build(BuildContext context) {
    final albumState = Provider.of<Album>(context);
    final photoState = Provider.of<Photo>(context);
    List<Map> albumsForUser = albumState.getResponseJson(userIndex);
    return Scaffold(
      appBar: AppBar(title:Text('User Albums')),
        body: Container(
      padding: const EdgeInsets.all(16.0),
      child: albumState.isFetching
          ? Center(child: CircularProgressIndicator())
          : (albumsForUser != null && albumsForUser.length > 0)
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: albumsForUser.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> currentAlbum = albumsForUser[index];
                    return ListTile(
                      minVerticalPadding: 30,
                      onTap: () {
                        photoState.fetchData(index).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResponsePhotoDisplay(index+1))));
                      },
                     // title: Text(currentAlbum['userId'].toString()),
                      title: Container(
                        
                        color: Colors.black26,
                        child:Text(currentAlbum["title"] )),
                    );
                  },
                )
              : Text("Press Button above to fetch data"),
    ));
  }
}
