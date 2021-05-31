part of tmdb_api;

///Configure the logs
///
///
/// *By default everything is set to `false` for production use*
///
///- `showLogs`: this one must be true to show logs
///
///- `showUrlLogs`: shows all the requests urls(🔗) you can use this to view the data on browser
///
///- `showInfoLogs`: (ℹ)info logs
///
///- `showWarningLogs`: (⚠)warning logs
///
///- `showErrorLogs`: (🔴)error logs
///
class ConfigLogger {
  final bool showLogs;
  final bool showUrlLogs;
  final bool showInfoLogs;
  final bool showWarningLogs;
  final bool showErrorLogs;
  ConfigLogger({
    this.showLogs = false,
    this.showUrlLogs = false,
    this.showInfoLogs = false,
    this.showWarningLogs = false,
    this.showErrorLogs = false,
  });

  ///## Usage
  ///Pass this if you want to set all logs to `true` in LogConfig
  ///while creating `TMDB` instance
  ///## Example
  ///```
  ///TMDB api = TMDB(ApiKeys(Keys.API, Keys.API_V4), logConfig: ConfigLogger.showAll());
  ///```
  ///
  factory ConfigLogger.showAll() {
    return ConfigLogger(
      showLogs: true,
      showUrlLogs: true,
      showInfoLogs: true,
      showWarningLogs: true,
      showErrorLogs: true,
    );
  }

  ///## Usage
  ///Pass this if you want to set all logs to `false` in LogConfig
  ///while creating `TMDB` instance
  ///
  ///
  ///## Example
  ///```
  ///TMDB api = TMDB(ApiKeys(Keys.API, Keys.API_V4), logConfig: ConfigLogger.showNone());
  ///```
  ///
  factory ConfigLogger.showNone() {
    return ConfigLogger(
      showLogs: false,
      showUrlLogs: false,
      showInfoLogs: false,
      showWarningLogs: false,
      showErrorLogs: false,
    );
  }

  ///## Usage
  ///Pass this if you want to set all logs to `false` in LogConfig
  ///while creating `TMDB` instance
  ///
  ///
  ///## Example
  ///```
  ///TMDB api = TMDB(ApiKeys(Keys.API, Keys.API_V4), logConfig: ConfigLogger.recommended());
  ///```
  ///
  factory ConfigLogger.recommended() {
    return ConfigLogger(
      showLogs: true,
      showUrlLogs: false,
      showInfoLogs: true,
      showWarningLogs: true,
      showErrorLogs: true,
    );
  }
}

class Logger {
  LogTypes /*?*/ _types;
  final ConfigLogger _config;

  LogTypes get logTypes => _types /*!*/;

  Logger(this._config) : assert(_config != null) {
    _types = LogTypes(this);
  }
}

class LogTypes {
  final Logger _logger;

  LogTypes(this._logger);

  void errorLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showLogs) {
      print(Colorize('TMDB_API--LOG(🔴) --ERROR-- $msg')..red());
    }
  }

  void infoLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showInfoLogs) {
      print(Colorize('TMDB_API--LOG(ℹ) --INFO-- $msg')..green());
    }
  }

  void warningLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showWarningLogs) {
      print(Colorize('TMDB_API--LOG(⚠) --WARNING-- $msg')..yellow());
    }
  }

  void urlLog(String urlMsg) {
    if (_logger._config.showUrlLogs && _logger._config.showUrlLogs) {
      print(Colorize('TMDB_API--LOG(🔗) --URL-- \n$urlMsg')..blue());
    }
  }
}
