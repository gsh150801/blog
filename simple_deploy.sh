#!/bin/bash

# 简单GitHub部署脚本
echo "🚀 开始GitHub部署..."

# 设置变量
GITHUB_USER="kvt97483@163.com"
GITHUB_PASSWORD="@7T5V8a396W"
REPO_NAME="blog"
GITHUB_API="https://api.github.com"

# 创建GitHub仓库
echo "📦 创建GitHub仓库: $REPO_NAME"
curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$GITHUB_USER:$GITHUB_PASSWORD" \
  "$GITHUB_API/user/repos" \
  -d '{
    "name": "'$REPO_NAME'",
    "description": "简约优雅的技术博客 - 支持Markdown、评论、搜索、代码高亮",
    "private": false,
    "has_issues": true,
    "has_projects": true,
    "has_wiki": true
  }'

echo "✅ 仓库创建完成"

# 初始化git仓库
echo "🔧 初始化Git仓库..."
cd /workspace/blog
git init
git config user.email "kvt97483@163.com"
git config user.name "kvt97483"

# 添加远程仓库
git remote add origin "https://$GITHUB_USER:$GITHUB_PASSWORD@github.com/$GITHUB_USER/$REPO_NAME.git"

# 添加所有文件
echo "📁 添加项目文件..."
git add .

# 提交代码
echo "💾 提交代码..."
git commit -m "🎉 初始提交: 简约优雅的技术博客系统

✨ 功能特性:
- Monaco Editor (VS Code风格编辑器)
- 代码语法高亮 (30+编程语言)
- 全文搜索 (含分页和热门搜索词)
- 游客评论系统
- 社交分享功能
- 专栏管理
- LLM文章润色
- 响应式设计
- 深色/浅色主题切换

🛠 技术栈:
- React 18 + TypeScript + Vite
- Supabase (数据库 + 认证 + 存储)
- TailwindCSS
- Monaco Editor
- Prism.js

📖 文档:
- START_HERE.md - 快速开始
- USER_GUIDE.md - 完整使用指南
- DEPLOYMENT.md - 部署文档"

# 推送到GitHub
echo "🚀 推送到GitHub..."
git branch -M main
git push -u origin main

echo "✅ 代码推送完成"

# 启用GitHub Pages
echo "🌐 启用GitHub Pages..."
sleep 5  # 等待仓库创建完成

curl -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -u "$GITHUB_USER:$GITHUB_PASSWORD" \
  "$GITHUB_API/repos/$GITHUB_USER/$REPO_NAME/pages" \
  -d '{
    "source": {
      "branch": "main",
      "path": "/"
    }
  }'

echo "🎉 GitHub部署完成!"
echo ""
echo "📋 部署信息:"
echo "   仓库地址: https://github.com/$GITHUB_USER/$REPO_NAME"
echo "   网站地址: https://$GITHUB_USER.github.io/$REPO_NAME"
echo ""
echo "⏰ 部署可能需要5-10分钟生效"
echo "📖 详细文档请查看: README.md"