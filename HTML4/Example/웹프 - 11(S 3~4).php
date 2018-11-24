<html> 
<head> 
	<title> PHP part3 Exercises </title> 
	<?php
		//Ex1
		$age = 18;
		if ($age>=20)
			echo "Age($age): Obtained adult certificate! <br>";
		else
			echo "Age($age): You still have to wait ".(20-$age)." years! <br>";
		
		//Ex2
		$score = -1;
                echo "Score($score): ";
		if ($score>=80)
			echo "great";
		else if ($score>=60)
			echo "good";
		else if ($score>=0)
			echo "fail";
		else 
			echo "not available";
		echo "<br>";
		
		$score = 45;	
                echo "Score($score): ";
                switch(true) {
			case ($score>=80):
				echo "great";	
				break;
			case ($score>=60):
				echo "good";
				break;
			case ($score>=0):
				echo "fail";
				break;
			default:
				echo "not available";
		}
	?>

</head> 
<body>
</body>
</html>
