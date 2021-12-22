<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/png" href="<?php echo e(url('public/logo', $general_setting->site_logo)); ?>" />
        <title><?php echo e($general_setting->site_title); ?></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono&display=swap" rel="stylesheet">
        <style type="text/css">
        * {
        font-size: 14px;
        line-height: 24px;
        font-family: 'IBM Plex Mono', monospace;
        text-transform: capitalize;
        }
        .btn {
        padding: 7px 10px;
        text-decoration: none;
        border: none;
        display: block;
        text-align: center;
        margin: 7px;
        cursor:pointer;
        }
        .btn-info {
        background-color: #999;
        color: #FFF;
        }
        .btn-primary {
        background-color: #6449e7;
        color: #FFF;
        width: 100%;
        }
        td,
        th,
        tr,
        table {
        border-collapse: collapse;
        }
        tr {border-bottom: 1px dotted #ddd;}
        td,th {padding: 7px 0;width: 50%;}
        table {width: 100%;}
        tfoot tr th:first-child {text-align: left;}
        .centered {
        text-align: center;
        align-content: center;
        }
        small{font-size:11px;}
        @media  print {
        * {
        font-size:14px;
        line-height: 20px;
        text-transform: uppercase;
        }
        td,th {padding: 0px 0;}
        .hidden-print {
        display: none !important;
        }

        @page  { 
           
            margin-left: 0px;
            margin-right: 20px;

         }
        @page:first { margin-top: 0.5cm; }
        tbody::after {
        content: ''; display: block;
        page-break-after: always;
        page-break-inside: avoid;
        page-break-before: avoid;
        }
        }
        </style>
    </head>
    <body>
        <div style="max-width:400px;margin:0 auto">
            <?php if(preg_match('~[0-9]~', url()->previous())): ?>
            <?php $url = '../../pos'; ?>
            <?php else: ?>
            <?php $url = url()->previous(); ?>
            <?php endif; ?>
            <div class="hidden-print">
                <table>
                    <tr>
                        <td><a href="<?php echo e($url); ?>" class="btn btn-info"><i class="fa fa-arrow-left"></i> <?php echo e(trans('file.Back')); ?></a> </td>
                        <td><button onclick="window.print();" class="btn btn-primary"><i class="dripicons-print"></i> <?php echo e(trans('file.Print')); ?></button></td>
                    </tr>
                </table>
                <br>
            </div>
            <div id="receipt-data">
                <div class="centered">
                    <?php if($general_setting->site_logo): ?>
                    <img src="<?php echo e(url('public/logo', $general_setting->site_logo)); ?>" height="120" style="filter: grayscale(100%);">
                    <?php endif; ?>
                    <h1 style="font-size:20px "><?php echo e($lims_biller_data->company_name); ?></h1>
                    <?php if($general_setting->rtn): ?>
                    <h2>RTN: <?php echo e($general_setting->rtn); ?></h2>
                    <?php endif; ?>
                    <p><?php echo e(trans('file.Address')); ?>: <?php echo e($lims_warehouse_data->address); ?> <?php echo e(trans('file.Phone Number')); ?>: <?php echo e($lims_warehouse_data->phone); ?>

                    </p>
                </div>
                <p>Cajero: <?php echo e($lims_biller_data->name); ?> <br>
                    <?php echo e(trans('file.Date')); ?> y hora <?php echo e($lims_sale_data->created_at->format('d/m/Y h:s')); ?><br>
                    No. Factura: <?php echo e($lims_sale_data->reference_no); ?><br>
                    <?php echo e(trans('file.customer')); ?>: <?php echo e($lims_customer_data->name); ?><br>
                    <?php if($lims_customer_data->tax_no): ?>
                    RTN: <?php echo e($lims_customer_data->tax_no); ?>

                    <?php endif; ?>
                </p>
                <table class="table-data">
                    <tbody>
                        <tr>
                            <td colspan="2" style="text-align:left;border-top: 1 solid #ffffff">
                                CANTIDAD/DESCRIPCIÓN/PRECIO
                            </td>
                            <td style="text-align:right">
                                TOTAL
                            </td>
                        </tr>
                        <?php
                        $total_product_tax = 0;
                        $total_product_tax_quince = 0;
                        $total_importe_quince = 0;
                        $total_product_tax_ocho = 0;
                        $total_importe_ocho = 0;
                        $tota_product_discount = 0;
                        $total_exent = 0;
                        $total_exo = 0;
                        ?>
                        <?php $__currentLoopData = $lims_product_sale_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $key => $product_sale_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <?php
                        $lims_product_data = \App\Product::find($product_sale_data->product_id);
                        if($product_sale_data->variant_id) {
                        $variant_data = \App\Variant::find($product_sale_data->variant_id);
                        $product_name = $lims_product_data->name.' ['.$variant_data->name.']';
                        }
                        elseif($product_sale_data->product_batch_id) {
                        $product_batch_data = \App\ProductBatch::select('batch_no')->find($product_sale_data->product_batch_id);
                        $product_name = $lims_product_data->name.' ['.trans("file.Batch No").':'.$product_batch_data->batch_no.']';
                        }
                        else{
                        $product_name = $lims_product_data->name;
                        }
                        /* do {
                        $total_product_tax_ += $product_sale_data->tax
                        } while(condición);*/
                        ?>
                        <tr>
                            <td colspan="2">
                                <?php echo e($product_sale_data->qty); ?> x
                                <?php echo e($product_name); ?>

                                <?php echo e(number_format((float)($product_sale_data->total / $product_sale_data->qty), 2, '.', '')); ?>

                                <?php if($product_sale_data->tax_rate): ?>
                                <?php $total_product_tax += $product_sale_data->tax ?>
                                [<?php echo e(trans('file.tax_avb')); ?> <?php echo e($product_sale_data->tax_rate); ?>%: <?php echo e(number_format((float)($product_sale_data->tax), 2, '.', '')); ?>]
                                <?php endif; ?>

                                <?php if($product_sale_data->discount): ?>
                                [<?php echo e(trans('file.descuento_avb')); ?>

                                <?php echo e(number_format((float)($product_sale_data->discount), 2, '.', '')); ?>]
                                <?php $tota_product_discount += $product_sale_data->discount ?>
                                <?php endif; ?>
                                <?php if($product_sale_data->tax_rate == 15): ?>
                                <?php   $total_product_tax_quince += $total_product_tax;
                                $total_importe_quince += $product_sale_data->total;
                                ?>
                                <?php endif; ?>
                                <?php if($product_sale_data->tax_rate == 18): ?>
                                <?php   $total_product_tax_ocho += $total_product_tax;
                                $total_importe_ocho += $product_sale_data->total - $total_product_tax_ocho;
                                ?>
                                <?php endif; ?>
                                <?php if(!$product_sale_data->tax_rate): ?>
                                <?php $total_exent  += $product_sale_data->total;?>
                                <?php endif; ?>
                            </td>
                            <td style="text-align:right;vertical-align:bottom"><?php echo e(number_format((float)$product_sale_data->total, 2, '.', '')); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <!-- <tfoot> -->
                        <?php if($lims_sale_data->order_discount): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left"><?php echo e(trans('file.Order Discount')); ?></th>
                            <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->order_discount, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($lims_sale_data->coupon_discount): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left"><?php echo e(trans('file.Coupon Discount')); ?></th>
                            <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($tota_product_discount): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Descuentos y Rebajas</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$tota_product_discount, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Subtotal</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->total_price - $total_product_tax_quince - $total_product_tax_ocho, 2, '.', '')); ?></th>
                        </tr>
                        <?php if($total_exent != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Exento</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_exent, 2, '.', '')); ?></th>
                        </tr>
                        <?php if($total_exo != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Exonerado</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_exo , 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php endif; ?>
                        <?php if($total_importe_quince != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Gravado 15%</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_importe_quince - $total_product_tax_quince , 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($total_importe_ocho != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Gravado 18%</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_importe_ocho - $total_product_tax_ocho, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($total_product_tax_quince != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">ISV 15%</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_product_tax_quince , 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($total_product_tax_ocho != 0): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">ISV 18%</th>
                            <th style="text-align:right"><?php echo e(number_format((float)$total_product_tax_ocho , 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($general_setting->invoice_format == 'gst' && $general_setting->state == 1): ?>
                        <tr style="border :none;">
                            <td colspan="2">IGST</td>
                            <td style="text-align:right"><?php echo e(number_format((float)$total_product_tax, 2, '.', '')); ?></td>
                        </tr>
                        <?php elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2): ?>
                        <tr style="border :none;">
                            <td colspan="2">SGST</td>
                            <td style="text-align:right"><?php echo e(number_format((float)($total_product_tax / 2), 2, '.', '')); ?></td>
                        </tr>
                        <tr style="border :none;">
                            <td colspan="2">CGST</td>
                            <td style="text-align:right"><?php echo e(number_format((float)($total_product_tax / 2), 2, '.', '')); ?></td>
                        </tr>
                        <?php endif; ?>
                        <?php if($lims_sale_data->order_tax): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left"><?php echo e(trans('file.Order Tax')); ?></th>
                            <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->order_tax, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <?php if($lims_sale_data->shipping_cost): ?>
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left"><?php echo e(trans('file.Shipping Cost')); ?></th>
                            <th style="text-align:right"><?php echo e(number_format((float)$lims_sale_data->shipping_cost, 2, '.', '')); ?></th>
                        </tr>
                        <?php endif; ?>
                        <tr style="border-top: 1px dotted #ddd;">
                            <th style="text-align:left"><?php echo e(trans('file.grand total')); ?></th>
                            <th colspan="2" style="text-align:right"><?php echo e($currency->code); ?> <?php echo e(number_format((float)$lims_sale_data->grand_total, 2, '.', '')); ?></th>
                        </tr>
                        <tr>
                            <?php if($general_setting->currency_position == 'prefix'): ?>
                            <th class="centered" colspan="3"><?php echo e(trans('file.In Words')); ?>: <span><?php echo e(str_replace("-"," ",$numberInWords)); ?></span> <span><?php echo e($currency->name); ?></span></th>
                            <?php else: ?>
                            <th class="centered" colspan="3"><?php echo e(trans('file.In Words')); ?>: <span><?php echo e(str_replace("-"," ",$numberInWords)); ?></span> <span><?php echo e($currency->code); ?></span></th>
                            <?php endif; ?>
                        </tr>
                    </tbody>
                    <!-- </tfoot> -->
                </table>
                <table>
                    <tbody>
                        <?php $__currentLoopData = $lims_payment_data; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $payment_data): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                        <tr style="background-color:#ddd;">
                            <td style="padding: 5px;width:30%"><?php echo e(trans('file.Paid By')); ?>: <?php echo e(trans("file.$payment_data->paying_method")); ?></td>
                            <td style="padding: 5px;width:40%"><?php echo e(trans('file.Amount')); ?>: <?php echo e(number_format((float)$payment_data->amount, 2, '.', '')); ?></td>
                            <td style="padding: 5px;width:30%"><?php echo e(trans('file.Change')); ?>: <?php echo e(number_format((float)$payment_data->change, 2, '.', '')); ?></td>
                        </tr>
                        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
                        <tr>
                            <td class="centered" style="font-size:12px;" colspan="3">
                                <?php echo e(trans('CAI')); ?> : <?php echo e($lims_sale_data->period->cai); ?>

                            </td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3">
                                <?php echo e(trans('RANGO AUTORIZADO')); ?> : <br> <?php echo e($lims_sale_data->period->emission_point); ?>-<?php echo e($lims_sale_data->period->agency); ?>-<?php echo e($lims_sale_data->period->document_type); ?>-<?php echo e($lims_sale_data->period->rank_start); ?>/<?php echo e($lims_sale_data->period->rank_end); ?>

                            </td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3"><?php echo e($payment_data->payment_note); ?></td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3">
                                <?php echo e(trans('FECHA LIMITE DE EMISIÓN')); ?> :  <br><?php echo e(Carbon\Carbon::parse($lims_sale_data->period->deadline)->format('d-m-Y')); ?>

                            </td>
                        </tr>
                        <tr>
                    <td class="centered" colspan="3">
                    <?php echo '<img style="margin-top:10px;" src="data:image/png;base64,' . DNS1D::getBarcodePNG($lims_sale_data->reference_no, 'C128') . '" width="300" alt="barcode"   />';?>
                    <br>
                    <?php echo '<img style="margin-top:10px;" src="data:image/png;base64,' . DNS2D::getBarcodePNG($lims_sale_data->reference_no, 'QRCODE') . '" alt="barcode"   />';?>
                    </td>
                </tr>
                        <tr>
                            <td class="centered" colspan="3">
                                <?php echo e(trans('file.Thank you for shopping with us. Please come again')); ?>

                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- <div class="centered" style="margin:30px 0 50px">
                    <small><?php echo e(trans('file.Invoice Generated By')); ?> <?php echo e($general_setting->site_title); ?>.
                    <?php echo e(trans('file.Developed By')); ?> LionCoders</strong></small>
                </div> -->
            </div>
        </div>
        <script type="text/javascript">
        localStorage.clear();
        function auto_print() {
        window.print()
        }
        setTimeout(auto_print, 1000);
        </script>
    </body>
</html>
<?php /**PATH /var/www/html/salepro/resources/views/sale/invoice.blade.php ENDPATH**/ ?>