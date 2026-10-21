#import "/lib.typ": (
  cv,
  cv-entry,
  cv-honor,
  cv-honor-date,
  cv-project,
  cv-publication,
  cv-section,
  cv-skill,
)

#show: cv

// ── 教育经历 ──────────────────────────────────────────
#cv-section("教育经历")

#cv-entry(
  title: [谐乐学院, 同调学],
  society: [折纸大学],
  date: [1996.09 - 1999.06],
  location: [皮诺康尼, 太阳的时刻],
  description: list(
    [旋律学、音乐分析、基础同调学全部满分],
    [荣获折纸大学年度优秀毕业生称号],
  ),
)

// ── 职业经历 ──────────────────────────────────────────
#cv-section("职业经历")

#cv-entry(
  title: [二级教授],
  society: [折纸大学协乐学院],
  date: [2003.09 - 至今],
  location: [太阳的时刻],
  description: list(
    [2003 年受邀作为客座教授开展同调旋律学讲座],
    [2024 年正式加入折纸大学协乐学院，任二级教授兼博士生导师],
  ),
)

#cv-entry(
  title: [签约歌手],
  society: [匹诺康尼娱乐公司],
  date: [1997.09 - 至今],
  location: [黄金的时刻],
  description: list(
    [当选匹诺康尼“寰宇十大歌手”，举办多场跨星系巡回演唱会],
    [精通歌声调律共鸣技术，可运用声波同时抚平 20 万人精神波动],
  ),
)

// ── 荣誉 / 证书 ────────────────────────────────────────
#cv-section("荣誉 / 证书")

#cv-honor-date(2003)
#cv-honor(
  title: [寰宇十大歌手],
  issuer: [星际和平公司],
)

#cv-honor-date(1998)
#cv-honor(
  title: [橡木家系歌手大赛],
  level: [特等奖],
  issuer: [匹诺康尼娱乐公司],
)

#cv-honor-date(1996)
#cv-honor(
  title: [调律学竞赛],
  level: [一等奖],
  issuer: [折纸大学协乐学院],
)

// ── 项目经历 ──────────────────────────────────────────
#cv-section("专案 / 项目")

#cv-project(
  title: [希望有羽毛和翅膀：听障公益计划],
  stack: ("公益专辑", "低频调律", "Acoustics"),
  repo: "Robin/Hope-With-Wings",
  url: "https://github.com/IceySwan/Robin-CV",
  description: list(
    [针对高频听力受损群体，将经典曲目重新编曲为听障人士友好的低频共振版本。],
    [知更鸟联合 HOYO-MiX 与天琴实验室推出《空气蛹 INSIDE》公益版，全网累计播放超千万次。],
  ),
)

#cv-project(
  title: [匹诺康尼谐乐大典调律总控],
  stack: ("同协仪式", "跨星系转播", "实时调频"),
  repo: "Penacony/Charmony-Festival",
  url: "https://github.com/IceySwan/Robin-CV",
  description: list(
    [担任谐乐大典主唱与总调律指挥，构建覆盖全梦境的大型同协共鸣场。],
    [实现跨星系超距声场同步传输与梦境现实情绪稳态维持。],
  ),
)

// ── 代表论文 ──────────────────────────────────────────
#cv-section("代表论文")
#cv-publication()

// ── 技能专长 ──────────────────────────────────────────
#cv-section("技能专长")

#cv-skill(
  type: [调律],
  info: [同调与旋律共鸣、高阶同调从业资格证、大型调律现场统筹],
)
#cv-skill(
  type: [语言],
  info: [匹诺康尼语（母语）、星际通用语（精通）、折纸鸟语],
)
#cv-skill(
  type: [专业],
  info: [声乐演绎、舞台演出艺术、跨星系超距声场构建、高等教育教学资格证],
)
