# ChangeLog

## 2.2.3

- Feat allow other languages ​​in video request [#112](https://github.com/RatakondalaArun/tmdb_api/issues/112)
- Dependencies upgrade

## 2.2.2

- Fix backdrop size [#107](https://github.com/RatakondalaArun/tmdb_api/pull/107). Thanks to ([@gutala](https://github.com/gutala))
- Fix markAsFavorite and addToWatchList [#111](https://github.com/RatakondalaArun/tmdb_api/pull/111). Thanks to ([@antoniobocale](https://github.com/antoniobocale))
- Dependencies upgrade
- Bumped support sdk range to `>=3.0.0 <4.0.0`

## 2.2.1

- Fix Lints

## 2.2.0

- Added `include_image_language` option to movie/tv `getDetails`. Thanks to ([@0Franky](https://github.com/0Franky))
- Added POST/DELETE/PUT endpoint requests now include the dataBody via Map. Thanks to ([@johndunne](https://github.com/johndunne))
- Added support for watch providers.
- Dependencies upgrade
- Migrated dio exception changes `5c1311e01ea412f5466243b5d9939b5d546a824d`

## 2.1.5

- Dependencies upgrade
- Fixed a bug in `v3.tv.getVideos` were returning tv details instead of the videos [#91](https://github.com/RatakondalaArun/tmdb_api/pull/91). Thanks to ([@bdstph](https://github.com/bdstph))
- Upgraded dio version to 5.1.1 to mitigate known CRLF vulnerability [#92](https://github.com/RatakondalaArun/tmdb_api/pull/92). Thanks to ([@doorknob88](https://github.com/doorknob88))

## 2.1.4

- Dependencies upgrade
- Updated discover api ([#89](https://github.com/RatakondalaArun/tmdb_api/pull/89)). Thanks to ([@shr1k4nt](https://github.com/shr1k4nt))

## 2.1.3

- Dependencies upgrade

## 2.1.2

- Change tvId type in aggregateCredits to int ([#84](https://github.com/RatakondalaArun/tmdb_api/pull/84))
- Add language query to trending ([#85](https://github.com/RatakondalaArun/tmdb_api/pull/85))
- Upgraded outdated dependencies

## 2.1.1

- Added `defaultLanguage` parameter ([#81](https://github.com/RatakondalaArun/tmdb_api/issues/81))
- Upgraded outdated dependencies

## 2.1.0

- Replaced `http` package with `dio` ([#57](https://github.com/RatakondalaArun/tmdb_api/issues/57))
- Removed depricated exceptions ([#77](https://github.com/RatakondalaArun/tmdb_api/issues/77))
  - `NullValueException`
  - `InvalidDataException`
- Fixed some typos ([#70](https://github.com/RatakondalaArun/tmdb_api/issues/70))
- Improved logging interface ([#75](https://github.com/RatakondalaArun/tmdb_api/issues/75))

## 2.0.0

- Nullsafety to stable
- Require dart sdk `>=2.14.0 <3.0.0`
- Fixed lint warnings
- Upgraded dependencies

## 2.0.0-nullsafety

This version adds **nullsafety**. So there are some breaking changes.

- Features
  - Migrated to null-safety [#18](https://github.com/RatakondalaArun/tmdb_api/issues/18)
  - Code Refactor [#41](https://github.com/RatakondalaArun/tmdb_api/issues/41)
  - Updated workflows [#42](https://github.com/RatakondalaArun/tmdb_api/issues/42)
  - Fixed Static analysis [#45](https://github.com/RatakondalaArun/tmdb_api/issues/45)
  - Deprecated some exceptions `breaking change` [#46](https://github.com/RatakondalaArun/tmdb_api/issues/46)
    - Replaced `NullValueException` and `InvalidDataException` with `ArgumentException`

## 1.2.7

- Issues Fixed
  - Fixed typeerror [#36](https://github.com/RatakondalaArun/tmdb_api/pull/36) by [@RatakondalaArun](https://github.com/RatakondalaArun)
  - Added watch providers method [#37](https://github.com/RatakondalaArun/tmdb_api/pull/37) by [@RatakondalaArun](https://github.com/RatakondalaArun)

## 1.2.6

- Issues Fixed
  - Added missing method [#28](https://github.com/RatakondalaArun/tmdb_api/pull/28) by [@srihariash999](https://github.com/srihariash999)
  - Optional Queries [#30](https://github.com/RatakondalaArun/tmdb_api/pull/30) by [@is8r](https://github.com/is8r)
  - Added missing method [#31](https://github.com/RatakondalaArun/tmdb_api/pull/31) by [@RatakondalaArun](https://github.com/RatakondalaArun)

## 1.2.5

- Feature
  - Added page support for trending items [#24](https://github.com/RatakondalaArun/tmdb_api/pull/24) by [@Viswanth1038](https://github.com/Viswanth1038)

## 1.2.4

- Fixed [#14](https://github.com/RatakondalaArun/tmdb_api/issues/14)
  - flutter web support
  - TMDBSocketException is Deprecated
  - Doesn't throw `TMDBSocketException` if internet connection is not avaliable.

## 1.2.3

- Fixed append to response bug. [#16](https://github.com/RatakondalaArun/tmdb_api/issues/16)
  - Thanks to [@Viswanth1038](https://github.com/Viswanth1038) for contributing this fix.
  
## 1.2.2

bug fix

## 1.2.1

- Bug fix by @Arley011 with PR #13

## 1.2.0

- All the exceptions now implements `TMDBException`
- Throw `TMDBSocketException` if internet connection is not avaliable.
**There are some breaking changes**

## 1.1.0

- Added Logger.
  - previous version was causing unwanted console logs so i removed it.
    But you can still access those logs using **logConfig** parameter
    in `TMDB` class.

## 1.0.0-stable

- Initial Release
