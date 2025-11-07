# 代码语法高亮功能说明

## 功能概述

博客系统已集成Prism.js + react-syntax-highlighter，提供专业级代码语法高亮功能。

## 核心功能

### 1. 多语言支持（30+种）

#### 前端语言
- JavaScript / TypeScript
- JSX / TSX
- HTML / CSS
- SCSS / Sass / Less
- JSON / XML

#### 后端语言
- Python
- Java
- C / C++
- C#
- Go
- Rust
- PHP
- Ruby
- Swift
- Kotlin

#### 数据与配置
- JSON
- YAML
- SQL
- Markdown
- GraphQL

#### 脚本与工具
- Bash / Shell
- PowerShell
- Dockerfile
- Nginx配置

### 2. 代码复制功能

**功能特性**：
- 一键复制代码块全部内容
- 复制成功后显示"已复制"提示
- 2秒后自动恢复"复制"按钮
- 优雅的动画过渡效果

**使用方式**：
- 鼠标悬停代码块，显示复制按钮
- 点击"复制"按钮
- 看到"已复制"确认提示
- 代码已复制到剪贴板

### 3. 代码折叠功能

**自动折叠规则**：
- 代码超过20行自动折叠
- 默认显示前20行
- 底部显示渐变遮罩提示有更多内容
- 显示总行数

**展开/收起**：
- 点击"展开"按钮查看完整代码
- 点击"收起"按钮折叠代码
- 状态可随时切换
- 平滑动画过渡

### 4. 主题适配

#### 深色主题（VS Code Dark+）
- 深色背景配色
- 高对比度语法高亮
- 护眼色彩方案
- 与博客深色主题完美融合

#### 浅色主题（VS Code Light）
- 浅色背景配色
- 清晰的语法高亮
- 阅读友好
- 与博客浅色主题完美融合

#### 自动切换
- 跟随系统主题自动切换
- 与博客全局主题同步
- 实时响应主题变化

### 5. 代码块UI设计

**头部栏**：
- 语言标识（如"JavaScript"）
- 总行数显示
- 折叠/展开按钮
- 复制按钮
- 简洁优雅的设计

**代码区域**：
- 行号显示
- 语法高亮
- 横向滚动条（长代码）
- 适当的内边距
- 舒适的行高

**样式特点**：
- 圆角边框
- 浅色阴影
- 分隔线清晰
- 符合Modern Minimalism风格

## Markdown语法

### 代码块语法

````markdown
```javascript
function hello() {
  console.log("Hello, World!");
}
```
````

### 指定语言

支持的语言标识：

```markdown
```javascript  - JavaScript代码
```typescript  - TypeScript代码
```python      - Python代码
```java        - Java代码
```cpp         - C++代码
```go          - Go代码
```rust        - Rust代码
```html        - HTML代码
```css         - CSS代码
```json        - JSON数据
```yaml        - YAML配置
```bash        - Bash脚本
```sql         - SQL语句
```dockerfile  - Dockerfile
```
```

### 行内代码

使用单反引号：

```markdown
这是一段包含`代码`的文本
```

显示效果：这是一段包含`代码`的文本

## 使用示例

### 示例1：JavaScript代码

````markdown
```javascript
// 函数定义
function fibonacci(n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

// 调用函数
console.log(fibonacci(10)); // 输出: 55
```
````

**显示效果**：
- 语法高亮
- 显示"JavaScript"标识
- 行号显示
- 复制按钮
- （如果超过20行）折叠按钮

### 示例2：Python代码

````markdown
```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        pass

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"

dog = Dog("Buddy")
print(dog.speak())
```
````

### 示例3：JSON数据

````markdown
```json
{
  "name": "博客系统",
  "version": "2.1.0",
  "features": [
    "Monaco Editor",
    "代码高亮",
    "图片上传"
  ]
}
```
````

### 示例4：SQL查询

````markdown
```sql
SELECT u.username, p.title, p.created_at
FROM users u
INNER JOIN posts p ON u.id = p.user_id
WHERE p.status = 'published'
ORDER BY p.created_at DESC
LIMIT 10;
```
````

## 性能优化

### 按需加载
- react-syntax-highlighter自动按需加载语言包
- 只加载使用到的语言
- 首次加载后缓存
- 减少初始包大小

### 懒加载
- 代码块在视口内才渲染高亮
- 长文章加载更快
- 节省内存和CPU资源

### 渲染优化
- 使用React.memo优化组件
- 避免不必要的重新渲染
- 高效的DOM更新

## 兼容性

### 浏览器支持
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+
- 移动端浏览器

### 功能支持
- ✅ 复制到剪贴板（Clipboard API）
- ✅ 平滑滚动
- ✅ CSS Grid布局
- ✅ Flexbox布局

## 常见问题

### Q1: 代码块没有语法高亮？
**A**: 检查：
1. Markdown语法是否正确（三个反引号）
2. 语言标识是否正确
3. 是否支持该语言
4. 浏览器控制台是否有错误

### Q2: 复制按钮不工作？
**A**: 
1. 确认浏览器支持Clipboard API
2. 检查网站是否使用HTTPS
3. 检查浏览器权限设置

### Q3: 代码显示不完整？
**A**: 
1. 检查是否自动折叠（超过20行）
2. 点击"展开"按钮查看完整代码
3. 检查Markdown语法闭合

### Q4: 主题颜色不对？
**A**: 
1. 检查全局主题设置
2. 切换深色/浅色主题测试
3. 刷新页面

### Q5: 如何自定义最大行数？
**A**: 当前默认20行，可在CodeBlock组件中修改maxLines参数。

## 高级用法

### 禁用行号

在CodeBlock组件中设置：
```typescript
<CodeBlock showLineNumbers={false}>
  {code}
</CodeBlock>
```

### 自定义折叠行数

```typescript
<CodeBlock maxLines={30}>
  {code}
</CodeBlock>
```

### 强制展开

```typescript
<CodeBlock maxLines={Infinity}>
  {code}
</CodeBlock>
```

## 技术实现

### 核心依赖
- `prismjs@^1.29.0` - 语法解析
- `react-syntax-highlighter@^15.5.0` - React组件
- `vscDarkPlus / vs` - VS Code主题

### 组件架构
- `CodeBlock.tsx` - 代码块组件
  - 语法高亮
  - 复制功能
  - 折叠功能
  - 主题切换
- `MarkdownPreview.tsx` - Markdown渲染
  - 集成CodeBlock
  - 处理行内代码
  - 自定义组件映射

### 样式系统
- TailwindCSS工具类
- 自定义代码块样式
- 响应式设计
- 深色模式支持

## 设计规范

### 颜色规范
- 背景：浅色模式 #f5f5f5，深色模式 #1e1e1e
- 边框：浅灰色分隔
- 按钮：灰色悬停效果
- 文本：高对比度

### 间距规范
- 代码块外边距：16px上下
- 内边距：16px
- 行高：1.5
- 按钮间距：8px

### 字体规范
- 代码字体：Fira Code, Monaco, Menlo
- 字号：14px（0.875rem）
- 行内代码字号：13px（0.8125rem）

## 最佳实践

### 1. 选择正确的语言标识
- 使用标准语言名称
- 小写字母
- 完整拼写

### 2. 保持代码整洁
- 适当的缩进
- 删除多余空行
- 格式化代码

### 3. 添加注释
- 关键逻辑添加注释
- 使用代码语言的注释语法
- 注释也会被正确高亮

### 4. 合理使用折叠
- 长代码建议分段
- 每段不超过50行
- 重要代码放在前面

### 5. 测试渲染效果
- 发布前预览
- 检查语法高亮
- 确认复制功能
- 测试折叠展开

## 更新日志

### v2.1.0 (2025-11-05)
- ✅ 集成Prism.js语法高亮
- ✅ 支持30+种编程语言
- ✅ 添加代码复制功能
- ✅ 添加代码折叠功能
- ✅ VS Code主题适配
- ✅ 深色/浅色主题完美支持
- ✅ 性能优化（按需加载）

---

**版本**: v2.1.0  
**更新时间**: 2025-11-05  
**作者**: MiniMax Agent
