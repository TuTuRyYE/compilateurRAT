Caml1999M025����            'code.ml����  ,�  �  d  ������1ocaml.ppx.context��&_none_@@ �A����������)tool_name���-ppxlib_driver@@@����,include_dirs����"[]@@@����)load_path!����
%@%@@����,open_modules*����.@.@@����+for_package3����$None8@8@@����%debug=����%falseB@B@@����+use_threadsG����
K@K@@����-use_vmthreadsP����T@T@@����/recursive_typesY����]@]@@����)principalb����%f@f@@����3transparent_modulesk����.o@o@@����-unboxed_typest����7x@x@@����-unsafe_string}����@�@�@@����'cookies�����o�@�@@@@�@@@�@�����@������"()��'code.mlBxx�Bxx@@��Bxx�Bxx@@@��������5Expect_test_collector,Current_file#set��Bxx�Bxx@��Bxx�Bxx@@@���1absolute_filename���@��Bxx� Bxx@@@@��"Bxx�#Bxx@@@@��%Bxx�&Bxx@@��(Bxx�)Bxx@���@������5��4Bxx�5Bxx@@��7Bxx�8Bxx@@@��������3Ppx_inline_test_lib'Runtime5set_lib_and_partition��EBxx�FBxx@��HBxx�IBxx@@@��@���#rat@��QBxx�RBxx@@@��@��� @��ZBxx�[Bxx@@@@��]Bxx�^Bxx@@@@��`Bxx�aBxx@@��cBxx�dBxx@���@�����,getEtiquette��oBx|�pBx H@��rBx|�sBx H@@@��@�����#num��}C L R�~C L U@���C L R��C L U@@@������#ref���C L X��C L [@���C L X��C L [@@@��@���!0@���C L \��C L ]@@@@���C L X��C L ]@@@@���C L N��C L ]@@��@@����"()���D a g��D a i@@���D a g��D a i@@@�  ������":=���E m u��E m w@���E m u��E m w@@@��@����#num���E m q��E m t@���E m q��E m t@@@��@������!+���E m ~��E m @���E m ~��E m @@@��@������!!���E m y��E m z@���E m y��E m z@@@��@����#num���E m z��E m }@���E m z��E m }@@@@���E m x��E m ~@@@��@���!1@���E m ��E m �@@@@���E m x� E m �@@@@��E m q�E m �@@@������!^��F � ��F � �@��F � ��F � �@@@��@���%label@��F � ��F � �@@@��@������-string_of_int��$F � ��%F � �@��'F � ��(F � �@@@��@������S��2F � ��3F � �@��5F � ��6F � �@@@��@����#num��?F � ��@F � �@��BF � ��CF � �@@@@��EF � ��FF � �@@@@��HF � ��IF � �@@@@��KF � ��LF � �@@@��NE m q�OF � �@@@��QD a c�RF � �@@@��TC L N�UF � �@@@@��WBxx�XF � �@@��ZBxx�[F � �@���@�����$pgcd��fH � ��gH � �@��iH � ��jH � �@@@���	�pgcd
LOADL 0
LOAD (1) -2[LB]
LOAD (1) -1[LB]
boucle
LOAD (1) 5[LB]
JUMPIF (0) fin
LOAD (1) 4[LB]
LOAD (1) 5 [LB]
SUBR IMod
STORE (1) 3[LB]
LOAD (1) 5[LB]
STORE (1) 4[LB]
LOAD (1) 3[LB]
STORE(1) 5[LB]
JUMP boucle
fin
LOAD (1) 4[LB]
RETURN (1) 2

@��pI � ��q[��@@@@��sH � ��t[��@@��vH � ��w[��@���@�����$norm���]����]��@���]����]��@@@���	�norm
LOAD (1) -2[LB]
LOAD (1) -1[LB]
CALL (LB) pgcd
LOAD (1) -2[LB]
LOAD (1) 3[LB]
SUBR IDiv
LOAD (1) -1[LB]
LOAD (1) 3[LB]
SUBR IDiv
RETURN (2) 2

@���^����hBS@@@@���]����hBS@@���]����hBS@���@�����$rout���jUY��jU]@���jUY��jU]@@@���	�ROut
LOADL '['
SUBR COut
LOAD (1) -2[LB]
SUBR IOut
LOADL '/'
SUBR COut
LOAD (1) -1[LB]
SUBR IOut
LOADL ']'
SUBR COut
POP (0) 1
RETURN (0) 2

@���k``��w��@@@@���jUU��w��@@���jUU��w��@���@�����$radd���y����y��@���y����y��@@@���	�RAdd
LOAD (1) -4[LB]
LOAD (1) -1[LB]
SUBR IMul
LOAD (1) -2[LB]
LOAD (1) -3[LB]
SUBR IMul
SUBR IAdd
LOAD (1) -3[LB]
LOAD (1) -1[LB]
SUBR IMul
CALL (ST) norm
POP (2) 4
RETURN (2) 4

@���z���� G��@@@@���y���� G��@@���y���� G��@���@�����$rmul��� I���� I��@��� I���� I��@@@���	�RMul
LOAD (1) -4[LB]
LOAD (1) -2[LB]
SUBR IMul
LOAD (1) -3[LB]
LOAD (1) -1[LB]
SUBR IMul
CALL (ST) norm
POP (2) 4
RETURN (2) 4

@��� J���� S6G@@@@��� I���� S6G@@��� I���� S6G@���@�����$sout��� VJN�� VJR@��� VJN�� VJR@@@���
  �SOut ; affiche une chaîne de caracteres dont l'adresse dans le tas est en -1[LB]
  LOAD (1) -1[LB] ; adresse dans le tas de la chaine en sommet de pile
  LOADI (1) ; taille de la chaine en 3[LB]
  LOADL 0 ; indice de parcours de la chaine en 4[LB]
  bouclePrintSout ; etiquette de boucle de l'affichage 
  LOAD (1) 3[LB] 
  LOAD (1) 4[LB]
  SUBR INeg
  JUMPIF (0) finBouclePrintSout
  LOAD (1) -1[LB] ; adresse de la chaine en sommet de pile
  LOAD (1) 4[LB] ; indice pour le décalage
  LOADL 1 ; +1 parce qu'il faut compter le champ taille
  SUBR IAdd
  SUBR IAdd ; adresse du caractère a afficher 
  LOADI (1) ; caractere a afficher
  SUBR COut ; adresse du caractere a afficher 
  LOAD (1) 4[LB] ; début de l'incrémentation de l'indice de boucle
  LOADL 1
  SUBR IAdd
  STORE (1) 4[LB] ; fin de l'incrementation de l'indice de boucle
  JUMP bouclePrintSout
  finBouclePrintSout
  RETURN (0) 1

@��� WVX�� m��@@@@��� VJJ�  m��@@�� VJJ� m��@���@�����$scat�� o��� o��@�� o��� o��@@@���
  �SCat ; concatene deux chaines de caracteres passées en paramètre -2[LB] adresse de la premiere chaine -1[LB] adresse de la seconde chaine
    LOAD (1) -2[LB]
    LOADI (1) ; taille de c1
    LOAD (1) -1[LB]
    LOADI (1) ; taille de c2
    SUBR IAdd ; taille de la nouvelle chaine en 3[LB]
    LOAD (1) -1[ST] ; duplication de la taille de la chaine
    LOADL 1
    SUBR IAdd
    SUBR MAlloc ; taille réservée dans le tas et adresse de la chaine en 4[LB]
    LOAD (1) -2[LB]
    LOADI (1) ; taille de c1
    LOAD (1) -1[LB]
    LOADI (1) ; taille de c2
    SUBR IAdd ; taille de la chaine
    LOAD (1) 4[LB] ; adresse où stocker la taille
    STOREI (1)
    LOAD (1) -2[LB]
    LOADI (1) ; taille de c1 en 5[LB]
    LOADL 0 ; indice de parcours en 6[LB] 
    copiec1
    LOAD (1) 5[LB]
    LOAD (1) 6[LB]
    SUBR INeg ; test si on a fini la boucle
    JUMPIF (0) fincopiec1
    LOAD (1) -2[LB]
    LOAD (1) 6[LB]
    LOADL 1
    SUBR IAdd
    SUBR IAdd ; adresse du caractère à copier
    LOADI (1) ; caractère à copier
    LOAD (1) 4[LB]
    LOADL 1
    LOAD (1) 6[LB]
    SUBR IAdd
    SUBR IAdd ; adresse où copier le caratère
    STOREI (1)
    LOAD (1) 6[LB]
    LOADL 1
    SUBR IAdd
    STORE (1)  6[LB] ; incrément de l'indice de boucle
    JUMP copiec1
    fincopiec1
    LOAD (1) -1[LB]
    LOADI (1) ; taille de c2
    STORE (1) 5[LB] ; taille de c2 en 5[LB]
    LOADL 0
    STORE (1) 6[LB] ; indice de parcours en 6[LB]
    copiec2
    LOAD (1) 5[LB]
    LOAD (1) 6[LB]
    SUBR INeg ; test si on a fini la boucle
    JUMPIF (0) fincopiec2
    LOAD (1) -1[LB]
    LOAD (1) 6[LB]
    LOADL 1
    SUBR IAdd
    SUBR IAdd ; adresse du caractère à copier
    LOADI (1) ; caractère à copier
    LOAD (1) 4[LB]
    LOADL 1 ; décalage pour la taille
    LOAD (1) -2[LB]
    LOADI (1) ; décalage pour la taille de c1
    LOAD (1) 6[LB] ; décalage pour l'indice
    SUBR IAdd
    SUBR IAdd
    SUBR IAdd ; adresse où copier le caractère
    STOREI (1)
    LOAD (1) 6[LB]
    LOADL 1
    SUBR IAdd
    STORE (1)  6[LB] ; incrément de l'indice de boucle
    JUMP copiec2
    fincopiec2
    LOAD (1) 4[LB] ; on charge le résultat - ie l'adresse
    RETURN (1) 2; dépile les deux adresses, laisse en sommet de pile l'adresse de la chaine concatenee 

 @�� p��� �q�@@@@�� o��� �q�@@�� o��� �q�@���@�����$ssub��* ����+ ���@��- ����. ���@@@���
  �SSub ; -3[LB] adresse de la chaine - -2[LB] indice de départ - -1[LB] indice de fin
    LOAD (1) -1[LB]
    LOAD (1) -2[LB]
    SUBR INeg 
    LOADL 1
    SUBR IAdd ; taille de la chaine en 3[LB]
    LOAD (1) -1[ST]
    LOADL 1 
    SUBR IAdd
    SUBR MAlloc ; réservation de l'espace + adresse de la nouvelle chaine en 4[LB]
    LOAD (1) 3[LB]
    LOAD (1) 4[LB]
    STOREI (1) ; enregistrement de la taille de la nouvelle chaine dans son espace
    LOADL 0 ; indice de boucle en 5[LB]
    bouclesub
    LOAD (1) 3[LB]
    LOAD (1) 5[LB]
    SUBR INeg
    JUMPIF (0) finbouclesub
    LOAD (1) -3[LB]
    LOADL 1
    LOAD (1) 5[LB]
    LOAD (1) -2[LB]
    SUBR IAdd
    SUBR IAdd
    SUBR IAdd ; adresse du caractere à copier
    LOADI (1) ; caractere a copier
    LOAD (1) 4[LB]
    LOADL 1
    LOAD (1) 5[LB]
    SUBR IAdd
    SUBR IAdd ; adresse où copier le caractere
    STOREI (1) ; copie
    LOADL 1
    LOAD (1) 5[LB]
    SUBR IAdd
    STORE (1) 5[LB] ; incrément de l'indice de boucle
    JUMP bouclesub
    finbouclesub
    LOAD (1) 4[LB] ; on charge le résultat en sommet de pile
    RETURN (1) 3 ; dépile les trois paramètres et laisse en somme de pile la nouvelle adresse 

@��4 ����5 �>�@@@@��7 ����8 �>�@@��: ����; �>�@���@�����)getEntete��F ����G ���@��I ����J ���@@@��@@�������R ����S ���@@��U ����V ���@@@������!^��_ ����` ���@��b ����c ���@@@��@���+JUMP main

@��k ����l ���@@@��@������!^��w ����x ���@��z ����{ ���@@@��@����$pgcd��� ����� ���@��� ����� ���@@@��@������!^��� � �� � @��� � �� � @@@��@����$norm��� ����� ���@��� ����� ���@@@��@������!^��� �
�� �@��� �
�� �@@@��@����$rout��� � �� � @��� � �� � @@@��@������!^��� ��� �@��� ��� �@@@��@����$radd��� ��� �@��� ��� �@@@��@����$rmul��� ��� �@��� ��� �@@@@��� ��� �@@@@��� � �� �@@@@��� ����� �@@@@��� ����� �@@@@��� ����� �@@@��� ����� �A@@@��� ����� �@@��  ���� �@���@�����-ecrireFichier�� �7;� �7H@�� �7;� �7H@@@��@@���#nom�� �7I� �7L@�� �7I� �7L@@@��@@���%texte��$ �7M�% �7R@��' �7M�( �7R@@@��@�����$fich��2 �U[�3 �U_@��5 �U[�6 �U_@@@������(open_out��? �Ub�@ �Uj@��B �Ub�C �Uj@@@��@����#nom��L �Uk�M �Un@��O �Uk�P �Un@@@@��R �Ub�S �Un@@@@��U �UW�V �Un@@�  ������-output_string��a �rt�b �r�@��d �rt�e �r�@@@��@����$fich��n �r��o �r�@��q �r��r �r�@@@��@����%texte��{ �r��| �r�@��~ �r�� �r�@@@@��� �rt�� �r�@@@������)close_out��� ����� ���@��� ����� ���@@@��@����$fich��� ����� ���@��� ����� ���@@@@��� ����� ���@@@��� �rt�� ���@@@��� �UW�� ���@@@��� �7M�� ���A@@��� �7I�� ���A@@@��� �77�� ���@@��� �77�� ���@���@���������� ����� ���@@��� ����� ���@@@��������3Ppx_inline_test_lib'Runtime)unset_lib��� ����� ���@��� ����� ���@@@��@����@��� ����� ���@@@@��� ����� ���@@@@��� ����� ���@@��� ����� ���@���@��������� ����� ���@@��� ����� ���@@@��������5Expect_test_collector,Current_file%unset��� ����� ���@�� ���� ���@@@��@����"()�� ���� ���@@�� ���� ���@@@@�� ���� ���@@@@�� ���� ���@@�� ���� ���@@