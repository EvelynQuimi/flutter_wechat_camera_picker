// Copyright 2019 The FlutterCandies author. All rights reserved.
// Use of this source code is governed by an Apache license that can be found
// in the LICENSE file.

import 'dart:async' show FutureOr;
import 'dart:io' show File;

import 'package:camera/camera.dart' show CameraController, CameraValue, XFile;
import 'package:flutter/widgets.dart' show BuildContext, Widget;

import 'enums.dart';

/// {@template wechat_camera_picker.EntitySaveCallback}
/// The callback type define for saving entity in the viewer.
/// 在查看器中保存图片时的回调
///
/// ### Notice about the implementation
///  * After the callback is implemented, the default saving method
///    won't called anymore.
///  * Don't call `Navigator.of(context).pop/maybePop` without popping `null` or
///    `AssetEntity`, otherwise there will be a type cast error occurred.
///
/// ### 在实现时需要注意
///  * 实现该方法后，原本的保存方法不会再被调用；
///  * 不要使用 `Navigator.of(context).pop/maybePop` 返回 `null` 或 `AssetEntity`
///    以外类型的内容，否则会抛出类型转换异常。
/// {@endtemplate}
typedef EntitySaveCallback = FutureOr<dynamic> Function(
  BuildContext context,
  CameraPickerViewType viewType,
  File file,
);

/// {@template wechat_camera_picker.CameraErrorHandler}
/// The error handler when any error occurred during the picking process.
/// 拍摄照片过程中的自定义错误处理
/// {@endtemplate}
typedef CameraErrorHandler = void Function(
  Object error,
  StackTrace? stackTrace,
);

/// {@template wechat_camera_picker.ForegroundBuilder}
/// Build the foreground/overlay widget with the given [cameraValue].
/// 根据给定的 [cameraValue] 构建自定义的前景 widget
/// {@endtemplate}
typedef ForegroundBuilder = Widget Function(
  BuildContext context,
  CameraValue cameraValue,
);

/// {@template wechat_camera_picker.PreviewTransformBuilder}
/// Build the transformed widget with the given [controller].
/// 根据给定的 [controller] 构建自定义的变换 widget
/// {@endtemplate}
typedef PreviewTransformBuilder = Widget? Function(
  BuildContext context,
  CameraController controller,
  Widget child,
);

/// {@template wechat_camera_picker.XFileCapturedCallback}
/// The callback type definition when the XFile is captured by the camera.
/// 拍摄文件生成后的回调
///
/// Return `true` if it has handled arguments.
/// 如果在回调中已经进行了处理，请返回 `true`。
///
/// ### Notice about the implementation
///  * After the callback is implemented and returned `true`,
///    the default viewer page will not be presented anymore.
///
/// ### 在实现时需要注意
///  * 实现了该方法且返回 `true` 后，默认的预览页面不会再出现。
/// {@endtemplate}
typedef XFileCapturedCallback = bool Function(XFile, CameraPickerViewType);
