import tkinter as tk
from tkinter import ttk, messagebox
import os

janela = tk.Tk()
janela.title("Sistema de Cadastro de Itens")
janela.geometry("600x450")
janela.configure(bg='#2c3e50')

arquivo_dados = "itens.txt"
caixas_texto = []

style = ttk.Style()
style.theme_use('clam')

style.configure('Salvar.TButton', 
                background='#27ae60', 
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Salvar.TButton',
          background=[('active', '#229954')])

style.configure('Exibir.TButton', 
                background='#3498db', 
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Exibir.TButton',
          background=[('active', '#2980b9')])

style.configure('Custom.TEntry',
                fieldbackground='white',
                borderwidth=2,
                relief='flat')

style.configure('Custom.TLabelframe',
                background='#34495e',
                foreground='white',
                borderwidth=2,
                relief='raised')
style.configure('Custom.TLabelframe.Label',
                background='#34495e',
                foreground='white',
                font=('Arial', 11, 'bold'))

def salvar_cliente():
    nome = caixas_texto[0].get()
    quantidade = caixas_texto[1].get().strip()
    
    if not quantidade:
        messagebox.showerror("Erro", "A quantidade é obrigatória!")
        return
    
    linha = f"{nome}|{quantidade}\n"
    
    with open(arquivo_dados, 'a', encoding='utf-8') as arquivo:
        arquivo.write(linha)
    
    messagebox.showinfo("Sucesso", "Item cadastrado!")
    limpar_campos()

def limpar_campos():
    for i in range(len(caixas_texto)):
        caixas_texto[i].delete(0, tk.END)

def exibir_itens():
    if not os.path.exists(arquivo_dados):
        messagebox.showinfo("Itens", "Nenhum item cadastrado ainda!")
        return
    
    with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
        conteudo = arquivo.read()
    
    if not conteudo.strip():
        messagebox.showinfo("Itens", "Nenhum item cadastrado ainda!")
        return
    janela_exibir = tk.Toplevel(janela)
    janela_exibir.title("Itens Cadastrados")
    janela_exibir.geometry("500x400")
    janela_exibir.configure(bg='#2c3e50')
    
    titulo_exibir = tk.Label(janela_exibir, text="ITENS CADASTRADOS", 
                            font=("Arial", 16, "bold"),
                            bg='#2c3e50',
                            fg='#ecf0f1')
    titulo_exibir.pack(pady=15)
    
    frame_texto = tk.Frame(janela_exibir, bg='#2c3e50')
    frame_texto.pack(fill=tk.BOTH, expand=True, padx=20, pady=10)
    
    scrollbar = tk.Scrollbar(frame_texto)
    scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
    
    texto = tk.Text(frame_texto, 
                   yscrollcommand=scrollbar.set,
                   font=("Courier", 10),
                   bg='#ecf0f1',
                   fg='#2c3e50',
                   borderwidth=0,
                   highlightthickness=2,
                   highlightbackground='#34495e',
                   highlightcolor='#3498db',
                   wrap=tk.WORD)
    texto.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
    scrollbar.config(command=texto.yview)
    
    linhas = conteudo.strip().split('\n')
    for linha in linhas:
        if linha.strip():
            partes = linha.split('|')
            if len(partes) >= 2:
                texto.insert(tk.END, f"Nome: {partes[0]}\n")
                texto.insert(tk.END, f"Quantidade: {partes[1]}\n")
                texto.insert(tk.END, "-" * 40 + "\n\n")
    
    texto.config(state='disabled')

titulo = tk.Label(janela, text="CADASTRO DE ITENS", 
                 font=("Arial", 22, "bold"),
                 bg='#2c3e50',
                 fg='#ecf0f1')
titulo.grid(row=0, column=0, columnspan=2, pady=20)

frame_form = ttk.LabelFrame(janela, text="  Dados do Item  ", 
                           padding=20, 
                           style='Custom.TLabelframe')
frame_form.grid(row=1, column=0, columnspan=2, padx=25, pady=15, sticky='ew')

nomes_campos = ["Nome do Item:", "Quantidade:"]
for i, nome in enumerate(nomes_campos):
    label = tk.Label(frame_form, text=nome, 
                    font=("Arial", 11, "bold"),
                    bg='#34495e',
                    fg='#ecf0f1')
    label.grid(row=i, column=0, padx=10, pady=10, sticky='w')
    
    caixa_texto = ttk.Entry(frame_form, width=35, 
                           font=("Arial", 10),
                           style='Custom.TEntry')
    caixa_texto.grid(row=i, column=1, padx=10, pady=10)
    caixas_texto.append(caixa_texto)

frame_botoes = tk.Frame(janela, bg='#2c3e50')
frame_botoes.grid(row=2, column=0, columnspan=2, pady=15)

ttk.Button(frame_botoes, text="Salvar", 
          command=salvar_cliente, 
          width=14,
          style='Salvar.TButton').grid(row=0, column=0, padx=8)

frame_exibir = ttk.LabelFrame(janela, text="  Exibir Itens  ", 
                              padding=15,
                              style='Custom.TLabelframe')
frame_exibir.grid(row=3, column=0, columnspan=2, padx=25, pady=15, sticky='ew')

ttk.Button(frame_exibir, text="Exibir", 
          command=exibir_itens,
          style='Exibir.TButton',
          width=20).pack()

janela.grid_columnconfigure(0, weight=1)

janela.mainloop()