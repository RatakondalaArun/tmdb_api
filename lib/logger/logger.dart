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
  LogTypes _types;
  ConfigLogger _config;

  LogTypes get logTypes => _types;

  Logger(this._config) : assert(_config != null) {
    _types = LogTypes(this);
  }
}

class LogTypes {
  Logger _logger;

  LogTypes(this._logger);

  void errorLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showLogs) {
      String logMessage = 'TMDB_API--LOG(🔴) --ERROR-- $msg';
      Colorize coloredString = new Colorize(logMessage);
      coloredString.red();
      print(coloredString);
    }
  }

  void infoLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showInfoLogs) {
      String logMessage = 'TMDB_API--LOG(ℹ) --INFO-- $msg';
      Colorize coloredString = new Colorize(logMessage);
      coloredString.green();
      print(coloredString);
    }
  }

  void warningLog(String msg) {
    if (_logger._config.showLogs && _logger._config.showWarningLogs) {
      String logMessage = 'TMDB_API--LOG(⚠) --WARNING-- $msg';
      Colorize coloredString = new Colorize(logMessage);
      coloredString.yellow();
      print(coloredString);
    }
  }

  void urlLog(String urlMsg) {
    if (_logger._config.showUrlLogs && _logger._config.showUrlLogs) {
      String logMessage = 'TMDB_API--LOG(🔗) --URL-- \n$urlMsg';
      Colorize coloredString = new Colorize(logMessage);
      coloredString.blue();
      print(coloredString);
    }
  }
}
