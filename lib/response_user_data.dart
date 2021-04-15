import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_rejolut/album_provider.dart';
import 'package:task_rejolut/response_album_display.dart';
import 'package:task_rejolut/user_provider.dart';

class ResponseUserDisplay extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    final userState = Provider.of<User>(context);
      final albumState = Provider.of<Album>(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: userState.isFetching
          ? Center(child:CircularProgressIndicator())
          : userState.getResponseJson() != null
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: userState.getResponseJson().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: (){
                      albumState.fetchData(index).then((value) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ResponseAlbumDisplay(index+1))));
                       
                       
                      } ,
                   title: Text(
                        userState.getResponseJson()[index]["name"],
                      ),
                      subtitle: Text(userState.getResponseJson()[index]["email"]),
                    );
                  },
                )
              : Text("Press Button above to fetch data"),
    );
  }
}


  
