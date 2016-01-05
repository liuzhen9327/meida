jQuery.extend(jQuery.validator.messages, {
        required: "不能为空",
		remote: "请修正该字段",
		email: "邮箱格式不正确",
		url: "请输入合法的网址",
		date: "请输入合法的日期",
		dateISO: "请输入合法的日期 (ISO).",
		number: "请输入合法的数字",
		digits: "只能输入整数",
		creditcard: "请输入合法的信用卡号",
		equalTo: "请再次输入相同的值",
		accept: "请输入拥有合法后缀名的字符串",
		maxlength: jQuery.validator.format("内容长度不能超过 {0} "),
		minlength: jQuery.validator.format("内容长度不能短于 {0} "),
		rangelength: jQuery.validator.format("内容长度必须介于 {0} 和 {1} 之间"),
		range: jQuery.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
		max: jQuery.validator.format("请输入一个不大于 {0} 的值"),
		min: jQuery.validator.format("请输入一个不小于 {0} 的值")
});