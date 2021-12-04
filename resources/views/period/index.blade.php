@extends('layout.main') @section('content')
@if($errors->has('name'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('name') }}</div>
@endif
@if($errors->has('code'))
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ $errors->first('code') }}</div>
@endif
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
@if (count($errors) > 0)
    <div class="alert alert-danger alert-dismissible text-center">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> {{trans('file.Add period')}} </button>&nbsp;
    </div>
    <div class="table-responsive">
        <table id="period-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.Description')}}</th>
                    <th>{{trans('file.CAI')}}</th>
                    <th>{{trans('file.Rank Start')}}</th>
                    <th>{{trans('file.Rank End')}}</th>
                    <th>{{trans('file.Deadline')}}</th>
                    <th>{{trans('file.Emission Point')}}</th>
                    <th>{{trans('file.Agency1')}}</th>
                    <th>{{trans('file.Document')}}</th>
                    <th>{{trans('file.Status')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_period_all as $key=>$period)
                <tr data-id="{{$period->id}}">
                    <td>{{$key}}</td>
                    <td>{{ $period->description }}</td>
                    <td>{{ $period->cai }}</td>
                    <td>{{ $period->rank_start }}</td>
                    <td>{{ $period->rank_end }}</td>
                    <td>{{ date('d/m/Y', strtotime($period->deadline)) }}</td>
                    <td>{{ $period->emission_point }}</td>
                    <td>{{ $period->agency }}</td>
                    <td>{{ $period->document_type }}</td>
                    <td>
                        @if($period->status == 0)
                        <div class="badge badge-danger">{{ trans('Inactive') }}</div>
                        @else
                        <div class="badge badge-success">{{ trans('Active') }}</div>
                        @endif
                    </td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">{{trans('file.action')}}
                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li><button type="button"
                                    data-id="{{$period->id}}"
                                    data-description="{{$period->description}}"
                                    data-cai="{{$period->cai}}"
                                    data-rank_start="{{$period->rank_start}}"
                                    data-rank_end="{{$period->rank_end}}"
                                    data-deadline="{{$period->deadline}}"
                                    data-emission_point="{{$period->emission_point}}"
                                    data-agency="{{$period->agency}}"
                                    data-document_type="{{$period->document_type}}"
                                    data-status="{{$period->status}}"
                                    class="edit-btn btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> {{trans('file.edit')}}</button></li>
                                <li class="divider"></li>
                                {{ Form::open(['route' => ['period.destroy', $period->id], 'method' => 'DELETE'] ) }}
                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirm('Are you sure want to delete?')"><i class="dripicons-trash"></i> {{trans('file.delete')}}</button>
                                </li>
                                {{ Form::close() }}
                            </ul>
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        {!! Form::open(['route' => 'period.store', 'method' => 'post', 'files' => true]) !!}
        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add period')}}</h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
            <div class="row">
                <div class="form-group col-md-6">
                    <label>{{trans('file.Description')}} *</label>
                    {{Form::text('description',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => trans('file.Type description...')))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.CAI')}} *</label>
                    {{Form::text('cai',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '000000-000000-000000-000000-000000-00'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Rank Start')}} *</label>
                    {{Form::text('rank_start',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00000001'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Rank End')}} *</label>
                    {{Form::text('rank_end',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00009000'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Deadline')}} *</label>
                    {{Form::date('deadline',null,array('required' => 'required', 'class' => 'form-control'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Status')}} *</label>
                    {{ Form::select('status', ['0' => trans("file.Inactive"), '1' => trans("file.Active")], null, ['class' => 'form-control']) }}
                </div>
                 <div class="form-group col-md-4">
                    <label>{{trans('file.Emission Point')}} *</label>
                    {{Form::text('emission_point',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))}}
                </div>
                <div class="form-group col-md-4">
                    <label>{{trans('file.Agency')}} *</label>
                    {{Form::text('agency',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))}}
                </div>
                <div class="form-group col-md-4">
                    <label>{{trans('file.Document')}} *</label>
                    {{Form::text('document_type',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '01'))}}
                </div>
                <div class="form-group col-md-12">
                  <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                </div>
            </div>
        </div>
        {{ Form::close() }}
      </div>
    </div>
</div>

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
  <div role="document" class="modal-dialog">
    <div class="modal-content">
        {{ Form::open(['route' => ['period.update', 1], 'method' => 'PUT', 'files' => true] ) }}
      <div class="modal-header">
        <h5 id="exampleModalLabel" class="modal-title"> {{trans('file.Update period')}}</h5>
        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
      </div>
      <div class="modal-body">
          <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
            <div class="row">
                <input type="hidden" name="period_id">
                <div class="form-group col-md-6">
                    <label>{{trans('file.Description')}} *</label>
                    {{Form::text('description',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => trans('file.Type description...')))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.CAI')}} *</label>
                    {{Form::text('cai',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '000000-000000-000000-000000-000000-00'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Rank Start')}} *</label>
                    {{Form::text('rank_start',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00000001'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Rank End')}} *</label>
                    {{Form::text('rank_end',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00009000'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Deadline')}} *</label>
                    {{Form::date('deadline',null,array('required' => 'required', 'class' => 'form-control'))}}
                </div>
                <div class="form-group col-md-6">
                    <label>{{trans('file.Status')}} *</label>
                    {{ Form::select('status', ['0' => trans("file.Inactive"), '1' => trans("file.Active")], null, ['class' => 'form-control']) }}
                </div>
                 <div class="form-group col-md-4">
                    <label>{{trans('file.Emission Point')}} *</label>
                    {{Form::text('emission_point',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))}}
                </div>
                <div class="form-group col-md-4">
                    <label>{{trans('file.Agency')}} *</label>
                    {{Form::text('agency',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))}}
                </div>
                <div class="form-group col-md-4">
                    <label>{{trans('file.Document')}} *</label>
                    {{Form::text('document_type',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '01'))}}
                </div>
                <div class="form-group col-md-12">
                  <input type="submit" value="{{trans('file.submit')}}" class="btn btn-primary">
                </div>
            </div>
        </div>
      {{ Form::close() }}
    </div>
  </div>
</div>


<script type="text/javascript">

    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #period-menu").addClass("active");

    $(document).ready(function() {
        $(document).on('click', '.edit-btn', function() {
            $("#editModal input[name='period_id']").val($(this).data('id'));
            $("#editModal input[name='description']").val($(this).data('description'));
            $("#editModal input[name='cai']").val($(this).data('cai'));
            $("#editModal input[name='rank_start']").val($(this).data('rank_start'));
            $("#editModal input[name='rank_end']").val($(this).data('rank_end'));
            $("#editModal input[name='deadline']").val($(this).data('deadline'));
            $("#editModal input[name='emission_point']").val($(this).data('emission_point'));
            $("#editModal input[name='agency']").val($(this).data('agency'));
            $("#editModal input[name='document_type']").val($(this).data('document_type'));
            $("#editModal input[name='status']").val($(this).data('status'));
        });
    });

    $('#period-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
             "infoEmpty":      "{{trans("file.Showing")}} 0 to 0 of 0 {{trans("file.entries")}} ",
             "zeroRecords":    "{{ trans("file.No data available in table") }}",
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0, 8]
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
                    rows: ':visible',
                    stripHtml: false
                },
                customize: function(doc) {
                    for (var i = 1; i < doc.content[1].table.body.length; i++) {
                        if (doc.content[1].table.body[i][0].text.indexOf('<img src=') !== -1) {
                            var imagehtml = doc.content[1].table.body[i][0].text;
                            var regex = /<img.*?src=['"](.*?)['"]/;
                            var src = regex.exec(imagehtml)[1];
                            var tempImage = new Image();
                            tempImage.src = src;
                            var canvas = document.createElement("canvas");
                            canvas.width = tempImage.width;
                            canvas.height = tempImage.height;
                            var ctx = canvas.getContext("2d");
                            ctx.drawImage(tempImage, 0, 0);
                            var imagedata = canvas.toDataURL("image/png");
                            delete doc.content[1].table.body[i][0].text;
                            doc.content[1].table.body[i][0].image = imagedata;
                            doc.content[1].table.body[i][0].fit = [30, 30];
                        }
                    }
                },
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    format: {
                        body: function ( data, row, column, node ) {
                            if (column === 0 && (data.indexOf('<img src=') !== -1)) {
                                var regex = /<img.*?src=['"](.*?)['"]/;
                                data = regex.exec(data)[1];
                            }
                            return data;
                        }
                    }
                },
            },
            {
                extend: 'print',
                text: '<i title="print" class="fa fa-print"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                    stripHtml: false
                },
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
