package br.edu.unifaj.cc.poo.aula5;

public class Cliente extends Pessoa {
    private String telefone;

    public Cliente(String nome, String cpf, String email,
                   String telefone) {
        super(nome, cpf, email);
        this.telefone = telefone;
    }

    @Override
    public void exibirInfo() {
        System.out.println("  Cliente: " + getNome()
            + " | CPF: " + getCpf()
            + " | Telefone: " + telefone
            + " | Email: " + getEmail());
    }

    public String getTelefone() {
        return telefone;
    }

}
