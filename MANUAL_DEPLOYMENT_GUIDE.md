# 🚀 GitHub部署指南

## 📋 部署概览

您的博客系统已经开发完成并准备好部署！代码已提交到本地Git仓库，现在需要推送到GitHub并启用GitHub Pages。

**项目信息：**
- 📦 项目位置：`/workspace/blog/`
- 🏷️ 建议仓库名：`blog`
- 🌐 部署方式：GitHub Pages（免费）
- ⚡ 自动部署：已配置GitHub Actions

---

## 🎯 手动部署步骤

### 步骤1：创建GitHub仓库

1. **登录GitHub**
   - 访问：https://github.com
   - 使用您的账户：`kvt97483@163.com`
   - 密码：`@7T5V8a396W`

2. **创建新仓库**
   - 点击右上角 "+" → "New repository"
   - 仓库名称：`blog`
   - 描述：`简约优雅的技术博客 - 支持Markdown、评论、搜索、代码高亮`
   - 设置为 **Public**（GitHub Pages免费版要求）
   - 勾选 "Add a README file"
   - 点击 "Create repository"

### 步骤2：推送代码

在您的本地终端中执行以下命令：

```bash
# 进入项目目录
cd /workspace/blog

# 重命名分支为main（GitHub默认分支）
git branch -M main

# 添加GitHub仓库作为远程源
git remote add origin https://kvt97483@163.com:@7T5V8a396W@github.com/kvt97483@163.com/blog.git

# 推送到GitHub
git push -u origin main
```

### 步骤3：启用GitHub Pages

1. **进入仓库设置**
   - 在GitHub仓库页面，点击 "Settings" 标签
   - 滚动到左侧 "Pages" 选项

2. **配置Pages**
   - Source: 选择 "GitHub Actions"
   - 点击 "Save"

3. **等待部署**
   - GitHub Actions将自动运行构建和部署
   - 通常需要3-5分钟
   - 完成后会显示绿色勾选标记

### 步骤4：访问您的博客

部署完成后，您的博客将在以下地址可用：
- **GitHub Pages**: https://kvt97483@163.com.github.io/blog
- **仓库地址**: https://github.com/kvt97483@163.com/blog

---

## 🔧 自动部署说明

项目已配置GitHub Actions自动部署：

**文件位置**: `.github/workflows/deploy.yml`

**部署流程**:
1. 每次推送到 `main` 分支
2. 自动安装Node 20环境
3. 安装依赖并构建项目
4. 部署到GitHub Pages

**环境要求**:
- Node.js 20+
- 已配置Supabase集成
- 所有功能已测试完成

---

## ✅ 部署验证清单

部署完成后，请验证以下功能：

### 基础功能
- [ ] 网站正常加载
- [ ] 导航菜单工作正常
- [ ] 主题切换（深色/浅色）正常
- [ ] 响应式设计在各设备上正常

### 核心功能
- [ ] Monaco Editor编辑器正常加载
- [ ] 代码语法高亮显示正确
- [ ] 全文搜索功能工作
- [ ] 搜索结果分页正常
- [ ] 热门搜索词显示

### 用户功能
- [ ] 用户注册/登录功能
- [ ] 文章创建和编辑
- [ ] 评论系统
- [ ] 社交分享按钮

### 数据功能
- [ ] Supabase数据库连接
- [ ] 文章数据正常显示
- [ ] 用户数据持久化
- [ ] 图片上传功能

---

## 🛠️ 故障排除

### 常见问题

**1. 构建失败**
- 检查Node.js版本（需要20+）
- 查看GitHub Actions日志
- 确认所有依赖正确安装

**2. 页面无法访问**
- 确认GitHub Pages已启用
- 检查仓库是否为Public
- 等待DNS传播（最多24小时）

**3. 功能异常**
- 检查Supabase配置
- 确认环境变量设置
- 查看浏览器控制台错误

### 获取帮助

如果遇到问题：
1. 查看GitHub Actions日志
2. 检查浏览器开发者工具
3. 参考项目文档：`USER_GUIDE.md`

---

## 🎉 部署完成

恭喜！您的简约优雅技术博客已成功部署！

**下一步**：
- 开始使用博客功能
- 撰写您的第一篇文章
- 配置LLM润色功能
- 继续开发剩余功能（数据分析、SEO、邮件通知、RSS）

**重要提醒**：
- 定期备份您的数据
- 监控GitHub Actions运行状态
- 及时更新依赖包

---

*部署指南 v1.0 - 2025-11-05*