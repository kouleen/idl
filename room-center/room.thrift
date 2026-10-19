namespace java io.github.kouleen.thrift.room
namespace go room
namespace py room

include "room_header.thrift"

service RoomService {
    /******************************************************房间操作*************************************************************/
    // 分页查询房间信息
    room_header.RoomHeaderPageResponse QueryRoomHeaderPage(1: room_header.RoomHeaderRequest req)
    // 查询房间信息
    list<room_header.RoomHeaderResponse> QueryRoomHeaderList(1: room_header.RoomHeaderRequest req)
    room_header.RoomHeaderResponse QueryRoomHeader(1: room_header.RoomHeaderRequest req)
    // 创建房间
    bool CreateRoomHeader(1: room_header.RoomHeaderRequest req)
    // 修改房间
    bool UpdateRoomHeader(1: room_header.RoomHeaderRequest req)
    // 删除房间
    bool DeleteRoomHeader(1: room_header.RoomHeaderRequest req)
    /******************************************************房间操作*************************************************************/
}