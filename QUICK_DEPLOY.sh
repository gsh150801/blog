#!/bin/bash

# 极简博客 v2.2.0 快速部署脚本
# 使用方法: bash QUICK_DEPLOY.sh

set -e

echo "=========================================="
echo "极简博客 v2.2.0 快速部署"
echo "=========================================="
echo ""

# 检查Node版本
NODE_VERSION=$(node --version 2>/dev/null || echo "未安装")
echo "当前Node版本: $NODE_VERSION"

if [[ "$NODE_VERSION" < "v20" ]]; then
    echo "⚠️  警告: 需要Node 20+版本"
    echo "请先升级Node版本:"
    echo "  - 使用nvm: nvm install 20 && nvm use 20"
    echo "  - 或访问: https://nodejs.org/"
    echo ""
fi

# 检查环境变量
if [ ! -f ".env" ]; then
    echo "⚠️  未找到.env文件"
    echo "正在从.env.example创建..."
    cp .env.example .env
    echo "✅ 已创建.env文件"
    echo "❗请编辑.env文件，填入您的Supabase配置"
    echo ""
    read -p "按Enter继续..."
fi

# 安装依赖
echo "📦 安装依赖..."
if command -v pnpm &> /dev/null; then
    pnpm install
elif command -v yarn &> /dev/null; then
    yarn install
else
    npm install --legacy-peer-deps
fi

echo "✅ 依赖安装完成"
echo ""

# 构建项目
echo "🔨 构建项目..."
if command -v pnpm &> /dev/null; then
    pnpm build
elif command -v yarn &> /dev/null; then
    yarn build
else
    npm run build
fi

echo "✅ 构建完成"
echo ""

# 显示构建结果
if [ -d "dist" ]; then
    DIST_SIZE=$(du -sh dist | cut -f1)
    echo "📊 构建统计:"
    echo "  - 输出目录: dist/"
    echo "  - 构建大小: $DIST_SIZE"
    echo "  - 文件数量: $(find dist -type f | wc -l)"
    echo ""
fi

echo "=========================================="
echo "✅ 部署准备完成！"
echo "=========================================="
echo ""
echo "下一步部署选项:"
echo ""
echo "1. 本地预览:"
echo "   npm run preview"
echo ""
echo "2. 部署到GitHub Pages:"
echo "   - 推送代码到GitHub"
echo "   - GitHub Actions自动部署"
echo ""
echo "3. 部署到Vercel:"
echo "   vercel --prod"
echo ""
echo "4. 部署到Netlify:"
echo "   netlify deploy --prod --dir=dist"
echo ""
echo "=========================================="
