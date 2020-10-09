#API  (professional-streaming)

###用户登录

```
POST /PSing/login/signin
```

参数

```
username: "3172052051113"
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
POST /PSing/studentinfo/studentself/updatapwd
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
POST /PSing/studentinfo/studentself/updataemail
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

###学生信息管理（管理员端）（导入学生信息，增加学生，删除学生，重置学生密码和邮箱）

```
GET /PSing/studentinfo/admin/list
```

参数

```
"instituteid": "101"
||"majorid": "10101"
||"classid": "201010101"
||"studentid": "20101010101"
"grade": "2020"
"page": "1"
"size": "10"
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": [
    {
      "studentid": "20101010101",
      "studentname": "潘杰才",
      "institutename": "信息科学与工程学院"
      "majorname": "计算机类"
      "classname": "2020-1班"
    }
    {
      "studentid": "20101010102",
      "studentname": "曹磊",
      "institutename": "信息科学与工程学院"
      "majorname": "计算机类"
      "classname": "2020-1班"
    }
    {
      "studentid": "20101010201",
      "studentname": "岑展宇",
      "institutename": "信息科学与工程学院"
      "majorname": "计算机类"
      "classname": "2020-6班"
    }
  ]
}
```



```
POST /PSing/studentinfo/admin/addallmajor
```

参数

```
"majorid": "10101"
||"instituteid": "101"
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": null
}
```



```
POST /PSing/studentinfo/admin/addone
```

参数

```
"studentid": "20101010101"
"studentname": "潘杰才"
"instituteid": "信息科学与工程学院"
"majorid": "计算机类"
"classid": "201010101"
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": null
}
```



```
POST /PSing/studentinfo/admin/deleteone
```

参数

```
"studentid": "20101010101"
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": null
}
```



```
POST /PSing/studentinfo/admin/reset
```

参数

```
"studentid": "20101010101"
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": null
}
```



###专业信息管理（专业负责人端）（修改专业介绍）

```
POST /PSing/major/charge/briefupdate
```

参数

```
"brieftext": "...."
```

返回

```
{
  "code": 0,
  "msg": "成功",
  "data": {
    "berieftext": ""
  }
}
```



###专业信息管理（管理员端）

```
GET /PSing/major/admin/list
POST /PSing/major/admin/addone
GET /PSing/major/admin/deleteone
```



###志愿填报（学生）
###志愿查看（专业负责人）
###查看绩点排名（学生）
###分流结果显示
###邮箱验证

###

```

```