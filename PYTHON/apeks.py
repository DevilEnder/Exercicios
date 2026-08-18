import tkinter as tk
from tkinter import ttk, messagebox
import re
import os

janela = tk.Tk()
janela.title("Sistema de Cadastro de Clientes")
janela.geometry("600x650")
janela.configure(bg='#2c3e50')

arquivo_dados = "clientes.txt"
codigo_editando = None

caixas_texto = []
lista_clientes = None
entry_pesquisa = None

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

style.configure('Limpar.TButton',
                background='#95a5a6',
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Limpar.TButton',
          background=[('active', '#7f8c8d')])

style.configure('Buscar.TButton',
                background='#3498db',
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Buscar.TButton',
          background=[('active', '#2980b9')])

style.configure('Editar.TButton',
                background='#f39c12',
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Editar.TButton',
          background=[('active', '#e67e22')])

style.configure('Excluir.TButton',
                background='#e74c3c',
                foreground='white',
                font=('Arial', 10, 'bold'),
                borderwidth=0,
                focuscolor='none')
style.map('Excluir.TButton',
          background=[('active', '#c0392b')])

# Estilo dos Entry
style.configure('Custom.TEntry',
                fieldbackground='white',
                borderwidth=2,
                relief='flat')

# Estilo dos LabelFrame
style.configure('Custom.TLabelframe',
                background='#34495e',
                foreground='white',
                borderwidth=2,
                relief='raised')
style.configure('Custom.TLabelframe.Label',
                background='#34495e',
                foreground='white',
                font=('Arial', 11, 'bold'))

def gerar_proximo_codigo():
    proximo = 1
    if os.path.exists(arquivo_dados):
        with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
            linhas = arquivo.readlines()
            if linhas:
                ultimo_codigo = linhas[-1].split('|')[0].strip()
                proximo = int(ultimo_codigo) + 1
    
    caixas_texto[0].config(state='normal')
    caixas_texto[0].delete(0, tk.END)
    caixas_texto[0].insert(0, str(proximo))
    caixas_texto[0].config(state='readonly')

def validar_email(email):
    padrao = r'^[a-z0-9]+[\._]?[a-z0-9]+@[a-z0-9]+[\._]?[a-z0-9]+\.[a-z]{2,}$'
    return re.fullmatch(padrao, email, re.IGNORECASE) is not None

def salvar_cliente():
    global codigo_editando
    
    codigo = caixas_texto[0].get()
    nome = caixas_texto[1].get().strip()
    email = caixas_texto[2].get().strip()
    senha = caixas_texto[3].get().strip()
    
    if not nome:
        messagebox.showerror("Erro", "O nome é obrigatório!")
        return
    
    if not email or not validar_email(email):
        messagebox.showerror("Erro", "E-mail inválido!")
        return
    
    if not senha:
        messagebox.showerror("Erro", "A senha é obrigatória!")
        return
    
    linha = f"{codigo}|{nome}|{email}|{senha}\n"
    
    if codigo_editando:
        linhas = []
        with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
            linhas = arquivo.readlines()
        
        with open(arquivo_dados, 'w', encoding='utf-8') as arquivo:
            for l in linhas:
                if l.split('|')[0].strip() == codigo:
                    arquivo.write(linha)
                else:
                    arquivo.write(l)
        
        messagebox.showinfo("Sucesso", "Cliente atualizado!")
        codigo_editando = None
    else:
        with open(arquivo_dados, 'a', encoding='utf-8') as arquivo:
            arquivo.write(linha)
        messagebox.showinfo("Sucesso", "Cliente cadastrado!")
    
    limpar_campos()
    atualizar_lista()

def limpar_campos():
    global codigo_editando
    for i in range(1, len(caixas_texto)):
        caixas_texto[i].delete(0, tk.END)
    codigo_editando = None
    gerar_proximo_codigo()

def atualizar_lista(filtro=""):
    lista_clientes.delete(0, tk.END)
    
    if not os.path.exists(arquivo_dados):
        return
    
    with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
        linhas = arquivo.readlines()
    
    for linha in linhas:
        linha_limpa = linha.strip()
        if not linha_limpa:
            continue
            
        if filtro == "" or filtro.lower() in linha_limpa.lower():
            partes = linha_limpa.split('|')
            if len(partes) >= 3:
                codigo = partes[0]
                nome = partes[1]
                email = partes[2]
                texto = f"{codigo:>4} | {nome:<20} | {email:<25}"
                lista_clientes.insert(tk.END, texto)

def pesquisar_cliente():
    termo = entry_pesquisa.get().strip()
    atualizar_lista(termo)

def editar_cliente():
    global codigo_editando
    
    if not lista_clientes.curselection():
        messagebox.showwarning("Aviso", "Selecione um cliente!")
        return
    
    indice = lista_clientes.curselection()[0]
    texto = lista_clientes.get(indice)
    codigo = texto.split('|')[0].strip()
    
    with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
        linhas = arquivo.readlines()
    
    for linha in linhas:
        if linha.split('|')[0].strip() == codigo:
            partes = linha.strip().split('|')
            
            caixas_texto[0].config(state='normal')
            caixas_texto[0].delete(0, tk.END)
            caixas_texto[0].insert(0, partes[0])
            caixas_texto[0].config(state='readonly')
            
            caixas_texto[1].delete(0, tk.END)
            caixas_texto[1].insert(0, partes[1])
            
            caixas_texto[2].delete(0, tk.END)
            caixas_texto[2].insert(0, partes[2])
            
            caixas_texto[3].delete(0, tk.END)
            caixas_texto[3].insert(0, partes[3] if len(partes) > 3 else "")
            
            codigo_editando = codigo
            break

def excluir_cliente():
    if not lista_clientes.curselection():
        messagebox.showwarning("Aviso", "Selecione um cliente!")
        return
    
    if not messagebox.askyesno("Confirmar", "Deseja excluir este cliente?"):
        return
    
    indice = lista_clientes.curselection()[0]
    texto = lista_clientes.get(indice)
    codigo = texto.split('|')[0].strip()
    
    with open(arquivo_dados, 'r', encoding='utf-8') as arquivo:
        linhas = arquivo.readlines()
    
    with open(arquivo_dados, 'w', encoding='utf-8') as arquivo:
        for linha in linhas:
            if linha.split('|')[0].strip() != codigo:
                arquivo.write(linha)
    
    messagebox.showinfo("Sucesso", "Cliente excluído!")
    atualizar_lista()
    limpar_campos()

# Interface
titulo = tk.Label(janela, text="CADASTRO DE CLIENTES", 
                 font=("Arial", 22, "bold"),
                 bg='#2c3e50',
                 fg='#ecf0f1')
titulo.grid(row=0, column=0, columnspan=2, pady=20)

frame_form = ttk.LabelFrame(janela, text="  Dados do Cliente  ", 
                           padding=20, 
                           style='Custom.TLabelframe')
frame_form.grid(row=1, column=0, columnspan=2, padx=25, pady=15, sticky='ew')

nomes_campos = ["Código:", "Nome:", "E-mail:", "Senha:"]
for i, nome in enumerate(nomes_campos):
    label = tk.Label(frame_form, text=nome, 
                    font=("Arial", 11, "bold"),
                    bg='#34495e',
                    fg='#ecf0f1')
    label.grid(row=i, column=0, padx=10, pady=10, sticky='w')
    
    caixa_texto = ttk.Entry(frame_form, width=35, 
                           show="*" if i == 3 else "",
                           font=("Arial", 10),
                           style='Custom.TEntry')
    caixa_texto.grid(row=i, column=1, padx=10, pady=10)
    caixas_texto.append(caixa_texto)

caixas_texto[0].config(state='readonly')

frame_botoes = tk.Frame(janela, bg='#2c3e50')
frame_botoes.grid(row=2, column=0, columnspan=2, pady=15)

ttk.Button(frame_botoes, text="Salvar", 
          command=salvar_cliente, 
          width=14,
          style='Salvar.TButton').grid(row=0, column=0, padx=8)
ttk.Button(frame_botoes, text="Limpar", 
          command=limpar_campos, 
          width=14,
          style='Limpar.TButton').grid(row=0, column=1, padx=8)

frame_pesquisa = ttk.LabelFrame(janela, text="  Pesquisar Cliente  ", 
                               padding=15,
                               style='Custom.TLabelframe')
frame_pesquisa.grid(row=3, column=0, columnspan=2, padx=25, pady=15, sticky='ew')

entry_pesquisa = ttk.Entry(frame_pesquisa, width=35, 
                          font=("Arial", 10),
                          style='Custom.TEntry')
entry_pesquisa.grid(row=0, column=0, padx=5)

ttk.Button(frame_pesquisa, text="Buscar", 
          command=pesquisar_cliente,
          style='Buscar.TButton',
          width=12).grid(row=0, column=1, padx=5)

frame_lista = tk.Frame(janela, bg='#2c3e50')
frame_lista.grid(row=4, column=0, columnspan=2, padx=25, pady=10, sticky='nsew')

scrollbar = tk.Scrollbar(frame_lista)
scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

lista_clientes = tk.Listbox(frame_lista, height=10, 
                           yscrollcommand=scrollbar.set, 
                           font=("Courier", 10),
                           bg='#ecf0f1',
                           fg='#2c3e50',
                           selectbackground='#3498db',
                           selectforeground='white',
                           borderwidth=0,
                           highlightthickness=2,
                           highlightbackground='#34495e',
                           highlightcolor='#3498db')
lista_clientes.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)
scrollbar.config(command=lista_clientes.yview)

lista_clientes.bind('<Double-Button-1>', lambda e: editar_cliente())

frame_acoes = tk.Frame(janela, bg='#2c3e50')
frame_acoes.grid(row=5, column=0, columnspan=2, pady=15)

ttk.Button(frame_acoes, text="Editar", 
          command=editar_cliente, 
          width=16,
          style='Editar.TButton').grid(row=0, column=0, padx=8)
ttk.Button(frame_acoes, text="Excluir", 
          command=excluir_cliente, 
          width=16,
          style='Excluir.TButton').grid(row=0, column=1, padx=8)

janela.grid_rowconfigure(4, weight=1)
janela.grid_columnconfigure(0, weight=1)

gerar_proximo_codigo()
atualizar_lista()

janela.mainloop()