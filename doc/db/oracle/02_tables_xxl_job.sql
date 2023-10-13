--
-- 创建调度扩展信息表：用于保存XXL-JOB调度任务的扩展信息，如任务分组、任务名、机器地址、执行器、执行入参和报警邮件等等；
--
CREATE TABLE xxl_job_info (
  id                         NUMBER(11, 0)       NOT NULL,
  job_group                  NUMBER(11, 0)       NOT NULL,
  job_desc                   VARCHAR2(255 CHAR)  NOT NULL,
  add_time                   DATE                DEFAULT NULL,
  update_time                DATE                DEFAULT NULL,
  author                     VARCHAR2(64 CHAR)   DEFAULT NULL,
  alarm_email                VARCHAR2(255 CHAR)  DEFAULT NULL,
  schedule_type              VARCHAR2(50 CHAR)   DEFAULT 'NONE' NOT NULL,
  schedule_conf              VARCHAR2(128 CHAR)  DEFAULT NULL,
  misfire_strategy           VARCHAR2(50 CHAR)   DEFAULT 'DO_NOTHING' NOT NULL,
  executor_route_strategy    VARCHAR2(50 CHAR)   DEFAULT NULL,
  executor_handler           VARCHAR2(255 CHAR)  DEFAULT NULL,
  executor_param             VARCHAR2(512 CHAR)  DEFAULT NULL,
  executor_block_strategy    VARCHAR2(50 CHAR)   DEFAULT NULL,
  executor_timeout           NUMBER(11, 0)       DEFAULT 0 NOT NULL,
  executor_fail_retry_count  NUMBER(11, 0)       DEFAULT 0 NOT NULL,
  glue_type                  VARCHAR2(50 CHAR)   NOT NULL,
  glue_source                CLOB,
  glue_remark                VARCHAR2(128 CHAR)  DEFAULT NULL,
  glue_updatetime            DATE                DEFAULT NULL,
  child_jobid                VARCHAR2(255 CHAR)  DEFAULT NULL,
  trigger_status             NUMBER(4, 0)        DEFAULT 0 NOT NULL,
  trigger_last_time          NUMBER(13, 0)       DEFAULT 0 NOT NULL,
  trigger_next_time          NUMBER(13, 0)       DEFAULT 0 NOT NULL
);
comment on table xxl_job_info
  is 'XXL-JOB-调度扩展信息表';
comment on column xxl_job_info.id
  is '主键';
comment on column xxl_job_info.job_group
  is '执行器主键';
comment on column xxl_job_info.job_desc
  is '执行器描述';
comment on column xxl_job_info.add_time
  is '创建时间';
comment on column xxl_job_info.update_time
  is '更新时间';
comment on column xxl_job_info.author
  is '作者';
comment on column xxl_job_info.alarm_email
  is '报警邮件';
comment on column xxl_job_info.schedule_type
  is '调度类型';
comment on column xxl_job_info.schedule_conf
  is '调度配置，值含义取决于调度类型';
comment on column xxl_job_info.misfire_strategy
  is '调度过期策略';
comment on column xxl_job_info.executor_route_strategy
  is '执行器路由策略';
comment on column xxl_job_info.executor_handler
  is '执行器任务处理器';
comment on column xxl_job_info.executor_param
  is '执行器任务参数';
comment on column xxl_job_info.executor_block_strategy
  is '阻塞处理策略';
comment on column xxl_job_info.executor_timeout
  is '任务执行超时时间，单位秒';
comment on column xxl_job_info.executor_fail_retry_count
  is '失败重试次数';
comment on column xxl_job_info.glue_type
  is 'GLUE类型';
comment on column xxl_job_info.glue_source
  is 'GLUE源代码';
comment on column xxl_job_info.glue_remark
  is 'GLUE备注';
comment on column xxl_job_info.glue_updatetime
  is 'GLUE更新时间';
comment on column xxl_job_info.child_jobid
  is '子任务ID，多个逗号分隔';
comment on column xxl_job_info.trigger_status
  is '调度状态：0-停止，1-运行';
comment on column xxl_job_info.trigger_last_time
  is '上次调度时间';
comment on column xxl_job_info.trigger_next_time
  is '下次调度时间';
-- 添加主键
alter table xxl_job_info
  add constraint pk_xxl_job_info primary key (id)
  using index;

--
-- 创建调度日志表：用于保存XXL-JOB任务调度的历史信息，如调度结果、执行结果、调度入参、调度机器和执行器等等；
--
CREATE TABLE xxl_job_log (
  id                         NUMBER(20, 0)       NOT NULL,
  job_group                  NUMBER(11, 0)       NOT NULL,
  job_id                     NUMBER(11, 0)       NOT NULL,
  executor_address           VARCHAR2(255 CHAR)  DEFAULT NULL,
  executor_handler           VARCHAR2(255 CHAR)  DEFAULT NULL,
  executor_param             VARCHAR2(512 CHAR)  DEFAULT NULL,
  executor_sharding_param    VARCHAR2(20 CHAR)   DEFAULT NULL,
  executor_fail_retry_count  NUMBER(11, 0)       DEFAULT 0 NOT NULL,
  trigger_time               DATE                DEFAULT NULL,
  trigger_code               NUMBER(11, 0)       NOT NULL,
  trigger_msg                CLOB,
  handle_time                DATE                DEFAULT NULL,
  handle_code                NUMBER(11, 0)       NOT NULL,
  handle_msg                 CLOB,
  alarm_status               NUMBER(4, 0)        DEFAULT 0 NOT NULL
);
comment on table xxl_job_log
  is 'XXL-JOB-调度日志表';
comment on column xxl_job_log.id
  is '主键';
comment on column xxl_job_log.job_group
  is '执行器主键';
comment on column xxl_job_log.job_id
  is '任务主键';
comment on column xxl_job_log.executor_address
  is '执行器地址，本次执行的地址';
comment on column xxl_job_log.executor_handler
  is '执行器任务处理器';
comment on column xxl_job_log.executor_param
  is '执行器任务参数';
comment on column xxl_job_log.executor_sharding_param
  is '执行器任务分片参数，格式如 1/2';
comment on column xxl_job_log.executor_fail_retry_count
  is '失败重试次数';
comment on column xxl_job_log.trigger_time
  is '调度-时间';
comment on column xxl_job_log.trigger_code
  is '调度-结果';
comment on column xxl_job_log.trigger_msg
  is '调度-日志';
comment on column xxl_job_log.handle_time
  is '执行-时间';
comment on column xxl_job_log.handle_code
  is '执行-状态';
comment on column xxl_job_log.handle_msg
  is '执行-日志';
comment on column xxl_job_log.alarm_status
  is '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';
-- 添加索引
create index idx_trigger_time on xxl_job_log (trigger_time);
create index idx_handle_code on xxl_job_log (handle_code);
-- 添加主键
alter table xxl_job_log
  add constraint pk_xxl_job_log primary key (id)
  using index;

--
-- 创建调度日志报表：用户存储XXL-JOB任务调度日志的报表，调度中心报表功能页面会用到；
--
CREATE TABLE xxl_job_log_report (
  id             NUMBER(11, 0)  NOT NULL,
  trigger_day    DATE           DEFAULT NULL,
  running_count  NUMBER(11, 0)  DEFAULT 0 NOT NULL,
  suc_count      NUMBER(11, 0)  DEFAULT 0 NOT NULL,
  fail_count     NUMBER(11, 0)  DEFAULT 0 NOT NULL,
  update_time    DATE           DEFAULT NULL
);
comment on table xxl_job_log_report
  is 'XXL-JOB-调度日志报表';
comment on column xxl_job_log_report.id
  is '主键';
comment on column xxl_job_log_report.trigger_day
  is '调度-时间';
comment on column xxl_job_log_report.running_count
  is '运行中-日志数量';
comment on column xxl_job_log_report.suc_count
  is '执行成功-日志数量';
comment on column xxl_job_log_report.fail_count
  is '执行失败-日志数量';
comment on column xxl_job_log_report.update_time
  is '更新时间';
-- 添加索引
create unique index idx_trigger_day on xxl_job_log_report (trigger_day);
-- 添加主键
alter table xxl_job_log_report
  add constraint pk_xxl_job_log_report primary key (id)
  using index;

--
-- 创建任务GLUE日志表：用于保存GLUE更新历史，用于支持GLUE的版本回溯功能；
--
CREATE TABLE xxl_job_logglue (
  id           NUMBER(11, 0)       NOT NULL,
  job_id       NUMBER(11, 0)       NOT NULL,
  glue_type    VARCHAR2(50 CHAR)   DEFAULT NULL,
  glue_source  CLOB,
  glue_remark  VARCHAR2(128 CHAR)  NOT NULL,
  add_time     DATE                DEFAULT NULL,
  update_time  DATE                DEFAULT NULL
);
comment on table xxl_job_logglue
  is 'XXL-JOB-任务GLUE日志表';
comment on column xxl_job_logglue.id
  is '主键';
comment on column xxl_job_logglue.job_id
  is '任务主键';
comment on column xxl_job_logglue.glue_type
  is 'GLUE类型';
comment on column xxl_job_logglue.glue_source
  is 'GLUE源代码';
comment on column xxl_job_logglue.glue_remark
  is 'GLUE备注';
comment on column xxl_job_logglue.add_time
  is '创建时间';
comment on column xxl_job_logglue.update_time
  is '更新时间';
-- 添加主键
alter table xxl_job_logglue
  add constraint pk_xxl_job_logglue primary key (id)
  using index;

--
-- 创建执行器注册表，维护在线的执行器和调度中心机器地址信息；
--
CREATE TABLE xxl_job_registry (
  id              NUMBER(11, 0)       NOT NULL,
  registry_group  VARCHAR2(50 CHAR)   NOT NULL,
  registry_key    VARCHAR2(255 CHAR)  NOT NULL,
  registry_value  VARCHAR2(255 CHAR)  NOT NULL,
  update_time     DATE                DEFAULT NULL
);
comment on table xxl_job_registry
  is 'XXL-JOB-执行器注册表';
comment on column xxl_job_registry.id
  is '主键';
comment on column xxl_job_registry.registry_group
  is '执行器的组';
comment on column xxl_job_registry.registry_key
  is '执行器的键';
comment on column xxl_job_registry.registry_value
  is '执行器的值';
comment on column xxl_job_registry.update_time
  is '更新时间';
-- 添加索引
create index idx_g_k_v on xxl_job_registry (registry_group, registry_key, registry_value);
-- 添加主键
alter table xxl_job_registry
  add constraint pk_xxl_job_registry primary key (id)
  using index;

--
-- 创建执行器信息表，维护任务执行器信息；
--
CREATE TABLE xxl_job_group (
  id            NUMBER(11, 0)       NOT NULL,
  app_name      VARCHAR2(64 CHAR)   NOT NULL,
  title         VARCHAR2(12 CHAR)   NOT NULL,
  address_type  NUMBER(4, 0)        DEFAULT 0 NOT NULL,
  address_list  CLOB,
  update_time   DATE                DEFAULT NULL
);
comment on table xxl_job_group
  is 'XXL-JOB-执行器信息表';
comment on column xxl_job_group.id
  is '主键';
comment on column xxl_job_group.app_name
  is '执行器AppName';
comment on column xxl_job_group.title
  is '执行器名称';
comment on column xxl_job_group.address_type
  is '执行器地址类型：0=自动注册、1=手动录入';
comment on column xxl_job_group.address_list
  is '执行器地址列表，多地址逗号分隔';
comment on column xxl_job_group.update_time
  is '更新时间';
-- 添加主键
alter table xxl_job_group
  add constraint pk_xxl_job_group primary key (id)
  using index;

--
-- 创建系统用户表；
--
CREATE TABLE xxl_job_user (
  id          NUMBER(11, 0)       NOT NULL,
  username    VARCHAR2(50 CHAR)   NOT NULL,
  password    VARCHAR2(50 CHAR)   NOT NULL,
  role        NUMBER(4, 0)        NOT NULL,
  permission  VARCHAR2(255 CHAR)  DEFAULT NULL
);
comment on table xxl_job_user
  is 'XXL-JOB-系统用户表';
comment on column xxl_job_user.id
  is '主键';
comment on column xxl_job_user.username
  is '账号';
comment on column xxl_job_user.password
  is '密码';
comment on column xxl_job_user.role
  is '角色：0-普通用户、1-管理员';
comment on column xxl_job_user.permission
  is '权限：执行器ID列表，多个逗号分割';
-- 添加索引
create unique index idx_username on xxl_job_user (username);
-- 添加主键
alter table xxl_job_user
  add constraint pk_xxl_job_user primary key (id)
  using index;

--
-- 创建任务调度锁表；
--
CREATE TABLE xxl_job_lock (
  lock_name  VARCHAR2(50 CHAR)  NOT NULL
);
comment on table xxl_job_lock
  is 'XXL-JOB-任务调度锁表';
comment on column xxl_job_lock.lock_name
  is '锁名称';
-- 添加主键
alter table xxl_job_lock
  add constraint pk_xxl_job_lock primary key (lock_name)
  using index;
