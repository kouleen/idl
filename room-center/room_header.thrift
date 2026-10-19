namespace java io.github.kouleen.thrift.room
namespace go room
namespace py room

include "../common/base_query.thrift"

struct RoomHeaderRequest {
    1: optional i64 current = 1
    2: optional i64 size = 10
    3: optional i64 id
    4: optional i64 roomNumber              // 房间编号
    5: string roomName                      // 房间名称
    6: optional i8 roomType                 // 房间类型
    7: string roomImage                     // 房间封面
    8: string background                    // 房间背景
    9: optional i8 open                     // 开播状态
    10: optional i8 status                  // 房间状态
    11: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    12: optional i64 createdBy              // 创建人
    13: optional i64 updatedBy              // 修改人
    14: optional i64 createTime             // 创建时间
    15: optional i64 updateTime             // 修改时间
    16: list<i64> idList

    255: optional base_query.BaseQueryRequest params
}

struct RoomHeaderResponse {
    3: i64 id
    4: i64 roomNumber              // 房间编号
    5: string roomName             // 房间名称
    6: optional i8 roomType        // 房间类型
    7: string roomImage            // 房间封面
    8: string background           // 房间背景
    9: optional i8 open            // 开播状态
    10: optional i8 status         // 房间状态
    11: optional i8 isDelete       // 删除标识 1：删除 0：未删除
    12: i64 createdBy              // 创建人
    13: i64 updatedBy              // 修改人
    14: i64 createTime             // 创建时间
    15: i64 updateTime             // 修改时间
}

struct RoomHeaderPageResponse {
    1: required i64 total,
    2: list<RoomHeaderPageResponse> records
}