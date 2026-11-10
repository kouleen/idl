namespace java io.github.kouleen.thrift.payment
namespace go payment
namespace py payment

include "../common/base_query.thrift"

struct PaymentRechargeSourceRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string orderNo                       // 订单号
    7: string paySource                     // 支付来源
    8: string sourceNo                      // 来源单号

    90: string remark                       // 备注
    91: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    92: optional i64 createdBy              // 创建人
    93: optional i64 updatedBy              // 修改人
    94: optional i64 createTime             // 创建时间
    95: optional i64 updateTime             // 修改时间

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct PaymentRechargeSourceResponse {
    3: i64 id
    4: string orderNo                       // 订单号
    7: string paySource                     // 支付来源
    8: string sourceNo                      // 来源单号

    90: string remark                       // 备注
    91: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    92: i64 createdBy                       // 创建人
    93: i64 updatedBy                       // 修改人
    94: i64 createTime                      // 创建时间
    95: i64 updateTime                      // 修改时间
}

struct PaymentRechargeSourcePageResponse {
    1: required i64 total,
    2: list<PaymentRechargeSourceResponse> records
}