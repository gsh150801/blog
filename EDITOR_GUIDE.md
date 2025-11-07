# Monaco Editor 富文本编辑器使用指南

## 概述

博客系统已升级集成Monaco Editor（VS Code风格），提供专业级的Markdown写作体验。

## 核心功能

### 1. Monaco Editor集成

**特性**：
- VS Code同款编辑器引擎
- Markdown语法高亮
- 行号显示
- 代码折叠
- 自动缩进
- 智能补全

**主题支持**：
- 自动跟随系统深色/浅色主题
- 实时主题切换
- 护眼色彩方案

### 2. 实时预览

**功能**：
- 左侧编辑，右侧实时预览
- 完整的Markdown渲染
- GFM（GitHub Flavored Markdown）支持
- 支持表格、任务列表、删除线等扩展语法

**切换方式**：
- 点击工具栏"显示/隐藏预览"按钮
- 在移动端自动隐藏预览以节省空间

### 3. 图片上传功能

#### 方式一：拖拽上传
1. 从本地拖拽图片到编辑器区域
2. 自动上传到Supabase Storage
3. 自动插入Markdown图片语法

#### 方式二：点击上传
1. 点击工具栏的"图片"按钮
2. 选择本地图片文件
3. 自动上传并插入

**限制**：
- 支持格式：JPG, PNG, GIF, WebP
- 单文件大小：最大10MB
- 存储位置：Supabase blog-media bucket

**自动生成的Markdown**：
```markdown
![文件名](https://your-supabase-url.com/storage/v1/object/public/blog-media/posts/xxx.jpg)
```

### 4. 快捷键支持

#### 文本格式化
- **Ctrl/Cmd + B**: 粗体 `**文本**`
- **Ctrl/Cmd + I**: 斜体 `*文本*`
- **Ctrl/Cmd + K**: 插入链接 `[文本](url)`

#### 编辑器操作
- **Ctrl/Cmd + S**: 保存文章（自动触发）
- **Ctrl/Cmd + Z**: 撤销
- **Ctrl/Cmd + Shift + Z**: 重做
- **Ctrl/Cmd + F**: 查找
- **Ctrl/Cmd + H**: 替换

#### 高级操作
- **Ctrl/Cmd + /**: 切换注释
- **Alt + Up/Down**: 移动行
- **Shift + Alt + Up/Down**: 复制行
- **Ctrl/Cmd + D**: 选择下一个相同内容

### 5. 工具栏功能

#### 文本格式
- **B**: 粗体
- **I**: 斜体
- **H1/H2/H3**: 标题级别

#### 内容插入
- **链接图标**: 插入超链接
- **图片图标**: 上传图片
- **代码图标**: 插入代码块
- **列表图标**: 插入列表

### 6. 状态栏信息

显示实时统计：
- 字数统计
- 行数统计
- 已上传图片数量

## Markdown语法支持

### 基础语法

```markdown
# 一级标题
## 二级标题
### 三级标题

**粗体文本**
*斜体文本*
~~删除线~~

[链接文本](https://example.com)
![图片描述](image-url.jpg)

> 引用文本

- 无序列表项
- 无序列表项

1. 有序列表项
2. 有序列表项

`行内代码`
```

### 代码块

````markdown
```javascript
function hello() {
  console.log("Hello, World!");
}
```
````

### 表格

```markdown
| 列1 | 列2 | 列3 |
|-----|-----|-----|
| 数据 | 数据 | 数据 |
| 数据 | 数据 | 数据 |
```

### 任务列表

```markdown
- [x] 已完成任务
- [ ] 待完成任务
- [ ] 待完成任务
```

### 分割线

```markdown
---
```

## 使用技巧

### 1. 高效写作流程

1. **起草**：使用Monaco Editor快速输入内容
2. **格式化**：利用快捷键快速格式化文本
3. **插图**：拖拽上传图片，自动插入
4. **预览**：实时查看最终效果
5. **保存**：点击保存或使用Ctrl+S

### 2. 图片管理

**最佳实践**：
- 上传前压缩图片（推荐使用TinyPNG）
- 使用描述性的alt文本
- 合理控制图片数量

**注意事项**：
- 已上传的图片会存储在Supabase
- 删除文章不会自动删除图片
- 可在Supabase Dashboard手动管理

### 3. 性能优化

**编辑器加载**：
- Monaco Editor按需加载
- 首次加载可能需要1-2秒
- 后续使用无延迟

**大文件处理**：
- 支持长文章编辑（10000+字）
- 自动保存功能避免数据丢失
- 建议分段保存长文章

### 4. 协同写作

**草稿功能**：
- 默认保存为草稿
- 随时切换发布状态
- 支持编辑已发布文章

**自动摘要**：
- 留空摘要时自动生成
- 取前200字作为摘要
- 可手动编辑覆盖

## 常见问题

### Q: 编辑器加载缓慢？
A: Monaco Editor首次加载需要下载约2MB资源，请耐心等待。后续使用会从缓存加载。

### Q: 图片上传失败？
A: 检查：
1. 文件大小是否超过10MB
2. 文件格式是否支持
3. 网络连接是否正常
4. Supabase Storage是否配置正确

### Q: 快捷键不生效？
A: 确保编辑器已获得焦点（点击编辑区域），部分浏览器可能拦截某些快捷键。

### Q: 预览显示异常？
A: 检查Markdown语法是否正确，特别是代码块的闭合标记。

### Q: 如何插入视频？
A: Markdown不直接支持视频，可以使用HTML嵌入：
```html
<video src="video-url.mp4" controls></video>
```

### Q: 支持导入导出吗？
A: 当前版本支持复制粘贴Markdown文本，后续将添加导入导出功能。

## 高级功能（计划中）

- [ ] 代码语法高亮（Prism.js集成）
- [ ] 自动保存功能
- [ ] 版本历史
- [ ] 协同编辑
- [ ] Vim/Emacs键绑定
- [ ] 自定义主题
- [ ] 插件系统

## 技术实现

### 依赖包
- `@monaco-editor/react`: Monaco Editor React包装器
- `react-markdown`: Markdown渲染引擎
- `remark-gfm`: GitHub Flavored Markdown支持
- `rehype-raw`: HTML原始内容支持
- `rehype-sanitize`: XSS防护

### 核心组件
- `MonacoEditor.tsx`: 编辑器主组件
- `MarkdownPreview.tsx`: 预览组件
- `imageUpload.ts`: 图片上传工具

### 配置文件
- `package.json`: 依赖配置
- `index.css`: 编辑器样式
- `vite.config.ts`: 构建配置

## 反馈与建议

如有问题或建议，请联系：kvt97483@163.com

---

**版本**: 2.0.0  
**更新日期**: 2025-11-05  
**作者**: MiniMax Agent
