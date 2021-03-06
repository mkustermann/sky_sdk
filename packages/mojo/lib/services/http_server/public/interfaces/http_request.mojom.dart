// Copyright 2014 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

library http_request.mojom;

import 'dart:async';

import 'package:mojo/public/dart/bindings.dart' as bindings;
import 'package:mojo/public/dart/core.dart' as core;


class HttpRequest extends bindings.Struct {
  static const int kStructSize = 40;
  static const bindings.StructDataHeader kDefaultStructInfo =
      const bindings.StructDataHeader(kStructSize, 0);
  String relativeUrl = null;
  String method = "GET";
  Map<String, String> headers = null;
  core.MojoDataPipeConsumer body = null;

  HttpRequest() : super(kStructSize);

  static HttpRequest deserialize(bindings.Message message) {
    return decode(new bindings.Decoder(message));
  }

  static HttpRequest decode(bindings.Decoder decoder0) {
    if (decoder0 == null) {
      return null;
    }
    HttpRequest result = new HttpRequest();

    var mainDataHeader = decoder0.decodeStructDataHeader();
    if ((mainDataHeader.size < kStructSize) ||
        (mainDataHeader.version < 0)) {
      throw new bindings.MojoCodecError('Malformed header');
    }
    {
      
      result.relativeUrl = decoder0.decodeString(8, false);
    }
    {
      
      result.method = decoder0.decodeString(16, false);
    }
    {
      
      var decoder1 = decoder0.decodePointer(24, true);
      if (decoder1 == null) {
        result.headers = null;
      } else {
        decoder1.decodeDataHeaderForMap();
        List<String> keys0;
        List<String> values0;
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(bindings.kUnspecifiedArrayLength);
            keys0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              keys0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        {
          
          var decoder2 = decoder1.decodePointer(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, false);
          {
            var si2 = decoder2.decodeDataHeaderForPointerArray(keys0.length);
            values0 = new List<String>(si2.numElements);
            for (int i2 = 0; i2 < si2.numElements; ++i2) {
              
              values0[i2] = decoder2.decodeString(bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i2, false);
            }
          }
        }
        result.headers = new Map<String, String>.fromIterables(
            keys0, values0);
      }
    }
    {
      
      result.body = decoder0.decodeConsumerHandle(32, true);
    }
    return result;
  }

  void encode(bindings.Encoder encoder) {
    var encoder0 = encoder.getStructEncoderAtOffset(kDefaultStructInfo);
    
    encoder0.encodeString(relativeUrl, 8, false);
    
    encoder0.encodeString(method, 16, false);
    
    if (headers == null) {
      encoder0.encodeNullPointer(24, true);
    } else {
      var encoder1 = encoder0.encoderForMap(24);
      int size0 = headers.length;
      var keys0 = headers.keys.toList();
      var values0 = headers.values.toList();
      
      {
        var encoder2 = encoder1.encodePointerArray(keys0.length, bindings.ArrayDataHeader.kHeaderSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < keys0.length; ++i1) {
          
          encoder2.encodeString(keys0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
      
      {
        var encoder2 = encoder1.encodePointerArray(values0.length, bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize, bindings.kUnspecifiedArrayLength);
        for (int i1 = 0; i1 < values0.length; ++i1) {
          
          encoder2.encodeString(values0[i1], bindings.ArrayDataHeader.kHeaderSize + bindings.kPointerSize * i1, false);
        }
      }
    }
    
    encoder0.encodeConsumerHandle(body, 32, true);
  }

  String toString() {
    return "HttpRequest("
           "relativeUrl: $relativeUrl" ", "
           "method: $method" ", "
           "headers: $headers" ", "
           "body: $body" ")";
  }
}

