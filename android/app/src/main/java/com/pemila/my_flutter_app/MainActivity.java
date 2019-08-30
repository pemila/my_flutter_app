package com.pemila.my_flutter_app;

import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);
    new MethodChannel(getFlutterView(),"android_log")
            .setMethodCallHandler(
                    (methodCall, result) -> logPrint(methodCall)
            );
  }

  private void logPrint(MethodCall methodCall) {
    String tag = methodCall.argument("tag");
    String message = methodCall.argument("msg");
    assert message != null;
    switch (methodCall.method) {
      case "logV":  Log.v(tag, message); break;
      case "logD":  Log.d(tag, message); break;
      case "logI":  Log.i(tag, message); break;
      case "logW":  Log.w(tag, message); break;
      default:
        Log.e(tag, message);
    }
  }
}
