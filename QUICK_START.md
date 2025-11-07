# 博客系统快速启动指南

## 📋 前提条件

- Node.js 20+ 
- Git
- GitHub账号
- Supabase账号（已配置完成）

## 🚀 快速部署到GitHub Pages

### 步骤1：创建GitHub仓库

1. 登录GitHub账号（使用邮箱：kvt97483@163.com）
2. 创建新仓库：
   - 仓库名：`blog` 或其他名称
   - 设置为Public（GitHub Pages免费版需要公开仓库）
   - 不要初始化README

### 步骤2：上传代码

在项目目录（/workspace/blog）执行：

```bash
# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交
git commit -m "Initial commit: Minimalist Blog"

# 添加远程仓库（替换为你的GitHub用户名和仓库名）
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

### 步骤3：配置GitHub Pages

1. 进入GitHub仓库页面
2. 点击 `Settings` > `Pages`
3. Source选择：`GitHub Actions`
4. 保存设置

### 步骤4：等待自动部署

- GitHub Actions会自动开始构建和部署
- 在`Actions`标签页可以查看部署进度
- 部署完成后，GitHub会提供访问URL：`https://YOUR_USERNAME.github.io/YOUR_REPO_NAME/`

## 🔧 本地开发（可选）

如果需要本地开发和测试：

```bash
# 安装依赖（需要Node.js 20+）
npm install --legacy-peer-deps

# 启动开发服务器
npm run dev

# 访问 http://localhost:5173
```

## 📝 配置说明

### Supabase配置

项目已预配置Supabase连接，位于 `src/lib/supabase.ts`。

如需修改配置：
1. 复制`.env.example`为`.env.local`
2. 填入你的Supabase配置
3. 修改`src/lib/supabase.ts`使用环境变量：

```typescript
const supabaseUrl = import.meta.env.VITE_SUPABASE_URL
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY
```

### 修改基础路径

如果仓库名不是`blog`，需要修改`vite.config.ts`：

```typescript
export default defineConfig({
  base: '/YOUR_REPO_NAME/', // 改为你的仓库名
  // ...
})
```

## 🗄️ 数据库结构

数据库已在Supabase中配置完成，包含以下表：

- **profiles**: 用户资料
- **posts**: 文章
- **series**: 专栏
- **post_series**: 文章-专栏关联
- **tags**: 标签
- **post_tags**: 文章-标签关联
- **comments**: 评论（支持游客）
- **post_views**: 浏览统计
- **post_likes**: 点赞统计
- **media**: 媒体文件
- **llm_settings**: LLM API配置

所有表已配置RLS（Row Level Security）策略。

## ✨ 功能特性

- ✅ 响应式设计（支持移动端）
- ✅ 深色/浅色主题切换
- ✅ Markdown文章编辑和渲染
- ✅ 文章分类（专栏）和标签
- ✅ 游客评论系统
- ✅ 社交分享功能
- ✅ 用户认证（注册/登录）
- ✅ 个人资料管理
- ✅ 文章统计（浏览、点赞）
- ⏳ LLM文章润色（界面已预留，需配置API）

## 🐛 故障排除

### GitHub Actions构建失败

1. 检查`Actions`标签页的错误日志
2. 确认Node.js版本为20+
3. 确认依赖安装成功

### 页面404错误

1. 确认GitHub Pages设置正确
2. 检查`vite.config.ts`中的`base`路径是否与仓库名匹配
3. 等待几分钟让部署完全生效

### Supabase连接错误

1. 检查`src/lib/supabase.ts`中的URL和Key是否正确
2. 确认Supabase项目正常运行
3. 检查浏览器控制台的详细错误信息

## 📧 支持

如有问题，请联系：kvt97483@163.com

## 🎉 开始使用

部署完成后：

1. 访问你的博客URL
2. 点击"注册"创建管理员账号
3. 登录后即可开始发布文章
4. 在个人中心配置LLM API（可选）

享受你的简约优雅博客系统！
