<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Period;
use Illuminate\Validation\Rule;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;

class PeriodController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('currency')) {
            $lims_period_all = Period::get();
            return view('period.index', compact('lims_period_all'));
        }
        else{
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $todayDate = date('m/d/Y');

         $this->validate($request, [
            'cai' => 'size:37|unique:periods',
            'rank_start' => 'size:8',
            'rank_end' => 'size:8',
            'deadline' => 'after:'.$todayDate,
            'emission_point' => 'size:3',
            'agency' => 'size:3',
            'document_type' => 'size:2',
        ]);

        $data = $request->all();
        Period::create($data);
        return redirect()->back()->with('message', 'Period created successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Period  $period
     * @return \Illuminate\Http\Response
     */
    public function show(Period $period)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Period  $period
     * @return \Illuminate\Http\Response
     */
    public function edit(Period $period)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Period  $period
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Period $period)
    {
         $todayDate = date('m/d/Y');

      $this->validate($request, [
            'cai' => 'size:37|unique:periods',
            'rank_start' => 'size:8',
            'rank_end' => 'size:8',
            'deadline' => 'after:'.$todayDate,
            'emission_point' => 'size:3',
            'agency' => 'size:3',
            'document_type' => 'size:2',
        ]);

        $data = $request->all();
        Period::find($data['period_id'])->update($data);
        return redirect()->back()->with('message', 'Period updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Period  $period
     * @return \Illuminate\Http\Response
     */
    public function destroy(Period $period)
    {
        if(!env('USER_VERIFIED'))
        return redirect()->back()->with('not_permitted', 'This feature is disable for demo!');
        Period::find($period->id)->delete();
        return redirect()->back()->with('message', 'Currency deleted successfully');
    }
}
