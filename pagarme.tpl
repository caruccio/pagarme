<html>
<head>
<script src="https://pagar.me/assets/pagarme-v2.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
<form id="payment_form" action="/new" method="POST">
    Número do cartão: <input type="text" id="card_number" value="5445400233334444"/>
    <br/>
    Nome (como escrito no cartão): <input type="text" id="card_holder_name" value="JOHN DOE"/>
    <br/>
    Mês de expiração: <input type="text" id="card_expiration_month" value="01"/>
    <br/>
    Ano de expiração: <input type="text" id="card_expiration_year" value="23"/>
    <br/>
    Código de segurança: <input type="text" id="card_cvv" value="123"/>
    <br/>
    <div id="field_errors">
    </div>
    <br/>
    <input type="submit"></input>
</form>

<script>
$(document).ready(function() { // quando o jQuery estiver carregado...
    PagarMe.encryption_key = "ek_test_y5S0NnXEMirqfLoUe1mYwAzLd3VJKZ";

    var form = $("#payment_form");

    form.submit(function(event) { // quando o form for enviado...
        // inicializa um objeto de cartão de crédito e completa
        // com os dados do form
        var creditCard = new PagarMe.creditCard();
        creditCard.cardHolderName = $("#payment_form #card_holder_name").val();
        creditCard.cardExpirationMonth = $("#payment_form #card_expiration_month").val();
        creditCard.cardExpirationYear = $("#payment_form #card_expiration_year").val();
        creditCard.cardNumber = $("#payment_form #card_number").val();
        creditCard.cardCVV = $("#payment_form #card_cvv").val();

        // pega os erros de validação nos campos do form
        var fieldErrors = creditCard.fieldErrors();

        //Verifica se há erros
        var hasErrors = false;
        for(var field in fieldErrors) { hasErrors = true; break; }

        if(hasErrors) {
            // realiza o tratamento de errors
            alert(fieldErrors);
        } else {
            // se não há erros, gera o card_hash...
            creditCard.generateHash(function(cardHash) {
                // ...coloca-o no form...
                form.append($('<input type="hidden" name="card_hash">').val(cardHash));
                console.log(form.get(0));
                // e envia o form
                form.get(0).submit();
            });
        }

        return false;
    });
});

</script>
</body>
