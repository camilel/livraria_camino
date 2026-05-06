<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Pagamento</title>
<link rel="stylesheet" href="pagamento.css">
</head>
<body>
<div class="card">
<h2>Faça seu pagamento</h2>

<input type="radio" name="pagamento" id="credito">
<label for="credito">Crédito</label>
<input type="radio" name="pagamento" id="debito">
<label for="debito">Débito</label>
<input type="radio" name="pagamento" id="pix">
<label for="pix">Pix</label>

<form id="form-credito" class="form-section" method="POST" action="processa_pagamento.php">
    <input type="hidden" name="tipo" value="credito">
    <input type="text" name="numero" placeholder="Número do cartão" required>
    <input type="text" name="nome" placeholder="Nome impresso no cartão" required>
    <input type="text" name="validade" placeholder="Validade (MM/AA)" required>
    <input type="text" name="cvv" placeholder="CVV" required>
    <button type="submit">Pagar</button>
</form>

<form id="form-debito" class="form-section" method="POST" action="processa_pagamento.php">
    <input type="hidden" name="tipo" value="debito">
    <input type="text" name="numero" placeholder="Número do cartão" required>
    <input type="text" name="nome" placeholder="Nome impresso no cartão" required>
    <input type="text" name="validade" placeholder="Validade (MM/AA)" required>
    <input type="text" name="cvv" placeholder="CVV" required>
    <button type="submit">Pagar</button>
</form>

<form id="form-pix" class="form-section" method="POST" action="processa_pagamento.php">
    <input type="hidden" name="tipo" value="pix">
    <textarea readonly>00020101021226850014br.gov.bcb.pix2550qrcode-exemplo-pix-aqui5204000053039865802BR...</textarea>
    <button type="submit">Confirmar pagamento</button>
</form>

</div>
</body>
</html>