@extends('layout.main') @section('content')

@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div> 
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div> 
@endif

<section>
    <div class="table-responsive">
        <table id="cash-register-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.User')}}</th>
                    <th>{{trans('file.Warehouse')}}</th>
                    <th>{{trans('file.Cash in Hand')}}</th>
                    <th>{{trans('file.Opened at')}}</th>
                    <th>{{trans('file.Closed at')}}</th>
                    <th>{{trans('file.Status')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_cash_register_all as $key=>$cash_register)
                <tr data-id="{{$cash_register->id}}">
                    <td>{{$key}}</td>
                    <td>{{ $cash_register->user->name }}</td>
                    <td>{{ $cash_register->warehouse->name }}</td>
                    <td>{{ $cash_register->cash_in_hand }}</td>
                    <td>{{ date($general_setting->date_format . " h:i:s", strtotime($cash_register->created_at)) }}</td>
                    @if($cash_register->status)
                        <td>N/A</td>
                        <td><div class="badge badge-success">{{trans('file.Active')}}</div></td>
                    @else
                        <td>{{ date($general_setting->date_format . " h:i:s", strtotime($cash_register->updated_at)) }}</td>
                        <td><div class="badge badge-danger">{{trans('file.Closed')}}</div></td>
                    @endif
                    <td>
                        <div class="btn-group">
                            <button type="button" data-id="{{$cash_register->id}}" class="register-details-btn btn btn-sm btn-info" data-toggle="modal" data-target="#register-details-modal" title="{{trans('file.View')}}"><i class="dripicons-preview"></i></button>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    <!-- cash register details modal -->
    <div id="register-details-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
        <div role="document" class="modal-dialog" id="seleccion">
          <div class="modal-content">
            <div class="modal-header">
              <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Cash Register Details')}}</h5>
              <a href="javascript:imprSelec('seleccion')" class="btn btn-default btn-sm ml-3 d-print-none"><i class="dripicons-print"></i> Imprimir</a>
              <button type="button" data-dismiss="modal" aria-label="Close" class="close d-print-none"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
                Cajero: <span id="cajero" ></span><br>
                Abierto a las : <span id="open" ></span> --
                Cerrado a las : <span id="close" ></span>
                Facturas Inicio:_____________________ Fin:_____________________
              <p class="d-print-none">{{trans('file.Please review the transaction and payments.')}}</p>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <tbody>
                                <tr>
                                  <td>Dinero para cambio:</td>
                                  <td id="cash_in_hand" class="text-right">100</td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Total Sale Amount')}}:</td>
                                  <td id="total_sale_amount" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Total Payment')}}:</td>
                                  <td id="total_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Cash Payment')}}:</td>
                                  <td id="cash_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Credit Card Payment')}}:</td>
                                  <td id="credit_card_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Cheque Payment')}}:</td>
                                  <td id="cheque_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Gift Card Payment')}}:</td>
                                  <td id="gift_card_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Paypal Payment')}}:</td>
                                  <td id="paypal_payment" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Total Sale Return')}}:</td>
                                  <td id="total_sale_return" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td>{{trans('file.Total Expense')}}:</td>
                                  <td id="total_expense" class="text-right"></td>
                                </tr>
                                <tr>
                                  <td><strong>{{trans('file.Total Cash')}}:</strong></td>
                                  <td id="total_cash" class="text-right"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="col-md-6" id="closing-section">
                        <form action="{{route('cashRegister.close')}}" method="POST">
                            @csrf
                            <input type="hidden" name="cash_register_id">
                            <button type="submit" class="btn btn-primary d-print-none" onclick="return confirmClose()">{{trans('file.Close Register')}}</button>
                        </form>
                    </div>
                </div>
            </div>
          </div>
        </div>
    </div>
</section>

  <script language="Javascript">
    function imprSelec(seleccion) {
      var seleccion = document.getElementById(seleccion);
      var ventimp = window.open(' ', 'popimpr');
      ventimp.document.write('<html><head><title>' + document.title + '</title> </title> <style media="print"> body{font-size:12px;margin-top:0px;transform: scale(.9);}table {width: 100%;border-collapse: collapse; margin-top:10px;}td {border: grey 1px solid; font-size:12px;} .text-right{text-align: right } .d-print-none{display:none} h5{font-size:18px;margin-top: 0;margin-bottom:10px;}</style>');
      ventimp.document.write('</head><body >');
      ventimp.document.write( seleccion.innerHTML );
      ventimp.document.write('</body></html>');
      ventimp.document.close();
      ventimp.print( );
      ventimp.close();
    }
    </script>
<script type="text/javascript">

    function confirmClose() {
      if (confirm("Are you sure want to close?")) {
          return true;
      }
      return false;
    }

    function numberWithCommas(num) {
      return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

  $(".register-details-btn").on("click", function (e) {
      id = $(this).data('id');
      $.ajax({
          url: 'cash-register/getDetails/'+id,
          type: "GET",
          success:function(data) {
              if(data['status'])
                $("#register-details-modal #closing-section").removeClass('d-none');
              else
                $("#register-details-modal #closing-section").addClass('d-none');
                $('#cajero').text(data['cajero']);
                $('#open').text(data['open']);
                $('#close').text(data['close']);

              $('#register-details-modal #cash_in_hand').text('Lps. '+numberWithCommas(data['cash_in_hand'].toFixed(2)));
              $('#register-details-modal #total_sale_amount').text('Lps. '+numberWithCommas(data['total_sale_amount'].toFixed(2)));
              $('#register-details-modal #total_payment').text('Lps. '+numberWithCommas(data['total_payment'].toFixed(2)));
              $('#register-details-modal #cash_payment').text('Lps. '+numberWithCommas(data['cash_payment'].toFixed(2)));
              $('#register-details-modal #credit_card_payment').text('Lps. '+numberWithCommas(data['credit_card_payment'].toFixed(2)));
              $('#register-details-modal #cheque_payment').text('Lps. '+numberWithCommas(data['cheque_payment'].toFixed(2)));
              $('#register-details-modal #gift_card_payment').text('Lps. '+numberWithCommas(data['gift_card_payment'].toFixed(2)));
              $('#register-details-modal #paypal_payment').text('Lps. '+numberWithCommas(data['paypal_payment'].toFixed(2)));
              $('#register-details-modal #total_sale_return').text('Lps. '+numberWithCommas(data['total_sale_return'].toFixed(2)));
              $('#register-details-modal #total_expense').text('Lps. '+numberWithCommas(data['total_expense'].toFixed(2)));
              $('#register-details-modal #total_cash').text('Lps. '+numberWithCommas(data['total_cash'].toFixed(2)));
              $('#register-details-modal input[name=cash_register_id]').val(id);

          }
      });
  });

    $('#cash-register-table').DataTable( {
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
                footer:true
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible'
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
                footer:true
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );
</script>

@endsection
