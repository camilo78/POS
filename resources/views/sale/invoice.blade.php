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
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:ital,wght@0,300;0,400;1,300;1,400&display=swap" rel="stylesheet">
    <style type="text/css">
        * {
            font-size: 14px;
            line-height: 24px;
            font-family: 'IBM Plex Mono', monospace;
            text-transform: uppercase;
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
         td,td {padding: 7px 0;width: 100%;}

        table {width: 100%;}
        tfoot tr td:first-child {text-align: left;}

        .centered {
            text-align: center;
            align-content: center;
        }


        @media print {
            * {

                line-height: 20px;
            }
            td,td {padding: 5px 0;}
            .hidden-print {
                display: none !important;
            }
            @page { margin: 0.0cm 0.9cm 0.0cm 0.0cm; }
            @page:first { margin-bottom: 2cm; }
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

<div style="max-width:400px;margin:0 auto; margin-bottom:100px;">
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
                <img src="{{url('public/logo', $general_setting->site_logo)}}" height="120"  style="margin:10px 0;margin-top: -0px !important;filter: grayscale(100%">
            @endif
            
            <h1 style="font-size:20px">{{$lims_biller_data->company_name}}</h1>
            @if($general_setting->rtn)
                <h3 style="margin-top:-10px">{{trans('file.RTN')}}: {{$general_setting->rtn}}</h3>
            @endif
            <p style="margin-top:-10px">{{trans('file.Address')}}: {{$lims_warehouse_data->address}}
                <br>{{trans('file.Phone Number')}}: {{$lims_warehouse_data->phone}}
            </p>
        </div>
        <table>
            <tbody>
                <tr style="border:none">
                <td colspan="2" style="text-align:left">{{trans('file.Invoice')}} <br> {{$lims_sale_data->reference_no}}</td>
                <td style="text-align:right">{{trans('file.Date')}} <br> {{$lims_sale_data->created_at->format('d/m/Y h:s')}}</td>
            </tr>
            </tbody>
        </table>
        <p style="text-align: center;">
            <span>
                {{trans('file.customer')}}: {{$lims_customer_data->name}}
            </span>

               {{$lims_customer_data->rtn === '' ? '<br>
            <span> RTN: ' . $lims_customer_data->rtn .'</span>' : ''}}

            <br>
            <span>
             {{-- {{trans('file.reference')}}: {{$lims_sale_data->reference_no}}<br> --}}
            </span>
        </p>
        <span >Cajero: {{ $lims_biller_data->name }}</span>
        <table>
                      <tr>
                    <td colspan="2" style="text-align:left">
                        DESCRIPCIÓN/CANTIDAD/PRECIO
                    </td>
                    <td style="text-align:right">
                        TOTAL
                    </td>
                </tr>
        </table>
        <table class="table-data">
            <tbody>
                <?php $total_product_tax = 0;?>
                @foreach($lims_product_sale_data as $key => $product_sale_data)
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
                    else
                        $product_name = $lims_product_data->name;
                ?>
                <tr>
                    <td colspan="2">
                        {{$product_name}}
                        <br>{{$product_sale_data->qty}} x {{number_format((float)($product_sale_data->total / $product_sale_data->qty), 2, '.', '')}}

                        @if($product_sale_data->tax_rate)
                            <?php $total_product_tax += $product_sale_data->tax ?>
                            [{{trans('file.Tax')}} ({{$product_sale_data->tax_rate}}%): {{$product_sale_data->tax}}]
                        @endif
                    </td>
                    <td style="text-align:right;vertical-align:bottom">{{number_format((float)$product_sale_data->total, 2, '.', '')}}</td>
                </tr>
                @endforeach
            
            <!-- <tfoot> -->
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Total')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->total_price, 2, '.', '')}}</td>
                </tr>
                @if($general_setting->invoice_format == 'gst' && $general_setting->state == 1)
                <tr>
                    <td colspan="2">IGST</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$total_product_tax, 2, '.', '')}}</td>
                </tr>
                @elseif($general_setting->invoice_format == 'gst' && $general_setting->state == 2)
                <tr>
                    <td colspan="2">SGST</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)($total_product_tax / 2), 2, '.', '')}}</td>
                </tr>
                <tr>
                    <td colspan="2">CGST</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)($total_product_tax / 2), 2, '.', '')}}</td>
                </tr>
                @endif
                @if($lims_sale_data->order_tax)
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Order Tax')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->order_tax, 2, '.', '')}}</td>
                </tr>
                @endif
                @if($lims_sale_data->order_discount)
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Order Discount')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->order_discount, 2, '.', '')}}</td>
                </tr>
                @endif
                @if($lims_sale_data->coupon_discount)
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Coupon Discount')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->coupon_discount, 2, '.', '')}}</td>
                </tr>
                @endif
                @if($lims_sale_data->shipping_cost)
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Shipping Cost')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->shipping_cost, 2, '.', '')}}</td>
                </tr>
                @endif
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.grand total')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->grand_total, 2, '.', '')}}</td>
                </tr>
                @if($balance != 0)
                <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Abono')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{number_format((float)$lims_sale_data->paid_amount, 2, '.', '')}}</td>
                </tr>
                 <tr>
                    <td colspan="2" style="text-align:right">{{trans('file.Balance')}}</td>
                    <td style="text-align:right">{{$currency->code}} {{$balance}}</td>
                </tr>
                @endif
                <tr>
                    @if($general_setting->currency_position == 'prefix')
                    <td class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{str_replace("-"," ",$numberInWords)}} con {{substr(number_format((float)$lims_sale_data->paid_amount, 2, '.', ''),-2)}}/100</span></td>
                    @else
                    <td class="centered" colspan="3">{{trans('file.In Words')}}: <span>{{str_replace("-"," ",$numberInWords)}}</span> <span>{{$currency->code}}</span></td>
                    @endif
                </tr>
            </tbody>
            <!-- </tfoot> -->
        </table>
        <table style="margin-bottom: 2cm;">
            <tbody>
                @foreach($lims_payment_data as $payment_data)
                <tr>
                     <td colspan="2" class="centered foot">{{trans('file.Paid By')}}: {{ trans('file.'. $payment_data->paying_method) }}</td>
                </tr>
                <tr style="background-color:#ddd;">

                    <td style="padding: 5px;width:40%">{{trans('file.Amount')}}: {{number_format((float)$payment_data->amount, 2, '.', '')}}</td>
                    <td style="padding: 5px;width:30%">{{trans('file.Change')}}: {{number_format((float)$payment_data->change, 2, '.', '')}}</td>
                </tr>                
                @endforeach
            @if($lims_sale_data->sale_note)
            <tr><td class="centered small" colspan="2">{{$lims_sale_data->sale_note}}</td></tr>
            @endif
            @if($lims_sale_data->staff_note)
            <tr><td class="centered small" colspan="2">{{$lims_sale_data->staff_note}}</td></tr>
            @endif
                <tr><td class="centered small" style="font-style: italic;" colspan="2">{{trans('file.Thank you for shopping with us. Please come again')}}</td></tr>
             {{--    <tr><td class="centered foot" colspan="3">N° ORDE DE COMPRA EXENTA: 2523252 2 3225 2325 2</td></tr>
                <tr><td class="centered foot" colspan="3">N° CONST. REGISTRO EXONERADO: 5256325625</td></tr>
                <tr><td class="centered foot" colspan="3">N° REGISTRO SAG: 7856325-6985</td></tr> --}}

                <tr><td class="centered foot" style="font-size:11px" colspan="3">CAI: {{$lims_sale_data->period->cai}}</td></tr>
                <tr><td class="centered foot" colspan="3">RANGO AUTORIZADO: {{$lims_sale_data->period->emission_point}}-{{$lims_sale_data->period->agency}}-{{$lims_sale_data->period->document_type}}-{{$lims_sale_data->period->rank_start}}/{{$lims_sale_data->period->rank_end}}</td></tr>
                <tr><td class="centered foot" colspan="3">FECHA LIMITE DE EMISIÓN: {{$lims_sale_data->period->deadline}}</td></tr>

                <tr>
                    <td class="centered" colspan="3">
                    <?php echo '<img style="margin-top:10px;" src="data:image/png;base64,' . DNS1D::getBarcodePNG($lims_sale_data->reference_no, 'C128') . '" width="300" alt="barcode"   />';?>
                    </td>
                </tr>
            </tbody>
        </table>
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
