$(function(){
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
            '<button type="button" class="btn btn-white x-delete-row btn-xs"><i class="fa fa-trash-o"></i></button></div></td>');
        if(!originalId) {
            html.push('</tr>');
            $('tbody.x-data-list').append(html.join(''));
        } else {
            tr.html(html.join(''));
        }
    };

    //edit originalLogistic
    $('tbody.x-data-list').delegate('.x-edit-btn','click',function(){
        //$('.x-edit-btn').click(function(){
        var id = $(this).closest('tr').find('td:first').find('input:first').val();
        if(isNaN(id)) {
            console.log('id %s not number!', id);
            return;
        }
        $.post('/original/edit',{id:id}, function(resp){
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
            $.post('/original/delete',{id:id}, function(resp){
                if(resp.succ) {
                    ele.closest('tr').fadeOut(function () {
                        jQuery(this).remove();
                    });
                }
            },'json');
        return false;
    });


});