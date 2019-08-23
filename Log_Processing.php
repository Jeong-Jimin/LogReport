<?php

include 'DB_Processing.php';


class LogProcessing 
{

function __construct()
{
	$this->DB 						= 		new DBProcessing();
	$this->pv_count 			= 		0;
}

	function getLogData($yesterday)
	{
		$matches 					=	 	array();
		$access_log_file 	= 		"/var/log/httpd/access_log.$yesterday";
		$lines 						= 		file($access_log_file);
		$ip_array     				=     array( );
		$return_array			= 		array();


			foreach ($lines as $line) 
			{
			  	$str 		=		explode(" ", $line);

	 			array_push($matches, preg_match('/ECMall/', $line)); 	#Insert all access for analisys pv
			   
			    array_push($ip_array, $str[0]); 										#Insert all access ip addr for analisys uu
			}

				
				#Get PV 
				for($i = 0 ; $i < sizeof($matches) ; $i++ )
					{
						if($matches[$i] == 1)
						{
							$this->pv_count  += 1;
						}
					}

				#add in array
				$return_array['pv_count'] = $this->pv_count; 
	
				
				#Get UU
				$uu_count    	=     count(array_unique($ip_array));	#Count ip_array list -> get unique ip address
				$return_array['uu_count'] = $uu_count;	#array_push
	
				
				#Get CVR
				$cvr_count  = $this->getCVR($yesterday, $this->pv_count);
				$return_array['cvr_count'] = $cvr_count;	#array_push

				#insert previous log data in DB ,  auto run every 9:55 AM using crontab 
				$this->DB->Insert($yesterday, $return_array['pv_count'],$return_array['uu_count'], $return_array['cvr_count']);

				return $return_array;
}

	
	/************* get CVR function *************/
function getCVR($yesterday, $pv_count)
	{
		$DB 						=		new DBProcessing();
		$order_count 	=		$DB->Orderselect($yesterday);	#get order count

		$cvr_count 		= 		round($order_count / $pv_count  * 100, 2);

		return $cvr_count;
	}
}

$yesterday 	=		date('ymd', strtotime('-1 day'));

#Create new object
$Log 				= 		new LogProcessing();

#Get log data
$log_count 	= 		$Log->getLogData($yesterday);  


  ?>