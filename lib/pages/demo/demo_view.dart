import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'demo_controller.dart';

class DemoView extends GetView<DemoController> {
  const DemoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ElevatedButton(
        child: Text("asd"),
        onPressed: () async {
          const AssetPickerTextDelegate textDelegate =
              AssetPickerTextDelegate();
          final List<AssetEntity>? result = await AssetPicker.pickAssets(
            context,
            pickerConfig: AssetPickerConfig(
              requestType: RequestType.common,
              specialItemPosition: SpecialItemPosition.prepend,
              specialItemBuilder: (
                BuildContext context,
                AssetPathEntity? path,
                int length,
              ) {
                if (path?.isAll != true) {
                  return null;
                }
                return Semantics(
                  label: textDelegate.sActionUseCameraHint,
                  button: true,
                  onTapHint: textDelegate.sActionUseCameraHint,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      Future<AssetEntity?> _pickFromCamera(BuildContext c) {
                        return CameraPicker.pickFromCamera(
                          c,
                          pickerConfig:
                              const CameraPickerConfig(enableRecording: true),
                        );
                      }

                      final AssetEntity? result =
                          await _pickFromCamera(context);
                      if (result == null) {
                        return;
                      }
                      final AssetPicker<AssetEntity, AssetPathEntity> picker =
                          context.findAncestorWidgetOfExactType()!;
                      final DefaultAssetPickerBuilderDelegate builder =
                          picker.builder as DefaultAssetPickerBuilderDelegate;
                      final DefaultAssetPickerProvider p = builder.provider;
                      p.currentPath =
                          await p.currentPath!.obtainForNewProperties();
                      await p.switchPath(p.currentPath!);
                      p.selectAsset(result);
                    },
                    child: const Center(
                      child: Icon(Icons.camera_enhance, size: 42.0),
                    ),
                  ),
                );
              },
            ),
          );

          print(result);
        },
      ),
    );
  }
}

                 















// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import 'demo_controller.dart';

// class DemoView extends GetView<DemoController> {
//   const DemoView({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('WeChat Camera Picker Demo')),
//       body: Stack(
//         children: <Widget>[
//           if (controller.entity?.value != null &&
//               controller.data?.value != null)
//             Positioned.fill(
//                 child:
//                     Image.memory(controller.data!.value, fit: BoxFit.contain))
//           else if (controller.entity?.value != null &&
//               controller.data?.value == null)
//             const Center(child: CircularProgressIndicator())
//           else
//             const Center(child: Text('Click the button to start picking.')),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => controller.pick(context),
//         tooltip: 'Increment',
//         child: const Icon(Icons.camera_enhance),
//       ),
//     );
//   }
// }
