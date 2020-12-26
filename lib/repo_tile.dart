import 'package:flutter/material.dart';
import 'package:git_repo/my_repo_details.dart';


class RepoTile extends StatelessWidget {

  var repoData;

  RepoTile(this.repoData);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyRepoDetails(repoData.owner.login,repoData.name)));

      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(repoData.owner.avatarUrl),
                  ),
                  SizedBox(width: 10,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(repoData.owner.login,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color:Color(0xffFFCA2A),
                        ),),
                        SizedBox(height: 4,),

                        Row(
                          children: [
                            Text(repoData.name,
                            style: TextStyle(
                                color:Color(0xff01A75B),
                              fontSize: 16
                            ),),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),


              repoData.description==null?Container():
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text(repoData.description,
                    style: TextStyle(
                      color: Colors.grey
                    ),),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
