<%Response.ContentType = "Image/BMP"  
Call Com_CreatValidCode()  
Sub Com_CreatValidCode()  
Randomize  
Dim i, ii, iii  
Const cAmount = 36
Const cCode = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
Dim vColorData(2)
vColorData(0) = ""
vColorData(1) = ChrB(255) & ChrB(255) & ChrB(255)
Dim vCode(4), vCodes
For i = 0 To 3  
vCode(i) = Int(Rnd * cAmount)
vCodes=vCodes&Mid(cCode,vCode(i)+1,1)
Next  
session("code")=vCodes
Dim vNumberData(36)  
vNumberData(0) = "1110000111110111101111011110111101001011110100101111010010111101001011110111101111011110111110000111"  
vNumberData(1) = "1111011111110001111111110111111111011111111101111111110111111111011111111101111111110111111100000111"  
vNumberData(2) = "1110000111110111101111011110111111111011111111011111111011111111011111111011111111011110111100000011"  
vNumberData(3) = "1110000111110111101111011110111111110111111100111111111101111111111011110111101111011110111110000111"  
vNumberData(4) = "1111101111111110111111110011111110101111110110111111011011111100000011111110111111111011111111000011"  
vNumberData(5) = "1100000011110111111111011111111101000111110011101111111110111111111011110111101111011110111110000111"  
vNumberData(6) = "1111000111111011101111011111111101111111110100011111001110111101111011110111101111011110111110000111"  
vNumberData(7) = "1100000011110111011111011101111111101111111110111111110111111111011111111101111111110111111111011111"  
vNumberData(8) = "1110000111110111101111011110111101111011111000011111101101111101111011110111101111011110111110000111"  
vNumberData(9) = "1110001111110111011111011110111101111011110111001111100010111111111011111111101111011101111110001111"  
vNumberData(10) = "1111011111111101111111101011111110101111111010111111101011111100000111110111011111011101111000100011"  
vNumberData(11) = "1000000111110111101111011110111101110111110000111111011101111101111011110111101111011110111000000111"  
vNumberData(12) = "1110000011110111101110111110111011111111101111111110111111111011111111101111101111011101111110001111"  
vNumberData(13) = "1000001111110111011111011110111101111011110111101111011110111101111011110111101111011101111000001111"  
vNumberData(14) = "1000000111110111101111011011111101101111110000111111011011111101101111110111111111011110111000000111"  
vNumberData(15) = "1000000111110111101111011011111101101111110000111111011011111101101111110111111111011111111000111111"  
vNumberData(16) = "1110000111110111011110111101111011111111101111111110111111111011100011101111011111011101111110001111"  
vNumberData(17) = "1000100011110111011111011101111101110111110000011111011101111101110111110111011111011101111000100011"  
vNumberData(18) = "1100000111111101111111110111111111011111111101111111110111111111011111111101111111110111111100000111"  
vNumberData(19) = "1110000011111110111111111011111111101111111110111111111011111111101111111110111110111011111000011111"  
vNumberData(20) = "1000100011110111011111011011111101011111110001111111010111111101101111110110111111011101111000100011"  
vNumberData(21) = "1000111111110111111111011111111101111111110111111111011111111101111111110111111111011110111000000011"  
vNumberData(22) = "1000100011110010011111001001111100100111110101011111010101111101010111110101011111010101111001010011"  
vNumberData(23) = "1000100011110011011111001101111101010111110101011111010101111101100111110110011111011001111000110111"  
vNumberData(24) = "1110001111110111011110111110111011111011101111101110111110111011111011101111101111011101111110001111"  
vNumberData(25) = "1000000111110111101111011110111101111011110000011111011111111101111111110111111111011111111000111111"  
vNumberData(26) = "1110001111110111011110111110111011111011101111101110111110111011111011101001101111011001111110001011"  
vNumberData(27) = "1000001111110111011111011101111101110111110000111111010111111101101111110110111111011101111000110011"  
vNumberData(28) = "1110000011110111101111011110111101111111111001111111111001111111111011110111101111011110111100000111"  
vNumberData(29) = "1000000011101101101111110111111111011111111101111111110111111111011111111101111111110111111110001111"  
vNumberData(30) = "1000100011110111011111011101111101110111110111011111011101111101110111110111011111011101111110001111"  
vNumberData(31) = "1000100011110111011111011101111101110111111010111111101011111110101111111010111111110111111111011111"  
vNumberData(32) = "1001010011110101011111010101111101010111110101011111001001111110101111111010111111101011111110101111"  
vNumberData(33) = "1000100011110111011111101011111110101111111101111111110111111110101111111010111111011101111000100011"  
vNumberData(34) = "1000100011110111011111011101111110101111111010111111110111111111011111111101111111110111111110001111"  
vNumberData(35) = "1100000011110111011111111101111111101111111110111111110111111111011111111011111111101110111100000011"  
Response.BinaryWrite ChrB(66) & ChrB(77) & ChrB(230) & ChrB(4) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_  
ChrB(0) & ChrB(0) & ChrB(54) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(40) & ChrB(0) &_  
ChrB(0) & ChrB(0) & ChrB(40) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(10) & ChrB(0) &_  
ChrB(0) & ChrB(0) & ChrB(1) & ChrB(0)  
Response.BinaryWrite ChrB(24) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(176) & ChrB(4) &_  
ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) & ChrB(0) & ChrB(0) & ChrB(18) & ChrB(11) &_  
ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) & ChrB(0) &_  
ChrB(0) & ChrB(0)  
For i = 9 To 0 Step -1
For ii = 0 To 3 
For iii = 1 To 10
  if Mid(vNumberData(vCode(ii)), i * 10 + iii , 1)  ="0" then
    dim a,b,c
    a=abs(Rnd * 256-60)
    b=abs(Rnd * 256-128)
    c=abs(Rnd * 256-60)
    vColorData(0) = ChrB(a) & ChrB(b) & ChrB(c) 
    Response.BinaryWrite vColorData(Mid(vNumberData(vCode(ii)), i * 10 + iii , 1))  
  else
    dim d,e,f
    d=abs(Rnd * 255)
    e=abs(Rnd * 255)
    f=abs(Rnd * 255)
    if d+e+f>580 then
      vColorData(1) = ChrB(d) & ChrB(e) & ChrB(f) 
      Response.BinaryWrite vColorData(Mid(vNumberData(vCode(ii)), i * 10 + iii , 1))  
    else
      Response.BinaryWrite vColorData(Mid(vNumberData(vCode(ii)), i * 10 + iii , 1))  
    end if
  end if
Next  
Next  
Next  
End Sub%>