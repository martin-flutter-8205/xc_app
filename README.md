# xc_app

「响彻星空」App **壳工程**：只有平台工程（android/ios）和入口 `main.dart` 两行调用。
App 主体装配（Module 安装、MaterialApp、主题、首屏、全局浮层）全部在
[`xc_app_module`](https://github.com/martin-flutter-8205/xc_app_module) 仓库完成，壳不掺任何业务。

```
xc_app/
├── lib/main.dart        # 入口：bootstrap() → runApp(XcApp)，都在 xc_app_module 里
├── xc.yaml              # 本机工作区清单：xc gen / assets / check 扫描哪些包
├── android/  ios/       # 平台工程
└── pubspec.yaml         # 唯一业务依赖：xc_app_module（git + ref: main）
```

## 依赖结构

```
xc_app (壳)
└── xc_app_module (装配层, git ref: main)
    ├── xc_launch   (启动页, git ref: main)
    │   └── xc_index (主框架, git ref: main)
    ├── xc_index
    ├── xc_platform (框架层, git ref: main)
    └── xc_ui       (UI 层,   git ref: main)
```

全部仓库都在 `github.com/martin-flutter-8205/` 下，壳用分支形式接入：

```yaml
xc_app_module:
  git:
    url: git@github.com:martin-flutter-8205/xc_app_module.git
    ref: main
```

本地联调想跟某仓库的未提交改动时，把对应 `git:` 段临时换成
`path: ../xc_app_module`，业务代码不用动。

## 工作区清单（xc.yaml）

包拆成独立仓库后，`xc` 工具不知道该去哪扫业务代码，所以根目录放一份清单：

```yaml
workspace:
  - ../xc_platform
  - ../xc_ui
  - ../xc_launch
  - ../xc_index
  - ../xc_app_module
```

`xc gen`（重出 `.g.dart`）、`xc assets`（重出 `assets_gen.dart`）、
`xc check`（analyze + 测试）都按这份清单定位，路径相对 App 根。

## 跑起来

```bash
cd ~/Desktop/code/xc_app
flutter pub get
xc            # clean → deps → gen → assets → check
xc run        # 同上 + 启动 App
```

## 新增一个业务包

壳工程不用动，两步：

1. 新仓库按分支接入 `xc_app_module`，并把本机检出目录加进 `xc.yaml` 的 `workspace`；
2. 在 `xc_app_module` 的 `bootstrap()` 里加一行 `ModuleRegistry.install()`。
