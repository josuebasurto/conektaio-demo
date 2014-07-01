<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="com.jb.site._Default" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Conekta.io Demo</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <!-- Optional theme -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <!-- Josh Theme -->
    <link href="css/narrow.css" rel="stylesheet" type="text/css" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container">
        <div class="header">
            <%--<ul class="nav nav-pills pull-right">
          <li class="active"><a href="#">Conekta.io Demo</a></li>
          <li><a href="#">About</a></li>
          <li><a href="#">Contact</a></li>
        </ul>--%>
            <h3 class="text-muted">Conekta.io Demo</h3>
        </div>
        <div class="jumbotron">
            <h1>Conekta.io Demo</h1>
            <p class="lead">by <a href="http://josuebasurto.com">Josue Basurto</a>.</p>
        </div>
        <div class="row marketing">
            <h4>Registrate!</h4>
            <form action="" method="POST" id="card-form">
            <span class="card-errors"></span>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tarjetahabiente</label>
                <div class="col-sm-10"><input type="text" class="form-control" placeholder="Tarjetahabiente" size="20" data-conekta="card[name]" /></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Tarjeta</label>
                <div class="col-sm-10"><input type="text" class="form-control" placeholder="Numero de Tarjeta" size="20" data-conekta="card[number]" /></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">CVC</label>
                <div class="col-sm-10"><input type="text" class="form-control" placeholder="CVC" size="4" data-conekta="card[cvc]"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Mes</label>
                <div class="col-sm-10"><input type="text" class="form-control" placeholder="MM" size="2" data-conekta="card[exp_month]"/></div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">Año</label>
                <div class="col-sm-10"><input type="text" class="form-control" placeholder="AAAA" size="4" data-conekta="card[exp_year]"/></div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit">Suscribirse</button>
                </div>
            </div>
        </form>
    </div>
    <div class="footer">
        <p>Footer stuff &copy; Company 2014</p>
    </div>
    </div>
    <!-- /container -->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Latest compiled and minified JavaScript -->
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <!-- Conekta.io -->
    <script type="text/javascript" src="https://conektaapi.s3.amazonaws.com/v0.3.0/js/conekta.js"></script>
    
    <script type="text/javascript">

        // Conekta Public Key
        Conekta.setPublishableKey('<%= PublicKey %>');

        // ...
        jQuery(function($) {
            $("#card-form").submit(function(event) {
                var $form;
                $form = $(this);


                /* Previene hacer submit más de una vez */

                $form.find("button").prop("disabled", true);
                Conekta.token.create($form, conektaSuccessResponseHandler, conektaErrorResponseHandler);

                /* Previene que la información de la forma sea enviada al servidor */

                return false;
            });
        });

        var conektaSuccessResponseHandler;
        conektaSuccessResponseHandler = function(token) {
            var $form;
            $form = $("#card-form");


            /* Inserta el token_id en la forma para que se envíe al servidor */

            $form.append($("<input type=\"hidden\" name=\"conektaTokenId\" />").val(token.id));


            /* and submit */

            $form.get(0).submit();
        };

        var conektaErrorResponseHandler;
        conektaErrorResponseHandler = function(response) {
            var $form;
            $form = $("#card-form");


            /* Muestra los errores en la forma */

            $form.find(".card-errors").text(response.message);
            $form.find("button").prop("disabled", false);
        };
</script>
</body>
</html>
