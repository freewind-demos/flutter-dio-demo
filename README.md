# Flutter Dio（HTTP 客户端）

## 简介

用 **Dio** 请求公开测试接口 `jsonplaceholder.typicode.com`，把返回的 JSON 显示在屏幕上（`SelectableText`）。适合对照「项目里如何用 Dio 发 GET、处理异常」。

## 快速开始

### 环境要求

Flutter SDK；需可访问公网测试接口。

### 运行

```bash
flutter pub get
flutter run
```

## 概念讲解

### 第一部分：为什么单独用 Dio

Dio 在 Dart `http` 之上提供更丰富的拦截器、超时、FormData、下载进度等。多数中大型项目会选 Dio 或类似封装，而不是裸 `http`。

### 第二部分：异步与 UI

网络请求在 `initState` 里触发，用 `_loading` 控制 `CircularProgressIndicator`，避免白屏。失败时把异常 `toString()` 落到界面，便于 Demo 时一眼看到问题。

## 完整示例

`lib/main.dart` 中含 `Dio().get<Map<String,dynamic>>(...)`、错误分支与 `SelectableText` 展示。

## 注意事项

- 真机若走公司代理或 HTTPS 中间人，需自行配置证书或代理。
- 生产环境请把 URL、超时、重试策略集中配置，勿散落在 Widget 里。

## 完整讲解（中文）

HTTP Demo 最怕「代码能编译，但界面看不出成功失败」。本例把**加载中、成功 JSON、异常**三种情况都落在同一页，你打开 App 就知道链路是否通。Dio 和 `http` 包不神秘，本质是发请求、拿响应、解析 JSON；差别在于工程化时常用 Dio 叠一层拦截器做统一鉴权与日志。先跑通本 Demo，再把 URL 换成你们后端，把解析换成你们的 model，就是日常业务路径。
