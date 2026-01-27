def pozitif_bolen_sayisi(a):
    sayac = 0
    for i in range(1, a + 1):
        if a % i == 0:
            sayac += 1
    return sayac

def asal_mi(a):
    if a<2:
        return False
    for i in range(2, a):
        if a % i == 0:
            return False
    return True

def rakam_carpimi(a):
    carpim = 1 
    for i in str(a):
        carpim *= int(i)
    return carpim

def asal_carpanlari_rakamlari_carpimi(a):
    carpim = 1
    kalan = a 

    bolen = 2 
    while kalan > 1:
        if asal_mi(bolen) and kalan % bolen == 0:
            while kalan % bolen == 0:
                carpim *= rakam_carpimi(bolen)
                kalan /= bolen
        bolen += 1
    return carpim



def matbil_sayisi(a):
    if asal_mi(a):
        return False 
    if pozitif_bolen_sayisi(a) == asal_carpanlari_rakamlari_carpimi(a):
        return True 
    return False 


def soru(basamak_sayisi):
    for i in range(10**(basamak_sayisi -1), 10**basamak_sayisi):
        if matbil_sayisi(i):
            print(i)




    
    




