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

import 'dart:developer' as dev;
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'nav/i_vx_nav.dart';

/// Mixin [Vx] provides basic operations and utilities
mixin Vx {
  /// Pixel Values
  static const double dp0 = 0.0;
  static const double dp1 = 1.0;
  static const double dp2 = 2.0;
  static const double dp3 = 3.0;
  static const double dp4 = 4.0;
  static const double dp5 = 5.0;
  static const double dp6 = 6.0;
  static const double dp8 = 8.0;
  static const double dp10 = 10.0;
  static const double dp12 = 12.0;
  static const double dp14 = 14.0;
  static const double dp16 = 16.0;
  static const double dp20 = 20.0;
  static const double dp24 = 24.0;
  static const double dp32 = 32.0;
  static const double dp40 = 40.0;
  static const double dp48 = 48.0;
  static const double dp56 = 56.0;
  static const double dp64 = 64.0;

  ///Colors
  static const String blackHex = "#000000";
  static const String whiteHex = "#ffffff";

  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

  ///Gray Colors
  static const String grayHex50 = "#f9fafb";
  static const String grayHex100 = "#f3f4f6";
  static const String grayHex200 = "#e5e7eb";
  static const String grayHex300 = "#d1d5db";
  static const String grayHex400 = "#9ca3af";
  static const String grayHex500 = "#6b7280";
  static const String grayHex600 = "#4b5563";
  static const String grayHex700 = "#374151";
  static const String grayHex800 = "#1f2937";
  static const String grayHex900 = "#111827";

  static const Color gray50 = Color(0xFFf9fafb);
  static const Color gray100 = Color(0xFFf3f4f6);
  static const Color gray200 = Color(0xFFe5e7eb);
  static const Color gray300 = Color(0xFFd1d5db);
  static const Color gray400 = Color(0xFF9ca3af);
  static const Color gray500 = Color(0xFF6b7280);
  static const Color gray600 = Color(0xFF4b5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1f2937);
  static const Color gray900 = Color(0xFF111827);

  // Slate Colors
  static const String slateHex50 = "#f8fafc";
  static const String slateHex100 = "#f1f5f9";
  static const String slateHex200 = "#e2e8f0";
  static const String slateHex300 = "#cbd5e1";
  static const String slateHex400 = "#94a3b8";
  static const String slateHex500 = "#64748b";
  static const String slateHex600 = "#475569";
  static const String slateHex700 = "#334155";
  static const String slateHex800 = "#1e293b";
  static const String slateHex900 = "#0f172a";

  static const Color slate50 = Color(0xFFf8fafc);
  static const Color slate100 = Color(0xFFf1f5f9);
  static const Color slate200 = Color(0xFFe2e8f0);
  static const Color slate300 = Color(0xFFcbd5e1);
  static const Color slate400 = Color(0xFF94a3b8);
  static const Color slate500 = Color(0xFF64748b);
  static const Color slate600 = Color(0xFF475569);
  static const Color slate700 = Color(0xFF334155);
  static const Color slate800 = Color(0xFF1e293b);
  static const Color slate900 = Color(0xFF0f172a);

  // Zinc Colors
  static const String zincHex50 = "#fafafa";
  static const String zincHex100 = "#f4f4f5";
  static const String zincHex200 = "#e4e4e7";
  static const String zincHex300 = "#d4d4d8";
  static const String zincHex400 = "#a1a1aa";
  static const String zincHex500 = "#71717a";
  static const String zincHex600 = "#52525b";
  static const String zincHex700 = "#3f3f46";
  static const String zincHex800 = "#27272a";
  static const String zincHex900 = "#18181b";

  static const Color zinc50 = Color(0xFFfafafa);
  static const Color zinc100 = Color(0xFFf4f4f5);
  static const Color zinc200 = Color(0xFFe4e4e7);
  static const Color zinc300 = Color(0xFFd4d4d8);
  static const Color zinc400 = Color(0xFFa1a1aa);
  static const Color zinc500 = Color(0xFF71717a);
  static const Color zinc600 = Color(0xFF52525b);
  static const Color zinc700 = Color(0xFF3f3f46);
  static const Color zinc800 = Color(0xFF27272a);
  static const Color zinc900 = Color(0xFF18181b);

  // Stone Colors
  static const String stoneHex50 = "#FAFAF9";
  static const String stoneHex100 = "#F5F5F4";
  static const String stoneHex200 = "#E7E5E4";
  static const String stoneHex300 = "#D6D3D1";
  static const String stoneHex400 = "#A8A29E";
  static const String stoneHex500 = "#78716C";
  static const String stoneHex600 = "#57534E";
  static const String stoneHex700 = "#44403C";
  static const String stoneHex800 = "#292524";
  static const String stoneHex900 = "#1C1917";

  static const Color stone50 = Color(0xFFFAFAF9);
  static const Color stone100 = Color(0xFFF5F5F4);
  static const Color stone200 = Color(0xFFE7E5E4);
  static const Color stone300 = Color(0xFFD6D3D1);
  static const Color stone400 = Color(0xFFA8A29E);
  static const Color stone500 = Color(0xFF78716C);
  static const Color stone600 = Color(0xFF57534E);
  static const Color stone700 = Color(0xFF44403C);
  static const Color stone800 = Color(0xFF292524);
  static const Color stone900 = Color(0xFF1C1917);

  // Neutral Colors
  static const String neutralHex50 = "#fafafa";
  static const String neutralHex100 = "#f5f5f5";
  static const String neutralHex200 = "#e5e5e5";
  static const String neutralHex300 = "#d4d4d4";
  static const String neutralHex400 = "#a3a3a3";
  static const String neutralHex500 = "#737373";
  static const String neutralHex600 = "#525252";
  static const String neutralHex700 = "#404040";
  static const String neutralHex800 = "#262626";
  static const String neutralHex900 = "#171717";

  static const Color neutral50 = Color(0xFFfafafa);
  static const Color neutral100 = Color(0xFFf5f5f5);
  static const Color neutral200 = Color(0xFFe5e5e5);
  static const Color neutral300 = Color(0xFFd4d4d4);
  static const Color neutral400 = Color(0xFFa3a3a3);
  static const Color neutral500 = Color(0xFF737373);
  static const Color neutral600 = Color(0xFF525252);
  static const Color neutral700 = Color(0xFF404040);
  static const Color neutral800 = Color(0xFF262626);
  static const Color neutral900 = Color(0xFF171717);

  ///Red Colors
  static const String redHex50 = "#FEF2F2";
  static const String redHex100 = "#FEE2E2";
  static const String redHex200 = "#FECACA";
  static const String redHex300 = "#FCA5A5";
  static const String redHex400 = "#F87171";
  static const String redHex500 = "#EF4444";
  static const String redHex600 = "#DC2626";
  static const String redHex700 = "#B91C1C";
  static const String redHex800 = "#991B1B";
  static const String redHex900 = "#7F1D1D";

  static const Color red50 = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red400 = Color(0xFFF87171);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);

  ///Orange Colors
  static const String orangeHex50 = "#FFF7ED";
  static const String orangeHex100 = "#FFEDD5";
  static const String orangeHex200 = "#FED7AA";
  static const String orangeHex300 = "#FDBA74";
  static const String orangeHex400 = "#FB923C";
  static const String orangeHex500 = "#F97316";
  static const String orangeHex600 = "#EA580C";
  static const String orangeHex700 = "#C2410C";
  static const String orangeHex800 = "#9A3412";
  static const String orangeHex900 = "#7C2D12";

  static const Color orange50 = Color(0xFFFFF7ED);
  static const Color orange100 = Color(0xFFFFEDD5);
  static const Color orange200 = Color(0xFFFED7AA);
  static const Color orange300 = Color(0xFFFDBA74);
  static const Color orange400 = Color(0xFFFB923C);
  static const Color orange500 = Color(0xFFF97316);
  static const Color orange600 = Color(0xFFEA580C);
  static const Color orange700 = Color(0xFFC2410C);
  static const Color orange800 = Color(0xFF9A3412);
  static const Color orange900 = Color(0xFF7C2D12);

  ///Amber Colors
  static const String amberHex50 = "#FFFBEB";
  static const String amberHex100 = "#FEF3C7";
  static const String amberHex200 = "#FDE68A";
  static const String amberHex300 = "#FCD34D";
  static const String amberHex400 = "#FBBF24";
  static const String amberHex500 = "#F59E0B";
  static const String amberHex600 = "#D97706";
  static const String amberHex700 = "#B45309";
  static const String amberHex800 = "#92400E";
  static const String amberHex900 = "#78350F";

  static const Color amber50 = Color(0xFFFFFBEB);
  static const Color amber100 = Color(0xFFFEF3C7);
  static const Color amber200 = Color(0xFFFDE68A);
  static const Color amber300 = Color(0xFFFCD34D);
  static const Color amber400 = Color(0xFFFBBF24);
  static const Color amber500 = Color(0xFFF59E0B);
  static const Color amber600 = Color(0xFFD97706);
  static const Color amber700 = Color(0xFFB45309);
  static const Color amber800 = Color(0xFF92400E);
  static const Color amber900 = Color(0xFF78350F);

  ///Yellow Colors
  static const String yellowHex50 = "#FEFCE8";
  static const String yellowHex100 = "#FEF9C3";
  static const String yellowHex200 = "#FEF08A";
  static const String yellowHex300 = "#FDE047";
  static const String yellowHex400 = "#FACC15";
  static const String yellowHex500 = "#EAB308";
  static const String yellowHex600 = "#CA8A04";
  static const String yellowHex700 = "#A16207";
  static const String yellowHex800 = "#854D0E";
  static const String yellowHex900 = "#713F12";

  static const Color yellow50 = Color(0xFFFEFCE8);
  static const Color yellow100 = Color(0xFFFEF9C3);
  static const Color yellow200 = Color(0xFFFEF08A);
  static const Color yellow300 = Color(0xFFFDE047);
  static const Color yellow400 = Color(0xFFFACC15);
  static const Color yellow500 = Color(0xFFEAB308);
  static const Color yellow600 = Color(0xFFCA8A04);
  static const Color yellow700 = Color(0xFFA16207);
  static const Color yellow800 = Color(0xFF854D0E);
  static const Color yellow900 = Color(0xFF713F12);

  ///Lime Colors
  static const String limeHex50 = "#F7FEE7";
  static const String limeHex100 = "#ECFCCB";
  static const String limeHex200 = "#D9F99D";
  static const String limeHex300 = "#BEF264";
  static const String limeHex400 = "#A3E635";
  static const String limeHex500 = "#84CC16";
  static const String limeHex600 = "#65A30D";
  static const String limeHex700 = "#4D7C0F";
  static const String limeHex800 = "#3F6212";
  static const String limeHex900 = "#365314";

  static const Color lime50 = Color(0xFFF7FEE7);
  static const Color lime100 = Color(0xFFECFCCB);
  static const Color lime200 = Color(0xFFD9F99D);
  static const Color lime300 = Color(0xFFBEF264);
  static const Color lime400 = Color(0xFFA3E635);
  static const Color lime500 = Color(0xFF84CC16);
  static const Color lime600 = Color(0xFF65A30D);
  static const Color lime700 = Color(0xFF4D7C0F);
  static const Color lime800 = Color(0xFF3F6212);
  static const Color lime900 = Color(0xFF365314);

  ///Green Colors
  static const String greenHex50 = "#F0FDF4";
  static const String greenHex100 = "#DCFCE7";
  static const String greenHex200 = "#BBF7D0";
  static const String greenHex300 = "#86EFAC";
  static const String greenHex400 = "#4ADE80";
  static const String greenHex500 = "#22C55E";
  static const String greenHex600 = "#16A34A";
  static const String greenHex700 = "#15803D";
  static const String greenHex800 = "#166534";
  static const String greenHex900 = "#14532D";

  static const Color green50 = Color(0xFFF0FDF4);
  static const Color green100 = Color(0xFFDCFCE7);
  static const Color green200 = Color(0xFFBBF7D0);
  static const Color green300 = Color(0xFF86EFAC);
  static const Color green400 = Color(0xFF4ADE80);
  static const Color green500 = Color(0xFF22C55E);
  static const Color green600 = Color(0xFF16A34A);
  static const Color green700 = Color(0xFF15803D);
  static const Color green800 = Color(0xFF166534);
  static const Color green900 = Color(0xFF14532D);

  ///Emerald Colors
  static const String emeraldHex50 = "#ECFDF5";
  static const String emeraldHex100 = "#D1FAE5";
  static const String emeraldHex200 = "#A7F3D0";
  static const String emeraldHex300 = "#6EE7B7";
  static const String emeraldHex400 = "#34D399";
  static const String emeraldHex500 = "#10B981";
  static const String emeraldHex600 = "#059669";
  static const String emeraldHex700 = "#047857";
  static const String emeraldHex800 = "#065F46";
  static const String emeraldHex900 = "#064E3B";

  static const Color emerald50 = Color(0xFFECFDF5);
  static const Color emerald100 = Color(0xFFD1FAE5);
  static const Color emerald200 = Color(0xFFA7F3D0);
  static const Color emerald300 = Color(0xFF6EE7B7);
  static const Color emerald400 = Color(0xFF34D399);
  static const Color emerald500 = Color(0xFF10B981);
  static const Color emerald600 = Color(0xFF059669);
  static const Color emerald700 = Color(0xFF047857);
  static const Color emerald800 = Color(0xFF065F46);
  static const Color emerald900 = Color(0xFF064E3B);

  ///Teal Colors
  static const String tealHex50 = "#F0FDFA";
  static const String tealHex100 = "#CCFBF1";
  static const String tealHex200 = "#99F6E4";
  static const String tealHex300 = "#5EEAD4";
  static const String tealHex400 = "#2DD4BF";
  static const String tealHex500 = "#14B8A6";
  static const String tealHex600 = "#0D9488";
  static const String tealHex700 = "#0F766E";
  static const String tealHex800 = "#115E59";
  static const String tealHex900 = "#134E4A";

  static const Color teal50 = Color(0xFFF0FDFA);
  static const Color teal100 = Color(0xFFCCFBF1);
  static const Color teal200 = Color(0xFF99F6E4);
  static const Color teal300 = Color(0xFF5EEAD4);
  static const Color teal400 = Color(0xFF2DD4BF);
  static const Color teal500 = Color(0xFF14B8A6);
  static const Color teal600 = Color(0xFF0D9488);
  static const Color teal700 = Color(0xFF0F766E);
  static const Color teal800 = Color(0xFF115E59);
  static const Color teal900 = Color(0xFF134E4A);

  ///Cyan Colors
  static const String cyanHex50 = "#ECFEFF";
  static const String cyanHex100 = "#CFFAFE";
  static const String cyanHex200 = "#A5F3FC";
  static const String cyanHex300 = "#67E8F9";
  static const String cyanHex400 = "#22D3EE";
  static const String cyanHex500 = "#06B6D4";
  static const String cyanHex600 = "#0891B2";
  static const String cyanHex700 = "#0E7490";
  static const String cyanHex800 = "#155E75";
  static const String cyanHex900 = "#164E63";

  static const Color cyan50 = Color(0xFFECFEFF);
  static const Color cyan100 = Color(0xFFCFFAFE);
  static const Color cyan200 = Color(0xFFA5F3FC);
  static const Color cyan300 = Color(0xFF67E8F9);
  static const Color cyan400 = Color(0xFF22D3EE);
  static const Color cyan500 = Color(0xFF06B6D4);
  static const Color cyan600 = Color(0xFF0891B2);
  static const Color cyan700 = Color(0xFF0E7490);
  static const Color cyan800 = Color(0xFF155E75);
  static const Color cyan900 = Color(0xFF164E63);

  ///Sky Colors
  static const String skyHex50 = "#F0F9FF";
  static const String skyHex100 = "#E0F2FE";
  static const String skyHex200 = "#BAE6FD";
  static const String skyHex300 = "#7DD3FC";
  static const String skyHex400 = "#38BDF8";
  static const String skyHex500 = "#0EA5E9";
  static const String skyHex600 = "#0284C7";
  static const String skyHex700 = "#0369A1";
  static const String skyHex800 = "#075985";
  static const String skyHex900 = "#0C4A6E";

  static const Color sky50 = Color(0xFFF0F9FF);
  static const Color sky100 = Color(0xFFE0F2FE);
  static const Color sky200 = Color(0xFFBAE6FD);
  static const Color sky300 = Color(0xFF7DD3FC);
  static const Color sky400 = Color(0xFF38BDF8);
  static const Color sky500 = Color(0xFF0EA5E9);
  static const Color sky600 = Color(0xFF0284C7);
  static const Color sky700 = Color(0xFF0369A1);
  static const Color sky800 = Color(0xFF075985);
  static const Color sky900 = Color(0xFF0C4A6E);

  ///Blue Colors
  static const String blueHex50 = "#EFF6FF";
  static const String blueHex100 = "#DBEAFE";
  static const String blueHex200 = "#BFDBFE";
  static const String blueHex300 = "#93C5FD";
  static const String blueHex400 = "#60A5FA";
  static const String blueHex500 = "#3B82F6";
  static const String blueHex600 = "#2563EB";
  static const String blueHex700 = "#1D4ED8";
  static const String blueHex800 = "#1E40AF";
  static const String blueHex900 = "#1E3A8A";

  static const Color blue50 = Color(0xFFEFF6FF);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);

  ///Indigo Colors
  static const String indigoHex50 = "#EEF2FF";
  static const String indigoHex100 = "#E0E7FF";
  static const String indigoHex200 = "#C7D2FE";
  static const String indigoHex300 = "#A5B4FC";
  static const String indigoHex400 = "#818CF8";
  static const String indigoHex500 = "#6366F1";
  static const String indigoHex600 = "#4F46E5";
  static const String indigoHex700 = "#4338CA";
  static const String indigoHex800 = "#3730A3";
  static const String indigoHex900 = "#312E81";

  static const Color indigo50 = Color(0xFFEEF2FF);
  static const Color indigo100 = Color(0xFFE0E7FF);
  static const Color indigo200 = Color(0xFFC7D2FE);
  static const Color indigo300 = Color(0xFFA5B4FC);
  static const Color indigo400 = Color(0xFF818CF8);
  static const Color indigo500 = Color(0xFF6366F1);
  static const Color indigo600 = Color(0xFF4F46E5);
  static const Color indigo700 = Color(0xFF4338CA);
  static const Color indigo800 = Color(0xFF3730A3);
  static const Color indigo900 = Color(0xFF312E81);

  ///Violet Colors
  static const String violetHex50 = "#F5F3FF";
  static const String violetHex100 = "#EDE9FE";
  static const String violetHex200 = "#DDD6FE";
  static const String violetHex300 = "#C4B5FD";
  static const String violetHex400 = "#A78BFA";
  static const String violetHex500 = "#8B5CF6";
  static const String violetHex600 = "#7C3AED";
  static const String violetHex700 = "#6D28D9";
  static const String violetHex800 = "#5B21B6";
  static const String violetHex900 = "#4C1D95";

  static const Color violet50 = Color(0xFFF5F3FF);
  static const Color violet100 = Color(0xFFEDE9FE);
  static const Color violet200 = Color(0xFFDDD6FE);
  static const Color violet300 = Color(0xFFC4B5FD);
  static const Color violet400 = Color(0xFFA78BFA);
  static const Color violet500 = Color(0xFF8B5CF6);
  static const Color violet600 = Color(0xFF7C3AED);
  static const Color violet700 = Color(0xFF6D28D9);
  static const Color violet800 = Color(0xFF5B21B6);
  static const Color violet900 = Color(0xFF4C1D95);

  ///Purple Colors
  static const String purpleHex50 = "#FAF5FF";
  static const String purpleHex100 = "#F3E8FF";
  static const String purpleHex200 = "#E9D5FF";
  static const String purpleHex300 = "#D8B4FE";
  static const String purpleHex400 = "#C084FC";
  static const String purpleHex500 = "#A855F7";
  static const String purpleHex600 = "#9333EA";
  static const String purpleHex700 = "#7E22CE";
  static const String purpleHex800 = "#6B21A8";
  static const String purpleHex900 = "#581C87";

  static const Color purple50 = Color(0xFFFAF5FF);
  static const Color purple100 = Color(0xFFF3E8FF);
  static const Color purple200 = Color(0xFFE9D5FF);
  static const Color purple300 = Color(0xFFD8B4FE);
  static const Color purple400 = Color(0xFFC084FC);
  static const Color purple500 = Color(0xFFA855F7);
  static const Color purple600 = Color(0xFF9333EA);
  static const Color purple700 = Color(0xFF7E22CE);
  static const Color purple800 = Color(0xFF6B21A8);
  static const Color purple900 = Color(0xFF581C87);

  ///Fuchsia Colors
  static const String fuchsiaHex50 = "#FDF4FF";
  static const String fuchsiaHex100 = "#FAE8FF";
  static const String fuchsiaHex200 = "#F5D0FE";
  static const String fuchsiaHex300 = "#F0ABFC";
  static const String fuchsiaHex400 = "#E879F9";
  static const String fuchsiaHex500 = "#D946EF";
  static const String fuchsiaHex600 = "#C026D3";
  static const String fuchsiaHex700 = "#A21CAF";
  static const String fuchsiaHex800 = "#86198F";
  static const String fuchsiaHex900 = "#701A75";

  static const Color fuchsia50 = Color(0xFFFDF4FF);
  static const Color fuchsia100 = Color(0xFFFAE8FF);
  static const Color fuchsia200 = Color(0xFFF5D0FE);
  static const Color fuchsia300 = Color(0xFFF0ABFC);
  static const Color fuchsia400 = Color(0xFFE879F9);
  static const Color fuchsia500 = Color(0xFFD946EF);
  static const Color fuchsia600 = Color(0xFFC026D3);
  static const Color fuchsia700 = Color(0xFFA21CAF);
  static const Color fuchsia800 = Color(0xFF86198F);
  static const Color fuchsia900 = Color(0xFF701A75);

  ///Pink Colors
  static const String pinkHex50 = "#FDF2F8";
  static const String pinkHex100 = "#FCE7F3";
  static const String pinkHex200 = "#FBCFE8";
  static const String pinkHex300 = "#F9A8D4";
  static const String pinkHex400 = "#F472B6";
  static const String pinkHex500 = "#EC4899";
  static const String pinkHex600 = "#DB2777";
  static const String pinkHex700 = "#BE185D";
  static const String pinkHex800 = "#9D174D";
  static const String pinkHex900 = "#831843";

  static const Color pink50 = Color(0xFFFDF2F8);
  static const Color pink100 = Color(0xFFFCE7F3);
  static const Color pink200 = Color(0xFFFBCFE8);
  static const Color pink300 = Color(0xFFF9A8D4);
  static const Color pink400 = Color(0xFFF472B6);
  static const Color pink500 = Color(0xFFEC4899);
  static const Color pink600 = Color(0xFFDB2777);
  static const Color pink700 = Color(0xFFBE185D);
  static const Color pink800 = Color(0xFF9D174D);
  static const Color pink900 = Color(0xFF831843);

  ///Rose Colors
  static const String roseHex50 = "#FFF1F2";
  static const String roseHex100 = "#FFE4E6";
  static const String roseHex200 = "#FECDD3";
  static const String roseHex300 = "#FDA4AF";
  static const String roseHex400 = "#FB7185";
  static const String roseHex500 = "#F43F5E";
  static const String roseHex600 = "#E11D48";
  static const String roseHex700 = "#BE123C";
  static const String roseHex800 = "#9F1239";
  static const String roseHex900 = "#881337";

  static const Color rose50 = Color(0xFFFFF1F2);
  static const Color rose100 = Color(0xFFFFE4E6);
  static const Color rose200 = Color(0xFFFECDD3);
  static const Color rose300 = Color(0xFFFDA4AF);
  static const Color rose400 = Color(0xFFFB7185);
  static const Color rose500 = Color(0xFFF43F5E);
  static const Color rose600 = Color(0xFFE11D48);
  static const Color rose700 = Color(0xFFBE123C);
  static const Color rose800 = Color(0xFF9F1239);
  static const Color rose900 = Color(0xFF881337);

  /// All Fixed EdgeInsets
  static EdgeInsets m0 = EdgeInsets.zero;
  static EdgeInsets m1 = const EdgeInsets.all(dp1);
  static EdgeInsets m2 = const EdgeInsets.all(dp2);
  static EdgeInsets m4 = const EdgeInsets.all(dp4);
  static EdgeInsets m8 = const EdgeInsets.all(dp8);
  static EdgeInsets m12 = const EdgeInsets.all(dp12);
  static EdgeInsets m16 = const EdgeInsets.all(dp16);
  static EdgeInsets m20 = const EdgeInsets.all(dp20);
  static EdgeInsets m24 = const EdgeInsets.all(dp24);
  static EdgeInsets m32 = const EdgeInsets.all(dp32);
  static EdgeInsets m48 = const EdgeInsets.all(dp48);
  static EdgeInsets m64 = const EdgeInsets.all(dp64);

  /// Symmetric Fixed EdgeInsets
  static const mV0 = EdgeInsets.symmetric(vertical: dp0);
  static const mH0 = EdgeInsets.symmetric(horizontal: dp0);
  static const mV1 = EdgeInsets.symmetric(vertical: dp1);
  static const mH1 = EdgeInsets.symmetric(horizontal: dp1);
  static const mV2 = EdgeInsets.symmetric(vertical: dp2);
  static const mH2 = EdgeInsets.symmetric(horizontal: dp2);
  static const mV4 = EdgeInsets.symmetric(vertical: dp4);
  static const mH4 = EdgeInsets.symmetric(horizontal: dp4);
  static const mV8 = EdgeInsets.symmetric(vertical: dp8);
  static const mH8 = EdgeInsets.symmetric(horizontal: dp8);
  static const mH12 = EdgeInsets.symmetric(horizontal: dp12);
  static const mV12 = EdgeInsets.symmetric(vertical: dp12);
  static const mV16 = EdgeInsets.symmetric(vertical: dp16);
  static const mH16 = EdgeInsets.symmetric(horizontal: dp16);
  static const mV20 = EdgeInsets.symmetric(vertical: dp20);
  static const mH20 = EdgeInsets.symmetric(horizontal: dp20);
  static const mV24 = EdgeInsets.symmetric(vertical: dp24);
  static const mH24 = EdgeInsets.symmetric(horizontal: dp24);
  static const mV32 = EdgeInsets.symmetric(vertical: dp32);
  static const mH32 = EdgeInsets.symmetric(horizontal: dp32);
  static const mH48 = EdgeInsets.symmetric(horizontal: dp48);
  static const mV48 = EdgeInsets.symmetric(vertical: dp48);
  static const mV64 = EdgeInsets.symmetric(vertical: dp64);
  static const mH64 = EdgeInsets.symmetric(horizontal: dp64);

  /// [EdgeInsets] with custom [left], [right], [top] & [bottom] values
  static EdgeInsets mLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);

  /// [EdgeInsets] with custom symmetric [v] for vertical and [h] for horizontal value
  static EdgeInsets mSymmetric({double v = 0.0, double h = 0.0}) =>
      EdgeInsets.symmetric(
        vertical: v,
        horizontal: h,
      );

  /// [EdgeInsets] with custom [left], [right], [top] & [bottom] values
  static EdgeInsets mOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0}) =>
      EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);

  /// [ShapeBorder] with border radius 7.5
  static ShapeBorder roundedSm =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5));

  /// [ShapeBorder] with border radius 15
  static ShapeBorder rounded =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(15));

  /// [ShapeBorder] with border radius 30
  static ShapeBorder roundedLg =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30));

  /// [ShapeBorder] with custom border [radius]
  static ShapeBorder withRounded(double radius) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));

  // Emit a log event.
  ///
  /// This function was designed to map closely to the logging information
  /// collected by `package:logging`.
  ///
  /// - [message] is the log message
  /// - [time] (optional) is the timestamp
  /// - [sequenceNumber] (optional) is a monotonically increasing sequence number
  /// - [level] (optional) is the severity level (a value between 0 and 2000); see
  ///   the `package:logging` `Level` class for an overview of the possible values
  /// - [name] (optional) is the name of the source of the log message
  /// - [zone] (optional) the zone where the log was emitted
  /// - [error] (optional) an error object associated with this log event
  /// - [stackTrace] (optional) a stack trace associated with this log event

  static void log(dynamic msg, {bool? hasDottedLine}) {
    hasDottedLine ??= true;
    if (!(kDebugMode || kProfileMode)) {
      return;
    }
    final String message = msg.toString();
    if (hasDottedLine) {
      debugPrint(
          '👇🏻┌------------------------------------------------------------------------------👨🏻‍💻');
    }
    const int limitLength = 800;
    if (message.length < limitLength) {
      debugPrint('$msg');
    } else {
      final StringBuffer outStr = StringBuffer();
      for (int index = 0; index < message.length; index++) {
        outStr.write(message[index]);
        if (index % limitLength == 0 && index != 0) {
          debugPrint(outStr.toString());
          outStr.clear();
          final int lastIndex = index + 1;
          if (message.length - lastIndex < limitLength) {
            final String remainderStr =
                message.substring(lastIndex, message.length);
            debugPrint(remainderStr);
            break;
          }
        }
      }
    }
    if (hasDottedLine) {
      debugPrint(
          '👆🏻└------------------------------------------------------------------------------👨🏻‍💻');
    }
  }

  /// Send a reference to [object] to any attached debuggers.
  ///
  /// Debuggers may open an inspector on the object. Returns the argument.
  static void inspect(Object object) => dev.inspect(object);

  ///Checks whether release mode or not
  static bool get isReleaseMode => kReleaseMode;

  ///Checks whether debug mode or not
  static bool get isDebugMode => kDebugMode;

  ///Checks whether profile mode or not
  static bool get isProfileMode => kProfileMode;

  ///Checks whether web or not
  static bool get isWeb => kIsWeb;

  ///Checks whether the device is android or not
  static bool get isAndroid =>
      !isWeb && defaultTargetPlatform == TargetPlatform.android;

  ///Checks whether the device is iOS or not
  static bool get isIOS =>
      !isWeb && defaultTargetPlatform == TargetPlatform.iOS;

  ///Checks whether the device is a mobile OS or not
  static bool get isMobileOS => !isWeb && (isAndroid || isIOS);

  ///Checks whether the device is linux or not
  static bool get isLinux =>
      !isWeb && defaultTargetPlatform == TargetPlatform.linux;

  ///Checks whether the device is macOS or not
  static bool get isMacOS =>
      !isWeb && defaultTargetPlatform == TargetPlatform.macOS;

  ///Checks whether the device is windows or not
  static bool get isWindows =>
      !isWeb && defaultTargetPlatform == TargetPlatform.windows;

  ///Checks whether the device is fuchsia or not
  static bool get isFuchsia =>
      !isWeb && defaultTargetPlatform == TargetPlatform.fuchsia;

  ///Checks whether desktop or not
  static bool get isDesktop =>
      !isWeb &&
      (defaultTargetPlatform == TargetPlatform.linux ||
          defaultTargetPlatform == TargetPlatform.macOS ||
          defaultTargetPlatform == TargetPlatform.windows);

  /// Get ascii from the hex value
  static String hexToAscii(String hex) {
    final List<String> splitted = [];
    for (int i = 0; i < hex.length; i = i + 2) {
      splitted.add(hex.substring(i, i + 2));
    }
    final String asciiText = List.generate(splitted.length,
        (i) => String.fromCharCode(int.parse(splitted[i], radix: 16))).join();
    return asciiText;
  }

  /// Get color from the hex value
  static Color hexToColor(String code) {
    final buffer = StringBuffer();
    if (code.length == 6 || code.length == 7) buffer.write('ff');
    buffer.write(code.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static MaterialColor getMaterialColor(Color color) {
    final int red = color.red;
    final int green = color.green;
    final int blue = color.blue;

    final Map<int, Color> shades = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };

    return MaterialColor(color.value, shades);
  }

  /// Get Color in [int]
  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    hexColor = hexColor.replaceAll('0X', '');
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  /// Get Random Non-Primary Color
  static Color get randomOpaqueColor =>
      Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

  /// Get Random Primary Color
  static Color get randomPrimaryColor =>
      Colors.primaries[Random().nextInt(Colors.primaries.length)];

  /// Get Random Non-Primary Color
  static Color get randomColor => Color.fromARGB(
      100, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255));

  /// Uses [PathUrlStrategy] on the web, which removes hashes from URLs. This
  /// must be called at app startup, before `runApp` is called.
  ///
  /// Calling this method does nothing when not running on the web.
  static void setPathUrlStrategy() {
    if (kIsWeb) {
      VxNav.setPathUrlStrategy(); // coverage:ignore-line
    }
  }

  static void setHashUrlStrategy() {
    if (kIsWeb) {
      VxNav.setHashUrlStrategy(); // coverage:ignore-line
    }
  }

  /// Copy to pasteboard
  static Future<void> toClipboard(String data) async =>
      await Clipboard.setData(ClipboardData(text: data));
}

/// [VxInternalStore] is the internal store for the app.

typedef VxAppBuilder = Widget Function(BuildContext context, VxAppData vxData);

class VxAppData {
  static final VxAppData _singleton = VxAppData._internal();

  factory VxAppData() {
    return _singleton;
  }
  VxAppData._internal();

  // Bool to check if dark mode is enabled or not
  bool isDarkMode = false;
}

/// Wrap your app with [VxApp] to use [VxState] and [VxStore].
class VxApp extends StatefulWidget {
  const VxApp(
      {super.key,
      required this.builder,
      required this.store,
      this.interceptors = const []});
  final VxAppBuilder? builder;
  final VxStore store;
  final List<VxInterceptor>? interceptors;

  @override
  State<VxApp> createState() => _VxAppState();
}

class _VxAppState<T> extends State<VxApp> {
  final appData = VxAppData();
  @override
  Widget build(BuildContext context) {
    return VxState(
      store: widget.store,
      interceptors: widget.interceptors!,
      child: VxConsumer(
          mutations: const {VxDarkModeMutation},
          builder: (context, _, status) => widget.builder!(context, appData)),
    );
  }
}
