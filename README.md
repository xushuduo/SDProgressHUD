# SDProgressHUD
一款顶部多样式的指示器

## Demo
#### 多样式
![Demo1](https://github.com/xushuduo/SDProgressHUD/raw/master/Demo/demo1.gif)

#### 进度样式
![Demo2](https://github.com/xushuduo/SDProgressHUD/raw/master/Demo/demo2.gif)

## Usage
### 1、导入头文件
```objective-c
	#import "SDProgressHUD.h"
```

### 2、Show Success（显示完成指示器）
```objective-c
	[SDProgressHUD showSuccessWithTitle:@"成功提示" Message:@"内容"];
```

### 3、Dismiss（消失）
```objective-c
	[SDProgressHUD dismiss];
```

### 4、Auto Dismiss（自动消失）
```objective-c
	[SDProgressHUD dismissWithDelay:3.0];	// 3.0 sec
```

## License

[MIT license](https://github.com/xushuduo/SDProgressHUD/blob/master/LICENSE)

## About

作者：xsdCoder

博客：[www.xsd.me](http://www.xsd.me/)

