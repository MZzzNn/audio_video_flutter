import 'package:audio_video_flutter/shared/network/models/audio_call_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AudioCallScreen extends GetWidget<AudioCallViewModel> {
  const AudioCallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AudioCallViewModel>(
        init:AudioCallViewModel(),
        builder: (controller){
          return Scaffold(
            body: Stack(
              children: [
                 Center(
                     child: controller.remoteUid !=0 ?
                     const Text('mazen in call',textAlign: TextAlign.center,):
                     const Text('calling....',textAlign: TextAlign.center,)
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

