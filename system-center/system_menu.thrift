namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "../common/base.thrift"
include "../common/constant.thrift"

struct PageRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
}

struct SystemMenuRequest {
    1: optional string menuName                      // 菜单名称
    2: optional i64 parentId                         // 父菜单ID
    3: optional i32 orderNum                         // 显示顺序
    4: optional string path                          // 路由地址
    5: optional string component                     // 组件路径
    6: optional string query                         // 路由参数
    7: optional string routeName                     // 路由名称
    8: optional i32 isFrame                          // 是否为外链（0否 1是）
    9: optional i32 isCache                          // 是否缓存（0不缓存 1缓存）
    10: optional i32 menuType                        // 菜单类型（1目录 2菜单 3按钮）
    11: optional i32 visible                         // 是否隐藏（0隐藏 1显示）
    12: optional constant.BaseStatus status          // 状态
    13: optional string perms                        // 权限标识
    14: optional string icon                         // 菜单图标
    15: optional i64 roleId                          // 角色ID
    16: optional PageRequest PageRequest

    255: optional base.BaseRequest BaseRequest
}

struct SystemMenuResponse {
    1: string menuName                      // 菜单名称
    2: i64 parentId                         // 父菜单ID
    3: i32 orderNum                         // 显示顺序
    4: string path                          // 路由地址
    5: string component                     // 组件路径
    6: string query                         // 路由参数
    7: string routeName                     // 路由名称
    8: i32 isFrame                          // 是否为外链（0否 1是）
    9: i32 isCache                          // 是否缓存（0不缓存 1缓存）
    10: i32 menuType                        // 菜单类型（1目录 2菜单 3按钮）
    11: i32 visible                         // 是否隐藏（0隐藏 1显示）
    12: constant.BaseStatus status          // 状态
    13: string perms                        // 权限标识
    14: string icon                         // 菜单图标
    15: list<SystemMenuResponse> children   // 子菜单

    255: base.BaseResponse BaseResponse
}

struct SystemMenuPageResponse {
    1: required i64 total,
    2: required list<SystemMenuResponse> records
}