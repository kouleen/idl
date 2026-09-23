namespace java io.github.kouleen.thrift.system
namespace go system
namespace py system

include "system_dict.thrift"
include "system_menu.thrift"
include "system_role.thrift"
include "system_template.thrift"
include "system_interface.thrift"
include "system_role_user.thrift"
include "system_bulletin.thrift"
include "system_education.thrift"

service SystemService {
    /******************************************************字典*************************************************************/
    // 分页查询字典信息
    system_dict.SystemDictHeaderPageResponse QuerySystemDictHeaderPage(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    // 查询字典信息
    list<system_dict.SystemDictHeaderResponse> QuerySystemDictHeaderList(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    system_dict.SystemDictHeaderResponse QuerySystemDictHeader(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    // 创建字典信息
    bool CreateSystemDictHeader(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    // 修改字典信息
    bool UpdateSystemDictHeader(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    // 删除字典信息
    bool DeleteSystemDictHeader(1: system_dict.SystemDictHeaderRequest systemDictHeaderRequest)
    // 分页查询字典明细信息
    system_dict.SystemDictLinePageResponse QuerySystemDictLinePage(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    // 查询字典明细信息
    list<system_dict.SystemDictLineResponse> QuerySystemDictLineList(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    system_dict.SystemDictLineResponse QuerySystemDictLine(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    // 创建字典明细信息
    bool CreateSystemDictLine(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    // 修改字典明细信息
    bool UpdateSystemDictLine(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    // 删除字典明细信息
    bool DeleteSystemDictLine(1: system_dict.SystemDictLineRequest systemDictLineRequest)
    /******************************************************字典*************************************************************/
    /******************************************************接口*************************************************************/
    // 分页查询接口地址
    system_interface.SystemInterfacePageResponse QuerySystemInterfacePage(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 查询接口地址
    list<system_interface.SystemInterfaceResponse> QuerySystemInterfaceList(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 查询接口地址
    system_interface.SystemInterfaceResponse QuerySystemInterface(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 创建接口
    bool saveSystemInterface(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 修改接口
    bool UpdateSystemInterface(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 删除接口
    bool DeleteSystemInterface(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    // 清空接口缓存
    bool CleanCacheSystemInterface(1: system_interface.SystemInterfaceRequest systemInterfaceRequest)
    /******************************************************接口*************************************************************/
    /******************************************************菜单*************************************************************/
    // 查询菜单信息(树)
    list<system_menu.SystemMenuResponse> QuerySystemMenuTree(1: system_menu.SystemMenuRequest systemMenuRequest)
    // 查询菜单信息
    list<system_menu.SystemMenuResponse> QuerySystemMenuList(1: system_menu.SystemMenuRequest systemMenuRequest)
    // 查询菜单信息
    system_menu.SystemMenuResponse QuerySystemMenu(1: system_menu.SystemMenuRequest systemMenuRequest)
    // 创建菜单信息
    bool SaveSystemMenu(1: system_menu.SystemMenuRequest systemMenuRequest)
    // 修改菜单信息
    bool UpdateSystemMenu(1: system_menu.SystemMenuRequest systemMenuRequest)
    // 删除菜单信息
    bool DeleteSystemMenu(1: system_menu.SystemMenuRequest systemMenuRequest)
    /******************************************************菜单*************************************************************/
    /******************************************************角色*************************************************************/
    // 分页查询角色信息
    system_role.SystemRolePageResponse QuerySystemRolePage(1: system_role.SystemRoleRequest systemRoleRequest)
    // 查询角色信息
    system_role.SystemRoleResponse QuerySystemRole(1: system_role.SystemRoleRequest systemRoleRequest)
    // 创建角色信息
    bool SaveSystemRole(1: system_role.SystemRoleRequest systemRoleRequest)
    // 修改角色信息
    bool UpdateSystemRole(1: system_role.SystemRoleRequest systemRoleRequest)
    // 修改角色状态
    bool UpdateSystemRoleStatus(1: system_role.SystemRoleRequest systemRoleRequest)
    // 删除角色信息
    bool DeleteSystemRole(1: system_role.SystemRoleRequest systemRoleRequest)
    /******************************************************角色*************************************************************/
    /******************************************************角色用户**********************************************************/
    // 分页查询角色绑定的用户信息
    system_role_user.SystemRoleUserPageResponse QuerySystemRoleUserPage(1: system_role_user.SystemRoleUserRequest systemRoleUserRequest)
    // 查询角色绑定的用户信息
    list<system_role_user.SystemRoleUserResponse> QuerySystemRoleUserList(1: system_role_user.SystemRoleUserRequest systemRoleUserRequest)
    // 批量创建角色用户
    bool SaveSystemRoleUser(1: system_role_user.SystemRoleUserRequest systemRoleUserRequest)
    // 批量取消角色用户
    bool CancelSystemRoleUser(1: system_role_user.SystemRoleUserRequest systemRoleUserRequest)
    /******************************************************角色用户**********************************************************/
    /******************************************************模板*************************************************************/
    // 分页查询系统模板
    system_template.SystemTemplatePageResponse QuerySystemTemplatePage(1: system_template.SystemTemplateRequest systemTemplateRequest)
    // 查询系统模板
    system_template.SystemTemplateResponse QuerySystemTemplate(1: system_template.SystemTemplateRequest systemTemplateRequest)
    // 创建系统模板
    bool SaveSystemTemplate(1: system_template.SystemTemplateRequest systemTemplateRequest)
    // 修改系统模板
    bool UpdateSystemTemplate(1: system_template.SystemTemplateRequest systemTemplateRequest)
    // 删除系统模板
    bool DeleteSystemTemplate(1: system_template.SystemTemplateRequest systemTemplateRequest)
    /******************************************************模板*************************************************************/
    /******************************************************公告*************************************************************/
    // 分页查询系统公告
    system_bulletin.SystemBulletinPageResponse QuerySystemBulletinPage(1: system_bulletin.SystemBulletinRequest systemBulletinRequest)
    // 查询系统公告
    system_bulletin.SystemBulletinResponse QuerySystemBulletin(1: system_bulletin.SystemBulletinRequest systemBulletinRequest)
    // 创建系统公告
    bool SaveSystemBulletin(1: system_bulletin.SystemBulletinRequest systemBulletinRequest)
    // 修改系统公告
    bool UpdateSystemBulletin(1: system_bulletin.SystemBulletinRequest systemBulletinRequest)
    // 删除系统公告
    bool DeleteSystemBulletin(1: system_bulletin.SystemBulletinRequest systemBulletinRequest)
    /******************************************************公告*************************************************************/
    /******************************************************文案*************************************************************/
    // 分页查询系统文案
    system_education.SystemEducationPageResponse QuerySystemEducationPage(1: system_education.SystemEducationRequest systemEducationRequest)
    // 查询系统文案
    system_education.SystemEducationResponse QuerySystemEducation(1: system_education.SystemEducationRequest systemEducationRequest)
    // 创建系统文案
    bool SaveSystemEducation(1: system_education.SystemEducationRequest systemEducationRequest)
    // 修改系统文案
    bool UpdateSystemEducation(1: system_education.SystemEducationRequest systemEducationRequest)
    // 删除系统文案
    bool DeleteSystemEducation(1: system_education.SystemEducationRequest systemEducationRequest)
    /******************************************************文案*************************************************************/
}