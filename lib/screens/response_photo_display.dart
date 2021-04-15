import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_rejolut/album_provider.dart';
import 'package:task_rejolut/photos_provider.dart';
import 'package:task_rejolut/show_photo.dart';

class ResponsePhotoDisplay extends StatelessWidget {
  final int albumIndex;

  ResponsePhotoDisplay(this.albumIndex);
  //final Function albumcall;

  //ResponseAlbumDisplay(this.albumcall);
  @override
  Widget build(BuildContext context) {
    final photoState = Provider.of<Photo>(context);
    List<Map> photosForAlbum = photoState.getResponseJson(albumIndex);
    return Scaffold(
      appBar: AppBar(title:Text('Album Wise Photos')),
        body: Container(
      padding: const EdgeInsets.all(16.0),
      child: photoState.isFetching
          ? Center(child: CircularProgressIndicator())
          : (photosForAlbum != null && photosForAlbum.length > 0)
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: photosForAlbum.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> currentPhoto = photosForAlbum[index];
                    return ListTile(
                      minVerticalPadding: 30,
                      leading:CircleAvatar(backgroundImage:(NetworkImage(currentPhoto["url"]) )),
                      onTap: () {
                        
                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ShowPhoto(photoToShow: currentPhoto["url"] )));
                      },
                     // title: Text(currentAlbum['userId'].toString()),
                      title:
                        Text(currentPhoto["title"] ));
                    
                  },
                )
              : Text("Press Button above to fetch data"),
    ));
  }
}
