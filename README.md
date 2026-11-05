# IDL

Apache Thrift IDL（接口定义语言）仓库，用于定义各微服务的 RPC 接口协议。本仓库同时作为 CloudWeGo Kitex SDK 的自动生成源，通过 CI/CD 流程自动产出多语言 RPC 客户端代码，并通过网关配置实现 HTTP 到 Thrift 的路由映射。

- **Go Module：** `github.com/kouleen/idl`
- **Go Version：** 1.25.0
- **Thrift 编译器：** Apache Thrift（多语言生成）+ CloudWeGo Kitex（Go SDK 生成）
- **服务发现：** etcd（服务名常量见 `rpc/server.thrift`）
- **消息队列：** RabbitMQ（队列名常量见 `common/base_message.thrift`）

---

## 目录结构

```
idl/
├── common/                     # 公共定义
│   ├── base_constant.thrift    # 状态枚举 BaseStatus
│   ├── base_message.thrift     # 各服务 MQ 队列名常量
│   └── base_query.thrift       # 通用查询参数（beginTime/endTime）
├── rpc/
│   └── server.thrift           # 各 RPC 服务注册名常量
├── user-center/                # 用户中心（UserService）
│   ├── user.thrift             #   服务入口
│   ├── user_login.thrift       #   登录/验证码/密码 + LoginType 枚举
│   ├── user_header.thrift      #   用户资料
│   ├── user_position.thrift    #   用户位置
│   ├── user_identity.thrift    #   用户证件
│   └── user_register.thrift    #   注册
├── system-center/              # 系统中心（SystemService）
│   ├── system.thrift           #   服务入口
│   ├── system_dict.thrift      #   字典
│   ├── system_menu.thrift      #   菜单
│   ├── system_role.thrift      #   角色
│   ├── system_role_user.thrift #   角色用户绑定
│   ├── system_area.thrift      #   行政区域
│   ├── system_file.thrift      #   文件上传
│   ├── system_template.thrift  #   模板
│   ├── system_interface.thrift #   接口管理 + MethodType 枚举
│   ├── system_bulletin.thrift  #   公告
│   ├── system_education.thrift #   文案
│   ├── system_login_log.thrift #   登录日志
│   ├── system_operate_log.thrift # 操作日志 + 动作常量
│   └── system_change_log.thrift #  变更日志
├── room-center/                # 房间中心（RoomService）
│   ├── room.thrift             #   服务入口
│   └── room_header.thrift      #   房间数据
├── workflow-center/            # 工作流中心（WorkflowService）
│   ├── workflow.thrift         #   服务入口
│   ├── workflow_segment.thrift #   流程号段
│   └── workflow_process.thrift #   流程单据
├── payment-center/             # 支付中心（仅 namespace，待定义）
├── gift-center/                # 礼物中心（仅 namespace，待定义）
├── guild-center/               # 公会中心（仅 namespace，待定义）
├── stream-center/              # 直播流中心（仅 namespace，待定义）
├── gateway/
│   ├── services.yaml           # HTTP → Thrift 路由映射
│   └── white-path.yaml         # 免鉴权白名单
├── .github/workflows/          # CI/CD（release 分支触发 SDK 生成）
├── Makefile                    # 代码生成与校验命令
├── .gitignore                  # Git 忽略规则（当前仅忽略 .idea）
├── go.mod
└── README.md
```

---

## IDL 定义规范

### 多语言 Namespace

每个 thrift 文件必须声明以下 namespace，以支持 Java / Go / Python 三端代码生成：

```thrift
namespace java io.github.kouleen.thrift.<module>
namespace go <module>
namespace py <module>
```

各模块与 namespace 对应关系：

| 模块 | Java 包 | Go 包 |
| ---- | ------- | ----- |
| common | `io.github.kouleen.thrift.common` | `common` |
| rpc | `io.github.kouleen.thrift.rpc` | `rpc` |
| user | `io.github.kouleen.thrift.user` | `user` |
| system | `io.github.kouleen.thrift.system` | `system` |
| room | `io.github.kouleen.thrift.room` | `room` |
| workflow | `io.github.kouleen.thrift.workflow` | `workflow` |
| payment | `io.github.kouleen.thrift.payment` | `payment` |
| gift | `io.github.kouleen.thrift.gift` | `gift` |
| guild | `io.github.kouleen.thrift.guild` | `guild` |
| stream | `io.github.kouleen.thrift.stream` | `stream` |

### 字段编号约定

所有 Request / Response 结构体遵循统一的字段编号约定：

- `1` ~ `50`：业务字段
- `253`：业务扩展字段（如 `WorkflowProcessRequest.auto`）
- `254`：`list<i64> idList`（批量操作 ID 列表）
- `255`：`optional base_query.BaseQueryRequest params`（通用查询参数）

分页响应统一结构：

```thrift
struct XxxPageResponse {
    1: required i64 total
    2: list<XxxResponse> records
}
```

---

## 公共结构

### BaseQueryRequest（`common/base_query.thrift`）

所有业务查询请求可嵌入的时间范围参数：

| 字段 | 类型 | 说明 |
| ---- | ---- | ---- |
| beginTime | string | 开始时间 |
| endTime | string | 结束时间 |

### BaseStatus（`common/base_constant.thrift`）

| 枚举值 | 数值 | 说明 |
| ------ | ---- | ---- |
| DISABLED | 0 | 禁用 |
| ENABLE | 1 | 启用 |

### RPC 服务名常量（`rpc/server.thrift`）

| 常量 | 值 |
| ---- | -- |
| USER_RPC_SERVER | `user.service.rpc` |
| SYSTEM_RPC_SERVER | `system.service.rpc` |
| ROOM_RPC_SERVER | `room.service.rpc` |
| PAYMENT_RPC_SERVER | `payment.service.rpc` |
| GUILD_RPC_SERVER | `guild.service.rpc` |
| GIFT_RPC_SERVER | `gift.service.rpc` |
| STREAM_RPC_SERVER | `stream.service.rpc` |
| WORKFLOW_RPC_SERVER | `workflow.service.rpc` |

### MQ 队列名常量（`common/base_message.thrift`）

| 常量 | 值 |
| ---- | -- |
| USER_FLOW_REVIEW_QUEUE | `user.flow.review.queue` |
| SYSTEM_LOGIN_LOG_QUEUE | `system.login.log.queue` |
| SYSTEM_OPERATE_LOG_QUEUE | `system.operate.log.queue` |
| SYSTEM_CHANGE_LOG_QUEUE | `system.change.log.queue` |
| SYSTEM_FLOW_REVIEW_QUEUE | `system.flow.review.queue` |
| ROOM_FLOW_REVIEW_QUEUE | `room.flow.review.queue` |
| WORKFLOW_FLOW_REVIEW_QUEUE | `workflow.flow.review.queue` |
| WORKFLOW_FLOW_FAIL_QUEUE | `workflow.flow.fail.queue` |
| PAYMENT_FLOW_REVIEW_QUEUE | `payment.flow.review.queue` |
| GUILD_FLOW_REVIEW_QUEUE | `guild.flow.review.queue` |
| GIFT_FLOW_REVIEW_QUEUE | `gift.flow.review.queue` |
| STREAM_REVIEW_QUEUE | `stream.flow.review.queue` |

### 枚举定义

#### LoginType（`user-center/user_login.thrift`）

| 枚举值 | 数值 | 说明 |
| ------ | ---- | ---- |
| LOGIN_PHONE | 0 | 手机号登录 |
| LOGIN_CAPTCHA | 1 | 账号密码 + 验证码登录 |
| LOGIN_PWD | 2 | 账号密码登录 |

#### MethodType（`system-center/system_interface.thrift`）

HTTP 方法类型枚举：

| 枚举值 | 数值 |
| ------ | ---- |
| GET | 0 |
| HEAD | 2 |
| POST | 3 |
| PUT | 4 |
| PATCH | 5 |
| DELETE | 6 |
| OPTIONS | 7 |
| TRACE | 8 |

### 操作日志动作常量（`system-center/system_operate_log.thrift`）

| 常量 | 值 |
| ---- | -- |
| CREATE | `"CREATE"` |
| DELETE | `"DELETE"` |
| QUERY | `"QUERY"` |
| UPDATE | `"UPDATE"` |

---

## 服务定义

目前共定义 **4 个 Service**，其余 4 个中心（payment / gift / guild / stream）仅有 namespace，尚未定义结构与接口。

### UserService（用户中心）

**Thrift 文件：** `user-center/user.thrift`
**注册名：** `user.service.rpc`
**网关路由前缀：** `/api/user/`

| 方法 | HTTP 路径 | HTTP 方法 | 说明 |
| ---- | --------- | --------- | ---- |
| Captcha | /api/user/captcha | GET | 发送图形验证码 |
| SmsCode | /api/user/sendSmsMessage | GET | 发送手机号验证码 |
| Login | /api/user/login | POST | 用户登录 |
| Register | /api/user/register | POST | 用户注册 |
| ResetPwd | /api/user/resetPwd | POST | 重置密码 |
| Logout | /api/user/logout | POST | 退出登录 |
| QueryUserProfile | /api/user/queryUserProfile | GET | 查询个人信息 |
| UpdateUserProfile | /api/user/updateUserProfile | POST | 修改个人信息 |
| UpdateUserAvatar | /api/user/updateUserAvatar | POST | 修改个人头像 |
| UpdateUserPassword | /api/user/updateUserPwd | POST | 修改个人密码 |
| QueryUserHeaderPage | /api/user/queryUserHeaderPage | GET | 分页查询用户信息 |
| QueryUserHeaderList | /api/user/queryUserHeaderList | GET | 查询用户列表 |
| QueryUserHeaderInfo | /api/user/queryUserHeaderInfo | GET | 查询单个用户详情 |
| UpdateUserHeaderStatus | /api/user/updateUserHeaderStatus | POST | 修改用户状态 |
| DeleteUserHeader | /api/user/deleteUserHeader | POST | 删除/注销用户 |
| QueryUserPositionPage | /api/user/queryUserPositionPage | GET | 分页查询用户位置 |
| QueryUserPositionList | /api/user/queryUserPositionList | GET | 查询用户位置列表 |
| QueryUserPosition | — | — | 查询单个用户位置（IDL 已定义，未配置 HTTP 路由） |
| SaveUserPosition | /api/user/saveUserPosition | POST | 创建用户位置 |
| UpdateUserPosition | /api/user/updateUserPosition | POST | 修改用户位置 |
| DeleteUserPosition | /api/user/deleteUserPosition | POST | 删除用户位置 |
| QueryUserIdentityPage | /api/user/queryUserIdentityPage | GET | 分页查询用户证件 |
| QueryUserIdentityList | /api/user/queryUserIdentityList | GET | 查询用户证件列表 |
| QueryUserIdentity | /api/user/queryUserIdentity | GET | 查询单个证件 |
| SaveUserIdentity | /api/user/saveUserIdentity | POST | 创建证件 |
| UpdateUserIdentity | /api/user/updateUserIdentity | POST | 修改证件 |
| DeleteUserIdentity | /api/user/deleteUserIdentity | POST | 删除证件 |

### SystemService（系统中心）

**Thrift 文件：** `system-center/system.thrift`
**注册名：** `system.service.rpc`
**网关路由前缀：** `/api/system/`

| 分类 | 方法 | 说明 |
| ---- | ---- | ---- |
| 字典 | QuerySystemDictHeaderPage | 分页查询字典头 |
| | QuerySystemDictHeaderList | 查询字典头列表 |
| | QuerySystemDictHeader | 查询单个字典头 |
| | CreateSystemDictHeader | 创建字典头 |
| | UpdateSystemDictHeader | 修改字典头 |
| | DeleteSystemDictHeader | 删除字典头 |
| | QuerySystemDictLinePage | 分页查询字典明细 |
| | QuerySystemDictLineList | 查询字典明细列表 |
| | QuerySystemDictLine | 查询单个字典明细 |
| | CreateSystemDictLine | 创建字典明细 |
| | UpdateSystemDictLine | 修改字典明细 |
| | DeleteSystemDictLine | 删除字典明细 |
| 接口 | QuerySystemInterfacePage | 分页查询接口 |
| | QuerySystemInterfaceList | 查询接口列表 |
| | QuerySystemInterface | 查询单个接口 |
| | SaveSystemInterface | 创建接口 |
| | UpdateSystemInterface | 修改接口 |
| | DeleteSystemInterface | 删除接口 |
| | CleanCacheSystemInterface | 清空接口缓存 |
| 菜单 | QuerySystemMenuTree | 查询菜单树 |
| | QuerySystemMenuList | 查询菜单列表 |
| | QuerySystemMenu | 查询单个菜单 |
| | SaveSystemMenu | 创建菜单 |
| | UpdateSystemMenu | 修改菜单 |
| | DeleteSystemMenu | 删除菜单 |
| 角色 | QuerySystemRolePage | 分页查询角色 |
| | QuerySystemRoleList | 查询角色列表 |
| | QuerySystemRole | 查询单个角色 |
| | SaveSystemRole | 创建角色 |
| | UpdateSystemRole | 修改角色 |
| | UpdateSystemRoleStatus | 修改角色状态 |
| | DeleteSystemRole | 删除角色 |
| 角色用户 | QuerySystemRoleUserPage | 分页查询角色绑定用户 |
| | QuerySystemRoleUserList | 查询角色绑定用户列表 |
| | SaveSystemRoleUser | 批量绑定角色用户 |
| | CancelSystemRoleUser | 批量取消角色用户 |
| 模板 | QuerySystemTemplatePage | 分页查询模板 |
| | QuerySystemTemplate | 查询单个模板 |
| | SaveSystemTemplate | 创建模板 |
| | UpdateSystemTemplate | 修改模板 |
| | DeleteSystemTemplate | 删除模板 |
| 公告 | QuerySystemBulletinPage | 分页查询公告 |
| | QuerySystemBulletin | 查询单个公告 |
| | SaveSystemBulletin | 创建公告 |
| | UpdateSystemBulletin | 修改公告 |
| | DeleteSystemBulletin | 删除公告 |
| 文案 | QuerySystemEducationPage | 分页查询文案 |
| | QuerySystemEducation | 查询单个文案 |
| | SaveSystemEducation | 创建文案 |
| | UpdateSystemEducation | 修改文案 |
| | DeleteSystemEducation | 删除文案 |
| 登录日志 | QuerySystemLoginLogPage | 分页查询登录日志 |
| | ForcedRetreatSystemLoginLog | 强退登录用户 |
| | DeleteSystemLoginLog | 删除登录日志 |
| 操作日志 | QuerySystemOperateLogPage | 分页查询操作日志 |
| | DeleteSystemOperateLog | 删除操作日志 |
| 变更日志 | QuerySystemChangeLogPage | 分页查询变更日志 |
| | DeleteSystemChangeLog | 删除变更日志 |
| 行政区域 | QuerySystemAreaPage | 分页查询区域 |
| | QuerySystemAreaList | 查询区域列表 |
| | QuerySystemArea | 查询单个区域 |
| | SaveSystemArea | 创建区域 |
| | UpdateSystemArea | 修改区域 |
| | DeleteSystemArea | 删除区域 |
| 文件 | UploadSystemFile | 上传文件 |

### RoomService（房间中心）

**Thrift 文件：** `room-center/room.thrift`
**注册名：** `room.service.rpc`
**网关路由前缀：** `/api/room/`

| 方法 | HTTP 路径 | HTTP 方法 | 说明 |
| ---- | --------- | --------- | ---- |
| QueryRoomHeaderPage | /api/room/queryRoomHeaderPage | GET | 分页查询房间 |
| QueryRoomHeaderList | /api/room/queryRoomHeaderList | GET | 查询房间列表 |
| QueryRoomHeader | /api/room/queryRoomHeader | GET | 查询单个房间 |
| CreateRoomHeader | /api/room/createRoomHeader | POST | 创建房间 |
| CommitRoomHeader | /api/room/commitRoomHeader | POST | 提交房间 |
| UpdateRoomHeader | /api/room/updateRoomHeader | POST | 修改房间 |
| DeleteRoomHeader | /api/room/deleteRoomHeader | POST | 删除房间 |

### WorkflowService（工作流中心）

**Thrift 文件：** `workflow-center/workflow.thrift`
**注册名：** `workflow.service.rpc`
**网关路由前缀：** `/api/workflow/`

| 方法 | HTTP 路径 | HTTP 方法 | 说明 |
| ---- | --------- | --------- | ---- |
| QueryWorkflowSegmentPage | /api/workflow/queryWorkflowSegmentPage | GET | 分页查询流程号段 |
| QueryWorkflowSegmentList | /api/workflow/queryWorkflowSegmentList | GET | 查询流程号段列表 |
| QueryWorkflowSegment | /api/workflow/queryWorkflowSegment | GET | 查询单个号段 |
| SaveWorkflowSegment | /api/workflow/saveWorkflowSegment | POST | 创建号段 |
| UpdateWorkflowSegment | /api/workflow/updateWorkflowSegment | POST | 修改号段 |
| UpdateWorkflowSegmentStatus | /api/workflow/updateWorkflowSegmentStatus | POST | 修改号段状态 |
| DeleteWorkflowSegment | /api/workflow/deleteWorkflowSegment | POST | 删除号段 |
| FetchWorkflowSegment | — | — | 抢占号段（仅 RPC 调用，未配置 HTTP 路由） |
| QueryWorkflowProcessPage | /api/workflow/queryWorkflowProcessPage | GET | 分页查询流程单据 |
| QueryWorkflowProcess | /api/workflow/queryWorkflowProcess | GET | 查询单个单据 |
| SaveWorkflowProcess | /api/workflow/saveWorkflowProcess | POST | 创建单据 |
| UpdateWorkflowProcess | /api/workflow/updateWorkflowProcess | POST | 修改单据 |
| DeleteWorkflowProcess | /api/workflow/deleteWorkflowProcess | POST | 删除单据 |

---

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
  - /api/webhook/update
  - /api/user/login
  - /api/user/sendSmsMessage
  - /api/user/captcha
  - /api/user/register
  - /api/user/resetPwd
  - /api/system/querySystemDictLineList
  - /api/system/querySystemInterfaceList
```

---

## 代码生成

### 前置条件

- [Go](https://go.dev/) >= 1.25
- [Apache Thrift](https://thrift.apache.org/) 编译器
- [CloudWeGo Kitex](https://www.cloudwego.io/zh/docs/kitex/) 工具

### 安装 Kitex

```bash
go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
```

### 生成 Go SDK（Kitex）

```bash
# 生成所有 thrift 文件的 SDK
make kitex

# 或手动执行
find . -type f -name "*.thrift" | while read -r file; do
  kitex -module github.com/kouleen/idl -gen-path ./kitex_gen "$file"
done
```

生成的 SDK 代码输出到 `kitex_gen/` 目录。

### 生成 Go 代码（Apache Thrift 原生）

```bash
make thrift
# 等价于
thrift -r --gen go -out ./gen-go <file>
```

输出到 `gen-go/` 目录。

### 生成 Java 代码

```bash
mkdir -p gen-java
thrift -r --gen java -out ./gen-java ./system-center/system.thrift
```

输出到 `gen-java/io/github/kouleen/thrift/<module>/`。

> **重要：** 当前 Java 生成存在阻塞问题，见 [已知问题](#已知问题与待办事项)。

### 使用 Docker 生成（无需本地安装 thrift）

推荐使用官方 `thrift` 镜像（或自建 `ghcr.io/kouleen/thrift:latest`）：

```bash
mkdir -p gen-java
docker run --rm \
  -u "$(id -u):$(id -g)" \
  -v "$PWD:/work" \
  -w /work \
  thrift \
  thrift -r --gen java -out /work/gen-java /work/system-center/system.thrift
```

> 注意：必须在仓库根目录执行，否则 `include "../common/*.thrift"` 无法解析。

### Makefile 命令一览

| 命令 | 说明 |
| ---- | ---- |
| `make help` | 查看所有命令 |
| `make install` | 安装 Kitex 工具 |
| `make kitex` | 生成所有 Thrift 文件的 Kitex SDK |
| `make thrift` | 使用 Apache Thrift 编译器生成 Go 代码 |
| `make lint` | 校验 Thrift 文件语法（使用 thriftgo） |
| `make validate` | 校验网关 YAML 配置 |
| `make check` | 执行完整检查（lint + validate） |
| `make clean` | 清理 `kitex_gen` 和 `gen-go` 生成目录 |

---

## CI/CD 工作流

`.github/workflows/docker-image.yml` 定义了自动 SDK 更新流程：

1. **触发条件：** 推送到 `release` 分支
2. **生成 SDK：** 安装 Kitex 并遍历所有 thrift 文件生成 `kitex_gen`
3. **提交到 gen-sdk 分支：** 将生成的 SDK 与 thrift 源文件、go.mod 一并提交到 `gen-sdk` 分支（若 SDK 无变更则跳过）
4. **版本递增：** 自动递增语义化版本号并打 Tag（vX.Y.Z）
5. **Webhook 通知：** 调用 `https://webapi.kouleen.cn/api/webhook/update?secret=...` 通知下游
6. **触发下游仓库：** 通过 GitHub API 触发 `kouleen/common` 仓库的 `auto_update_idl.yml` 工作流，传入新版本号

所需 Secrets：
- `GITHUB_TOKEN`：自动注入，用于推送代码和打 Tag
- `SECRET`：Webhook 回调密钥
- `CROSS_REPO_PAT`：跨仓库触发 common 仓库 workflow 的 Personal Access Token

---

## 新增服务指南

添加新微服务 IDL 的完整流程：

1. **创建 thrift 文件：** 在对应模块目录下创建 `.thrift` 文件
2. **定义 namespace：** 声明 Java / Go / Python 三端命名空间
3. **include 公共结构：** 引入 `common/base_query.thrift` 等
4. **定义 struct 与 Service：** 声明数据结构和服务接口方法
5. **配置网关路由：** 在 `gateway/services.yaml` 中追加路由映射
6. **提交到 release 分支：** CI 将自动生成 SDK 并发布新版本

---

## 已知问题与待办事项

> 以下问题均基于当前源码逐文件核对得出，建议在后续迭代中修复。

### 1. ⚠️ Java 代码生成阻塞：`module` 字段为 Java 保留字

**现象：** 执行 `thrift --gen java` 时报错：

```
[FAILURE:generation:1] Cannot use reserved language keyword: "module"
```

**根因：** `module` 是 Java 9+ 的受限关键字。以下文件中存在名为 `module` 的字段：

- `system-center/system_operate_log.thrift`（第 16、37 行，Request 与 Response 各一处）
- `workflow-center/workflow_process.thrift`（第 12、31 行，Request 与 Response 各一处）

生成在遇到该字段时中断，导致 `SystemService.java`、`WorkflowService.java` 等 Service 接口类无法产出。

**建议方案：**
- 方案 A（推荐）：将字段重命名为非保留字（如 `moduleType` / `bizModule`），并同步修改 Go / Python 消费端。
- 方案 B：使用 0.16 及更早版本的 Thrift 编译器（该版本未将 `module` 列入关键字表），但生成的 Java 代码在 JDK 9+ 编译时仍可能存在兼容性问题。

### 2. 📋 未完成模块

以下中心仅声明了 namespace，尚未定义 struct 与 Service：

- `payment-center/payment.thrift`
- `gift-center/gift.thrift`
- `guild-center/guild.thrift`
- `stream-center/stream.thrift`

> 说明：`WorkflowService.FetchWorkflowSegment`（抢占号段）未配置 HTTP 路由属**有意设计**，IDL 注释已明确标注"该方法设计为仅内部 RPC 调用"，非缺失项。
