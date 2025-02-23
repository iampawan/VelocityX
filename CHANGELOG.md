## [4.3.1] - Feb 23, 2025
- Fixed enableFeedback bug with VxUniversal

## [4.3.0] - Jan 23, 2025

- Flutter 3.27 compatibility added
- Bug fixes and improvements

## [4.2.1] - May 27, 2024

- WidgetState reverted back to MaterialState for compatibility with Flutter <3.22

## [4.2.0] - May 21, 2024

- Flutter 3.22 support

## [4.1.2] - Nov 23, 2023

- Bug Fixes

## [4.1.1] - July 24, 2023

- Optimized rebuild for MediaQuery property dependent widgets
- Replaced MediaQuery.of(context).size with MediaQuery.sizeOf(context)
- Replaced MediaQuery.of(context).viewInsets with MediaQuery.viewInsetsOf(context)
- Fix dropdown button test
- Replace properties of mediaquery data of context extension
- Added more window size checks in Context extension
- Fixed issue with ordered and unordered list
- Fixed issue with captilize extension method

## [4.1.0] - May 29, 2023

- [New] VxAdaptive widget for responsive screen adaption and scaling.
- [New] VxFlip widget for flipping effect.
- [New] VxStat widget for common stats view.
- [New] New extension methods for context, color, duration, and function etc.
- [New] debounce() and throttle() extension methods added along with .foregroundColor().
- [New] More boolean for device and OS checks.
- [Breaking] VxDiscList and VxDecimalList are now VxUnorderedList and VxOrderedList with more options.
- VStack, HStack, VxTimeline, VxUniversal etc improved.
- Demo updated.
- Many Bug Fixes.

## [4.0.0] - May 22, 2023

- [New] VxFilter to support filters on your widgets.
- [New] Dark Mode support added with VxApp.
- [New] VxDarkModeButton widget added for one click dark mode.
- [New] VxNone widget with when props for widgets.
- [New] Padding & margin of 48 added.
- [New] Vx Stepper is now Material 3.
- [New] Upgraded for Flutter 3.10 and Material 3.
- [Breaking] Saying bye to VxNavigator. Use go_router instead.
- [Breaking] Saying bye to VxAppBar. Use material AppBar instead.
- VxTable, VxDialog, BottomSheet, VxTextfield etc improved.
- Demo updated.
- Many bug fixes.

## [3.6.1] - Apr 25, 2023

- Upgraded intl version to 0.18.1
- [Breaking] Upgraded to flutter 3
- fix tests
- revert intl plugin to support older projects
- add const contructor to flex
- removed unnecessary_non_null_assertion,unnecessary_null_comparison
- removed useInheritedMediaQuery as depreceated
- window' replaced with PlatformDispatcher as depreceated
- 'toolbarOptions' is deprecated and replaced with `contextMenuBuilder`.

## [3.6.0] - Oct 12, 2022

- New Widgets - VxJson (Json tree widget), VxZoom (Instagram like pinch to zoom), VxAdaptiveNavigation (Navigation rail on large device & Nav Bar for phones), VxSwitcher, VxUniversal (Super widget for everything), VxToggleRotate and VxHoverToggle (Change widget on Hover).
- New extension methods are added for List, String, Num, Context, Map, Widgets, BoxConstraints and Global Key etc.
- Added a method to copy data to the clipboard.
- onTap now has a Mouse Region for better UX on Web & Desktop.
- Vx.log now has a better UI for displaying logs only on debug mode.
- Example app is improved.
- Bug Fixes and more improvements.

## [3.5.1] - May 25, 2022

- [Breaking] Colors renamed as per Tailwind BlueGray -> Slate, TrueGray -> Neutral, CoolGray -> Gray, Gray -> Zinc, WarmGray -> Stone, LightBlue -> Sky.
- [New] VxStateSwitcher widget added.
- [New] Web3 utils added. Check VxWeb3 and some new extension methods.
- VxResponsive improved.
- VxState updated.
- Compatible with Flutter 3.
- Minor bug fixes.

## [3.4.0] - Jan 14, 2022

- New: .disabled & .clipOval widget extension added & isDarkMode context extension added.
- context.locale is now context.vxlocale.
- VxText got shadow support.
- More string extensions added for json etc.
- Many issues solved (Check closed github issues).
- Minor bug fixes.

## [3.3.0] - June 17, 2021

- New: VxTable & .table extension.
- .scale() method added for text.
- hexToAscii utility added.
- [Breaking] VxAnimator is now removed. Use animator package rather.
- Ticker Mixin issue fixed.
- Minor bug fixes.

## [3.2.0] - May 26, 2021

- Added VxGlassmorphic widget.
- Added customRounded, topLeftRounded,topRightRounded,bottomLeftRounded etc for VxBox.

## [3.1.1] - May 25, 2021

VxText color issue fixed.

## [3.1.0] - May 23, 2021

- New Extensions - .shaderMask() and .safeArea()
- Added text theme support to textspan
- Gradient field exposed for VxSkeleton
- VxTextField now uses TextFormField
- Examples updated
- Bug Fixes

### VxNavigator 2.0 Updates

- Regex support added for URIs
- VxRoutePage for transitions
- VxObserver added for checking route changes
- Bug Fixes

### VxState Updates

- [Breaking] VxBuilder & VxConsumer now returns store.
- Store can be directly accessed as MyStore store - VxState.store
- Status for all async operations
- Bug Fixes

## [3.0.0] - April 19, 2021

- New Widget - VxPinView
- New Dialogs - VxDialogs
- New BottomSheets - VxBottomSheet
- New Preview Widget - VxPreview
- New Drawers - VxDrawer
- Added cursor and other props to VxTextField
- Bug Fixes for VxTextField
- Breaking - Desktop support added for VxPlatform
- Minor Bug Fixes
- Examples updated

## [2.6.1] - April 01, 2021

- Fixed issue with ZStack.
- Fixed issue with isEmptyOrNull String.

## [2.6.0] - March 16, 2021

- VxNavigator (Navigator 2.0) support added.
- AStack widget added.

## [2.5.0] - March 13, 2021

- VxAnimator added.
- VxLayout added for responsiveness.

## [2.4.0-nullsafety.0] - March 11, 2021

- Direct Text Themes support
- Extended & Improved Color Palette
- New Demo Added
- Added more gradient options
- size percentage widget added for sizedbox and container
- Flat button changed to Material button
- Fixed nullOK issues
- Added more clippers
- Added align() method for text and richtext
- Improvement in textfield
- Added VxState
- Minor bug fixes and improvements

## [2.3.1-nullsafety.0] - Decemeber 29, 2020

- Introducing VxShapes with ext: VxCircle -> .circle(), VxEllipse -> .ellipse(), VxCapsule -> .capsule(), VxContinuousRectangle -> .continuousRectangle(), VxBevel -> .bevel(), VxTriangle -> .triangle() and VxTicket -> .ticket()
- VxPlatform added to create a common widget for different platforms.
- Added widget support to badge and new positions.
- Added isIntrinsic prop for some widgets like DataTable which doesn't support layout builder.
- Vx.getColorFromHex() added to convert hex to color.
- Label Style and TextStyle added to the VxTextField.
- Fixed shadow issues and introduced more shadows for box/container or similar widgets.
- More Extensions - context : screenDensity, string: isNumber(),isLetter(), isSymbol(), isCreditCardValid(), bool: toggle(), Iterable: sumBy, sumByDouble, averageBy, filter and more.
- Widget Extensions - stroke(), fractionalBox(), px(val), py(val), rotate60(), rotateN60(), clipHalf(), aspectRatio(), and positioned().
- withAnimation returns AnimationController to control and dispose it manually.
- Many Bug Fixes.

## [2.0.0-nullsafety.1] - November 22, 2020

- BREAKING: opt into null safety
- upgrade Dart SDK constraints to >=2.12.0-0 <3.0.0
- upgrade Flutter SDK constraints to >=1.24.0-0 <2.0.0

## [1.0.1] - November 21, 2020

- Added isFastScrollingEnabled to fast scroll the VxSwiper or swiper ext.
- Added .fontWeight method for texts to set custom font weight.
- Fixed an issue with compilation with some of the flutter versions.
- Fixed an issue with VxScrollVertical and VxScrollHorizontal where child was not working.
- Minor bug fixes.

## [1.0.0] - November 03, 2020

- Added VxTimeline widget.
- Added VxSkeleton widget with skeleton extension.
- Added VxMarquee widget with marquee extension.
- Added VxBadge widget with badge extension.
- Added VxToast widget with showToast & showLoading context extension.
- Extensions for ScrollController added.
- withAnimation & withRepeatAnimation added.
- onTap, onInkTap series added for more ease.
- VxTextField added.
- VxAnimatedHeight added.
- Offset, preferredSize, sliverBoxAdapter extensions added.
- vxPreviewRoute added along with materialRoute & cupertinoRoute extensions.
- expand,backgroundColor,cornerRadius,keepAlive,onFeedBackTap extensions added.
- Mouse Region extension methods added.
- Material Extension added.

## [0.5.0] - October 11, 2020

- Compatible with latest flutter versions.
- numCurrency and numCurrencyWithLocale() added.
- circularAssetImage, circularNetworImage, circularAssetShadowImage added to string extension methods.
- orientation prop added to context extensions.
- randomColor, randomOpaqueColor and randomPrimaryColor added to Vx.
- VxPopupMenu widget and popupMenu ext Added.
- Added timeAgo ext for DateTime.
- New extension methods added for Context - mediaquery, theme, navigator, form, scaffold and overlay etc.
- New extension methods added for Icon.
- New props for VxBox - withContraints(), foregroundDecoration.
- New props for VxText family - softWrap(), minFontSize(), maxFontSize(),stepGranularity(),overflowReplacement(),overflow, strutStyle(), wrapWords(), wordSpacing() and textBaseLine(),
- Documentations Improved.
- [BREAKING] Overflow has been removed and clip has been added with default as Clipbehavior.None. It can affect all the widgets which uses Stack or ZStack.
- [BREAKING] ScrollVertical and ScrollHorizontal has been renamed to VxScrollVertical and VxScrollHorizontal to maintain consistency.

## [0.4.1] - July 15, 2020

- Card color issue fixed.
- HStack and VStack now has cross alignment as center by default.
- Flags added to check debug, release, profile and web mode using Vx class.

## [0.4.0] - May 18, 2020

- Uses latest material design text specs.
- Shadow color method added to card.
- New transform extensions - flipX, flipY, flipHorizontal, flipVertical, customScale
- New theme extensions - lightTheme, darkTheme, customTheme
- New navigator extensions - nextPage, nextReplacementPage, nextAndRemoveUntilPage, pop.
- Bug fixes.
- Readme updated.

## [0.3.4] - May 04, 2020

- Fixed transform extension issues.
- Added clip prop to the card and box.
- Added guard similar to Swift.
- Many more extensions added for context, iterable and num like duration, sum, themedata etc.
- Bug Fixes

## [0.3.2] - April 13, 2020

- Added VxTextDropDown Widget with textDropDown() ext.
- Added VxRandomBox Widget with randomBox() ext.
- Added Vx.log(), Vx.inspect() utilities.
- Added Vx.isReleaseMode, Vx.isProfileMode, Vx.isDebugMode, Vx.isWeb utilities..
- Example App updated.
- Bug Fixes

## [0.3.1] - April 10, 2020

- Added VxSwiper Widget with swiper() ext.
- Added VxAppBar Widget with search functionality.
- Added VxShimmar Widget with shimmer() ext.
- Added size(), square(), withDecoration() methods to boxes.
- isMobile prop added for context.
- Example App updated.
- Bug Fixes

## Breaking Change[0.3.0] - April 07, 2020

- VxCard Introduced
- withShadow method for box added.
- withGradient method for box added.
- scaleFactor for text improved.
- withRounded method added for Vx.

These classes are renamed (Breaking change).

1. VelocityX -> Vx

1. VelocityAnimatedBox -> VxAnimatedBox
1. VelocityConditional -> VxConditional
1. VelocityConditionalSwitch -> VxConditionalSwitch
1. VelocityEnsureVisibleWhenFocused -> VxEnsureVisibleWhenFocused

1. VelocityDevice -> VxDevice
1. VelocityResponsive -> VxResponsive
1. VelocityTwo -> VxTwo
1. VelocityTwoColumn -> VxTwoColumn
1. VelocityTwoRow -> VxTwoRow
1. VelocityZeroCard -> VxZeroCard
1. VelocityZeroList -> VxZeroList

1. VelocityBox -> VxBox
1. VelocityXBlock -> VxBlock
1. VelocityXInlineBlock -> VxInlineBlock
1. VelocityDiscList -> VxDiscList
1. VelocityDecimalList -> VxDecimalList

## [0.2.0] - April 01, 2020

-- Added support for rich text.
-- Added support for animated container.
-- Added new textstyle prop for all kind of texts.

## Breaking Change[0.1.2] - March 23, 2020

-- Renamed Colors -> Eg: redColor100 is now red100 and red100 is now redHex100.
-- It will make the color naming consistent.
-- Neumorphism added to the box.

## [0.1.1] - March 21, 2020

- Bug Fixes for stable channel

## [0.1.0] - March 20, 2020

- initial release to public.
