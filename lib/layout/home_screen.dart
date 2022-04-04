import 'package:audio_video_flutter/modules/audio_screen.dart';
import 'package:audio_video_flutter/modules/room_screen.dart';
import 'package:audio_video_flutter/shared/network/models/home_page_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../modules/video_screen.dart';


class HomeScreen extends GetWidget<HomePageViewModel> {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarChatDetails(),
      body: GetBuilder<HomePageViewModel>(
        init: HomePageViewModel(),
        builder: (controller){
          return Column(
            children: const [
              Expanded(child: SizedBox()),
              EditTextChatDetails()
            ],
          );
        },
      ),
    );
  }
}


class AppBarChatDetails extends StatelessWidget implements PreferredSizeWidget {
  const AppBarChatDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: null
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mazen Mohamed',
            style: Theme.of(context).textTheme.headline6!.copyWith(height: 1.3,color: Colors.white),
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              const Icon(Icons.circle,color: Colors.green,size: 10,),
              const SizedBox(width: 5,),
              Text(
                'Online',
                style: Theme.of(context).textTheme.bodyText2!
                    .copyWith(height: 1.2,fontSize: 13,color: Colors.white),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(
            onPressed:(){Get.to(()=>const VideoCallScreen());},
            icon: const Icon(Icons.video_call)
        ),
        IconButton(
            onPressed:(){Get.to(()=>const AudioCallScreen());},
            icon: const Icon(Icons.call)
        ),
        IconButton(
            icon: const Icon(Icons.workspaces_filled),
           onPressed:(){Get.to(()=>const RoomScreen());},
        ),
      ],
      titleSpacing: 0,
      elevation: 0,
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class EditTextChatDetails extends StatelessWidget {
  const EditTextChatDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 6, right: 7, left: 7),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 0),
                  decoration: BoxDecoration(
                      color:  const Color(0xFFE1E6EF),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      Material(
                        color: Colors.transparent,
                        child: IconButton(
                            splashRadius: 30,
                            icon: const Icon(
                              Icons.emoji_emotions_rounded,
                              color:Colors.teal,
                              size: 30,
                            ),
                            onPressed: () { }
                        ),
                      ),

                      Expanded(
                        child: Container(
                          margin:EdgeInsets.zero,
                          child: TextField(
                            onTap: (){},
                            scrollPhysics: const BouncingScrollPhysics(),
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(height: 1.7),
                            cursorColor: Colors.teal,
                            maxLines: 4,
                            minLines: 1,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
                              hintText: 'Type a message...',
                              hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide.none
                              ),
                            ),
                          ),
                        ),
                      ),

                      IconButton(
                          splashRadius: 20,
                          icon: const Icon(
                            Icons.camera, color: Colors.teal, size: 30,),
                          onPressed: () {}
                      ),

                    ],
                  ),
                ),
              ),
              const SizedBox(width: 7,),

              Container(
                  height: 45,
                  width: 45,
                  margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 0),
                  decoration: const BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF5899CF),
                          Color(0xff00BED6),
                          Color(0xFF19BDC1),
                        ]),
                  ),
                  child:
                  IconButton(
                    icon: const Icon(Icons.send, size: 20,color: Colors.white,),
                    onPressed: (){},
                  )
              ),
            ],
          ),
        ),
      ],
    );
  }
}
