import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/constant.dart';

class AudioCallViewModel extends GetxController{

  int remoteUid = 0;
  late RtcEngine rtcEngine;

  initAgora()async{
    await Permission.microphone.request();
    rtcEngine = await RtcEngine.create(appID);
    rtcEngine.enableAudio();
    _addListeners();
    await rtcEngine.joinChannel(token, channelName, null, remoteUid);
  }

  void _addListeners() {
    rtcEngine.setEventHandler(
      RtcEngineEventHandler(
          joinChannelSuccess: (channel, uid, elapsed) {
            print('user uid is $uid');
          },
          userJoined: (uid,elapsed){
            print('remote user uid is $uid');
            remoteUid =uid;
            update();
          },
          userOffline:(uid,reason){
            print('remote user uid is $uid is left');
            remoteUid =0;
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
    rtcEngine.disableAudio();
    rtcEngine.destroy();
    super.onClose();
  }

}