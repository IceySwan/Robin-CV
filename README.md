# Robin CV

基于 [yunanwg/brilliant-CV](https://github.com/yunanwg/brilliant-CV) 大幅精简而来的中文简历模板. 去除了多语言支持、冗余参数传递和不必要的文件依赖, 仅保留中文使用场景下的核心功能. 如需查阅完整组件文档, 请访问 [brilliant-CV 文档](https://yunanwg.github.io/brilliant-CV/). 

相较于原版, 本 fork 做了如下修改: 

1. 减少中间变量, 规范变量命名
2. 根据内容不同, 设定不同字体（原版选择 `lang=zh` 时只能使用一种字体）
3. 大幅精简文件, 易于理解与修改, 组件函数按需读取
4. 修改页脚部分, 增加修改时间
5. 修改 `cv-honor` 结构, 使其与 [Iys-CV/Aroma](https://github.com/IceySwan/Iys-CV) 样式一致

## 示例图

![](assets/example.png)

## 快速开始

```bash
git clone https://github.com/Icey/Robin-CV.git
cd Robin-CV
typst compile cv.typ
# typst watch cv.typ
```

生成的 PDF 位于 `cv.pdf`. 

## 工程结构

```
Robin-CV/
├── lib.typ           # cv() / letter() 模板文件
├── contents/         # 简历内容
├── assets/           # 资源文件
├── cv.typ            # 简历
├── letter.typ        # 求职信
├── metadata.toml     # 基本配置
├── LICENSE
└── README.md
```

## 自定义

所有配置集中在 `metadata.toml` 中: 

| 参数 | 解释 |
|------|------|
| `[personal]` | 个人信息: 姓名、联系方式等 |
| `[layout.fonts]` | 字体设置（详见下方字体设置） |
| `[layout]` | 布局参数: 章节间距、页眉页脚等 |
| `[inject]` | 注入词, 用于通过 ATS 筛选 |

### 字体设置

模板使用三种字体分工, 通过 `[layout.fonts]` 统一配置: 

| 配置键 | 默认英文 | 默认中文 | 用途 |
|--------|----------|----------|------|
| `header-font` | Times New Roman | LXGW WenKai | 姓名、章节标题、条目标题 |
| `regular-font` | New Computer Modern | Noto Serif SC | 正文默认字体 |
| `italic-font` | New Computer Modern | KaiTi | 斜体字体 |

## 缘由
最近找工作发现原本的 [简历模板](https://github.com/IceySwan/Iys-CV) 不好控制版式, 于是想到用 Typst 重写一个, 可惜学艺不精, 不能从零开始, 于是找到了 brilliant-CV, 感觉和原本的简历布局差不多, 于是进行修改. 目前基本满意, 如果不是两张简历放在一起, 基本看不出区别. 既然原本叫 Aroma, 那这个就叫 Robin 吧. 

唉, 我真是被大明星歌手给害了. 

## 致谢

- [yunanwg/brilliant-CV](https://github.com/yunanwg/brilliant-CV)
- [IceySwan/Iys-CV](https://github.com/IceySwan/Iys-CV)

## License

[MIT](LICENSE).
