jQuery(document).ready(function() {
    //checkbox复选框
    jQuery(function () {
        $.XTableList();
    });
    //选择原始单号后，有备注的会弹窗显示
    jQuery('#select_original_number').change(function(){
        $('#add_btn').removeClass('hide');
        var selectedOption = $('#select_original_number option:selected');
        if($('#select_original_number').val()!="" && selectedOption.attr('remark')){
            jQuery.gritter.add({
                title: selectedOption.text()+'<br/>此邮件客户特别备注',
                text: selectedOption.attr('remark'),
                image: 'images/screen.png',
                sticky: false,
                time: ''});
        };
    });
    //选择原始单号后，有备注的会弹窗显示
    jQuery('.info').click(function(){
        jQuery.gritter.add({
            title: $(this).parents("tr").find(".wldh").text()+'<br/>此邮件客户特别备注',
            text:$(this).parents("tr").find(".field_name").val(),
            image: 'images/screen.png',
            sticky: false,
            time: ''});
    });
    //选择多选原始单号后，有备注的会弹窗显示
    //选择分发方式
    jQuery('#cbfs').change(function(){
        if($(this).val()=="1"){
            $('#cb').removeClass('hide');
            $('#yb').addClass('hide');
        }else{
            $('#yb').removeClass('hide');
            $('#cb').addClass('hide');
        };
    });
    //选择收件人'其他收件人'后显示控件
    jQuery('#sjrxx').change(function(){
        if($(this).val()=="qt"){
            $('#new_address').removeClass('hide');
        }else{
            $('#new_address').addClass('hide');
        };
    });
    jQuery('#select_contact_info').change(function(){
        if($(this).val()=="qt"){
            $('#new_address2').removeClass('hide');
        }else{
            $('#new_address2').addClass('hide');
        };
    });
    // Select2
    jQuery(".select2").select2({
        width: '100%'
    });
    //table2
    jQuery('#table2').dataTable({
        "sPaginationType": "full_numbers"
    });

    var addTransitForm = $('#add_transit_form'),
        unPackTable = $('tbody.x-unpack-list');
    addTransitForm.submit(function(){
        var orderId = $('#orderId').val();

        var originalId = $('#select_original_number').val();
        var originalNumber = $('#select_original_number option:selected').text();
        var transitType = $('#cbfs').val();

        var contact = $('#select_contact_info').val();

        if(contact == 'qt') {
            if($.trim(addTransitForm.find('input[name="receiver"]').val()) == ''
                || $.trim(addTransitForm.find('input[name="mobile"]').val()) == ''
                || $.trim(addTransitForm.find('textarea[name="address"]').val()) == '') {
                alert('请填写完整收件人信息');
                return;
            }
        }

        addTransitForm.find('input[name="orderId"]').val(orderId);
        addTransitForm.find('input[name="originalId"]').val(originalId);
        addTransitForm.find('input[name="originalNumber"]').val(originalNumber);
        addTransitForm.find('input[name="transitType"]').val(transitType);
        addTransitForm.ajaxSubmit({
            url: '/transit/save',
            type: 'post',
            success: function (resp) {
                if (resp.succ) {
                    var trs = unPackTable.find('tr');
                    var html = [],
                        obj = resp.data;
                    html.push('<tr>');
                    html.push('<th>',trs.lenth ? parseInt(trs.first().find('th:first').text()) + 1 : 1,'<input type="hidden" value="',obj.id,'"/></th>');
                    html.push('<th>',obj.contactInfo,'</th>');
                    html.push('<th>',obj.name,'-',obj.number,'-',obj.weight||'','KG</th>');
                    html.push('<th><button type="button" class="btn btn-white btn-xs x-delete-btn" ><i class="fa  fa-trash-o"></i></button></th>');
                    html.push('</tr>');
                    addTransitForm[0].reset();
                } else {
                    addTransitForm.find('.x-err-msg').text(resp.errMsg).removeClass('hide');
                }
            }
        });
        return false;
    });


    unPackTable.delegate('.x-delete-btn','click',function(){
        //添加删除中转物流信息
        var ele = $(this);
        var id = ele.closest('tr').find('th:first').find('input:first').val();
        if(isNaN(id)) {
            console.log('id %s not number!', id);
            return;
        }
        var c = confirm("确认删除此条信息吗？");
        if (c)
            $.post('/transit/delete',{id:id}, function(resp){
                if(resp.succ) {
                    ele.closest('tr').fadeOut(function () {
                        jQuery(this).remove();
                    });
                }
            },'json');
        return false;
    });

    $('#add_btn').click(function(){
        addTransitForm.find('#weight').val($('#select_original_number option:selected').attr('weight'));
    })
});