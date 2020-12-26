import 'package:flutter/material.dart';
import 'package:git_repo/repo_tile.dart';
import 'package:git_repo/model/repo.dart';
import 'package:http/http.dart'as http;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyRepo(),

  ));
}

class MyRepo extends StatefulWidget {
  @override
  _MyRepoState createState() => _MyRepoState();
}

class _MyRepoState extends State<MyRepo> {
  
  Future<List<Repo>> fetchRepo()async{
    
    http.Response response=await http.get("https://api.github.com/repositories");

    print(response.body);

    return repoFromJson(response.body);

  }
  
  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Git Repos'),
        backgroundColor: Color(0xff1D2136),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xff1D2136)
            ),
          ),
          FutureBuilder(
            future: fetchRepo(),
            builder: (context,snapshot){
              if(snapshot.data==null){
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );

              }else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context,index){
                    return RepoTile(snapshot.data[index]);

                  },
                );
              }


            },

          ),
        ],
      )
    );
  }
}


