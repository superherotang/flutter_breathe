import 'package:flutter/material.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

class PickMethod {
  Future<List<AssetEntity>?> pickImages(
      BuildContext context, List<AssetEntity> assets) async {
    const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: RequestType.image,
        maxAssets: 9,
        selectedAssets: assets,
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
                        const CameraPickerConfig(enableRecording: false),
                  );
                }

                final AssetEntity? result = await _pickFromCamera(context);
                if (result == null) {
                  return;
                }
                final AssetPicker<AssetEntity, AssetPathEntity> picker =
                    context.findAncestorWidgetOfExactType()!;
                final DefaultAssetPickerBuilderDelegate builder =
                    picker.builder as DefaultAssetPickerBuilderDelegate;
                final DefaultAssetPickerProvider p = builder.provider;
                p.currentPath = await p.currentPath!.obtainForNewProperties();
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
    return result;
  }

  Future<List<AssetEntity>?> pickVideo(
      BuildContext context, List<AssetEntity> assets) async {
    const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: RequestType.video,
        maxAssets: 1,
        selectedAssets: assets,
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
                    pickerConfig: const CameraPickerConfig(
                        enableRecording: true,
                        onlyEnableRecording: true,
                        enableTapRecording: true),
                  );
                }

                final AssetEntity? result = await _pickFromCamera(context);
                if (result == null) {
                  return;
                }
                final AssetPicker<AssetEntity, AssetPathEntity> picker =
                    context.findAncestorWidgetOfExactType()!;
                final DefaultAssetPickerBuilderDelegate builder =
                    picker.builder as DefaultAssetPickerBuilderDelegate;
                final DefaultAssetPickerProvider p = builder.provider;
                p.currentPath = await p.currentPath!.obtainForNewProperties();
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
    return result;
  }

    Future<List<AssetEntity>?> pickAudio(
      BuildContext context, List<AssetEntity> assets) async {
    const AssetPickerTextDelegate textDelegate = AssetPickerTextDelegate();
    final List<AssetEntity>? result = await AssetPicker.pickAssets(
      context,
      pickerConfig: AssetPickerConfig(
        requestType: RequestType.audio,
        maxAssets: 1,
        selectedAssets: assets,
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
                    pickerConfig: const CameraPickerConfig(
                        enableRecording: true,
                        onlyEnableRecording: true,
                        enableTapRecording: true),
                  );
                }

                final AssetEntity? result = await _pickFromCamera(context);
                if (result == null) {
                  return;
                }
                final AssetPicker<AssetEntity, AssetPathEntity> picker =
                    context.findAncestorWidgetOfExactType()!;
                final DefaultAssetPickerBuilderDelegate builder =
                    picker.builder as DefaultAssetPickerBuilderDelegate;
                final DefaultAssetPickerProvider p = builder.provider;
                p.currentPath = await p.currentPath!.obtainForNewProperties();
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
    return result;
  }
}
