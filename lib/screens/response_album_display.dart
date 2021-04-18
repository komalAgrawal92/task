import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_rejolut/base.dart';
import 'package:task_rejolut/providers/album_provider.dart';
import 'package:task_rejolut/providers/photos_provider.dart';
import 'package:task_rejolut/screens/response_photo_display.dart';

class ResponseAlbumDisplay extends StatelessWidget {
  final int userIndex;

  ResponseAlbumDisplay(this.userIndex);
  //final Function albumcall;

  //ResponseAlbumDisplay(this.albumcall);
  @override
  Widget build(BuildContext context) {
    final albumState = Provider.of<Album>(context);
    final photoState = Provider.of<Photo>(context);

    List<Map> albumsForUser = albumState.albums;
    return Scaffold(
        appBar: AppBar(title: Text('User Albums')),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: BaseClass.isFetching
              ? Center(child: CircularProgressIndicator())
              : (albumsForUser != null && albumsForUser.length > 0)
                  ? Consumer<Album>(
                      builder: (context, value, child) => ListView.builder(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: albumsForUser.length,
                            itemBuilder: (context, index) {
                              Map<String, dynamic> currentAlbum =
                                  albumsForUser[index];
                              return ListTile(
                                minVerticalPadding: 30,
                                onTap: () {
                                  if (photoState.photos.length > 0) {
                                    photoState.photos.clear();
                                  }
                                  BaseClass.fetchData('photos').then((value) =>
                                      photoState.getResponseJson(
                                          currentAlbum['id'], value));

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          ResponsePhotoDisplay(
                                              currentAlbum['id'])));
                                },
                                // title: Text(currentAlbum['userId'].toString()),
                                title: Container(
                                    color: Colors.black26,
                                    child: Text(currentAlbum["title"])),
                              );
                            },
                          ))
                  : Text("Press Button above to fetch data"),
        ));
  }
}
