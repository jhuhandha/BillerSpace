<?php /* @var $this Controller */ ?>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="es" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/assets/Bootstrap/css/bootstrap.min.css" media="all" />
	<title>Login</title>
	<style>
		body { 
		  background: url(http://lorempixel.com/output/city-q-c-1233-1199-8.jpg) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		}

		.panel-default {
			opacity: 0.95;
			margin-top:30px;
		}
		.form-group.last { margin-bottom:0px; }
	</style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-7">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login
                </div>
                <div class="panel-body">
                    <div class="form-horizontal" role="form" >
                    	<?php echo $content; ?>
                    </div>
                </div>
                <div class="panel-footer"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
