package br.edu.unifaj.cc.poo.aula5;

public abstract class ItemPatrimonio implements Relatorio {
    private double valorAquisicao;

    public ItemPatrimonio(double valorAquisicao) {
        this.valorAquisicao = valorAquisicao;
    }

    public abstract String getTipo();

    @Override
    public void gerarRelatorio() {
        System.out.println("  [" + getTipo() + "]"  +  "| Valor: R$ " + String.format("%.2f", valorAquisicao));
    }

    public double getValorAquisicao()  {
        return valorAquisicao;
    }
}
