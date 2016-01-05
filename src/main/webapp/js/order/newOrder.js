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




    // Select2
    jQuery(".select2").select2({
        width: '100%',
        matcher: function (term, text, option) {
            return text.toUpperCase().indexOf(term.toUpperCase()) >= 0 || option.val().toUpperCase().indexOf(term.toUpperCase()) >= 0;
        }
    });


    var refreshDataList = function (obj, originalId) {
        var html = [];
        var tr;
        if(!originalId) {
            var index = $('.x-data-list tr:last td:first').text() || 1;
            html.push('<tr>');
            html.push('<td>', (parseInt(index) + 1), '<input type="hidden" value="', obj.id, '"/></td>');
        } else {
            tr = $('.x-data-list input[type="hidden"][value="' + originalId + '"]').closest('tr');
            html.push('<td>', tr.find('td:first').html(), '</td>');
        }



        html.push('<td>', '<a data-content="', obj.receiver || '', ',', obj.mobile || '', ',', obj.address || '',
            '" data-placement="top" data-toggle="popover" data-container="body" class="popovers current">',
            obj.receiver || '', ',', obj.mobile || '', ',', curStr(obj.address || '', 13), '</a></td>');

        html.push('<td>', obj.name || '', ',', obj.number || '', ',', obj.weight || '', 'KG</td>');
        html.push('<td><a data-content="', obj.remark || '', '"data-placement="top" data-toggle="popover" data-container="body" class="popovers current">',
            curStr(obj.remark || '', 6), '</a></td>');
        html.push('<td class="table-action"><div class="btn-group">',
            '<button type="button" class="btn btn-white btn-xs x-edit-btn" data-toggle="modal" data-target="#editModal"><i class="fa fa-pencil"></i></button>',
            '<button type="button" class="btn btn-white delete_row btn-xs"><i class="fa fa-trash-o"></i></button></div></td>');
        if(!originalId) {
            html.push('</tr>');
            $('tbody.x-data-list').append(html.join(''));
        } else {
            tr.html(html.join(''));
        }

    };

    $('.x-data-form').submit(function () {
        var form = $(this);
        if(!form.find('.x-err-msg').is(':visible')) {
            form.ajaxSubmit({
                url: '/order/saveOriginal',
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

    //edit originalLogistic
    $('tbody.x-data-list').delegate('.x-edit-btn','click',function(){
    //$('.x-edit-btn').click(function(){
        var id = $(this).closest('tr').find('td:first').find('input:first').val();
        if(isNaN(id)) {
            console.log('id %s not number!', id);
            return;
        }
        $.post('/order/editOriginal',{id:id}, function(resp){
            if(resp.succ) {
                var form = $('#editModal'),
                    obj = resp.data;
                form.find('input[name="receiver"]').val(obj.receiver||'');
                form.find('input[name="mobile"]').val(obj.mobile||'');
                form.find('textarea[name="address"]').val(obj.address||'');
                form.find('select[name="name"]').select2("val", obj.name||'');
                //$("#select").select2("val", "CA");
                form.find('input[name="number"]').val(obj.number||'');
                form.find('input[name="weight"]').val(obj.weight||'');
                form.find('textarea[name="remark"]').val(obj.remark||'');
                form.find('input[name="id"]').val(obj.id);
            }
        },'json');
    }).delegate('.x-delete-row','click',function(){
        // Delete row in a table
        var ele = $(this);
        var id = ele.closest('tr').find('td:first').find('input:first').val();
        if(isNaN(id)) {
            console.log('id %s not number!', id);
            return;
        }
        var c = confirm("确认删除此条信息吗？");
        if (c)
            $.post('/order/deleteOriginal',{id:id}, function(resp){
                if(resp.succ) {
                    ele.closest('tr').fadeOut(function () {
                        jQuery(this).remove();
                    });
                }
            },'json');
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