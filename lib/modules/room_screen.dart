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
            appBar: AppBar(title: const Text('Rooms'),),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                      'Space Title',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed:controller.isJoined ? controller.leaveChannel : controller.joinChannel,
                    child: Text('${controller.isJoined ? 'Leave' : 'Join'} this space'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: controller.switchMicrophone,
                          icon: controller.openMicrophone ?
                          const Icon(Icons.mic):
                          const Icon(Icons.mic_off,color: Colors.red,)
                      ),
                      IconButton(
                          onPressed: controller.isJoined ? controller.switchSpeakerphone : null,
                          icon: controller.enableSpeakerphone ?
                          const Icon(Icons.volume_up,):
                          const Icon(Icons.volume_off,color: Colors.grey,)
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}
