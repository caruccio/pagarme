Instruções para testar a API do Pagar.me
----------------------------------------

1 - Inicie o servidor

    $ export API_KEY=SUA_API_KEY
    $ ./pagarme.py

2 - Acesse a URL `http://127.0.0.1:8000/` e preencha os dados

3 - Acesse `http://127.0.0.1:8000/pay?card_id=$id`, substituindo `$id` pelo `id` retornado.
