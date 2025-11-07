-- 示例数据初始化脚本
-- 注意：需要先注册用户，然后将user_id替换为实际的UUID

-- 1. 创建示例专栏
INSERT INTO series (user_id, name, slug, description, post_count) VALUES
('00000000-0000-0000-0000-000000000000', 'Web开发', 'web-development', '现代Web开发技术与实践', 0),
('00000000-0000-0000-0000-000000000000', '算法学习', 'algorithms', '数据结构与算法笔记', 0),
('00000000-0000-0000-0000-000000000000', '生活随笔', 'life-notes', '记录生活中的点滴思考', 0);

-- 2. 创建示例标签
INSERT INTO tags (name, slug, post_count) VALUES
('React', 'react', 0),
('TypeScript', 'typescript', 0),
('Supabase', 'supabase', 0),
('教程', 'tutorial', 0),
('思考', 'thoughts', 0);

-- 3. 示例文章（需要替换user_id）
-- 文章1：欢迎文章
INSERT INTO posts (
  user_id, 
  title, 
  slug, 
  content, 
  excerpt, 
  status, 
  visibility,
  publish_at
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '欢迎来到我的博客',
  'welcome-to-my-blog',
  '# 欢迎来到我的博客

这是我的第一篇博客文章！

## 关于这个博客

这是一个使用React + Supabase构建的现代化博客系统，具有以下特性：

- 🎨 简约优雅的设计风格
- 📝 支持Markdown写作
- 🌓 深色/浅色主题切换
- 💬 游客评论系统
- 🔐 安全的用户认证
- 📱 完美的响应式设计

## 技术栈

- **前端**: React 18 + TypeScript + Vite
- **后端**: Supabase (PostgreSQL + Auth + Storage)
- **部署**: GitHub Pages
- **样式**: TailwindCSS

希望你喜欢这个博客系统！',
  '欢迎来到我的个人博客，这里将分享技术、生活和思考。',
  'published',
  'public',
  NOW()
);

-- 文章2：技术文章
INSERT INTO posts (
  user_id,
  title,
  slug,
  content,
  excerpt,
  status,
  visibility,
  publish_at
) VALUES (
  '00000000-0000-0000-0000-000000000000',
  '如何使用React和Supabase构建全栈应用',
  'react-supabase-fullstack',
  '# 如何使用React和Supabase构建全栈应用

在这篇文章中，我将分享如何使用React和Supabase快速构建一个全栈应用。

## 什么是Supabase？

Supabase是一个开源的Firebase替代品，提供：

- PostgreSQL数据库
- 用户认证
- 文件存储
- 实时订阅
- Edge Functions

## 开始项目

```bash
# 创建React项目
npm create vite@latest my-app -- --template react-ts

# 安装Supabase客户端
npm install @supabase/supabase-js
```

## 配置Supabase

```typescript
import { createClient } from "@supabase/supabase-js"

const supabase = createClient(
  process.env.SUPABASE_URL,
  process.env.SUPABASE_ANON_KEY
)
```

## 数据库操作

```typescript
// 查询数据
const { data, error } = await supabase
  .from("posts")
  .select("*")
  .order("created_at", { ascending: false })

// 插入数据
const { data, error } = await supabase
  .from("posts")
  .insert({ title: "New Post", content: "..." })
```

## 用户认证

```typescript
// 注册
const { user, error } = await supabase.auth.signUp({
  email: "user@example.com",
  password: "password"
})

// 登录
const { user, error } = await supabase.auth.signIn({
  email: "user@example.com",
  password: "password"
})
```

## 总结

Supabase让全栈开发变得简单快捷，非常适合快速原型开发和MVP项目。',
  '学习如何使用React和Supabase构建现代化的全栈应用。',
  'published',
  'public',
  NOW()
);

-- 注意：
-- 1. 将所有的 '00000000-0000-0000-0000-000000000000' 替换为实际的用户UUID
-- 2. 可以使用以下查询获取用户ID：
--    SELECT id FROM auth.users WHERE email = 'your_email@example.com';
