# quiver

一箭一技。🏹

一个持续扩充的 [Claude Code](https://claude.com/claude-code) 技能箭袋。每支箭都小巧、锋利、独立——需要哪支拔哪支。

## 箭囊

| 技能 | 作用 |
|---|---|
| **brainstorm** | 在任何实现开始**之前**，把模糊想法自动对齐成共识设计。创造性工作开始时自动触发。 |
| **handover** | 多语言会话交接笔记（英/日/中），带语言记忆——决策、放弃的选项与理由、踩坑、下一步、建议技能。 |

更多箭支在路上。

## 安装

```bash
claude plugin marketplace add dudupii/quiver
claude plugin install quiver@quiver
```

所有箭一起安装，统一挂在 `/quiver:` 命名空间下——裸名 `/brainstorm`、`/handover` 也能用。

## 箭支详解：handover

会话收尾时生成的交接笔记，给人（或下个会话）接手用。

- **8 个固定小节**，最重要的是"放弃的选项与理由"——防止下个会话重新讨论已定案的问题
- **只引用不重复**：已落在 spec/plan/ADR/issue/commit/diff/早期交接里的内容，一律引用路径，绝不复述
- **建议技能**节：点名下个会话该调哪些 skill、用来做什么
- **脱敏**：笔记中不出现 API key、token、密码、个人数据
- **语言**：`/quiver:handover`（默认英文）、`/quiver:handover ja`、`/quiver:handover zh`——裸名 `/handover` 也可。你的选择按项目记忆在 `.claude/handovers/.lang`，下次自动沿用
- 笔记落在 `.claude/handovers/YYYY-MM-DD_HHmm.md`（重名加 `_2`、`_3`…）

## 箭支详解：brainstorm

`superpowers:brainstorming` 的轻量替代：没有重型流程框架、没有会话启动钩子、不强制每件事都走流程。一个入口技能 + 一个访谈引擎，总共约 2KB 指令。

### 工作原理

1. **发散阶段**（按需触发）——遇到方向级决策（新子系统、外部依赖选型、数据模型、同步 vs 异步），或你主动要方案时，先给出 2–3 个整体方案及权衡与推荐，然后**等你选方向**。
2. **收敛阶段**——调用 [grilling](https://github.com/mattpocock/skills)（已捆绑，MIT）：设计树式访谈，按依赖顺序分轮批量提问、每题附推荐答案，且绝不问你它自己能查到的事。
3. **门控**——对齐完成后给你设计总结（各决策的备选/所选/理由 + 未决假设清单），**你不放行就不动代码**。

### 用法

```
我想给日志系统加个告警规则引擎          ← 自动触发
缓存方案给我 2-3 个对比一下            ← 强制发散阶段
先对齐一下：给 CLI 加 OAuth 登录        ← 显式触发
```

如果同时安装了 [mattpocock skills](https://github.com/mattpocock/skills)，后续自然衔接 `/to-spec` → `/to-tickets` → `/implement`，技能会在可用时主动提示。

### 与 superpowers:brainstorming 的对比

| | superpowers:brainstorming | quiver/brainstorm |
|---|---|---|
| 触发 | 每个创造性任务前强制 | 自动但分重量；方向级才发散 |
| 提问 | 一次一问 | 设计树分轮、依赖排序、每题带推荐 |
| 方案对比 | 固定 2-3 个 | 方向级或你要求时 |
| 常驻开销 | 框架整体 ~741 token/会话 | 列表约 60 token，不触发不付费 |
| 硬门 | 技能内提示词约束 | 人守门；配合原生 plan mode 可获得 harness 级硬门 |

## 致谢与许可

- `skills/grilling/` 下捆绑的 `grilling` 引擎来自 Matt Pocock 的 [mattpocock/skills](https://github.com/mattpocock/skills)（MIT），见 [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)。
- 其余部分：MIT © 2026 dudupii，见 [LICENSE](LICENSE)。
