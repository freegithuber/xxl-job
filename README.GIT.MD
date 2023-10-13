# 一、克隆你的远程仓库到本地

```
git clone git@github.com:freegithuber/xxl-job.git H:\workspaces\xxl-job
```

```
H:\workspaces>git clone git@github.com:freegithuber/xxl-job.git H:\workspaces\xxl-job
Cloning into 'H:\workspaces\xxl-job'...
remote: Enumerating objects: 25052, done.
remote: Counting objects: 100% (102/102), done.
remote: Compressing objects: 100% (61/61), done.
remote: Total 25052 (delta 41), reused 62 (delta 31), pack-reused 24950
Receiving objects: 100% (25052/25052), 32.11 MiB | 860.00 KiB/s, done.
Resolving deltas: 100% (10075/10075), done.

H:\workspaces>
```

# 二、查看远程仓库的分支详情

```
git branch -a
```

```
H:\workspaces\xxl-job>git branch -a
* master
  remotes/origin/2.0.2
  remotes/origin/2.1.2
  remotes/origin/2.2.0
  remotes/origin/2.3.0
  remotes/origin/2.3.1
  remotes/origin/2.4.0
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/origin/v1.3
  remotes/origin/v1.4
  remotes/origin/v1.5
  remotes/origin/v1.6
  remotes/origin/v1.7
  remotes/origin/v1.8.2
  remotes/origin/v1.9.2

H:\workspaces\xxl-job>
```

# 三、查看原始仓库是否在本地

```
git remote -v
```

```
H:\workspaces\xxl-job>git remote -v
origin  git@github.com:freegithuber/xxl-job.git (fetch)
origin  git@github.com:freegithuber/xxl-job.git (push)

H:\workspaces\xxl-job>
```

# 四、添加远程原始仓库到本地

```
git remote add upstream git@github.com:xuxueli/xxl-job.git
```

```
H:\workspaces\xxl-job>git remote add upstream git@github.com:xuxueli/xxl-job.git

H:\workspaces\xxl-job>
```

# 五、查看原始仓库是否在本地

```
git remote -v
```

```
H:\workspaces\xxl-job>git remote -v
origin  git@github.com:freegithuber/xxl-job.git (fetch)
origin  git@github.com:freegithuber/xxl-job.git (push)
upstream        git@github.com:xuxueli/xxl-job.git (fetch)
upstream        git@github.com:xuxueli/xxl-job.git (push)

H:\workspaces\xxl-job>
```

# 六、拉取原始远程仓库的分支

```
git fetch upstream master
```

```
H:\workspaces\xxl-job>git fetch upstream master
From github.com:xuxueli/xxl-job
 * branch              master     -> FETCH_HEAD
 * [new branch]        master     -> upstream/master

H:\workspaces\xxl-job>
```

```
H:\workspaces\xxl-job>git branch -a
* master
  remotes/origin/2.0.2
  remotes/origin/2.1.2
  remotes/origin/2.2.0
  remotes/origin/2.3.0
  remotes/origin/2.3.1
  remotes/origin/2.4.0
  remotes/origin/HEAD -> origin/master
  remotes/origin/master
  remotes/origin/v1.3
  remotes/origin/v1.4
  remotes/origin/v1.5
  remotes/origin/v1.6
  remotes/origin/v1.7
  remotes/origin/v1.8.2
  remotes/origin/v1.9.2
  remotes/upstream/master

H:\workspaces\xxl-job>
```

# 七、切换到你的本地仓库分支

```
git checkout master
```

```
H:\workspaces\xxl-job>git checkout master
Already on 'master'
Your branch is up to date with 'origin/master'.

H:\workspaces\xxl-job>
```

# 八、合并原始项目到你的分支

```
git merge upstream/master
```

```
H:\workspaces\xxl-job>git merge upstream/master
Already up to date.

H:\workspaces\xxl-job>
```

# 九、推送更新到你的远程仓库

```
git push origin master
```

```
H:\workspaces\xxl-job>git push origin master
Everything up-to-date

H:\workspaces\xxl-job>
```

# 十、检出你的远程仓库的分支

```
git checkout 2.4.0
```

```
H:\workspaces\xxl-job>git checkout 2.4.0
Note: checking out '2.4.0'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 0f867352 升级 v2.4.0

H:\workspaces\xxl-job>git checkout -b v2.4.0
Switched to a new branch 'v2.4.0'

H:\workspaces\xxl-job>
```

