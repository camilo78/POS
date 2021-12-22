<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/png" href="{{url('public/logo', $general_setting->site_logo)}}" />
        <title>{{$general_setting->site_title}}</title>
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
        @media print {
        * {
        font-size:14px;
        line-height: 20px;
        text-transform: uppercase;
        }
        td,th {padding: 0px 0;}
        .hidden-print {
        display: none !important;
        }

        @page { 
           
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
            @if(preg_match('~[0-9]~', url()->previous()))
            @php $url = '../../pos'; @endphp
            @else
            @php $url = url()->previous(); @endphp
            @endif
            <div class="hidden-print">
                <table>
                    <tr>
                        <td><a href="{{$url}}" class="btn btn-info"><i class="fa fa-arrow-left"></i> {{trans('file.Back')}}</a> </td>
                        <td><button onclick="window.print();" class="btn btn-primary"><i class="dripicons-print"></i> {{trans('file.Print')}}</button></td>
                    </tr>
                </table>
                <br>
            </div>
            <div id="receipt-data">
                <div class="centered">
                    @if($general_setting->site_logo)
                    <img src="{{url('public/logo', $general_setting->site_logo)}}" height="120" style="filter: grayscale(100%);">
                    @endif
                    <h1 style="font-size:20px ">{{$lims_biller_data->company_name}}</h1>
                    @if($general_setting->rtn)
                    <h2>RTN: {{$general_setting->rtn}}</h2>
                    @endif
                    <p>{{trans('file.Address')}}: {{$lims_warehouse_data->address}} {{trans('file.Phone Number')}}: {{$lims_warehouse_data->phone}}
                    </p>
                </div>
                <p>Cajero: {{$lims_biller_data->name}} <br>
                    {{trans('file.Date')}} y hora {{$lims_sale_data->created_at->format('d/m/Y h:s')}}<br>
                    No. Factura: {{$lims_sale_data->reference_no}}<br>
                    {{trans('file.customer')}}: {{$lims_customer_data->name}}<br>
                    @if($lims_customer_data->tax_no)
                    RTN: {{$lims_customer_data->tax_no }}
                    @endif
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
                        @php
                        $total_product_tax = 0;
                        $total_product_tax_quince = 0;
                        $total_importe_quince = 0;
                        $total_product_tax_ocho = 0;
                        $total_importe_ocho = 0;
                        $tota_product_discount = 0;
                        $total_exent = 0;
                        $total_exo = 0;
                        @endphp
                        @foreach($lims_product_sale_data as $key => $product_sale_data)
                        @php
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
                        @endphp
                        <tr>
                            <td colspan="2">
                                {{$product_sale_data->qty}} x
                                {{$product_name}}
                                {{number_format((float)($product_sale_data->total / $product_sale_data->qty), 2, '.', '')}}
                                @if($product_sale_data->tax_rate)
                                <?php $total_product_tax += $product_sale_data->tax ?>
                                [{{trans('file.tax_avb')}} {{$product_sale_data->tax_rate}}%: {{number_format((float)($product_sale_data->tax), 2, '.', '')}}]
                                @endif

                                @if($product_sale_data->discount)
                                [{{trans('file.descuento_avb')}}
                                {{number_format((float)($product_sale_data->discount), 2, '.', '')}}]
                                @php $tota_product_discount += $product_sale_data->discount @endphp
                                @endif
                                @if($product_sale_data->tax_rate == 15)
                                @php   $total_product_tax_quince += $total_product_tax;
                                $total_importe_quince += $product_sale_data->total;
                                @endphp
                                @endif
                                @if($product_sale_data->tax_rate == 18)
                                @php   $total_product_tax_ocho += $total_product_tax;
                                $total_importe_ocho += $product_sale_data->total
                                @endphp
                                @endif
                                @if(!$product_sale_data->tax_rate)
                                @php $total_exent  += $product_sale_data->total;@endphp
                                @endif
                            </td>
                            <td style="text-align:right;vertical-align:bottom">{{number_format((float)$product_sale_data->total, 2, '.', '')}}</td>
                        </tr>
                        @endforeach
                        <!-- <tfoot> -->
                        @if($lims_sale_data->order_discount)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">{{trans('file.Order Discount')}}</th>
                            <th style="text-align:right">{{number_format((float)$lims_sale_data->order_discount, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($lims_sale_data->coupon_discount)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">{{trans('file.Coupon Discount')}}</th>
                            <th style="text-align:right">{{number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($tota_product_discount)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Descuentos y Rebajas</th>
                            <th style="text-align:right">{{number_format((float)$tota_product_discount, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Subtotal</th>
                            <th style="text-align:right">{{number_format((float)$lims_sale_data->total_price - $total_product_tax_quince - $total_product_tax_ocho, 2, '.', '')}}</th>
                        </tr>
                        @if($total_exent != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Exento</th>
                            <th style="text-align:right">{{number_format((float)$total_exent, 2, '.', '')}}</th>
                        </tr>
                        @if($total_exo != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Exonerado</th>
                            <th style="text-align:right">{{number_format((float)$total_exo , 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @endif
                        @if($total_importe_quince != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Gravado 15%</th>
                            <th style="text-align:right">{{number_format((float)$total_importe_quince - $total_product_tax_quince , 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($total_importe_ocho != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">Importe Gravado 18%</th>
                            <th style="text-align:right">{{number_format((float)$total_importe_ocho - $total_product_tax_ocho, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($total_product_tax_quince != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">ISV 15%</th>
                            <th style="text-align:right">{{number_format((float)$total_product_tax_quince , 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($total_product_tax_ocho != 0)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">ISV 18%</th>
                            <th style="text-align:right">{{number_format((float)$total_product_tax_ocho , 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($general_setting->invoice_format == 'gst' && $general_setting->state == 1)
                        <tr style="border :none;">
                            <td colspan="2">IGST</td>
                            <td style="text-align:right">{{number_format((float)$total_product_tax, 2, '.', '')}}</td>
                        </tr>
                        @elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2)
                        <tr style="border :none;">
                            <td colspan="2">SGST</td>
                            <td style="text-align:right">{{number_format((float)($total_product_tax / 2), 2, '.', '')}}</td>
                        </tr>
                        <tr style="border :none;">
                            <td colspan="2">CGST</td>
                            <td style="text-align:right">{{number_format((float)($total_product_tax / 2), 2, '.', '')}}</td>
                        </tr>
                        @endif
                        @if($lims_sale_data->order_tax)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">{{trans('file.Order Tax')}}</th>
                            <th style="text-align:right">{{number_format((float)$lims_sale_data->order_tax, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        @if($lims_sale_data->shipping_cost)
                        <tr style="border :none;">
                            <th colspan="2" style="text-align:left">{{trans('file.Shipping Cost')}}</th>
                            <th style="text-align:right">{{number_format((float)$lims_sale_data->shipping_cost, 2, '.', '')}}</th>
                        </tr>
                        @endif
                        <tr style="border-top: 1px dotted #ddd;">
                            <th style="text-align:left">{{trans('file.grand total')}}</th>
                            <th colspan="2" style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->grand_total, 2, '.', '')}}</th>
                        </tr>
                        <tr>
                            @if($general_setting->currency_position == 'prefix')
                            <th class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{str_replace("-"," ",$numberInWords)}}</span> <span>{{$currency->name}}</span></th>
                            @else
                            <th class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{str_replace("-"," ",$numberInWords)}}</span> <span>{{$currency->code}}</span></th>
                            @endif
                        </tr>
                    </tbody>
                    <!-- </tfoot> -->
                </table>
                <table>
                    <tbody>
                        @foreach($lims_payment_data as $payment_data)
                        <tr style="background-color:#ddd;">
                            <td style="padding: 5px;width:30%">{{trans('file.Paid By')}}: {{trans("file.$payment_data->paying_method")}}</td>
                            <td style="padding: 5px;width:40%">{{trans('file.Amount')}}: {{number_format((float)$payment_data->amount, 2, '.', '')}}</td>
                            <td style="padding: 5px;width:30%">{{trans('file.Change')}}: {{number_format((float)$payment_data->change, 2, '.', '')}}</td>
                        </tr>
                        @endforeach
                        <tr>
                            <td class="centered" style="font-size:12px;" colspan="3">
                                {{trans('CAI')}} : {{$lims_sale_data->period->cai}}
                            </td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3">
                                {{trans('RANGO AUTORIZADO')}} : <br> {{$lims_sale_data->period->emission_point}}-{{$lims_sale_data->period->agency}}-{{$lims_sale_data->period->document_type}}-{{$lims_sale_data->period->rank_start}}/{{$lims_sale_data->period->rank_end}}
                            </td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3">{{$payment_data->payment_note}}</td>
                        </tr>
                        <tr>
                            <td class="centered" colspan="3">
                                {{trans('FECHA LIMITE DE EMISIÓN')}} :  <br>{{Carbon\Carbon::parse($lims_sale_data->period->deadline)->format('d-m-Y')}}
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
                                {{trans('file.Thank you for shopping with us. Please come again')}}
                            </td>
                        </tr>
                    </tbody>
                </table>
                <!-- <div class="centered" style="margin:30px 0 50px">
                    <small>{{trans('file.Invoice Generated By')}} {{$general_setting->site_title}}.
                    {{trans('file.Developed By')}} LionCoders</strong></small>
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
