--
-- 插入测试数据
--
INSERT INTO xxl_job_group
  (app_name, title, address_type, address_list, update_time)
VALUES
  ('xxl-job-executor-sample',
   '示例执行器',
   0,
   NULL,
   TO_DATE('2018-11-03 22:21:31', 'YYYY-MM-DD HH24:MI:SS'));
--
-- 插入测试数据
--
INSERT INTO xxl_job_info
  (job_group,
   job_desc,
   add_time,
   update_time,
   author,
   alarm_email,
   schedule_type,
   schedule_conf,
   misfire_strategy,
   executor_route_strategy,
   executor_handler,
   executor_param,
   executor_block_strategy,
   executor_timeout,
   executor_fail_retry_count,
   glue_type,
   glue_source,
   glue_remark,
   glue_updatetime,
   child_jobid)
VALUES
  (1,
   '测试任务1',
   TO_DATE('2018-11-03 22:21:31', 'YYYY-MM-DD HH24:MI:SS'),
   TO_DATE('2018-11-03 22:21:31', 'YYYY-MM-DD HH24:MI:SS'),
   'XXL',
   '',
   'CRON',
   '0 0 0 * * ? *',
   'DO_NOTHING',
   'FIRST',
   'demoJobHandler',
   '',
   'SERIAL_EXECUTION',
   0,
   0,
   'BEAN',
   '',
   'GLUE代码初始化',
   TO_DATE('2018-11-03 22:21:31', 'YYYY-MM-DD HH24:MI:SS'),
   '');
--
-- 插入测试数据
--
INSERT INTO xxl_job_user
  (username, password, role, permission)
VALUES
  ('admin',
   'e10adc3949ba59abbe56e057f20f883e',  -- MD5(123456)
   1,
   NULL);
--
-- 插入测试数据
--
INSERT INTO xxl_job_lock (lock_name) VALUES ('schedule_lock');
--
-- 提交测试数据
--
COMMIT;
