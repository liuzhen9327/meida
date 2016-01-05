jQuery(document).ready(function () {
    //jQuery(".x-modal-form").validate({
    //    rules: {
    //        receiver: {
    //            required: true
    //        },
    //        mobile: {
    //            required: true
    //        },
    //        address: {
    //            required: true
    //        },
    //        name: {
    //            required: true
    //        },
    //        number: {
    //            required: true
    //        },
    //        weight: {
    //            required: true,
    //            number: true
    //        }
    //    },
    //    submitHandler: function (form) {
    //        alert($(form).serialize())
    //    }
    //});
    $('.x-data-form').find('input,select,textarea').keyup(function(){
        var element = $(this),
            form = element.closest('form');
        var errPanel = form.find('.x-err-msg');
        if(element.hasClass('required')){
            if($.trim(element.val()) == ''){
                errPanel.text(element.attr('placeholder').replace('*','') + '不能为空').removeClass('hide');
            }else {
                errPanel.text('').addClass('hide');
                return;
            }
        }

    })

    //$('.x-modal-form').submit(function(){
    $('.x-data-form').submit(function(e){
        var form = $(this),
            hasError = false;
        var errPanel = form.find('.x-err-msg');
        form.find('input,select,textarea').each(function(){
            var element = $(this);
            if(element.hasClass('required')) {
                if($.trim(element.val()) == ''){
                    errPanel.text(element.attr('placeholder').replace('*','') + '不能为空').removeClass('hide');
                    hasError = true;
                    return false;
                }
            }
            if(element.hasClass('number')) {
                if(!(/^(?:-?\d+|-?\d{1,3}(?:,\d{3})+)?(?:\.\d+)?$/.test( element.val() ))) {
                    errPanel.text(element.attr('placeholder').replace('*','') + '必须为数字').removeClass('hide');
                    hasError = true;
                    return false;
                }
            }

        });
        if(!hasError) errPanel.text('').addClass('hide');
        return false;
    })





    $('.x-data-form').submit(function () {
        var form = $(this);
        if(!form.find('.x-err-msg').is(':visible')) {
            form.ajaxSubmit({
                url: '/original/save',
                type: 'post',
                success: function (resp) {
                    if (resp.succ) {
                        refreshDataList(resp.data, form.find('input[name="id"]').val());
                        form.parent().modal('hide');
                        var orderId = form.find('input[name="orderId"]').val();
                        form[0].reset();
                        form.find('input[name="orderId"]').val(orderId);
                    } else {
                        form.find('.x-err-msg').text(resp.errMsg).removeClass('hide');
                    }
                }
            });
        }
        return false;
    });



    $('.x-save-btn,.x-commit-btn').click(function () {

        var isCommit = $(this).hasClass('x-commit-btn');

        var orderType = $('#orderType').val(),
            acceptUser = $('#acceptUser').val(),
            remark = $('#remark').val();

        var errPanel = $('.x-err-msg:first');
        if (isCommit) {
            if(!$('#acceptUserDiv').hasClass('hide') && !acceptUser) {
                errPanel.text('请添加转运方!').removeClass('hide');
                return;
            }
        }


        $.post(
            '/order/save',
            {id: $('#orderId').val(), type: orderType, acceptUser: acceptUser, remark:remark, isCommit: isCommit},
            function (resp) {
                if (resp.succ) {
                    if(!isCommit){
                        errPanel.text('保存成功!').removeClass('hide');
                        setTimeout(function(){
                            errPanel.text('').addClass('hide');
                        },5000)
                    }

                    else
                        window.location = ctx + '/order/list'
                } else {
                    errPanel.text(resp.errMsg).removeClass('hide');
                }
            },
            'json'
        )
    });
});