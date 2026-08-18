package br.edu.unifaj.cc.poo.mobile.LanchoneteApp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ingrediente {
    private Integer id;
    private String nome;
    private int quantidade;
    private double preco;
}
