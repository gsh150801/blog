#!/bin/bash

# 博客系统Git初始化和部署脚本
# 使用方法: bash deploy_to_github.sh YOUR_GITHUB_USERNAME YOUR_REPO_NAME

set -e

# 检查参数
if [ "$#" -ne 2 ]; then
    echo "❌ 使用方法: bash deploy_to_github.sh YOUR_GITHUB_USERNAME YOUR_REPO_NAME"
    echo "例如: bash deploy_to_github.sh kvt97483 blog"
    exit 1
fi

GITHUB_USERNAME=$1
REPO_NAME=$2
GITHUB_REPO="https://github.com/${GITHUB_USERNAME}/${REPO_NAME}.git"

echo "🚀 开始部署博客系统到GitHub..."
echo "📦 仓库地址: ${GITHUB_REPO}"
echo ""

# 检查是否已经是Git仓库
if [ -d .git ]; then
    echo "⚠️  检测到现有Git仓库，是否重新初始化? (y/n)"
    read -r response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        echo "🗑️  删除现有Git仓库..."
        rm -rf .git
    else
        echo "✅ 使用现有Git仓库"
    fi
fi

# 初始化Git仓库
if [ ! -d .git ]; then
    echo "📝 初始化Git仓库..."
    git init
    git branch -M main
fi

# 检查vite.config.ts中的base路径
echo "🔧 检查Vite配置..."
if grep -q "base: '/blog/'" vite.config.ts; then
    if [ "$REPO_NAME" != "blog" ]; then
        echo "⚠️  检测到base路径为'/blog/'，但仓库名为'${REPO_NAME}'"
        echo "是否更新vite.config.ts中的base路径为'/${REPO_NAME}/'? (y/n)"
        read -r response
        if [[ "$response" =~ ^[Yy]$ ]]; then
            sed -i "s|base: '/blog/'|base: '/${REPO_NAME}/'|g" vite.config.ts
            echo "✅ 已更新base路径"
        fi
    fi
fi

# 添加所有文件
echo "📦 添加文件到Git..."
git add .

# 检查是否有更改
if git diff --staged --quiet; then
    echo "ℹ️  没有新的更改需要提交"
else
    # 提交
    echo "💾 提交更改..."
    git commit -m "Initial commit: Minimalist Blog System

- React 18 + TypeScript + Vite
- Supabase backend (Auth + Database + Storage)
- Responsive design with dark/light theme
- Markdown support for blog posts
- Comment system with guest support
- Social sharing features
- GitHub Pages deployment ready"
fi

# 添加远程仓库
echo "🔗 添加远程仓库..."
if git remote | grep -q origin; then
    git remote remove origin
fi
git remote add origin "$GITHUB_REPO"

# 推送到GitHub
echo "📤 推送到GitHub..."
echo "⚠️  注意：需要输入GitHub账号和密码/令牌"
echo "如果遇到认证问题，请使用Personal Access Token"
echo ""
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo ""
echo "📋 下一步操作："
echo "1. 访问GitHub仓库: https://github.com/${GITHUB_USERNAME}/${REPO_NAME}"
echo "2. 进入 Settings > Pages"
echo "3. Source 选择: GitHub Actions"
echo "4. 等待自动部署（查看Actions标签页）"
echo "5. 部署完成后访问: https://${GITHUB_USERNAME}.github.io/${REPO_NAME}/"
echo ""
echo "🎉 祝您使用愉快！"
