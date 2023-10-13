--
-- 创建触发器
--
CREATE OR REPLACE TRIGGER TRI_XXL_JOB_GROUP_ID
  before insert on XXL_JOB_GROUP for each row
declare
  nextid number;
begin
  if :new.ID IS NULL or :new.ID=0 THEN
    select SEQ_XXL_JOB_GROUP_ID.nextval into nextid from sys.dual;
    :new.ID:=nextid;
  end if;
end TRI_XXL_JOB_GROUP_ID;
