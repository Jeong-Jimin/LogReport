<?php

#date  variable
$today 						=		 date('ymd');
$day 							= 		date("D", strtotime($today));
$Pre_businessday 	=		date('ymd', strtotime('-1 day'));


#Non-Business day flag
$weekend_check 		= 		false;
$holiday_check		=		false;
$business_flag		= 		false;
$japan_holiday 		= 		array('190916', '190923', '191014', '191103', '191123', '191222', '191223','190822');


#Monday = Send Previous friday Log report
if($day == "Mon")
{
	$Pre_businessday 	=		date('ymd', strtotime('-3 day'));
}


#Extract weekend day(Non-Business Day)
if($day == 'Sat' || $day == 'Sun')
{
	$weekend_check = true;
}


#Extract Holiday(Non-Business Day)
if(in_array($today, $japan_holiday, true))
{
	$holiday_check = true;
}


if($weekend_check || $holiday_check)
{
	#Do not send mail
	echo "Today is Weekend Or HoliDay, Do not send Log mail";
}

else
{
	$mail_set 		= 		$Mail->Mailto($Pre_businessday, $message);
}


?>