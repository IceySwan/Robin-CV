#import "@preview/fontawesome:0.6.0": *
#import "/src/theme.typ": *

// ── ATS 关键词注入（2pt 白字，人眼看不见但文本层可检索）────────────────
#let inject(cfg) = {
  let parts = (cfg.at("custom_ai_prompt_text", default: none), ..cfg.at("keywords", default: ()))
  let text-content = parts.filter(p => p != none and p != "").join(" ")
  if text-content != "" {
    place(text(text-content, size: 2pt, fill: white), dx: 0%, dy: 0%)
  }
}

// ── 联系方式：图标 + 值 ──────────────────────────────────────────────
#let contact-line(personal) = {
  let info = personal.at("info", default: personal)
  let icons = (
    phone: fa-phone(),
    email: fa-envelope(),
    wechat: fa-weixin(),
    linkedin: fa-linkedin(),
    homepage: fa-pager(),
    github: fa-square-github(),
    gitlab: fa-gitlab(),
    orcid: fa-orcid(),
    id: fa-id-card(),
    researchgate: fa-researchgate(),
    location: fa-location-dot(),
  )
  let format-link(k, val) = {
    let prefixes = (
      email: "mailto:",
      github: "https://github.com/",
      gitlab: "https://gitlab.com/",
      linkedin: "https://linkedin.com/in/",
      homepage: "https://",
    )
    if k in prefixes {
      // 联系方式为可点击链接，赋强调色；全局链接仅加下划线
      link(if val.starts-with("http") { val } else { prefixes.at(k) + val })[
        #text(fill: accent, val)
      ]
    } else {
      val
    }
  }

  icons
    .pairs()
    .filter(((k, _)) => info.at(k, default: "") != "")
    .map(((k, icon)) => box(icon + h(head-gap) + format-link(k, info.at(k))))
    .join(h-bar())
}

// ── 页眉 ────────────────────────────────────────────────────────────
#let cv-header(metadata, profile-photo: none) = {
  let p = metadata.at("personal", default: (:))
  let name = p.at("name", default: "")

  inject(metadata.at("inject", default: (:)))

  let quote = p.at("quote", default: none)
  let name-block = stack(
    spacing: header-stack,
    text(font: font-header, size: size-name, weight: "bold", fill: text-primary, name),
    text(font: font-header, size: size-heading, fill: text-secondary, contact-line(p)),
    if quote == none { none } else {
      text(font: font-header, size: size-body, style: "italic", fill: accent, quote)
    },
  )

  let layout = metadata.at("layout", default: (:))
  let photo = if profile-photo != none { profile-photo } else {
    layout.at("profile_photo", default: none)
  }
  let show-photo = layout.at("show_photo", default: true)
  let photo = if photo == none or not show-photo { none } else if type(photo) == str {
    image(if photo.starts-with("/") { photo } else { "/" + photo })
  } else { photo }

  block(
    width: 100%,
    below: header-below,
    if photo == none { name-block } else {
      grid(
        columns: (1fr, auto),
        column-gutter: header-gutter,
        align: top,
        name-block, box(photo, height: photo-height, radius: 50%, clip: true),
      )
    },
  )
}

// ── 页脚 ────────────────────────────────────────────────────────────
#let cv-footer(metadata) = {
  let layout = metadata.at("layout", default: (:))
  let show-footer = layout.at("show_footer", default: true)
  if not show-footer { return }
  let f(str) = text(size: size-micro, fill: text-muted, str)
  let footer-text = metadata.at("cv_footer", default: "")
  grid(
    columns: (1fr, auto, 1fr),
    align: (bottom + left, bottom + center, bottom + right),
    f([更新时间：#datetime.today().display("[year]年[month]月[day]日")]),
    context f([#counter(page).get().first() / #counter(page).final().first()]),
    f(footer-text),
  )
}

// ── 主入口 ──────────────────────────────────────────────────────────
#let cv(..args) = {
  let pos = args.pos()
  let named = args.named()
  let body = pos.last()
  let metadata = named.at("metadata", default: if pos.len() >= 2 { pos.first() } else { "metadata.toml" })
  let profile-photo = named.at("profile-photo", default: none)

  let metadata = if type(metadata) == str {
    toml(if metadata.starts-with("/") { metadata } else { "/" + metadata })
  } else { metadata }

  cv-metadata.update(metadata)

  let paper-size = metadata.at("layout", default: (:)).at("paper_size", default: "a4")

  set text(font: font-regular, size: size-body, fill: text-secondary, lang: "zh", region: "cn")
  set par(leading: par-leading)
  set list(spacing: list-spacing, marker: ([•], [◦]))
  // 只加下划线，不强制染色：链接文字保留调用处给的颜色
  show link: underline
  set page(paper: paper-size, margin: margin, footer: cv-footer(metadata))
  cv-header(metadata, profile-photo: profile-photo)
  body
}
