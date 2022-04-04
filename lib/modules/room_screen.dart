import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../shared/network/models/room_call_view_model.dart';

class RoomScreen extends GetWidget<RoomCallViewModel> {
  const RoomScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RoomCallViewModel>(
        init:RoomCallViewModel(),
        builder: (controller){
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                            onPressed:controller.isJoined ? controller.leaveChannel : controller.joinChannel,
                            child: Text('${controller.isJoined ? 'Leave' : 'Join'} channel'),
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: controller.switchMicrophone,
                          child: Text('Microphone ${controller.openMicrophone ? 'on' : 'off'}'),
                        ),
                        ElevatedButton(
                          onPressed: controller.isJoined ? controller.switchSpeakerphone : null,
                          child:
                          Text(controller.enableSpeakerphone ? 'Speakerphone' : 'Earpiece'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary:Colors.red),
                          onPressed:(){Get.back();},
                            child: Text('Back'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
