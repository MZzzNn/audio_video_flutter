import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../components/constant.dart';

class RoomCallViewModel extends GetxController{
  int remoteUid = 0;
  late RtcEngine rtcEngine;
  bool isJoined = false, openMicrophone = true, enableSpeakerphone = true;

  initAgora()async{
    await Permission.microphone.request();
    rtcEngine = await RtcEngine.createWithContext(RtcEngineContext(appID));
    _addListeners();
    rtcEngine.enableAudio();
    await rtcEngine.setChannelProfile(ChannelProfile.LiveBroadcasting);
    await rtcEngine.setClientRole(ClientRole.Broadcaster);
  }
  void _addListeners() {
    rtcEngine.setEventHandler(RtcEngineEventHandler(
      warning: (warningCode) {
        print('warning $warningCode');
      },
      error: (errorCode) {
        print('error $errorCode');
      },
      joinChannelSuccess: (channel, uid, elapsed) {
        print('joinChannelSuccess $channel $uid $elapsed');
          isJoined = true;
          update();
      },
      leaveChannel: (stats) async {
        print('leaveChannel ${stats.toJson()}');
          isJoined = false;
          update();
      },
    ));
  }
  joinChannel() async {
    if (defaultTargetPlatform == TargetPlatform.android) {
      await Permission.microphone.request();
    }

    await rtcEngine.joinChannel(token, channelName, null, remoteUid)
        .catchError((onError) {
      print('error ${onError.toString()}');
    });
  }

  leaveChannel() async {
    await rtcEngine.leaveChannel();
    isJoined = false;
    openMicrophone = true;
    enableSpeakerphone = true;
    update();
  }

  switchMicrophone() async {
    await rtcEngine.enableLocalAudio(!openMicrophone).then((value) {
      openMicrophone = !openMicrophone;
      update();
    }).catchError((err) {
      print('enableLocalAudio $err');
    });
  }

  switchSpeakerphone() {
    rtcEngine.setEnableSpeakerphone(!enableSpeakerphone).then((value) {
      enableSpeakerphone = !enableSpeakerphone;
      update();
    }).catchError((err) {
      print('setEnableSpeakerphone $err');
    });
  }
  @override
  void onInit() {
    super.onInit();
    initAgora();
  }
  @override
  void onClose() {
    super.onClose();
    rtcEngine.disableAudio();
    rtcEngine.destroy();
  }
}