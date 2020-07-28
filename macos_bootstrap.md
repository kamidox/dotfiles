Title: 从头配置 MacOS 操作系统
Date: 2020-07-28 20:19
Modified: 2020-07-28 20:19
Slug: about-book
Authors: Joey Huang
Summary: 从头配置 MacOS 操作系统
Status: draft


## 安装软件

### brew

https://brew.sh

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

注意：

1. 安装前，需要先安装 xcode，并且需要通过 `xcode-select --install` 安装 xcode 命令行工具。
2. 上述命令可能被 GFW 屏蔽。有可能需要通过 VPN 才能安装。

### Spectacle

https://www.spectacleapp.com

应用已经不再维护了，如果下载慢，可以上百度网盘 `tools/mac` 目录下载。

### MacOS 优化

https://github.com/kamidox/dotfiles

运行 `.macos` 文件进行设置优化。

### oh-my-zsh

https://ohmyz.sh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
