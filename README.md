# xc_app

「响彻星空」App **壳工程**：只有平台工程（android/ios）和入口 `main.dart` 两行调用。
App 主体装配（Module 安装、MaterialApp、主题、首屏、全局浮层）全部在
[`xc_app_module`](../xc_app_module) 仓库完成，壳不掺任何业务。

```
xc_app/
├── lib/main.dart        # 入口：bootstrap() → runApp(XcApp)，都在 xc_app_module 里
├── android/  ios/       # 平台工程
└── pubspec.yaml         # 唯一业务依赖：xc_app_module（git + ref: main）
```

## 依赖结构

```
xc_app (壳)
└── xc_app_module (装配层, git ref: main)
    ├── xc_launch   (启动页,   git ref: main)
    └── xc_index    (主框架,   git ref: main)
        + xc_platform / xc_ui (框架仓库 ../xc_framework)
```

`xc_launch` / `xc_index` / `xc_app_module` 都是**独立 git 仓库**，壳用分支形式接入：

```yaml
xc_app_module:
  git:
    url: <xc_app_module 仓库地址>   # 本地仓库阶段是绝对路径
    ref: main
```

本地联调想跟某仓库的未提交改动时，把对应 `git:` 段临时换成
`path: ../xc_app_module` 即可，业务代码不用动。

## 跑起来

```bash
cd ~/Desktop/code/xc_app
flutter pub get
flutter run
```

## 新增一个业务包

壳工程不用动：在 `xc_app_module` 的 `bootstrap()` 里 `ModuleRegistry.install()` 一行，
新仓库按分支接入即可。
