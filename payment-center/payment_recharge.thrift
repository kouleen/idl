namespace java io.github.kouleen.thrift.payment
namespace go payment
namespace py payment

include "../common/base_query.thrift"
include "payment_recharge_source.thrift"

struct PaymentRechargeRequest {
    1: optional i64 current
    2: optional i64 size
    3: optional i64 id
    4: string orderNo                       // 订单号
    5: optional i64 amount                  // 充值金额 单位(分)
    6: optional i64 payFee                  // 手续费 单位(分)
    7: string rate                          // 本次交易费率
    8: string subject                       // 订单标题
    9: string qrCode                        // 二维码链接/二维码内容(qr_code)
    10: optional i8 payType                 // 支付类型
    11: optional i64 payTime                // 付款时间
    12: optional i64 notifyTime             // 回调时间
    13: string tradeNo                      // 第三方交易号
    14: string flowNo                       // 流程单号
    15: optional i8 workflowStatus          // 审批状态
    16: optional i64 reviewTime             // 审批时间
    17: optional i8 status                  // 订单状态

    90: string remark                       // 备注
    91: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    92: optional i64 createdBy              // 创建人
    93: optional i64 updatedBy              // 修改人
    94: optional i64 createTime             // 创建时间
    95: optional i64 updateTime             // 修改时间

    111: optional payment_recharge_source.PaymentRechargeSourceRequest rechargeSource

    254: list<i64> idList
    255: optional base_query.BaseQueryRequest params
}

struct PaymentRechargeResponse {

    3: i64 id
    4: string orderNo                       // 订单号
    5: i64 amount                           // 充值金额 单位(分)
    6: i64 payFee                           // 手续费 单位(分)
    7: string rate                          // 本次交易费率
    8: string subject                       // 订单标题
    9: string qrCode                        // 二维码链接/二维码内容(qr_code)
    10: optional i8 payType                 // 支付类型
    11: i64 payTime                         // 付款时间
    12: i64 notifyTime                      // 回调时间
    13: string tradeNo                      // 第三方交易号
    14: string flowNo                       // 流程单号
    15: optional i8 workflowStatus          // 审批状态
    16: i64 reviewTime                      // 审批时间
    17: optional i8 status                  // 订单状态

    90: string remark                       // 备注
    91: optional i8 isDelete                // 删除标识 1：删除 0：未删除
    92: i64 createdBy                       // 创建人
    93: i64 updatedBy                       // 修改人
    94: i64 createTime                      // 创建时间
    95: i64 updateTime                      // 修改时间

    111: payment_recharge_source.PaymentRechargeSourceResponse rechargeSource
}

struct PaymentRechargePageResponse {
    1: required i64 total,
    2: list<PaymentRechargeResponse> records
}