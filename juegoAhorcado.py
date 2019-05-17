import time    #importamos libreria tiempo
nombre=input ("¿como te llamas? ") #creamos variable nombre
print("hola "+nombre," ")
print(" ")
time.sleep(1) #marcamos tiempo en que va tardar en ejecutarse la proxima linea.
print("comienza adivinar!!")
time.sleep(0.5)
palabra="amor"
tupalabra=""
vidas=5

while vidas>0:
   fallas=0
   for letra in palabra:
       if letra in tupalabra:
          print(letra,end="")
       else:
          print("*",end="")
          fallas+=1

   if fallas==0:
     print(" felicidades ganaste")
     break
    
   tuletra=input("ingrese una letra: ") 
   tupalabra+=tuletra

   if tuletra not in palabra:
        vidas-=1
        print("se equivoco")         
        print("tu tienes ",+vidas," vidas")
   if vidas==0:
       print("perdiste")
   else:
        print(" gracias por participar")
