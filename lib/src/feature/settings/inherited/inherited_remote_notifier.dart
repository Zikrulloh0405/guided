// import "package:flutter/widgets.dart";
// import "remote_controller.dart";
// import "theme_controller.dart";
//
// @immutable
// class InheritedRemoteNotifier extends InheritedNotifier<RemoteConfigController> {
//   const InheritedRemoteNotifier({
//     // required final RemoteConfigController remoteController,
//     required super.child,
//     super.key,
//   }) : super(
//     // notifier: remoteController,
//   );
//
//   static RemoteConfigController? maybeOf(BuildContext context, {bool listen = true}) {
//     if (listen) {
//       return context.dependOnInheritedWidgetOfExactType<InheritedRemoteNotifier>()?.notifier;
//     } else {
//       final Widget? inhW = context.getElementForInheritedWidgetOfExactType<InheritedRemoteNotifier>()?.widget;
//       return inhW is InheritedRemoteNotifier ? inhW.notifier : null;
//     }
//   }
// }
