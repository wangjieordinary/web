WFORM.arrErrorMsg[0] = "必填欄位"; // required
WFORM.arrErrorMsg[1] = "文字必需是英文字母(a-z, A-Z). 數字是不允許的"; 	// validate_alpha
WFORM.arrErrorMsg[2] = "這是不正確的email位址";									// validate_email
WFORM.arrErrorMsg[3] = "請輸入整數";															// validate_integer
WFORM.arrErrorMsg[4] = "請輸入浮點數(例如. 1.9)";
WFORM.arrErrorMsg[5] = "不安全的密碼. 您的密碼必須是4到12個字母, 大寫或小寫的字元組合";
WFORM.arrErrorMsg[6] = "只使用字母或數字[a-z 0-9]";
WFORM.arrErrorMsg[7] = "請是不正確的日期";
WFORM.arrErrorMsg[8] = "%% 錯誤被偵測到. 您的表單無法送出.\n請檢查您所提供的資料"; // %% will be replaced by the actual number of errors.
	
	// Other Messages

WFORM.arrMsg[0] = "新增一列"; 	// repeat link
WFORM.arrMsg[1] = "重覆上一個欄位或欄位群組." // title attribute on the repeat link 
WFORM.arrMsg[2] = "移除"; 		// remove link
WFORM.arrMsg[3] = "移除上一個欄位或欄位群組." // title attribute on the remove link
WFORM.arrMsg[4] = "下一頁";
WFORM.arrMsg[5] = "上一頁";	


WFORM.isAlpha = function(s) {
	var reg = /^[\u0041-\u007A\u0100-\u017F]+$/; 
	return this.isEmpty(s) || reg.test(s);
}

WFORM.isAlphaNum = function(s) {
	var reg = /^[\u0030-\u0039\u0041-\u007A\u0100-\u017F]+$/;
	return this.isEmpty(s) || reg.test(s);
}