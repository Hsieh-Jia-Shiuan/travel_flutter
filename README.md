# travel_flutter

獲取航班資訊和貨幣匯率

這是一個使用 Clean Architecture 分層設計 的 Flutter 範例專案。 專案使用 Reverpod 狀態管理。

## 航班資訊 ##
使用高雄國際機場的API
https://www.kia.gov.tw/API/InstantSchedule.ashx?AirFlyLine=2&AirFlyIO=2
- AirFlyLine: 1: 國際, 2: 國內
- AirFlyIO: 1: 出發, 2: 抵達

## 匯率資訊 ##
匯率API(須先註冊取api key)
規格:https://freecurrencyapi.com/docs/latest

## 設定 API Key 為環境變數 (FREE_CURRENCY_API_KEY)

本專案使用 Dart/Flutter 的編譯時環境變數來管理 API Key。

### 開發/測試時 (包含實機)

執行 app 時，請加上 `--dart-define` 參數：

```sh
flutter run --dart-define=FREE_CURRENCY_API_KEY=你的apikey
```

### 打包 Android APK

```sh
flutter build apk --dart-define=FREE_CURRENCY_API_KEY=你的apikey
```

### 打包 iOS

```sh
flutter build ios --dart-define=FREE_CURRENCY_API_KEY=你的apikey
```

### 注意事項

- 每次 build/run 都要加上 `--dart-define`，否則 app 內部會拿不到 key。

### 取得 API Key

請將你的 API Key 設定在 `./env/currency_key.json`
請參考範例 `./env/currency_key.json.example`
