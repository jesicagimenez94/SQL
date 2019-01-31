try:
    # for Python2
    from Tkinter import *   ## notice capitalized T in Tkinter 
except ImportError:
    # for Python3
    from tkinter import *   ## notice lowercase 't' in tkinter here﻿


raiz= Tk()

raiz.config(relief="groove")
raiz.config(bd="45")#tamaño borde
raiz.title("appJesi") #titulo
raiz.config(bg="pink") #configuracion color pantalla

resultado= StringVar()





#miFrame= Frame(raiz, width=1900, height=1000)#tamaño frame
miFrame=Frame(raiz)
miFrame.pack()
miFrame.config(bg="pink") #configuracion color pantalla
pantalla=Entry(miFrame, textvariable=resultado)

cuadroTexto=Entry(miFrame)#ubicamos cuadro de texto dentro del frame
#cuadroTexto.place(x=100, y=100)#ubicacion cuadro de texto
cuadroTexto.grid(row=0, column=1)#ubicacion cuadro de texto

nombreLabel=Label(miFrame, text="Nombre: ").grid(row=0, column=0, sticky="w",pady=10)#ubicacion etiqueta texto derecha=e,izquierda=w,arriba=n,abajo=s


apellidoLabel=Label(miFrame, text="Apellido: ").grid(row=1,column=0, sticky="w",pady=10)
cuadroTexto1=Entry(miFrame).grid(row=1,column=1)

edadLabel=Label(miFrame, text="Edad: ").grid(row=2,column=0, sticky="w",pady=10)
cuadroTexto2=Entry(miFrame).grid(row=2,column=1)

CargoLabel=Label(miFrame, text="Cargo: ").grid(row=3,column=0, sticky="w",pady=10)
cuadroTexto3=Entry(miFrame).grid(row=3,column=1)

def show_entry_fields(): #muestra nombre apellido y edad cargado
  print("First Name: %s\nLast Name: %s" % (cuadroTexto.get(), cuadroTexto1.get()))

#creamos dos botones uno para borrar info  y otro para mostrar por pantalla lo que cargamos en el formulario
Button(miFrame, text='Eliminar', command=raiz.quit).grid(row=4, column=0, sticky=W, pady=5)
Button(miFrame, text='Mostrar', command=show_entry_fields).grid(row=4, column=1, sticky=W, pady=5)

#imagenL=PhotoImage(file="fondoAño2000.gif")
#lblImagen=Label(raiz,image=imagenL).place(x=0,y=0)

raiz.mainloop()