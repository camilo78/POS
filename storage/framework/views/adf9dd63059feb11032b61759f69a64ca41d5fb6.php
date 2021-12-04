 <?php $__env->startSection('content'); ?>
<?php if($errors->has('name')): ?>
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e($errors->first('name')); ?></div>
<?php endif; ?>
<?php if($errors->has('code')): ?>
<div class="alert alert-danger alert-dismissible text-center">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e($errors->first('code')); ?></div>
<?php endif; ?>
<?php if(session()->has('message')): ?>
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('message')); ?></div>
<?php endif; ?>
<?php if(session()->has('not_permitted')): ?>
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><?php echo e(session()->get('not_permitted')); ?></div>
<?php endif; ?>
<?php if(count($errors) > 0): ?>
    <div class="alert alert-danger alert-dismissible text-center">
        <ul>
            <?php $__currentLoopData = $errors->all(); $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $error): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <li><?php echo e($error); ?></li>
            <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
        </ul>
    </div>
<?php endif; ?>
<section>
    <div class="container-fluid">
        <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> <?php echo e(trans('file.Add period')); ?> </button>&nbsp;
    </div>
    <div class="table-responsive">
        <table id="period-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th><?php echo e(trans('file.Description')); ?></th>
                    <th><?php echo e(trans('file.CAI')); ?></th>
                    <th><?php echo e(trans('file.Rank Start')); ?></th>
                    <th><?php echo e(trans('file.Rank End')); ?></th>
                    <th><?php echo e(trans('file.Deadline')); ?></th>
                    <th><?php echo e(trans('file.Emission Point')); ?></th>
                    <th><?php echo e(trans('file.Agency1')); ?></th>
                    <th><?php echo e(trans('file.Document')); ?></th>
                    <th><?php echo e(trans('file.Status')); ?></th>
                    <th class="not-exported"><?php echo e(trans('file.action')); ?></th>
                </tr>
            </thead>
            <tbody>
                <?php $__currentLoopData = $lims_period_all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key=>$period): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                <tr data-id="<?php echo e($period->id); ?>">
                    <td><?php echo e($key); ?></td>
                    <td><?php echo e($period->description); ?></td>
                    <td><?php echo e($period->cai); ?></td>
                    <td><?php echo e($period->rank_start); ?></td>
                    <td><?php echo e($period->rank_end); ?></td>
                    <td><?php echo e(date('d/m/Y', strtotime($period->deadline))); ?></td>
                    <td><?php echo e($period->emission_point); ?></td>
                    <td><?php echo e($period->agency); ?></td>
                    <td><?php echo e($period->document_type); ?></td>
                    <td>
                        <?php if($period->status == 0): ?>
                        <div class="badge badge-danger"><?php echo e(trans('Inactive')); ?></div>
                        <?php else: ?>
                        <div class="badge badge-success"><?php echo e(trans('Active')); ?></div>
                        <?php endif; ?>
                    </td>
                    <td>
                        <div class="btn-group">
                            <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><?php echo e(trans('file.action')); ?>

                                <span class="caret"></span>
                                <span class="sr-only">Toggle Dropdown</span>
                            </button>
                            <ul class="dropdown-menu edit-options dropdown-menu-right dropdown-default" user="menu">
                                <li><button type="button"
                                    data-id="<?php echo e($period->id); ?>"
                                    data-description="<?php echo e($period->description); ?>"
                                    data-cai="<?php echo e($period->cai); ?>"
                                    data-rank_start="<?php echo e($period->rank_start); ?>"
                                    data-rank_end="<?php echo e($period->rank_end); ?>"
                                    data-deadline="<?php echo e($period->deadline); ?>"
                                    data-emission_point="<?php echo e($period->emission_point); ?>"
                                    data-agency="<?php echo e($period->agency); ?>"
                                    data-document_type="<?php echo e($period->document_type); ?>"
                                    data-status="<?php echo e($period->status); ?>"
                                    class="edit-btn btn btn-link" data-toggle="modal" data-target="#editModal"><i class="dripicons-document-edit"></i> <?php echo e(trans('file.edit')); ?></button></li>
                                <li class="divider"></li>
                                <?php echo e(Form::open(['route' => ['period.destroy', $period->id], 'method' => 'DELETE'] )); ?>

                                <li>
                                    <button type="submit" class="btn btn-link" onclick="return confirm('Are you sure want to delete?')"><i class="dripicons-trash"></i> <?php echo e(trans('file.delete')); ?></button>
                                </li>
                                <?php echo e(Form::close()); ?>

                            </ul>
                        </div>
                    </td>
                </tr>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
            </tbody>
        </table>
    </div>
</section>

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
      <div class="modal-content">
        <?php echo Form::open(['route' => 'period.store', 'method' => 'post', 'files' => true]); ?>

        <div class="modal-header">
          <h5 id="exampleModalLabel" class="modal-title"><?php echo e(trans('file.Add period')); ?></h5>
          <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
        </div>
        <div class="modal-body">
          <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
            <div class="row">
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Description')); ?> *</label>
                    <?php echo e(Form::text('description',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => trans('file.Type description...')))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.CAI')); ?> *</label>
                    <?php echo e(Form::text('cai',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '000000-000000-000000-000000-000000-00'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Rank Start')); ?> *</label>
                    <?php echo e(Form::text('rank_start',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00000001'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Rank End')); ?> *</label>
                    <?php echo e(Form::text('rank_end',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00009000'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Deadline')); ?> *</label>
                    <?php echo e(Form::date('deadline',null,array('required' => 'required', 'class' => 'form-control'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Status')); ?> *</label>
                    <?php echo e(Form::select('status', ['0' => trans("file.Inactive"), '1' => trans("file.Active")], null, ['class' => 'form-control'])); ?>

                </div>
                 <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Emission Point')); ?> *</label>
                    <?php echo e(Form::text('emission_point',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))); ?>

                </div>
                <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Agency')); ?> *</label>
                    <?php echo e(Form::text('agency',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))); ?>

                </div>
                <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Document')); ?> *</label>
                    <?php echo e(Form::text('document_type',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '01'))); ?>

                </div>
                <div class="form-group col-md-12">
                  <input type="submit" value="<?php echo e(trans('file.submit')); ?>" class="btn btn-primary">
                </div>
            </div>
        </div>
        <?php echo e(Form::close()); ?>

      </div>
    </div>
</div>

<div id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
  <div role="document" class="modal-dialog">
    <div class="modal-content">
        <?php echo e(Form::open(['route' => ['period.update', 1], 'method' => 'PUT', 'files' => true] )); ?>

      <div class="modal-header">
        <h5 id="exampleModalLabel" class="modal-title"> <?php echo e(trans('file.Update period')); ?></h5>
        <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
      </div>
      <div class="modal-body">
          <p class="italic"><small><?php echo e(trans('file.The field labels marked with * are required input fields')); ?>.</small></p>
            <div class="row">
                <input type="hidden" name="period_id">
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Description')); ?> *</label>
                    <?php echo e(Form::text('description',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => trans('file.Type description...')))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.CAI')); ?> *</label>
                    <?php echo e(Form::text('cai',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '000000-000000-000000-000000-000000-00'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Rank Start')); ?> *</label>
                    <?php echo e(Form::text('rank_start',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00000001'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Rank End')); ?> *</label>
                    <?php echo e(Form::text('rank_end',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '00009000'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Deadline')); ?> *</label>
                    <?php echo e(Form::date('deadline',null,array('required' => 'required', 'class' => 'form-control'))); ?>

                </div>
                <div class="form-group col-md-6">
                    <label><?php echo e(trans('file.Status')); ?> *</label>
                    <?php echo e(Form::select('status', ['0' => trans("file.Inactive"), '1' => trans("file.Active")], null, ['class' => 'form-control'])); ?>

                </div>
                 <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Emission Point')); ?> *</label>
                    <?php echo e(Form::text('emission_point',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))); ?>

                </div>
                <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Agency')); ?> *</label>
                    <?php echo e(Form::text('agency',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '001'))); ?>

                </div>
                <div class="form-group col-md-4">
                    <label><?php echo e(trans('file.Document')); ?> *</label>
                    <?php echo e(Form::text('document_type',null,array('required' => 'required', 'class' => 'form-control', 'placeholder' => '01'))); ?>

                </div>
                <div class="form-group col-md-12">
                  <input type="submit" value="<?php echo e(trans('file.submit')); ?>" class="btn btn-primary">
                </div>
            </div>
        </div>
      <?php echo e(Form::close()); ?>

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
            'lengthMenu': '_MENU_ <?php echo e(trans("file.records per page")); ?>',
             "info":      '<small><?php echo e(trans("file.Showing")); ?> _START_ - _END_ (_TOTAL_)</small>',
             "infoEmpty":      "<?php echo e(trans("file.Showing")); ?> 0 to 0 of 0 <?php echo e(trans("file.entries")); ?> ",
             "zeroRecords":    "<?php echo e(trans("file.No data available in table")); ?>",
            "search":  '<?php echo e(trans("file.Search")); ?>',
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
<?php $__env->stopSection(); ?>

<?php echo $__env->make('layout.main', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH C:\laragon\www\salepro\resources\views/period/index.blade.php ENDPATH**/ ?>