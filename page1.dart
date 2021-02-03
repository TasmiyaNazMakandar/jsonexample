

import 'package:appnetwork/model/post.dart';
import 'package:appnetwork/screen/pade2.dart';
import 'package:appnetwork/service/http.dart';
import 'package:flutter/material.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpservice = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetching data"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: httpservice.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return ListView(
              children: posts
                  .map(
                      (Post post) =>GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostDetail(
                          post: post,
                        ),
                      ),
                    ),
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ListTile(
                            leading: Icon(Icons.person,color: Colors.orange,),
                            title:
                            Text(post.name),
                            subtitle: Text("${post.id}"),
                          ),
                          ListTile(
                            title:
                            Text(post.add.street ),
                            subtitle:
                            Text(post.add.suite),
                          ),
                          ListTile(
                            title:
                            Text(post.add.city),
                            subtitle:
                            Text(post.add.zipcode),

                          ),



                        ],
                      ),
                    )
                  )

              )
                  .toList(),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}