import tkinter as tk
from tkinter import messagebox

janela = tk.Tk()
janela.title("Temporizador")
janela.geometry("400x400")
janela.configure(bg='#2c3e50')

tempo_restante = 0
timer_ativo = False
timer_id = None

def iniciar_timer():
    global tempo_restante, timer_ativo, timer_id
    
    try:
        tempo_input = int(entry_tempo.get())
        if tempo_input <= 0:
            messagebox.showerror("Erro", "Digite um tempo maior que zero!")
            return
    except ValueError:
        messagebox.showerror("Erro", "Digite um número válido!")
        return
    
    tempo_restante = tempo_input
    timer_ativo = True
    btn_iniciar.config(state='disabled')
    btn_parar.config(state='normal')
    entry_tempo.config(state='disabled')
    atualizar_contagem()

def mostrar_tela_preta():
    tela_preta = tk.Toplevel()
    tela_preta.title("")
    tela_preta.configure(bg='black')
    tela_preta.attributes('-fullscreen', True)
    tela_preta.attributes('-topmost', True)
    
    label_mensagem = tk.Label(tela_preta, 
                             text="💀 SISTEMA DESLIGADO 💀", 
                             font=("Arial", 48, "bold"),
                             bg='black',
                             fg='red')
    label_mensagem.pack(expand=True)
    
    label_info = tk.Label(tela_preta, 
                         text="(Pressione Mouse1 para sair)", 
                         font=("Arial", 8),
                         bg='black',
                         fg='white')
    label_info.pack(side=tk.BOTTOM, pady=50)
    
    def fechar_tela(event=None):
        tela_preta.destroy()
        resetar_timer()
    
    tela_preta.bind('<Escape>', fechar_tela)
    tela_preta.bind('<Button-1>', fechar_tela)

def atualizar_contagem():
    global tempo_restante, timer_ativo, timer_id
    
    if timer_ativo and tempo_restante > 0:
        label_contador.config(text=f"{tempo_restante} segundos")
        label_aviso.config(text=f"SEU COMPUTADOR SERÁ DESLIGADO EM {tempo_restante} SEGUNDOS! ")
        tempo_restante -= 1
        timer_id = janela.after(1000, atualizar_contagem)
    elif timer_ativo and tempo_restante == 0:
        label_contador.config(text="Tempo esgotado!")
        label_aviso.config(text="COMPUTADOR DESLIGANDO... ", fg='#e74c3c')
        messagebox.showwarning("ALERTA CRÍTICO", "SEU COMPUTADOR SERÁ DESLIGADO AGORA!\n\n")
        mostrar_tela_preta()

def parar_timer():
    global timer_ativo, timer_id
    
    if timer_id:
        janela.after_cancel(timer_id)
        timer_id = None
    
    timer_ativo = False
    btn_iniciar.config(state='normal')
    btn_parar.config(state='disabled')
    entry_tempo.config(state='normal')
    label_contador.config(text="Temporizador parado")
    label_aviso.config(text="Desligamento cancelado!", fg='#27ae60')

def resetar_timer():
    global timer_ativo, timer_id
    
    if timer_id:
        janela.after_cancel(timer_id)
        timer_id = None
    
    timer_ativo = False
    btn_iniciar.config(state='normal')
    btn_parar.config(state='disabled')
    entry_tempo.config(state='normal')
    label_contador.config(text="")
    label_aviso.config(text="")
    entry_tempo.delete(0, tk.END)

titulo = tk.Label(janela, text="TEMPORIZADOR", 
                 font=("Arial", 24, "bold"),
                 bg='#2c3e50',
                 fg='#ecf0f1')
titulo.pack(pady=20)

frame_input = tk.Frame(janela, bg='#2c3e50')
frame_input.pack(pady=20)

label_instrucao = tk.Label(frame_input, 
                          text="Digite o tempo em segundos:", 
                          font=("Arial", 12),
                          bg='#2c3e50',
                          fg='#ecf0f1')
label_instrucao.pack()

entry_tempo = tk.Entry(frame_input, 
                      font=("Arial", 14),
                      width=15,
                      justify='center')
entry_tempo.pack(pady=10)

frame_botoes = tk.Frame(janela, bg='#2c3e50')
frame_botoes.pack(pady=10)

btn_iniciar = tk.Button(frame_botoes, 
                       text="Iniciar", 
                       command=iniciar_timer,
                       font=("Arial", 12, "bold"),
                       bg='#27ae60',
                       fg='white',
                       width=10,
                       cursor='hand2')
btn_iniciar.pack(side=tk.LEFT, padx=5)

btn_parar = tk.Button(frame_botoes, 
                     text="Parar", 
                     command=parar_timer,
                     font=("Arial", 12, "bold"),
                     bg='#e74c3c',
                     fg='white',
                     width=10,
                     state='disabled',
                     cursor='hand2')
btn_parar.pack(side=tk.LEFT, padx=5)

label_contador = tk.Label(janela, 
                         text="", 
                         font=("Arial", 20, "bold"),
                         bg='#2c3e50',
                         fg='#3498db')
label_contador.pack(pady=20)

label_aviso = tk.Label(janela, 
                      text="", 
                      font=("Arial", 12, "bold"),
                      bg='#2c3e50',
                      fg='#f39c12',
                      wraplength=350)
label_aviso.pack(pady=10)

janela.mainloop()