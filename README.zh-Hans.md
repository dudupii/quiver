# quiver

一箭一技。🏹

一个持续扩充的 [Claude Code](https://claude.com/claude-code) 技能箭袋。每支箭都小巧、锋利、独立——需要哪支拔哪支。

## 箭囊

| 技能 | 作用 |
|---|---|
| **brainstorm** | 在任何实现开始**之前**，把模糊想法自动对齐成共识设计。创造性工作开始时自动触发。 |
| **handover** | 多语言会话交接笔记（英/日/中），带语言记忆——决策、放弃的选项与理由、踩坑、下一步、建议技能。 |
| **catchup** | 读取最近的交接笔记（外加最后一次交接之后的提交），四段式简报带你恢复上下文。纯只读，可安全自动触发。 |

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
- **脱敏**：笔记中不出现 API key、token、密码、个人数据——每次写入前跑一遍凭据特征机械扫描
- **语言**：`/quiver:handover` 自动从你的消息推断（回退英文）；`/quiver:handover ja`、`/quiver:handover zh` 显式指定——裸名 `/handover` 也可。显式选择按项目记忆在 `.claude/handovers/.lang`，下次自动沿用
- 笔记落在 `.claude/handovers/YYYY-MM-DD_HHmm.md`（重名加 `_2`、`_3`…），开头带 YAML frontmatter：`author`（仅 git `user.name`，绝不写 email）、`branch`、`commit`、`lang`，以及链向上一篇的 `continues:`。取不到的字段静默省略；旧格式笔记照常有效
- **感知 git、但只读 git**：交接目录被 git 跟踪时，结束附一句"提交这篇笔记让队友看到"；被忽略或未跟踪时对 git 只字不提。绝不执行任何改变 git 状态的命令

## 箭支详解：catchup

handover 的读取侧。`/quiver:catchup`（裸名 `/catchup` 也可）读取最近的交接笔记——默认 3 篇，传数字可加宽（`/catchup 5`）——以四段式简报作答：**当前状态 / 待办线索与下一步 / 仍有效的踩坑记录 / 建议行动**。当最新笔记记录了 `commit`，简报还会折入该提交之后的 git log，"最后一次交接之后发生了什么"一条命令回答。

它允许模型自动触发——新会话接手一个有交接笔记的项目时可自行启动——因为它严格只读：不写任何文件，连语言记忆都不碰。无 frontmatter 的旧格式笔记照常读取。

## 团队工作流

交接目录就是共享介质：

1. **把 `.claude/handovers/` 纳入 git 跟踪。**所有人的会话都往同一目录写笔记。handover 察觉目录被跟踪后，会建议提交每篇新笔记——只有一句建议；技能本身绝不碰 git 状态。
2. **约定一种笔记语言。**`.claude/handovers/.lang` 是每个项目一个的共享值（后写覆盖）。用 `/quiver:handover zh`（或 `ja`/`en`）设一次，所有人的笔记随之统一。
3. **会话开头跑 `/quiver:catchup`。**最近的笔记加上最新一篇之后的提交——一条命令恢复上下文，不盲信过时信息。

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
