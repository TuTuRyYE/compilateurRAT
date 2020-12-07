module PasseTypeRat : Passe.Passe with type t1 = Ast.AstTds.programme and type t2 = Ast.AstType.programme =
struct

  open Tds
  open Type
  open Exceptions
  open Ast
  open AstType

  type t1 = Ast.AstTds.programme
  type t2 = Ast.AstType.programme


  (* analyseType_expression : Rat.Ast.AstTds.expression -> Rat.Ast.AstType.expression * Rat.Type.typ *)
  (* Paramètre e : l'expression à analyser *)
  (* Vérifie le bon typage dans les expressions et renvoi le couple (AstExpression, type) *)
  (* Des exceptions seront levées en cass de mauvais typage *)
  let rec analyserType_expression e =
    match e with
    | AstTds.True -> (True, Bool)
    | AstTds.False -> (False, Bool)
    | AstTds.Entier i -> (Entier i, Int)
    | AstTds.Ident info ->
      (Ident(info), get_type_ast info)
    (* On vérifie bien que les numérateurs sont des int *)
    | AstTds.Numerateur e -> 
        let (ne, te) = analyserType_expression e in 
        if (est_compatible te Int) then
          (Numerateur ne, Int)
        else raise (Exceptions.TypeInattendu (te, Rat))
    (* Pareil pour les dénominateurs*)
    | AstTds.Denominateur e -> 
        let (ne, te) = analyserType_expression e in 
        if (est_compatible te Int) then
          raise(TypeInattendu(te, Rat))
          (*(Denominateur ne, Int)*)
        else 
          raise (TypeInattendu (te, Rat))
    (* Pour un rationnel, on vérifie le numérateur, et le dénominateur *)
    | AstTds.Rationnel (e1, e2) -> 
      let (n1, t1) = analyserType_expression e1 in
      let (n2, t2) = analyserType_expression e2 in
      if (est_compatible t1 Int && est_compatible t2 Int) then
       (Rationnel(n1, n2), Rat)
      (* Permet de cibler l'exception sur le bon argument *)
      else if not (est_compatible t1 Int) then
        raise (TypeInattendu (t1, Int))
      else if not (est_compatible t2 Int) then
        raise (TypeInattendu (t2, Int))
      else 
        failwith "Incohérence entre type d'un rationnel"
    (* Pour les fonctions, on vérifie les types des paramètres. 
    1- On analyse chaque paramètres, pour récupérer leur type dans nle
    2- On vérifie la correspondace avec la liste de types des paramètres type_param *)
    | AstTds.AppelFonction (info, le) -> 
    begin
      let type_param = get_type_fonction_param_ast info in
      let nle = List.map analyserType_expression le in
      let (lnle, ltype) = List.split nle in
      if (est_compatible_list type_param ltype) then
        ((AppelFonction(info, lnle), get_type_ast info))
      else
        raise (TypesParametresInattendus (ltype,type_param))
      end
    (* Pour les opérations binaires, on vérifie chaque cas d'opérations. *)
    | AstTds.Binaire (op, e1, e2) -> 
    begin
        let(n1, t1) = analyserType_expression e1 in
        let(n2, t2) = analyserType_expression e2 in
        begin 
          match t1, op, t2 with
          | Int, Plus, Int -> (Binaire(PlusInt, n1, n2) , Int)
          | Rat, Plus, Rat -> (Binaire(PlusRat, n1, n2) , Rat)
          | Int, Mult, Int -> (Binaire(MultInt, n1, n2) , Int)
          | Rat, Mult, Rat -> (Binaire(MultRat, n1, n2) , Int)
          | Int, Equ, Int -> (Binaire(EquInt, n1, n2) , Bool)
          | Bool, Equ, Bool -> (Binaire(EquBool, n1, n2) , Bool)
          | Int, Inf, Int -> (Binaire(Inf, n1, n2) , Bool)
          | _ -> raise(TypeBinaireInattendu(op, t1, t2))
        end
      end 

  (* analyseType_instruction : Rat.Ast.AstTds.instuction -> Rat.Ast.AstType.Instruction *)
  (* Paramètre i : l'instruction à analyser *)
  (* Vérifie le bon typage dans les instructions cette fois, renvoyant le bon AstType.Instruction si bon usage,
  lève une excpetion sinon *)
  let rec analyserType_instructions i = 
    match i with 
    (* On vérifie si le type de la déclaration correspond au type de l'expression *)
    | AstTds.Declaration (t, e, info) ->

       (* let(ne, te) = analyserType_expression e in *)
       let (ne,te) = analyserType_expression e in

       if (est_compatible t te) then 
         begin

           modifier_type_info t info ;
           Declaration(ne, info)
         end
       else
          raise (Exceptions.TypeInattendu(te, t))

    (* On vérifie que l'info affectée est compatible avec l'expression *)
    | AstTds.Affectation (e, info) -> 
        let(ne, te) = analyserType_expression e in
        let t = get_type_ast info in
        if est_compatible te t then
          Affectation(ne, info)
        else  raise(TypeInattendu(te, t))
    (* On utilise un affichage différent en fonction du type de l'expression *)
    | AstTds.Affichage e -> 
        let(ne, te) = analyserType_expression e in 
        begin
        match te with 
        | Int -> AffichageInt ne
        | Rat -> AffichageRat ne
        | Bool -> AffichageBool ne
        | Undefined -> raise(TypeInattendu(Undefined, te))
        end
    (* On analyse l'expression de condition, puis les bloc bt et be *)
    | AstTds.Conditionnelle(e, bt, be) -> 
        let(ne, te) = analyserType_expression e in 
        if est_compatible te Bool then
          let nbt = analyserType_bloc bt in 
            let nbe = analyserType_bloc be in
            Conditionnelle(ne, nbt, nbe)
        else raise (TypeInattendu(Bool, te))
    (* Analyse de l'expression, puis du bloc *)
    | AstTds.TantQue(e, b) -> 
        let(ne, te) = analyserType_expression e in
        if (est_compatible te Bool) then 
          let nb = analyserType_bloc b in 
          TantQue(ne, nb)
        else raise (TypeInattendu(Bool, te))
      (* Pour gérer tous les cas et enlever les warning *)
     | AstTds.Empty ->
       Empty

  (* Permet d'analyser les blocs d'instructions *)
  and analyserType_bloc bloc =
    let nli = List.map analyserType_instructions bloc in
    nli

  (* analyserType_fonction : AstTds.fonction -> AstType.fonction *)
  (* Paramètre : la fonction à analyser *)
  (* Ajoute dans l'info le type de la fonction et de ses paramètres,
  on analyse ensuite le typage de la liste d'instructions, puis l'expression de retour *)
  (* Erreur si mauvaise utilisation des types *)
  let analyseType_fonction (AstTds.Fonction(typ, infoFun_ast, infoListArgs, li, e)) = 
  let (ltyp, linfo_ast) = List.split infoListArgs in
  (* On modifie infoFun en du type de la fonction *)
  modifier_type_fonction_info typ ltyp infoFun_ast;
  List.iter (fun (typ,info) -> modifier_type_info typ info) infoListArgs;
  (* Analyse des instructions *)
  let nli = List.map analyserType_instructions li in
  (* Analyse de l'expression de retour *)
  let (ne,te) = analyserType_expression e in
  (* Vérification de la cohérence type fonction-expresion de retour *)
    if est_compatible typ te then
      Fonction(infoFun_ast, linfo_ast, nli, ne)
    else
      raise (TypeInattendu(te,typ))


  let analyser (AstTds.Programme(fonctions,bloc)) = 
    let nfct= List.map analyseType_fonction fonctions in
    let nbloc = analyserType_bloc bloc in
    Programme(nfct, nbloc)
    (* print_programme Programme(nfct, nbloc) *)
  end