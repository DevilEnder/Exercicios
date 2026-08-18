package br.edu.unifaj.cc.poo.aula5;

public class Movel extends ItemPatrimonio {
    private String codigo;
    private String descricao;
    private String material;

    public Movel(double valorAquisicao,String codigo, String descricao, String material) {
        super(valorAquisicao);
        this.codigo    = codigo;
        this.descricao = descricao;
        this.material  = material;
    }

    @Override
    public String getTipo() {
        return "Movel"; }

    @Override
    public void gerarRelatorio() {
        super.gerarRelatorio();
        System.out.println(" Código: " + codigo
            + " | Descrição: " + descricao
            + " | Material: " + material);
    }

    public String getCodigo()    { return codigo; }
    public String getDescricao() { return descricao; }
    public String getMaterial()  { return material; }
}
