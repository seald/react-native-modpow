package com.reactnativemodpow

import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.Promise
import java.math.BigInteger

class ModpowModule(reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "Modpow"
  }

  @ReactMethod(isBlockingSynchronousMethod = true)
  fun modPow(values: ReadableMap): String {
    val target = BigInteger(values.getString("target"), 16)
    val value = BigInteger(values.getString("value"), 16)
    val modifier = BigInteger(values.getString("modifier"), 16)
    return target.modPow(value, modifier).toString(16)
  }

}
