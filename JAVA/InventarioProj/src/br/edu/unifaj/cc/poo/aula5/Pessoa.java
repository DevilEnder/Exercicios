package br.edu.unifaj.cc.poo.aula5;

public abstract class Pessoa {
    private String nome;
    private String cpf;
    private String email;

    public Pessoa(String nome, String cpf, String email) {
        this.nome  = nome;
        this.cpf   = cpf;
        this.email = email;
    }

    public abstract void exibirInfo();


    public String getNome()  {
        return nome;
    }
    public String getCpf()   {
        return cpf;
    }
    public String getEmail() {
        return email;
    }
}
