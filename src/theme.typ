// ════════════════════════════════════════════════════════════════════
//  Robin CV 样式与版面配置
//  直观修改：修改下方数值即可直接生效
// ════════════════════════════════════════════════════════════════════

// ── 调色板 ──────────────────────────────────────────────────────────
// 预设参考：robin (#868DCF) | skyblue (#0395DE) | red (#DC3522) | nephritis (#27AE60) | concrete (#95A5A6) | darknight (#131A28)
#let accent = rgb("#868DCF")
#let text-primary = rgb("#1f2328") // 姓名、机构 / 荣誉标题
#let text-secondary = rgb("#343a40") // 正文描述
#let text-muted = rgb("#5c636a") // 日期、地点、级别、颁发机构、页脚
#let border-color = rgb("#1f2328") // 章节分割线（黑色细线，打印友好）
#let badge-bg = rgb("#f6f8fa") // 标签类型徽章底（中性浅灰）
#let tag-bg = accent.lighten(90%) // 技术栈标签底（强调色的浅色版）

// ── 字体 ────────────────────────────────────────────────────────────
// 中西文自动回退分工：首位西文字体，次位中文字体
// Windows 可选用 ("Arial", "Microsoft YaHei")，macOS 可选用 ("Source Sans 3", "PingFang SC")
#let font-header = ("Source Sans 3", "Noto Sans CJK SC") // 姓名、章节标题、机构名
#let font-regular = ("Source Serif 4", "Noto Serif CJK SC") // 正文
#let font-italic = ("New Computer Modern", "LXGW WenKai") // 地点、颁发机构

// ── 字号 ────────────────────────────────────────────────────────────
#let size-name = 28pt // 姓名
#let size-section = 13.5pt // 章节标题
#let size-heading = 10.5pt // 机构名 / 荣誉名 / 联系方式
#let size-body = 9.5pt // 岗位名、正文描述、技能、论文
#let size-note = 8.5pt // 日期、地点、级别、颁发机构
#let size-micro = 8pt // 标签、页脚

// ── 间距节奏 ────────────────────────────────────────────────────────
// ⚠ 关键：下面这些数不是肉眼看到的空隙。Typst 里相邻两个 block 之间的
//   实际空隙 = 数值 − par_leading（5.2pt），因为 par leading 会吃掉 block
//   spacing。想要 X pt 的空隙，就填 X + 3pt 左右。
//   同类组件之间只靠组件自身的 spacing 撑开；section-below 恒为 0，否则
//   「章节→条目」和「章节→荣誉」会长出两套不同的间距。
#let margin = (left: 1.4cm, right: 1.4cm, top: 1.2cm, bottom: 1.1cm)
#let par-leading = 5.2pt // 正文行距 —— 同时决定上面那条换算关系
#let list-spacing = 4.5pt // 列表各项间距

#let entry-row = 5pt // 机构行与岗位行之间
#let entry-desc = 10pt // 岗位行 → 描述之间
#let entry-above = 12pt // 章节标题 → 首个条目
#let entry-between = 14pt // 条目之间

#let section-above = 2pt // 章节标题上方
#let section-below = 0pt // 章节标题下方
#let section-gap = 4pt // 章节标题与分割线间距
#let section-stroke = 0.6pt // 章节分割线粗细

#let honor-above = 10.5pt // 章节标题 → 首个荣誉 / 分组间
#let honor-between = 7pt // 荣誉条目之间

#let skill-above = 9.5pt // 章节标题 → 首个技能
#let skill-between = 9.5pt // 技能项之间

#let pub-above = 9.5pt // 章节标题 → 首篇文献
#let pub-between = 7pt // 文献条目之间

#let header-stack = 7pt // 姓名 / 联系方式 / 期望岗位之间
#let header-gutter = 15pt // 姓名块与头像之间的列间距
#let header-below = 7pt // 页眉 → 第一章节

// ── 版面与对齐 ──────────────────────────────────────────────────────
#let date-width = 4.7cm // 右侧日期栏宽度
#let label-width = 2.6em // 荣誉年份与技能标签统一列宽
#let col-gutter = 10pt // 两栏对齐列间距
#let photo-height = 3cm // 头像高度
#let head-gap = 7pt // 行内「主信息 → 附带信息」的间隔

// ── 分隔符与共享状态 ────────────────────────────────────────────────
#let cv-metadata = state("cv-metadata", none)
#let h-bar() = h(5pt) + text(fill: text-muted)[|] + h(5pt)
