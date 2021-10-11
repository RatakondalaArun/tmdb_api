# ChangeLog

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
