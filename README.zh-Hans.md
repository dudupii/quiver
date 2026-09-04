# claude-brainstorm

一个 Claude Code 技能插件：在任何实现开始**之前**，把模糊想法自动对齐成共识设计。

它是 `superpowers:brainstorming` 的轻量替代：没有重型流程框架、没有会话启动钩子、不强制每件事都走流程。一个入口技能 + 一个访谈引擎，总共约 2KB 指令。

## 工作原理

1. **发散阶段**（按需触发）——遇到方向级决策（新子系统、外部依赖选型、数据模型、同步 vs 异步），或你主动要方案时，先给出 2–3 个整体方案及权衡与推荐，然后**等你选方向**。
2. **收敛阶段**——调用 [grilling](https://github.com/mattpocock/skills)（已捆绑，MIT）：设计树式访谈，按依赖顺序分轮批量提问、每题附推荐答案，且绝不问你它自己能查到的事。
3. **门控**——对齐完成后给你设计总结（各决策的备选/所选/理由 + 未决假设清单），**你不放行就不动代码**。

## 安装

```bash
claude plugin marketplace add dudupii/claude-brainstorm
claude plugin install brainstorm@claude-brainstorm
```

## 用法

正常描述需求即可自动触发：

```
我想给日志系统加个告警规则引擎          ← 自动触发
缓存方案给我 2-3 个对比一下            ← 强制发散阶段
先对齐一下：给 CLI 加 OAuth 登录        ← 显式触发
```

如果同时安装了 [mattpocock skills](https://github.com/mattpocock/skills)，后续自然衔接 `/to-spec` → `/to-tickets` → `/implement`，技能会在可用时主动提示。

## 与 superpowers:brainstorming 的对比

| | superpowers:brainstorming | claude-brainstorm |
|---|---|---|
| 触发 | 每个创造性任务前强制 | 自动但分重量；方向级才发散 |
| 提问 | 一次一问 | 设计树分轮、依赖排序、每题带推荐 |
| 方案对比 | 固定 2-3 个 | 方向级或你要求时 |
| 常驻开销 | 框架整体 ~741 token/会话 | 列表约 60 token，不触发不付费 |
| 硬门 | 技能内提示词约束 | 人守门；配合原生 plan mode 可获得 harness 级硬门 |

## 致谢与许可

- `grilling` 引擎逐字捆绑自 Matt Pocock 的 [mattpocock/skills](https://github.com/mattpocock/skills)（MIT），见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。
- 其余部分：MIT © 2026 dudupii，见 [LICENSE](LICENSE)。
