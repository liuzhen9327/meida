//by:xcl @2012.8  qq:80213876
; (function ($) {
    $.extend({
        XTableList: function (options) {
            options = $.extend({}, funs.Defaults, options);
            funs.Init(options);
            $(options.tableClass).each(function () {
                var $trs = null;
                if ($(this).children("tbody").length > 0) {//
                    $trs = options.trNoHoverClass == "" ? $(this).children().children() : $(this).children().children().not(options.trNoHoverClass);
                } else {
                    $trs = options.trNoHoverClass == "" ? $(this).children() : $(this).children().not(options.trNoHoverClass);
                }
                if (options.trHoverColor != "") {
                    $trs.hover(function () {
                        $(this).addClass("XTableList_trHover");
                    }, function () {
                        $(this).removeClass("XTableList_trHover");
                    });
                }
                if (options.trClickColor != "") {
                    $trs.click(function () {
                        $trs.removeClass("XTableList_trClick");
                        $(this).addClass("XTableList_trClick");
                    });
                }
                if (options.trEvenColor != "") {
                    $trs.each(function (i) {
                        if (i % 2 == 0) {
                            $(this).addClass("XTableList_trEven");
                        }
                    });
                }
                if (options.trOddColor != "") {
                    $trs.each(function (i) {
                        if (i % 2 == 1) {
                            $(this).addClass("XTableList_trOdd");
                        }
                    });
                }
                $(options.checkAllClass).click(function () {
                    var $ckAll = $(this).closest(options.tableClass).find(options.checkAllClass);
                    var $ckItem = $(this).closest(options.tableClass).find(options.checkItemClass);
                    if (this.checked) {
						
                        $ckItem.prop({ "checked": true });
                    } else {
                        $ckItem.prop({ "checked": false });
                    }
                    funs.GetCheckBoxIDs($ckAll, $ckItem);
                });
                $(options.checkItemClass).click(function () {
                    var $ckAll = $(this).closest(options.tableClass).find(options.checkAllClass);
                    var $ckItem = $(this).closest(options.tableClass).find(options.checkItemClass);
                    var flag = 1;
                    $ckItem.each(function () {
                        if (!this.checked) {
                            flag = 0;
                            return false;
                        }
                    });
                    if (flag == 1) {
                        $ckAll.prop({ "checked": true });
                    } else {
                        $ckAll.prop({ "checked": false });
                    }
                    funs.GetCheckBoxIDs($ckAll, $ckItem);
                });

            });
        }
    });
    var funs = {
        Defaults: {
            tableClass: ".XTableList",
            trHoverColor: "",
            trClickColor: "",
            trNoHoverClass: ".XTableNoHover",
            trEvenColor: "",
            trOddColor: "",
            checkAllClass: ".XTableCheckAll",
            checkItemClass: ".XTableCheckItem",
            checkedTrColor: "#fffec9"
        },
        Init: function (options) {
            $("head").append("<style type='text/css'>.XTableList_trHover{background:" + options.trHoverColor + "!important;} " +
                                    ".XTableList_trClick{background:" + options.trClickColor + "!important;} " +
                                    ".XTableList_trEven{background:" + options.trEvenColor + ";} " +
                                    ".XTableList_trOdd{background:" + options.trOddColor + ";}" +
                                    ".XTableList_trChecked{background:" + options.checkedTrColor + "!important;}" +
                                    "</style>");
            $(options.tableClass).each(function () {
                var $ckAll = $(this).closest(options.tableClass).find(options.checkAllClass);
                var $ckItem = $(this).closest(options.tableClass).find(options.checkItemClass);
                var isAllChecked = 1;
                $ckItem.each(function () {
                    if (!this.checked) {
                        isAllChecked = 0; return false;
                    }
                });
                if (isAllChecked == 1) {
                    $ckAll.prop({ "checked": true });
                }else{
                    $ckAll.prop({ "checked": false });
                }
                
                funs.GetCheckBoxIDs($ckAll, $ckItem);
            });
            
        },
        GetCheckBoxIDs: function (ckAll, ckItem) {
            var v = [];
            ckItem.each(function () {
                if (this.checked) {
                    $(this).closest("tr").addClass("XTableList_trChecked");
                    v.push(this.value);
                } else {
                    $(this).closest("tr").removeClass("XTableList_trChecked");
                }
            });
            ckAll.val(v.toString());
        }
    }
})(jQuery);