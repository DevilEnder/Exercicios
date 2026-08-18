package br.edu.unifaj.cc.poo.mobile.LanchoneteApp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pedido {
    private Integer id;
    private String nomeCliente;

    //lanches fixos
    private int cheese;
    private int bacon;
    private int cheddar;
    private int xtudo;

    //lanche faça voce mesmo
    private List<String> ingredientesLanche;

    private String total;
    private String status;
}
