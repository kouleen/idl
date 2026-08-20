# IDL

Apache Thrift IDL（接口定义语言）仓库，用于定义各微服务的 RPC 接口协议。本仓库同时作为 CloudWeGo Kitex SDK 的自动生成源，通过 CI/CD 流程自动产出多语言 RPC 客户端代码。

## 目录结构

```
idl/
├── common/                     # 公共结构体定义
│   ├── base.thrift             # 基础请求/响应结构
│   └── response.thrift         # 通用响应封装 + HTTP 状态码枚举
├── user-center/                # 用户中心服务
│   ├── user.thrift             # UserHeaderService 主服务定义
│   ├── user_login.thrift       # 登录相关请求/响应
│   ├── user_header.thrift     # 用户资料（Profile）结构
│   └── user_position.thrift   # 用户地理位置结构
├── gateway/                    # 网关配置
│   ├── services.yaml           # 服务路由映射配置
│   └── white-path.yaml        # 免鉴权白名单路径
├── kitex_gen/                  # Kitex 自动生成的 SDK（CI 自动产出）
└── .github/workflows/          # GitHub Actions CI/CD 配置
```

## IDL 定义规范

### 多语言 Namespace

每个 thrift 文件必须声明以下 namespace，以支持 Java / Go / Python 三端代码生成：

```thrift
namespace java io.github.kouleen.thrift.<module>
namespace go <module>
namespace py <module>
```

### 公共结构

#### BaseRequest / BaseResponse（`common/base.thrift`）

所有业务请求/响应应继承基础结构，统一携带审计字段：

| 字段       | 类型 | 说明                               |
| ---------- | ---- | ---------------------------------- |
| id         | i64  | 主键 ID                            |
| isDelete   | i32  | 逻辑删除标识（0=未删除, 1=已删除） |
| createdBy  | i64  | 创建人 ID                          |
| updatedBy  | i64  | 更新人 ID                          |
| createTime | i64  | 创建时间戳（毫秒）                 |
| updateTime | i64  | 更新时间戳（毫秒）                 |

#### 通用响应（`common/response.thrift`）

`BaseResponse` 作为统一响应封装，包含签名、状态码、消息体、数据和链路追踪 ID：

| 字段    | 类型       | 必填 | 说明                    |
| ------- | ---------- | ---- | ----------------------- |
| sign    | string     | 否   | 响应签名                |
| code    | HttpStatus | 是   | HTTP 状态码枚举         |
| message | string     | 否   | 提示消息                |
| data    | string     | 否   | 业务数据（JSON 字符串） |
| traceId | string     | 否   | 链路追踪 ID             |

**HttpStatus 枚举值：**

| 枚举值       | 数值 | 说明       |
| ------------ | ---- | ---------- |
| SUCCESS      | 200  | 成功       |
| UNAUTHORIZED | 401  | 未授权     |
| FORBIDDEN    | 403  | 禁止访问   |
| ERROR        | 500  | 服务端错误 |

## 服务定义

### UserHeaderService（用户中心服务）

**Thrift 文件：** `user-center/user.thrift`
**注册名：** `user.service.rpc`
**网关路由前缀：** `/api/user/`

#### 接口列表

| 方法                  | HTTP 路径                           | HTTP 方法 | 说明                      |
| --------------------- | ----------------------------------- | --------- | ------------------------- |
| Login                 | `/api/user/login`                 | POST      | 用户登录（支持密码/短信） |
| SendSmsMessage        | `/api/user/sendSmsMessage`        | GET       | 发送短信验证码            |
| Logout                | `/api/user/logout`                | POST      | 用户登出                  |
| QueryUserHeaderPage   | `/api/user/queryUserHeaderPage`   | GET       | 分页查询用户列表          |
| QueryUserHeaderList   | `/api/user/queryUserHeaderList`   | GET       | 查询用户列表（不分页）    |
| QueryUserHeaderInfo   | `/api/user/queryUserHeaderInfo`   | GET       | 查询单个用户详情          |
| QueryUserPositionPage | `/api/user/queryUserPositionPage` | GET       | 分页查询用户位置          |
| SaveUserPosition      | `/api/user/saveUserPosition`      | POST      | 保存用户位置              |
| UpdateUserPosition    | `/api/user/updateUserPosition`    | POST      | 更新用户位置              |
| DeleteUserPosition    | `/api/user/deleteUserPosition`    | POST      | 删除用户位置              |

### 数据结构

#### LoginRequest（登录请求）

| 字段      | 类型   | 必填 | 说明               |
| --------- | ------ | ---- | ------------------ |
| username  | string | 否   | 用户名             |
| phone     | string | 否   | 手机号             |
| code      | string | 否   | 短信验证码         |
| password  | string | 否   | 密码               |
| loginType | i32    | 否   | 登录类型（默认 0） |
| uuid      | string | 否   | 设备唯一标识       |

#### LoginResponse（登录响应）

| 字段        | 类型   | 说明               |
| ----------- | ------ | ------------------ |
| accessToken | string | 访问令牌           |
| expireTime  | i64    | 过期时间戳（毫秒） |

#### UserHeaderRequest（用户资料请求）

| 字段        | 类型        | 说明         |
| ----------- | ----------- | ------------ |
| userIdList  | list\<i64\> | 用户 ID 列表 |
| username    | string      | 用户名       |
| password    | string      | 密码         |
| nickname    | string      | 昵称         |
| gender      | i32         | 性别         |
| avatar      | string      | 头像 URL     |
| phone       | string      | 手机号       |
| status      | i32         | 状态         |
| PageRequest | PageRequest | 分页参数     |
| BaseRequest | BaseRequest | 基础请求字段 |

#### UserHeaderResponse（用户资料响应）

| 字段         | 类型         | 说明         |
| ------------ | ------------ | ------------ |
| username     | string       | 用户名       |
| password     | string       | 密码         |
| nickname     | string       | 昵称         |
| gender       | i32          | 性别         |
| avatar       | string       | 头像 URL     |
| phone        | string       | 手机号       |
| status       | i32          | 状态         |
| BaseResponse | BaseResponse | 基础响应字段 |

#### UserPositionRequest（用户位置请求）

| 字段        | 类型        | 说明         |
| ----------- | ----------- | ------------ |
| userId      | i64         | 用户 ID      |
| latitude    | double      | 纬度         |
| longitude   | double      | 经度         |
| province    | string      | 省/州        |
| city        | string      | 城市         |
| district    | string      | 区县         |
| street      | string      | 街道         |
| fullAddress | string      | 完整地址     |
| country     | string      | 国家         |
| countryCode | string      | 国家代码     |
| PageRequest | PageRequest | 分页参数     |
| BaseRequest | BaseRequest | 基础请求字段 |

#### UserPositionResponse（用户位置响应）

| 字段         | 类型         | 说明         |
| ------------ | ------------ | ------------ |
| userId       | i64          | 用户 ID      |
| latitude     | double       | 纬度         |
| longitude    | double       | 经度         |
| province     | string       | 省/州        |
| city         | string       | 城市         |
| district     | string       | 区县         |
| street       | string       | 街道         |
| fullAddress  | string       | 完整地址     |
| country      | string       | 国家         |
| countryCode  | string       | 国家代码     |
| BaseResponse | BaseResponse | 基础响应字段 |

#### PageRequest（分页请求）

| 字段    | 类型 | 默认值 | 说明     |
| ------- | ---- | ------ | -------- |
| current | i64  | 1      | 当前页   |
| size    | i64  | 10     | 每页大小 |

#### UserHeaderPageResponse / UserPositionPageResponse（分页响应）

| 字段    | 类型      | 说明           |
| ------- | --------- | -------------- |
| total   | i64       | 总记录数       |
| records | list\<T\> | 当前页记录列表 |

## 网关配置

### services.yaml

网关通过 `gateway/services.yaml` 实现服务路由的自动热加载。新增服务时，只需在此文件追加配置：

```yaml
servers:
  <服务标识>:
    service_name: <etcd 注册的服务名>
    idl_path: <相对 idl 根目录的 thrift 文件路径>
    routes:
      - path: <HTTP 请求路径>
        method: <Thrift Service 方法名>
        http_method: <HTTP 方法>
```

### white-path.yaml

免鉴权白名单路径配置，网关对以下路径跳过身份验证：

```yaml
white_path:
  - /api/webhook/update    # IDL 更新 Webhook
  - /api/user/login             # 用户登录
  - /api/user/sms               # 短信发送
```

## 代码生成

### 前置条件

- [Go](https://go.dev/) >= 1.25
- [Apache Thrift](https://thrift.apache.org/) 编译器
- [CloudWeGo Kitex](https://www.cloudwego.io/zh/docs/kitex/) 工具

### 安装 Kitex

```bash
go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
```

### 生成 Kitex SDK

```bash
# 生成所有 thrift 文件的 SDK
make kitex

# 或手动执行
find ./idl -type f -name "*.thrift" | while read -r file; do
  kitex -module github.com/kouleen/idl -client "$file"
done
```

生成的 SDK 代码将输出到 `kitex_gen/` 目录。

## CI/CD 工作流

`.github/workflows/docker-image.yml` 定义了自动 SDK 更新流程：

1. **触发条件：** 推送到 `release` 分支
2. **Webhook 通知：** 调用远程 API 通知 IDL 变更
3. **代码生成：** 安装 Kitex 并遍历所有 thrift 文件生成 SDK
4. **自动提交：** 若 `kitex_gen` 有变更，自动提交并推送到 `release` 分支
5. **版本递增：** 自动递增语义化版本号并打 Tag

## 新增服务指南

添加新微服务 IDL 的完整流程：

1. **创建 thrift 文件**：在对应模块目录下创建 `.thrift` 文件
2. **定义 namespace**：声明 Java / Go / Python 三端命名空间
3. **include 公共结构**：引入 `common/base.thrift` 和 `common/response.thrift`
4. **定义 Service**：声明服务接口和方法
5. **配置网关路由**：在 `gateway/services.yaml` 中追加路由映射
6. **提交到 release 分支**：CI 将自动生成 SDK 并发布新版本

## 模块信息

- **Go Module：** `github.com/kouleen/idl`
- **Go Version：** 1.25.0
- **License：** Private
