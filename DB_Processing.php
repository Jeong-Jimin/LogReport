<?php
include 'db_Model.php' ;


class DBProcessing 
{

	function __construct()
	{
	     $this->dbAccess = new MyDB();
	}

	#get previous order count 
	function Orderselect($yesterday)
	{
		$getOrderCount =$this->dbAccess->query("select * from order_list where order_date = $yesterday");

		$getOrderCount = (json_decode($getOrderCount));

		return $getOrderCount->count;
	}

	#get previous log data   
	function Logselect($yesterday)
	{
		$logData =$this->dbAccess->query("select * from log_analisys where date = $yesterday");

		return $logData;
	}

#auto run when every 10:00 AM
	function Insert($yesterday, $pv_count, $uu_count, $cvr_count)
	{
		#Get  order_date from DB
		$order_count = $this->Orderselect($yesterday);

		$InsertLogQuery =$this->dbAccess->query("insert into log_analisys values ($yesterday, $pv_count, $uu_count, $order_count, $cvr_count)");
	}

}


  ?>