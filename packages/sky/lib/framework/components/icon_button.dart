// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import '../fn.dart';
import 'icon.dart';

class IconButton extends Component {
  static Style _style = new Style('''
    padding: 8px;''');

  String icon;
  GestureEventListener onGestureTap;

  IconButton({ String icon: '', this.onGestureTap })
    : super(key: icon), icon = icon;

  Node build() {
    return new EventTarget(
      new StyleNode(new Icon(type: icon, size: 24), _style),
      onGestureTap: onGestureTap);
  }
}
