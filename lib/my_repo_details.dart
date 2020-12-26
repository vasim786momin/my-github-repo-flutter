import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'model/repo_details.dart';

class MyRepoDetails extends StatefulWidget {

  var owner,repo;
  MyRepoDetails(this.owner,this.repo);

  @override
  _MyRepoDetailsState createState() => _MyRepoDetailsState();
}

class _MyRepoDetailsState extends State<MyRepoDetails> {


  Future<RepoDetails> fetchRepoDetails()async{

    http.Response response=await http.get("https://api.github.com/repos/"+widget.owner+"/"+widget.repo);

   return repoDetailsFromJson(response.body);
  }


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.owner),
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
            future: fetchRepoDetails(),
            builder: (context,snapshot){

              if(snapshot.data==null){
                return Container(
                  child: Center(child: CircularProgressIndicator()),
                );

              }else{
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundImage: NetworkImage(snapshot.data.owner.avatarUrl),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data.owner.login,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            color:Color(0xffFFCA2A),
                          ),),
                      ),
                      Text(snapshot.data.name,
                        style: TextStyle(
                            color:Color(0xff01A75B),
                            fontSize: 16
                        ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(snapshot.data.description,
                          style: TextStyle(
                              color: Colors.grey
                          ),),
                      ),



                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.usb,
                                    color: Colors.white,
                                  ),
                                  Text(snapshot.data.forks.toString(),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ),


                          ),

                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffFFCA2A)
                            ),
                            child:    Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.white,
                                  ),
                                  Text(snapshot.data.stargazersCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ),
                          )

                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff5C6AC2)
                            ),
                            child:    Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  ),
                                  Text(snapshot.data.watchersCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ),
                          ),

                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xff01A057)
                            ),
                            child:    Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.score,
                                    color: Colors.white,
                                  ),
                                  Text(snapshot.data.size.toString(),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xffFFCA2A)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: Colors.white,
                                  ),
                                  Text(snapshot.data.openIssuesCount.toString(),
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )



                    ],
                  ),
                );
              }
            },
          )
        ],
      )
    );
  }
}
