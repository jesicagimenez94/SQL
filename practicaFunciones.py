#conversor de divisas

def Menu():  #creamos un menu
    print("1.Dolar")
    print("2.Euro")
    print("Cuanto tienes en pesos?")
    global pesos
    pesos=input()
    pesos=float(pesos)
    print("que tipo de cambio desea realizar? ")
    cambio=input() #declaramos una variable global
    cambio=int(cambio)
    
    if(cambio==1):
         dolares()#llamamos a la funcion dolar

    elif(cambio==2):
         euros()#llamamos a la funcion euro


#evaluamos tipo de cambio dentro de una funcion
def dolares():
    print("cual es el precio del dolar?")
    preciod=input()
    preciod=float(preciod)

    global dinero1
    dinero1= pesos/preciod
    print("tienes ",dinero1," $")

def euros():   
    print("cual es el precio del euro?")
    precioe=input()
    precioe=float(precioe)

    global euro
    euro= pesos/precioe
    print("tienes ",euro," $")

# llamando a la funcion menu
Menu()