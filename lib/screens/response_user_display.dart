import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_rejolut/base.dart';
import 'package:task_rejolut/providers/album_provider.dart';
import 'package:task_rejolut/screens/response_album_display.dart';
import 'package:task_rejolut/providers/user_provider.dart';

class ResponseUserDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User>(context);
    final albumState = Provider.of<Album>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: BaseClass.isFetching
          ? Center(child: CircularProgressIndicator())
          : userState.userItems != null
              ? Consumer<User>(
                  builder: (context, value, child) => ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: userState.userItems.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userdata =
                              userState.userItems[index];
                          return ListTile(
                            onTap: () {
                              if (albumState.albums.length > 0) {
                                albumState.albums.clear();
                              }
                              BaseClass.fetchData('albums').then((value) =>
                                  albumState.getResponseJson(index + 1, value));
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ResponseAlbumDisplay(index + 1)));
                            },
                            title: Text(
                              userdata["name"].toString(),
                            ),
                            subtitle: Text(userdata["email"].toString()),
                          );
                        },
                      ))
              : Text("Press Button above to fetch data"),
    );
  }
}
