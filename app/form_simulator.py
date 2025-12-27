from flask import Flask, request, render_template_string

app = Flask(__name__)

FORM_HTML = '''
<h2>Cadastro de Candidato</h2>
<form method="POST">
  <input name="nome" placeholder="Nome" required><br><br>
  <input name="email" placeholder="E-mail" required><br><br>
  <input name="cargo" placeholder="Cargo Pretendido"><br><br>
  <button type="submit">Enviar</button>
</form>
<p>{{ mensagem or "" }}</p>
'''

@app.route("/", methods=["GET", "POST"])
def home():
    msg = ""
    if request.method == "POST":
        nome = request.form.get("nome")
        email = request.form.get("email")
        cargo = request.form.get("cargo")
        msg = f"Candidato '{nome}' cadastrado com sucesso!"
        print(f"[LOG] Recebido: {nome} | {email} | {cargo}")
    return render_template_string(FORM_HTML, mensagem=msg)

if __name__ == "__main__":
    app.run(port=5000, debug=True)