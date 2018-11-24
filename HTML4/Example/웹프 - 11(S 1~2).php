<html> 
<head> 
	<title> PHP part2 Exercises </title> 
</head> 
<body>
	<?php
		//Ex1
		$str_var = 'string variable';
		$str_single = 'Using single quotation: $str_var';
		$str_double = "Using double quotation: $str_var";
		echo '$str_single='.$str_single.'<br>';
		echo '$str_double='.$str_double.'<br>';
		
		//Ex2
		$str1 = "Good"." Morning";
		echo $str1.'<br>';
		echo strlen($str1).'<br>';
		
		//Ex3
		$kor = 80;
		$eng = 70;
		$math = 90;
		$sum = $kor + $eng + $math;
		$average = $sum / 3;
		echo $sum.'<br>';
		echo $average,' ',(int)$average,'<br>';
		
		//Ex4
		$ex_4 = array(89,93,75,89,83);
		
//		foreach($ex_4 as $element)
		$sum = $ex_4[0]+$ex_4[1]+$ex_4[2]+$ex_4[3]+$ex_4[4];	
		
		$average = $sum / 5;
		
		echo 'sum = '.$sum.'<br>';
		echo 'average = '.$average.'<br>';
		
		//Ex5
		$student = array(	"student1" => array(79,90,60,45,80),
											"student2" => array(80,90,90,99,89),
											"student3" => array(45,85,90,99,84) );
		
		foreach($student as $x) {
			$sum = 0;
			foreach($x as $y)
				$sum += $y;
			echo "sum = $sum, average = ".($sum/count($x))."<br>";
		}
                
                echo "$temp <br>";
                
                
	?>

</body>
</html>
