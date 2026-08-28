namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

struct SystemMenuRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id                              // ID
    4: string menuName                              // 菜单名称
    5: optional i64 parentId                        // 父菜单ID
    6: optional i32 orderNum                        // 显示顺序
    7: string path                                  // 路由地址
    8: string component                             // 组件路径
    9: string query                                 // 路由参数
    10: string routeName                            // 路由名称
    11: optional i8 isFrame                         // 是否为外链（0否 1是）
    12: optional i8 isCache                         // 是否缓存（0不缓存 1缓存）
    13: optional i8 menuType                        // 菜单类型（1目录 2菜单 3按钮）
    14: optional i8 visible                         // 是否隐藏（0隐藏 1显示）
    15: optional i8 status                          // 状态
    16: string perms                                // 权限标识
    17: string icon                                 // 菜单图标
    18: optional i64 roleId                         // 角色ID
    19: optional i8 isDelete                        // 删除标识 1：删除 0：未删除
    20: optional i64 createdBy                      // 创建人
    21: optional i64 updatedBy                      // 修改人
    22: optional i64 createTime                     // 创建时间
    23: optional i64 updateTime                     // 修改时间
}

struct SystemMenuResponse {
    1: i64 id                               // ID
    2: string menuName                      // 菜单名称
    3: i64 parentId                         // 父菜单ID
    4: i32 orderNum                         // 显示顺序
    5: string path                          // 路由地址
    6: string component                     // 组件路径
    7: string query                         // 路由参数
    8: string routeName                     // 路由名称
    9: i8 isFrame                           // 是否为外链（0否 1是）
    10: i8 isCache                          // 是否缓存（0不缓存 1缓存）
    11: i8 menuType                         // 菜单类型（1目录 2菜单 3按钮）
    12: i8 visible                          // 是否隐藏（0隐藏 1显示）
    13: i8 status                           // 状态
    14: string perms                        // 权限标识
    15: string icon                         // 菜单图标
    16: i8 isDelete                         // 删除标识 1：删除 0：未删除
    17: i64 createdBy                       // 创建人
    18: i64 updatedBy                       // 修改人
    19: i64 createTime                      // 创建时间
    20: i64 updateTime                      // 修改时间
    21: list<SystemMenuResponse> children   // 子菜单
}

struct SystemMenuPageResponse {
    1: required i64 total,
    2: list<SystemMenuResponse> records
}
