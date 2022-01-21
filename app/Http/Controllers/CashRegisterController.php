<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\CashRegister;
use App\Sale;
use App\Product_Sale;
use App\Payment;
use App\Returns;
use App\Expense;
use Auth;

class CashRegisterController extends Controller
{
	public function index()
	{
		if(Auth::user()->role_id <= 2) {
			$lims_cash_register_all = CashRegister::with('user', 'warehouse')->get();
			return view('cash_register.index', compact('lims_cash_register_all'));
		}
		else
			return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
	}
	public function store(Request $request)
	{
		$data = $request->all();
		$data['status'] = true;
		$data['user_id'] = Auth::id();
		CashRegister::create($data);
		return redirect()->back()->with('message', 'Cash register created successfully');
	}

	public function getDetails($id)
	{

		$cash_register_data = CashRegister::find($id);
        $factura_inicio = Sale::where('cash_register_id', $cash_register_data->id)->first();
        $factura_fin = Sale::where('cash_register_id', $cash_register_data->id)->get()->last();
        $data['factura_inicio']= $factura_inicio->reference_no;
        $data['factura_fin']= $factura_fin->reference_no;
        $data['cajero'] = $cash_register_data->user->name;
        $data['open'] = $cash_register_data->created_at->format('d/m/Y h:s');
        $data['close'] = $cash_register_data->updated_at->format('d/m/Y h:s');
        $data['cash_in_hand'] = $cash_register_data->cash_in_hand;
		$data['total_sale_amount'] = Sale::where([
										['cash_register_id', $cash_register_data->id],
										['sale_status', 1]
									])->sum('grand_total');
		$data['total_payment'] = Payment::where('cash_register_id', $cash_register_data->id)->sum('amount');
		$data['cash_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Cash']
								])->sum('amount');
		$data['credit_card_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Credit Card']
								])->sum('amount');
		$data['gift_card_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Gift Card']
								])->sum('amount');
		$data['deposit_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Deposit']
								])->sum('amount');
		$data['cheque_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Cheque']
								])->sum('amount');
		$data['paypal_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Paypal']
								])->sum('amount');
        $data['paypal_payment'] = Payment::where([
                                    ['cash_register_id', $cash_register_data->id],
                                    ['paying_method', 'Paypal']
                                ])->sum('amount');
        $sales = Sale::where([['cash_register_id', $cash_register_data->id],['sale_status', 1]])->get();
        $total_tax = Sale::where([['cash_register_id', $cash_register_data->id],['sale_status', 1]])->sum('total_tax');
        $grand_total = Sale::where([['cash_register_id', $cash_register_data->id],['sale_status', 1]])->sum('grand_total');
        $importe_15_imp = 0;
        $importe_18_imp = 0;
        $tax_15_imp = 0;
        $tax_18_imp = 0;
        foreach($sales as $sale){
            $importe_15_imp += Product_Sale::where('sale_id', $sale->id)->where('tax_rate', '15')->sum('net_unit_price');
            $importe_18_imp += Product_Sale::where([['sale_id', $sale->id],['tax_rate', '18']])->sum('net_unit_price');
            $tax_15_imp += Product_Sale::where([['sale_id', $sale->id],['tax_rate', '15']])->sum('tax');
            $tax_18_imp += Product_Sale::where([['sale_id', $sale->id],['tax_rate', '18']])->sum('tax');
        }
        $data['importe_15_imp'] = $importe_15_imp - $tax_15_imp;
        $data['importe_18_imp'] = $importe_18_imp - $tax_18_imp;
        $data['importe_0_imp'] = $grand_total - $importe_15_imp - $importe_18_imp;
        $data['tax_15_imp'] = $tax_15_imp;
        $data['tax_18_imp'] = $tax_18_imp;
        $data['total_tax'] = $total_tax;

		$data['total_sale_return'] = Returns::where('cash_register_id', $cash_register_data->id)->sum('grand_total');
		$data['total_expense'] = Expense::where('cash_register_id', $cash_register_data->id)->sum('amount');
		$data['total_cash'] = $data['cash_in_hand'] + $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
		$data['status'] = $cash_register_data->status;
		return $data;
	}

	public function showDetails($warehouse_id)
	{
		$cash_register_data = CashRegister::where([
					    		['user_id', Auth::id()],
					    		['warehouse_id', $warehouse_id],
					    		['status', true]
					    	])->first();

		$data['cash_in_hand'] = $cash_register_data->cash_in_hand;
		$data['total_sale_amount'] = Sale::where([
										['cash_register_id', $cash_register_data->id],
										['sale_status', 1]
									])->sum('grand_total');
		$data['total_payment'] = Payment::where('cash_register_id', $cash_register_data->id)->sum('amount');
		$data['cash_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Cash']
								])->sum('amount');
		$data['credit_card_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Credit Card']
								])->sum('amount');
		$data['gift_card_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Gift Card']
								])->sum('amount');
		$data['deposit_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Deposit']
								])->sum('amount');
		$data['cheque_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Cheque']
								])->sum('amount');
		$data['paypal_payment'] = Payment::where([
									['cash_register_id', $cash_register_data->id],
									['paying_method', 'Paypal']
								])->sum('amount');
		$data['total_sale_return'] = Returns::where('cash_register_id', $cash_register_data->id)->sum('grand_total');
		$data['total_expense'] = Expense::where('cash_register_id', $cash_register_data->id)->sum('amount');
		$data['total_cash'] = $data['cash_in_hand'] + $data['total_payment'] - ($data['total_sale_return'] + $data['total_expense']);
		$data['id'] = $cash_register_data->id;
		return $data;
	}

	public function close(Request $request)
	{
		$cash_register_data = CashRegister::find($request->cash_register_id);
		$cash_register_data->status = 0;
		$cash_register_data->save();
		return redirect()->back()->with('message', 'Cash register closed successfully');
	}

    public function checkAvailability($warehouse_id)
    {
    	$open_register_number = CashRegister::where([
						    		['user_id', Auth::id()],
						    		['warehouse_id', $warehouse_id],
						    		['status', true]
						    	])->count();
    	if($open_register_number)
    		return 'true';
    	else
    		return 'false';
    }
}
