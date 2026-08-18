package br.edu.unifaj.cc.poo.mobile.LanchoneteApp;

import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/lanchonete")
public class LanchoneteController {

    private List<Pedido> pedidos = new ArrayList<>();
    private List<Ingrediente> ingredientes = new ArrayList<>();
    private int proximoIdPedido      = 1;
    private int proximoIdIngrediente = 1;



    @GetMapping("/ingrediente")
    public List<Ingrediente> getIngredientes() {
        return ingredientes;
    }


    @PostMapping("/ingrediente")
    public Ingrediente postIngrediente(@RequestBody Ingrediente ingrediente) {
        ingrediente.setId(proximoIdIngrediente++);
        ingredientes.add(ingrediente);
        System.out.println("Ingrediente cadastrado: " + ingrediente);
        return ingrediente;
    }

    @PutMapping("/ingrediente/{id}")
    public Ingrediente putIngrediente(@PathVariable Integer id, @RequestBody Ingrediente dados) {
        for (Ingrediente ing : ingredientes) {
            if (ing.getId().equals(id)) {
                //esquecer de colocar nome no put da nisso, trabalho
                if (dados.getNome() != null && !dados.getNome().isEmpty()) {
                    ing.setNome(dados.getNome());
                }
                ing.setQuantidade(dados.getQuantidade());
                return ing;
            }
        }
        return null;
    }


    @DeleteMapping("/ingrediente/{id}")
    public Ingrediente deleteIngrediente(@PathVariable Integer id) {
        for (Ingrediente ing : ingredientes) {
            if (ing.getId().equals(id)) {
                ingredientes.remove(ing);
                return ing;
            }
        }
        return null;
    }

    //Pedidos

    @GetMapping("/pedido")
    public List<Pedido> getPedidos() {
        return pedidos;
    }

    @GetMapping("/pedido/{id}")
    public Pedido getPedido(@PathVariable Integer id) {
        for (Pedido p : pedidos) {
            if (p.getId().equals(id))
                return p;
        }
        return null;
    }

    @PostMapping("/pedido")
    public Pedido postPedido(@RequestBody Pedido pedido) {
        pedido.setId(proximoIdPedido++);
        pedido.setStatus("PENDENTE");

        if (pedido.getIngredientesLanche() != null) {
            for (String nomeIng : pedido.getIngredientesLanche()) {
                for (Ingrediente ing : ingredientes) {
                    if (ing.getNome() != null && ing.getNome().equalsIgnoreCase(nomeIng) && ing.getQuantidade() > 0) {
                        ing.setQuantidade(ing.getQuantidade() - 1);
                        break;
                    }
                }
            }
        }

        pedidos.add(pedido);
        System.out.println("Novo pedido: " + pedido);
        return pedido;
    }

    @PutMapping("/pedido/{id}")
    public Pedido putPedido(@PathVariable Integer id, @RequestBody Pedido dadosPedido) {
        for (Pedido p : pedidos) {
            if (p.getId().equals(id)) {
                p.setStatus(dadosPedido.getStatus());
                return p;
            }
        }
        return null;
    }

    @DeleteMapping("/pedido/{id}")
    public Pedido deletePedido(@PathVariable Integer id) {
        for (Pedido p : pedidos) {
            if (p.getId().equals(id)) {
                pedidos.remove(p);
                return p;
            }
        }
        return null;
    }

}
