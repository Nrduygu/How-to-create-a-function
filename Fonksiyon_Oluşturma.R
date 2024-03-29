###  GitHub ile Fonksiyon Olu�turma  ### 

# �ncelikle iki de�i�kenimizin oldu�unu d���nelim. Bu de�i�kenlere ili�kin regersyon modeli kurmak ve regresyon modelinin ��kt�s�n� almak istiyorum diyelim.
# Regresyon modeli i�in bir fonksiyon yazabilirz. B�ylece bu fonksiyonun i�eri�ine ne eklersek ekleyelim regresyona verilen isim yaz�ld���nda ��kt� dosyas� kar��m�za gelir. 
# �ncelikle regresyon aili�kin fonksiyon olu�tururken bilmeyenler i�in "lmtest" paketi aktif hale getirilmemi� olabilir. Bu nednele fonksiyonun i�erisine
# if d�ng�s� olu�turarak "lmtest" paketi aktif de�il ise aktif et komutunu vermi� oluyoruz. Benzer �ekilde otokorelasyon varsay�m�n� test etmek i�in de "dwtest"i de ekleyerek
# i�lemlerimizi otomatik hale getirebiliriz. 

x1= c( 1,4,5,6,7,8,8)
y= c(2,5,8,7,4,6,9)

model_f = function(y,x1){
  regresyon = lm(y~x1)
  model = summary(regresyon)
  model
  
  if(!require(lmtest)){install.packages("lmtest")
    require(lmtest)
  }
  t_1 = dwtest(regresyon)
  sonuc = list(model, t_1)
  return(sonuc)
}
model_f(y,x1)

# ��kt� sonu�lar�nda liste halinde olu�turdu�um sonu�lar�n vermi� oldu�um herhangi bir isimle g�r�lmesini istiyorsam ise �u �ekilde g�sterebilirim;

x1= c( 1,4,5,6,7,8,8)
y= c(2,5,8,7,4,6,9)

model_f = function(y,x1){
  regresyon = lm(y~x1)
  model = summary(regresyon)
  model
  if(!require(lmtest)){install.packages("lmtest")
    require(lmtest) }
  t_1 = dwtest(regresyon)
  sonuc = list("regresyon" = model, "Durbin" = t_1)
  return(sonuc) }
model_f(y,x1)

# b�ylelikle regresyon ��kt�s�nda otokorelasyon test sonucunuda g�rm�� oluruz. Bu �ekilde de�i�enj varyans, normallik tetslerini de ekleyebiliriz. 