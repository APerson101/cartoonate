import 'package:cartoonate/bloc_logic/socialMedia/bloc/socialmedia.dart';
import 'package:cartoonate/helper/ImagePost.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SocialmediaBloc>(create: (context) {
          var ite = SocialmediaBloc();
          ite.add(LoadFeed());
          return ite;
        }),
      ],
      // child: Container(
      //     color: Color(0xFF444444),
      //     child: SafeArea(
      //       child: Center(
      //         child: Text(
      //           'SOCIAL PAGE',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     )
      child: Decider(),
      // )
    );
  }
}

class Decider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(bottom: 80),
        child: Container(
          color: Color(0xFF444444),
          child: Center(child: BlocBuilder<SocialmediaBloc, SocialmediaState>(
              builder: (context, state) {
            if (state is SocialmediaInitial || state is PostLoading)
              return Expanded(
                child: Image.asset(
                  'assets/video/loading.gif',
                  fit: BoxFit.cover,
                ),
              );
            if (state is PostsLoaded) {
              return Feed(state.posts);
            } else
              return Text('unknown Error');
          })),
        ));
  }
}

class Feed extends StatelessWidget {
  List<ImagePost> posts = [];
  Feed(this.posts);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        final currentItem = posts[index];
        return CurrentPost(currentItem);
      },
    );
  }
}

class CurrentPost extends StatelessWidget {
  final ImagePost currentItem;
  CurrentPost(this.currentItem);
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(69, 69, 82, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Expanded(
              //   child:
              Flexible(
                flex: 1,
                // child:
                // alignment: Alignment.center,
                // color: Colors.blue,
                // width: 300,
                // height: 300,
                child: Image.network(
                  currentItem.originalpost,
                  fit: BoxFit.cover,
                ),
                // ),
              ),
              Flexible(
                  flex: 1,
                  child:
                      // color: Colors.red,
                      // width: 300,
                      // height: 300,
                      // child:
                      Image.network(
                    currentItem.generatedpost,
                    fit: BoxFit.cover,
                  )
                  // ),
                  ),
            ],
          ),
        ));
  }
}
