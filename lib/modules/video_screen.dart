import 'package:audio_video_flutter/shared/network/models/video_call_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart'as RtcRemoteView;
import '../shared/components/constant.dart';


class VideoCallScreen extends GetWidget<VideoCallViewModel> {
  const VideoCallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<VideoCallViewModel>(
        init: VideoCallViewModel() ,
        builder: (controller){
          return Scaffold(
            body: Stack(
              children: [
                 Center(
                  child: controller.remoteUid !=null ?
                  RtcRemoteView.SurfaceView(uid: controller.remoteUid!,channelId: channelName,):
                  const Text('calling....',textAlign: TextAlign.center,),
                ),
                SafeArea(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ClipRRect(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        borderRadius: BorderRadius.circular(100),
                        child: CircleAvatar(
                          radius: 80,
                          child: controller.localUserJoined?
                          const RtcLocalView.SurfaceView(channelId: channelName,):
                          const CircularProgressIndicator(),
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 25,
                      child: Center(
                        child: IconButton(
                            onPressed:(){Get.back();},
                            icon: const Icon(Icons.call_end,color: Colors.white,size: 30,)
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}


