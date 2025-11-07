# 博客网站使用指南

## 项目概述

您的极简博客已经开发完成!这是一个基于 React + Vite + Supabase 构建的现代化博客系统,具有以下特点:

- **简约优雅**: Modern Minimalism Premium 设计风格
- **功能完整**: 文章、专栏、评论、点赞、分享等核心功能
- **技术先进**: React 18 + TypeScript + Tailwind CSS
- **部署简单**: GitHub Pages + GitHub Actions 自动化部署

## 快速开始

### 第一步: 推送代码到 GitHub

```bash
# 进入项目目录
cd /workspace/blog

# 初始化 git 仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: 极简博客"

# 添加远程仓库(替换为你的仓库地址)
git remote add origin https://github.com/YOUR_USERNAME/blog.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 第二步: 配置 GitHub Pages

1. 进入 GitHub 仓库页面
2. 点击 "Settings" (设置)
3. 在左侧菜单找到 "Pages"
4. 在 "Build and deployment" 部分:
   - Source: 选择 **"GitHub Actions"**
5. 保存设置

### 第三步: 等待自动部署

- 推送代码后,GitHub Actions 会自动开始构建和部署
- 在仓库的 "Actions" 标签页可以查看部署进度
- 部署成功后,网站将在 `https://YOUR_USERNAME.github.io/blog/` 上线

## 功能说明

### 1. 用户注册与登录

访问 `/register` 注册新账号,或访问 `/login` 登录。

### 2. 创建文章

- 登录后点击顶部导航栏的"写文章"图标
- 使用 Markdown 格式编写内容
- 可以保存为草稿或直接发布

### 3. 管理专栏

在个人中心可以创建和管理专栏,将相关文章归类。

### 4. 评论互动

- 登录用户可以直接评论
- 游客需要填写昵称和邮箱
- 评论需要审核后才能显示

### 5. 主题切换

点击顶部导航栏的月亮/太阳图标切换深色/浅色主题。

## 数据库管理

### Supabase 控制台

访问 https://jesrfpcnvkalmjlodxer.supabase.co 使用 Supabase 控制台:

1. **Table Editor**: 管理数据库表和数据
2. **SQL Editor**: 执行自定义 SQL 查询
3. **Authentication**: 管理用户账号
4. **Storage**: 管理上传的图片和文件

### 主要数据表

- `profiles`: 用户资料
- `posts`: 文章
- `series`: 专栏
- `tags`: 标签
- `comments`: 评论
- `post_likes`: 点赞
- `post_views`: 浏览统计

## 常见问题

### Q: 如何审核评论?

A: 登录 Supabase 控制台,在 `comments` 表中将评论的 `status` 从 `pending` 改为 `approved`。

### Q: 如何删除文章?

A: 在文章编辑页面或通过 Supabase 控制台直接删除。

### Q: 如何更换主题颜色?

A: 编辑 `/workspace/blog/tailwind.config.js` 中的颜色配置。

### Q: 如何添加 LLM 润色功能?

A: 这个功能需要额外的 API 集成,可以在后续开发中添加。

### Q: 页面显示空白怎么办?

A: 
1. 检查浏览器控制台错误信息
2. 确认 Supabase 配置正确
3. 检查 vite.config.ts 中的 base 配置是否正确

### Q: 如何使用自定义域名?

A: 参考 DEPLOYMENT.md 文档中的"自定义域名"部分。

## 项目结构

```
blog/
├── src/
│   ├── components/       # 公共组件
│   ├── contexts/         # Context API
│   ├── pages/            # 页面组件
│   ├── lib/              # 工具库
│   ├── App.tsx           # 应用入口
│   └── main.tsx          # React 入口
├── public/               # 静态资源
├── .github/workflows/    # GitHub Actions
├── README.md             # 项目说明
├── DEPLOYMENT.md         # 部署文档
└── package.json          # 依赖配置
```

## 进阶功能

### 1. LLM 文章润色

要添加 LLM 润色功能,需要:

1. 在 Supabase 中创建 `llm_settings` 表存储 API 配置
2. 创建 Edge Function 调用 LLM API
3. 在编辑器页面添加"润色"按钮

### 2. 社交分享

已集成微博、QQ、知乎等平台的分享功能,点击分享按钮即可使用。

### 3. 图片上传

已配置 Supabase Storage bucket (`blog-media`),可以在编辑器中集成图片上传功能。

## 技术支持

如有问题,请参考:

1. **README.md**: 基础使用说明
2. **DEPLOYMENT.md**: 详细部署指南
3. **Supabase 文档**: https://supabase.com/docs
4. **React 文档**: https://react.dev
5. **Tailwind CSS 文档**: https://tailwindcss.com

## 后续开发建议

1. **富文本编辑器**: 集成更强大的 Markdown 编辑器
2. **代码高亮**: 添加语法高亮支持
3. **搜索功能**: 实现全文搜索
4. **数据分析**: 添加文章统计和分析功能
5. **SEO 优化**: 添加 meta 标签和 sitemap
6. **邮件通知**: 评论和点赞的邮件提醒
7. **RSS 订阅**: 生成 RSS feed

## 许可证

MIT License

---

**享受你的博客之旅!** 🎉
