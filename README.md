# [ahk 键盘增强 ✨✨✨](https://github.com/moshuying/myAHK)

myahk 旨在增强 windows 下的键盘功能 😎


[下载地址](https://github.com/moshuying/myAHK/releases)

**首先感谢 ahk 的大神们,这个工具能极大地增加生产力**

ahk 的一个键盘增强脚本,仅在`winwods`下可用,长期更新 [仓库链接](https://github.com/moshuying/myAHK)


## 普通安装

[下载安装包双击运行即可](https://github.com/moshuying/myAHK/releases)，如果您对这个脚本比较陌生，您可以看看下面的功能说明。


## 从源码安装

克隆源代码，并从myahk官网[下载ahk运行环境](https://www.autohotkey.com/)，运行`easyWork.ahk`即可。

## 卸载

普通安装的用户仅需从托盘关闭myAHK即可。

从源码安装的用户退出脚本即可。


## 功能概要

**由于用`caps + a`替换了`capslock`功能,所以下表中的 caps 均指向 capslock 按键**

| 简述                                                           | 热键                                                           | 详解                                                                                                                               |
| :------------------------------------------------------------- | :------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| 获取路径                                                       | win + ctrl + c                                                 | 在文件浏览器下选中文件后直接复制路径                                                                                               |
| delete                                                         | caps + o                                                       | 向后删除,不能作为实体 delete 键来用,仅仅能向后删除                                                                                 |
| backspace                                                      | caps + p                                                       | 向前删除,就是退格键                                                                                                                |
| appkey 🍥                                                      | caps + g                                                       | 就是鼠标右键啦,替代 shift + f10 的一个方案                                                                                         |
| home                                                           | caps + h                                                       | home 键,移动到行首                                                                                                                 |
| end                                                            | caps + n                                                       | end 键,移动到行末(这个结合 shift + caps + h 可以飞速选中一行,选中后 caps + i 向上多选,caps + j 下下多选)                           |
| 上下左右 👏                                                    | caps + ijkl                                                    | 超级好用上下左右,我想你也不喜欢每次移动光标时都把手挪动一大截吧,尤其是写代码灵感来的瞬间                                           |
| 切换大小写                                                     | caps + a                                                       | 将 capslock 键改成了 caps,用这个组合键来切换大小写                                                                                 |
| 鼠标滚轮增加音量(有鼠标侧键才可以使用,XButon2 是靠前的侧键) 🥩 | XButton2 + 向鼠标前方滚动                                      |                                                                                                                                    |
| 鼠标滚轮减少音量                                               | XButton2 + 向鼠标后方滚动                                      |                                                                                                                                    |
| 键盘增加音量                                                   | caps + pgup                                                    |                                                                                                                                    |
| 键盘减少音量                                                   | caps + pgdn                                                    |                                                                                                                                    |
| 打开计算器                                                     | caps + c                                                       |                                                                                                                                    |
| 滚动当前鼠标下窗口的滚动条(向下滚动) 🍧                        | caps + [                                                       | 滚动当前鼠标指向窗口的滚动条                                                                                                       |
| 滚动当前鼠标下窗口的滚动条(向上滚动)                           | caps + ]                                                       | 滚动当前鼠标指向窗口的滚动条                                                                                                       |
| 桌面切换(下一个)                                               | win + ctrl + tab                                               | 两个项目同时忙起来的时候换虚拟桌面用的                                                                                             |
| 桌面切换(上一个)                                               | win + ctrl + shift + tab                                       |                                                                                                                                    |
| 模拟鼠标(开) 默认关闭 🌭                                       | caps + d                                                       | 开启后按 d 对应左键,f 右键,ijkl 移动鼠标                                                                                           |
| 模拟鼠标(关)                                                   | caps + f                                                       |                                                                                                                                    |
| 括号补全(开) 默认关闭                                          | caps + 9                                                       | 在一些代码编辑器内已经默认开启了代码补全,某些输入法也给了括号补全,这个自动补全仅作为备用默认关闭,第一次按组合键打开,再按组合键关闭 |
| 括号补全(关)                                                   | caps + 9                                                       |                                                                                                                                    |
| `                                                              | caps + 1                                                       | 68 键的键盘打反引号和波浪号稍微费事一点                                                                                            |
| ~                                                              | caps + 2                                                       |                                                                                                                                    |
| =                                                              | caps + ;                                                       |                                                                                                                                    |
| +                                                              | caps + '                                                       |                                                                                                                                    |
| 自动循环按键                                                   | 按下 ctrl + win + a 后随意按键(功能键暂不支持)                 | 自动循环按 ctrl + win + a 后的按键                                                                                                 |
| 获取路径                                                       | 按下 ctrl + win + c 后获取路径                                 |
| 填充常用文本                                                   | 输入 email 即可填入默认文本 修改代码最后一行改为自己常用的即可 |

长期更新,觉得有用麻烦点个 star 吧
