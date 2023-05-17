/*
 * Copyright 2020 Pawan Kumar. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:velocity_x/velocity_x.dart';

class ItemModel {
  String title;
  IconData icon;
  ItemModel(this.title, this.icon);
}

void main() {
  group("Popup Menu test", () {
    testWidgets("Popup Menu widget test", (WidgetTester tester) async {
      const Key key = Key('key');
      await tester.pumpWidget(MaterialApp(
          home: VxPopupMenu(
        key: key,
        menuBuilder: () => ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: IntrinsicWidth(
            child: VStack(
              [
                ItemModel(
                  "Chat",
                  Icons.chat_bubble,
                ),
                ItemModel(
                  "Add",
                  Icons.group_add,
                )
              ]
                  .map(
                    (item) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        Vx.log(item.title);
                      },
                      child: HStack(
                        [
                          Icon(
                            item.icon,
                            size: 15,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            )
                                .box
                                .margin(Vx.mOnly(left: 10))
                                .padding(Vx.mSymmetric(v: 10))
                                .make(),
                          ),
                        ],
                      ).box.height(40).padding(Vx.mSymmetric(h: 20)).make(),
                    ),
                  )
                  .toList(),
              crossAlignment: CrossAxisAlignment.stretch,
            ),
          )
              .box
              .color(
                const Color(0xFF4C4C4C),
              )
              .make(),
        ),
        clickType: VxClickType.singleClick,
        verticalMargin: -10,
        child: Container(
          padding: Vx.m20,
          child: const Icon(Icons.menu),
        ),
      )));

      expect(find.byKey(key), findsOneWidget);
      await tester.tap(find.byKey(key));
      await tester.pumpAndSettle();
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(MaterialApp),
        matchesGoldenFile('overlay.png'),
      );
      expect(find.byType(Icon), findsNWidgets(3));
      expect(find.byIcon(Icons.chat_bubble), findsOneWidget);
    });
  });
}
