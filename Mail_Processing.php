<?php

include 'DB_Processing.php';
include './PHPMailer/PHPMailerAutoload.php';


class SendMail
{
	function __construct()
			{
				$this->DB 						= 		new DBProcessing();
			}

			function Mailto($yesterday)
			{		

				$mail = new PHPMailer(true);
				$mail->isSMTP();
				$mail->Username = 'jimin57465@naver.com';
				$mail->Password = 'password';


				$mail->Host = 'smtp.naver.com';
				$mail->SMTPAuth = true;
				$mail->SMTPSecure ="ssl";
				$mail->Port = 465;
				$mail -> SMTPDebug = 2;

				#Contents
				$mail->CharSet = "utf-8";
				$mail->setFrom('jimin57465@naver.com');
				$mail->addAddress('jung@estore.co.jp');


				// $mail->addAddress('takai@estore.co.jp');
				// $mail->addAddress('y-ito@estore.co.jp');
				// $mail->addAddress('yagi@estore.co.jp');
				// $mail->addAddress('kumamimi@estore.co.jp');
				// $mail->addAddress('m-park@estore.co.jp');
				// $mail->addAddress('mi-kim@estore.co.jp');
				// $mail->addAddress('f-maeda@estore.co.jp');


				$mail -> isHTML(false);

				$mail->Subject = $yesterday."  Log  分析結果";
				$mail->Body = $this->Message($yesterday);


				$mail->send();
	}


#Create Mail Contents 
	function Message($yesterday)
	{
		$log_result = $this->DB->Logselect($yesterday);
		$log_result = json_decode($log_result);
		$log_result = $log_result->result[0];

		#Declare parameter for mail send message
		$message;

		$message 		.= 	"\rお疲れさまです。ジョンです。  ".$yesterday."   のLog分析結果を送信致します。\r\n\n";
		$message 		.= 	"=============================\r\n\n";
		$message 		.= 	$yesterday."\r\n\n";
		$message 		.= 	"Order Counts : ".$log_result->order_count."\r\n";
		$message 		.= 	"PV : ".$log_result->pv_count."\r\n";
		$message 		.= 	"UU : ".$log_result->uu_count."\r\n";
		$message 		.= 	"CVR : ".$log_result->cvr."\r\r\n\n";
		$message 		.= 	"=============================\r\n";
		$message 		.= 	"以上でございます。ご確認のほどよろしくお願いいたします。";

		
		return $message;
	}
}


function holidayFlag($yesterday)
{
			#2019 japan holiday array
			$japan_holiday 		= 		array('20190916', '20190923', '20191014', '20191103', '20191123', '20191222', '20191223');

			#Non-Business day flag
			$holiday_check		=		false;

			#day for weekend check 
			$day							= 		date("D", strtotime($yesterday));

		
			#Monday = Send Previous friday Log report
			if($day == "Mon")
			{
				$yesterday 	=		date('Ymd', strtotime('-3 day'));
			}

			#Extract weekend day(Non-Business Day)
			if($day == 'Sat' || $day == 'Sun')
			{
				$holiday_check = true;
			}

			#Extract Holiday(Non-Business Day)
			if(in_array($yesterday, $japan_holiday))
			{
				$holiday_check = true;
			}

			if($holiday_check == true)
			{
				$yesterday = holidayFlag(date('Ymd', strtotime($yesterday. ' -1 day' )));
			}

	return $yesterday;
}

#default set
date_default_timezone_set('asia/tokyo');

#previous business day setting
$today 			=		 date('ymd');
$yesterday 	=		date('Ymd', strtotime("$today -1 day"));


$yesterday	=		holidayFlag($yesterday);

#Create new object
$Mail 				=		new SendMail();

#sending mail
$mail_set 		= 		$Mail->Mailto($yesterday);

?>
