
-- =======================================================================================
-- CODE 菜单编号
-- PCODE  菜单父编号
-- PCODES  当前菜单的所有父菜单编号
-- NAME 菜单名称
-- ICON 菜单图标
-- URL url地址
-- SORT 菜单排序号
-- LEVELS 菜单层级  MENU_FLAG 是否是菜单 DESCRIPTION 备注 NEW_PAGE_FLAG 是否打开新页面的标识(字典 OPEN_FLAG 是否打开(字典)
-- =======================================

-- 父操作
INSERT INTO `sys_menu`(CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
( 'points_config', 'shop_mgr', '[0],[shop_mgr],', '脚本管理', '', '/points_config', 1200, 2, 'Y', NULL, 'ENABLE', NULL, NULL, now(), NULL, 1, NULL);

-- 子操作 list
INSERT INTO `sys_menu` (CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
( 'points_config_list', 'points_config', '[0],[shop_mgr],[points_config],', '列表', '', '/points_config/list', 1000, 3, 'N', NULL, 'ENABLE', NULL, NULL,now(), NULL, 1, NULL);

-- 子操作 add
INSERT INTO `sys_menu` (CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
( 'points_config_add', 'points_config', '[0],[shop_mgr],[points_config],', '添加', '', '/points_config/add', 1200, 3, 'N', NULL, 'ENABLE', NULL, NULL, now(), NULL, 1, NULL);

-- 子操作 detail
INSERT INTO `sys_menu` (CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
( 'points_config_detail', 'points_config', '[0],[shop_mgr],[points_config],', '详情', '', '/points_config/detail', 1300, 3, 'N', NULL, 'ENABLE', NULL, NULL, now(), NULL, 1, NULL);

-- 子操作 edit
INSERT INTO `sys_menu` (CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
('points_config_edit', 'points_config', '[0],[shop_mgr],[points_config],', '编辑', '', '/points_config/edit', 1400, 3, 'N', NULL, 'ENABLE', NULL, NULL, now(), NULL, 1, NULL);

-- 子操作 delete
INSERT INTO `sys_menu`(CODE, PCODE,PCODES,NAME,ICON,URL,SORT,LEVELS,MENU_FLAG,DESCRIPTION,STATUS,NEW_PAGE_FLAG,OPEN_FLAG,CREATE_TIME,UPDATE_TIME,CREATE_USER,UPDATE_USER)
VALUES
( 'points_config_delete', 'points_config', '[0],[shop_mgr],[points_config],', '删除', '', '/points_config/delete', 1500, 3, 'N', NULL, 'ENABLE', NULL, NULL, now(), NULL, 1, NULL);



