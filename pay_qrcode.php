<?php
error_reporting(E_ERROR);
require_once 'phpqrcode/phpqrcode.php';
$url = urldecode('http://www.zgnmzymyw.com/WXPAY'.$_GET["data"]); //二维码内容  '.$_SERVER['SERVER_NAME'].'
//QRcode::png($url);
// 纠错级别：L、M、Q、H
$errorCorrectionLevel = 'Q';

// 点的大小：1到10
$matrixPointSize = 9;

// 保存文件名
$filename = 'wxpayimg/'.$_GET["data"].'.png';

//生成二维码
QRcode::png($url, $filename, $errorCorrectionLevel, $matrixPointSize, 2);

 
//获取二维码
$qrcode = file_get_contents($filename);
$qrcode = imagecreatefromstring($qrcode);
$qrcode_width = imagesx($qrcode);
$qrcode_height = imagesy($qrcode);

//圆角图片
$corner = file_get_contents('images/corner.png');
$corner = imagecreatefromstring($corner);
$corner_width = imagesx($corner);
$corner_height = imagesy($corner);

//计算圆角图片的宽高及相对于二维码的摆放位置,将圆角图片拷贝到二维码中央
$corner_qr_height = $corner_qr_width = $qrcode_width/3.6;
$from_width = ($qrcode_width-$corner_qr_width)/2;
imagecopyresampled($qrcode, $corner, $from_width, $from_width, 0, 0, $corner_qr_width, $corner_qr_height, $corner_width, $corner_height);


//logo图片
$logo = file_get_contents('img/wxpayqrlogo.png');
$logo = imagecreatefromstring($logo);
$logo_width = imagesx($logo);
$logo_height = imagesy($logo);

//计算logo图片的宽高及相对于二维码的摆放位置,将logo拷贝到二维码中央
$logo_qr_height = $logo_qr_width = $qrcode_width/3.6 - 6;
$from_width = ($qrcode_width-$logo_qr_width)/2;
imagecopyresampled($qrcode, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
imagepng($qrcode, $filename); 

//加文字开始
$dst = imagecreatefromstring(file_get_contents($filename));
/*imagecreatefromstring()--从字符串中的图像流新建一个图像，返回一个图像标示符，其表达了从给定字符串得来的图像
图像格式将自动监测，只要php支持jpeg,png,gif,wbmp,gd2.*/
  
$font = 'gulim.ttc'; //字体
$white = imagecolorallocate($dst, 255, 255, 255);
imagefttext($dst,7, 0, 21, 80, $white, $font, $_GET["data"] );
/*imagefttext($img,$size,$angle,$x,$y,$color,$fontfile,$text)
$img由图像创建函数返回的图像资源
size要使用的水印的字体大小
angle（角度）文字的倾斜角度，如果是0度代表文字从左往右，如果是90度代表从上往下
x,y水印文字的第一个文字的起始位置
color是水印文字的颜色
fontfile，你希望使用truetype字体的路径*/
list($dst_w,$dst_h,$dst_type) = getimagesize($filename);
/*list(mixed $varname[,mixed $......])--把数组中的值赋给一些变量
像array()一样，这不是真正的函数，而是语言结构，List()用一步操作给一组变量进行赋值*/
/*getimagesize()能获取到什么信息？
getimagesize函数会返回图像的所有信息，包括大小，类型等等*/
switch($dst_type){
  case 1://GIF
    header("content-type:image/gif");
    imagegif($dst);
    break;
  case 2://JPG
    header("content-type:image/jpeg");
    imagejpeg($dst);
    break;
  case 3://PNG
    header("content-type:image/png");
    imagepng($dst);
    break;
  default:
    break;
  /*imagepng--以PNG格式将图像输出到浏览器或文件
  imagepng()将GD图像流(image)以png格式输出到标注输出（通常为浏览器），或者如果用filename给出了文件名则将其输出到文件*/
}

imagepng($dst,$filename);
imagedestroy($dst);
//加文字完成

header('Content-type: image/png');
imagepng($qrcode);
imagedestroy($qrcode);
imagedestroy($corner);
imagedestroy($logo);