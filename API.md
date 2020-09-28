#API  (professional_distibution)

###用户登录

```
POST /PD/login/signin
```

参数

```
userid: "3172052051113"
username: "潘杰才"
password: "111111"

```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": null
 }
```

###学生信息管理（学生端）（更改初始密码，绑定邮箱，通过邮箱改密码和改绑邮箱）例子智慧树网

```
POST /PD/studentinfo/studentself/updatapwd
```

参数

```
"oldpassword": "111111"
"newpassword": "222222"

```

返回

```
{
"code": 0,
"msg": "成功"
"data": null
}
```

```
POST /PD/studentinfo/studentself/updataemail
```

参数

```
"email": "1597470774@qq.com"
```

返回

```
{
"code": 0,
"msg": "成功"
"data": null
}
```


###学生信息管理（管理员端）（导入学生信息，增加学生，删除学生，重置学生密码，重置邮箱）
###专业信息管理（专业负责人端）（招收人数/比例，）
###专业信息管理（管理员端）
###志愿填报（学生）
###志愿查看（专业负责人）
###查看绩点排名（学生）
###分流结果显示
###邮箱验证

###
```