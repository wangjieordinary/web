<?php
error_reporting(E_ERROR);
require_once 'phpqrcode/phpqrcode.php';
$url = urldecode('http://www.zgnmzymyw.com/WXPAY'.$_GET["data"]); //��ά������  '.$_SERVER['SERVER_NAME'].'
//QRcode::png($url);
// ������L��M��Q��H
$errorCorrectionLevel = 'Q';

// ��Ĵ�С��1��10
$matrixPointSize = 9;

// �����ļ���
$filename = 'wxpayimg/'.$_GET["data"].'.png';

//���ɶ�ά��
QRcode::png($url, $filename, $errorCorrectionLevel, $matrixPointSize, 2);

 
//��ȡ��ά��
$qrcode = file_get_contents($filename);
$qrcode = imagecreatefromstring($qrcode);
$qrcode_width = imagesx($qrcode);
$qrcode_height = imagesy($qrcode);

//Բ��ͼƬ
$corner = file_get_contents('images/corner.png');
$corner = imagecreatefromstring($corner);
$corner_width = imagesx($corner);
$corner_height = imagesy($corner);

//����Բ��ͼƬ�Ŀ�߼�����ڶ�ά��İڷ�λ��,��Բ��ͼƬ��������ά������
$corner_qr_height = $corner_qr_width = $qrcode_width/3.6;
$from_width = ($qrcode_width-$corner_qr_width)/2;
imagecopyresampled($qrcode, $corner, $from_width, $from_width, 0, 0, $corner_qr_width, $corner_qr_height, $corner_width, $corner_height);


//logoͼƬ
$logo = file_get_contents('img/wxpayqrlogo.png');
$logo = imagecreatefromstring($logo);
$logo_width = imagesx($logo);
$logo_height = imagesy($logo);

//����logoͼƬ�Ŀ�߼�����ڶ�ά��İڷ�λ��,��logo��������ά������
$logo_qr_height = $logo_qr_width = $qrcode_width/3.6 - 6;
$from_width = ($qrcode_width-$logo_qr_width)/2;
imagecopyresampled($qrcode, $logo, $from_width, $from_width, 0, 0, $logo_qr_width, $logo_qr_height, $logo_width, $logo_height);
imagepng($qrcode, $filename); 

//�����ֿ�ʼ
$dst = imagecreatefromstring(file_get_contents($filename));
/*imagecreatefromstring()--���ַ����е�ͼ�����½�һ��ͼ�񣬷���һ��ͼ���ʾ���������˴Ӹ����ַ���������ͼ��
ͼ���ʽ���Զ���⣬ֻҪphp֧��jpeg,png,gif,wbmp,gd2.*/
  
$font = 'gulim.ttc'; //����
$white = imagecolorallocate($dst, 255, 255, 255);
imagefttext($dst,7, 0, 21, 80, $white, $font, $_GET["data"] );
/*imagefttext($img,$size,$angle,$x,$y,$color,$fontfile,$text)
$img��ͼ�񴴽��������ص�ͼ����Դ
sizeҪʹ�õ�ˮӡ�������С
angle���Ƕȣ����ֵ���б�Ƕȣ������0�ȴ������ִ������ң������90�ȴ����������
x,yˮӡ���ֵĵ�һ�����ֵ���ʼλ��
color��ˮӡ���ֵ���ɫ
fontfile����ϣ��ʹ��truetype�����·��*/
list($dst_w,$dst_h,$dst_type) = getimagesize($filename);
/*list(mixed $varname[,mixed $......])--�������е�ֵ����һЩ����
��array()һ�����ⲻ�������ĺ������������Խṹ��List()��һ��������һ��������и�ֵ*/
/*getimagesize()�ܻ�ȡ��ʲô��Ϣ��
getimagesize�����᷵��ͼ���������Ϣ��������С�����͵ȵ�*/
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
  /*imagepng--��PNG��ʽ��ͼ���������������ļ�
  imagepng()��GDͼ����(image)��png��ʽ�������ע�����ͨ��Ϊ������������������filename�������ļ�������������ļ�*/
}

imagepng($dst,$filename);
imagedestroy($dst);
//���������

header('Content-type: image/png');
imagepng($qrcode);
imagedestroy($qrcode);
imagedestroy($corner);
imagedestroy($logo);