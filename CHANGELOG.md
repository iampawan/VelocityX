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
- [BREAKING] ScrollVertical and ScrollHorizontal has been renamed to VxScrollVertical and VxScrollVertical to maintain consistency.

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
