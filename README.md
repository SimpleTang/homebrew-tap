# homebrew-tap

[aibox](https://github.com/SimpleTang/ai-sandbox) 的 Homebrew tap：在 Apple silicon Mac 上用 Apple container 运行 Claude Code 和 Codex CLI。

## 安装

```bash
brew install simpletang/tap/aibox
aibox setup        # 安装向导:检查并安装 Apple container、生成配置、构建镜像
```

## 升级与卸载

```bash
brew upgrade aibox
aibox clip restart   # 启用了剪贴板贴图时,升级后刷新监听
brew uninstall aibox # 用户数据在 ~/.aibox,不会被删除
```

从 git 克隆切换到 Homebrew：安装后运行一次 `aibox setup`，它会处理旧的 `~/.local/bin/aibox` 软链接和 Tab 补全配置；数据已在 `~/.aibox` 里，确认无误后可以删除原来的克隆目录。

配方由 [ai-sandbox](https://github.com/SimpleTang/ai-sandbox) 的发布工作流在每次发版后自动更新。

---

Homebrew tap for [aibox](https://github.com/SimpleTang/ai-sandbox). Install with
`brew install simpletang/tap/aibox`, then run `aibox setup`.
