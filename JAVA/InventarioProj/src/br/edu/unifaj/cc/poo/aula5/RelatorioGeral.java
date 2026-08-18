package br.edu.unifaj.cc.poo.aula5;

import java.util.List;

public class RelatorioGeral implements Relatorio {
    private List<ItemPatrimonio> itens;

    public RelatorioGeral(List<ItemPatrimonio> itens) {
        this.itens = itens;
    }

    @Override
    public void gerarRelatorio() {
        System.out.println("\n  === Relatório Geral de Patrimônio ===");
        for (ItemPatrimonio item : itens) {
            item.gerarRelatorio();
        }
        System.out.println("  Total de itens: " + itens.size());
    }
}
