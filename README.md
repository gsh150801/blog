# 极简博客 Minimalist Blog

一个使用 React + Vite + Supabase 构建的简约优雅的技术博客系统。

![React](https://img.shields.io/badge/React-18.3.1-blue)
![TypeScript](https://img.shields.io/badge/TypeScript-5.5.3-blue)
![Vite](https://img.shields.io/badge/Vite-5.4.0-purple)
![Supabase](https://img.shields.io/badge/Supabase-2.45.0-green)
![TailwindCSS](https://img.shields.io/badge/TailwindCSS-3.4.7-cyan)

> 🚀 **快速开始**: 查看 [QUICK_START.md](./QUICK_START.md) 获取详细部署指南

## 功能特性

### 核心功能
- ✅ **Monaco Editor编辑器**: VS Code风格的专业Markdown编辑器
  - 语法高亮、代码补全、快捷键支持
  - 实时预览、同步滚动
  - 图片拖拽上传
  - 工具栏快捷操作
- ✅ **代码语法高亮**: Prism.js专业代码高亮
  - 支持30+种编程语言
  - VS Code主题适配
  - 代码复制功能
  - 代码折叠功能
- ✅ **文章系统**: Markdown 编辑、发布、草稿管理、封面图片
- ✅ **专栏管理**: 创建和管理文章系列
- ✅ **标签系统**: 多标签支持，按标签筛选
- ✅ **评论系统**: 支持游客评论和嵌套回复
- ✅ **社交分享**: 分享到微博、微信、QQ、知乎等平台
- ✅ **用户认证**: 注册、登录、个人中心、资料编辑
- ✅ **统计功能**: 文章浏览量、点赞数统计
- ✅ **主题切换**: 支持深色/浅色/系统自动模式
- ✅ **响应式设计**: 完美适配移动端和桌面端
- ⏳ **LLM润色**: API配置界面预留（需自行配置API Key）

## 技术栈

- **前端**: React 18 + TypeScript + Vite
- **编辑器**: Monaco Editor（VS Code引擎）
- **代码高亮**: Prism.js + react-syntax-highlighter
- **样式**: Tailwind CSS
- **路由**: React Router v6
- **状态管理**: React Context
- **后端**: Supabase (数据库 + 认证 + 存储)
- **部署**: GitHub Pages
- **图标**: Lucide React
- **Markdown**: react-markdown + remark-gfm

## 📚 文档

- 📖 [快速启动指南](./QUICK_START.md) - 5分钟快速部署
- 📝 [编辑器使用指南](./EDITOR_GUIDE.md) - Monaco Editor功能说明
- 💻 [代码高亮指南](./CODE_HIGHLIGHT_GUIDE.md) - 代码语法高亮使用
- 📘 [部署文档](./DEPLOYMENT.md) - 详细部署说明
- 📗 [用户指南](./USER_GUIDE.md) - 功能使用说明
- 📕 [项目交付文档](./PROJECT_FINAL_DELIVERY.md) - 完整功能清单

## 🚀 快速部署

### 一键部署脚本

```bash
# 使用自动部署脚本
bash deploy_to_github.sh YOUR_GITHUB_USERNAME YOUR_REPO_NAME

# 例如:
bash deploy_to_github.sh kvt97483 blog
```

### 手动部署步骤

1. **创建GitHub仓库**（Public）
2. **推送代码**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
   git push -u origin main
   ```
3. **配置GitHub Pages**
   - Settings > Pages
   - Source: GitHub Actions
4. **等待自动构建**（5-10分钟）
5. **访问网站**: `https://YOUR_USERNAME.github.io/YOUR_REPO/`

详细步骤请查看 [QUICK_START.md](./QUICK_START.md)

## 本地开发

> **注意**: 需要 Node.js 20+ 版本

### 1. 克隆仓库

```bash
git clone https://github.com/YOUR_USERNAME/blog.git
cd blog
```

### 2. 安装依赖

```bash
npm install --legacy-peer-deps
```

### 3. 配置环境变量（可选）

复制 `.env.example` 为 `.env.local` 并填写配置:

```bash
cp .env.example .env.local
```

编辑 `.env.local`:
```env
VITE_SUPABASE_URL=your_supabase_url
VITE_SUPABASE_ANON_KEY=your_supabase_anon_key
```

> 项目已内置 Supabase 配置，无需额外配置即可使用

### 4. 启动开发服务器

```bash
npm run dev
```

访问 http://localhost:5173

### 5. 构建生产版本

```bash
npm run build
```

构建产物位于 `dist/` 目录

## 数据库结构

Supabase数据库已完全配置，包含以下表:

### 核心表（12个）

| 表名 | 说明 | 主要字段 |
|------|------|----------|
| `profiles` | 用户资料 | username, avatar_url, bio, role |
| `posts` | 文章主表 | title, content, status, visibility |
| `series` | 专栏系列 | name, description, cover_image |
| `post_series` | 文章-专栏关联 | post_id, series_id |
| `tags` | 标签 | name, slug, post_count |
| `post_tags` | 文章-标签关联 | post_id, tag_id |
| `comments` | 评论 | content, user_id, guest_name |
| `post_views` | 浏览统计 | post_id, viewer_ip, view_count |
| `post_likes` | 点赞统计 | post_id, user_id |
| `media` | 媒体文件 | filename, url, file_type, file_size |
| `llm_settings` | LLM配置 | provider, api_key, model_name |

### Storage Buckets

- `blog-media`: 存储文章图片和用户头像（10MB限制，公开访问）

### 安全策略

所有表均已配置Row Level Security (RLS)策略，确保数据安全。

## 示例数据

运行示例数据脚本以添加测试内容:

```bash
# 在Supabase SQL Editor中执行
cat sample_data.sql
# 记得替换user_id为实际的用户UUID
```

## 项目结构

```
blog/
├── src/
│   ├── components/          # 公共组件
│   │   └── Layout.tsx       # 布局组件（导航、主题切换）
│   ├── contexts/            # React Context
│   │   ├── AuthContext.tsx  # 认证状态管理
│   │   └── ThemeContext.tsx # 主题管理
│   ├── pages/               # 页面组件
│   │   ├── Home.tsx         # 首页（最新/热门文章）
│   │   ├── PostList.tsx     # 文章列表（搜索/筛选/分页）
│   │   ├── PostDetail.tsx   # 文章详情（评论/分享）
│   │   ├── PostEditor.tsx   # 文章编辑器（Markdown）
│   │   ├── SeriesList.tsx   # 专栏列表
│   │   ├── Login.tsx        # 登录页
│   │   ├── Register.tsx     # 注册页
│   │   └── Profile.tsx      # 个人中心
│   ├── lib/                 # 工具库
│   │   └── supabase.ts      # Supabase 客户端
│   ├── App.tsx              # 应用入口
│   ├── main.tsx             # React 入口
│   └── index.css            # 全局样式（Tailwind）
├── public/                  # 静态资源
├── .github/workflows/
│   └── deploy.yml           # GitHub Actions自动部署
├── sample_data.sql          # 示例数据
├── deploy_to_github.sh      # 一键部署脚本
├── QUICK_START.md           # 快速启动指南
├── DEPLOYMENT.md            # 部署文档
├── USER_GUIDE.md            # 用户指南
└── package.json

## 使用说明

### 1. 注册账号

访问网站后点击"注册"按钮，使用邮箱注册账号。

### 2. 发布文章

1. 登录后点击"写文章"按钮
2. 使用Markdown编写文章
3. 添加标题、摘要、标签
4. 选择专栏（可选）
5. 保存为草稿或直接发布

### 3. 管理专栏

在个人中心创建专栏，将相关文章归类管理。

### 4. 评论互动

文章详情页支持登录用户和游客评论，支持嵌套回复。

### 5. 主题切换

点击右上角的主题按钮切换深色/浅色/自动模式。

### 6. LLM润色（可选）

在个人中心配置LLM API（OpenAI/Claude等），使用AI润色文章。

详细使用说明请查看 [USER_GUIDE.md](./USER_GUIDE.md)

## 常见问题

### Q: GitHub Actions构建失败？
A: 检查Node版本是否为20+，确认package.json配置正确。

### Q: 404错误？
A: 确认vite.config.ts中的base路径与仓库名匹配。

### Q: Supabase连接失败？
A: 检查src/lib/supabase.ts中的URL和Key是否正确。

### Q: 如何自定义样式？
A: 修改tailwind.config.js和src/index.css。

## 技术支持

- 📧 Email: kvt97483@163.com
- 📖 文档: 查看docs目录
- 🐛 问题: 在GitHub Issues中反馈

## 开发路线图

- [ ] 代码语法高亮
- [ ] 图片上传功能
- [ ] RSS订阅
- [ ] 全文搜索
- [ ] SEO优化
- [ ] 管理后台
- [ ] 数据统计面板
- [ ] 多语言支持

## License

MIT License - 可自由使用和修改

## 致谢

感谢以下开源项目:

- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
- [Supabase](https://supabase.com/)
- [TailwindCSS](https://tailwindcss.com/)
- [Lucide Icons](https://lucide.dev/)
- [react-markdown](https://github.com/remarkjs/react-markdown)

---

**Made with ❤️ by MiniMax Agent**

**快速开始**: [QUICK_START.md](./QUICK_START.md) | **部署文档**: [DEPLOYMENT.md](./DEPLOYMENT.md) | **用户指南**: [USER_GUIDE.md](./USER_GUIDE.md)
