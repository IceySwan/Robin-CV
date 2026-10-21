#import "/src/theme.typ": *

// ── 章节标题 ────────────────────────────────────────────────────────
#let cv-section(title) = block(
  width: 100%,
  sticky: true,
  above: section-above,
  below: section-below,
  text(font: font-header, size: size-section, weight: "bold", fill: accent, title)
    + h(section-gap)
    + box(width: 1fr, line(stroke: section-stroke + border-color, length: 100%)),
)

// ── 标签徽章 ────────────────────────────────────────────────────────
// 技术栈：无边框 + 强调色浅底，横竖内边距接近，避免又细又长
#let tech-tags(tags) = tags.map(tag => box(
  inset: (x: 4.5pt, y: 1.5pt),
  fill: tag-bg,
  radius: 2.5pt,
  text(font: font-header, size: size-micro, fill: text-secondary, tag),
)).join(h(4pt))

// 类型徽章（圆角描边，中性配色）
#let entry-tags(tags) = tags.map(tag => box(
  inset: (x: 4pt, y: 1.5pt),
  fill: badge-bg,
  radius: 2pt,
  stroke: 0.3pt + border-color,
  text(font: font-regular, size: size-micro, fill: text-secondary, tag),
)).join(h(4pt))

// ── 经历条目（教育 / 工作 / 项目）────────────────────────────────────
#let cv-entry(
  society: "",
  title: "",
  date: "",
  location: "",
  description: none,
  tags: (),
) = {
  let muted = (size: size-note, fill: text-muted)
  block(
    width: 100%,
    above: entry-above,
    spacing: entry-between,
    {
      grid(
        columns: (1fr, date-width),
        row-gutter: entry-row,
        // 第一行：机构（最重） + 地点
        text(font: font-header, size: size-heading, weight: "bold", fill: text-primary, society),
        align(right, text(..muted, font: font-italic, location)),
        // 第二行：岗位 / 方向（主题色） + 日期
        text(font: font-regular, size: size-body, weight: "medium", fill: accent, title),
        align(right, text(..muted, font: font-regular, date)),
      )
      if description != none {
        block(
          above: entry-desc,
          below: entry-desc,
          text(size: size-body, fill: text-secondary, description),
        )
      }
      if tags.len() > 0 { entry-tags(tags) }
    },
  )
}

// ── 开源项目 / 专案 ──────────────────────────────────────────────────
//   标题 技术栈                    仓库名 / 链接      ← 同一行
//   • 描述要点                                        ← 另起一行
#let cv-project(
  title: "",
  stack: (),
  repo: "",
  url: "",
  description: none,
) = {
  let headline = text(
    font: font-header,
    size: size-heading,
    weight: "medium",
    fill: text-primary,
    if url == "" { title } else { link(url)[#title] },
  )
  if stack.len() > 0 { headline += h(head-gap) + tech-tags(stack) }

  block(
    width: 100%,
    above: entry-above,
    spacing: entry-between,
    {
      grid(
        columns: (1fr, auto),
        align: (left + horizon, right + horizon),
        headline,
        if repo != "" { text(font: font-italic, size: size-note, fill: text-muted, repo) },
      )
      if description != none {
        block(
          above: entry-desc,
          below: entry-desc,
          text(size: size-body, fill: text-secondary, description),
        )
      }
    },
  )
}

// ── 荣誉与证书 ──────────────────────────────────────────────────────
#let cv-honor-year = state("cv-honor-year", none)
#let cv-honor-date(year) = cv-honor-year.update(year)

#let cv-honor(
  date: auto,
  title: "",
  level: none,
  url: "",
  issuer: "",
) = context {
  let group = cv-honor-year.get()
  let shown-year = if date != auto { date } else { group }
  let new-group = group != none

  let headline = text(
    font: font-header,
    size: size-heading,
    weight: "regular",
    fill: text-primary,
    if url == "" { title } else { link(url)[#title] },
  )
  if level != none and level != "" {
    headline += text(font: font-header, size: size-note, fill: text-secondary, [#h(head-gap)#level])
  }

  block(
    above: if new-group { honor-above } else { honor-between },
    spacing: honor-between,
    grid(
      columns: (label-width, 1fr, auto),
      column-gutter: col-gutter,
      align: (right + horizon, left + horizon, right + horizon),
      text(font: font-regular, size: size-note, fill: text-muted, if shown-year == none { "" } else [#{shown-year}]),
      headline,
      text(font: font-italic, size: size-note, fill: text-muted, issuer),
    ),
  )

  if group != none { cv-honor-year.update(none) }
}

// ── 技能 ────────────────────────────────────────────────────────────
#let cv-skill(type: "", info: "") = block(
  above: skill-above,
  spacing: skill-between,
  grid(
    columns: (label-width, 1fr),
    column-gutter: col-gutter,
    align: (right + top, left + top),
    text(font: font-header, size: size-body, weight: "bold", fill: text-primary, type),
    text(font: font-regular, size: size-body, fill: text-secondary, info),
  ),
)

// ── 论文 ────────────────────────────────────────────────────────────
#let citation(entry, style, my-names) = {
  let is-mine(a) = {
    let clean = lower(a.trim().trim(regex("[*#]$")))
    my-names.any(n => clean == n)
  }
  let authors = entry.authors.map(a => if is-mine(a) { strong(a) } else { a }).join(", ")
  let title = if type(entry.title) == str { eval(entry.title, mode: "markup") } else { entry.title }
  let journal = entry.at("journal", default: entry.at("booktitle", default: ""))
  let year = if "year" in entry { str(entry.year) } else { "" }
  let vol = if "volume" in entry { str(entry.volume) } else { "" }
  let num = if "number" in entry { str(entry.number) } else if "issue" in entry { str(entry.issue) } else { "" }
  let pages = if "pages" in entry { str(entry.pages) } else { "" }
  let joined(..parts) = parts.pos().filter(p => p != none and p != "").join(", ")

  if str(style).starts-with("gb") {
    let mark = if entry.at("type", default: "article") == "article" { "[J]" } else { "[C]" }
    let vol-part = if vol != "" and num != "" { [#vol\(#num\)] } else { vol }
    [#authors. #title#mark. #joined(journal, year, [#vol-part: #pages])]
  } else {
    let vol-year = if vol != "" and year != "" { [*#vol* \(#year\)] } else if vol != "" { [*#vol*] } else if (
      year != ""
    ) { [\(#year\)] } else { none }
    [#authors, #emph(title), #joined(journal, vol-year, if num == "" { none } else { "no. " + str(num) }, pages).]
  }
}

#let cv-publication(style: auto, file: auto) = context {
  let meta = cv-metadata.get()
  let layout = if meta != none { meta.at("layout", default: (:)) } else { (:) }
  let chosen = if style != auto {
    style
  } else {
    layout.at("citation_style", default: "ams")
  }
  let path = if file != auto {
    file
  } else {
    layout.at("publications_file", default: "assets/publications.yaml")
  }
  let yaml = std.yaml(if path.starts-with("/") { path } else { "/" + path })

  let personal = if meta != none { meta.at("personal", default: (:)) } else { (:) }
  let names = (
    str(personal.at("name", default: "")),
    ..personal.at("name_aliases", default: ()).map(str),
  )
    .filter(n => n != "")
    .map(lower)

  for (i, entry) in yaml.enumerate() {
    block(
      above: pub-above,
      spacing: pub-between,
      grid(
        columns: (auto, 1fr),
        column-gutter: 6pt,
        text(font: font-regular, size: size-note, fill: text-muted, [\[#(i + 1)\]]),
        text(font: font-regular, size: size-body, fill: text-secondary, citation(entry, chosen, names)),
      ),
    )
  }
}
