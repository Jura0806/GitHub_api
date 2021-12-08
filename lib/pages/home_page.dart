import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mygitinfo/models/user_model.dart';
import 'package:mygitinfo/services/http_service.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  void _apiInfoList(){
    Network.getJsonData().then((response) => {
      print(response),
      _showResponse(response!)
    });
  }
  MyGithubModel?  myGithubModel;
  void _showResponse(String response){
     myGithubModel = Network.parseMyGit(response);
   setState(() {
     if(response.isNotEmpty) {
       isLoading = !isLoading;
     }
   });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiInfoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF8B94BC),
      appBar: AppBar(
        backgroundColor: Color(0xFF8B94BC),
        title: Text(isLoading ? "MyGitHubInfos" : "Loading..."),
      ),
      body: isLoading ? ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(myGithubModel!.avatarUrl),
                    ),
                    SizedBox(width: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(myGithubModel!.name, style: TextStyle(fontSize: 25, color: Colors.white),),
                        SizedBox(height: 5,),
                        Text(myGithubModel!.login, style: TextStyle(fontSize: 20, color: Colors.white),),
                        SizedBox(height: 5,),
                        Container(child: Text(myGithubModel!.bio, style: TextStyle(fontSize: 15, color: Colors.white),))
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Text("URL =>  ${myGithubModel!.url}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("type =>  ${myGithubModel!.type}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("publicRepos =>  ${myGithubModel!.publicRepos}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("company =>  ${myGithubModel!.company}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("email =>  ${myGithubModel!.email}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("site_admin =>  ${myGithubModel!.siteAdmin}", style: TextStyle(color: Colors.white),),
                SizedBox(height: 5,),
                Text("id =>  ${myGithubModel!.id}", style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
        ],
      ) : SizedBox.shrink()
    );
  }

}
