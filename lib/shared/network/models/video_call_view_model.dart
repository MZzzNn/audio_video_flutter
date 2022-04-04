import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/constant.dart';

class VideoCallViewModel extends GetxController{

  int? remoteUid;
  late RtcEngine rtcEngine;
  bool localUserJoined = false;

  initAgora()async{
    await [Permission.camera,Permission.microphone].request();
    rtcEngine = await RtcEngine.create(appID);
    rtcEngine.enableVideo();
    _addListeners();
    rtcEngine.joinChannel(token, channelName, null, 0);
  }

  _addListeners(){
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(
          joinChannelSuccess: (channel, uid, elapsed) {
            print('user uid is $uid');
            localUserJoined = true;
          },
          userJoined: (uid,elapsed){
            print('remote user uid is $uid');
            remoteUid =uid;
            update();
          },
          userOffline:(uid,reason){
            print('remote user uid is $uid is left');
            remoteUid =null;
            update();
            Get.back();
          }
      ),
    );
  }

  @override
  void onInit() {
    initAgora();
    super.onInit();
  }

  @override
  void onClose() {
    rtcEngine.enableAudio();
    rtcEngine.destroy();
    super.onClose();
  }

}