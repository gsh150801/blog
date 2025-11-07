# 更新日志 Changelog

## [2.2.0] - 2025-11-05

### 新增功能

#### 全文搜索系统
- 实现文章标题和内容全文搜索
- 支持中文和英文搜索
- 基于Supabase数据库的高效搜索
- 搜索性能优化（防抖300ms）
- 智能相关性算法

#### 搜索结果高亮
- 关键词自动高亮显示
- 支持多关键词同时高亮
- 标题和摘要中的关键词高亮
- 自定义高亮样式（淡蓝色背景）
- 深色/浅色主题完美适配

#### 搜索历史功能
- localStorage本地存储搜索历史
- 最多保存20条历史记录
- 搜索记录自动去重
- 一键清除历史记录
- 时间戳记录

#### 搜索建议系统
- 实时搜索建议（基于文章标题）
- 键盘导航支持（上下箭头、Enter确认）
- 搜索下拉框动态显示
- 建议和历史分组显示
- 友好的UI交互

#### 快捷键支持
- **Ctrl/Cmd + K**: 快速打开搜索框
- **ESC**: 关闭搜索建议
- **↑/↓**: 浏览搜索建议
- **Enter**: 确认搜索
- 全局快捷键监听

#### 多维度排序
- 按相关性排序（默认）
- 按发布时间排序
- 按浏览量排序
- 实时切换排序方式
- 智能相关性评分算法

#### SearchBox组件
- 优雅的搜索框设计
- 集成到导航栏
- 移动端完美适配
- 搜索历史和建议下拉框
- 清除按钮和快捷键提示

#### SearchResults页面
- 专业的搜索结果展示
- 搜索摘要智能提取
- 关键词上下文显示
- 无结果友好提示
- 响应式卡片布局

### 技术更新

#### 新增文件
- `src/utils/search.ts` - 搜索工具函数（193行）
- `src/hooks/useSearch.ts` - 搜索Hook（193行）
- `src/components/SearchBox.tsx` - 搜索框组件（230行）
- `src/pages/SearchResults.tsx` - 搜索结果页（198行）

#### 修改文件
- `src/components/Layout.tsx` - 集成搜索框到导航栏
- `src/App.tsx` - 添加搜索结果路由 `/search`
- `package.json` - 版本升级至2.2.0

### 搜索功能特性

#### 智能相关性算法
- 标题匹配权重10分
- 内容匹配每次1分
- 按相关度排序搜索结果
- 多关键词综合评分

#### 搜索摘要提取
- 智能提取包含关键词的上下文
- 摘要长度200字符
- 关键词居中显示
- 自动添加省略号

#### 性能优化
- 300ms防抖减少请求
- 最多返回50条结果
- 建议查询限制5条
- 高效的Supabase查询

### 用户体验提升
- 搜索框在导航栏显著位置
- 支持移动端搜索
- 搜索历史快速访问
- 友好的无结果提示
- URL友好（/search?q=关键词）

### 兼容性
- 与Monaco Editor完美配合
- 与代码高亮功能协同
- 保持Modern Minimalism设计风格
- 响应式设计
- 跨浏览器兼容

---

## [2.1.0] - 2025-11-05

### 新增功能

#### Prism.js代码语法高亮
- 集成Prism.js + react-syntax-highlighter
- 支持30+种编程语言高亮
- VS Code Dark+ / Light主题
- 与Monaco Editor风格一致
- 完美的深色/浅色主题适配

#### 代码复制功能
- 一键复制代码块内容
- 复制成功提示动画
- 2秒自动恢复按钮状态
- 支持所有代码块

#### 代码折叠功能
- 超过20行代码自动折叠
- 展开/收起按钮
- 显示总行数
- 渐变遮罩提示
- 平滑动画过渡

#### 代码块UI优化
- 专业的代码块头部栏
- 语言标识显示
- 行号显示
- 优雅的边框和阴影
- 符合Modern Minimalism风格

### 技术更新

#### 依赖升级
- 新增 `prismjs@^1.29.0`
- 新增 `react-syntax-highlighter@^15.5.0`
- 新增类型定义包

#### 新增文件
- `src/components/CodeBlock.tsx` - 代码块组件（173行）
- `CODE_HIGHLIGHT_GUIDE.md` - 代码高亮使用指南（405行）

#### 修改文件
- `src/components/MarkdownPreview.tsx` - 集成CodeBlock组件
- `package.json` - 版本升级至2.1.0

### 改进
- 文章详情页代码渲染体验提升
- Markdown预览代码高亮更专业
- 代码可读性大幅提升
- 用户体验优化

### 性能优化
- 按需加载语言包
- 代码块懒加载
- React组件优化
- 减少初始包大小

---

## [2.0.0] - 2025-11-05

### 新增功能

#### Monaco Editor富文本编辑器
- 集成Monaco Editor（VS Code同款编辑器引擎）
- 替换原有简单textarea编辑器
- Markdown语法高亮
- 行号显示和代码折叠
- 深色/浅色主题自动适配

#### 实时预览系统
- 左侧编辑，右侧实时预览
- 完整的GitHub Flavored Markdown支持
- 支持表格、任务列表、删除线等扩展语法
- 响应式布局，移动端自动隐藏预览
- 预览窗口可切换显示/隐藏

#### 图片拖拽上传
- 支持图片直接拖拽到编辑器
- 自动上传到Supabase Storage（blog-media bucket）
- 自动插入Markdown图片语法
- 支持JPG、PNG、GIF、WebP格式
- 单文件大小限制10MB
- 上传进度提示

#### 快捷键支持
- **Ctrl/Cmd + B**: 粗体格式化
- **Ctrl/Cmd + I**: 斜体格式化
- **Ctrl/Cmd + K**: 插入链接
- 完整的Monaco Editor快捷键（查找、替换、多光标等）
- 自定义快捷键配置

#### 编辑器UI优化
- 专业工具栏（粗体、斜体、标题、链接、图片、代码、列表）
- 实时字数统计和行数统计
- 状态栏显示编辑信息
- 已上传图片数量提示
- 自动摘要生成功能
- 符合Modern Minimalism Premium设计风格

#### 增强的Markdown渲染
- 使用react-markdown + remark-gfm
- 自定义组件样式
- 代码块语法高亮准备
- 图片懒加载
- 链接自动新标签页打开
- XSS安全防护（rehype-sanitize）

### 改进

#### 编辑器性能
- Monaco Editor按需加载
- 代码分割优化
- 自动布局适配
- 滚动性能优化

#### 用户体验
- 更直观的编辑器界面
- 更流畅的编辑体验
- 更清晰的视觉反馈
- 移动端优化

#### 样式系统
- 统一的滚动条样式
- Monaco Editor主题配置
- 深色模式完美适配
- 浅色模式优化

### 技术更新

#### 依赖升级
- 新增 `@monaco-editor/react@^4.6.0`
- 新增 `remark-gfm@^4.0.0`
- 新增 `rehype-sanitize@^6.0.0`
- 新增 `rehype-raw@^7.0.0`

#### 新增文件
- `src/components/MonacoEditor.tsx` - Monaco Editor组件
- `src/components/MarkdownPreview.tsx` - Markdown预览组件
- `src/lib/imageUpload.ts` - 图片上传工具
- `EDITOR_GUIDE.md` - 编辑器使用指南

#### 修改文件
- `src/pages/PostEditor.tsx` - 完全重构
- `src/pages/PostDetail.tsx` - 使用新的预览组件
- `src/index.css` - 添加Monaco Editor样式
- `package.json` - 版本升级至2.0.0

### 文档更新
- 新增 EDITOR_GUIDE.md - 完整的编辑器使用指南
- 更新 README.md - 添加Monaco Editor功能说明
- 更新工作记忆 - 记录编辑器升级完成

### 已知问题
- 代码语法高亮尚未完全集成（准备集成Prism.js）
- 大文件编辑时首次加载略慢（Monaco Editor约2MB）
- 某些浏览器的快捷键可能与系统快捷键冲突

### 兼容性
- Node.js 20+ 版本
- 现代浏览器（Chrome 90+, Firefox 88+, Safari 14+, Edge 90+）
- 移动端浏览器支持

---

## [1.0.0] - 2025-11-05

### 初始发布

#### 核心功能
- 文章系统（Markdown编辑、发布、草稿管理）
- 专栏管理系统
- 标签系统
- 游客评论系统
- 用户认证系统
- 社交分享功能
- 统计功能（浏览、点赞）
- 主题切换（深色/浅色）
- 响应式设计

#### 后端架构
- Supabase数据库（12个表）
- Row Level Security配置
- 用户认证系统
- Storage配置（blog-media）
- Profile自动创建触发器

#### 前端技术
- React 18 + TypeScript + Vite
- TailwindCSS样式系统
- React Router路由
- React Context状态管理
- Lucide React图标

#### 部署配置
- GitHub Actions自动部署
- GitHub Pages托管
- 一键部署脚本
- 完整文档（7个文档文件）

---

## 计划功能

### 版本 2.1.0
- [ ] 代码语法高亮（Prism.js集成）
- [ ] 编辑器自动保存
- [ ] 文章版本历史
- [ ] 图片裁剪和编辑

### 版本 2.2.0
- [ ] LLM文章润色功能实现
- [ ] AI写作助手
- [ ] 内容推荐算法

### 版本 3.0.0
- [ ] 多人协同编辑
- [ ] 实时协作
- [ ] 评论实时通知
- [ ] WebSocket集成

---

**维护者**: MiniMax Agent  
**联系方式**: kvt97483@163.com  
**项目主页**: /workspace/blog/
