# 部署说明

## GitHub Pages 部署步骤

### 1. 创建 GitHub 仓库

在 GitHub 上创建一个新仓库,例如: `kvt97483/blog`

### 2. 初始化 Git 并推送代码

```bash
cd /path/to/blog
git init
git add .
git commit -m "Initial commit: Minimalist Blog"
git branch -M main
git remote add origin https://github.com/kvt97483/blog.git
git push -u origin main
```

### 3. 配置 GitHub Pages

1. 进入仓库的 Settings
2. 在左侧菜单找到 "Pages"
3. 在 "Build and deployment" 部分:
   - Source: 选择 "GitHub Actions"
4. 保存设置

### 4. 触发部署

推送代码到 main 分支会自动触发 GitHub Actions workflow:

```bash
git add .
git commit -m "Update blog"
git push
```

### 5. 查看部署状态

- 在仓库的 "Actions" 标签页查看 workflow 运行状态
- 部署成功后,网站将在几分钟内上线
- 访问地址: `https://kvt97483.github.io/blog/`

## 自定义域名(可选)

### 1. 配置 DNS

在你的域名提供商处添加以下记录:

**Apex 域 (example.com)**:
```
A    @    185.199.108.153
A    @    185.199.109.153
A    @    185.199.110.153
A    @    185.199.111.153
```

**子域 (www.example.com)**:
```
CNAME    www    kvt97483.github.io
```

### 2. 在 GitHub 设置自定义域名

1. 进入仓库 Settings → Pages
2. 在 "Custom domain" 输入你的域名
3. 点击 Save
4. 等待 DNS 验证通过
5. 勾选 "Enforce HTTPS"

### 3. 更新 Vite 配置

编辑 `vite.config.ts`:

```typescript
export default defineConfig({
  plugins: [react()],
  base: '/', // 使用自定义域名时改为 '/'
})
```

## 故障排查

### 404 错误

- 检查 `vite.config.ts` 中的 `base` 配置
- 确保路由使用 HashRouter 或配置了正确的回退

### 构建失败

- 查看 Actions 日志
- 确保 package.json 中的依赖版本兼容
- 检查 Node 版本是否匹配

### 页面空白

- 打开浏览器开发者工具查看控制台错误
- 检查资源路径是否正确
- 确认 Supabase 配置是否正确

## 本地测试部署

在推送到 GitHub 之前,可以本地测试构建:

```bash
npm run build
npm run preview
```

访问 http://localhost:4173 查看构建后的效果。

## 注意事项

1. **Supabase 配置**: 已在 `src/lib/supabase.ts` 中硬编码
2. **RLS 策略**: 确保 Supabase 的 Row Level Security 已正确配置
3. **GitHub Actions 权限**: 确保仓库设置中 Actions 有写入权限
4. **分支保护**: 如果启用了分支保护,需要配置相应的权限

## 后续维护

- 定期更新依赖: `npm update`
- 监控 Supabase 使用量
- 备份数据库
- 检查 Actions workflow 运行状态
