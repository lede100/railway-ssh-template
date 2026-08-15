# Railway SSH 模板

在 Railway 容器中一键开启 SSH 访问。

## 使用方法

### 1. Fork 本仓库

点击右上角 Fork 到你自己的 GitHub 账号。

### 2. Railway 部署

1. 登录 [Railway](https://railway.app)
2. New Project → Deploy from GitHub Repo → 选择你 fork 的仓库
3. 等待部署完成

### 3. 开启 TCP Proxy（关键步骤）

1. 进入项目 → 点击服务 → Settings
2. 找到 **Networking** → **TCP Proxy**
3. 点击 **Generate Domain**，Railway 会分配一个域名和端口
4. 记下这个域名和端口

### 4. SSH 连接

```bash
ssh root@<分配的域名> -p <分配的端口>
```

默认密码：`abc123`

### 5. 修改密码（必做！）

```bash
passwd
```

## ⚠️ 注意事项

- Railway 容器重启后数据丢失，密码重置为 `abc123`
- **部署后务必修改默认密码**
- 不要在容器中存储重要数据
- Railway 免费额度有限

## 自定义密码

修改 Dockerfile 中的密码：

```dockerfile
echo 'root:你的密码' | chpasswd
```

然后推送到 GitHub，Railway 会自动重新部署。

## 文件说明

| 文件 | 说明 |
|------|------|
| `Dockerfile` | Ubuntu 22.04 + openssh-server |
