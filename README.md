
# Table of Contents

1.  [介绍](#org0d0978f)
2.  [技术栈](#orgf713aff)
    1.  [后端](#org01f00a0)
    2.  [前端](#orgebe1c03)
3.  [使用](#orgd0e2a27)
    1.  [连接服务器](#orga281c40)
    2.  [剪切板列表](#org2a10e59)
    3.  [复制剪切板内容](#orgae35e90)
    4.  [分享剪切板内容](#org8897c37)
    5.  [上传剪切板内容](#org38f7a17)
4.  [To Install](#orgd53b70f)
    1.  [backend](#org9fa4d83)
    2.  [frontend](#orgbcc97ba)
5.  [FIXME](#org3900846)
6.  [Feature](#org443b42a)



<a id="org0d0978f"></a>

# 介绍

我平时的工作环境是 Linux + 手机，有时候我需要把文件从手机传到电脑，但是我发现在Linux的QQ无法使用 **我的文件**  
功能，这就很无语了  
这个时候就可以用到 KDE connect 了，通过他可以传递文件和剪切板  
但是，不知道为什么，在华为路由器下虽然能够ping到其他主机，但是 kde connect 连接到其他主机，我也不知道怎么回事  
于是我就想自己做一个 远程剪切板管理程序，这样就能有 kde connect 的部分功能了  
不过这个程序与 kde connect 不同的是，我这边有一个在后端运行的 springboot 程序，  
需要通过前端程序访问后端来实现剪切板管理，kde connect 是不需要后端的  


<a id="orgf713aff"></a>

# 技术栈


<a id="org01f00a0"></a>

## 后端

1.  springboot 3.0 + Kotlin
2.  PostgreSQL
3.  exposed-spring-boot-starter
4.  spring-boot-starter-validation
5.  spring-boot-starter-websocket
6.  protobuf-kotlin


<a id="orgebe1c03"></a>

## 前端

1.  Flutter
2.  pasteboard
3.  dio
4.  provider
5.  web<sub>socket</sub><sub>channel</sub>
6.  file<sub>picker</sub>
7.  path<sub>provider</sub>
8.  path
9.  permission<sub>handler</sub>


<a id="orgd0e2a27"></a>

# 使用


<a id="orga281c40"></a>

## 连接服务器

![img](images/使用/2023-08-20_18-14-30_screenshot.png)  

输入服务器地址(ip:port)，登陆名后，点击连接，即可进入剪切板管理  


<a id="org2a10e59"></a>

## 剪切板列表

![img](images/使用/2023-08-20_18-16-55_screenshot.png)  

![img](images/使用/2023-08-20_18-17-04_screenshot.png)  

![img](images/使用/2023-08-20_18-17-13_screenshot.png)  


<a id="orgae35e90"></a>

## 复制剪切板内容

点击 **copy** 按扭，在 Linux/Windows 平台下，  

-   文字内容会被复制到剪切板
-   图片/文件 内容也会被复制到剪切板

不过在 Android 平台下复制 图片/文件 内容时，flutter的 **file<sub>picker</sub>** 没有实现 `saveFiles` 这个方法，  
所以需要手动设置保存的目录路径，才会把文件下载过来  
![img](images/使用/tempimage.jpg)  


<a id="org8897c37"></a>

## 分享剪切板内容

![img](images/使用/2023-08-20_18-50-25_screenshot.png)  

点击 share 按扭，需要你选择发送的用户，然后点击 send  
此时对端会弹出一个对话框  
![img](images/使用/tempimage1.jpg)  
点击OK接收数据，如果目标是 Linux/Windows ，会将数据复制到目标剪切板  
如果目标是 Android/iOS， 需要你选择保存的目录路径  


<a id="org38f7a17"></a>

## 上传剪切板内容

不管在哪个 tab 中，点击那个 + 按扭，他都能正确的知道你想要上传哪种类型的内容  

-   如果是 text ，他会弹出一个对话框，输入文字即可
-   如果是 image/file ，他会调用 `FilePicker.platform.pickFiles` ，弹出一个对话框让你选择文件


<a id="orgd53b70f"></a>

# To Install


<a id="org9fa4d83"></a>

## backend

在安装之前，别忘了在 `application.yaml` 里改配置  

    server:
      port: 8082
      address: 0.0.0.0
      servlet:
        context-path: /api
    
    spring:
      exposed:
        generate-ddl: true
      datasource:
        url: jdbc:postgresql://localhost/transfer-clipboard
        username: steiner
        password: 779151714
      servlet:
        multipart:
          max-file-size:
            100MB
          max-request-size:
            100MB
    
    
    
    file:
      storage:
        url: /home/steiner/disk/windows-data/Download/storage

不过服务端的端口和 `context-path` 我在前端里写死了，这两个就不要改了，要改的是  

1.  `datasource.url` 指定数据库地址
2.  `datasource.username` 指定数据库用户名
3.  `datasource.password` 指定数据库密码
4.  `file.storage.url` 指定文件上传路径

    cd backend
    ./gradlew build -x test
    java -jar build/libs/backend-0.0.1-SNAPSHOT.jar


<a id="orgbcc97ba"></a>

## frontend

    cd frontend

    flutter create . --platform=platform-type

    flutter build --release


<a id="org3900846"></a>

# FIXME

-   [X] on press copy image/file case windows + subfix
-   [X] online user is duplicate
-   [X] textfield too long
-   [X] empty file
-   [X] insert(0, element) not work
-   [X] touid setState
-   [X] 退出时黑屏
-   [X] 设置初始 size
-   [X] filecard overflow
-   [X] android saveFile not implement, snackbar to notify, set default save path
-   [ ] harmony os not work
-   [X] duplicate name


<a id="org443b42a"></a>

# Feature

-   [X] floating action button to add data
-   [ ] schedule : delete tempfile every 10 min
-   [X] Stream for refresh page, when update data, use websocke to send a message
-   [X] setting server url by manual
-   [X] handle connection lose exception
-   [X] handle error when connect
-   [X] show dialog for uploading file
-   [X] android icon

