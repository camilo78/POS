@extends('layout.main') @section('content')
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div> 
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div> 
@endif

<section>
    <div class="container-fluid">
        @if(in_array("purchase-return-add", $all_permission))
            <a href="{{route('return-purchase.create')}}" class="btn btn-info"><i class="dripicons-plus"></i> {{trans('file.Add Return')}}</a>
        @endif
    </div>
    <div class="table-responsive">
        <table id="return-table" class="table return-list">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.Date')}}</th>
                    <th>{{trans('file.reference')}}</th>
                    <th>{{trans('file.Warehouse')}}</th>
                    <th>{{trans('file.Supplier')}}</th>
                    <th>{{trans('file.Account')}}</th>
                    <th>{{trans('file.grand total')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_return_all as $key=>$return)
                <?php 
                    $supplier = $return->supplier;
                    if(!$supplier)
                        $supplier = new App\Supplier();
                    $account = DB::table('accounts')->find($return->account_id);
                ?>
                <tr class="return-link" data-return='["{{date($general_setting->date_format, strtotime($return->created_at->toDateString()))}}", "{{$return->reference_no}}", "{{$return->warehouse->name}}", "{{$return->warehouse->phone}}", "{{$return->warehouse->address}}", "{{$supplier->name}}", "{{$supplier->company_name}}","{{$supplier->email}}", "{{$supplier->phone_number}}", "{{$supplier->address}}", "{{$supplier->city}}", "{{$return->id}}", "{{$return->total_tax}}", "{{$return->total_discount}}", "{{$return->total_cost}}", "{{$return->order_tax}}", "{{$return->order_tax_rate}}", "{{$return->grand_total}}", "{{$return->return_note}}", "{{$return->staff_note}}", "{{$return->user->name}}", "{{$return->user->email}}"]'>
                    <td>{{$key}}</td>
                    <td>{{ date($general_setting->date_format, strtotime($return->created_at->toDateString())) . ' '. $return->created_at->toTimeString() }}</td>
                    <td>{{ $return->reference_no }}</td>
                    <td>{{ $return->warehouse->name }}</td>
                    <td>{{ $supplier->name }}</td>
                    <td>{{$account->name}}</td>
                    <td class="grand-total">{{ $return->grand_total }}</td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li>
                                    <button type="button" class="btn btn-link view"><i class="fa fa-eye"></i> {{trans('file.View')}}</button>
                                </li>
                                @if(in_array("purchase-return-edit", $all_permission))
                                <li>
                                    <a href="{{ route('return-purchase.edit', $return->id) }}" class="btn btn-link"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}</a>
                                </li>
                                @endif
                                <li class="divider"></li>
                                @if(in_array("purchase-return-delete", $all_permission))
                                {{ Form::open(['route' => ['return-purchase.destroy', $return->id], 'method' => 'DELETE'] ) }}
                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirmDelete()"><i class="dripicons-trash"></i> {{trans('file.delete')}}</button>
                                </li>
                                {{ Form::close() }}
                                @endif
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
            <tfoot class="tfoot active">
                <th></th>
                <th>{{trans('file.Total')}}</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tfoot>
        </table>
    </div>
    <div id="return-details" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog" id="seleccion">
          <div class="modal-content">
            <div class="container mt-3 pb-2 border-bottom">
            <div class="row">
                <div class="col-md-12">
                    <h3 id="exampleModalLabel" class="modal-title text-center container-fluid">{{$general_setting->site_title}}</h3>
                </div>
                <div class="col-md-6 d-print-none">
                    <a href="javascript:imprSelec('seleccion')" class="btn btn-default btn-sm ml-3 d-print-none"><i class="dripicons-print"></i> Imprimir</a>
                    {{ Form::open(['route' => 'return-purchase.sendmail', 'method' => 'post', 'class' => 'sendmail-form'] ) }}
                        <input type="hidden" name="return_id">
                        <button class="btn btn-default btn-sm d-print-none"><i class="dripicons-mail"></i> {{trans('file.Email')}}</button>
                    {{ Form::close() }}
                </div>
                <div class="col-md-6 d-print-none">
                    <button type="button" id="close-btn" data-dismiss="modal" aria-label="Close" class="close d-print-none"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="col-md-12 text-center">
                    <i style="font-size: 15px;">{{trans('file.Return Details')}}</i>
                </div>
            </div>
        </div>
                <div id="return-content" class="modal-body">
                </div>
                <br>
                <table class="table table-bordered product-return-list">
                    <thead>
                        <th>#</th>
                        <th>{{trans('file.product')}}</th>
                        <th>{{trans('file.Batch No')}}</th>
                        <th>{{trans('file.Qty')}}</th>
                        <th>{{trans('file.Unit Cost')}}</th>
                        <th>{{trans('file.Tax')}}</th>
                        <th>{{trans('file.Discount')}}</th>
                        <th width="20%">{{trans('file.Subtotal')}}</th>
                    </thead>
                    <tbody>
                    </tbody>
                </table>
                <div id="return-footer" class="modal-body"></div>
          </div>
        </div>
    </div>
</section>
<script type="text/javascript">
     function numberWithCommas(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    $("ul#return").siblings('a').attr('aria-expanded','true');
    $("ul#return").addClass("show");
    $("ul#return #purchase-return-menu").addClass("active");

    var all_permission = <?php echo json_encode($all_permission) ?>;
    var return_id = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    $("tr.return-link td:not(:first-child, :last-child)").on("click", function(){
        var returns = $(this).parent().data('return');
        returnDetails(returns);
    });

    $(".view").on("click", function(){
        var returns = $(this).parent().parent().parent().parent().parent().data('return');
        returnDetails(returns);
    });

   function imprSelec(seleccion) {
      var seleccion = document.getElementById(seleccion);
      var ventimp = window.open(' ', 'popimpr');
      ventimp.document.write('<html><head><title>' + document.title + '</title> </title> <style media="print"> .col-md-12{margin-bottom:0px} @page {size: auto;/* es el valor por defecto */ margin-top:2cm; margin-right:1.5cm; margin-left:1.5cm;margin-bottom:1.5cm}.col-md-6 {width:48%; margin-right:5px; margin-bottom:25px;float:left;}body{font-size:14px} table {cell-spacing: 0;border-collapse: collapse; margin-top 50px !important;page-break-after:auto} tr    { page-break-inside:avoid; page-break-after:auto }td{ page-break-inside:avoid; page-break-after:auto }thead{ display:table-header-group }tfoot { display:table-footer-group }thead > tr {background-color: #025B86;color: white;}thead > tr > * {font-size: 13px;padding: 0.45em;} tr > * {padding: 0.125em 0.45em;} th, td{border: solid 1px #025B86;} .text-right{text-align: right } .text-center{text-align: center; } .d-print-none{display:none} h5{font-size:18px;margin-top: 0;margin-bottom:10px;text-align:center;} h1, h3{text-align:center}</style>');
      ventimp.document.write('</head><body >');
      ventimp.document.write( seleccion.innerHTML );
      ventimp.document.write('</body></html>');
      ventimp.document.close();
      ventimp.print( );
      ventimp.close();
    }


    $('#return-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 7]
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.pdfHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.csvHtml5.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
                },
                action: function(e, dt, button, config) {
                    datatable_sum(dt, true);
                    $.fn.dataTable.ext.buttons.print.action.call(this, e, dt, button, config);
                    datatable_sum(dt, false);
                },
                footer:true
            },
            {
                text: '<i title="delete" class="dripicons-cross"></i>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        return_id.length = 0;
                        $(':checkbox:checked').each(function(i){
                            if(i){
                                var returns = $(this).closest('tr').data('return');
                                return_id[i-1] = returns[11];
                            }
                        });
                        if(return_id.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'return-purchase/deletebyselection',
                                data:{
                                    returnIdArray: return_id
                                },
                                success:function(data){
                                    alert(data);
                                    dt.rows({ page: 'current', selected: true }).remove().draw(false);
                                }
                            });
                            //dt.rows({ page: 'current', selected: true }).remove().draw(false);
                        }
                        else if(!return_id.length)
                            alert('Nothing is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
        drawCallback: function () {
            var api = this.api();
            datatable_sum(api, false);
        }
    } );

    function datatable_sum(dt_selector, is_calling_first) {
        if (dt_selector.rows( '.selected' ).any() && is_calling_first) {
            var rows = dt_selector.rows( '.selected' ).indexes();

            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
        else {
            $( dt_selector.column( 6 ).footer() ).html(dt_selector.cells( rows, 6, { page: 'current' } ).data().sum().toFixed(2));
        }
    }

    function returnDetails(returns){
        $('input[name="return_id"]').val(returns[11]);
        var htmltext = '<strong>{{trans("file.Date")}}: </strong>'+returns[0]+'<br><strong>{{trans("file.reference")}}: </strong>'+returns[1]+'<br><br><div class="row"><div class="col-md-6"><strong>{{trans("file.From")}}:</strong><br>'+returns[2]+'<br>'+returns[3]+'<br>'+returns[4]+'</div><div class="col-md-6"><div class="float-right"><strong>{{trans("file.To")}}:</strong><br>'+returns[5]+'<br>'+returns[6]+'<br>'+returns[7]+'<br>'+returns[8]+'<br>'+returns[9]+', '+returns[10]+'</div></div></div>';
        $.get('return-purchase/product_return/' + returns[11], function(data){
            $(".product-return-list tbody").remove();
            var name_code = data[0];
            var qty = data[1];
            var unit_code = data[2];
            var tax = data[3];
            var tax_rate = data[4];
            var discount = data[5];
            var subtotal = data[6];
            var batch_no = data[7];
            var newBody = $("<tbody>");
            $.each(name_code, function(index){
                var newRow = $("<tr>");
                var cols = '';
                cols += '<td><strong>' + (index+1) + '</strong></td>';
                cols += '<td>' + name_code[index] + '</td>';
                cols += '<td>' + batch_no[index] + '</td>';
                cols += '<td>' + qty[index] + ' ' + unit_code[index] + '</td>';
                cols += '<td align="right">' + numberWithCommas(parseFloat((subtotal[index] / qty[index])).toFixed(2))  + '</td>';
                cols += '<td align="right">' + numberWithCommas(parseFloat(tax[index]).toFixed(2)) + '(' + tax_rate[index] + '%)' + '</td>';
                cols += '<td align="right">' + numberWithCommas(parseFloat(discount[index]).toFixed(2)) + '</td>';
                cols += '<td align="right">' + numberWithCommas(parseFloat(subtotal[index]).toFixed(2)) + '</td>';
                newRow.append(cols);
                newBody.append(newRow);
            });

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=5><strong>{{trans("file.Total")}}:</strong></td>';
            cols += '<td align="right">' + numberWithCommas(parseFloat(returns[12]).toFixed(2)) + '</td>';
            cols += '<td align="right">' + numberWithCommas(parseFloat(returns[13]).toFixed(2)) + '</td>';
            cols += '<td align="right">' + numberWithCommas(parseFloat(returns[14]).toFixed(2)) + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=7><strong>{{trans("file.Order Tax")}}:</strong></td>';
            cols += '<td align="right">Lps. ' + numberWithCommas(parseFloat(returns[15]).toFixed(2)) + '(' + returns[16] + '%)' + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            var newRow = $("<tr>");
            cols = '';
            cols += '<td colspan=7><strong>{{trans("file.grand total")}}:</strong></td>';
            cols += '<td align="right">Lps. ' + numberWithCommas(parseFloat(returns[17]).toFixed(2)) + '</td>';
            newRow.append(cols);
            newBody.append(newRow);

            $("table.product-return-list").append(newBody);
        });
        var htmlfooter = '<p><strong>{{trans("file.Return Note")}}:</strong> '+returns[18]+'</p><p><strong>{{trans("file.Staff Note")}}:</strong> '+returns[19]+'</p><strong>{{trans("file.Created By")}}:</strong><br>'+returns[20]+'<br>'+returns[21];
        $('#return-content').html(htmltext);
        $('#return-footer').html(htmlfooter);
        $('#return-details').modal('show');
    }

    if(all_permission.indexOf("purchase-return-delete") == -1)
        $('.buttons-delete').addClass('d-none');
</script>
@endsection('content')
